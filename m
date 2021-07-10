Return-Path: <SRS0=Fd5v=MC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7A8EC07E95
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Jul 2021 07:09:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94A4F613D2
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Jul 2021 07:09:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94A4F613D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pgUPRM5vUvYZVKnkPI3mjwBfJGTJ97PI3hZBje26xkc=; b=jjxbYn/Qnsw8Ml
	ksTKyY27T+TV9ckfB4Foi1o5denNIUuZqkyFrr9MyhZi31+lbc0Fp4NumA2lVjO+ell2+JvnLyeho
	RD0Bm6WSDoSnifwsleEXe7AjT16wwzFbN0NxXiiKK93oa7/kVNWWqyxwbcdt7MIE25H0Ydl9g3YBN
	RmLH4sNu9zZf+b7NWPdY27yWrxDD84z0oeBguiDJIo+ssCFr6ca28yIXJ29yEoIY5xsOBlp3hPEK3
	iY7roB3v5v71MQxuaWVkk/6l0S51tgZpx9/MHeMblps112AwgF3xJ6oSk302EWW96IroZ0BuqCVe4
	gDSCZbLc6Pki8wC9GKbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m276n-003CIZ-BY; Sat, 10 Jul 2021 07:09:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m276a-003CGX-HE; Sat, 10 Jul 2021 07:08:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=eICC1osrLRCB6HLoWQS3KtrDniyt/REFGqRN9fWm7CQ=; b=M0f/Ukm3xRqsVk/sCDuUu/Ea22
 NkovIP3yILnjxgmqVI2fJZDjoXipfIWWvZURt11aChUjskvnc5wMUCY2y66+KDw8vuIICTbo9uccm
 za3/nu0CXyKNuf1VL85jgofaRi2LQWmWhlbt3SYWfGdzUZGlxLxsPCSPTSCTHneeSi+f1huogUbrz
 RLEfMYQ3xy94q+n4vhSwQbjfS7f6yNNXkcUUo03U0wSQzXGS8GMOWbrApeLrtJ6qHqQGlJv1P4IaC
 gu6xuInujSsfcwoiLwpkaZGvIcp4/qRRiKu/EDiEMgRjWgn706pqEWOsMDzLSSjvMzyo+wOYgy1GT
 zSwUc3XQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m276U-00GJ7v-Hy; Sat, 10 Jul 2021 07:08:48 +0000
X-UUID: 77a1deb9f6fe42db9411196f3fd7a8de-20210710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=eICC1osrLRCB6HLoWQS3KtrDniyt/REFGqRN9fWm7CQ=; 
 b=psNgez2bIsRLeRkwSfxf2djya4uarAkmnHvEV4OkPjjYFb1SEn53vVhX5hbnTqQk7I8nsp6SVEAA8+UOa6IRSLlBr1xZxCRgDYmSRITlJegPoquBw2hZwejI1T1AeGtX9wB8/4tF1MRlh0qBxtSATzLUIZA4QJmPwwaeSmQCWGo=;
X-UUID: 77a1deb9f6fe42db9411196f3fd7a8de-20210710
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1262739914; Sat, 10 Jul 2021 00:05:22 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Jul 2021 00:05:20 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Jul 2021 15:05:13 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 10 Jul 2021 15:05:13 +0800
Message-ID: <257730816d127729e18909d2c23582d0cc07d493.camel@mediatek.com>
Subject: Re: [PATCH v1 07/17] drm/mediatek: add OVL support for MT8195
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
CC: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>
Date: Sat, 10 Jul 2021 15:05:12 +0800
In-Reply-To: <1625634196.7824.13.camel@mtksdaap41>
References: <20210707041249.29816-1-jason-jh.lin@mediatek.com>
 <20210707041249.29816-8-jason-jh.lin@mediatek.com>
 <1625634196.7824.13.camel@mtksdaap41>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210710_080846_936747_9294B845 
X-CRM114-Status: GOOD (  21.08  )
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

On Wed, 2021-07-07 at 13:03 +0800, CK Hu wrote:
> Hi, Jason:
> 
> On Wed, 2021-07-07 at 12:12 +0800, jason-jh.lin wrote:
> > Add OVL support for MT8195.
> > 
> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 9 +++++++++
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 2 ++
> >  2 files changed, 11 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > index 961f87f8d4d1..99c39487026d 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > @@ -455,6 +455,13 @@ static const struct mtk_disp_ovl_data
> > mt8183_ovl_2l_driver_data = {
> >  	.fmt_rgb565_is_0 = true,
> >  };
> >  
> > +static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
> > +	.addr = DISP_REG_OVL_ADDR_MT8173,
> > +	.gmc_bits = 10,
> > +	.layer_nr = 4,
> > +	.fmt_rgb565_is_0 = true,
> > +};
> 
> mt8195_ovl_driver_data is identical to mt8183_ovl_driver_data, so
> remove
> mt8195_ovl_driver_data and use mt8183_ovl_driver_data.
> 
> > +
> >  static const struct of_device_id mtk_disp_ovl_driver_dt_match[] =
> > {
> >  	{ .compatible = "mediatek,mt2701-disp-ovl",
> >  	  .data = &mt2701_ovl_driver_data},
> > @@ -464,6 +471,8 @@ static const struct of_device_id
> > mtk_disp_ovl_driver_dt_match[] = {
> >  	  .data = &mt8183_ovl_driver_data},
> >  	{ .compatible = "mediatek,mt8183-disp-ovl-2l",
> >  	  .data = &mt8183_ovl_2l_driver_data},
> > +	{ .compatible = "mediatek,mt8195-disp-ovl",
> > +	  .data = &mt8195_ovl_driver_data},
> 
> One question, is mediatek,mt8195-disp-ovl identical to
> mediatek,mt8183-disp-ovl in hardware function? If so, use the
> compatible
> as
> 
> compatible = "mediatek,mt8195-disp-ovl", "mediatek,mt8183-disp-ovl";
> 
> And driver just keep "mediatek,mt8183-disp-ovl" and remove
> "mediatek,mt8195-disp-ovl".
> 
> If the hardware function has some different, just forget this.
> 
> Regards,
> CK
> 
Hi CK,

OK, I'll remove this patch at the next version.

Regard,
Jason-JH.Lin
> >  	{},
> >  };
> >  MODULE_DEVICE_TABLE(of, mtk_disp_ovl_driver_dt_match);
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > index 5b7ead493487..65038d5b19cb 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > @@ -424,6 +424,8 @@ static const struct of_device_id
> > mtk_ddp_comp_dt_ids[] = {
> >  	  .data = (void *)MTK_DISP_OVL },
> >  	{ .compatible = "mediatek,mt8183-disp-ovl",
> >  	  .data = (void *)MTK_DISP_OVL },
> > +	{ .compatible = "mediatek,mt8195-disp-ovl",
> > +	  .data = (void *)MTK_DISP_OVL },
> >  	{ .compatible = "mediatek,mt8183-disp-ovl-2l",
> >  	  .data = (void *)MTK_DISP_OVL_2L },
> >  	{ .compatible = "mediatek,mt2701-disp-rdma",
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
