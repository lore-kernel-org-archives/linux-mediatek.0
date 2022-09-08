Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525BCECAAD5
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 08:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1wBOf56+1du5Vv+BAJnq7hK9mEe0qklihGQxEqmktk8=; b=eR5OoL14mESBZO68hQ7LIUSn6h
	v96OmNGwALdeTukF+uQduOtDHByLlzoYx4ylcxGT/ZDTAEQNAawHlWPqkGRPSC3teRli9TgW6cZ//
	XHW8vIOzOp3uY0QT6puABDouAsMRYalGR/D4XDW6rRpnRy7YU8akqBd/2m8oNU8RExlGgLF/O66Ba
	arXpePjxkTpkKacnN/4nOZ7Drt3duOmOEQ7c1HXzOT9u9KIJhAaEYncDMsOFlqBtCgJQErFJcal5P
	jhn1Pub5LvP6HDNEjWIw2feKvyvg6TisVLT9NJ5PRCVlwPRUwCJ7glyIDiKi98U+lklxDqxvToqV7
	lURXU1jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWCkh-001008-Je; Thu, 08 Sep 2022 08:19:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWCkc-000zqh-6S; Thu, 08 Sep 2022 08:19:10 +0000
X-UUID: e0350c62c0a04d5590df93504ce9341a-20220908
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=1wBOf56+1du5Vv+BAJnq7hK9mEe0qklihGQxEqmktk8=;
	b=LsWWprPzI6A1/1iJZkziBF/dLlADx7OH1LmI4X+9Q0Iw6pH/v7ruVKX0pRA7hyBBLFQfEWyopNAZq0tFG8pOTi6i7gJaUys7r55HTJORxqfKSj7UhadXD1NTlOVZuP0d8YX89yYCe+mccjbvSzKo1O9vhuq0UfnqHK/qSNcbRwk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:4fa9e348-0202-44b9-baa7-9f87d620001f,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:e7741757-e800-47dc-8adf-0c936acf4f1b,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e0350c62c0a04d5590df93504ce9341a-20220908
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 941628467; Thu, 08 Sep 2022 01:18:29 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 8 Sep 2022 15:27:54 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 8 Sep 2022 15:27:53 +0800
Message-ID: <f227bbfb2904d11972eb2190e44f4a7bb81d87e3.camel@mediatek.com>
Subject: Re: [V7,0/8] Support multi-hardware jpeg decoder for MT8195
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Irui Wang
	<irui.wang@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Tzung-Bi Shih <tzungbi@chromium.org>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	<wenst@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
	<xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>
Date: Thu, 8 Sep 2022 15:27:53 +0800
In-Reply-To: <471a1c42-0054-e0be-be18-9723c35f418a@xs4all.nl>
References: <20220826092904.10283-1-irui.wang@mediatek.com>
	 <471a1c42-0054-e0be-be18-9723c35f418a@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_011906_277504_C26B1F7A 
X-CRM114-Status: GOOD (  30.99  )
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

On Tue, 2022-09-06 at 16:22 +0200, Hans Verkuil wrote:
> Hi Irui,
> 
> On 26/08/2022 11:28, Irui Wang wrote:
> > From: kyrie wu <kyrie.wu@mediatek.com>
> > 
> > This series adds support for multi hardware jpeg decoding,
> > by first adding use of_platform_populate to manage each hardware
> > information: interrupt, clock, register bases and power.
> > Secondly add decoding work queue to deal with the decoding requests
> > of multi-hardware at the same time. Lastly, add output picture
> > reorder function interface to eliminate the out of order images.
> > 
> > This series has been tested with both MT8195.
> > Decoding worked for this chip.
> 
> When building this I get the following sparse warning and several
> kerneldoc
> warnings:
> 
> SPARSE:drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:661:24:
> warning: symbol 'mtk_jpegdec_hw_driver' was not declared. Should it
> be static?
> 
> kerneldoc: WARNINGS
> drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h:127: warning:
> Function parameter or member 'clks' not described in
> 'mtk_jpegdec_clk'
> drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h:127: warning:
> Function parameter or member 'clk_num' not described in
> 'mtk_jpegdec_clk'
> drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h:178: warning:
> Function parameter or member 'job_timeout_work' not described in
> 'mtk_jpegdec_comp_dev'
> drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h:178: warning:
> Function parameter or member 'hw_param' not described in
> 'mtk_jpegdec_comp_dev'
> drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h:178: warning:
> Function parameter or member 'hw_state' not described in
> 'mtk_jpegdec_comp_dev'
> drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h:178: warning:
> Function parameter or member 'hw_lock' not described in
> 'mtk_jpegdec_comp_dev'
> drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h:219: warning:
> Function parameter or member 'reg_decbase' not described in
> 'mtk_jpeg_dev'
> drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h:219: warning:
> Function parameter or member 'dec_hw_dev' not described in
> 'mtk_jpeg_dev'
> drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h:219: warning:
> Function parameter or member 'is_jpgdec_multihw' not described in
> 'mtk_jpeg_dev'
> drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h:219: warning:
> Function parameter or member 'dec_hw_wq' not described in
> 'mtk_jpeg_dev'
> drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h:219: warning:
> Function parameter or member 'dec_workqueue' not described in
> 'mtk_jpeg_dev'
> drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h:219: warning:
> Function parameter or member 'dechw_rdy' not described in
> 'mtk_jpeg_dev'
> 
> Can you fix this in a v8?
> 
> BTW, you can also choose to combine the jpeg encoder series with this
> series into one single series.
> I'll be merging them together anyway. That's up to you, though.
> 
> Regards,
> 
> 	Hans

