Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C935CC6369F
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Feb 2026 15:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RwMyY8SrnHU2z32vgoGv2ovly9AsWZ9ieYYoE4/CChA=; b=2Ad6WERCcmEtDdpieAHPg59Wse
	quud1ytKPZuJ3iEjjQCTi4k/DRhom81TWbZumPJ+k+KkLF+16f6e0okoBC6++GtUxth9K9epKT6Px
	gGG44UoSLoZ0lvKYvsOlHrwdxsA+YrTijNSoCE77f2pP7q2S1nj3oFDVKqP5/bxZM9m/4u4kDxBjL
	ALAgbEAl+HDTQnjVnAcUBm+YGZH+A3C+EFHMBvGfy/JHDbrE4NVALo7H+JSS3xusmWn/0bfx4ts/q
	UTX4K40cmVni556Iotbu62BVrRakJiN5/Sv9eZyygNgr4Fgy+hRWaVGd2YIFkBJDd4Obk0wwXFCz8
	9nCUf8ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuBGl-0000000GmKz-27Lk;
	Sun, 22 Feb 2026 15:21:15 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuBGj-0000000GmKb-2bDv
	for linux-mediatek@lists.infradead.org;
	Sun, 22 Feb 2026 15:21:14 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-483a233819aso32877725e9.3
        for <linux-mediatek@lists.infradead.org>; Sun, 22 Feb 2026 07:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771773671; x=1772378471; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RwMyY8SrnHU2z32vgoGv2ovly9AsWZ9ieYYoE4/CChA=;
        b=LZJ0jkHMD82BPEcq5zr/HExvxHP+cR6rlMuaNTrUrV4DzpZIUbyaCOvEr+I24mAztw
         wqP57DHNaWVVmlAgnLjdKFjsYaKZXLCUoqUKjvbpSFats8Ch/XjIff9sP67c/5z3Y/UQ
         Wg91Z9TPVt4ak0D4nchq9KDTX+1nlLYZI202Dino30PdLixMT5Rbf2TEOLweoZgbQpok
         /0JY1yUBB+IDff7uw6x8yA63c8xNJ6qRuRrJ3WQj//NxTUCBnF8V5TOIBLotgDeqZgc5
         zRgbtxusHXbF3llwn6uJ6oiMiwXP8UCz1beSJCHF7/aNNsFfDcp8yVsW6ts17GVoEZZE
         EUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771773671; x=1772378471;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RwMyY8SrnHU2z32vgoGv2ovly9AsWZ9ieYYoE4/CChA=;
        b=f0kbFq+gyo5pbTNM3Kv+Mx4OI4r1ItgzNQxmFcIeTdCVaxsRSpWeKkbXm9ka6pdcwS
         JxZqq1JlOrfpR81iHBZv2yqJ/UF42mtFTA/cDh4dcE4ZCPnP6u/cGYPfR64GhWmLEIfV
         XSFcQGE0CswQAqTlIR+ugWJ2Cjta/hzrsCGPqWqadYf2xWBdIrpiveUyU+GfFLMQ7VBj
         l1NSfldB7czQ2X0WZiLI02mB1n7ySqfrAk2XC8iizBh691a4bGnkGGV05hYq1hyOaK2F
         0GUgXAnxFW9GQvWWYouC0AMzhkaXXHhhBgGBGVj9x5510xfMWGp2aZkJJSGtkqzy2FlJ
         +9cg==
X-Forwarded-Encrypted: i=1; AJvYcCUIaf062BmVuOTxkee97QLqwCryFW+25Qp17fVTJ69c/OIxnSNfPguzTX2nbB+weD+tBMJuGChzg+jT3VO0nw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr2IFxOmMcDDPk2D6vBNID0LVnGbdXu8rfl6VxlZqrH8nfMo/S
	z5jpLXlblAN1u/+qEuxQe87OhV56LeVAVCZZwKPL+QMH7+o5lEovEWvy
