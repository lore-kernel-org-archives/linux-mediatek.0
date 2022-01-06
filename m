Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CF6C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jan 2022 08:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UPPIuts9ZRu8RWlqYmNllsppn/mXHox/zXK1E6+L2U4=; b=jKo+EUzPFcC0vV
	PIclEPMWrlM2Wp1JWQZrr4Su+qOLBcz4L7wRYnaQ2qsRS/Hi/10R86cqXApCR2PVFkRMVLlLYg+sN
	zyhqLB4J/fgKHNPXZgvG4WP6h3dME4AV0rCISqgFVB41lel1VoU19+fHSdm3vTJgCZJrGGXg+reOL
	5aADwELEuTsqjBUPTWesvLm8n44eRidlDbw4kNclxDkSEda52UrV1p5qJoznmtwaSh3ZYNak5aJCh
	NDQDUytqYpSns14KAGQ7/4FobmtOM6ulwU/AvZCWTh3Zkf1OM/imKw71/N97ifpfJXXEk5hhgRNmL
	cUZBGpvNYDUqRXA34+7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5Nlj-00GwSI-SZ; Thu, 06 Jan 2022 08:05:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5NlX-00GwOv-5q; Thu, 06 Jan 2022 08:04:56 +0000
X-UUID: 105b6a6c9e1842a7a01b0babdfb541b6-20220106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=tAiMJp6F0+k+2NKqXb7dn5HSQjmwd97BBdyqgfvVzc8=; 
 b=ZIJO0LcRX0Cap3hVlhzV1oqCAVPGxV+WADPM43Twf/QC/0WBkZc410YC+fuI36Hf06OrNy+eFMVEi4YkxzAF4Q5QLe3aSapOD4CPZn9GQ1yBuz17CkeRzUgARUmQdmXoEm9DO3NlCPY28D1wLcO4Qn9d8fsjv8f9bvmkwdj4omw=;
X-UUID: 105b6a6c9e1842a7a01b0babdfb541b6-20220106
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 787518925; Thu, 06 Jan 2022 01:04:52 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Jan 2022 00:04:50 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 6 Jan 2022 16:04:49 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 6 Jan 2022 16:04:48 +0800
Message-ID: <61a813f02d90829c4df47d9ca7f26553e2b3deb3.camel@mediatek.com>
Subject: Re: [PATCH V6, 0/5] Support multi-hardware jpeg encoding using
 of_platform_populate
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Ricardo Ribalda <ribalda@chromium.org>
CC: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Tomasz Figa
 <tfiga@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <xia.jiang@mediatek.com>,
 <maoguang.meng@mediatek.com>, <srv_heupstream@mediatek.com>,
 <irui.wang@mediatek.com>, <kyrie.wu@mediatek.com>
Date: Thu, 6 Jan 2022 16:04:48 +0800
In-Reply-To: <Yaod22NaGQveuevu@gmail.com>
References: <1638501230-13417-1-git-send-email-kyrie.wu@mediatek.com>
 <Yaod22NaGQveuevu@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_000455_255451_45DC5A70 
X-CRM114-Status: GOOD (  27.46  )
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

On Fri, 2021-12-03 at 14:38 +0100, Ricardo Ribalda wrote:
> Hi
> 
> Any idea why this series is not available at
> https://patchwork.linuxtv.org/ but it exists in 
> 
https://lore.kernel.org/all/1638501230-13417-1-git-send-email-kyrie.wu@mediatek.com/#r
> 
> thanks!
I will fix this issue in the next code version, thanks.
> 
> kyrie.wu wrote:
> 
> > This series adds support for multi hardware jpeg encoding, by first
> > adding use of_platform_populate to manage each hardware
> > information:
> > interrupt, clock, register bases and power. Secondly add encoding 
> > work queue to deal with the encoding requestsof multi-hardware
> > at the same time. Lastly, add output picture reorder function
> > interface to eliminate the out of order images.
> > 
> > This series has been tested with both MT8195.
> > Encoding worked for this chip.
> > 
> > Patches 1~2 use of_platform_populate to replace component framework
> > to manage multi-hardware.
> > 
> > Patch 3 add jpeg encoding timeout function to judge hardware
> > timeout.
> > 
> > Patch 4 add encoding work queue to deal with multi-hardware
> > encoding
> > at the same time.
> > 
> > Patch 5 add output picture reorder function to order images.
> > ---
> > Changes compared with v5:
> > - use of_platform_populate to replace component framework to
> > manage multi-hardware in patch 2.
> > 
> > Changes compared with v4:
> > --No change compaered with v4
> > 
> > Changes compared with v3:
> > --Structure patches for consistency, non-backward
> >   compatible and do not break any existing functionality
> > 
> > Changes compared with v2:
> > --Split the last two patches into several patches
> >   to enhance readability
> > --Correct some syntax errors
> > --Explain why the component framework is used
> > 
> > Changes compared with v1:
> > --Add jpeg encoder dt-bindings for MT8195
> > --Use component framework to manage jpegenc HW
> > --Add jpegenc output pic reorder function interface
> > 
> > kyrie.wu (5):
> >   dt-bindings: mediatek: Add mediatek, mt8195-jpgenc compatible
> >   media: mtk-jpegenc: manage jpegenc multi-hardware
> >   media: mtk-jpegenc: add jpegenc timeout func interface
> >   media: mtk-jpegenc: add jpeg encode worker interface
> >   media: mtk-jpegenc: add output pic reorder interface
> > 
> >  .../bindings/media/mediatek-jpeg-encoder.yaml      |   3 +
> >  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c    | 287
> > +++++++++++++++----
> >  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h    |  91 +++++-
> >  drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c  |   1 +
> >  drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h  |   3 +-
> >  drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c  | 316
> > ++++++++++++++++++++-
> >  6 files changed, 644 insertions(+), 57 deletions(-)
> > 
> > -- 
> > 2.6.4
> > 
> > 
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
