package _06_richstrings

import com.google.common.base.Splitter
import java.util.Map
import org.junit.Test

import static junit.framework.Assert.*

import static extension java.lang.Long.*
class RichStringToData {

	Map<Long,Long> replaceMap='''
		123 234
		9348 23259
	'''.toString.toLongLongMap
	/* ... and why should this be useful
	 * Think of a pdf file with a 5 pages table of such replacements.
	 * With this approach the implementation is nothing but copying the table 
	 * into the rich string.
	 *
	 * You may also want to look at https://github.com/svenefftinge/jsonized
	 */

	def toLongLongMap(String lines){
		newImmutableMap(
			Splitter.on("\n").split(lines.trim).map[toLongLongPair]
		)
	}

	def toLongLongPair(String line){
		val split=Splitter.on(" ").split(line)
		split.head.parseLong->split.last.parseLong
	}

	@Test
	def void testEntries(){
		assertEquals(2,replaceMap.size)
		assertEquals(234L, replaceMap.get(123L))
		assertEquals(23259, replaceMap.get(9348L))
		assertNull(replaceMap.get(15L))
	}
}