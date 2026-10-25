Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A292606A31A
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Oct 2026 12:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SxjONC63;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sDPRWH1S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=lS6FkSKLepK9WNXRPUJcPanRUSiz1CS44f0JGtdiWYM=; b=SxjONC63UnWthRfLMUDhf7TAuj
	vslBy19xjUi4EdT1aXHOxqQjcoSFNwlnHjVbjcLc0tbnT7Ii4Y+TIu8BZmPbz1Do4A4TijzW0DH3s
	l3uu1fFUEiOS8/CS214GtwSic/nXFe1iQY3+ftSptxR2CH0zRlPbOSp9SFEmU2V+Sr1z+/UAR3fh2
	Q0UovxyZTdggmp+QsLdxeDS9ydoViEPD4kNB6xSdUYaEPMiybXFiZqZPS7fTsMSKQAZ1HKABtl+Qn
	7MKKygpKVGn6um+YCY07CF4SWvVgMHk7ty4ySkD0lzjD+yMKFeVVIDsMgaJ+LH3yk2BpL/EFnGOey
	0ifKrpAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKwwy-000000011Wi-3w7z;
	Sun, 25 Oct 2026 12:03:44 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKwww-000000011WB-2HC8
	for linux-mediatek@lists.infradead.org;
	Sun, 25 Oct 2026 12:03:43 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a210470b49so16967315e9.2
        for <linux-mediatek@lists.infradead.org>; Sun, 25 Oct 2026 05:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792929820; x=1793534620; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lS6FkSKLepK9WNXRPUJcPanRUSiz1CS44f0JGtdiWYM=;
        b=sDPRWH1SmawnlWYubhJ9JByFg6Xr6fXi/nvVf4bDLck6pS6cUcfZHZTGNxk8SpGh0n
         X+14dc8uMWp8o5j94M79Z4P2UWSeEChrQclJHcADkSxtLueL3VGA/3hy+7/9R0P52hqF
         9J/+ylSvyBHuXGN1Gk59vK06xtSROae9P24uku8be64ENsl+mDIMaZTw0k/l4OHdhNPo
         79ZkH27enz7yvoWAypiMJMCw4Q//6uNqLAEoLGQGFS4MScCqSnTdvrEPRt2dA0Ov4s4p
         ujx3x8Goc9adOZDX93tWPRujlaxNbj0g8lWCTfJCq7oyPtPnq8fl9C/UEx3GJ6SFmUHF
         J7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792929820; x=1793534620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lS6FkSKLepK9WNXRPUJcPanRUSiz1CS44f0JGtdiWYM=;
        b=brnXM18qNcnAplYJd2zDJFSHYev/ym4HxFN6vI2Rt2cRFOQbaJxpGCQqM7SAOZsNzD
         tJRlSZYZUGUXt94h4xSdKzAwNrVo8FWN2Wtau1VwGdBJ2pTEkat1KrOaElJn7DrG+QXy
         3jgS2jWZB9BYnHCF1AYv4fZOEM62P0VmSvkVDwwvb1sBf/TXGimJItcqKAQe9VczrW05
         WUS3SDSi/bbz5AXeIpql9sFEnfKWgBoE5AUI748LtGnHxMhhapHoZqMzcVPiuEm7Bz40
         HxE77BksBXiJNYhXCS+GG/Zx8rkT+QJ49KLgK2tRXMLLas6fejznlNRZ8ZzU71oYXfVJ
         4OJA==
X-Forwarded-Encrypted: i=1; AKwUvByuwotPxFHcK1Ga6MxF82WPnDEXTFN5rymlS0wwe1/i2iHUXbIQBLVYZPAoF53K5bT7KKOzAFZzX/gaAjhk9g==@lists.infradead.org
X-Gm-Message-State: AFq9FYLv+7eDinpRSLtG1+ovSa1IO8HTOMuh3fw0mk1Vc9I8CxUQOYWS
	+x66/pDNZIF2dKng3sP0nSiY24NEBwtN4Bt0hbJIif4lP3WLqpi4Twfy
