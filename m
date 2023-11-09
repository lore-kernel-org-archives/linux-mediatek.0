Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DE9C4167D
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 10:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QNs+fA+1RYVe2lzyLfvoXQ0AZdi5dmdt36OrWP0pLa0=; b=VsrxHAdZswYwY2GamuWADsg392
	3WsisDPsct8OFc9c/S9j8kjMBdNylhdpMkI3ODEvu84DtuWvihcKkXek9omODwoifSvtyL7iRrB0P
	4psZV1oWiJdByQVB1r5hi06RXz9XgTFT2DHVcmU666/KqUIPU48HGK6A4FTJ8amGR+fHB2bkSU0+v
	mQFN4f8tS0QKxyJrnig5d9Sap44UVCE4hw8jMnAwO8Znz5udVPOXHZvtiZGlUPP8K+QvwkdD13Vrp
	C7Ft0UiQp3rHRySx1v+N1GUYIg7z9T6a0PrFXGcnG7W+yq/8/x8Bvtb1N/DtrjUvlpqnCQWpstyho
	i5P6ENAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r11yN-005sgY-1r;
	Thu, 09 Nov 2023 10:09:15 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r11yJ-005sfH-2x;
	Thu, 09 Nov 2023 10:09:13 +0000
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D8BE36607435;
	Thu,  9 Nov 2023 10:09:08 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699524550;
	bh=aeVeUG1Bv88ZjGIClWEmz4XfSpRJX1aTzaeyOElvMGM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k57Pw8VUIO6ZkT1V+3dq3Vyl9GislRp5LQvodV7d+URgmVEIDNpXN9d7t+HF5EzMq
	 Yo73slhYGCR1ij0YA4QTIdLGr+SSh+uVNPNV9XFNueAf7T6GnM6JltQ1Uj76v8Vgq2
	 vQI1O/z9aoW3sRmkXNX5hEsqPtSM34PYftnMU+v4h7neHTEFNX+AIoEWzV4/JdVSsz
	 rUpKP3CYxTn/HZGeBgYy2RWigK4Uj2NH8PZWclYaY900eKPsx9px7/554Ywb9RNcso
	 wnwDKwkJeEKRVIj1P34NgsSUq+eBiBMWzePVLkE/MLzEkCBqI01TJfx0t6cqjUbiUf
	 4TRJMeGzrP6+g==
Message-ID: <b3027a75-80e1-4583-a25b-5cb8523a1d8f@collabora.com>
Date: Thu, 9 Nov 2023 11:09:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 24/56] media: pci: netup_unidvb: Stop direct calls to
 queue num_buffers field
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
 Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-25-benjamin.gaignard@collabora.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20231031163104.112469-25-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_020912_117939_B9FC6273 
X-CRM114-Status: GOOD (  14.24  )
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

> CC: Sergey Kozlov <serjk@netup.ru>
> CC: Abylay Ospan <aospan@netup.ru>
> ---
>   drivers/media/pci/netup_unidvb/netup_unidvb_core.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/pci/netup_unidvb/netup_unidvb_core.c b/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
> index d85bfbb77a25..557985ba25db 100644
> --- a/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
> +++ b/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
> @@ -293,12 +293,13 @@ static int netup_unidvb_queue_setup(struct vb2_queue *vq,
>   				    struct device *alloc_devs[])
>   {
>   	struct netup_dma *dma = vb2_get_drv_priv(vq);
> +	unsigned int q_num_bufs = vb2_get_num_buffers(vq);
>   
>   	dev_dbg(&dma->ndev->pci_dev->dev, "%s()\n", __func__);
>   
>   	*nplanes = 1;
> -	if (vq->num_buffers + *nbuffers < VIDEO_MAX_FRAME)
> -		*nbuffers = VIDEO_MAX_FRAME - vq->num_buffers;
> +	if (q_num_bufs + *nbuffers < VIDEO_MAX_FRAME)
> +		*nbuffers = VIDEO_MAX_FRAME - q_num_bufs;
>   	sizes[0] = PAGE_ALIGN(NETUP_DMA_PACKETS_COUNT * 188);
>   	dev_dbg(&dma->ndev->pci_dev->dev, "%s() nbuffers=%d sizes[0]=%d\n",
>   		__func__, *nbuffers, sizes[0]);


