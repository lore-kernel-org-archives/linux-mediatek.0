Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD9EC5518F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Feb 2026 10:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZEnBQTzrEXfGRJZ0vwGdsn5LJQVzUrtWPfVR8wUTzHo=; b=InUYgzCOjQjx5GMubPYLQwzLPl
	v15/HgPg9G0EjBRullmy8z3x4SnVy5LLik9RrQ4ryqgsBtJrykbXvBTSrJ5tjqVCfeWB+sASe4GI3
	aduLxl1WadhlA6+V5526iScHOvHV6Kjg5Bha3i+qLEt45mzlpCSQNZADt/bNUev1yqk0oqdNKDCnN
	WByx6JjxW9CDePQYEAyGmc0h/ygxqSP1Zzp2/oXCNw1g76jf3vRd9jPr84cp3I2w8IMJc/ZtK4VPg
	fWtunwrJJImx2tWRdzny+dJ2+N+8HddSxr8lcpUccdAlh27DpgFScoRvoGjl8hU71PWUlOtZ9Mp+v
	ANUNgR/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtNSD-0000000DrWE-26IE;
	Fri, 20 Feb 2026 10:09:45 +0000
Received: from mail1.manjaro.org ([142.132.176.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtNSB-0000000DrQy-0X43
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Feb 2026 10:09:44 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8875C41F93;
	Fri, 20 Feb 2026 11:09:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1771582177; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ZEnBQTzrEXfGRJZ0vwGdsn5LJQVzUrtWPfVR8wUTzHo=;
	b=iS+zoyC5cE/li4csAMJpwWo/TAfqMWhlRJ6jl+TzPXKxZy8/ATYT2bBiJRsKhD4L+IrYR1
	acFVUQQD9i2WFKqcem/0+89Vf4U42vF7PzJJGZXX+XeqJb9yfO8yYkK1y8O6NgqOlHrl23
	7LLP3qi1LZRdAPBRkHn6E+Z2l+JX3CJfrE5WTaEg6dJ6xtz+0t/6TJoApcKVzh4+60LV+q
	jzTgxdnVK7cNenVUIhtS5u8gt0NoIS3o4N29RXy+Lpsx5jYOMD+ECil8nVbZIz7/SFVftM
	qnaqnrsrTjvQxsElPDKyofeafCNFAKo7fUc3K3u/0908NbXHj73xDXhu1nYf6Q==
Message-ID: <39e814ff-2ea2-4984-9e8a-2902fef7c4bc@manjaro.org>
Date: Fri, 20 Feb 2026 11:09:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] wifi: mt76: mt7921: handle MT7902 irq_map quirk
 with mutable copy
To: sean.wang@kernel.org, nbd@nbd.name, lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Sean Wang <sean.wang@mediatek.com>, Xiong Huang <xiong.huang@mediatek.com>
References: <20260219004007.19733-1-sean.wang@kernel.org>
 <20260219004007.19733-3-sean.wang@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Philip_M=C3=BCller?= <philm@manjaro.org>
Organization: Manjaro Community
In-Reply-To: <20260219004007.19733-3-sean.wang@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_020943_413828_58948BB9 
X-CRM114-Status: GOOD (  15.12  )
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

Hi Sean,

on Linus master tree we still have 'mt76_mmio_init(&dev->mt76, 
pcim_iomap_table(pdev)[0]);', hence your patch currently won't apply.

On 2/19/26 01:39, sean.wang@kernel.org wrote:
> From: Sean Wang <sean.wang@mediatek.com>
>
> MT7902 PCIe requires a different wm2_complete_mask value, so introduce a
> mutable per-device copy of the default irq_map and override the field
> only for this chip. Other devices continue using the shared const
> template.
>
> This is a prerequisite patch before enabling MT7902 PCIe support.
>
> Co-developed-by: Xiong Huang <xiong.huang@mediatek.com>
> Signed-off-by: Xiong Huang <xiong.huang@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>   drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> index 65c7fe671137..5f857a21f362 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> @@ -327,6 +327,20 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
>   	dev->hif_ops = &mt7921_pcie_ops;
>   	dev->irq_map = &irq_map;
>   	mt76_mmio_init(&dev->mt76, regs);
> +
> +	if (id->device == 0x7902) {
> +		struct mt792x_irq_map *map;
> +
> +		/* MT7902 needs a mutable copy because wm2_complete_mask differs */
> +		map = devm_kmemdup(&pdev->dev, &irq_map,
> +				   sizeof(irq_map), GFP_KERNEL);
> +		if (!map)
> +			return -ENOMEM;
> +
> +		map->rx.wm2_complete_mask = 0;
> +		dev->irq_map = map;
> +	}
> +
>   	tasklet_init(&mdev->irq_tasklet, mt792x_irq_tasklet, (unsigned long)dev);
>   
>   	dev->phy.dev = dev;


-- 
Best, Philip


