Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5076C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jan 2022 06:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AatKp7ZiOfzqNjeBqscPIhnSNYb4+qnyRul7k9/J6cA=; b=CYrZnTjAGl0kpV
	zRzjLp1acraHBWLwRTybZu4pQV42Jt7y0A733MtsjqVfD+rdCeHos8x31N/y0S8m0VBPBsQ4ETlWr
	FXYmYeHAJDbHb87OKhZ34R/souJ9BM/fs9dJ4kWSh8ATENMCXYK7g2ddxMfYN9cHOLAcPVba+y7pM
	kmtu8thpeqhPYDzDw4GIdAfQB4AyDdHswUI6o8JQejjDGaBm4Ua6DTneqSMX8XfRKfaaGFt2nBRuC
	XBfrgnfkEen4epRujf+ZMTuL7cwbF6aGOiiNJcSRv1b8HPcjQBFVrCbplnxEBZHDRhQCqBeRptPJv
	P2znnk60XhI42CD6ovhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBt35-002REt-8h; Mon, 24 Jan 2022 06:41:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBt32-002REH-VS; Mon, 24 Jan 2022 06:41:54 +0000
X-UUID: 061be5baab2b4d70b8c0017c9402455f-20220123
X-UUID: 061be5baab2b4d70b8c0017c9402455f-20220123
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1065209973; Sun, 23 Jan 2022 23:41:48 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 23 Jan 2022 22:39:36 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 24 Jan 2022 14:39:35 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 24 Jan 2022 14:39:34 +0800
Message-ID: <dc84332f190a8be7d5b004fc4d2a2c1341f9a357.camel@mediatek.com>
Subject: Re: [PATCH v21 3/8] soc: mediatek: SVS: introduce MTK SVS engine
From: Roger Lu <roger.lu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
 <eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 YT Lee <yt.lee@mediatek.com>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin <Angus.Lin@mediatek.com>, 
 Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Guenter Roeck
 <linux@roeck-us.net>
Date: Mon, 24 Jan 2022 14:39:34 +0800
In-Reply-To: <63d8884d-d02d-53f9-8524-4a074ca5bfea@collabora.com>
References: <20220107095200.4389-1-roger.lu@mediatek.com>
 <20220107095200.4389-4-roger.lu@mediatek.com>
 <63d8884d-d02d-53f9-8524-4a074ca5bfea@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_224153_047431_95430D58 
X-CRM114-Status: GOOD (  18.20  )
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

Hi AngeloGioacchino,

Sorry for the late reply and thanks for the advice.

On Fri, 2022-01-07 at 15:33 +0100, AngeloGioacchino Del Regno wrote:
> Il 07/01/22 10:51, Roger Lu ha scritto:
> > The Smart Voltage Scaling(SVS) engine is a piece of hardware
> > which calculates suitable SVS bank voltages to OPP voltage table.
> > Then, DVFS driver could apply those SVS bank voltages to PMIC/Buck
> > when receiving OPP_EVENT_ADJUST_VOLTAGE.
> > 
> > Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> > ---
> >   drivers/soc/mediatek/Kconfig   |   10 +
> >   drivers/soc/mediatek/Makefile  |    1 +
> >   drivers/soc/mediatek/mtk-svs.c | 1446 ++++++++++++++++++++++++++++++++
> >   3 files changed, 1457 insertions(+)
> >   create mode 100644 drivers/soc/mediatek/mtk-svs.c

[snip]

> > +
> > +struct svs_platform_data {
> > +	char *name;
> > +	struct svs_bank *banks;
> > +	bool (*efuse_parsing)(struct svs_platform *svsp);
> > +	unsigned long irqflags;
> > +	const u32 *regs;
> > +	u32 bank_max;
> > +	int (*probe)(struct svs_platform *svsp);
> > +};
> > +
> 
> Please move the definition of struct svs_platform_data at the beginning of
> the file for increased readability.

Okay. I'll move them at the beginning of the file in the next patch.

> 
> With that done,
> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
