Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE82C41535
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 10:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+B8vWiKa6N/QVQqPqE/07U5rbQv1BZo66hlUoWPuvQ=; b=SjGIYWqyAZAAlEf47bsOD1CeB9
	ujW7SrrXeo+QeXbp9NEj1u/DBwqVWRykw3myg3Ggzf2FHwQ7mjazfs07jINDY0bvpeDH9qKaO2WlO
	j2ubQZwLPOerk6AKgT8d2BAMUcw5yqiY6J/wEoT2+DShqQLXPhbMynYNmMh7lwrXdRhSaOFWu7oFH
	Cs4WBwvIEltD9ul39l8TBAU0TCQNeiw2igW9sKCkMaswfaSAwsAkcfyYusEwEWaic51jtB6csxgDz
	/URNRjltLnGY6FO2BvSbkctdtI8NtYtdnOb2NbVJ7Ndx8euBfWJQuDpNhLL9l+mc1M6nvuSVHunsj
	iHBB4smQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r11vI-005rSA-26;
	Thu, 09 Nov 2023 10:06:04 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r11vE-005rR2-2Y;
	Thu, 09 Nov 2023 10:06:02 +0000
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3760C6607435;
	Thu,  9 Nov 2023 10:05:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699524359;
	bh=UJuIMITlo4Vgq8DsEXFYPS1YQZCqvGhIqg5ZZ7SVEPE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZZTzL9AccMhtEEEUj0qc1XRdMjJ5UIEw8Rn1j0Ues6tELlQiKYoXsUOHEhug4eTb1
	 08fCo9nV2UzGSbOz4kF7j6SanHTfgSHAVihmWzzMbZJXmmOtTJf0TdtpM93OZivRQE
	 LSWuzm7quXfM+Uj6Kx307tyKffOqt+dg5vyEQbYzWwN05SfKgmoDJL4J8m6j0PDT3T
	 je5lY28C/9OB7oKHrJDcIzwipA3P3wLZyPh4WgHqdRLpS7B1W1R0hE7hEIhTMcFU5f
	 5kchFbGmgmqknDT6HEuzhdX7dte9kiVtx7DE/tn4Ao2HUeVbZ4Dj6C+9XY1R/EiSQC
	 A8Q7aJegjSoaw==
Message-ID: <ef2c7f81-7846-4ee2-b52d-061177df9755@collabora.com>
Date: Thu, 9 Nov 2023 11:05:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 22/56] media: pci: tw686x: Stop direct calls to queue
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
 <20231031163104.112469-23-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-23-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_020600_958852_B534212D 
X-CRM114-Status: GOOD (  16.29  )
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

> CC: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
>   drivers/media/pci/tw686x/tw686x-video.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/pci/tw686x/tw686x-video.c b/drivers/media/pci/tw686x/tw686x-video.c
> index 3ebf7a2c95f0..6bc6d143d18c 100644
> --- a/drivers/media/pci/tw686x/tw686x-video.c
> +++ b/drivers/media/pci/tw686x/tw686x-video.c
> @@ -423,6 +423,7 @@ static int tw686x_queue_setup(struct vb2_queue *vq,
>   			      unsigned int sizes[], struct device *alloc_devs[])
>   {
>   	struct tw686x_video_channel *vc = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>   	unsigned int szimage =
>   		(vc->width * vc->height * vc->format->depth) >> 3;
>   
> @@ -430,8 +431,8 @@ static int tw686x_queue_setup(struct vb2_queue *vq,
>   	 * Let's request at least three buffers: two for the
>   	 * DMA engine and one for userspace.
>   	 */
> -	if (vq->num_buffers + *nbuffers < 3)
> -		*nbuffers = 3 - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < 3)
> +		*nbuffers = 3 - q_num_bufs;
>   
>   	if (*nplanes) {
>   		if (*nplanes != 1 || sizes[0] < szimage)


