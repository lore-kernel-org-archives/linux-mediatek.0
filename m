From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/8] drivers/pinctrl: make mediatek/pinctrl-mt6397 driver
 explicitly non-modular
Date: Wed, 9 Mar 2016 10:01:36 +0700
Message-ID: <CACRpkdYFyPR9zATN2c-BhNQc55TC6zBKryye_-KGwoB+CEfVSA@mail.gmail.com>
References: <1456778924-20730-1-git-send-email-paul.gortmaker@windriver.com>
	<1456778924-20730-3-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1456778924-20730-3-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

On Tue, Mar 1, 2016 at 3:48 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig for this driver is currently:
>
> config PINCTRL_MT6397
>         bool "Mediatek MT6397 pin control" if COMPILE_TEST && !MFD_MT6397
>
> ...meaning that it is currently not being built as a module by anyone.
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
>
> Since module_init translates to device_initcall in the non-modular
> case, the init ordering remains unchanged with this commit.
>
> We also delete the MODULE_LICENSE tag etc. since all that information
> is already contained at the top of the file in the comments.
>
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Hongzhou Yang <hongzhou.yang@mediatek.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-mediatek@lists.infradead.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied with Honzhou's ACK.

Yours,
Linus Walleij
