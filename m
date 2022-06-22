Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DA2C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 09:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bNpPjdK7gfo8TucM5MW9+savaqGTZAf6bfWG15iKUu4=; b=Qkz2pf3IKF3GEwLzpzPWpC5oi5
	BInhHpEJs5rfBJSiIpP8FIeTWz5i3yQOm9MeyJ7F1FXXhMtGsAvj/8ti+0i6hnffGqrC4STfh1c1T
	FFwkEpJ6O1BekpL44ZPUnKiyWikt+s7pMzgrVVEQ4ISErDlwwqhCHo6bNZXEmddxaMPVCnJVnW0BF
	J+gBgYPbR9p8YDHZqKOAACUoChAXTDkH/BAIT3i1F/X78GscHM3nV04IF1vw9x3c2smApHSzBqR5A
	IvvMvfjFK5f15Tn3W9SCcq1BEA5x4hRbS3vW8BhsjwEN+jf4z/tN1w0byQKfaQTVezB1jkzKDjFPM
	5Mxx1upQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3wVG-009ZZa-8F; Wed, 22 Jun 2022 09:18:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3wT2-009YZC-16; Wed, 22 Jun 2022 09:16:09 +0000
X-UUID: ed243bed273f4a3fb3c6744e585b5758-20220622
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:d7bd8114-a7df-4de0-8b93-020a94157fa0,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:239e2a38-5e4b-44d7-80b2-bb618cb09d29,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: ed243bed273f4a3fb3c6744e585b5758-20220622
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1954158870; Wed, 22 Jun 2022 02:15:58 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jun 2022 02:09:01 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jun 2022 17:08:59 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 22 Jun 2022 17:08:59 +0800
Message-ID: <3246fb94ec05a43b7017849198d949ce8c8636a7.camel@mediatek.com>
Subject: Re: [PATCH v13 12/14] drm/mediatek: dpi: add config to control
 setting of direct connection to pins
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <ck.hu@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 22 Jun 2022 17:08:59 +0800
In-Reply-To: <55c98626-9b95-7721-94cf-8c471580a53b@collabora.com>
References: <20220621113732.11595-1-rex-bc.chen@mediatek.com>
	 <20220621113732.11595-13-rex-bc.chen@mediatek.com>
	 <55c98626-9b95-7721-94cf-8c471580a53b@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_021608_116313_29A8FB10 
X-CRM114-Status: GOOD (  16.78  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2022-06-21 at 14:11 +0200, AngeloGioacchino Del Regno wrote:
> Il 21/06/22 13:37, Bo-Chen Chen ha scritto:
> > MediaTek dpi supports direct connection to pins while dp_intf does
> > not
> > support. Therefore, add a config "support_direct_pin" to control
> > this.
> > 
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> >   drivers/gpu/drm/mediatek/mtk_dpi.c | 17 +++++++++++++----
> >   1 file changed, 13 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index 438bf3bc5e4a..ef7f828a4b1e 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -129,6 +129,8 @@ struct mtk_dpi_yc_limit {
> >    * @is_ck_de_pol: Support CK/DE polarity.
> >    * @swap_input_support: Support input swap function.
> >    * @color_fmt_trans_support: Enable color format transfer.
> > + * @support_direct_pin: Dpi can directly connect pins, and enable
> > this config
> > + *			to do this.
> 
> @support_direct_pin: IP supports direct connection to pins
> 
> or
> 
> @support_direct_pin: IP has direct connection to DP pins
> 
> or
> 
> @support_direct_pin: IP connects directly to DP pins
> 
> pick one, after which:
> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 
> 

Hello Angelo,

this is not connect to "DP" pin. This setting is for dpi to connect to
panel directly and there is no such usecase for dp_intf.

Therefore, I will use "@support_direct_pin: IP supports direct
connection to pins".

Thanks

BRs,
Bo-Chen


