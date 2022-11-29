Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D17C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 15:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S9TIwYuj5BZOO0P4954yAO+riVM9mIQN2SCvZ98NoxM=; b=WrmOhiJ1ygLTx06u22EH3pKh+w
	Rl/xwaoyc/bkxEvapmiboHbzu/5WtN8pvrD80oawBt6km6ncMxDiK1tRKfJLxmP3QiD2frCddsOs+
	hrxuduBVHbksArNi30fDndIyiTN/hy924vTDOhnPs6JEcu+MCBe9lgteiRTqV2hig0S2e579IcHOX
	crceLvy7+RM5DDCSQZJ8lKBXivrlhe4fw2qKlKSdSepidhLpN1r0Qe6obRV49MyiWhcXEGYzs940s
	xeDyHvvvND3VCZnV0QGNJ21g8PtJ5twWmKD2LFSOblu4SiEuEuYyqV6ja9gHLKYiK977pml9DF7fG
	a1T+AjHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p02AT-009Z28-Sf; Tue, 29 Nov 2022 15:05:05 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p02AR-009YzB-1E
	for linux-mediatek@lists.infradead.org; Tue, 29 Nov 2022 15:05:04 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E110B660165C;
	Tue, 29 Nov 2022 15:04:57 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669734298;
	bh=Zt6+6zk5Sq08WO06c/3RsDKZoTGXt8kyWvLZNd9EsoQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P72O6Oz0aoPXxI5/vDQ1ww9E75aU9okDQfwZLn9dMTKbDjV8qBzY+8EhZ4J1FdXNR
	 7E1sAMUr0NEICbbw0lJbyZEKhqMog10K3BFtUtxC4lrZPK7plzvglncOk1/449C1p3
	 l+Jg92yQi6YqZ6uEmSchs6O4Taq3oSAUr2zr1vvm37uVOw8VlyLbMtqnFxwGXKRaew
	 H4Wqw2VpUPtNvuc7tzRCMEOJQzDBHLX/0cApeozB/m/CFX8WWA34rVmFRkUTnppQHK
	 NFokAGZVc5u0gBDebH4yYIQi4+gHd5YNatkPCDdvCxUjiiU2RPjOq8fl3uiO6rSL2J
	 4TN58IZmyqPQw==
Message-ID: <fa5f8821-ec1d-1def-1f59-33ede6096629@collabora.com>
Date: Tue, 29 Nov 2022 16:04:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 2/2] wifi: mt76: mt7921e: add reboot notifier support
Content-Language: en-US
To: Deren Wu <deren.wu@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>,
 Eric-SY Chang <Eric-SY.Chang@mediatek.com>, KM Lin <km.lin@mediatek.com>,
 Robin Chiu <robin.chiu@mediatek.com>, CH Yeh <ch.yeh@mediatek.com>,
 Posh Sun <posh.sun@mediatek.com>, Stella Chang <Stella.Chang@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
References: <d44631bcc74cce3f32a72f616a99d1bd2837690f.1669711916.git.deren.wu@mediatek.com>
 <dbde826071f59f03e52efc632a8b2f5bf11752d5.1669711916.git.deren.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <dbde826071f59f03e52efc632a8b2f5bf11752d5.1669711916.git.deren.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_070503_255767_AC2F4217 
X-CRM114-Status: GOOD (  19.47  )
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

Il 29/11/22 10:16, Deren Wu ha scritto:
> From: Leon Yen <Leon.Yen@mediatek.com>
> 
> cleanup/reset chip fw before reboot to avoid unstable problems in next run.
> 
> Co-developed-by: Deren Wu <deren.wu@mediatek.com>
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> Signed-off-by: Leon Yen <Leon.Yen@mediatek.com>

Apart from the comment in patch [1/1] ....

I've noticed that this issue is present also on MT7915E: in my case, I have
two of these cards installed on a nVidia Xavier NX Developer Kit and one on
a Raspberry Pi 4 Compute Module mounted on an original CM4 IO Board.

The two on Xavier NX are not showing this issue, but the Pi CM4 cannot see
the card when rebooting the system... so that chip cleanup action should
actually be replicated on mt7915/pci.c as well, if possible.

Regards,
Angelo

> ---
>   .../net/wireless/mediatek/mt76/mt7921/pci.c   | 21 +++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> index 28342ec940f0..4e9021c349b9 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> @@ -226,6 +226,25 @@ static u32 mt7921_rmw(struct mt76_dev *mdev, u32 offset, u32 mask, u32 val)
>   	return dev->bus_ops->rmw(mdev, addr, mask, val);
>   }
>   
> +static int mt7921e_reboot_notifier(struct notifier_block *nb,
> +				   unsigned long code, void *unused)
> +{
> +	struct mt76_dev *mdev = container_of(nb, struct mt76_dev,
> +					     reboot_nb);
> +	struct mt7921_dev *dev = container_of(mdev, struct mt7921_dev, mt76);
> +	struct mt76_connac_pm *pm = &dev->pm;
> +
> +	cancel_delayed_work_sync(&pm->ps_work);
> +	cancel_work_sync(&pm->wake_work);
> +
> +	/* chip cleanup before reboot */
> +	mt7921_mcu_drv_pmctrl(dev);
> +	mt7921_dma_cleanup(dev);
> +	mt7921_wfsys_reset(dev);
> +
> +	return NOTIFY_DONE;
> +}
> +
>   static int mt7921_pci_probe(struct pci_dev *pdev,
>   			    const struct pci_device_id *id)
>   {
> @@ -357,6 +376,8 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
>   	if (ret)
>   		goto err_free_irq;
>   
> +	mdev->reboot_nb.notifier_call = mt7921e_reboot_notifier;
> +
>   	ret = mt7921_register_device(dev);
>   	if (ret)
>   		goto err_free_irq;
> 


