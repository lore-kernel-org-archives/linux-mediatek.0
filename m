Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69098C54EE9
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 01:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wd1G08HC6flVRDFOB/8mfAvI8N21GR0U87+/DU0QX78=; b=hZp118wraHlKoMKQinDloqJoQt
	3EYhwpXZXQIgZ55DE3ywI96+y2tJ1ipeXVmnBcMGjvzZHPW/Se0bhRBEnbcS9l8plTzFrPEFnIbCa
	EswyBQyPO7QkKocHrVZ4spXTvGUBORh9xogkmTN4FxFXdcnDEHMiiH7QxwFicxPE1W7SEKP9U4HQA
	KtxrZ8dbkWzi3bvBNTi1bNV6FbBIzD+Tedq7iLkTfO2D/uDq67pdl0o3F3wHfnpKOG7OpVfgl3uKN
	HcQLA2yZaKUkcynBxwLBm2E26d5WIFMaOR4XeRHgC14FGPlORCuooMS6lqwfRrFld+gdENfZLYETL
	pTjrwCHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYHLc-003ffr-Sy; Wed, 14 Sep 2022 01:37:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYHLP-003fZ4-R9; Wed, 14 Sep 2022 01:37:41 +0000
X-UUID: 0a2bd19fc0574a09bc5fd4ce268a400f-20220913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=Wd1G08HC6flVRDFOB/8mfAvI8N21GR0U87+/DU0QX78=;
	b=m9INvP0usr9U1of8vPtJUZ6gGcfF9SSRrTpV2O1YwKV+bDcG5EVDtvetf6esF2doqx176VzxNL47qkIhZksYngLvpZrNnQB8snXMDA2D+uPeRqb0q7YIpAsynlvOnoytVIoX5c8SULblSFbjSyi+2oHpC2uiK3T9hURYvpnwuhU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:ae53c394-e120-4d85-aa87-0ff472e48271,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:b2264cf6-6e85-48d9-afd8-0504bbfe04cb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 0a2bd19fc0574a09bc5fd4ce268a400f-20220913
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 756701701; Tue, 13 Sep 2022 18:37:35 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 14 Sep 2022 09:37:00 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 14 Sep 2022 09:37:00 +0800
Message-ID: <374cb457bdd1d77ad5e81b2d24538b6750aebf95.camel@mediatek.com>
Subject: Re: [PATCH v3 5/9] drm/mediatek: Add gamma support different
 lut_bits for other SoC
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, Singo
 Chang <singo.chang@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 14 Sep 2022 09:36:58 +0800
In-Reply-To: <5419b691-1b89-9878-ac52-4c99fa3af322@collabora.com>
References: <20220911153734.24243-1-jason-jh.lin@mediatek.com>
	 <20220911153734.24243-6-jason-jh.lin@mediatek.com>
	 <5419b691-1b89-9878-ac52-4c99fa3af322@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_183739_908969_6B071DFD 
X-CRM114-Status: GOOD (  21.63  )
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

Hi Angelo,

Thanks for the reviews.

On Mon, 2022-09-12 at 12:25 +0200, AngeloGioacchino Del Regno wrote:
> Il 11/09/22 17:37, Jason-JH.Lin ha scritto:
> > Add lut_bits in gamma driver data for each SoC and adjust the usage
> > of lut_bits in mtk_drm_gamma_set_common().
> > 
> > Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> > ---
> >   drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 36 ++++++++++++++++
> > -------
> >   1 file changed, 25 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > index e69d0b205b9a..155fb5d94d79 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> > @@ -25,11 +25,14 @@
> >   
> >   #define LUT_10BIT_MASK				0x03ff
> >   #define LUT_SIZE_DEFAULT			512 /* for setting
> > gamma lut from AAL */
> > +#define LUT_BITS_DEFAULT			10
> > +#define LUT_INPUT_BITS				16 /* input lut
> > bit from application */
> >   
> >   struct mtk_disp_gamma_data {
> >   	bool has_dither;
> >   	bool lut_diff;
> >   	u16 lut_size;
> > +	u8 lut_bits;
> >   };
> >   
> >   /*
> > @@ -72,17 +75,23 @@ void mtk_gamma_set_common(struct device *dev,
> > void __iomem *regs, struct drm_crt
> >   	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
> >   	bool lut_diff = false;
> >   	u16 lut_size = LUT_SIZE_DEFAULT;
> > +	u8 lut_bits = LUT_BITS_DEFAULT;
> 
> Please fix this double assignment like shown in the comment for patch
> [4/9].
> 
> Thanks,
> Angelo
> 
OK, I'll fix this.
Regards,
Jason-JH.Lin

-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>


