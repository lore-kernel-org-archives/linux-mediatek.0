Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE8AC77B73
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 09:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H04SfkLVT+Iu5PXOCCRindsA0egkTBUvmOhcrJZkV2A=; b=DVrMsBKTICj8+OCRcuuV+QIx5w
	2Y49zOx7EbChh1hsqrt4Q/8pDUVQvmA4Z6qsWmV5jTqs4VcpaK/0QekSLlv7duSk3NNNxLNW+5+Jr
	EvUuFa3eQhiMFcTBXTCRg9529s7Dwjo8ycBMFD8xwgYu5ezoZ70Kqtmhm71eOBlrnjw/T3iw00r88
	EzL2+jFrs/JYryV6VQdHm0jEdIU5oZ9OdfQqhtdNMW2r9eJbGzkTRg1im1DNKKoO5r/rZSC7YyyvF
	tXprGB0m1xcxkl9vl9rNlDjaWRWSCuRfMT2eiCl1o3bLdbgfpK2PQj3m0pk5OUwFdrhvo2C8ASkeV
	SyMXMwuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1kn6-00CxgL-2a;
	Wed, 24 May 2023 09:28:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1kmr-00CxbI-29;
	Wed, 24 May 2023 09:28:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DFDAF63349;
	Wed, 24 May 2023 09:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD8B2C433D2;
	Wed, 24 May 2023 09:28:00 +0000 (UTC)
Message-ID: <b5c45ac7-64ad-ddc1-a7a2-99d9d1c27ca7@xs4all.nl>
Date: Wed, 24 May 2023 11:27:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7,0/2] media: mediatek: vcodec: add hevc stateless
 decoder driver in MT8195
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230524080739.17264-1-yunfei.dong@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230524080739.17264-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_022805_758722_C7D04E32 
X-CRM114-Status: GOOD (  17.98  )
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

Hi Yunfei,

On 24/05/2023 10:07, Yunfei Dong wrote:
> Add hevc stateless decoder driver to support hardware decode in MT8195, and the driver
> need num_delta_pocs_of_ref_rps_idx value to parse slice header short_term_ref_pic_set().
> 
> patch 1 add num_delta_pocs_of_ref_rps_idx field.
> patch 2 add hevc stateless decoder driver.

This series clashes with this older series from you:

https://patchwork.linuxtv.org/project/linux-media/cover/20230424060130.18395-1-yunfei.dong@mediatek.com/

Can you post a v8 that sits on top of that older series?

Regards,

	Hans

> ---
> Changed from v6:
> - fix AngeloGioacchino's suggestion.
> 
> Changed from v5:
> - checkpatch/kernel-doc pass/build pass.
> - fix warning: struct vdec_av1_slice_fb -> struct vdec_hevc_slice_fb.
> - fix warning: remove unused comment for param "trans_start" and "trans_end"
> 
> Changed from v4:
> - fix some comments according to Nathan's suggestion.
> 
> Changed from v3:
> - add the dependency patch to this patch series for patch 1.
> 
> Changed from v2:
> - fix one build warning.
> - add the dependency patch link.
> 
> Changed from v1:
> - fix build error when build 32bit system.
> - hevc fluster test result: 132/147 (not support: 10bit => 11 and resolution => 4).
> ---
> Benjamin Gaignard (1):
>   media: uapi: HEVC: Add num_delta_pocs_of_ref_rps_idx field
> 
> Yunfei Dong (1):
>   media: mediatek: vcodec: support stateless hevc decoder
> 
>  .../media/v4l/ext-ctrls-codec-stateless.rst   |    7 +
>  .../media/platform/mediatek/vcodec/Makefile   |    1 +
>  .../vcodec/mtk_vcodec_dec_stateless.c         |   59 +-
>  .../platform/mediatek/vcodec/mtk_vcodec_drv.h |    1 +
>  .../vcodec/vdec/vdec_hevc_req_multi_if.c      | 1097 +++++++++++++++++
>  .../platform/mediatek/vcodec/vdec_drv_if.c    |    4 +
>  .../platform/mediatek/vcodec/vdec_drv_if.h    |    1 +
>  include/uapi/linux/v4l2-controls.h            |    6 +-
>  8 files changed, 1174 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/media/platform/mediatek/vcodec/vdec/vdec_hevc_req_multi_if.c
> 


