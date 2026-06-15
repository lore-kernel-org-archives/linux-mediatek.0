Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2EFCCD98DE
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2026 08:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L70raBi7xNwc+2Br+uCDfzdAkIiZy0XXVEjj1ajOxWI=; b=BGMNwoJB4O7ghwekUg/mq6MxRM
	75otYBXMJqt0MZiT2F2zZUiE/xpiDhEciMVTqtsc/CFaBtijtdhnqVIMJFtqCj0T6H+/zwY0jAFvE
	taiTAfS/n9/PKhZ+HaK8rZNBt8XoyLUIFjEZz43SOWIOGumyht2jOxLp6moxNSUz5IzatttrteURS
	CT4fok0rcb+gsbtA7NI0u2QT2ETsUyAY9pflXySd8CNojZg7k5nMbghoBs7TVIjphu6XW/XfO6TxB
	RztUmBhZiAtAHGZT94fN6ZKyiXiSFqNHCPT4hwGA6+DLDJopIb4Dr7nqHd9PKjX7Abdly8Oos4hIf
	XlGu5mNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ2Np-0000000Dq7w-0zdY;
	Mon, 15 Jun 2026 08:09:25 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ2Nn-0000000Dq7M-2pgm
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Jun 2026 08:09:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781510961;
	bh=yW4U5hXymiw8RQc/72EbdFJ2Cc+gb4ZXqqQu1v7hOZU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=OedD4sIj+SKPZawYANkiIYEUgUocnLnDLWTVhglUXTaqMt2/z7wAnsc4s+1PdfaXX
	 +LPrqOarDLtQJq6R3Jhk85Zx0TgFejC37F6MEIRBn/TrCMViG4fTl58280m8NZGURK
	 ci9Dc9IrSF+azHR1kYu+oeP0qWdhb3pHDwdw9wRSfEgzH3WqZyRWfMpoaAHpzb6oVq
	 kumly4z8ulfvT9GGKe21le2lN0ibYRc9j9ZgMAN7/kMvkWBTwV2FXySaQLgSNT8CKc
	 izvesYmqSbXX8MFeHNkKhfryFfmRP4/YFz6cyXsm5OltAVaCVwKDuR5CY4vNvlO2rC
	 0SdO2j3I9opdg==
Received: from [100.64.1.43] (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 66DD817E0851
	for <linux-mediatek@lists.infradead.org>; Mon, 15 Jun 2026 10:09:21 +0200 (CEST)
Message-ID: <c84eff56-9b88-47f1-a07c-64470967bc32@collabora.com>
Date: Mon, 15 Jun 2026 10:09:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] media: verisilicon: hantro: bound G2 HEVC tile
 loop to the buffer capacity
To: linux-mediatek@lists.infradead.org
References: <20260614155609.3107600-1-michael.bommarito@gmail.com>
 <20260614155609.3107600-4-michael.bommarito@gmail.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20260614155609.3107600-4-michael.bommarito@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_010923_884247_D14B5616 
X-CRM114-Status: GOOD (  14.36  )
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


Le 14/06/2026 à 17:56, Michael Bommarito a écrit :
> prepare_tile_info_buffer() writes one entry per tile into the tile_sizes
> DMA buffer, sized for a grid equal to the PPS uAPI array capacity. Bound
> the loop to that capacity so the writes stay inside the buffer.
>
> Fixes: cb5dd5a0fa51 ("media: hantro: Introduce G2/HEVC decoder")
> Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
> Assisted-by: Claude:claude-opus-4-8
> ---
>   drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
> index e8c2e83379def..94fbd79885aa5 100644
> --- a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
> +++ b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
> @@ -22,6 +22,12 @@ static void prepare_tile_info_buffer(struct hantro_ctx *ctx)
>   	bool tiles_enabled, uniform_spacing;
>   	u32 no_chroma = 0;
>   
> +	/* Bound the loops to the tile_sizes buffer capacity. */
> +	num_tile_cols = min_t(unsigned int, num_tile_cols,
> +			      ARRAY_SIZE(pps->column_width_minus1));
> +	num_tile_rows = min_t(unsigned int, num_tile_rows,
> +			      ARRAY_SIZE(pps->row_height_minus1));
> +

The same code is duplicated in rkvdec driver.
To avoid this problem in the future can you create helpers to get those
values where boundaries are checked ?

Regards,
Benjamin

>   	tiles_enabled = !!(pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED);
>   	uniform_spacing = !!(pps->flags & V4L2_HEVC_PPS_FLAG_UNIFORM_SPACING);
>   

