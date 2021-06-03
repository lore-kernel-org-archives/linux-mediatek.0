Return-Path: <SRS0=bWHh=K5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B10C47082
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jun 2021 03:58:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 558A8613B4
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jun 2021 03:58:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 558A8613B4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2cT/fLo4CbdyPauzatxZFucEahY+pvY43fqIlIDD2P4=; b=jqZpB4lu+0fVHt
	LzmxSuI8MiBhWiWyG792NQUrQSeDO+32OWt3dE3/VepZbI8tszOWFjdH0TguNA6WiuQk4JX/Q4Aa7
	Vm7+wHZ84teKKcvuJOjiVWzL+cL+mij593Ok3TjtN/2bCceVPCknkqHld+n4KChzTIzhLW/NjaDHt
	6DYJuhepyHaimPewIsk8TlIUnyZDC0M2gplcF8Wg0/nZNuhDXCh4AgvjMEBCi6l34Z2hDg3Bn25Z/
	VT82Kgjj1wjjGry9NmZTONmHPBjA6i6/KF34mG4sVEFrarCRRizuk0bbGT+A8ek1NKVonMJUfcd+F
	ViQHjzftxctdXWFnsRwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loeSm-006zcc-DG; Thu, 03 Jun 2021 03:56:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loeSZ-006za6-DU; Thu, 03 Jun 2021 03:55:56 +0000
X-UUID: 85f9602791d948d4a09c7ad12c0e053e-20210602
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=hJQJVtfWs3taTeNFrzIry6OR+myqkplM/O272A0KfOk=; 
 b=mw6I7x6qc2C+zfqvab5xT5C/BPvqqNd+m5z4Ejubeatr+3Xdu4gaYr6ab4QS1xC1Wo8wAzdZMdI1AvnlkisPaOo3QLQ7k1DDPlJyOoUNKzIltU4opuScsF2z1+KoLOPgnrzkxyRO4YG/inoyBrnwW81RY/l+vT1pSRBoi6yPJIg=;
X-UUID: 85f9602791d948d4a09c7ad12c0e053e-20210602
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1090329109; Wed, 02 Jun 2021 20:55:44 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Jun 2021 20:55:42 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 3 Jun 2021 11:55:35 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 3 Jun 2021 11:55:34 +0800
Message-ID: <1622692534.28790.4.camel@mhfsdcap03>
Subject: Re: [PATCH v4,5/6] media: mtk-vcodec: Add MT8192 H264 venc driver
From: Irui Wang <irui.wang@mediatek.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
CC: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>,
 "Andrew-CT Chen" <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Maoguang Meng <maoguang.meng@mediatek.com>, "Longfei
 Wang" <longfei.wang@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, "Yunfei
 Dong" <yunfei.dong@mediatek.com>, Fritz Koenig <frkoenig@chromium.org>,
 Tzung-Bi Shih <tzungbi@chromium.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 3 Jun 2021 11:55:34 +0800
In-Reply-To: <e95b8c85-4878-eec7-f568-5f16f7fcf955@collabora.com>
References: <20210521070139.20644-1-irui.wang@mediatek.com>
 <20210521070139.20644-6-irui.wang@mediatek.com>
 <e95b8c85-4878-eec7-f568-5f16f7fcf955@collabora.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 01C8CE8F446CD0E2ED0DB8CF07CB6F7D203A7F72CD36341BE9C7A3056A86438F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_205555_471713_26075C9A 
X-CRM114-Status: GOOD (  21.44  )
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

Hi,

On Fri, 2021-05-28 at 08:27 +0300, Dafna Hirschfeld wrote:
> Hi
> 
> On 21.05.21 10:01, Irui Wang wrote:
> > Add MT8192 venc driver's compatible and device private data.
> > 
> > Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> > ---
> >   drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h |  1 +
> >   .../media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c | 14 ++++++++++++++
> >   2 files changed, 15 insertions(+)
> > 
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > index d03cca95e99b..14893d277bb8 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > @@ -302,6 +302,7 @@ struct mtk_vcodec_ctx {
> >   enum mtk_chip {
> >   	MTK_MT8173,
> >   	MTK_MT8183,
> > +	MTK_MT8192,
> >   };
> >   
> >   /**
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> > index 26b089e81213..78f3dd166917 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> > @@ -425,12 +425,26 @@ static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
> >   	.core_id = VENC_SYS,
> >   };
> >   
> > +static const struct mtk_vcodec_enc_pdata mt8192_pdata = {
> > +	.chip = MTK_MT8192,
> > +	.uses_ext = true,
> > +	/* MT8192 supports the same capture formats as MT8183*/
> 
> missing space before '*/'
> 
> > +	.capture_formats = mtk_video_formats_capture_mt8183,
> > +	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_mt8183),
> > +	/* MT8192 supports the same output formats as MT8173 */
> > +	.output_formats = mtk_video_formats_output_mt8173,
> > +	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output_mt8173),
> 
> If all three models mt8173, mt8183 and mt8192 support the same formats then
> we should probably not name the structs according to one of the models, so maybe:
> 
> s/mtk_video_formats_capture_mt8183/mtk_video_formats_capture/
> s/mtk_video_formats_output_mt8173/mtk_video_formats_output/
> 
> or some other naming
> 
> Thanks,
> Dafna

Thanks for your review and comments, we will rename these in another
patchset, this patchset just for MT8192 now.
> 
> 
> > +	.min_bitrate = 64,
> > +	.max_bitrate = 100000000,
> > +	.core_id = VENC_SYS,
> > +};
> >   static const struct of_device_id mtk_vcodec_enc_match[] = {
> >   	{.compatible = "mediatek,mt8173-vcodec-enc",
> >   			.data = &mt8173_avc_pdata},
> >   	{.compatible = "mediatek,mt8173-vcodec-enc-vp8",
> >   			.data = &mt8173_vp8_pdata},
> >   	{.compatible = "mediatek,mt8183-vcodec-enc", .data = &mt8183_pdata},
> > +	{.compatible = "mediatek,mt8192-vcodec-enc", .data = &mt8192_pdata},
> >   	{},
> >   };
> >   MODULE_DEVICE_TABLE(of, mtk_vcodec_enc_match);
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
