Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EDC0C61DD3
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2026 06:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tbhQo1C6TdPsTdJu3IOx+JBLZvNXuGNrIgAZrg4gMGY=; b=QCqcc6BlWW4Ci0RGx2XwqHFHbR
	fU+QoieUmCVXmmyfPcjNTekNsG8RK0ckApMCfP+4EXrZ8+0pB60jhemQ2f+OMu38w9tmxTTuzIgfv
	aLTM38iaDOZIsGOpxSOgGOTKbgwJ36DSu7h6YFahp8Ki/ulaOudabW/V5b6sK9AJQeNj6qdDCr5N/
	gw3LFZHvJYcxhzAfQm4wgCTf/RPo5NRJqMPDoGFqzOIddWh5eyfKjguMBjoYgmXRDA3yC2aCoQF5S
	3/Z47TR19zBoBFnEhdglWdYDIsbjvDFpZqODjW/yCvCY6z2xO7xkUv4aUQRtIaEHfl1y5u/zVLyIC
	PmpzT6cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21Ie-0000000GVvZ-3M1T;
	Thu, 03 Sep 2026 06:51:52 +0000
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21Ib-0000000GVut-3PXP;
	Thu, 03 Sep 2026 06:51:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1788418303; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JvuMvDYG5fsGmgflGdZp5v1ute+FDtWL4w9qMGnapMlVsA00nTQLSTbeOK1aqnyQ/MDZWWBU9CGkIuAaR9oATPqQINNwj79Qpl7bmSk/6EKNEyy8uEAnBchY4TrwbrEueq8snpV+bSX6UeFJDTTK/CvRrQfNtWT3JO0d9mf5TtI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788418303; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tbhQo1C6TdPsTdJu3IOx+JBLZvNXuGNrIgAZrg4gMGY=; 
	b=Qc529jvy4LldeoDbP/FJVVSJjUtb5cNwz+5oDsp9Q5IdnHMpE0GQ+O1dZ0wyFSOgmYFUM3hF+zp398wj1GU/XrFbeqiEtlSwrZ7F9lDgJhqlDDsgb9QtikhU3diJyxOAJpygdOYqMVnhPjBZdmMfX1vjBlO0B2U0cTL3KkHYfSU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788418303;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=tbhQo1C6TdPsTdJu3IOx+JBLZvNXuGNrIgAZrg4gMGY=;
	b=dapLq44p8p+4sua8rTiEvL/qFd/9LGNHjFheeBya0U4U5qLotQc3SPAlnNYWajMU
	iM48g52T8RKF2I5Yrck3gwsEG/ZpY6G/xEpLvGoy3nf3DsdGiNkOOHmx3W3MylLQTNl
	hxGHD3k8opa56voc1U6aqc1r8cF5PggRT+Uo2gpw=
Received: by mx.zohomail.com with SMTPS id 1788418301780612.0505181546034;
	Wed, 2 Sep 2026 23:51:41 -0700 (PDT)
Message-ID: <628a89f0-0fa7-4304-9bd6-c7e3ad967ca6@collabora.com>
Date: Thu, 3 Sep 2026 08:51:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] media: verisilicon: hantro: bound G2 HEVC tile
 loop to the buffer capacity
To: Michael Bommarito <michael.bommarito@gmail.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Jonas Karlman <jonas@kwiboo.se>,
 Heiko Stuebner <heiko@sntech.de>, Kees Cook <kees@kernel.org>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260617021906.2746743-1-michael.bommarito@gmail.com>
 <20260617021906.2746743-6-michael.bommarito@gmail.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20260617021906.2746743-6-michael.bommarito@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_235149_895954_4548DDC6 
X-CRM114-Status: GOOD (  14.07  )
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


Le 17/06/2026 à 04:19, Michael Bommarito a écrit :
> prepare_tile_info_buffer() writes one entry per tile into the tile_sizes
> DMA buffer, sized for a grid equal to the PPS uAPI array capacity. Use the
> bounded v4l2_hevc_pps_num_tile_columns() / v4l2_hevc_pps_num_tile_rows()
> helpers so the loops stay inside the buffer.
>
> Fixes: cb5dd5a0fa51 ("media: hantro: Introduce G2/HEVC decoder")
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>

Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

> ---
>   drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
> index e8c2e83379def..e7a7c7a42467a 100644
> --- a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
> +++ b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
> @@ -5,6 +5,8 @@
>    * Copyright (C) 2020 Safran Passenger Innovations LLC
>    */
>   
> +#include <media/v4l2-hevc.h>
> +
>   #include "hantro_hw.h"
>   #include "hantro_g2_regs.h"
>   
> @@ -15,8 +17,8 @@ static void prepare_tile_info_buffer(struct hantro_ctx *ctx)
>   	const struct v4l2_ctrl_hevc_pps *pps = ctrls->pps;
>   	const struct v4l2_ctrl_hevc_sps *sps = ctrls->sps;
>   	u16 *p = (u16 *)((u8 *)ctx->hevc_dec.tile_sizes.cpu);
> -	unsigned int num_tile_rows = pps->num_tile_rows_minus1 + 1;
> -	unsigned int num_tile_cols = pps->num_tile_columns_minus1 + 1;
> +	unsigned int num_tile_rows = v4l2_hevc_pps_num_tile_rows(pps);
> +	unsigned int num_tile_cols = v4l2_hevc_pps_num_tile_columns(pps);
>   	unsigned int pic_width_in_ctbs, pic_height_in_ctbs;
>   	unsigned int max_log2_ctb_size, ctb_size;
>   	bool tiles_enabled, uniform_spacing;