X-Gm-Gg: AYBFou2C++vtN6VMjJYQJ+WIzRRmfUE4m9AGsteI/F+t+pzenkZBvAP9anP7U+ZORO9
	ZJIX0CHf4+7W+uUVIUN1vOGYrPcI+x/zIE0JVOeP4gUSgieylGKjuwxC83A1Ef4zoZHoJtJYZuc
	fcP/BGJSGVszGfcIjPtHrauJCgcMdR8smTGF5Wl7prAnfsiy1y2m+ZjZvK2RTBmZPl9imzW0d/f
	K+qaHHKwATa812pqP9865RBlagBwimuagxx7RP5aV8UEXpNKaqd6Cb89qyi7nYNPcrOq33OEijG
	EJpQ+WSKgVAuV/z2k93kbvc8DQb+vRkFC3R6EExefzZ0JOITHt53ge9/soBtSW277rFD8gw/7Hn
	3TSKitmfY76P5GJxC3D3sYvtfW8uEaEbljPxnEruguR8YsV2VbFx+xDpYHiQ/yW02BACqskbrxG
	7tgowlbQBnQQ4+0QHkX3l8U8mmmac1D3FUqJqV4CFeDMPAhrw8+qvMg3oaLOqE36u9fw+OhF46v
	kRekqS23TWj356kFpjUhHQwn+RFRO9n9XS0Zd0j9zUyRekKUaLXJJheOb2s2IZgGv1oZzfeHGJT
	NTUOIjiQU7O/SsDh1CDWNa1v9LfuYElpr7G/1Fz7ffWRAsu6iyPdzKrHwBiCheSB5hcR5jczo4L
	XTOhMMhzuWntWkNE=
X-Received: by 2002:a05:600c:870f:b0:4a2:150f:1613 with SMTP id 5b1f17b1804b1-4a35ac9983emr68238125e9.7.1792929819204;
        Sun, 25 Oct 2026 05:03:39 -0700 (PDT)
