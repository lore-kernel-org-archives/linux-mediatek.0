Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBD2C4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 11:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sRIUiiZOM8ZO0ctADuqmNDeBC0SEEHnGcL8RR2bQvZ4=; b=DEFjM7FlBkQZwHdNqJH3nkH6W/
	oNx2OpmU8SWHrl/T1q1DVAG04HG5Grvzca3wOkKgMebHEoFN9iQWfbdvZnjuxK4z4cu0xN3uJavDb
	DKFEYJVMnAgsmYNxoy9ExcMcp7SpSIk4HYQpHeZQx7DSUExPUslcqyhGRQ0+kqeunfu3K2le2bEMc
	UYmMNy9qzDOITrEs+CVH4tZVPn6OsNEaJgFgv6RQ8SHJam6+ONnJgSYDGaz/M7/Xc93up6LndaC9F
	pz7k8eIONCRaEKiw101ykXUj8LhS3oReSA2X32NevzJCEpiCcvfqeQ/5Xug3l8mnrORSyHeWpQVXz
	OTRtZSPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r13E2-0064L5-1i;
	Thu, 09 Nov 2023 11:29:30 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r13Dz-0064KL-1R;
	Thu, 09 Nov 2023 11:29:28 +0000
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 16C196607421;
	Thu,  9 Nov 2023 11:29:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699529366;
	bh=MbNXLia+jC7hLR3GZ2i7bjau3A6rpAnLgPDOnuSzDCA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b+9kQAiwNaExBK6WtWt4ggbc6a2sRS3psYkGAorlUhLSWPtH5rxieRN1SgFbmVkna
	 uWYH4S2KLRX/J9rp4KtO+ufMlyRaE4d49N6b2SnF7GrC7x8NdMfWgKfU+9V/IbEv11
	 KCi2qK8jc89URqTt0LrBrD4n0yDsLBCLzUS9ycG1JrqUchTFktA0rYow+gA1gFV4Oc
	 +zlMc2JiE2TvRHM7edTgA66BqUEgKOCnLBsq62N3DHykNVQaMgLdbxckeLjFLb7/sw
	 wIl/3GDcyTKABMTes1GiWFN9ffnerxmxbLPg1HixHSh9GqRt8NG9Kn6b7QUSErF/py
	 O0SDTZK3ws2HA==
Message-ID: <47aad456-30e8-4b42-bbe4-d40bd808d155@collabora.com>
Date: Thu, 9 Nov 2023 12:29:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 36/56] media: nuvoton: Stop direct calls to queue
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
 linux-staging@lists.linux.dev, kernel@collabora.com,
 Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-37-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-37-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_032927_610678_06064FFE 
X-CRM114-Status: GOOD (  14.07  )
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

> CC: Joseph Liu <kwliu@nuvoton.com>
> CC: Marvin Lin <kflin@nuvoton.com>
> ---
>   drivers/media/platform/nuvoton/npcm-video.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
> index b9e6782f59b4..f9b4e36a5175 100644
> --- a/drivers/media/platform/nuvoton/npcm-video.c
> +++ b/drivers/media/platform/nuvoton/npcm-video.c
> @@ -393,7 +393,7 @@ static void npcm_video_free_diff_table(struct npcm_video *video)
>   	struct rect_list *tmp;
>   	unsigned int i;
>   
> -	for (i = 0; i < video->queue.num_buffers; i++) {
> +	for (i = 0; i < vb2_get_num_buffers(&video->queue); i++) {
>   		head = &video->list[i];
>   		list_for_each_safe(pos, nx, head) {
>   			tmp = list_entry(pos, struct rect_list, list);


