Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACBAC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 07:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rd9fd4QtCukzj2OhYQl7mCI8rHzH+2qbvOpfEKKDetY=; b=1qqLIEwQLCK/xi
	f5P6Ak+6TMiRv0mF+r5DBAWJC6CJZy3LJGncSQie9ZzhP2xtVyoMmEqgSMAu/El1yFrZY1LsSDoJ3
	PrOFY4lm4ct9AtjWUyg1FxBIULvLRvIW14/BSkry4xZzujzpAkpf7QV6chuGiEAE9z7SCjh6MA6rs
	ZN37uCRDUD2bIpabYbcVpUy9OgFpkiu8nQUhWHg3tuqrkKVhu+xXeuWClAYXRSn8RouUI5pxXimqy
	bn7eHIOW7BTxIPlsSD511NABAfz+h+o0EncbJXL6o/UUvqtygSLsWloXj1lxm0oHkf8YeBDOcg0py
	dLoh/a/Dkg/Yn2e8jfNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzYsz-006NsK-UH; Fri, 10 Jun 2022 07:16:49 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11] helo=mx1.molgen.mpg.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzYsq-006Nk4-W5
	for linux-mediatek@lists.infradead.org; Fri, 10 Jun 2022 07:16:48 +0000
Received: from [192.168.0.2] (ip5f5aeb3f.dynamic.kabel-deutschland.de [95.90.235.63])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id D0BA161EA1923;
	Fri, 10 Jun 2022 09:16:20 +0200 (CEST)
Message-ID: <1472eccd-429b-0a18-565c-7de2e5ed44f2@molgen.mpg.de>
Date: Fri, 10 Jun 2022 09:16:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] Bluetooth: btmtksdio: Add in-band wakeup support
Content-Language: en-US
To: Sean Wang <sean.wang@mediatek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, Soul.Huang@mediatek.com,
 YN.Chen@mediatek.com, Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com,
 Deren.Wu@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com,
 Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
 ted.huang@mediatek.com, Eric.Liang@mediatek.com, Stella.Chang@mediatek.com,
 Tom.Chou@mediatek.com, steve.lee@mediatek.com, jsiuda@google.com,
 frankgor@google.com, abhishekpandit@google.com, michaelfsun@google.com,
 mcchou@chromium.org, shawnku@google.com, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Yake Yang <yake.yang@mediatek.com>
References: <742cdffcf110e1601257207fb2b0d3f426d4008c.1654819586.git.objelf@gmail.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <742cdffcf110e1601257207fb2b0d3f426d4008c.1654819586.git.objelf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_001641_243732_BFD1B65B 
X-CRM114-Status: GOOD (  20.02  )
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

Dear Sean,


Thank you for the patch.

Am 10.06.22 um 02:17 schrieb sean.wang@mediatek.com:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> 'ce64b3e94919 ("Bluetooth: mt7921s: Support wake on bluetooth")'
> have added the waken-on-bluetooth via dedicated GPIO.

Maybe:

Commit ce64b3e94919 ("Bluetooth: mt7921s: Support wake on bluetooth") 
adds the wake on bluethooth via a dedicated GPIO.

> The patch extends the function to the waken-on-bluetooth via SDIO DAT1 pin
> (inband wakeup) when the SDIO host driver is able to support.

Maybe:

Extend the wake-on-bluetooth to use the SDIO DAT1 pin (in-band wakeup), 
when supported by the SDIO host driver.

How did you test this? In what datasheet is it documented?

> Co-developed-by: Yake Yang <yake.yang@mediatek.com>
> Signed-off-by: Yake Yang <yake.yang@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>   drivers/bluetooth/btmtksdio.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
> index d6700efcfe8c..9ed3af4ba51a 100644
> --- a/drivers/bluetooth/btmtksdio.c
> +++ b/drivers/bluetooth/btmtksdio.c
> @@ -118,6 +118,7 @@ MODULE_DEVICE_TABLE(sdio, btmtksdio_table);
>   #define BTMTKSDIO_FUNC_ENABLED		3
>   #define BTMTKSDIO_PATCH_ENABLED		4
>   #define BTMTKSDIO_HW_RESET_ACTIVE	5
> +#define BTMTKSDIO_INBAND_WAKEUP		6
>   
>   struct mtkbtsdio_hdr {
>   	__le16	len;
> @@ -1294,6 +1295,9 @@ static bool btmtksdio_sdio_wakeup(struct hci_dev *hdev)
>   		.wakeup_delay = cpu_to_le16(0x20),
>   	};
>   
> +	if (test_bit(BTMTKSDIO_INBAND_WAKEUP, &bdev->tx_state))
> +		return may_wakeup;
> +
>   	if (may_wakeup && bdev->data->chipid == 0x7921) {
>   		struct sk_buff *skb;
>   
> @@ -1384,6 +1388,10 @@ static int btmtksdio_probe(struct sdio_func *func,
>   	 */
>   	pm_runtime_put_noidle(bdev->dev);
>   
> +	/* Mark if the mmc host can support waken by SDIO */

Maybe:

Mark if MMC host supports wake on bluetooth by SDIO

> +	if (device_can_wakeup(func->card->host->parent))
> +		set_bit(BTMTKSDIO_INBAND_WAKEUP, &bdev->tx_state);
> +
>   	err = device_init_wakeup(bdev->dev, true);
>   	if (err)
>   		bt_dev_err(hdev, "failed to initialize device wakeup");


Kind regards,

Paul

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