Received: from archlinux.tailbe3ea7.ts.net ([46.1.178.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd39a9sm10010492f8f.46.2026.10.25.05.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 05:03:37 -0700 (PDT)
From: Ismail Tarim <ismailtarim7@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Chris Lu <chris.lu@mediatek.com>,
	linux-mediatek@lists.infradead.org
Subject: [BUG] Bluetooth: btmtk: MT7902 does not recover from firmware assert; subsys reset leaves the MCU unresponsive
Date: Sun, 25 Oct 2026 15:03:27 +0300
Message-ID: <20261025120328.1312536-1-ismailtarim7@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_050342_643353_286CA237 
X-CRM114-Status: GOOD (  17.14  )
X-Spam-Score: 1.5 (+)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On an MT7902 (USB 13d3:3579) the Bluetooth firmware asserts on its own
while the machine is idle, at irregular intervals of up to 17 days.
The three failures on 7.2.11 came 8.5 hours, 46 minutes and 12 hours
after a cold boot. After the assert the driver's reset fails and the
device drops off the USB bus. Nothing short of a full power drain
(AC unplugged, power button held) brings it back: warm reboot, S5,
rfkill, port power cycling, the ACPI _RST of the port, PCIe FLR/SBR
of the WiFi half and a WFSYS reset were all tried and none of them
recover it.

This report has three parts: the assert itself, an instrumented trace
of the reset, and a correction to something I wrote in an earlier
patch series.

Setup
-----
  Machine:   ASUS Vivobook Pro 16X (K3605ZV)
  Kernel:    7.2.11 (Arch), includes 59c3ee19ca88 and 21b50c24843b
  Firmware:  mediatek/BT_RAM_CODE_MT7902_1_1_hdr.bin,
             Build Time 20250826211444 (linux-firmware 20260916)

1. The assert
-------------
Twelve natural failures since 2026-08-03. Ten of them were captured
with devcoredump, and all ten carry the same assert:

  <ASSERT> ../bluetooth/system/debug/sys_log_interface_emi.c #811 -
    0, 0x6455, 0x1010707, 0xFF150001, rc=0, BTSYS, id=0x4 idle,
    irq=0x2, isr=0x929A5C (five dumps) / 0x929EEA (five dumps)

  Captured: 2026-08-24, 08-26, 09-12, 09-21, 10-05, 10-10, 10-18,
            10-21, 10-23, 10-25, on kernels from 7.1.8 to 7.2.11

The firmware is idle each time ("id=0x4 idle"); nothing on the host
side precedes it in the log. The full dumps (about 1 MB each) are
available on request.

2. What the reset does after the assert
---------------------------------------
I enabled dynamic debug for btmtk_usb_uhw_reg_read() and
btmtk_usb_subsys_reset() and then compared four natural failures,
2026-10-18 (7.2.6) and 10-21, 10-23, 10-25 (7.2.11), with a reset of
a healthy chip through /sys/class/bluetooth/hci0/reset, which reaches
the same btusb_mtk_reset() path. All four natural failures read
identically:

                              healthy chip     after natural assert
  reg 0x740003a0 (WDT)        0x00000000       0x00000001
  reg 0x74000024              0x00000000       0x00000000
  reg 0x74000308              0x00000000       0x00000000
  reg 0x70002610 (SUBSYS_RST) 0x00000000       0x00000000
  reg 0x70002510 (MISC)       0x00000500       0x00000500
  chip id read (0x70010200)   returns          times out (5.1 s)
  result                      re-enumerates,   descriptor read -110,
                              setup 121 ms     port gone

So the generic reset sequence works on a healthy MT7902, and every
uhw register access still answers after the assert. The RST_DONE bit
in MISC reads the same in both cases, so the "Reset timeout" check
cannot tell a failed reset from a good one here. What does fail is
the vendor read (request 0x63) of the chip id, which times out, and
from then on the device no longer answers descriptor reads. The WDT
register is the only value that differs.

The ~10 s between "Mediatek coredump end" and "Can't get device id"
that shows up on every failure is two USB control timeouts. A
function_graph trace of a triggered dump shows btusb_mtk_reset()
taking 10.47 s, of which usb_driver_release_interface() on the ISO
interface takes 5.35 s: the interface is in altsetting 1, so
usb_unbind_interface() issues SET_INTERFACE(0) to the dead device and
waits out the 5000 ms timeout. The id read accounts for the other
5.1 s. This only adds latency; it does not affect the outcome.

My question for MediaTek: once the firmware has asserted and the WDT
register at 0x740003a0 reads 1, is there a reset sequence that brings
the MT7902 Bluetooth MCU back without removing power? The current
sequence evidently is not enough in that state.

3. Corrections to my earlier series
-----------------------------------
In "Bluetooth: btmtk: fix subsystem reset error reporting" (v2,
https://lore.kernel.org/linux-bluetooth/20260815115624.8309-1-ismailtarim7@gmail.com/)
I got two things wrong, and I'd like to correct them on the list:

  - The cover letter cites an assert in
    system/rom/transport/tra_usb3.c #764 as the firmware failure. That
    assert is produced by triggering a coredump by hand through
    /sys/class/bluetooth/hci0/device/coredump (2 of 2 manual
    triggers). The natural failures assert in
    sys_log_interface_emi.c #811, as above.

  - Patch 1/2 describes the id read succeeding with an id of zero. In
    the natural failures the read times out instead, which the error
    branch already reported correctly before that patch. The patch is
    still correct for the zero-id case, but I had not observed that
    case, and the log line is identical for both.

Neither correction affects the merged code.

Thanks,
Ismail

