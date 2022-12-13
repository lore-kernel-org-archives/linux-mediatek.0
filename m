Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF7EC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Dec 2022 09:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UAf/ZqaoTFiGYo2T0OFf0enXFEczKv5MY2AoqpMQdlc=; b=tN/W+FShMoCaI0bTUtv88NGt6F
	2uftpti5vm6vAboVNoJG3YJ66VLgtoIID1MvoHiLVO5tgsjjAYRs43C8rKwaz5U5orU3hkjVNPzdb
	VcJLRw2FHKDzkRYgXiEBqOWDob3ZhRCs/8ZtT0WYc/XfLqSBLA+rWCn6AWsTWfj+RUl3Wv5xywVFU
	7L1PvUrQ8VSVK6fgUgxwTrYC0LsZNNTObpKf5f7+Y0Y6KfBnfZVD9zzn+XVk3pzUIhyBFPxJ5dBQb
	BkgOp1ToRmRar2IZml+XN1zUj7Uxi8D+KnA8oCrcz1jLjWQWVFtwoixDlj7NVklL2hG7zVpPbCE2c
	eeA2JDKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p51Il-00EHEn-2z; Tue, 13 Dec 2022 09:10:15 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p51IZ-00EHBW-RP; Tue, 13 Dec 2022 09:10:05 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 72FB36602C2F;
	Tue, 13 Dec 2022 09:09:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670922597;
	bh=O7J/BSi0dbHIU33pWdlPZo0iXo43ZFxCG6/Ttxq4/ck=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i+K4L1Oph/RgbQBE0z/4ckzGYkFAG8RaTNi/LDc8P6hK/etjso8EfpuR/atFD+Rr/
	 BJFy9PZiYYMQiXvGob/kwdmmqEynZ2r5WexpfOKTqWgbvmsgD+fX29O57qh7y+g13n
	 wfF+rXmODa/2YpgE0XnRlEE7k7SkFaTqAIcc4gpkT9IR9AiNBZ7oAyv03dQlJcgbAb
	 sJzelPcYLLqLAezFwq7Bm6qoCdbDdV2Cca5J7599+NpBs/Axk9sWE7XSAtKcaQYqD9
	 YB0fGL0ZvcYp3zayeCGXcKw+UQuAPg+H0qjEsPTw7kUM9+19NRgIZBbsKyghrpVdiA
	 xW/7ORMf4netQ==
Message-ID: <7e668b90-e3e6-5d25-e894-f754662405af@collabora.com>
Date: Tue, 13 Dec 2022 10:09:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/5] media: mediatek: vcodec: add params to record lat and
 core lat_buf count
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221210073218.17350-1-yunfei.dong@mediatek.com>
 <20221210073218.17350-2-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221210073218.17350-2-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_011004_331986_78796FFB 
X-CRM114-Status: GOOD (  17.13  )
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

Il 10/12/22 08:32, Yunfei Dong ha scritto:
> Using lat_buf to share decoder information between lat and core work
> queue, adding params to record the buf count.
> 
> Fixes: 365e4ba01df4 ("media: mtk-vcodec: Add work queue for core hardware decode")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>   .../platform/mediatek/vcodec/vdec_msg_queue.c | 32 ++++++++++++++++++-
>   .../platform/mediatek/vcodec/vdec_msg_queue.h |  9 ++++++
>   2 files changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
> index dc2004790a47..af7ddba1923a 100644
> --- a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
> +++ b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
> @@ -52,6 +52,30 @@ static struct list_head *vdec_get_buf_list(int hardware_index, struct vdec_lat_b
>   	}
>   }
>   
> +static void vdec_msg_queue_inc(struct vdec_msg_queue *msg_queue, int hardware_index)
> +{
> +	mutex_lock(&msg_queue->list_cnt_mutex);

I doubt that you need to use this mutex, as you're using atomics...

> +
> +	if (hardware_index == MTK_VDEC_CORE)
> +		atomic_inc(&msg_queue->core_list_cnt);
> +	else
> +		atomic_inc(&msg_queue->lat_list_cnt);
> +

This branch (with the relevant appropriate changes) can be simplified as

	atomic_inc(&msg_queue->list_cnt[hardware_index]);

...where list_cnt is an array, and hardware_index is an enumeration.	

> +	mutex_unlock(&msg_queue->list_cnt_mutex);
> +}
> +
> +static void vdec_msg_queue_dec(struct vdec_msg_queue *msg_queue, int hardware_index)
> +{
> +	mutex_lock(&msg_queue->list_cnt_mutex);
> +
> +	if (hardware_index == MTK_VDEC_CORE)
> +		atomic_dec(&msg_queue->core_list_cnt);
> +	else
> +		atomic_dec(&msg_queue->lat_list_cnt);

Same here.

> +
> +	mutex_unlock(&msg_queue->list_cnt_mutex);
> +}
> +

Regards,
Angelo


