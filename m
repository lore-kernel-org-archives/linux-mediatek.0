Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E9ACDB465
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 08:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N7KuXciT+TKgU3jFRehm1yHYqkxge9gpRQplshmOUWk=; b=sT96PjPDXYmRrMkoSvLZSy0Gc+
	JI9dFpvEPw7KjfxHrO8BOK3HFbvMw9NGx+zq0qMh7L2+BOmWMeFOBTIp1Ued+ThnmLzGzMgULvhBJ
	Ep9Fm02vfXqOLELlNnt/pzDZPJN5GH5af9kD9Tuunbt53uKC7jcq6ZsRdKeuvaJ4bdD2u4+mvHH/A
	9HReO8Ud7L3Cg51ZDJ05me9tgLoP1QAeACrOJcWrUJrr39V4yhl2JbUNGxOm1R2Q4Ug3RbeoJ4mg7
	LC38s3471tD8u5rC5Zm8/1qKeupuj8lb14sEYLL6MnjALrXWEpgZZIp5EGMzycDQH4zGiWvBMNjBD
	jUR8QmNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsItB-008pR6-1T;
	Mon, 16 Oct 2023 08:23:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsIt6-008pOx-0U;
	Mon, 16 Oct 2023 08:23:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7367F60DB5;
	Mon, 16 Oct 2023 08:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3440CC433C8;
	Mon, 16 Oct 2023 08:23:40 +0000 (UTC)
Message-ID: <21864437-bfdd-4d39-91fa-f24fc1c7cf97@xs4all.nl>
Date: Mon, 16 Oct 2023 10:23:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 40/56] sample: v4l: Stop direct calls to queue
 num_buffers field
Content-Language: en-US, nl
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
 <20231012114642.19040-41-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231012114642.19040-41-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_012344_227366_502356C6 
X-CRM114-Status: GOOD (  14.05  )
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
> ---
>  samples/v4l/v4l2-pci-skeleton.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/samples/v4l/v4l2-pci-skeleton.c b/samples/v4l/v4l2-pci-skeleton.c
> index a61f94db18d9..a65aa9d1e9da 100644
> --- a/samples/v4l/v4l2-pci-skeleton.c
> +++ b/samples/v4l/v4l2-pci-skeleton.c
> @@ -155,6 +155,7 @@ static int queue_setup(struct vb2_queue *vq,
>  		       unsigned int sizes[], struct device *alloc_devs[])
>  {
>  	struct skeleton *skel = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>  
>  	skel->field = skel->format.field;
>  	if (skel->field == V4L2_FIELD_ALTERNATE) {
> @@ -167,8 +168,8 @@ static int queue_setup(struct vb2_queue *vq,
>  		skel->field = V4L2_FIELD_TOP;
>  	}
>  
> -	if (vq->num_buffers + *nbuffers < 3)
> -		*nbuffers = 3 - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < 3)
> +		*nbuffers = 3 - q_num_bufs;

This should be dropped, and instead update q->min_buffers_needed from
2 to 3.

Regards,

	Hans

>  
>  	if (*nplanes)
>  		return sizes[0] < skel->format.sizeimage ? -EINVAL : 0;


