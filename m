Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843EBC77B73
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 10:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UNSvuvrQGvwdxH/qdhsUYjzWunRTiKdWvSzt8OcjbNQ=; b=roE7HsGnNuFPtFvFLZEwfusZEm
	OJGQNtUPP/g61wqF0BGaIwRoVhJJ7/VBW05GnZJpE30Xb4BAti0gwEOMt9/swrikJYmnzvB4iYqtF
	VHvq74LOUDIgWc6wkoYeCxyfRXT7RxYf51r5yLJhp2frv1Oo9A2eKwJYApbBR8ncjdCPkD30/BK9d
	aAzlsIBU18DJXFnLJivqeKCad23lhTGTLgox5dYB22p8oU4zLd+HcsC91+OnAEOcN1mf54tzCh9nk
	+E2ylFA2zZvf4ArwspRO6240kt6oPyn+Zo3zEpml8Y9DZNiFkIU12mvSdE/0lVtjqWshPxW8zRyYc
	Ug1sQGsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1lI8-00D2on-2q;
	Wed, 24 May 2023 10:00:24 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1lI6-00D2oM-08
	for linux-mediatek@lists.infradead.org;
	Wed, 24 May 2023 10:00:23 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2533b600d35so44629a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 24 May 2023 03:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684922419; x=1687514419;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNSvuvrQGvwdxH/qdhsUYjzWunRTiKdWvSzt8OcjbNQ=;
        b=Ov0+DpbPgrrIqbyKmxJ+eJ4OawMMguWIsxAEKBxkEwH9mGRlImk+DEcubbX31amMYS
         /gER4DSD7hEX9AuQYr0rQy4ZSHTJDKwdxeWkKQ+S0sD/JE/rInkDwSiOBt/oDV5wRxfb
         vWE9PDql6Nyda03C2wIETWhGABocjrwVTWq6tg9TO5tSmQoKuvCZ2l2KEct442PhJQyB
         o2e70YCyKVuFVmCLmUG57s07QejSurdW3IVS1RmgyC5hPFvj12rXf3rQvXF7ATRl9ZKA
         grZRyK7KBe055EMpJPiS/4SsD6H7G9fki7IX7pmsS7nD2zMm1KWQ9e88edddj97YtOUw
         k0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684922419; x=1687514419;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UNSvuvrQGvwdxH/qdhsUYjzWunRTiKdWvSzt8OcjbNQ=;
        b=DxSOLswvj96ctRCrZoMHQSk2KoT7kAy5lKlRawqHl1nw9Pa58miC5/79ueWxKpWKGF
         16mSaJEj3kEeS83xsVp0g6FGze0z+R9FkrKzSXfEM/X+ua4NCiRY1r4MIGgpaj8UrPq0
         F24dpqfJDrWh/leD6FX1D5aY+B6+eW8CSm5qA16FPnDaU/Gaw6PHUt/zxy43cJ1qYFWa
         ZeUtRnrLwvz+wi+Kz5Mou1BiMo+ykAR40pB30um5lNlo0UdlNuvCEL3VhixRg10C/jg/
         1NTqfRCFfpGrCjaARM6c8IrrhPRiwYUQVEcN/eLRpEf/8G6eVFb3NhpqE4YGEYsfSEn8
         7Gvg==
X-Gm-Message-State: AC+VfDye2L9PthbNZ1ypVREk0yB4YNI808ocl09qWNoHRh+BHE4V2u3i
	HGpCH5C4Vo1Km+PKUNoDv8D2MsV2DOk=
X-Google-Smtp-Source: ACHHUZ4HzUkejSTlixUkOvAE8dm9+V31YmC0hmTMMOxd/VAwP5P9I9OQi2IKm7VCjKB7xthZmInJaw==
X-Received: by 2002:a17:90a:ab08:b0:234:889f:c35d with SMTP id m8-20020a17090aab0800b00234889fc35dmr15271241pjq.3.1684922418865;
        Wed, 24 May 2023 03:00:18 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-28.three.co.id. [180.214.232.28])
        by smtp.gmail.com with ESMTPSA id 137-20020a63028f000000b0053423447a12sm7515016pgc.73.2023.05.24.03.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 03:00:18 -0700 (PDT)
Message-ID: <a8461137-0c87-fd7d-8354-5b8675d8e45d@gmail.com>
Date: Wed, 24 May 2023 16:59:41 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux USB <linux-usb@vger.kernel.org>,
 "Linux Bluetooth (Bluez)" <linux-bluetooth@vger.kernel.org>,
 Linux MediaTek <linux-mediatek@lists.infradead.org>
