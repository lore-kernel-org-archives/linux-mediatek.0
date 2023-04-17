Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE02CC77B72
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Apr 2023 09:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3d3ifGtWAm1seKmtTc8VKrnsqJUi9hIvXWARZZ37dzY=; b=O6IwCvKvz40lxzwUVYAKnzCRzA
	hmdbtlyRwq+fYq4QMU15aU0cK1pN1CV+HPxwEgP5TUqEPrz6F7363QbhotzVzfe8Fi55uRErVqjdM
	d4Y4OsLzY7Wl+W7pLn/C/SYi+7R8MjzvpO7gaDIZtwKkWmLwuGUhRQVyPBDoq9pZx44zKMgU1gpTH
	6BzD0ZbsBTDaGSsHSyHtQzWX0d7OWrI8VOzrQ5nnU8eDidmn9eRkUS97K44X2aXaNpGrnv1c+fbsa
	GDrQphnV/PG0S946KdRZwShtWMqIRYDEpiLF0nkQseDqQDQEbd3kdf3Ip3d8q+uUtmGUtA6JpDKfc
	tbSUE7NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poLGx-00Faj9-1R;
	Mon, 17 Apr 2023 09:35:43 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poLGt-00Fai3-2E;
	Mon, 17 Apr 2023 09:35:41 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B68B16603050;
	Mon, 17 Apr 2023 10:35:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681724137;
	bh=QbaAg8NSbQhZf+R83qw59tCN5hywaWcaUrmWKWZXTyU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HVjqv50rUaQjAKGVeiL4GIggSCWrywwXkSBKv4hPhGrFXDt+vIPS+IfPfzAVz9naa
	 DNGl31fkP2Pu0NAaB9QS6GV9HxZfbvhsWrEzVD24UVeWUvcmg1LQejIhWi4+kzJ4Rb
	 6IDUpwIEvmbsr0t5A+gwU5LMNhG3xX0+LYumN/7wcg9zGCPdwY2ShdlTq0yo0cShMU
	 9aMeRmhaUy7zEazoIuicOn1T+pQUbrML12lyttXfyRzoDPSB7REkmVqdhjKGtGyXvd
	 BXg3Pk75kpM6PPGu/Ec+I4kTMmHTt/m2UzNXAqUCFP1R1/uPvuIjkIVc8+qqbPZuAN
	 44K0Jvb5n0MLA==
Message-ID: <c1533e76-b8a2-70e6-d144-d53b26c9b952@collabora.com>
Date: Mon, 17 Apr 2023 11:35:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 5/6] media: mediatek: vcodec: move core context from
 device to each instance
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230417054816.17097-1-yunfei.dong@mediatek.com>
 <20230417054816.17097-6-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230417054816.17097-6-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_023539_859228_D0FD793C 
X-CRM114-Status: GOOD (  19.57  )
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

Il 17/04/23 07:48, Yunfei Dong ha scritto:
> There are so many lat buffer in core context list, some instances
> maybe be scheduled for a very long time. Moving the core context to
> each instance, it only be used to control lat buffer of each instance.
> And the core work queue of each instance is scheduled by system.
> 
> Fixes: 2cfca6c1bf80 ("media: mediatek: vcodec: move lat_buf to the top of core list")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>   .../mediatek/vcodec/mtk_vcodec_dec_drv.c      |  1 -
>   .../platform/mediatek/vcodec/mtk_vcodec_drv.h |  2 -
>   .../vcodec/vdec/vdec_h264_req_multi_if.c      |  4 +-
>   .../vcodec/vdec/vdec_vp9_req_lat_if.c         |  2 +-
>   .../platform/mediatek/vcodec/vdec_msg_queue.c | 53 +++++++------------
>   .../platform/mediatek/vcodec/vdec_msg_queue.h |  6 ++-
>   6 files changed, 25 insertions(+), 43 deletions(-)
> 

..snip..

> diff --git a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
> index a80b9853cec9..ae37d020a1bd 100644
> --- a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
> +++ b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
> @@ -83,10 +83,11 @@ struct vdec_lat_buf {
>    * @wdma_wptr_addr: ube write point
>    * @core_work: core hardware work
>    * @lat_ctx: used to store lat buffer list
> - * @ctx: point to mtk_vcodec_ctx
> + * @core_ctx: used to store core buffer list
>    *
>    * @lat_list_cnt: used to record each instance lat list count
>    * @core_list_cnt: used to record each instance core list count
> + * @flush_done: core flush done status
>    * @empty_lat_buf: the last lat buf used to flush decode
>    * @core_dec_done: core work queue decode done event
>    * @status: current context decode status for core hardware
> @@ -100,10 +101,11 @@ struct vdec_msg_queue {
>   
>   	struct work_struct core_work;
>   	struct vdec_msg_queue_ctx lat_ctx;
> -	struct mtk_vcodec_ctx *ctx;
> +	struct vdec_msg_queue_ctx core_ctx;
>   
>   	atomic_t lat_list_cnt;
>   	atomic_t core_list_cnt;
> +	bool flush_done;

flush_done is used in patch [6/6]: this does not belong to this patch,
please move the addition of this member in the same patch where you use it.

Regards,
Angelo

