Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A0DC00140
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Aug 2022 07:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KItryM5rJCMELCueh9zyNBcyx34Z/KHfpqfgCOXw9Oc=; b=jxJKe1OXmRr5KY1PcA5d/l8tJl
	aNal8QVMvCviTsdHc/7B+T6RxiCzvHMphiYWCONKDzq4Gsp9oOfwrKnaWLMANkXp9atzKWBjVswUp
	Vo0a8DkmkPKQvxIfRsxP3pzdIqe79TSmVafQWBCd/Ri/NB2CZRqzEEQsNL674e1OERqsLc6o4v5a+
	kD3aE8WeC9Vwix8uWmTB/D/LiMmE0y33eu0BWcJD0BHSjEpx6IFJO3rL/nWikzZPEY1TB0ceECjT4
	DkM9Ptiy4miZtmaE35Zu09YW50X+5ifTkysGKSQ0IE3THv6cNOKHDqbNxiP5uMUBET+R0WUvdzleA
	7Shw/6RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJroB-00CtoY-3u; Fri, 05 Aug 2022 07:31:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJro7-00Ctlc-Rc; Fri, 05 Aug 2022 07:31:45 +0000
X-UUID: f01ecba490f545e1a45c718e59d00436-20220805
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:de73f64f-a31f-48f3-8291-0e93f8efd8f7,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:703dcf48-f57f-4088-93dd-066979cdb4e6,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: f01ecba490f545e1a45c718e59d00436-20220805
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 293319840; Fri, 05 Aug 2022 00:31:38 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 5 Aug 2022 15:10:59 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 5 Aug 2022 15:10:59 +0800
Message-ID: <9617939ab04741daaf7d1f966bf8dd02fe3a114d.camel@mediatek.com>
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
Date: Fri, 5 Aug 2022 15:10:59 +0800
In-Reply-To: <22cd8a6807385941c55e75b390d31424936ae8c4.camel@mediatek.com>
References: <20220727045035.32225-1-rex-bc.chen@mediatek.com>
	 <20220727045035.32225-8-rex-bc.chen@mediatek.com>
	 <ce46e9b2-8e34-b6cd-d802-35b3ae66e02d@collabora.com>
	 <22cd8a6807385941c55e75b390d31424936ae8c4.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_003143_922581_C188CEC1 
X-CRM114-Status: GOOD (  31.35  )
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

Hello all,

I will drop this modification becaus after we testing current drivers,
the issue described in commit message does not occur.

BRs,
Bo-Chen

On Thu, 2022-07-28 at 17:40 +0800, Rex-BC Chen wrote:
> On Wed, 2022-07-27 at 11:40 +0200, AngeloGioacchino Del Regno wrote:
> > Il 27/07/22 06:50, Bo-Chen Chen ha scritto:
> > > For some DP dungles, we need to train more than onece to confirm
> > > that we
> > > don't misjudge the status of sink device.
> > 
> > Please fix the typos in your commit title and description.
> > title: misjudgment -> misjudgement
> > desc: dungles->dongles; onece->once
> > 
> > > 
> > > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > > ---
> > >   drivers/gpu/drm/mediatek/mtk_dp.c | 21 ++++++++++++++++++---
> > >   1 file changed, 18 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c
> > > b/drivers/gpu/drm/mediatek/mtk_dp.c
> > > index ce817cb59445..80d7d6488105 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> > > @@ -42,6 +42,7 @@
> > >   #define MTK_DP_CHECK_SINK_CAP_TIMEOUT_COUNT 3
> > >   #define MTK_DP_TBC_BUF_READ_START_ADDR 0x08
> > >   #define MTK_DP_TRAIN_DOWNSCALE_RETRY 8
> > > +#define MTK_DP_TRAIN_CLEAR_RETRY 50
> > >   
> > >   struct mtk_dp_train_info {
> > >   	bool tps3;
> > > @@ -1431,11 +1432,25 @@ static int mtk_dp_video_config(struct
> > > mtk_dp *mtk_dp)
> > >   
> > >   static int mtk_dp_training(struct mtk_dp *mtk_dp)
> > >   {
> > > +	short max_retry = MTK_DP_TRAIN_CLEAR_RETRY;
> > >   	int ret;
> > >   
> > > -	ret = mtk_dp_train_start(mtk_dp);
> > > -	if (ret)
> > > -		return ret;
> > > +	/*
> > > +	 * We do retry to confirm that we don't misjudge the sink
> > > status.
> > > +	 * If it is still failed, we can confirm there are some issues
> > > for the
> > > +	 * sink device.
> > > +	 */
> > > +	do {
> > > +		ret = mtk_dp_train_start(mtk_dp);
> > > +		if (!ret)
> > > +			break;
> > > +	} while (--max_retry);
> > > +
> > > +	dev_info(mtk_dp->dev, "dp training clear retry times: %d\n",
> > > +		 MTK_DP_TRAIN_CLEAR_RETRY - max_retry);
> > 
> > dev_dbg() here.
> > 
> > ...after which,
> > 
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > 
> 
> Hello Angelo,
> 
> Thanks for your review.
> I will modify these in next version.
> 
> BRs,
> Bo-Chen
> 
> > > +
> > > +	if (!max_retry)
> > > +		return -ETIMEDOUT;
> > >   
> > >   	ret = mtk_dp_video_config(mtk_dp);
> > >   	if (ret)
> > 
> > 
> 
> 


