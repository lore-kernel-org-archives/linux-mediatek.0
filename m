From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] soc: mediatek: pwrap: Zero initialize rdata in pwrap_init_cipher
Date: Fri, 22 Mar 2019 15:22:38 +0100
Message-ID: <CAK8P3a1qw4qMjvF-=0=9tJz_HmWYamS6TDDSPSMz_-XHrevwVA@mail.gmail.com>
References: <20190307225650.23001-1-natechancellor@gmail.com> <CAKwvOd=Exr0y_3m9aJJEjPbFcWvLPjO6EtKHsXvymAU=WdQHtQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKwvOd=Exr0y_3m9aJJEjPbFcWvLPjO6EtKHsXvymAU=WdQHtQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <natechancellor@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, clang-built-linux@googlegroups.com
List-Id: linux-mediatek@lists.infradead.org

On Fri, Mar 8, 2019 at 1:18 AM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> On Thu, Mar 7, 2019 at 2:57 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > When building with -Wsometimes-uninitialized, Clang warns:
> >
> > drivers/soc/mediatek/mtk-pmic-wrap.c:1358:6: error: variable 'rdata' is
> > used uninitialized whenever '||' condition is true
> > [-Werror,-Wsometimes-uninitialized]
> >
> > If pwrap_write returns non-zero, pwrap_read will not be called to
> > initialize rdata, meaning that we will use some random uninitialized
> > stack value in our print statement. Zero initialize rdata in case this
> > happens.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/401
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > ---
> >
> > I don't know if this is better or to just restructure the if statement
> > below (I'm not an expert in this code so I'll leave that up to the
> > maintainers to decide).
>
> No, I the way you have it here is most correct.  That condition writes
> a value somewhere, reads it back, then compares it.  The write or read
> could fail.  Better to just initialize rdata in case the write fails.
> Thanks for the patch.
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

I also came up with a similar patch here, but I move the initialization
to just before the first use of the variable:

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c
b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 8236a6c87e19..eb5035fd8ecd 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -1355,6 +1355,7 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
        pwrap_writel(wrp, 1, PWRAP_CIPHER_MODE);

        /* Write Test */
+       rdata = 0;
        if (pwrap_write(wrp, wrp->slave->dew_regs[PWRAP_DEW_WRITE_TEST],
                        PWRAP_DEW_WRITE_TEST_VAL) ||
            pwrap_read(wrp, wrp->slave->dew_regs[PWRAP_DEW_WRITE_TEST],

Very little difference, so let's go with your patch

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
