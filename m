Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03C8ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 15:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pebu//LNoUG2NIqwxfaGrjhmeU4sr73Ut1cSeMoMSo8=; b=aSqNMQx++IaeQka+RJQxutREIO
	CWUIieybeLfYTWr5NTm5vj/K71WLU+gF8YrJ/PIMj+AYY+HMkFo3Tx27i1ZOQMjE8sSU7QEboT0MH
	FrT2/B21dNhr5lFXh4GXzoIHyWdW66X/12NoC6Bd6XMIYO3yfd79MTM6N8d/d6ZdOWOuZvWmxhupV
	u9c8TMq/FXvenTmkXmIvIlbnWzw8Ed/Ci0QT7wFEmbzt4D9IJFUwxQx7fq2JpGmmVe1ZYVGWJw+IN
	/kFLJGw2WMauAvHFFYV89JSHIkwwU6W8I63AMWxTypNYcMVfOgGjVwv0eBK9rYhoeHSiw0++FLYhy
	/4z8PM3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVaJ4-00EfHi-MN; Tue, 06 Sep 2022 15:16:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVZTa-00EG6N-Ee; Tue, 06 Sep 2022 14:22:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E9C3C614C9;
	Tue,  6 Sep 2022 14:22:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC3BFC433C1;
	Tue,  6 Sep 2022 14:22:49 +0000 (UTC)
Message-ID: <471a1c42-0054-e0be-be18-9723c35f418a@xs4all.nl>
Date: Tue, 6 Sep 2022 16:22:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [V7,0/8] Support multi-hardware jpeg decoder for MT8195
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
References: <20220826092904.10283-1-irui.wang@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220826092904.10283-1-irui.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_072254_631508_AB622230 
X-CRM114-Status: GOOD (  24.25  )
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

On 26/08/2022 11:28, Irui Wang wrote:
> From: kyrie wu <kyrie.wu@mediatek.com>
> 
> This series adds support for multi hardware jpeg decoding,
> by first adding use of_platform_populate to manage each hardware
> information: interrupt, clock, register bases and power.
> Secondly add decoding work queue to deal with the decoding requests
> of multi-hardware at the same time. Lastly, add output picture
> reorder function interface to eliminate the out of order images.
> 
> This series has been tested with both MT8195.
> Decoding worked for this chip.

When building this I get the following sparse warning and several kerneldoc
warnings:

SPARSE:drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:661:24: warning: symbol 'mtk_jpegdec_hw_driver' was not declared. Should it be static?

kerneldoc: WARNINGS
drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h:127: warning: Function parameter or member 'clks' not described in 'mtk_jpegdec_clk'
drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h:127: warning: Function parameter or member 'clk_num' not described in 'mtk_jpegdec_clk'
drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h:178: warning: Function parameter or member 'job_timeout_work' not described in 'mtk_jpegdec_comp_dev'
drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h:178: warning: Function parameter or member 'hw_param' not described in 'mtk_jpegdec_comp_dev'
drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h:178: warning: Function parameter or member 'hw_state' not described in 'mtk_jpegdec_comp_dev'
drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h:178: warning: Function parameter or member 'hw_lock' not described in 'mtk_jpegdec_comp_dev'
drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h:219: warning: Function parameter or member 'reg_decbase' not described in 'mtk_jpeg_dev'
drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h:219: warning: Function parameter or member 'dec_hw_dev' not described in 'mtk_jpeg_dev'
drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h:219: warning: Function parameter or member 'is_jpgdec_multihw' not described in 'mtk_jpeg_dev'
drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h:219: warning: Function parameter or member 'dec_hw_wq' not described in 'mtk_jpeg_dev'
drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h:219: warning: Function parameter or member 'dec_workqueue' not described in 'mtk_jpeg_dev'
drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h:219: warning: Function parameter or member 'dechw_rdy' not described in 'mtk_jpeg_dev'

Can you fix this in a v8?

BTW, you can also choose to combine the jpeg encoder series with this series into one single series.
I'll be merging them together anyway. That's up to you, though.

Regards,

	Hans

> 
> Patch 1 Adds jpeg decoder dt-bindings for mt8195
> 
> Patches 2 jpeg decoder builds three module for using Multi-HW,
> export some functions to make them visible by other modules.
> 
> Patch 3 use of_platform_populate to manage multi-hardware.
> 
> Patch 4 add jpeg decoding timeout function to judge hardware timeout.
> 
> Patch 5 add decoding work queue to deal with multi-hardware decoding
> at the same time.
> 
> Patch 6 add output picture reorder function to order images.
> 
> Patch 7 refactor jpegdec func interface for HW working.
> 
> Patch 8 add stop cmd function to deal with EOS operation.
> 
> ---
> This series patches dependent on:
> media_stage tree:
> [1]
> https://git.linuxtv.org/media_stage.git/commit/?id=b3627647f9ea7473d10fb08a95fd7c4133a17ca4
> 
> patch1 new jpegdec dt-bindings included files
> [2] MM IOMMU binding:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20220217113453.13658-2-yong.wu@mediatek.com/
> 
> [3] MT8195 power domain:
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=580579
> 
> Changes compared with v6:
> - some modifications for patch v6's review comments.
> 
> Changes compared with v5:
> - some modifications for patch v5's review comments.
> - fix yaml file check errors.
> 
> Changes compared with v4:
> - some modifications for patch v4's review comments.
> - fix Gstreamer test errors.
> 
> Changes compared with v3:
> - some modifications for patch v3's review comments.
> 
> Changes compared with v2:
> - add stop cmd function.
> - some modifications for patch v1's review comments.
> 
> Changes compared with v1:
> - new yaml file for mt8195 jpeg decoder.
> - some modifications for patch v1's review comments.
> 
> kyrie wu (8):
>   dt-bindings: mediatek: Add mediatek,mt8195-jpgdec compatible
>   media: mtk-jpegdec: export jpeg decoder functions
>   media: mtk-jpegdec: support jpegdec multi-hardware
>   media: mtk-jpegdec: add jpegdec timeout func interface
>   media: mtk-jpegdec: add jpeg decode worker interface
>   media: mtk-jpegdec: add output pic reorder interface
>   media: mtk-jpegdec: refactor jpegdec func interface
>   mtk-jpegdec: add stop cmd interface for jpgdec
> 
>  .../media/mediatek,mt8195-jpegdec.yaml        | 169 ++++++++++
>  drivers/media/platform/mediatek/jpeg/Makefile |   5 +-
>  .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 233 ++++++++++++-
>  .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  46 +++
>  .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 314 ++++++++++++++++--
>  .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.h  |   3 +-
>  .../platform/mediatek/jpeg/mtk_jpeg_dec_reg.h |   1 +
>  7 files changed, 739 insertions(+), 32 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
> 


