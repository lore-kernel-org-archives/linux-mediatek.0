Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 996C5CDB465
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 10:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dpGv7jI9Z6ISp3ZBckr6syUlleUJEs1l5qXUWYMdnlY=; b=rMbqdkUyTXV+5JFMjUp0YNglHa
	wwBiKuMKiKsnbFp8qR7yBZ4jFN/+94agH15imIJGSUHhbIK1IhJ1az6DHjhf5S3t0BSnODlDBCzha
	o4YiCKlP8sAWH8s+lcXoGTTwOoZnwRDvNpsO+UR287Fr/TNSl0nFDZ2tgNTYTVGu5enMISZdAFF7J
	d2HV0S+02b+sTrtVRB8n4rg1BwehOrqUFhnAdNtb/+gMb08v19bJ+GfD/b6XYpLd6a7VEZLl795zm
	R5T4LwqYY+NKMchbrE753R+ZW+BDQF7Oyn5GT0gndhTtFHpLhioQCUehRmwEcx3iTbGTNfaIEFb9j
	syef3ZSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsKtQ-009KhW-0q;
	Mon, 16 Oct 2023 10:32:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsKtN-009Kfl-2G;
	Mon, 16 Oct 2023 10:32:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6E3CC60EA8;
	Mon, 16 Oct 2023 10:32:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29066C433C7;
	Mon, 16 Oct 2023 10:32:04 +0000 (UTC)
Message-ID: <0ca82921-b71a-4d87-a1f1-6a6158f07c8c@xs4all.nl>
Date: Mon, 16 Oct 2023 12:32:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 45/56] media: test-drivers: vivid: Increase max
 supported buffers for capture queues
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
 <20231012114642.19040-46-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231012114642.19040-46-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_033209_780855_82577E61 
X-CRM114-Status: GOOD (  12.88  )
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
> Change the maximum number of buffers of some capture queues in order
> to test max_num_buffers field.
> 
> Allow to allocate up to:
> - 64 buffers for video capture queue.
> - 1024 buffers for sdr capture queue.
> - 32768 buffers for vbi capture queue.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/media/test-drivers/vivid/vivid-core.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
> index 394c9f81ea72..b5656330578d 100644
> --- a/drivers/media/test-drivers/vivid/vivid-core.c
> +++ b/drivers/media/test-drivers/vivid/vivid-core.c
> @@ -876,6 +876,13 @@ static int vivid_create_queue(struct vivid_dev *dev,
>  	q->type = buf_type;
>  	q->io_modes = VB2_MMAP | VB2_DMABUF;
>  	q->io_modes |= V4L2_TYPE_IS_OUTPUT(buf_type) ?  VB2_WRITE : VB2_READ;
> +	if (buf_type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
> +		q->max_num_buffers = 64;
> +	if (buf_type == V4L2_BUF_TYPE_SDR_CAPTURE)
> +		q->max_num_buffers = 1024;
> +	if (buf_type == V4L2_BUF_TYPE_VBI_CAPTURE)
> +		q->max_num_buffers = 32768;

This should use the same calculation as MAX_BUFFER_INDEX.

I wonder if those defines should move to videobuf2-core.h instead.

Regards,

	Hans

> +
>  	if (allocators[dev->inst] != 1)
>  		q->io_modes |= VB2_USERPTR;
>  	q->drv_priv = dev;


