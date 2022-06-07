Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60505C43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 02:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LTSdCYorT+ZgzycdLHCjDd50/es2DWIG7e1V3Jc8VmQ=; b=v8iAis49rsMmku
	1Zpo93uPZo06bOKcpq/4oz2m/wX6jW+qr4fn4HZ4WGcakSmhpwWSPUo76/Rv5t40J6IA+obcqwBrv
	WNcIxFzzIfX157OOdxwgSrEJZ6WzjCkUZeneoyoR2uH4nkAOpSLKW2GqNFwktp5jo4shtYmPqXWvJ
	pW5UjTfDISk04Qf1ApJf9xDuFq7dOVHy/rzBMLKQ3UCrIfwQJhuRKF5XWrkB7OF9+Df0A06SWpw7e
	2+K6YwVVoQ0MJoj2bQfEzpRnhhsCAGhtEuI4XahlUmPQ4JI165khZodF8y57rgVWY11/npHZIYhFz
	RMTtUwkRq50xMwtUcHnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyPPr-004Dkk-4h; Tue, 07 Jun 2022 02:57:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyPPY-004DfQ-QM; Tue, 07 Jun 2022 02:57:42 +0000
X-UUID: ff1c54bda69744a0a8d053361d149a75-20220606
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:0ccc7d2d-6d8b-4090-b651-ccb152ffc8a6,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:59ebdce4-2ba2-4dc1-b6c5-11feb6c769e0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: ff1c54bda69744a0a8d053361d149a75-20220606
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1128099079; Mon, 06 Jun 2022 19:55:31 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Jun 2022 19:45:29 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 7 Jun 2022 10:45:27 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 7 Jun 2022 10:45:27 +0800
Message-ID: <3475079bf7917d5b522f8d0ceec7cb56b130a406.camel@mediatek.com>
Subject: Re: [PATCH v10 03/21] drm/edid: Convert cea_sad helper struct to
 kernelDoc
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Guillaume Ranquet <granquet@baylibre.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "Kishon
 Vijay Abraham I" <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, "Helge
 Deller" <deller@gmx.de>, CK Hu <ck.hu@mediatek.com>, Jitao shi
	<jitao.shi@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	<linux-fbdev@vger.kernel.org>
Date: Tue, 7 Jun 2022 10:45:27 +0800
In-Reply-To: <4c19d5fb-1e45-9149-4208-5d848eeb7565@collabora.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
	 <20220523104758.29531-4-granquet@baylibre.com>
	 <4c19d5fb-1e45-9149-4208-5d848eeb7565@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_195740_897554_2D24777B 
X-CRM114-Status: GOOD (  19.51  )
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

On Wed, 2022-05-25 at 14:01 +0200, AngeloGioacchino Del Regno wrote:
> Il 23/05/22 12:47, Guillaume Ranquet ha scritto:
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > ---
> >   include/drm/drm_edid.h | 12 +++++++++---
> >   1 file changed, 9 insertions(+), 3 deletions(-)
> > 
> > diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> > index 144c495b99c4..37c420423625 100644
> > --- a/include/drm/drm_edid.h
> > +++ b/include/drm/drm_edid.h
> > @@ -359,12 +359,18 @@ struct edid {
> >   
> >   #define EDID_PRODUCT_ID(e) ((e)->prod_code[0] | ((e)-
> > >prod_code[1] << 8))
> >   
> > -/* Short Audio Descriptor */
> > +/**
> > + * struct cea_sad - Short Audio Descriptor.
> 
> Perhaps....
> 
> * struct cea_sad - CEA Short Audio Descriptor
> 
> ...but that's relative to personal liking and nothing else, it's also
> fine as
> it is, if you like it more as it is. The ball is yours :-P
> 
> Regardless of any choice about changing the description or not:
> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 
> Cheers,
> Angelo
> 

Hello Angelo,

ok, I will do this in next version.

BRs,
Bo-Chen

> > + * @format: See HDMI_AUDIO_CODING_TYPE_*.
> > + * @channels: max number of channels - 1.
> > + * @freq: See CEA_SAD_FREQ_*.
> > + * @byte2: meaning depends on format.
> > + */
> >   struct cea_sad {
> >   	u8 format;
> > -	u8 channels; /* max number of channels - 1 */
> > +	u8 channels;
> >   	u8 freq;
> > -	u8 byte2; /* meaning depends on format */
> > +	u8 byte2;
> >   };
> >   
> >   struct drm_encoder;
> 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
