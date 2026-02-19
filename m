Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4737E9A04F
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Feb 2026 19:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+XAgVMBora+HyEYRoK5wyHtWEdaWoonxIPF+xvMxe8=; b=pVfezv+gQOFLdo+gg/6moAGszF
	PWw1X3TURjWqkCFlGqiDw74Pc0q9txW5B0RYehBBLpyLrY+64yapMICPeB2ygn4EIZHc9xrbNSzdS
	85m1PYLUvWLp0GxE8jIHFaRyiYCLQpgiEQfv6IN9GabwiEbxmCwm7dIczhTZz83f8dBf/Is9FqceM
	MTx1pe7Umv5orN6sYWh4i4VaIX1bS9ghfep/yy4g/ghrne9olpfttgr/iTvFmASfoEAHBBhyFJmN4
	sltTtvj/tdDF1YpSpAkwAq8LsNwpWhVqvkVX+N4TkVlX5/tpjX7/aGoHQyjlUkfjjQAZifSqgXT3g
	yYthsZ/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt9XT-0000000BpSs-1rfB;
	Thu, 19 Feb 2026 19:18:15 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt9XQ-0000000BpPL-2gE7
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Feb 2026 19:18:14 +0000
Received: from [10.55.231.83] (unknown [46.189.28.125])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 1B2CF4C2CA0D00;
	Thu, 19 Feb 2026 20:17:54 +0100 (CET)
Message-ID: <1f71c72b-32c5-459f-bec2-4f2d58ed5569@molgen.mpg.de>
Date: Thu, 19 Feb 2026 20:17:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Bluetooth: btusb: Add Lite-On 04ca:3807 for MediaTek
 MT7921
To: Dylan Eray <dylan.eray6@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com,
 sean.wang@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260219191102.64722-1-dylan.eray6@gmail.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20260219191102.64722-1-dylan.eray6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_111812_829197_05E0AEB1 
X-CRM114-Status: GOOD (  15.28  )
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

Dear Dylan,


Thank you for your patch.

Am 19.02.26 um 20:11 schrieb Dylan Eray:
> Add USB device ID (04ca:3807) for a Lite-On Wireless_Device containing
> a MediaTek MT7921 (MT7920) Bluetooth chipset found in Acer laptops.
> 
> Without this entry, btusb binds via the generic USB class-based wildcard
> match but never sets the BTUSB_MEDIATEK flag. This means btmtk never
> triggers firmware loading, and the driver sends a raw HCI Reset that
> the uninitialized chip cannot respond to, resulting in:
> 
>    Bluetooth: hci0: Opcode 0x0c03 failed: -110

It’s common to add

> The information in /sys/kernel/debug/usb/devices about the Bluetooth 
> device is listed as the below:

and paste the relevant output into the commit message.

> Signed-off-by: Dylan Eray <dylan.eray6@gmail.com>
> ---
>   drivers/bluetooth/btusb.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index fcec8e5..fd637cf 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -705,6 +705,8 @@ static const struct usb_device_id quirks_table[] = {
>   						     BTUSB_WIDEBAND_SPEECH },
>   	{ USB_DEVICE(0x04ca, 0x3804), .driver_info = BTUSB_MEDIATEK |
>   						     BTUSB_WIDEBAND_SPEECH },
> +	{ USB_DEVICE(0x04ca, 0x3807), .driver_info = BTUSB_MEDIATEK |
> +						     BTUSB_WIDEBAND_SPEECH },
>   	{ USB_DEVICE(0x04ca, 0x38e4), .driver_info = BTUSB_MEDIATEK |
>   						     BTUSB_WIDEBAND_SPEECH },
>   	{ USB_DEVICE(0x13d3, 0x3568), .driver_info = BTUSB_MEDIATEK |

The diff looks good.

With the changes above, feel free to add:

Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul

