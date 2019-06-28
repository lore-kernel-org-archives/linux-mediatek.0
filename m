From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v3 0/4] Compile-test UAPI and kernel headers
Date: Fri, 28 Jun 2019 13:57:12 +0900
Message-ID: <CAK7LNARj+A1JDnUmA_ZFC5Shsy7Tg37LtXS27H7ZTgDbp5BO2w@mail.gmail.com>
References: <20190627163903.28398-1-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190627163903.28398-1-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Song Liu <songliubraving@fb.com>, Jakub Kicinski <jakub.kicinski@netronome.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Palmer Dabbelt <palmer@sifive.com>, Alexei Starovoitov <ast@kernel.org>, linux-riscv@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>, Kees Cook <keescook@chromium.org>, xdp-newbies@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>, Anton Vorontsov <anton@enomsg.org>, John Fastabend <john.fastabend@gmail.com>, Yonghong Song <yhs@fb.com>, Albert Ou <aou@eecs.berkeley.edu>, Jesper Dangaard Brouer <hawk@kernel.org>, Jani Nikula <jani.nikula@intel.com>, Michal Marek <michal.lkml@markovi.net>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Matth
List-Id: linux-mediatek@lists.infradead.org

On Fri, Jun 28, 2019 at 1:41 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> 1/4: Compile-test exported headers (reworked in v2)
>
> 2/4: fix a flaw I noticed when I was working on this series.
>      Avoid generating intermediate wrappers.
>
> 3/4: maybe useful for 4/4 and in some other places.
>      Add header-test-pattern-y syntax.
>
> 4/4: Compile-test kernel-space headers in include/.
>      v2: compile as many headers as possible.
>      v3: exclude more headers causing build errors


I push this series to
 git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
 header-test-v3
for somebody who wants to test it.



>
> Masahiro Yamada (4):
>   kbuild: compile-test UAPI headers to ensure they are self-contained
>   kbuild: do not create wrappers for header-test-y
>   kbuild: support header-test-pattern-y
>   kbuild: compile-test kernel headers to ensure they are self-contained
>
>  .gitignore                         |    1 -
>  Documentation/dontdiff             |    1 -
>  Documentation/kbuild/makefiles.txt |   13 +-
>  Makefile                           |    4 +-
>  include/Kbuild                     | 1250 ++++++++++++++++++++++++++++
>  init/Kconfig                       |   22 +
>  scripts/Makefile.build             |   10 +-
>  scripts/Makefile.lib               |   13 +-
>  scripts/cc-system-headers.sh       |    8 +
>  usr/.gitignore                     |    1 -
>  usr/Makefile                       |    2 +
>  usr/include/.gitignore             |    3 +
>  usr/include/Makefile               |  134 +++
>  13 files changed, 1449 insertions(+), 13 deletions(-)
>  create mode 100644 include/Kbuild
>  create mode 100755 scripts/cc-system-headers.sh
>  create mode 100644 usr/include/.gitignore
>  create mode 100644 usr/include/Makefile
>
> --
> 2.17.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel



--
Best Regards
Masahiro Yamada
