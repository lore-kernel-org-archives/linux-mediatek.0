Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39925C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 09:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xxo61ZSsmcpHR7zHA7LelS0eC0S3EREHr0C13nvYofU=; b=WDo+WNWTTF4daZ
	vZrD4A5NZqEFwgXsnGrPZ7PXBpQWthHedoLtErfsH3qKriix91cj8IHV7VYzC/oTOCzEJl1Gx5M/w
	z0u8FIAtjzZ0kGnbZL7pkdWGMs6T/tFXzxxRyozSGocdfftVJyZX7aycdxiihb+fIemnJOj4rudwG
	ig+mHau2z3wDhr7TEgvf96mRCBVT4wSWrP7dXFIq4v5IJApeLOfg0Ibv9RwT3cCHpCfCe1tvkavkk
	e0p1Grqi8E32pUcfeXWyJWitPqW0lvP9h4Dw8CWoha1i26SEsXEDBeRSZy+0Ag6x+Cc+0dmCt77OC
	ZC1xAJtLAjC+SPBnVGdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrzip-004OXO-Kk; Tue, 30 Nov 2021 09:46:47 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrzim-004OV1-2x
 for linux-mediatek@lists.infradead.org; Tue, 30 Nov 2021 09:46:45 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mrziW-0001tB-5w; Tue, 30 Nov 2021 10:46:28 +0100
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mrziU-0003cb-1z; Tue, 30 Nov 2021 10:46:26 +0100
Message-ID: <ea057e8b080a7f553ee45f282459090dca4fb4c6.camel@pengutronix.de>
Subject: Re: [PATCH v9 16/22] drm/mediatek: add ETHDR support for MT8195
From: Philipp Zabel <p.zabel@pengutronix.de>
To: "Nancy.Lin" <nancy.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie
 <airlied@linux.ie>,  Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,  "jason-jh
 . lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>,  dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 singo.chang@mediatek.com,  srv_heupstream@mediatek.com
Date: Tue, 30 Nov 2021 10:46:26 +0100
In-Reply-To: <20211130033519.26086-17-nancy.lin@mediatek.com>
References: <20211130033519.26086-1-nancy.lin@mediatek.com>
 <20211130033519.26086-17-nancy.lin@mediatek.com>
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_014644_141988_52DE35E7 
X-CRM114-Status: GOOD (  12.27  )
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

Hi Nancy,

On Tue, 2021-11-30 at 11:35 +0800, Nancy.Lin wrote:
[...]
> +void mtk_ethdr_stop(struct device *dev)
> +{
> +	struct mtk_ethdr *priv = dev_get_drvdata(dev);
> +	struct mtk_ethdr_comp *mixer = &priv->ethdr_comp[ETHDR_MIXER];
> +
> +	writel(0, mixer->regs + MIX_EN);
> +	writel(1, mixer->regs + MIX_RST);
> +	reset_control_reset(devm_reset_control_array_get(dev, true, true));

Are these reset lines really shared with other hardware units, and more
specifically, are there other drivers that also try to control them?

If so, please use devm_reset_control_array_get_optional_shared().

Otherwise use devm_reset_control_array_get_optional_exclusive() instead.

If you really need to share the reset line with other hardware and have
to trigger it more than once, the only use case supported by the reset
framework is to use reset_control_reset() before starting the hardware
for each user and then reset_control_rearm() after stopping it for all
users (see [1]). That would both stop the reset from being triggered
while the hardware is active (before last _rearm) and allow another
reset once after all hardware is stopped.

[1] https://www.kernel.org/doc/html/latest/driver-api/reset.htm#triggering

Also, request the reset control once in the probe function, not every
time ETHDR is stopped. Otherwise you'll end up leaking devres memory

regards
Philipp

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
