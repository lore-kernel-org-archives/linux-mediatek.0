Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A55C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Nov 2023 16:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ti2N4BZLHnKnDy3mOSwz2DfxFp2OByS/DAZZ1/fiFk=; b=UuGSTH/68U9kAj+i/0d3YENcaP
	7ifnUkFkDCKDKAlMHlWqV3kbyt9NnA0tYilxwyHugHFXNh59ZrO5Fx5meZmnyNFs4Qrm4K1PUKsn4
	ylgM6EGGeJLC+PTdtB5NUrcgHYB0/cc8umn3lpIIpS+3UDu9dZrZ9sH6QIB6HO5zymyWID4B61hfZ
	KReSSeNZ5dg1qGJnVImIrxhHtHYZxboYbuHk0uCOOJE8Y3h7rBfSCbpWhfq4sSkXDN4WxS13Iwp/f
	47oU/2YjZaEnHTJBwmZqU0T6mKTmvsCCLXPphzF05f5qCSlRK5u4sJGLZStE4wzPtfTYkRUDbu4SV
	XLVH2wbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0lhl-004Kbz-1d;
	Wed, 08 Nov 2023 16:47:01 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0lhi-004Kas-1T;
	Wed, 08 Nov 2023 16:46:59 +0000
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0ADEF6607699;
	Wed,  8 Nov 2023 16:46:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699462012;
	bh=EeyG48ihoO4SEA/8XzhcTQbxRY9L7eiinHyNA69xzNY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ESr6pT+f5UmHQxoH5B2QL2SWWHnZ3IDW3t+g85ghsXjBSK8T1+8jENSXLV7GixsAj
	 BPAyBa40TM2XvyZyx3j3dohE3PERlH12LjHWvZHG7YeKWNNo2csckKlKC4nImAoh35
	 mVHK3UfT0f4ZLj4Bq+BksGnA+bn0TdudzD4MOUmBsOh0UgMenEcXaImIkN3o9qZVps
	 xVrCGMG1mC5FBV/kc9Ky+Fu5aHKRWni0vczlYaMhosT55ux5n7pINuig5s/nCKQ94K
	 TbM4X/KVNP/FxBp46aJntEZZTvCi7rQ245Pv7oQ+cnZsu3zz2i/foJOTsWC/f5LGzD
	 /zMuhB7rJQ1KA==
Message-ID: <03557323-0a03-4833-b2de-6011e3d3acee@collabora.com>
Date: Wed, 8 Nov 2023 17:46:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 06/56] media: videobuf2: Remove duplicated index vs
 q->num_buffers check
Content-Language: en-US
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl,
 nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-7-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-7-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_084658_633507_2414CB31 
X-CRM114-Status: GOOD (  11.37  )
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

W dniu 31.10.2023 o 17:30, Benjamin Gaignard pisze:
> vb2_get_buffer() already checks if the requested index is valid.
> Stop duplicating this kind of check everywhere.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> ---
>   drivers/media/common/videobuf2/videobuf2-v4l2.c | 8 --------
>   1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 2ffb097bf00a..c6ebc8d2c537 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -823,10 +823,6 @@ int vb2_qbuf(struct vb2_queue *q, struct media_device *mdev,
>   		return -EBUSY;
>   	}
>   
> -	if (b->index >= q->num_buffers) {
> -		dprintk(q, 1, "buffer index out of range\n");
> -		return -EINVAL;
> -	}
>   	vb = vb2_get_buffer(q, b->index);
>   	if (!vb) {
>   		dprintk(q, 1, "can't find the requested buffer %u\n", b->index);
> @@ -898,10 +894,6 @@ int vb2_expbuf(struct vb2_queue *q, struct v4l2_exportbuffer *eb)
>   {
>   	struct vb2_buffer *vb;
>   
> -	if (eb->index >= q->num_buffers) {
> -		dprintk(q, 1, "buffer index out of range\n");
> -		return -EINVAL;
> -	}
>   	vb = vb2_get_buffer(q, eb->index);
>   	if (!vb) {
>   		dprintk(q, 1, "can't find the requested buffer %u\n", eb->index);


