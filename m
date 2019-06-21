From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] kbuild: compile-test global headers to ensure they are
 self-contained
Date: Fri, 21 Jun 2019 19:51:34 +0200
Message-ID: <20190621175134.GB16409@ravnborg.org>
References: <20190621163931.19397-1-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190621163931.19397-1-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Hi Masahiro.

On Sat, Jun 22, 2019 at 01:39:31AM +0900, Masahiro Yamada wrote:
> Make as many headers self-contained as possible so that they can be
> included without relying on a specific include order.
It is very nice finally to get some infrastructure to validate header
files.

But to avoid too many conflicts while including more and more headers
that are selfcontained we really need something that is more
distributed.
So for example all header files in include/drm/* could be in one
Makefile, incl. sub-directories, but the same Makefile would not include
the files in include/soc/

If you just show how ot do it, others can follow-up with the
relevant directories.

	Sam
