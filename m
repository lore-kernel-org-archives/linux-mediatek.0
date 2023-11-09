Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55E2C4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 12:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yD5omf5ZFmkQDL21uF5uuVazE5Qkhf4fQkf48lEsDgI=; b=qBYrS1RlPd2Is64ufbCBdu60Q7
	rcLeZ22Zv7d2bGOaMhv2bW+1Z+7njzbOp/F743QLmxljQ7BWVGu8qOHU+UHHkAFb+yRwTNmAKYkV6
	RXxMhhxgPL6y7wQAFcHbyZAZpbGiVMs7bhqw0ITLt19ysPfbihM1cqfDSuxnoahCGgpOalQmjiPzG
	vJVUcRe2BVFERvK9r/Us8dtoo7hGnK4SG7daSAPBNdSOvcUxg9yKWs20TZZScYQ+8IHipbnrSyDgC
	nDlPNziXqzPezPqgpuCLgHO0lQQzVlisV+UzV4GPXf2QAAFlEyQUi8HJ6xJq++Km1LZ0z9MeTqyzN
	QeheTcXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r14Cs-006KJ2-2S;
	Thu, 09 Nov 2023 12:32:22 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r14Cp-006KI8-1P;
	Thu, 09 Nov 2023 12:32:20 +0000
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E413F660748C;
	Thu,  9 Nov 2023 12:32:16 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699533138;
	bh=CpA/2/kD4qcNpyp13EzsdiW7+wPb7nwcHMs4TrdTlPY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VG9jaJfee09CBJlAsZ9G49FVSwS4gpIKvGJFvz3xSVO3nMCiJfugB529ZIWo307Xg
	 nc/YsgO0JJwm2JXNB0NnhUy4RYA3ABKWSa5HBMBLXy8ZeFyoUBYlOTXUCScK+Fq93d
	 kUX49yZPZCCdjHK/+5kMctDTiQkaZ1+hHGRaM31Xf6k8iU6ftXiryfPvVLdl5J8PzZ
	 qcXODVgm0KCNN39qFheU2gxHiwHVuObEyEqJmWyfTikgjwgPAKIRV4L99omHetcXVh
	 Psedi0mR+cu0udL9bEg936s7TgxzxLiz7PEwzspq8++ezuuI7Px9ls4A6P2dTU/wSo
	 Fqr/FMwUFbwig==
Message-ID: <38319779-41ba-4e1e-9e05-1bd1b6c595ef@collabora.com>
Date: Thu, 9 Nov 2023 13:32:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 46/56] media: test-drivers: vicodec: Increase max
 supported capture queue buffers
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
 <20231031163104.112469-47-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-47-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_043219_606259_D1475111 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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
> Allow to allocated up to 64 buffers on capture queue.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

> ---
>   drivers/media/test-drivers/vicodec/vicodec-core.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/test-drivers/vicodec/vicodec-core.c b/drivers/media/test-drivers/vicodec/vicodec-core.c
> index 6f0e20df74e9..69cbe2c094e1 100644
> --- a/drivers/media/test-drivers/vicodec/vicodec-core.c
> +++ b/drivers/media/test-drivers/vicodec/vicodec-core.c
> @@ -1718,6 +1718,7 @@ static int queue_init(void *priv, struct vb2_queue *src_vq,
>   			V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE :
>   			V4L2_BUF_TYPE_VIDEO_CAPTURE);
>   	dst_vq->io_modes = VB2_MMAP | VB2_USERPTR | VB2_DMABUF;
> +	dst_vq->max_num_buffers = 64;
>   	dst_vq->drv_priv = ctx;
>   	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
>   	dst_vq->ops = &vicodec_qops;


