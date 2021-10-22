Return-Path: <SRS0=WF8g=PK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B58AC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 10:31:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 090FD61205
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 10:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 090FD61205
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=27CCUq4CtEGgQTGJtH6H2zxSPjlVZJAL0HEGB+NBVN0=; b=0D43AlttdjTfGo
	wZFJA9S3Byx4ngjeWtrhxAbRsBxliN7mPT01fHGTLY9EhJqqiHf6lrHUHOG6p2CFLVEiafADERMgB
	BmlrcW9Vz1208uPT5UK+bMvmT/XOpeVwpDi28RRd/4rqHhWtr13nRXJZILyX1au/4ZlD7cuxdQX/p
	abH7G+nQcyPlHPgao3BD2aUna5QdUYCyLovvSqS0YWGHeULApcauR6ljvCB9fimCdtk1vHFxtCyHW
	T6V3GJafSHqht4SXtARrfsFSzmYlcoZWWddonx3PSX/O+Tmf/hOYBwVBeJybnkcMW+98PPm8hfjX/
	nPg625Jbz6beHVpaB4IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdrpF-00AWJe-SD; Fri, 22 Oct 2021 10:31:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdrp2-00AWGv-QR; Fri, 22 Oct 2021 10:30:50 +0000
X-UUID: e8a7c341987a40b0b6f94e7dc9037b79-20211022
X-UUID: e8a7c341987a40b0b6f94e7dc9037b79-20211022
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 948093020; Fri, 22 Oct 2021 03:30:39 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Oct 2021 03:30:37 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Oct 2021 18:30:36 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Oct 2021 18:30:36 +0800
Message-ID: <c15cc3f5e507e03c15be14c929430ce5bf313139.camel@mediatek.com>
Subject: Re: [PATCH v11 15/16] drm/mediatek: add MERGE support for mediatek-drm
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>
CC: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <hsinyi@chromium.org>, <fshao@chromium.org>, <moudy.ho@mediatek.com>,
 <roy-cw.yeh@mediatek.com>, Fabien Parent <fparent@baylibre.com>, "Yongqiang
 Niu" <yongqiang.niu@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Date: Fri, 22 Oct 2021 18:30:36 +0800
In-Reply-To: <3e72dd1e-edf2-6d42-40e7-0c1c72749a20@collabora.com>
References: <20210921155218.10387-1-jason-jh.lin@mediatek.com>
 <20210921155218.10387-16-jason-jh.lin@mediatek.com>
 <3e72dd1e-edf2-6d42-40e7-0c1c72749a20@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_033048_910733_37866C17 
X-CRM114-Status: GOOD (  31.24  )
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

Hi Angelo,

thanks for the review.

On Thu, 2021-10-14 at 16:27 +0200, AngeloGioacchino Del Regno wrote:
> Il 21/09/21 17:52, jason-jh.lin ha scritto:
> > Add MERGE engine file:

[snip]

> > +int mtk_merge_clk_enable(struct device *dev)
> > +{
> > +	int ret = 0;
> > +	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
> > +
> > +	ret = clk_prepare_enable(priv->clk);
> > +	if (ret)
> > +		pr_err("merge clk prepare enable failed\n");
> 
> If you failed to enable this clock, I take it as the hardware won't
> work or
> won't work as expected, hence you should return a failure before
> trying to
> call prepare_enable for async_clk.
> 
OK I'll fix it.

> > +	ret = clk_prepare_enable(priv->async_clk);
> > +	if (ret)
> > +		pr_err("async clk prepare enable failed\n");
> > +
> 
> You should also return a failure here but, before that, you should
> clean up
> the state by calling clk_disable_unprepare(priv->clk), or you will
> leave it
> enabled, eventually getting a hardware fault later on (which may or
> may not
> result in a board reboot), or other sorts of unexpected states.
> 
> At least, you will get issues with the refcount for "clk" and/or
> "async_clk".
> 
> Please fix that.
> 
> Also, please use dev_err or, more appropriately, DRM_ERROR instead or
> pr_err.
> 

OK I'll fix it .

> > +	return ret;
> > +}
> > +
> > +void mtk_merge_clk_disable(struct device *dev)
> > +{
> > +	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
> > +
> > +	clk_disable_unprepare(priv->async_clk); > +	clk_disable_unprepa
> > re(priv->clk);
> > +}
> > +
> > +static int mtk_disp_merge_bind(struct device *dev, struct device
> > *master,
> > +			       void *data)
> > +{
> > +	return 0;
> > +}
> > +
> > +static void mtk_disp_merge_unbind(struct device *dev, struct
> > device *master,
> > +				  void *data)
> > +{
> > +}
> > +
> > +static const struct component_ops mtk_disp_merge_component_ops = {
> > +	.bind	= mtk_disp_merge_bind,
> > +	.unbind = mtk_disp_merge_unbind,
> > +};
> > +
> > +static int mtk_disp_merge_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct resource *res;
> > +	struct mtk_disp_merge *priv;
> > +	int ret;
> > +
> > +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +	if (!priv)
> > +		return -ENOMEM;
> > +
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	priv->regs = devm_ioremap_resource(dev, res);
> > +	if (IS_ERR(priv->regs)) {
> > +		dev_err(dev, "failed to ioremap merge\n");
> > +		return PTR_ERR(priv->regs);
> > +	}
> > +
> > +	priv->clk = devm_clk_get(dev, NULL);
> > +	if (IS_ERR(priv->clk)) {
> > +		dev_err(dev, "failed to get merge clk\n");
> > +		return PTR_ERR(priv->clk);
> > +	}
> > +
> > +	priv->async_clk = of_clk_get(dev->of_node, 1);
> > +	if (IS_ERR(priv->async_clk)) {
> > +		ret = PTR_ERR(priv->async_clk);
> > +		dev_dbg(dev, "No merge async clock: %d\n", ret);
> > +		priv->async_clk = NULL;
> > +	}
> > +
> 
> You are using devm_clk_get for the first clock, of_clk_get for the
> second one:
> what's the reason for that?
> 
> Also, async_clk seems to be optional... and there's the right API for
> you!
> If you use devm_clk_get_optional(), you won't have to manually assign
> NULL
> to priv->async_clk, as that's API handled... and you'll get a failure
> if
> the return value is an error that's not -ENOENT (so, it'll fail if
> the clock
> was declared in DT, but there was an error acquiring it).
> 
> Please use devm_clk_get_optional() here.
> 

Yes, async_clk is optional.
Thanks for your suggestion.
I'll try it.

> Regards,
> - Angelo
-- 
Regards,
Jason-JH Lin <jason-jh.lin@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