X-Gm-Gg: AZuq6aLiQDQK62SfnvGpKoxW9gXL2h/NLa+PS5rJ0L6DXYf+14H60wgoZizXY4yHUas
	RmwPL0Bhgiy6BvQHYtUQFFW8V+5hERkj5LVWLTDD/JgG+HntSWenRtMZo9Ua0sL5WolahTxr2hA
	fTFOrfiZ/RXUi+GdvmfMieJINSfxF28bMjqThFLKnqnKTV9aOxnfndvoD4A2L6q9xTg9y+zoQUE
	vSfGjc+r4CDw3GMf1B8eBKRJWOtOkPtaZsddwcVdT6Rmj+4cPZffZkT/M/xP4zrbnYCHyxOoS8K
	GNlDTv6QJxdaZziODS4y4Sie/HiGtZJfXIsJI7svI2c/8iOzjm/kKaKif+WAcUYuPWpLS172Dms
	I+vc2bTyL52xo0an8Nk/TVIu/+kpRCFo2WlOGL9KPwRB1fDnsKWur9GEHC83Y0rTMqh+Dzs8ram
	0xo/h2FuJ1ldUe39fgPpnbWkGN34imXg==
X-Received: by 2002:a05:600c:4fd5:b0:483:498f:7963 with SMTP id 5b1f17b1804b1-483a9637a61mr79460125e9.26.1771773670964;
        Sun, 22 Feb 2026 07:21:10 -0800 (PST)
Received: from [192.168.1.50] ([81.196.40.93])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31f0330sm177582775e9.9.2026.02.22.07.21.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Feb 2026 07:21:10 -0800 (PST)
Message-ID: <11ad2bab-deb7-4a8d-966a-75ffd2bb8e71@gmail.com>
Date: Sun, 22 Feb 2026 17:21:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: Re: [PATCH 3/4] Bluetooth: btusb: Add new VID/PID 13d3/3579 for
 MT7902
To: Sean Wang <sean.wang@kernel.org>, marcel@holtmann.org,
 luiz.dentz@gmail.com, ulf.hansson@linaro.org
Cc: linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-mmc@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>
References: <20260219231624.8226-1-sean.wang@kernel.org>
 <20260219231624.8226-3-sean.wang@kernel.org>
Content-Language: en-US
In-Reply-To: <20260219231624.8226-3-sean.wang@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_072113_787952_2A3E2506 
X-CRM114-Status: GOOD (  13.29  )
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

On 20/02/2026 01:16, Sean Wang wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Add VID 13d3 & PID 3633 for MediaTek MT7922 USB Bluetooth chip.
> 

Hi, there is a copy paste error.

> The information in /sys/kernel/debug/usb/devices about the Bluetooth
> device is listed as the below.
> 
> T:  Bus=01 Lev=01 Prnt=01 Port=09 Cnt=04 Dev#=  7 Spd=480  MxCh= 0
> D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
> P:  Vendor=13d3 ProdID=3579 Rev= 1.00
> S:  Manufacturer=MediaTek Inc.
> S:  Product=Wireless_Device
> S:  SerialNumber=000000000
> C:* #Ifs= 3 Cfg#= 1 Atr=e0 MxPwr=100mA
> A:  FirstIf#= 0 IfCount= 3 Cls=e0(wlcon) Sub=01 Prot=01
> I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=125us
> E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=83(I) Atr=01(Isoc) MxPS=   0 Ivl=1ms
> E:  Ad=03(O) Atr=01(Isoc) MxPS=   0 Ivl=1ms
> I:  If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=83(I) Atr=01(Isoc) MxPS=   9 Ivl=1ms
> E:  Ad=03(O) Atr=01(Isoc) MxPS=   9 Ivl=1ms
> I:  If#= 1 Alt= 2 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=83(I) Atr=01(Isoc) MxPS=  17 Ivl=1ms
> E:  Ad=03(O) Atr=01(Isoc) MxPS=  17 Ivl=1ms
> I:  If#= 1 Alt= 3 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=83(I) Atr=01(Isoc) MxPS=  25 Ivl=1ms
> E:  Ad=03(O) Atr=01(Isoc) MxPS=  25 Ivl=1ms
> I:  If#= 1 Alt= 4 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=83(I) Atr=01(Isoc) MxPS=  33 Ivl=1ms
> E:  Ad=03(O) Atr=01(Isoc) MxPS=  33 Ivl=1ms
> I:  If#= 1 Alt= 5 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=83(I) Atr=01(Isoc) MxPS=  49 Ivl=1ms
> E:  Ad=03(O) Atr=01(Isoc) MxPS=  49 Ivl=1ms
> I:  If#= 1 Alt= 6 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=83(I) Atr=01(Isoc) MxPS=  63 Ivl=1ms
> E:  Ad=03(O) Atr=01(Isoc) MxPS=  63 Ivl=1ms
> I:  If#= 2 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=8a(I) Atr=03(Int.) MxPS=  64 Ivl=125us
> E:  Ad=0a(O) Atr=03(Int.) MxPS=  64 Ivl=125us
> I:* If#= 2 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=8a(I) Atr=03(Int.) MxPS= 512 Ivl=125us
> E:  Ad=0a(O) Atr=03(Int.) MxPS= 512 Ivl=125us
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/bluetooth/btusb.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 247d6aff5e79..c8c50daec967 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -671,7 +671,8 @@ static const struct usb_device_id quirks_table[] = {
>  						     BTUSB_WIDEBAND_SPEECH },
>  	{ USB_DEVICE(0x13d3, 0x3606), .driver_info = BTUSB_MEDIATEK |
>  						     BTUSB_WIDEBAND_SPEECH },
> -
> +	{ USB_DEVICE(0x13d3, 0x3579), .driver_info = BTUSB_MEDIATEK |
> +						     BTUSB_WIDEBAND_SPEECH },
>  	/* MediaTek MT7922 Bluetooth devices */
>  	{ USB_DEVICE(0x13d3, 0x3585), .driver_info = BTUSB_MEDIATEK |
>  						     BTUSB_WIDEBAND_SPEECH },

