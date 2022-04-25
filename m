Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9842BC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 10:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SpqC+9x4ZCZskAlvdW4J/4bomJBXaPxGQyc646s7BRU=; b=X1C7fE0Fk6tpU9
	y2py4wSiJlqM7f6kNSNPFpc1RPewGVvf3SWI7nBIxLLXK5M0cq5yKmqNce9ps8KrN6gIkw/l7u7DI
	bLwSu4/Zb/sxbsZvJ5r0ETPUnB/QKqLWnnU5k/xDB3wJTM0QRerv0Rd2f4i+C2JVQDsGPyuEu2AX/
	6NkOOlP1EsoYqAJ2gEOJksfBad3/UUDfQvPkN5t1JYZawqOTjSEsfuIIAzdZ0pOPlmVeyYgt01dBY
	4Ue23U21mDTMWfoDIeUdhckd7WTZmPs4eAh05QwT0QFWJjkqrC82x8MFP2CxJcTVSm6pppPFG9siy
	39zRDmEaAG0QpiOZVqPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nivWY-0092V3-PB; Mon, 25 Apr 2022 10:00:54 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nivWH-0092OX-Gq
 for linux-mediatek@lists.infradead.org; Mon, 25 Apr 2022 10:00:38 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1nivVw-0001AZ-Kr; Mon, 25 Apr 2022 12:00:16 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1nivVv-0057YD-Bh; Mon, 25 Apr 2022 12:00:13 +0200
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1nivVt-0005AB-9C; Mon, 25 Apr 2022 12:00:13 +0200
Message-ID: <0e642da615b8f52fb36cd1248f8a124ea4e4b7b8.camel@pengutronix.de>
Subject: Re: [PATCH v17 14/21] drm/mediatek: add ETHDR support for MT8195
From: Philipp Zabel <p.zabel@pengutronix.de>
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, wim@linux-watchdog.org,  AngeloGioacchino Del
 Regno <angelogioacchino.delregno@collabora.com>, linux@roeck-us.net
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,  dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, singo.chang@mediatek.com, 
 srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Mon, 25 Apr 2022 12:00:13 +0200
In-Reply-To: <20220416020749.29010-15-nancy.lin@mediatek.com>
References: <20220416020749.29010-1-nancy.lin@mediatek.com>
 <20220416020749.29010-15-nancy.lin@mediatek.com>
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_030037_657463_AC53A85B 
X-CRM114-Status: GOOD (  15.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sa, 2022-04-16 at 10:07 +0800, Nancy.Lin wrote:
> ETHDR is a part of ovl_adaptor.
> ETHDR is designed for HDR video and graphics conversion in the external
> display path. It handles multiple HDR input types and performs tone
> mapping, color space/color format conversion, and then combine
> different layers, output the required HDR or SDR signal to the
> subsequent display path.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
[...]
> +static int mtk_ethdr_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mtk_ethdr *priv;
> +	int ret;
> +	int i;
> +
> +	dev_info(dev, "%s+\n", __func__);

Left-over debug statements?

> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < ETHDR_ID_MAX; i++) {
> +		priv->ethdr_comp[i].dev = dev;
> +		priv->ethdr_comp[i].regs = of_iomap(dev->of_node, i);
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +		ret = cmdq_dev_get_client_reg(dev,
> +					      &priv->ethdr_comp[i].cmdq_base, i);
> +		if (ret)
> +			dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
> +#endif
> +		dev_dbg(dev, "[DRM]regs:0x%p, node:%d\n", priv->ethdr_comp[i].regs, i);
> +	}
> +
> +	for (i = 0; i < ETHDR_CLK_NUM; i++)
> +		priv->ethdr_clk[i].id = ethdr_clk_str[i];
> +	ret = devm_clk_bulk_get_optional(dev, ETHDR_CLK_NUM, priv->ethdr_clk);
> +	if (ret)
> +		return ret;
> +
> +	priv->irq = platform_get_irq(pdev, 0);
> +	if (priv->irq < 0)
> +		priv->irq = 0;
> +
> +	if (priv->irq) {
> +		ret = devm_request_irq(dev, priv->irq, mtk_ethdr_irq_handler,
> +				       IRQF_TRIGGER_NONE, dev_name(dev), priv);
> +		if (ret < 0) {
> +			dev_err(dev, "Failed to request irq %d: %d\n", priv->irq, ret);
> +			return ret;
> +		}
> +	}
> +
> +	priv->reset_ctl = devm_reset_control_array_get_optional_exclusive(dev);

This is missing error handling. You could use dev_err_probe() here.

regards
Philipp

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
