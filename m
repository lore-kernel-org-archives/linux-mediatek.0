From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/7] Compile-test UAPI and kernel headers
Date: Mon,  1 Jul 2019 09:58:38 +0900
Message-ID: <20190701005845.12475-1-yamada.masahiro@socionext.com>
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
Cc: Song Liu <songliubraving@fb.com>, Jakub Kicinski <jakub.kicinski@netronome.com>, linux-doc@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, Alexei Starovoitov <ast@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Joel Fernandes <joel@joelfernandes.org>, linux-riscv@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>, Kees Cook <keescook@chromium.org>, xdp-newbies@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>, Anton Vorontsov <anton@enomsg.org>, John Fastabend <john.fastabend@gmail.com>, Yonghong Song <yhs@fb.com>, Albert Ou <aou@eecs.berkeley.edu>, Jesper Dangaard Brouer <hawk@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>, netdev@vger.kernel.org, linux-kern
List-Id: linux-mediatek@lists.infradead.org


1/7: add CONFIG_CC_CAN_LINK to use it in 2/7

2/7: Compile-test exported headers

3/7: Do not generate intermediate wrappers.
     This will avoid header search path issue.

4/7: maybe useful for 7/7 and in some other places.
     Add header-test-pattern-y syntax.

5/7: Minor cleanup of gen_kheaders.sh

6/7: Exclude all files without ".h" extension
     from the kheaders_data.tar.xz
     This will be needed by 7/7 because we need to
     exclude "*.h.s" from the archive

7/7: Compile-test kernel-space headers in include/.


Masahiro Yamada (7):
  init/Kconfig: add CONFIG_CC_CAN_LINK
  kbuild: compile-test exported headers to ensure they are
    self-contained
  kbuild: do not create wrappers for header-test-y
  kbuild: support header-test-pattern-y
  kheaders: remove meaningless -R option of 'ls'
  kheaders: include only headers into kheaders_data.tar.xz
  kbuild: compile-test kernel headers to ensure they are self-contained

 .gitignore                         |    1 -
 Documentation/dontdiff             |    1 -
 Documentation/kbuild/makefiles.txt |   13 +-
 Makefile                           |    4 +-
 include/Kbuild                     | 1253 ++++++++++++++++++++++++++++
 init/Kconfig                       |   24 +
 kernel/gen_kheaders.sh             |   51 +-
 net/bpfilter/Kconfig               |    2 +-
 scripts/Makefile.build             |   10 +-
 scripts/Makefile.lib               |   13 +-
 usr/.gitignore                     |    1 -
 usr/Makefile                       |    2 +
 usr/include/.gitignore             |    3 +
 usr/include/Makefile               |  131 +++
 14 files changed, 1462 insertions(+), 47 deletions(-)
 create mode 100644 include/Kbuild
 create mode 100644 usr/include/.gitignore
 create mode 100644 usr/include/Makefile

-- 
2.17.1
