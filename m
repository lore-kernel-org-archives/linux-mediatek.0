Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B33E7BDB0
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Feb 2026 12:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UlDGfFZMFg2LbDgZploC3uTDhh0m7NDFkuYt90ab8PE=; b=hNIvdtNGDoTLjiNt2NJRqjrpaR
	IEEQYzVk/hiuEOhDgoKxQyzwzRINs78QMQtkyfhF5z4qzdNK/0c2qQrMEnWYbz35WdMs+V0mXmLWH
	czwwymNXw4RPFL4N7XU6c0gJvySbsm8c54L49aBO+VHtdSWujPCIlFcm7Q+3HIHlzHYilFkaoBoMJ
	ALM0fkS0ZvLyi2wnHj+uNwvm8diw32j3sMi71DN6o7ypJXTpor0b9ICxKd/IHcaNQJeXgFzJlOOno
	EICDo3c52L9pM+PTbB9dPyemZ7udgIVpoN0ahjmYvIvMPGNmdQYZv/jFDFPoTNf1yMs+AJrHisHvg
	eiXqxuBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vry8Q-00000006Yuc-0Pc9;
	Mon, 16 Feb 2026 12:55:30 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vry8M-00000006Yu5-260X
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Feb 2026 12:55:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771246523;
	bh=wMud/zXsW57h/pzFLrQyWiLWanq9uGVhLdnmh94RKyY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AC4bpm3thsMtP87lemc3eM14HXqf4MEjhDK6TVvGXfJRYVT+6OrpM7w9MakmNjNRR
	 orgwToWFJjxiMGL5YX/VN5TkTG0D/ZkAm+GUN3JquiQw+dyziBO0zO9t606R+Fpg4k
	 UFKGzpCJlGbccREX9PNc6P241OZxCm6MGIxsly3rljmv7R1Mjb8UVrLcYMT4n+Fjm+
	 UJeF+a+lFsAGvawT8e/K6pSjkWiAe6P1g9gy9hMm/NZcVWaQ9mDiDumTMmBcBunRpS
	 zOP4cuXv8OVBvBL/o0BSG3Xk2uR+A2Mg3lnk8lu2XkW4od6CoLszW9EVbHhD7+Msug
	 xgORXVDmAviYg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9082D17E12A9;
	Mon, 16 Feb 2026 13:55:23 +0100 (CET)
Message-ID: <60ff7530-b9a4-47a7-b5bc-3c81a57a4fc0@collabora.com>
Date: Mon, 16 Feb 2026 13:55:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Bluetooth: btusb: Add support for MediaTek MT7902
To: OnlineLearningTutorials <kush.kulshrestha5@gmail.com>,
 luiz.dentz@gmail.com, marcel@holtmann.org
Cc: kush.kulshrestha.5@gmail.com, matthias.bgg@gmail.com,
 linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260214082738.139047-1-kush.kulshrestha.5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260214082738.139047-1-kush.kulshrestha.5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_045526_706329_4DB91F98 
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

Il 14/02/26 09:27, OnlineLearningTutorials ha scritto:
> This patch adds USB IDs for the AzureWave/MediaTek MT7902 Bluetooth
> module.
> The device IDs included are:
> - 13d3:3579
> - 13d3:3580
> - 13d3:3594
> - 13d3:3596
> 
> Signed-off-by: OnlineLearningTutorials <kush.kulshrestha.5@gmail.com>

Please use your real name when you send patches, and also use the get_maintainer.pl
script.

Actually, just read: https://docs.kernel.org/process/submitting-patches.html

Regards,
Angelo

> ---
>   drivers/bluetooth/btmtk.c |  1 +
>   drivers/bluetooth/btusb.c | 10 ++++++++++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> index a8c520dc09e1..b793947dd920 100644
> --- a/drivers/bluetooth/btmtk.c
> +++ b/drivers/bluetooth/btmtk.c
> @@ -1323,6 +1323,7 @@ int btmtk_usb_setup(struct hci_dev *hdev)
>   	case 0x7668:
>   		fwname = FIRMWARE_MT7668;
>   		break;
> +	case 0x7902:
>   	case 0x7922:
>   	case 0x7925:
>   	case 0x7961:
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index fcec8e589e81..13a2aa13b9f4 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -629,6 +629,16 @@ static const struct usb_device_id quirks_table[] = {
>   	/* Additional MediaTek MT7668 Bluetooth devices */
>   	{ USB_DEVICE(0x043e, 0x3109), .driver_info = BTUSB_MEDIATEK |
>   						     BTUSB_WIDEBAND_SPEECH },
> +
> +	/* Additional MediaTek MT7902 Bluetooth devices */
> +	{ USB_DEVICE(0x13d3, 0x3579), .driver_info = BTUSB_MEDIATEK |
> +						     BTUSB_WIDEBAND_SPEECH },
> +	{ USB_DEVICE(0x13d3, 0x3580), .driver_info = BTUSB_MEDIATEK |
> +						     BTUSB_WIDEBAND_SPEECH },
> +	{ USB_DEVICE(0x13d3, 0x3594), .driver_info = BTUSB_MEDIATEK |
> +						     BTUSB_WIDEBAND_SPEECH },
> +	{ USB_DEVICE(0x13d3, 0x3596), .driver_info = BTUSB_MEDIATEK |
> +						     BTUSB_WIDEBAND_SPEECH },
>   
>   	/* Additional MediaTek MT7920 Bluetooth devices */
>   	{ USB_DEVICE(0x0489, 0xe134), .driver_info = BTUSB_MEDIATEK |



