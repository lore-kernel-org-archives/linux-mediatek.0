Return-Path: <SRS0=WF8g=PK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E04EC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 07:06:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E66661075
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 07:06:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E66661075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5AJyZW99i95QAYFD5kocGuXC/1gW4P/upQKrkO/0Lug=; b=iSafl2M3Vj21o0
	HKhlaJSHte3lzKat2FSv3C/MFQzd5VknDrVaqTUiu+ndUK+kVO1xQAwBHIVuyZF2JPTWtn1qJwsAW
	4nobfH2DWDC5czY2f3y0CstvZea0bp/RgA4E5bmjmuSlRBZTdnRaA8PmT6dh6zZsRRixATOSfu1yT
	M4i5I3IrBdMiXrltNrdpHvIKPjypD6cWxZCNATD/sjlW6/UpuDsUZFBnM7STDQ+Cj54ajywJepkNP
	e4ET/JDHW2eDmt2ffAsnCum2RthpclQYWtRhXKxawvb/iGKS8BEjOYRFVz0Z/xlL6xF1qM6jGz7ys
	d7cGFL06pV0clWKiq5Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdocu-009ued-On; Fri, 22 Oct 2021 07:06:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdocr-009udF-8D; Fri, 22 Oct 2021 07:06:02 +0000
X-UUID: ad58ba118edb43c2b18dbeb13e91d1ee-20211022
X-UUID: ad58ba118edb43c2b18dbeb13e91d1ee-20211022
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 486175940; Fri, 22 Oct 2021 00:05:55 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Oct 2021 00:05:54 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 22 Oct 2021 15:05:52 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Oct 2021 15:05:52 +0800
Message-ID: <42cb7e2bd62eed7284ee6806442cd89db4355df7.camel@mediatek.com>
Subject: Re: [PATCH v6 09/16] soc: mediatek: mmsys: modify reset controller
 for MT8195 vdosys1
From: Nancy.Lin <nancy.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <singo.chang@mediatek.com>,
 <srv_heupstream@mediatek.com>
Date: Fri, 22 Oct 2021 15:05:52 +0800
In-Reply-To: <1249012e-4069-429d-654d-7698bcaf5153@collabora.com>
References: <20211004062140.29803-1-nancy.lin@mediatek.com>
 <20211004062140.29803-10-nancy.lin@mediatek.com>
 <1249012e-4069-429d-654d-7698bcaf5153@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_000601_331775_30BD6264 
X-CRM114-Status: GOOD (  16.97  )
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

Thanks for the review.

On Thu, 2021-10-14 at 16:56 +0200, AngeloGioacchino Del Regno wrote:
> Il 04/10/21 08:21, Nancy.Lin ha scritto:
> > MT8195 vdosys1 has more than 32 reset bits and a different reset
> > base
> > than other chips. Modify mmsys for support 64 bit and different
> > reset
> > base.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > ---
> >   drivers/soc/mediatek/mt8195-mmsys.h |  1 +
> >   drivers/soc/mediatek/mtk-mmsys.c    | 21 ++++++++++++++++-----
> >   drivers/soc/mediatek/mtk-mmsys.h    |  2 ++
> >   3 files changed, 19 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mt8195-mmsys.h
> > b/drivers/soc/mediatek/mt8195-mmsys.h
> > index 648baaec112b..f67801c42fd9 100644
> > --- a/drivers/soc/mediatek/mt8195-mmsys.h
> > +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> > @@ -123,6 +123,7 @@
> >   #define MT8195_VDO1_MIXER_SOUT_SEL_IN				
> > 0xf68
> >   #define MT8195_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER		(0 <<
> > 0)
> >   
> > +#define MT8195_VDO1_SW0_RST_B           0x1d0
> 
> All other definitions are indented with tabulations, but these are
> spaces here.
> Please, do not mix formatting.
> 
> Regards,
> - Angelo

OK, I will fix it.

Regards,
Nancy


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
