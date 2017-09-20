From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 0/5] nvmem: some cleanups and sparse warning fixes
Date: Wed, 20 Sep 2017 19:02:24 +0900
Message-ID: <CAK7LNAQHoDN=SOLA6AxyeCOUObRwy6nJHizo6xoDEX1gybvqNg@mail.gmail.com>
References: <1505134864-11975-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1505134864-11975-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Keiji Hayashibara <hayashibara.keiji@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Heiko Stuebner <heiko@sntech.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Joachim Eastwood <manabian@gmail.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Carlo Caione <carlo@caione.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Srinivas,


2017-09-11 22:00 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
>
> Socionext is trying to add a new nvmem driver.
>
> Before adding a new one, I'd like to be sure about the preferred
> coding style in this subsystem, and build-up cleaner code base.
>
> Please pick up what you like.  Please feel free to throw away
> what you do not like.
>
> 1/5, 2/5: convert kzalloc to stack because nvmem_config
> is small one-time use data.
> This is what we agreed in the discussion.
>
> 3/5, 4/5: fix sparse warning
> For mtk-efuse, qfprom, the base address is the only private data
> but, assigning (void __iomem *) to ->priv directly causes sparse
> warnings.
>
> 5/5: clean-up of owner settings - if the owner field matches
> nvmem->dev->driver->onwer, we need not set the onwer field
> explicitly.


Does this series look OK?

Thanks.




-- 
Best Regards
Masahiro Yamada
