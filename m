Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1061BC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 08:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W5M7LNNGfUV9oLgQcoCx7d7pLhgT+SCjKGpbcL1kQ48=; b=G2QaGklTXW/RGz
	MCgaBk93IlSsMj7dTJxgEO3/V0vLTZPEs7wFVp3m/XlJJV40G0unh6jKAzDXABOnGJbJEva75G1Y6
	efXVMZhqb4m1UUEmkmYSvMzj5oLIgvLAMA2lGbpyUs5wpqWuswpVngn7bFlkmFQlc36oWvJiKDeXq
	DA/qviDptKCi+uqggfHzM4qUPXGrpS/0NL3VOSyTJ1BMydCrQXn+Jl2Sp8GUlLW0ELGp44qpa4wbQ
	h33PkFjCLmLMk42HxRc4ALdkPmAteIL90ggG6YdF2Ho9z3m9Zp8OHlN+PRylfvx1XO7jyBNf/18LX
	DkX6aw4ucyuNBAFjQLpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYkcH-007ntr-O9; Mon, 28 Mar 2022 08:20:45 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYkc5-007nor-K2; Mon, 28 Mar 2022 08:20:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id F14481F430ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648455632;
 bh=HTtoc9TVDdHP3psxCeqfPiDHAPdGIinJmaM31VEeTWA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LK9UqtwE81DgNYCKdeZZSDBq8fnjasY1InKFW0p49+nBg8VyvJfeLlFKWGwRdgqPo
 gyTdxQ35jwwf7Ryf6Rr0ypstopk2UMgRSm2gmEoAnFA+f0WngNhF7a476V+LAjiD62
 zxvdd2bmsi8g9kzd5JMwGAnRCWuLfwdA2GtTm29zEEwoQTjeXwzx9A8h7jWYIFz8Pj
 SvkLU3Z1og09N2W48A8GopEhM2Rnn114Sb7SL/BV5C8ePDGNuX0n0GLwPBnCpsErsn
 Nu9rXZmI02pbclGO4yfen05p65bbMarAM1Suxf00H0K/0u01Iv3g5irKmIkK2C8rwV
 2Fh1x5iNAJ3dg==
Message-ID: <4697e3af-86f7-83e0-1737-3f5000fc8d30@collabora.com>
Date: Mon, 28 Mar 2022 10:20:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v9 17/22] phy: phy-mtk-dp: Add driver for DP phy
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, airlied@linux.ie,
 chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org, ck.hu@mediatek.com,
 daniel@ffwll.ch, deller@gmx.de, jitao.shi@mediatek.com, kishon@ti.com,
 krzk+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 matthias.bgg@gmail.com, mripard@kernel.org, p.zabel@pengutronix.de,
 robh+dt@kernel.org, tzimmermann@suse.de, vkoul@kernel.org
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, markyacoub@google.com,
 Markus Schneider-Pargmann <msp@baylibre.com>
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-18-granquet@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220327223927.20848-18-granquet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_012033_824803_1D930AEA 
X-CRM114-Status: GOOD (  28.54  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 28/03/22 00:39, Guillaume Ranquet ha scritto:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This is a new driver that supports the integrated DisplayPort phy for
> mediatek SoCs, especially the mt8195. The phy is integrated into the
> DisplayPort controller and will be created by the mtk-dp driver. This
> driver expects a struct regmap to be able to work on the same registers
> as the DisplayPort controller. It sets the device data to be the struct
> phy so that the DisplayPort controller can easily work with it.
> 
> The driver does not have any devicetree bindings because the datasheet
> does not list the controller and the phy as distinct units.
> 
> The interaction with the controller can be covered by the configure
> callback of the phy framework and its displayport parameters.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>   MAINTAINERS                       |   1 +
>   drivers/phy/mediatek/Kconfig      |   8 ++
>   drivers/phy/mediatek/Makefile     |   1 +
>   drivers/phy/mediatek/phy-mtk-dp.c | 201 ++++++++++++++++++++++++++++++
>   4 files changed, 211 insertions(+)
>   create mode 100644 drivers/phy/mediatek/phy-mtk-dp.c
> 

..snip..

> diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
> new file mode 100644
> index 000000000000..e5c5494f3636
> --- /dev/null
> +++ b/drivers/phy/mediatek/phy-mtk-dp.c

..snip..

> +
> +static int mtk_dp_phy_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mtk_dp_phy *dp_phy;
> +	struct phy *phy;
> +	struct regmap *regs;
> +
> +	regs = syscon_regmap_lookup_by_phandle(dev->of_node, "mediatek,dp-syscon");
> +

Please drop this blank line

> +	if (IS_ERR(regs))
> +		return PTR_ERR(regs);
> +
> +	dp_phy = devm_kzalloc(dev, sizeof(*dp_phy), GFP_KERNEL);
> +	if (!dp_phy)
> +		return -ENOMEM;
> +
> +	dp_phy->regs = regs;
> +
> +	phy = devm_phy_create(dev, NULL, &mtk_dp_phy_dev_ops);
> +

Same here

> +	if (IS_ERR(phy))
> +		return dev_err_probe(dev, PTR_ERR(phy), "Failed to create DP PHY: %ld\n", PTR_ERR(phy));
> +

Using dev_err_probe automates printing the error, so the correct usage is:

return dev_err_probe(dev, PTR_ERR(phy), "Failed to create DP PHY\n");

> +	phy_set_drvdata(phy, dp_phy);
> +
> +	return 0;
> +}
> +
> +struct platform_driver mtk_dp_phy_driver = {
> +	.probe = mtk_dp_phy_probe,
> +	.driver = {
> +		.name = "mediatek-dp-phy",
> +	},
> +};
> +module_platform_driver(mtk_dp_phy_driver);

Also, in your dt-binding, you mention a compatible for this driver, but I don't see
any, here. This means that you do know what to do, so please do it.

Regards,
Angelo

> +
> +MODULE_AUTHOR("Markus Schneider-Pargmann <msp@baylibre.com>");
> +MODULE_DESCRIPTION("MediaTek DP PHY Driver");
> +MODULE_LICENSE("GPL");


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