Hi Hans,

I will fix those problems you mentioned above,
and decoder patches & encoder patches would be combined to only one
series in the next version.

Thanks.

Regards,

kyrie.
> 
> > 
> > Patch 1 Adds jpeg decoder dt-bindings for mt8195
> > 
> > Patches 2 jpeg decoder builds three module for using Multi-HW,
> > export some functions to make them visible by other modules.
> > 
> > Patch 3 use of_platform_populate to manage multi-hardware.
> > 
> > Patch 4 add jpeg decoding timeout function to judge hardware
> > timeout.
> > 
> > Patch 5 add decoding work queue to deal with multi-hardware
> > decoding
> > at the same time.
> > 
> > Patch 6 add output picture reorder function to order images.
> > 
> > Patch 7 refactor jpegdec func interface for HW working.
> > 
> > Patch 8 add stop cmd function to deal with EOS operation.
> > 
> > ---
> > This series patches dependent on:
> > media_stage tree:
> > [1]
> > 
https://urldefense.com/v3/__https://git.linuxtv.org/media_stage.git/commit/?id=b3627647f9ea7473d10fb08a95fd7c4133a17ca4__;!!CTRNKA9wMg0ARbw!yWsNB0KDQUXPazES9aQVbOQCfVz3QXxMu8-1qBsF7ln07u35A2YPzpAMfUd3dJQt$
> >  
> > 
> > patch1 new jpegdec dt-bindings included files
> > [2] MM IOMMU binding:
> > 
https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20220217113453.13658-2-yong.wu@mediatek.com/__;!!CTRNKA9wMg0ARbw!yWsNB0KDQUXPazES9aQVbOQCfVz3QXxMu8-1qBsF7ln07u35A2YPzpAMfZHUWeCB$
> >  
> > 
> > [3] MT8195 power domain:
> > 
https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/list/?series=580579__;!!CTRNKA9wMg0ARbw!yWsNB0KDQUXPazES9aQVbOQCfVz3QXxMu8-1qBsF7ln07u35A2YPzpAMfSYzdPjN$
> >  
> > 
> > Changes compared with v6:
> > - some modifications for patch v6's review comments.
> > 
> > Changes compared with v5:
> > - some modifications for patch v5's review comments.
> > - fix yaml file check errors.
> > 
> > Changes compared with v4:
> > - some modifications for patch v4's review comments.
> > - fix Gstreamer test errors.
> > 
> > Changes compared with v3:
> > - some modifications for patch v3's review comments.
> > 
> > Changes compared with v2:
> > - add stop cmd function.
> > - some modifications for patch v1's review comments.
> > 
> > Changes compared with v1:
> > - new yaml file for mt8195 jpeg decoder.
> > - some modifications for patch v1's review comments.
> > 
> > kyrie wu (8):
> >   dt-bindings: mediatek: Add mediatek,mt8195-jpgdec compatible
> >   media: mtk-jpegdec: export jpeg decoder functions
> >   media: mtk-jpegdec: support jpegdec multi-hardware
> >   media: mtk-jpegdec: add jpegdec timeout func interface
> >   media: mtk-jpegdec: add jpeg decode worker interface
> >   media: mtk-jpegdec: add output pic reorder interface
> >   media: mtk-jpegdec: refactor jpegdec func interface
> >   mtk-jpegdec: add stop cmd interface for jpgdec
> > 
> >  .../media/mediatek,mt8195-jpegdec.yaml        | 169 ++++++++++
> >  drivers/media/platform/mediatek/jpeg/Makefile |   5 +-
> >  .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 233 ++++++++++++-
> >  .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  46 +++
> >  .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 314
> > ++++++++++++++++--
> >  .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.h  |   3 +-
> >  .../platform/mediatek/jpeg/mtk_jpeg_dec_reg.h |   1 +
> >  7 files changed, 739 insertions(+), 32 deletions(-)
> >  create mode 100644
> > Documentation/devicetree/bindings/media/mediatek,mt8195-
> > jpegdec.yaml
> > 
> 
> 