Cc: Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sean Wang <sean.wang@mediatek.com>, Alberto Garcia <berto@igalia.com>,
 Aaron Ma <aaron.ma@canonical.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: Foxconn / Hon Hai Bluetooth adapter 0489:e0cd stops working on
 ThinkPad T14s AMD Gen1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_030022_103117_3F379A47 
X-CRM114-Status: GOOD (  33.67  )
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

Hi,

I notice a bug report on Bugzilla [1]. Quoting from it:

> Hi,
> 
> I'm running Linux on a ThinkPad T14s AMD Gen 1 and I'm having problems
> with its Bluetooth adapter.
> 
> The adapter is a Foxconn / Hon Hai, USB ID 0489:e0cd, and it uses the
> Mediatek MT7921 driver. Sometimes it just works but often if I suspend
> the laptop and come back it stops working. This also happens when I
> use the RF kill switch. The kernel errors vary a bit depending on the
> moment but it's usually a combination of these:
> 
> kernel: Bluetooth: hci0: Failed to get device id (-108)
> kernel: Bluetooth: hci0: Failed to get fw version (-108)
> kernel: bluetooth hci0: firmware: direct-loading firmware mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin
> kernel: Bluetooth: hci0: Execution of wmt command timed out
> kernel: Bluetooth: hci0: Failed to send wmt patch dwnld (-110)
> kernel: Bluetooth: hci0: Failed to set up firmware (-110)
> kernel: Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection command is advertised, but not supported.
> 
> Interestingly I noticed that if I try to use it on a Linux VM (using
> USB passthrough) it generally works better, even when it's not working
> on the host and the guest and the host are running the same OS and
> kernel version. Still it fails sometimes, although the error messages
> tend to be a bit different:
> 
> kernel: usbcore: registered new interface driver btusb
> kernel: Bluetooth: hci0: Device setup in 153593 usecs
> kernel: Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection command is advertised, but not supported.
> kernel: Bluetooth: hci0: Opcode 0x c03 failed: -110
> kernel: Bluetooth: hci0: Failed to read MSFT supported features (-110)
> kernel: Bluetooth: hci0: AOSP get vendor capabilities (-110)
> 
> (I also tried the adapter with a Windows VM, again using USB
> passthrough, but here it works perfectly fine)
> 
> Back to the host I found out that resetting the adapter using
> "usb_modeswitch -R -v 0489 -p e0cd" sometimes is enough to bring the
> adapter back to life and make it work. But this doesn't always
> succeed, and at some point I end up in a situation like this:
> 
> kernel: xhci_hcd 0000:06:00.4: xHCI host not responding to stop endpoint command
> kernel: xhci_hcd 0000:06:00.4: xHCI host controller not responding, assume dead
> kernel: xhci_hcd 0000:06:00.4: HC died; cleaning up
> 
> Sometimes I can get out of it with this:
> 
> $ echo 0000:06:00.4 > /sys/bus/pci/drivers/xhci_hcd/unbind
> $ echo 0000:06:00.4 > /sys/bus/pci/drivers/xhci_hcd/bind
> 
> All this has been happening since I got the laptop, but I'm testing it
> now with Linux 6.3.3 and the problem is still there.
> 
> The end result is that I basically cannot rely on the USB adapter so I
> have it almost always disabled.
> 
> A bit more information about the system:
> 
> $ lspci -nn | grep USB
> 02:00.4 USB controller [0c03]: Realtek Semiconductor Co., Ltd. RTL811x EHCI host controller [10ec:816d] (rev 0e)
> 05:00.0 USB controller [0c03]: Renesas Technology Corp. uPD720202 USB 3.0 Host Controller [1912:0015] (rev 02)
> 06:00.3 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne USB 3.1 [1022:1639]
> 06:00.4 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne USB 3.1 [1022:1639]
> 
> $ lsusb
> Bus 007 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 006 Device 003: ID 0489:e0cd Foxconn / Hon Hai Wireless_Device
> Bus 006 Device 002: ID 06cb:00bd Synaptics, Inc. Prometheus MIS Touch Fingerprint Reader
> Bus 006 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 005 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 004 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 003 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 002 Device 002: ID 04f2:b6cb Chicony Electronics Co., Ltd Integrated Camera
> Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> 

See bugzilla for the full thread.

The reporter said that the bluetooth adapter works well on Windows VM via
device passthrough, but not on Linux host.

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217475

-- 
An old man doll... just what I always wanted! - Clara

