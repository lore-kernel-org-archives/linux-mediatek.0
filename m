Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E6DC04A68
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 09:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IkOjy15sgtSmuxCEiiuJX1E764Oz375ZE6bY4ACvhhg=; b=J7oUP6XRopKeeh4LmE0YP5c1XT
	rp/InXDOV819AlewQTZXjAc9xUt+Z4VN8L+kCFGrHRhEIWDe1efFnPnGD+OLKD+SXsEr72zwUW2gp
	3Ws5k9MGPjC765ftABsnOBtuMBvM4A/UqD0eLyLFFjkYvtYsuomE+tueWEkLwr/1ls11l0z25fPwM
	XH00pkleVUplsmPU5fIELu8zoIG4VnKudXP7DcuWZRf1eKCB5FgRund8WDjk/W54PxALguSZOVn/J
	yOcVA5XeeYeRf9ATvgGRyUWtLJueaqD8xIITjquMq00LMONBBUdsCcUnbFoVpCIY9BXoV1QuTyCif
	0+t2HGEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH01F-0071da-R3; Thu, 28 Jul 2022 09:41:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH01A-00718q-Gr; Thu, 28 Jul 2022 09:41:23 +0000
X-UUID: 89ec77de48354cb5930d2f840b3debae-20220728
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:9af29fd7-46b4-4248-a77a-5f8147c3b2c0,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:675d93d0-841b-4e95-ad42-8f86e18f54fc,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 89ec77de48354cb5930d2f840b3debae-20220728
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 221657354; Thu, 28 Jul 2022 02:41:12 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 28 Jul 2022 17:40:41 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 28 Jul 2022 17:40:41 +0800
Message-ID: <22cd8a6807385941c55e75b390d31424936ae8c4.camel@mediatek.com>
Subject: Re: [PATCH v15 07/11] drm/mediatek: Add retry to prevent
 misjudgment for sink devices
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <matthias.bgg@gmail.com>,
	<deller@gmx.de>, <airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <ck.hu@mediatek.com>, <liangxu.xu@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-fbdev@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 28 Jul 2022 17:40:41 +0800
In-Reply-To: <ce46e9b2-8e34-b6cd-d802-35b3ae66e02d@collabora.com>
References: <20220727045035.32225-1-rex-bc.chen@mediatek.com>
	 <20220727045035.32225-8-rex-bc.chen@mediatek.com>
	 <ce46e9b2-8e34-b6cd-d802-35b3ae66e02d@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_024120_575748_30CC9BB4 
X-CRM114-Status: GOOD (  25.95  )
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

On Wed, 2022-07-27 at 11:40 +0200, AngeloGioacchino Del Regno wrote:
> Il 27/07/22 06:50, Bo-Chen Chen ha scritto:
> > For some DP dungles, we need to train more than onece to confirm
> > that we
> > don't misjudge the status of sink device.
> 
> Please fix the typos in your commit title and description.
> title: misjudgment -> misjudgement
> desc: dungles->dongles; onece->once
> 
> > 
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> >   drivers/gpu/drm/mediatek/mtk_dp.c | 21 ++++++++++++++++++---
> >   1 file changed, 18 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c
> > b/drivers/gpu/drm/mediatek/mtk_dp.c
> > index ce817cb59445..80d7d6488105 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> > @@ -42,6 +42,7 @@
> >   #define MTK_DP_CHECK_SINK_CAP_TIMEOUT_COUNT 3
> >   #define MTK_DP_TBC_BUF_READ_START_ADDR 0x08
> >   #define MTK_DP_TRAIN_DOWNSCALE_RETRY 8
> > +#define MTK_DP_TRAIN_CLEAR_RETRY 50
> >   
> >   struct mtk_dp_train_info {
> >   	bool tps3;
> > @@ -1431,11 +1432,25 @@ static int mtk_dp_video_config(struct
> > mtk_dp *mtk_dp)
> >   
> >   static int mtk_dp_training(struct mtk_dp *mtk_dp)
> >   {
> > +	short max_retry = MTK_DP_TRAIN_CLEAR_RETRY;
> >   	int ret;
> >   
> > -	ret = mtk_dp_train_start(mtk_dp);
> > -	if (ret)
> > -		return ret;
> > +	/*
> > +	 * We do retry to confirm that we don't misjudge the sink
> > status.
> > +	 * If it is still failed, we can confirm there are some issues
> > for the
> > +	 * sink device.
> > +	 */
> > +	do {
> > +		ret = mtk_dp_train_start(mtk_dp);
> > +		if (!ret)
> > +			break;
> > +	} while (--max_retry);
> > +
> > +	dev_info(mtk_dp->dev, "dp training clear retry times: %d\n",
> > +		 MTK_DP_TRAIN_CLEAR_RETRY - max_retry);
> 
> dev_dbg() here.
> 
> ...after which,
> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 

Hello Angelo,

Thanks for your review.
I will modify these in next version.

BRs,
Bo-Chen

> > +
> > +	if (!max_retry)
> > +		return -ETIMEDOUT;
> >   
> >   	ret = mtk_dp_video_config(mtk_dp);
> >   	if (ret)
> 
> 


