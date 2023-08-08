Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D905FC001B0
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Aug 2023 11:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qH9IEbIgSuFMNLy8S37BjiSFS/6H9g4oMtExBE1py7g=; b=MQmsYu8VoESbH/EaJDuUfsIuGP
	Gh2IU7SRr0lrhFpjTiV273eZtCLb1eS8FVFjCb6a0Gz5HMPt5nj/BnqCwC5vz1A/Bkr6S/JfWxL48
	dWG12J3OXHKTVWJ87K9NIt8HrDqFHAm6FwH0aikctr7Qi26ERmn62jMykjuc4tqHdyfv9kCMsLBpq
	3bQxAxqmDBg7dxDIVpNdUA9lxF14tOgMAjwjfJO6vUSPGupmQvG0dcCWhY2k2YJdxKfHiXGMQMXL1
	irfUrk+PxxoxmfBl7jo82ysl7DtEo+/eEEo0hOcNzSbbK5O1u3vJhgruGnvJoM4POYHQaEs/mQ4o+
	Bx8O+d9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTL9E-002U39-1b;
	Tue, 08 Aug 2023 11:45:12 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTL9B-002U27-13;
	Tue, 08 Aug 2023 11:45:10 +0000
Received: from [192.168.0.125] (unknown [82.76.24.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7224E66071F6;
	Tue,  8 Aug 2023 12:45:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691495104;
	bh=TLCXArraVp1GnqEqP+LWsyF5aCVliI9FrcY4g8JDRiE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FZIwYjLSNwUeWjsyZKshC+XGEuO9rzr2fl6CY137AFkL27nbhoX1viX64mcXCBSs9
	 VMQuda3NcfX7cJGMIWFEj7VHIoGKrg7ZLOiPIwNtL9w07KH1eqNyJDHAd9aPwrHVDd
	 GYstIOuUbIgVi9CmE/Sh5tiHf8+6Isbio8IVF2WRuomdAT8XyMRiuCn8PsRZUa9qfL
	 zF7IuvANvKydrM7uktr78aa0dDv3u4/NkSrUUSLSmkgMjCDd0e5/mLATy4XPWcEoTX
	 MCsliGpI+8JdKzwaN7GDNQWugpfe/bD5jsnbxayCIx4FNQ37RMQZ0Sy03/BDnn++iV
	 8/8z2GvOGvEQg==
Message-ID: <da5d1a11-93d4-3952-9a2b-8313b9206660@collabora.com>
Date: Tue, 8 Aug 2023 14:45:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] dmaengine: mediatek: Fix deadlock caused by
 synchronize_irq()
Content-Language: en-US
To: Duoming Zhou <duoming@zju.edu.cn>, sean.wang@mediatek.com
Cc: vkoul@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230806032511.45263-1-duoming@zju.edu.cn>
From: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <20230806032511.45263-1-duoming@zju.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_044509_528031_8D5FC92E 
X-CRM114-Status: GOOD (  18.67  )
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

On 8/6/23 06:25, Duoming Zhou wrote:
> The synchronize_irq(c->irq) will not return until the IRQ handler
> mtk_uart_apdma_irq_handler() is completed. If the synchronize_irq()
> holds a spin_lock and waits the IRQ handler to complete, but the
> IRQ handler also needs the same spin_lock. The deadlock will happen.
> The process is shown below:
> 
>            cpu0                        cpu1
> mtk_uart_apdma_device_pause() | mtk_uart_apdma_irq_handler()
>    spin_lock_irqsave()         |
>                                |   spin_lock_irqsave()
>    //hold the lock to wait     |
>    synchronize_irq()           |
> 
> This patch reorders the synchronize_irq(c->irq) outside the spin_lock
> in order to mitigate the bug.
> 
> Fixes: 9135408c3ace ("dmaengine: mediatek: Add MediaTek UART APDMA support")
> Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
> ---
>   drivers/dma/mediatek/mtk-uart-apdma.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
> index a1517ef1f4a..0acf6a92a4a 100644
> --- a/drivers/dma/mediatek/mtk-uart-apdma.c
> +++ b/drivers/dma/mediatek/mtk-uart-apdma.c
> @@ -451,9 +451,8 @@ static int mtk_uart_apdma_device_pause(struct dma_chan *chan)
>   	mtk_uart_apdma_write(c, VFF_EN, VFF_EN_CLR_B);
>   	mtk_uart_apdma_write(c, VFF_INT_EN, VFF_INT_EN_CLR_B);
>   
> -	synchronize_irq(c->irq);
> -
>   	spin_unlock_irqrestore(&c->vc.lock, flags);
> +	synchronize_irq(c->irq);
>   
>   	return 0;
>   }


Reviewed-by: Eugen Hristev <eugen.hristev@collabora.com>

