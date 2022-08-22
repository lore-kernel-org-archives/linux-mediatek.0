Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDAAC28D13
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Aug 2022 13:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1i4E44Nv8ZYq/yPV7FLKWZbANFWVm2e1L3wlbPyDfzw=; b=jj6ytX9qxqOkcWEObfBvORENv+
	VHQYqf0Fz6H4yNOtsf9GPH3mHZ0BgoKQSPOMbwSZpPnnNDdf0C0Vk4wUeryCMkmu0jbh5oeSlUdcK
	0YmbOgWEjvs1HGbsx2UAsFy8s5rVff5ucBtMjM+q57K7VFvkNQfk8dDRGiRxBJ5kdwYaHH3LC4937
	WY4DG3Nhm71YShnu78fQNhf7ifS2HAoH45M5MODoZvW2t3E3tYk/sVW4dtGgqCTdQGdq/jZNrkaB2
	V+7jYUe0Ik+hkl7rSn/LYkOcZnvsL4kdKw6dRCh2h0fJ1SFxMh6jc1apOHlq30qBReCKUoRoJjFfJ
	qvSY2Z4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ754-009Yss-Oz; Mon, 22 Aug 2022 13:03:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ74S-009Y8R-9M; Mon, 22 Aug 2022 13:02:28 +0000
X-UUID: 3bc57385f8044ac282a5f5d791151373-20220822
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=1i4E44Nv8ZYq/yPV7FLKWZbANFWVm2e1L3wlbPyDfzw=;
	b=LQ9TCAlakGmvC11y7pJLX1/og2pO1b4AwMjpLjCeYTFlHXFLrfhqcCsHdsSIT2a/UAzyY2X37L3e+xSnK8EUv9XwcL2S38MUNkUPTnA8j0XT4K3CC3dm+ozhExF4Wu5tDB5kKC+Om7W3t0X006Ofp8cVUPKpWpW8EFVLV5cz22w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:5820c338-61a2-4be8-b725-9e96b6d5b710,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:7db86cc9-6b09-4f60-bf82-12f039f5d530,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 3bc57385f8044ac282a5f5d791151373-20220822
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 904029654; Mon, 22 Aug 2022 06:02:14 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 22 Aug 2022 21:01:38 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 22 Aug 2022 21:01:37 +0800
Message-ID: <6e442f4f95f208734ee9c27819cfe9972b62cf10.camel@mediatek.com>
Subject: Re: [PATCH v2,2/2] drm: mediatek: Adjust the dpi output format to
 MT8186
From: xinlei.lee <xinlei.lee@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jitao Shi
	<jitao.shi@mediatek.com>
Date: Mon, 22 Aug 2022 21:01:52 +0800
In-Reply-To: <20220819184311.4ty3hkzfdrrdg4sd@notapiano>
References: <1659693461-27057-1-git-send-email-xinlei.lee@mediatek.com>
	 <1659693461-27057-3-git-send-email-xinlei.lee@mediatek.com>
	 <20220819184311.4ty3hkzfdrrdg4sd@notapiano>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_060224_358507_66D32E99 
X-CRM114-Status: GOOD (  21.48  )
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

On Fri, 2022-08-19 at 14:43 -0400, Nícolas F. R. A. Prado wrote:
> Hi Xinlei,
> 
> On Fri, Aug 05, 2022 at 05:57:41PM +0800, xinlei.lee@mediatek.com
> wrote:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > Dpi output needs to adjust the output format to dual edge for
> > MT8186.
> 
> Could you explain a bit more why this is needed? What does this
> configuration
> do? And why is MMSYS involved in a DPI configuration?
> 
> Also, is this a configuration specific to MT8186? I enabled the flag
> on MT8192
> just to test and didn't see any difference in behavior.
> 
> > 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> 
> If Jitao also helped in the writing of this code, then there should
> also be a
> co-developed-by tag for Jitao before the Signed-off-by [1].
> 
> [1] 
> https://urldefense.com/v3/__https://www.kernel.org/doc/html/latest/process/submitting-patches.html*when-to-use-acked-by-cc-and-co-developed-by__;Iw!!CTRNKA9wMg0ARbw!wlM0Ma8TeMR5EM0eUg1Z1JIDK_SF5rATf2UtVFJATWlzCSYABFbhD8yIo-_YxePWwQ$
>  
> 
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> [..]
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> 
> [..]
> > @@ -151,6 +154,7 @@ struct mtk_dpi_conf {
> >  	u32 yuv422_en_bit;
> >  	u32 csc_enable_bit;
> >  	u32 pixels_per_iter;
> > +	bool rgb888_dual_enable;
> 
> You're missing a description of this property in the struct's comment
> above:
> 
> drivers/gpu/drm/mediatek/mtk_dpi.c:160: warning: Function parameter
> or member 'rgb888_dual_enable' not described in 'mtk_dpi_conf'
> 
> Thanks,
> Nícolas

Hi Nícolas:

Thanks for your careful review.

First of all, MT8186 needs to set this bit of MMSYS because HW has been
modified at that time, SW needs to cooperate.
And the register (MMSYS) reserved for dpi will be used for output
format control (dual_edge/single_edge).
Since it is a modification for
MT8186, setting it on MT8192 will not have any effect.

If there are no other comments, I will revise it in the next edition:
1. Modify the label of jitao to Co-developed-by;
2. Add missing a description of this property in the mtk_dpi_conf.

Best Regards!
Xinlei




