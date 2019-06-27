From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v3 0/4] Compile-test UAPI and kernel headers
Date: Fri, 28 Jun 2019 01:38:58 +0900
Message-ID: <20190627163903.28398-1-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kbuild@vger.kernel.org
Cc: Song Liu <songliubraving@fb.com>, Jakub Kicinski <jakub.kicinski@netronome.com>, linux-doc@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, Alexei Starovoitov <ast@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-riscv@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>, Kees Cook <keescook@chromium.org>, xdp-newbies@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>, Anton Vorontsov <anton@enomsg.org>, John Fastabend <john.fastabend@gmail.com>, Yonghong Song <yhs@fb.com>, Albert Ou <aou@eecs.berkeley.edu>, Jesper Dangaard Brouer <hawk@kernel.org>, Jani Nikula <jani.nikula@intel.com>, Michal Marek <michal.lkml@markovi.net>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>, netdev@vger.kernel.org, linux-kernel@v
List-Id: linux-mediatek@lists.infradead.org

1/4: Compile-test exported headers (reworked in v2)

2/4: fix a flaw I noticed when I was working on this series.
     Avoid generating intermediate wrappers.

3/4: maybe useful for 4/4 and in some other places.
     Add header-test-pattern-y syntax.

4/4: Compile-test kernel-space headers in include/.
     v2: compile as many headers as possible.
     v3: exclude more headers causing build errors


Masahiro Yamada (4):
  kbuild: compile-test UAPI headers to ensure they are self-contained
  kbuild: do not create wrappers for header-test-y
  kbuild: support header-test-pattern-y
  kbuild: compile-test kernel headers to ensure they are self-contained

 .gitignore                         |    1 -
 Documentation/dontdiff             |    1 -
 Documentation/kbuild/makefiles.txt |   13 +-
 Makefile                           |    4 +-
 include/Kbuild                     | 1250 ++++++++++++++++++++++++++++
 init/Kconfig                       |   22 +
 scripts/Makefile.build             |   10 +-
 scripts/Makefile.lib               |   13 +-
 scripts/cc-system-headers.sh       |    8 +
 usr/.gitignore                     |    1 -
 usr/Makefile                       |    2 +
 usr/include/.gitignore             |    3 +
 usr/include/Makefile               |  134 +++
 13 files changed, 1449 insertions(+), 13 deletions(-)
 create mode 100644 include/Kbuild
 create mode 100755 scripts/cc-system-headers.sh
 create mode 100644 usr/include/.gitignore
 create mode 100644 usr/include/Makefile

-- 
2.17.1
