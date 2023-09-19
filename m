Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B46CD54AB
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 09:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aymvy/hrb0UNlUkBIEVbQwUqpKTrMQqNVV2dEokfL+U=; b=MtorzLxrGAXnAyzVvLamOi6co6
	SKCmXKujEnHf8xSdDSmmDJdHnwzWdwBn/MciAdRlgkjTr96cDUlvnE3/iByfZtxgFa29O7afr123G
	C49Nh5BU4PALfdW2dOW7khx6EMvh7ZkZDoDPs7sF4lpJz+qUIIl8cuS+CJZPfUwD5G2NUGmIrqWpN
	hS+YjspyrM3NPBnnub6Rs9LsZRM0SwD4zIYzKNtg8K37FAqxbLH57Bpuqw1JFtecaaYW387y0qX6/
	PPAMUqZLCDIjHvwlCf0g5k05etlPC5CNoZduLBgCYPRZEbwz02118gtaHZQevy59ua9K1Qh4a4PvS
	Y/lXe45A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiX1A-00HSSd-1s;
	Tue, 19 Sep 2023 09:27:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiX17-00HSQZ-02;
	Tue, 19 Sep 2023 09:27:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 37DD8614CE;
	Tue, 19 Sep 2023 09:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F406C433C7;
	Tue, 19 Sep 2023 09:27:31 +0000 (UTC)
Message-ID: <d6e80a02-c9c3-4652-a3e2-9d6cf1213536@xs4all.nl>
Date: Tue, 19 Sep 2023 11:27:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 22/49] media: i2c: Stop direct calls to queue
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
References: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
 <20230914133323.198857-23-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230914133323.198857-23-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_022737_089524_4E2FFEC3 
X-CRM114-Status: GOOD (  15.27  )
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

On 14/09/2023 15:32, Benjamin Gaignard wrote:
> Use vb2_get_num_buffers() to avoid using queue num_buffer field directly.

Since this affects just one driver, can you change the subject to:

media: video-i2c: Stop direct calls to queue num_buffers field

Thanks!

	Hans

> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/media/i2c/video-i2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
> index 537ebd9fa8d7..60d3e2f35afe 100644
> --- a/drivers/media/i2c/video-i2c.c
> +++ b/drivers/media/i2c/video-i2c.c
> @@ -406,7 +406,7 @@ static int queue_setup(struct vb2_queue *vq,
>  	struct video_i2c_data *data = vb2_get_drv_priv(vq);
>  	unsigned int size = data->chip->buffer_size;
>  
> -	if (vq->num_buffers + *nbuffers < 2)
> +	if (vb2_get_num_buffers(vq) + *nbuffers < 2)
>  		*nbuffers = 2;
>  
>  	if (*nplanes)


