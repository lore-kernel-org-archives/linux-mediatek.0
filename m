Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D80C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Dec 2021 01:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YaY/ElN5YrEF9vF/g2OlnR9B89oCpbKSQ9dAttMm0lU=; b=jxUSW4wI59iKRk
	ZmlE17ZqtZnRXl1H9cVl/H2JLhaBE44UTQm6Q+qtASZeCV+JHSkx1x50quSXcphfthiv//k+4UwE8
	j33hVZmLhwxWo4uh7lCyylP0TM5D1UdbuVCD78JyR/GUa2uky47S5g+itTBRPUIzgdVKw1Sw3/J7S
	uX5on5Z1ra0WR2dlaxaoT/vtbq7KOtmUAszAeV98T9RIs1y8lmnIXTO/CLZKCyijumag4IaFLqOUe
	sl1V/3zsR36Ay+FUnWIbIzI2Q0mikdG4LcR4hI8T7Ww4SQNhaHTMXj1gWgDwvEom87sBRK2SyCC4G
	ZP33tsCt67SZsR3v8lxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mum9K-00Adh9-MX; Wed, 08 Dec 2021 01:53:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mum9G-00AdgW-Hl; Wed, 08 Dec 2021 01:53:37 +0000
X-UUID: 3a023dcafb524a43bf19026e3f3bac49-20211207
X-UUID: 3a023dcafb524a43bf19026e3f3bac49-20211207
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1984251089; Tue, 07 Dec 2021 18:53:29 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Dec 2021 17:53:28 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 8 Dec 2021 09:53:25 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 8 Dec 2021 09:53:25 +0800
Message-ID: <8a126638578e5437ae2b210e2e4076a29aa52907.camel@mediatek.com>
Subject: Re: [PATCH v9 16/22] drm/mediatek: add ETHDR support for MT8195
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, "jason-jh . lin"
 <jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <singo.chang@mediatek.com>,
 <srv_heupstream@mediatek.com>
Date: Wed, 8 Dec 2021 09:53:25 +0800
In-Reply-To: <ea057e8b080a7f553ee45f282459090dca4fb4c6.camel@pengutronix.de>
References: <20211130033519.26086-1-nancy.lin@mediatek.com>
 <20211130033519.26086-17-nancy.lin@mediatek.com>
 <ea057e8b080a7f553ee45f282459090dca4fb4c6.camel@pengutronix.de>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_175334_625008_BF94D3A4 
X-CRM114-Status: GOOD (  20.75  )
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

Hi Philipp,

Thanks for the review.

On Tue, 2021-11-30 at 10:46 +0100, Philipp Zabel wrote:
> Hi Nancy,
> 
> On Tue, 2021-11-30 at 11:35 +0800, Nancy.Lin wrote:
> [...]
> > +void mtk_ethdr_stop(struct device *dev)
> > +{
> > +	struct mtk_ethdr *priv = dev_get_drvdata(dev);
> > +	struct mtk_ethdr_comp *mixer = &priv->ethdr_comp[ETHDR_MIXER];
> > +
> > +	writel(0, mixer->regs + MIX_EN);
> > +	writel(1, mixer->regs + MIX_RST);
> > +	reset_control_reset(devm_reset_control_array_get(dev, true,
> > true));
> 
> Are these reset lines really shared with other hardware units, and
> more
> specifically, are there other drivers that also try to control them?
> 
> If so, please use devm_reset_control_array_get_optional_shared().
> 
> Otherwise use devm_reset_control_array_get_optional_exclusive()
> instead.
> 
> If you really need to share the reset line with other hardware and
> have
> to trigger it more than once, the only use case supported by the
> reset
> framework is to use reset_control_reset() before starting the
> hardware
> for each user and then reset_control_rearm() after stopping it for
> all
> users (see [1]). That would both stop the reset from being triggered
> while the hardware is active (before last _rearm) and allow another
> reset once after all hardware is stopped.
> 
> [1] 
> https://urldefense.com/v3/__https://www.kernel.org/doc/html/latest/driver-api/reset.htm*triggering__;Iw!!CTRNKA9wMg0ARbw!zETfuA55cH_3uiTFEknFoWXKkApsSKFbemms9qLwluMdylp-FVK3jn5E9Ld1ZCwv$
>  
> 
> Also, request the reset control once in the probe function, not every
> time ETHDR is stopped. Otherwise you'll end up leaking devres memory
> 
> regards
> Philipp

These reset lines doesn't share with other hardware units. I will use
devm_reset_control_array_get_optional_exclusive instead and and reqest
reset control in the probe function.

Regards,
Nancy



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
