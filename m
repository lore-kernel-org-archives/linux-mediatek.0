Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7063BD132D8
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Nov 2024 14:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KS/iA/T78Z9Z8fDNSbktv47MrXWtGpPEJwyTyY9z958=; b=wAUGBPfPIDFqQfI6cF+uMtTATL
	RWYrfTZk1Buw87MgJwY69wiW4iVtAjJASrpo5BzO/sf/WqA8cvB3Kuun4NmOYXDh9eHIgrnmxFTk+
	mMNB5Bvsu1CSDQjzIGEnbW887+BSYYVR92Ku4aoHYm/iSODrT3S3HsaqqaiGvIr+7jdGtVyWgwPNO
	n01Y1Q50SZcMtuV/bX+hSwCivxw/ajQ8uDvNBvQCZSLeMwjfVz9odZAE4JBcspPniOWDstfeRs6LK
	KFnNdo8u56W6ILGIUtXt7wY7b8SfhNkD1Xg098Y468jsqlvYTZCaZb3VjslmXxIchPBUFsprOm2gE
	rpguT0BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7yKb-0000000E6a2-0rWZ;
	Mon, 04 Nov 2024 14:45:25 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xwY-0000000E1ty-2FQo
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Nov 2024 14:20:46 +0000
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 129D261E5FE05;
	Mon, 04 Nov 2024 15:20:17 +0100 (CET)
Message-ID: <fa008e7b-92c8-440f-9e56-9d58e9b3bb93@molgen.mpg.de>
Date: Mon, 4 Nov 2024 15:20:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Bluetooth: btusb: Add new HWIDs for MT7925
To: Jiande Lu <jiande.lu@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Von Dentz <luiz.dentz@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Chris Lu <chris.lu@mediatek.com>, Deren Wu <deren.Wu@mediatek.com>,
 Aaron Hou <aaron.hou@mediatek.com>, Steve Lee <steve.lee@mediatek.com>,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20241104131904.30447-1-jiande.lu@mediatek.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20241104131904.30447-1-jiande.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_062034_773521_B54F854F 
X-CRM114-Status: GOOD (  12.74  )
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


Am 04.11.24 um 14:19 schrieb Jiande Lu:
> Add below HWIDs for MediaTek MT7925 USB Bluetooth chip.
> VID 0x0489, PID 0xe14f
> VID 0x0489, PID 0xe150
> VID 0x0489, PID 0xe151
> 
> Patch has been tested successfully and controller is recognized
> device pair successfully.
> 
> MT7925 module bring up message as below.
> Bluetooth: Core ver 2.22
> Bluetooth: HCI device and connection manager initialized
> Bluetooth: HCI socket layer initialized
> Bluetooth: L2CAP socket layer initialized
> Bluetooth: SCO socket layer initialized
> Bluetooth: hci0: HW/SW Version: 0x00000000, Build Time: 20240816133202
> Bluetooth: hci0: Device setup in 286558 usecs
> Bluetooth: hci0: HCI Enhanced Setup Synchronous
> Connection command is advertised, but not supported.

No line wrapping needed.

> Bluetooth: hci0: AOSP extensions version v1.00
> Bluetooth: BNEP (Ethernet Emulation) ver 1.3
> Bluetooth: BNEP filters: protocol multicast
> Bluetooth: BNEP socket layer initialized
> Bluetooth: MGMT ver 1.22
> Bluetooth: RFCOMM TTY layer initialized
> Bluetooth: RFCOMM socket layer initialized
> Bluetooth: RFCOMM ver 1.11
> 
> Signed-off-by: Jiande Lu <jiande.lu@mediatek.com>
> ---
>   drivers/bluetooth/btusb.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 6dc5a7e76558..77b8500f8e9b 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -658,6 +658,12 @@ static const struct usb_device_id quirks_table[] = {
>   						     BTUSB_WIDEBAND_SPEECH },
>   	{ USB_DEVICE(0x0489, 0xe139), .driver_info = BTUSB_MEDIATEK |
>   						     BTUSB_WIDEBAND_SPEECH },
> +	{ USB_DEVICE(0x0489, 0xe14f), .driver_info = BTUSB_MEDIATEK |
> +						     BTUSB_WIDEBAND_SPEECH },
> +	{ USB_DEVICE(0x0489, 0xe150), .driver_info = BTUSB_MEDIATEK |
> +						     BTUSB_WIDEBAND_SPEECH },
> +	{ USB_DEVICE(0x0489, 0xe151), .driver_info = BTUSB_MEDIATEK |
> +						     BTUSB_WIDEBAND_SPEECH },
>   	{ USB_DEVICE(0x13d3, 0x3602), .driver_info = BTUSB_MEDIATEK |
>   						     BTUSB_WIDEBAND_SPEECH },
>   	{ USB_DEVICE(0x13d3, 0x3603), .driver_info = BTUSB_MEDIATEK |

With the small thing fixed:

Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul

