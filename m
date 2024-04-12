Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B47C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Apr 2024 07:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UG3mp0nc5eL4mBD51NY/4JD9bkSZ9RrGxenB4budZI0=; b=DatVskJNDHRZU0nAMnmGDSTw9/
	zo/FEpbiC6+Qj122QV2GgMw7XcWtojA3Sy1rDiJh0jOkK9Qtnrg+5LLwA9c2c9tjfN+S6B+KDINi9
	/HVIsUclvUEqe6ZZA1SqRget1CVHZB/TB20TeK5+4rCstLSXgTqxVAV5bmCp89+edTePshzjlW5Ym
	WwfCaz4G8oDmHH9TnrI7mEaxrE/EQTBrIEe5zXxUieLAHLtGrWgns1Qcl17pFeKlMMvBnUIBLZY14
	wwbzrtPGSzv8tayj+Vk4lvXshm2hgFS7p2WodXedtQRmHQYKSaxQWTLdke0pIlWCc8Fiki8q/32jl
	Wp7gHTxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBP2-0000000Fria-1jcV;
	Fri, 12 Apr 2024 07:32:52 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBOw-0000000Frbr-2PaH
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Apr 2024 07:32:50 +0000
Received: from [172.18.169.210] (ip-185-104-138-49.ptr.icomera.net [185.104.138.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 40BCE61E5FE01;
	Fri, 12 Apr 2024 09:32:20 +0200 (CEST)
Message-ID: <74e93b3c-66c2-45e6-a1e1-0679ac59371c@molgen.mpg.de>
Date: Fri, 12 Apr 2024 09:32:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] Bluetooth: btusb: Add USB HWID to usb_device_id table
 for Acer NB
To: Jiande Lu <jiande.lu@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Von Dentz <luiz.dentz@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Chris Lu <chris.lu@mediatek.com>, Deren Wu <deren.Wu@mediatek.com>,
 Aaron Hou <aaron.hou@mediatek.com>, Steve Lee <steve.lee@mediatek.com>,
 linux-bluetooth <linux-bluetooth@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
References: <20240412064307.6478-1-jiande.lu@mediatek.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20240412064307.6478-1-jiande.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_003246_781726_767B4102 
X-CRM114-Status: GOOD (  17.83  )
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

Dear Jiande,


Thank you for your patches. Some minor comments from side.

Am 12.04.24 um 08:43 schrieb Jiande Lu:
> From: "jiande.lu" <jiande.lu@mediatek.com>

I’d spell your name Jiande Lu:

     $ git config --global user.name "Jiande Lu"
     $ git commit --amend -s --author="Jiande Lu <jiande.lu@mediatek.com>"

For the commit message summary/title, I’d use:

Bluetooth: btusb: Add USB HW ids for MT7921/MT7922/MT7925

> This commit add HWID for wireless modules specific to Acer

This commit add*s* is redundant. Just use imperative mood: Add HW ids for …

> notebook models to ensure proper recongnition and functionality

recognition

> 
> Https://acer.com/tw-zh/support/product-support/
> SFE16-42/NX.KH5TA.0.01/downloads

Please put it in one line and spell the schema https:// all lowercase.

It’d be great if you listed the models in the commit message too, and 
mentioned, on what device you tested your change.

> Signed-off-by: jiande.lu <jiande.lu@mediatek.com>
> ---
> v4: Update title
> ---
> v3: Fix patch fail
> ---
> v2: Update commit description and fix typo
> ---
> ---
>   drivers/bluetooth/btusb.c | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index c391e612b83b..b71efca2af73 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -616,6 +616,9 @@ static const struct usb_device_id quirks_table[] = {
>   	{ USB_DEVICE(0x0e8d, 0x0608), .driver_info = BTUSB_MEDIATEK |
>   						     BTUSB_WIDEBAND_SPEECH |
>   						     BTUSB_VALID_LE_STATES },
> +	{ USB_DEVICE(0x13d3, 0x3606), .driver_info = BTUSB_MEDIATEK |
> +						     BTUSB_WIDEBAND_SPEECH |
> +						     BTUSB_VALID_LE_STATES },

Unfortunately, these entries are not sorted by the id. Can you please 
send a follow-up patch to sort the ids in these sections?

>   	/* MediaTek MT7922 Bluetooth devices */
>   	{ USB_DEVICE(0x13d3, 0x3585), .driver_info = BTUSB_MEDIATEK |
> @@ -662,11 +665,32 @@ static const struct usb_device_id quirks_table[] = {
>   	{ USB_DEVICE(0x35f5, 0x7922), .driver_info = BTUSB_MEDIATEK |
>   						     BTUSB_WIDEBAND_SPEECH |
>   						     BTUSB_VALID_LE_STATES },
> +	{ USB_DEVICE(0x13d3, 0x3614), .driver_info = BTUSB_MEDIATEK |
> +						     BTUSB_WIDEBAND_SPEECH |
> +						     BTUSB_VALID_LE_STATES },
> +	{ USB_DEVICE(0x13d3, 0x3615), .driver_info = BTUSB_MEDIATEK |
> +						     BTUSB_WIDEBAND_SPEECH |
> +						     BTUSB_VALID_LE_STATES },
> +	{ USB_DEVICE(0x04ca, 0x38e4), .driver_info = BTUSB_MEDIATEK |
> +						     BTUSB_WIDEBAND_SPEECH |
> +						     BTUSB_VALID_LE_STATES },
> +	{ USB_DEVICE(0x13d3, 0x3605), .driver_info = BTUSB_MEDIATEK |
> +						     BTUSB_WIDEBAND_SPEECH |
> +						     BTUSB_VALID_LE_STATES },
> +	{ USB_DEVICE(0x13d3, 0x3607), .driver_info = BTUSB_MEDIATEK |
> +						     BTUSB_WIDEBAND_SPEECH |
> +						     BTUSB_VALID_LE_STATES },

Please sort the entries.

>   	/* Additional MediaTek MT7925 Bluetooth devices */
> +	{ USB_DEVICE(0x0489, 0xE113), .driver_info = BTUSB_MEDIATEK |
> +						     BTUSB_WIDEBAND_SPEECH |
> +						     BTUSB_VALID_LE_STATES },

Lowercase: 0xe113

>   	{ USB_DEVICE(0x13d3, 0x3602), .driver_info = BTUSB_MEDIATEK |
>   						     BTUSB_WIDEBAND_SPEECH |
>   						     BTUSB_VALID_LE_STATES },
> +	{ USB_DEVICE(0x13d3, 0x3603), .driver_info = BTUSB_MEDIATEK |
> +						     BTUSB_WIDEBAND_SPEECH |
> +						     BTUSB_VALID_LE_STATES },
>   
>   	/* Additional Realtek 8723AE Bluetooth devices */
>   	{ USB_DEVICE(0x0930, 0x021d), .driver_info = BTUSB_REALTEK },


Kind regards,

Paul

