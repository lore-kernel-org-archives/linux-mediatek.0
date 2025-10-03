Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B88CCAC5B0
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Oct 2025 08:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T8G84pSQ1DGANZy3r3aF5GjarkHpWrGp+SB+Lsi4PdA=; b=yub/5RBnmfzmH1++pwCia1PnMg
	rWJd1N7S+/0P2sZXE/97g+XBHu4x0lGIb7qwULvVAGxDX6MT2JnTJYN8CKQETEby8ZJ6xtbvF3D8M
	ymZS8XhLF22GWbvotcNSPex9Ypz1v3FOlT7CpeklY6s4gUsSG8t11FrcBkPQJp7FXoKBKO6BdTKbE
	gyJZVg+Z5DSUvlydevvSUK3Mp+m/fTWq+jrGpTPTYKchapNAhvMlA8/zXQSttjAbxh3LvKiSSf1ov
	Ch1zzqeSCzapvfUN4Qot+tYZRbcxkN9ZNn612+R8u7PGemdDpKWddwVzGtekQaMWUlDdD0w8W6VsT
	eVllOb2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4ato-0000000BrXT-2OUh;
	Fri, 03 Oct 2025 08:12:20 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4atm-0000000BrX4-1fXa
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Oct 2025 08:12:20 +0000
Received: from [192.168.2.212] (p5dc550fa.dip0.t-ipconnect.de [93.197.80.250])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 6D97D60213C84;
	Fri, 03 Oct 2025 10:11:54 +0200 (CEST)
Message-ID: <1e8173de-8a48-4707-b276-2e1d6cfff96d@molgen.mpg.de>
Date: Fri, 3 Oct 2025 10:11:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] Bluetooth: btmtksdio: Add pmctrl handling for BT
 closed state during reset
To: Chris Lu <chris.lu@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Von Dentz <luiz.dentz@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Will Lee <will-cy.Lee@mediatek.com>, SS Wu <ss.wu@mediatek.com>,
 Steve Lee <steve.lee@mediatek.com>, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20250930053933.1685847-1-chris.lu@mediatek.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20250930053933.1685847-1-chris.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_011218_582594_ADF39433 
X-CRM114-Status: GOOD (  16.09  )
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

Dear Chris,


Thank you for your patch.


Am 30.09.25 um 07:39 schrieb Chris Lu:
> This patch adds logic to handle power management control when the
> Bluetooth function is closed during the SDIO reset sequence.
> 
> Specifically, if BT is closed before reset, the driver enables the
> SDIO function and sets driver pmctrl. After reset, if BT remains
> closed, the driver sets firmware pmctrl and disables the SDIO function.
> 
> These changes ensure proper power management and device state consistency
> across the reset flow.

How can your patch be verified on a running system?


Kind regards,

Paul


> Fixes: 8fafe702253d ("Bluetooth: mt7921s: support bluetooth reset mechanism")
> Signed-off-by: Chris Lu <chris.lu@mediatek.com>
> ---
>   drivers/bluetooth/btmtksdio.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
> index 50abefba6d04..62db31bd6592 100644
> --- a/drivers/bluetooth/btmtksdio.c
> +++ b/drivers/bluetooth/btmtksdio.c
> @@ -1270,6 +1270,12 @@ static void btmtksdio_reset(struct hci_dev *hdev)
>   
>   	sdio_claim_host(bdev->func);
>   
> +	/* set drv_pmctrl if BT is closed before doing reset */
> +	if (!test_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state)) {
> +		sdio_enable_func(bdev->func);
> +		btmtksdio_drv_pmctrl(bdev);
> +	}
> +
>   	sdio_writel(bdev->func, C_INT_EN_CLR, MTK_REG_CHLPCR, NULL);
>   	skb_queue_purge(&bdev->txq);
>   	cancel_work_sync(&bdev->txrx_work);
> @@ -1285,6 +1291,12 @@ static void btmtksdio_reset(struct hci_dev *hdev)
>   		goto err;
>   	}
>   
> +	/* set fw_pmctrl back if BT is closed after doing reset */
> +	if (!test_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state)) {
> +		btmtksdio_fw_pmctrl(bdev);
> +		sdio_disable_func(bdev->func);
> +	}
> +
>   	clear_bit(BTMTKSDIO_PATCH_ENABLED, &bdev->tx_state);
>   err:
>   	sdio_release_host(bdev->func);


