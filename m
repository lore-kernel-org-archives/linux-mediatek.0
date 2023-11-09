Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A9CC4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 10:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sNKeMZxv+VfB/eI11vVqNFEj6xDqWZN/U5gx49KlPos=; b=CVGkbzMSRlEPmkZYZPf6r6vgFX
	xuS90re5UdURHKFn9IInKIaLu+GuXHQC1DmOK+OVH1dlh0UNMV5+3ktUDOd61pOmblgnfSHht1jwP
	q6AjQisQHlHaGqir03M3TWeA2KfUbDIDI29WVKNh+7QHxd8uVuC08qikNt8rU/RIQgs42SNl5Byrd
	2vn1qhOdh3RgoiSEBScGw0BAK/Q6gjYBxLsf9vRDiFOEQUlWl7X0o2SqsZIh6ZwchZYIy3F0o20n5
	oqvE7jMmxlL52SYkyOfcplj3klDJ4u3z+9gAU8fIis2lEfNcqsMh9g73PfQD/zzp+DyCAh1i0epeO
	ht3u68WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r12BJ-005vmW-0I;
	Thu, 09 Nov 2023 10:22:37 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r12BF-005vkv-30;
	Thu, 09 Nov 2023 10:22:35 +0000
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4FC5D660747A;
	Thu,  9 Nov 2023 10:22:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699525352;
	bh=5oMqGWhF9RtFUcxPr/fM8cd9uEm13ZIxqeJzzqdaq38=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QUdgUF2fKcDypDFObSyWWny1FqwVvon5uDJzoGpZq+KMdCfSY3qXuj2XKRdTAnXwE
	 Z2OykGhHE/8XWjFLhkXY70fLSUchYhHr6AoB/jIDQHD2RU16NgTzcq0jL29x8dYNVN
	 fwh7M7lDgp4Be+7/x+PkiF4FDjqJCtN2++4JRDUNJE4MJkyHYxRcdjw0PBdl3nU6wL
	 KLHVNGYfieNT8lWgn8kB2adh0Ati2sqyf7xH6kwkBjEdFAT45Eii+R68fOtByXen43
	 yQxhUqOZ5+f48amEfmHmeDGILb/mVcKRd1IGNec0+TOU8Hbk+YHlJUs+aEoZm1ovRH
	 iLw1fZ8gx9QtQ==
Message-ID: <9ffdd38e-4c79-45c4-a99a-327d36728f44@collabora.com>
Date: Thu, 9 Nov 2023 11:22:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 27/56] media: coda: Stop direct calls to queue
 num_buffers field
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
 <20231031163104.112469-28-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-28-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_022234_105035_46BD9EDE 
X-CRM114-Status: GOOD (  12.68  )
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
> Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
> This allows us to change how the number of buffers is computed in the
> future.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> CC: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>   drivers/media/platform/chips-media/coda-common.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/chips-media/coda-common.c b/drivers/media/platform/chips-media/coda-common.c
> index cc4892129aaf..f1d85758f6dd 100644
> --- a/drivers/media/platform/chips-media/coda-common.c
> +++ b/drivers/media/platform/chips-media/coda-common.c
> @@ -794,7 +794,7 @@ static int coda_s_fmt(struct coda_ctx *ctx, struct v4l2_format *f,
>   
>   	if (vb2_is_busy(vq)) {
>   		v4l2_err(&ctx->dev->v4l2_dev, "%s: %s queue busy: %d\n",
> -			 __func__, v4l2_type_names[f->type], vq->num_buffers);
> +			 __func__, v4l2_type_names[f->type], vb2_get_num_buffers(vq));
>   		return -EBUSY;
>   	}
>   


