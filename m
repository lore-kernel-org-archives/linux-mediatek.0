From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH V2 2/2] regulator: mt6323: Add support for MT6323 regulator
Date: Mon, 25 Jan 2016 09:11:39 -0300
Message-ID: <CABxcv=kWnUwpCo=JJbnPAARRM226YfBJw_6yF7MiE8-7iqBD+Q@mail.gmail.com>
References: <1453718405-40815-1-git-send-email-blogic@openwrt.org>
	<1453718405-40815-2-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453718405-40815-2-git-send-email-blogic@openwrt.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Crispin <blogic@openwrt.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Steven Liu <steven.liu@mediatek.com>, Linux Kernel <linux-kernel@vger.kernel.org>, Henry Chen <henryc.chen@mediatek.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

Hello,

On Mon, Jan 25, 2016 at 7:40 AM, John Crispin <blogic@openwrt.org> wrote:
> From: Chen Zhong <chen.zhong@mediatek.com>

[snip]

> +}
> +
> +static struct platform_driver mt6323_regulator_driver = {
> +       .driver = {
> +               .name = "mt6323-regulator",
> +       },
> +       .probe = mt6323_regulator_probe,
> +};
> +

You don't have a .of_match table but according the DT bindings, the
compatible string "mediatek,mt6323-regulator" should be used so there
should be a OF match table or the vendor prefix of the compatible
string won't be used for matching (i.e: fallbacks to the driver .name
for match).

> +module_platform_driver(mt6323_regulator_driver);
> +
> +MODULE_AUTHOR("Chen Zhong <chen.zhong@mediatek.com>");
> +MODULE_DESCRIPTION("Regulator Driver for MediaTek MT6397 PMIC");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:mt6323-regulator");

This alias should not be needed if you provide a OF match table and a
MODULE_DEVICE_TABLE(of, foo);

Best regards,
Javier