My MT7902 card bought from Aliexpress has a different USB ID: 0e8d 1ede.

    T:  Bus=01 Lev=01 Prnt=01 Port=05 Cnt=02 Dev#=  4 Spd=480  MxCh= 0
    D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
    P:  Vendor=0e8d ProdID=1ede Rev= 1.00
    S:  Manufacturer=MediaTek Inc.
    S:  Product=Wireless_Device
    S:  SerialNumber=000000000
    C:* #Ifs= 3 Cfg#= 1 Atr=e0 MxPwr=100mA
    A:  FirstIf#= 0 IfCount= 3 Cls=e0(wlcon) Sub=01 Prot=01
    I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
    E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=125us
    E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
    I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
    E:  Ad=83(I) Atr=01(Isoc) MxPS=   0 Ivl=1ms
    E:  Ad=03(O) Atr=01(Isoc) MxPS=   0 Ivl=1ms
    I:  If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
    E:  Ad=83(I) Atr=01(Isoc) MxPS=   9 Ivl=1ms
    E:  Ad=03(O) Atr=01(Isoc) MxPS=   9 Ivl=1ms
    I:  If#= 1 Alt= 2 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
    E:  Ad=83(I) Atr=01(Isoc) MxPS=  17 Ivl=1ms
    E:  Ad=03(O) Atr=01(Isoc) MxPS=  17 Ivl=1ms
    I:  If#= 1 Alt= 3 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
    E:  Ad=83(I) Atr=01(Isoc) MxPS=  25 Ivl=1ms
    E:  Ad=03(O) Atr=01(Isoc) MxPS=  25 Ivl=1ms
    I:  If#= 1 Alt= 4 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
    E:  Ad=83(I) Atr=01(Isoc) MxPS=  33 Ivl=1ms
    E:  Ad=03(O) Atr=01(Isoc) MxPS=  33 Ivl=1ms
    I:  If#= 1 Alt= 5 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
    E:  Ad=83(I) Atr=01(Isoc) MxPS=  49 Ivl=1ms
    E:  Ad=03(O) Atr=01(Isoc) MxPS=  49 Ivl=1ms
    I:  If#= 1 Alt= 6 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
    E:  Ad=83(I) Atr=01(Isoc) MxPS=  63 Ivl=1ms
    E:  Ad=03(O) Atr=01(Isoc) MxPS=  63 Ivl=1ms
    I:  If#= 2 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
    E:  Ad=8a(I) Atr=03(Int.) MxPS=  64 Ivl=125us
    E:  Ad=0a(O) Atr=03(Int.) MxPS=  64 Ivl=125us
    I:* If#= 2 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
    E:  Ad=8a(I) Atr=03(Int.) MxPS= 512 Ivl=125us
    E:  Ad=0a(O) Atr=03(Int.) MxPS= 512 Ivl=125us


