Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B57C4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 11:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oUScrrv76afROFup8xwWIK2xhbvZpOy1VeNeAbPsPBY=; b=NaV+3byJyiNeuDFGAUYCk0X6WV
	3AGb/owBJXhLUTq0VD1v2sAw9QGdXaQU1zonlOKvS+BgKUzjRZ/XBdH4QksYc5rKPJqjfN0Xmat5g
	NCm0P9TnLUnck7m+/2vmCJ9MjGlTIDaLhCI4TUALVkzJ4yZMh7flcd9Exk4UKlpkrIOb5imJ27KEL
	k9vKagl3HuMmlaYBEcKg9SrP9ifTXsOUDkTGC4AVsPCwVBZC3bL9nzsFsrcqQitYKXi3z67xIl0hL
	ePdDXTOZL21Z2XOiGESIjokbC4V1QhOio4KfrM3raqsbifWJsxO+nGGYI71hdaHQDoLjtr3pZb3sl
	zWevdrwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r134g-00630r-2f;
	Thu, 09 Nov 2023 11:19:50 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r134d-0062ze-1i;
	Thu, 09 Nov 2023 11:19:48 +0000
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0F597660745F;
	Thu,  9 Nov 2023 11:19:44 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699528786;
	bh=n5ME7SmWZNZRvgb0w3nunEyLQd4iUQAOH5nCJG6H6ik=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MHJMl57VTOZfvON/Jp8Vvh0d3D0I2lnpz0lA/SZHcMhZTPxcKOwBQJFW4fVzLcrpS
	 McA9j84OjxTAJSEjibqMq8qdWfYbJTJT/I4+ksSJhRMngy7vUr9bJJbEkP5rdxGqnF
	 NX7TCLKHwe2QyCQ8gexteKddZ5poBYKdmq9PcOc9aptXnWiZbpO7JOJBkRsTwipSw3
	 5JUIAieQyeH+uM1rF1IN3UQWTO8T+TCg60qGufgYfQ11NExnXuDVD1VM1q4hF4jb+v
	 Om4itFV4xodHJkKXkN1VkJC8Wcae93BgNuSgj4U75MYrjhV3MJ19UkuwCJth7XkpM9
	 jfTrL0VrRLdrg==
Message-ID: <705dfab2-dbb5-44f2-b40b-c7d56945ba22@collabora.com>
Date: Thu, 9 Nov 2023 12:19:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 34/56] sample: v4l: Stop direct calls to queue
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
 <20231031163104.112469-35-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-35-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_031947_693552_AC88AA58 
X-CRM114-Status: GOOD (  15.00  )
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

> ---
>   samples/v4l/v4l2-pci-skeleton.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/samples/v4l/v4l2-pci-skeleton.c b/samples/v4l/v4l2-pci-skeleton.c
> index a61f94db18d9..a65aa9d1e9da 100644
> --- a/samples/v4l/v4l2-pci-skeleton.c
> +++ b/samples/v4l/v4l2-pci-skeleton.c
> @@ -155,6 +155,7 @@ static int queue_setup(struct vb2_queue *vq,
>   		       unsigned int sizes[], struct device *alloc_devs[])
>   {
>   	struct skeleton *skel = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>   
>   	skel->field = skel->format.field;
>   	if (skel->field == V4L2_FIELD_ALTERNATE) {
> @@ -167,8 +168,8 @@ static int queue_setup(struct vb2_queue *vq,
>   		skel->field = V4L2_FIELD_TOP;
>   	}
>   
> -	if (vq->num_buffers + *nbuffers < 3)
> -		*nbuffers = 3 - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < 3)
> +		*nbuffers = 3 - q_num_bufs;
>   
>   	if (*nplanes)
>   		return sizes[0] < skel->format.sizeimage ? -EINVAL : 0;


