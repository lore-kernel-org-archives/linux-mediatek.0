Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD6EECAAD5
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 15:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AsdRGrs87kf0i8+EWyw8r2HvTKLRvVLu6cd9HilCCdQ=; b=wN6n7/x8pULi8dupD9aTD9HK4c
	8Qk9r3kbRHhq1AwQGmK6jYFC16o8C4rB4CVtdDiWe9mDArgesNxjClCSUpmwD6lBreG9SJ2KZlfBE
	csnwM5rokPgoZljtX1mX7AJmx+Vt45R10VLM9h2iXudpq2X9xNzGmv9Z9Evyt19qptWyMb8GeBnY2
	eKJwLbxJy/ENChAaIuf2obL/u0WcTwG7xwtLVrN0VM66/e4dwPdqJ71k5UQ0EdfSZOGDvmh3dOZjG
	/M9Qt4PsW03FeuW+o57/xlTfVIyN5Ldmm+Zm1c7rcNEg/nzD1CZIFQRA1Z8OrxpWjiD1kjAH+wERR
	rQmvf1+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVaBa-00EaTc-5p; Tue, 06 Sep 2022 15:08:22 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVZG5-00E9sM-Rv; Tue, 06 Sep 2022 14:08:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 789B5B81637;
	Tue,  6 Sep 2022 14:08:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1D08C433C1;
	Tue,  6 Sep 2022 14:08:51 +0000 (UTC)
Message-ID: <918ec569-8dde-2b5d-b623-b35eaf9ce11c@xs4all.nl>
Date: Tue, 6 Sep 2022 16:08:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [V13,0/7] Enable two hardware jpeg encoder for MT8195
Content-Language: en-US
To: Irui Wang <irui.wang@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 angelogioacchino.delregno@collabora.com, nicolas.dufresne@collabora.com,
 wenst@chromium.org, kyrie wu <kyrie.wu@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Tomasz Figa <tfiga@chromium.org>,
 xia.jiang@mediatek.com, maoguang.meng@mediatek.com
References: <20220826092956.10340-1-irui.wang@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220826092956.10340-1-irui.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_070858_211266_E361A22E 
X-CRM114-Status: GOOD (  25.76  )
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

Hi Irui,

On 26/08/2022 11:29, Irui Wang wrote:
> From: kyrie wu <kyrie.wu@mediatek.com>
> 
> This series adds support for multi hardware jpeg encoding, by first
> adding use of_platform_populate to manage each hardware information:
> interrupt, clock, register bases and power. Secondly add encoding
> work queue to deal with the encoding requestsof multi-hardware
> at the same time. Lastly, add output picture reorder function
> interface to eliminate the out of order images.
> 
> This series has been tested with MT8195 Gstreamer.
> Encoding worked for this chip.

When building this I get a sparse warning and a number of kerneldoc
warnings:

sparse: WARNINGS
SPARSE:drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:401:24: warning: symbol 'mtk_jpegenc_hw_driver' was not declared. Should it be static?

kerneldoc: WARNINGS
drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h:111: warning: Function parameter or member 'clks' not described in 'mtk_jpegenc_clk'
drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h:111: warning: Function parameter or member 'clk_num' not described in 'mtk_jpegenc_clk'
drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h:173: warning: Function parameter or member 'reg_encbase' not described in 'mtk_jpeg_dev'
drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h:173: warning: Function parameter or member 'enc_hw_dev' not described in 'mtk_jpeg_dev'
drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h:173: warning: Function parameter or member 'is_jpgenc_multihw' not described in 'mtk_jpeg_dev'
drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h:173: warning: Function parameter or member 'enc_hw_wq' not described in 'mtk_jpeg_dev'
drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h:173: warning: Function parameter or member 'enchw_rdy' not described in 'mtk_jpeg_dev'
drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h:238: warning: Function parameter or member 'jpeg_work' not described in 'mtk_jpeg_ctx'
drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h:238: warning: Function parameter or member 'total_frame_num' not described in 'mtk_jpeg_ctx'
drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h:238: warning: Function parameter or member 'dst_done_queue' not described in 'mtk_jpeg_ctx'
drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h:238: warning: Function parameter or member 'done_queue_lock' not described in 'mtk_jpeg_ctx'
drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h:238: warning: Function parameter or member 'last_done_frame_num' not described in 'mtk_jpeg_ctx'

Can you fix this in a v14?

Thank you!

	Hans

> 
> Patches 1 Adds jpeg encoder dt-bindings for mt8195
> 
> Patches 2 jpeg encoder builds two module for using Multi-HW,
> export some functions to make them visible by other modules.
> 
> Patches 3 use devm_of_platform_populate to manage multi-hardware.
> 
> Patch 4 add jpeg encoding timeout function to judge hardware timeout.
> 
> Patch 5 add encoding work queue to deal with multi-hardware encoding
> at the same time.
> 
> Patch 6 add output picture reorder function to order images.
> 
> Patch 7 add stop cmd function to deal with EOS operation.
> ---
> This series patches dependent on:
> media_stage tree:
> [1]
> https://git.linuxtv.org/media_stage.git/commit/?id=b3627647f9ea7473d10fb08a95fd7c4133a17ca4
> 
> patch1 new jpegenc dt-bindings included files
> [2] MM IOMMU binding:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20220217113453.13658-2-yong.wu@mediatek.com/
> 
> [3] MT8195 power domain:
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=580579
> 
> Changes compared with v12:
> - some modifications for patch v12's review comments.
> 
> Changes compared with v11:
> - some modifications for patch v11's review comments.
> - fix yaml file check errors.
> 
> Changes compared with v10:
> - some modifications for patch v10's review comments.
> - fix Gstreamer test errors.
> 
> Changes compared with v9:
> - some modifications for patch v9's review comments.
> 
> Changes compared with v8:
> - some modifications for patch v8's review comments.
> - add stop cmd function.
> 
> Changes compared with v7:
> - some modifications for patch v6's review comments.
> 
> Changes compared with v6:
> - new yaml file for mt8195 jpeg encoder.
> - some modifications for patch v5's review comments.
> 
> Changes compared with v5:
> - use of_platform_populate to replace component framework to
>   manage multi-hardware in patch 2.
> 
> Changes compared with v4:
> - No change compaered with v4
> 
> Changes compared with v3:
> - Structure patches for consistency, non-backward
>   compatible and do not break any existing functionality
> 
> Changes compared with v2:
> - Split the last two patches into several patches
>   to enhance readability
> - Correct some syntax errors
> - Explain why the component framework is used
> 
> Changes compared with v1:
> - Add jpeg encoder dt-bindings for MT8195
> - Use component framework to manage jpegenc HW
> - Add jpegenc output pic reorder function interface
> 
> kyrie wu (7):
>   dt-bindings: mediatek: Add mediatek, mt8195-jpgenc compatible
>   mtk-jpegenc: export jpeg encoder functions
>   mtk-jpegenc: support jpegenc multi-hardware
>   mtk-jpegenc: add jpegenc timeout func interface
>   mtk-jpegenc: add jpeg encode worker interface
>   mtk-jpegenc: add output pic reorder interface
>   mtk-jpegenc: add stop cmd interface for jpgenc
> 
>  .../media/mediatek,mt8195-jpegenc.yaml        | 147 ++++++++++
>  drivers/media/platform/mediatek/jpeg/Makefile |  11 +-
>  .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 255 ++++++++++++++---
>  .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  81 +++++-
>  .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  |   1 +
>  .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.h  |   3 +-
>  .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 258 ++++++++++++++++++
>  7 files changed, 715 insertions(+), 41 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
> 


