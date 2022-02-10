Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBED9C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Feb 2022 14:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7m3+uEgRabmSa4ngc0pFZ4dJg70Mc76yTjorE2PT+Ok=; b=PhK3u81K+UmbJh
	nBTTZaZWCqnTNHUU9CiT9HPm57s85X5ErCI0H0nx6krl1l1/pqmj2mddd/SXyqA+rfpK1lHe5Sudh
	lfRR0lhtznBR/+yTNcr9ynmO0rqBG1W00lpwQc21KC34EuDn//d9u2rAM/99PRCBRjNamOOkxFaaQ
	Dv1ZpFS1sxsX5TXVrK9GAyV9nODn8Zfj7rjfqQkhgzHy4UxNOvL0FZMvUkGpTta9uxP2AoL8NhXwY
	0/HFFy+mYNh/SARwHvpdUuo/NY0wyL3ooBVBg+9m8fk9N9zWPG2WSJWAHnH2N9EaU5D3gr0EOuA+c
	ZrOwy7vjqotHC6wwrslg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIAUS-0045hv-7F; Thu, 10 Feb 2022 14:32:08 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIAUF-0045fY-VF; Thu, 10 Feb 2022 14:31:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 905F61F465B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644503514;
 bh=vnMYZtzLYUlEjqvEffkcsiOlW+x9zxo48b5WEnCoJBc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VJnEf5dXMaVgu7QFE/IW21kmLJ+XXHAjjPtyT0rtTTImZtBbVRXTV0mVIUz9Xgib6
 isHyrOcpGK9FfvZC+KidtsgsIu4DGevJQoms3+BKSUi90ikZQSkKp/ExbB1gEFkOeG
 /44ffKLTzSQPg6N27CouFvUb2McyUj+yogaNXgHFTKhW/ode6pMy4JdkwwiIp+Iv8c
 44cpJbZuu/8e4+B2P7pCEvofXYC1hmg/4rCMcg4pCai8ylMNiC7g1M6aPea2MxspvM
 pP43/V7+J7RI5JQ8T0gpMMs+VmIwtZvdFvxwzAWH5qwFu8lvPm22/NB4rt/L5pVxTV
 y8gLMNi/amv2w==
Message-ID: <06446828-b589-5d7a-0e9f-25f6321e0da6@collabora.com>
Date: Thu, 10 Feb 2022 15:31:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2] PCI: mediatek: Clear interrupt status before
 dispatching handler
Content-Language: en-US
To: qizhong cheng <qizhong.cheng@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org, chuanjia.liu@mediatek.com
References: <20220210012125.6420-1-qizhong.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220210012125.6420-1-qizhong.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_063156_236549_9304F2D1 
X-CRM114-Status: GOOD (  20.19  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 10/02/22 02:21, qizhong cheng ha scritto:
> We found a failure when used iperf tool for wifi performance testing,
> there are some MSIs received while clearing the interrupt status,
> these MSIs cannot be serviced.
> 
> The interrupt status can be cleared even the MSI status still remaining,
> as an edge-triggered interrupts, its interrupt status should be cleared
> before dispatching to the handler of device.
> 
> Signed-off-by: qizhong cheng <qizhong.cheng@mediatek.com>

Hello Qizhong,

This commit is fixing an issue, which means that you *have to* add a proper
Fixes tag.

I believe that this is fixing commit
43e6409db64d ("PCI: mediatek: Add MSI support for MT2712 and MT7622").

Please add the tag and send a v3, after which:
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


> ---
> v2:
>   - Update the subject line.
>   - Improve the commit log and code comments.
> 
>   drivers/pci/controller/pcie-mediatek.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index 2f3f974977a3..2856d74b2513 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -624,12 +624,17 @@ static void mtk_pcie_intr_handler(struct irq_desc *desc)
>   		if (status & MSI_STATUS){
>   			unsigned long imsi_status;
>   
> +			/*
> +			 * The interrupt status can be cleared even the MSI
> +			 * status still remaining, hence as an edge-triggered
> +			 * interrupts, its interrupt status should be cleared
> +			 * before dispatching handler.
> +			 */
> +			writel(MSI_STATUS, port->base + PCIE_INT_STATUS);
>   			while ((imsi_status = readl(port->base + PCIE_IMSI_STATUS))) {
>   				for_each_set_bit(bit, &imsi_status, MTK_MSI_IRQS_NUM)
>   					generic_handle_domain_irq(port->inner_domain, bit);
>   			}
> -			/* Clear MSI interrupt status */
> -			writel(MSI_STATUS, port->base + PCIE_INT_STATUS);
>   		}
>   	}
>   
> 



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
