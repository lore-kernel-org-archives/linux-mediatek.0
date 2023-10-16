Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36F5CDB465
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 08:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUDnQhO9dT5E2FxyVboInO/STwz3ssxaeneCMc6t6ec=; b=zFbzygsRj3SYdIUTDF0Iei2dGC
	49ZiZPhIvuE9pveDd40U3wZ639PxGl7xuMazOWyE0QC0jP4IwcWuAOd+TXg9Sn+ZoLmWKcBN7BssL
	06N+msAEmgvfa0RhkUbw09AljTcJbu68mVoV6TjXr+Jl2wRrwZisXUoC2IkhqEXeB2XXqYfZus9iX
	wY52MnL/f+erOKca6ZkeGFHf8y55IUlDKao2K69gq4RZIKtWzoPP+5j14sqkEyKw7uP9BAXWdTiGw
	YtiNVNkm+brpRJ7Tdfdt9Rekq5KdnI8IWC9VKvlgLzjKGiCAT22mlpAZreQn0TehgCq6LQa8iIMWe
	degEFGLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsIsJ-008pDr-2t;
	Mon, 16 Oct 2023 08:22:55 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsIsG-008pC0-1U;
	Mon, 16 Oct 2023 08:22:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 1479EB81131;
	Mon, 16 Oct 2023 08:22:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CED5C433C7;
	Mon, 16 Oct 2023 08:22:47 +0000 (UTC)
Message-ID: <453d929b-0d6d-4e52-aa7f-454bbf4cac7c@xs4all.nl>
Date: Mon, 16 Oct 2023 10:22:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 39/56] touchscreen: sur40: Stop direct calls to queue
 num_buffers field
Content-Language: en-US, nl
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Henrik Rydberg <rydberg@bitmath.org>
References: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
 <20231012114642.19040-40-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231012114642.19040-40-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_012252_630966_60E29EBB 
X-CRM114-Status: GOOD (  14.61  )
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

On 12/10/2023 13:46, Benjamin Gaignard wrote:
> Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> CC: Henrik Rydberg <rydberg@bitmath.org>
> ---
>  drivers/input/touchscreen/sur40.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/sur40.c b/drivers/input/touchscreen/sur40.c
> index 8ddb3f7d307a..e7d2a52169a0 100644
> --- a/drivers/input/touchscreen/sur40.c
> +++ b/drivers/input/touchscreen/sur40.c
> @@ -847,9 +847,10 @@ static int sur40_queue_setup(struct vb2_queue *q,
>  		       unsigned int sizes[], struct device *alloc_devs[])
>  {
>  	struct sur40_state *sur40 = vb2_get_drv_priv(q);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(q);
>  
> -	if (q->num_buffers + *nbuffers < 3)
> -		*nbuffers = 3 - q->num_buffers;
> +	if (q_num_bufs + *nbuffers < 3)
> +		*nbuffers = 3 - q_num_bufs;

This can just be dropped since this driver sets min_buffers_needed to 3.

Regards,

	Hans

>  
>  	if (*nplanes)
>  		return sizes[0] < sur40->pix_fmt.sizeimage ? -EINVAL : 0;


