Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F38CECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 01:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WAvI+BMy2RLJDJVTwe1yHE9y6+QIYr861RrSmwR4QJc=; b=PRQb5p3iSS+Y+s+Dvt3imchvjQ
	GczSVV6YJXhdfH0urt1iLhCXUwAUmekyrKpYC/UgQV0VS0640h46q2u9Ankgnma2Cdj6765C+Gsa6
	PnobETvOCqIY/7LcFYKpPNv+PoYwba/asD71z+Aed7G5jWuZPUE8JmfKOOWeBMBKYRbvbd2G3X6yQ
	dbrNNmoXKqnKxSHMUvWM/LgKgLLrWTbslYdjYHiLyX8ZJcJvaZI5CihYdcOm16rV0n+FF1dbuErya
	THcXL06qaYJLK1NhX4yPgTVGt/vUEKbeUxLRpRlF5D3ZUxPmla21dBbrAWJ4X5b3sJXLXmlXUBY+5
	gXLsfJeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYHfp-0042qG-Nj; Wed, 14 Sep 2022 01:58:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYHfd-0042SX-KX; Wed, 14 Sep 2022 01:58:35 +0000
X-UUID: be8d4e4cb2004b3b909b67cab2dfe66b-20220913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=WAvI+BMy2RLJDJVTwe1yHE9y6+QIYr861RrSmwR4QJc=;
	b=LMnrbuzgDdMrobPrkagOKY10DAqiM5ZS/tFKP6J//ynoH1R4JreCcxgJ+Vv3MqkNmu8HmWb2yACIMv/gIQLDpBvZv3CGKNPbluMa8nkoEcL8oK1+QFU+CLo7cGGaC6OZg6CIOYrnk6rhqmYa1N2rw9n6WaVEOhBXDlinXVgWHl0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:472f47db-487d-4c3d-975b-642193bab36a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:d5064df6-6e85-48d9-afd8-0504bbfe04cb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: be8d4e4cb2004b3b909b67cab2dfe66b-20220913
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 957119828; Tue, 13 Sep 2022 18:58:28 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 14 Sep 2022 09:17:52 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 14 Sep 2022 09:17:52 +0800
Message-ID: <b813ae7cf79a2889647ec4cb9dd77b59ac65030b.camel@mediatek.com>
Subject: Re: [PATCH RESEND v3 5/9] drm/mediatek: Add gamma support different
 lut_bits for other SoC
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Rex-BC Chen <rex-bc.chen@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 14 Sep 2022 09:17:51 +0800
In-Reply-To: <b740f81d62ce73e08a2a43637b4f951298b1c28a.camel@mediatek.com>
References: <20220912013006.27541-1-jason-jh.lin@mediatek.com>
	 <20220912013006.27541-6-jason-jh.lin@mediatek.com>
	 <b740f81d62ce73e08a2a43637b4f951298b1c28a.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_185833_701409_7372F80B 
X-CRM114-Status: GOOD (  21.75  )
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

Hi CK,

Thanks for the reviews.

On Mon, 2022-09-12 at 11:40 +0800, CK Hu wrote:
> Hi, Jason:
> 
> On Mon, 2022-09-12 at 09:30 +0800, Jason-JH.Lin wrote:
> > Add lut_bits in gamma driver data for each SoC and adjust the usage
> > of lut_bits in mtk_drm_gamma_set_common().
> > 
> > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 36 ++++++++++++++++---
> > --
> > --
> >  1 file changed, 25 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > index 0a1022032b71..be82d15a5204 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > @@ -25,11 +25,14 @@
> >  
> >  #define LUT_10BIT_MASK				0x03ff
> >  #define LUT_SIZE_DEFAULT			512 /* for setting
> > gamma lut from AAL */
> > +#define LUT_BITS_DEFAULT			10
> > +#define LUT_INPUT_BITS				16 /* input lut
> > bit from application */
> 
> I think we should use drm_color_lut_extract() to let the input bits
> transparent. So add one patch to use drm_color_lut_extract(), and
> then
> apply this patch.
> 
> Regards,
> CK

OK, I'll separate it to 2 patches, 1 is using drm_color_lut_extract()
to handle with input lut data and the other is adding gamma support
lut_bits and shift_bits.

Regards,
Jason-JH.Lin


