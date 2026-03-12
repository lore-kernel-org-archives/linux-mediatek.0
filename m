Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1017C106ACD2
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2026 18:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fMV5vC3gcbuXOcw2NM4uNxcXhHiDoqMd8caf3UgdZJc=; b=ERBaNDkvEyQAFdj8ViiyImDn87
	Kccj6voe1/L2uDxHTpJ9pcGDHO+wZVTXby6PMSN7PQsAcznFc6WPkRh+gNCvs8PEjaTc8nyRVQW0/
	gnlP4ZwFHP33hpiTGVW7za7Tx2sR8AkJI2KX1H2yF8yep6J78BGBG7Xn4FtyxOnIhgBp35fOIwNV5
	+Mf4Gbs0X6Koh6kiC2aq8mliM5t1ms3paWhhwh3iBWz0oouNtnG1Sg9wUx52/xbiLN+u9aHXDyYds
	lACFoynRh4aljeUeQcKjkHXnfBpyOl+HkJ95HJXnJliKwWJKQtxFngeEX1H1TaRyCiYhaPVVCsUxJ
	xdoI5rRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0kgT-0000000EsPU-1NNb;
	Thu, 12 Mar 2026 18:22:57 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0kgQ-0000000EsOs-3vph
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Mar 2026 18:22:56 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6634d819492so2600101a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Mar 2026 11:22:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773339773; cv=none;
        d=google.com; s=arc-20240605;
        b=CJQmLG6LgUv5/OsxI1IpmPrPQTKdv4qhekLN84yNkNNMtUJGPTC8LfTp2Wluf4HBCU
         kS8BJCOhlAZdBFeGt7KQa1FW8ysH8ETCNrzVErespujyXaVdwVLSdCFLBwSuPIlUj+CT
         zE3ciBrkcjRlVkfArlHwIYo/dKjg3YdvobYl9q7BnZeAPYlJaXNWVYJxbQvmP0nCz5bZ
         cgEbXKFLg8+QVqeZaFDhhgrLEcghYVXRZumzVT9XWjVLM2QGsvCAdKnPqPUSXyK0OQIg
         i5Fc+HXQbSDB/9ksMId2rwDCwZ6Pc599h1j2c72/i0HL3uW3n5OgnYXbU2L+J4zCoaKe
         w01A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fMV5vC3gcbuXOcw2NM4uNxcXhHiDoqMd8caf3UgdZJc=;
        fh=HO5nUj+S5o27UuSqKy72Q+1/MvdjH05xj8Dm5jy9d8o=;
        b=XnLRB+m92/RO/0CKedAlDxn1WR4rPBrSeGmQIfgSwDhRNj31v11UxsdYdnnJTR8cdt
         n4sEwn7RqToRg9A169Ph9011kuyRByofi1ZmvMFaEvfti6or7oW0f3q4VFHBIHwEUiX8
         7Au6okKfWG7XJqvXHmKSxXtzku/URpOEniz8ytfUmzkSQW7UVLWgvrKGLMmI8CQNuMiy
         uxoUqm+cK1Dqc/V/vray66OOuj2e0UlEKiuXAnOPk4ThTO1F2czc3U9cQQiwnItHzsuZ
         wGDXfmdszFzEL56zhdSAV9Id3t7LHafRdsJXZeNQ76xV1HTpYlxjRJoIlNYdHYibwVB4
         6DYw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773339773; x=1773944573; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMV5vC3gcbuXOcw2NM4uNxcXhHiDoqMd8caf3UgdZJc=;
        b=cfP0A2DUZa6lOS6yFQfLcGd1J9TTQ0hhWfCQTNaVSLlxxdJI8U0Wd/iee433txkoby
         OArgAhHny2Eh3RkXKcgkAnQS0o7xI/O3vefQspEfPQx+YGKhOAbGuTICkm6V99M1soeq
         +V2vx60Wi/ZUcR6zERyt7C+Zu54MB4sqPmkNEuadD6fFoXERLATJ0NzPv396cTgd6731
         Y9g68kruxCN+TBgdgcuR3aDkZuBfZFSDjbglEFkTRvvP3CwxnV1RXLPCyNKKDhHD6KgH
         +BJHUTFz6lyfquTd576sC5x/7/3Jpvv8fy2g9aWtxfL2z2RvDu3KGdRWQlmaZi0YeICp
         ++8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773339773; x=1773944573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fMV5vC3gcbuXOcw2NM4uNxcXhHiDoqMd8caf3UgdZJc=;
        b=rrHz2K6FvxGp9t/OgG/haReg+DlmRVFdS5veNipFPUpCSIqHffJQlabXUWmkWad+xj
         5lsCIoqZuIUsOADR6vqla4s79LhusvxayN7L61HBvKPHdpluuJ2rQAF7LAk8gEr5HhkN
         6BcumgTLZZAVM3C3pLXY08cDZ1RUMAM0EX7nRw8+VTosQJ7gVd+ysiHWyAwS2zhCrLLh
         BRQXrttlyLBJWEvwYkc97OaUwcfbWttrvdVuPRHe41mOET+rWcoZPJ3yrNtFRdtAeAMo
         yAff++R/WYUJVf2Ls4/J/cQFCFBwkQma8VrarLf0qgS2wOnw53ghtuOKvEJ4rvF6h+/2
         Gu5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVbVpf8sEHXDY8siu/jZVjmEE5LELbEpmdcGM0WHntdmGDoQz3aOlcy8Ciy1qdDZInBVrNzpBTffT6YbkcUHg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ/bOMFiQCRd9/Bcu18+fq0m5Fp1BfuZ4o3oe1J0SS5tGgxO8J
	U21CBaoRYqmMNvbiETTYvwpvT28r2rKX/lTGjZYuzmpZS3tXQtpJSWXA7JnLhnNTMwPqKigZBMc
	YJWPIW+o8v66NKKMJaEz2iX06sIRGANA=
X-Gm-Gg: ATEYQzw2t4KSnVW/GMusqmS5CnwF3vzeRwYzpSN6hcrmIl6h4Yn2J23gBWaSSJR8Npm
	q64wfjUg2AHazmxgPHPkLgnrjWDyDwbN6b7uX7r+0qbTDy4zBPYD3ZYjXt2FcOmOVQ+1P4J1icJ
	6p02qZ6KZX7eS2qLS8JDMEw1Bp2qjVmhcsOCgTxzUe/HLDU1hFXzuHgrSgkCaRc633dmjNU9ld5
	aDDmR8FlSlHDA4NA9+eFLIeQ8iRHvVJj7H3PCvLq7ozn3tH8IeBgJ9N5k4codeD/9j8k0vzc1Yh
	52oTkw==
X-Received: by 2002:a17:906:84c:b0:b97:1db4:e59d with SMTP id
 a640c23a62f3a-b976507b8fbmr22485866b.1.1773339772397; Thu, 12 Mar 2026
 11:22:52 -0700 (PDT)
MIME-Version: 1.0
References: <CANAPQzi3BkfnRS4CEXAA560O5cO8e6MEYxeVVx1u+xUeXS-gmA@mail.gmail.com>
 <CAGp9LzoidBL1iYYC371+Fw+drbArLRTneJKxCoFiitx=dweKCg@mail.gmail.com>
 <CANAPQzjiBf8Rqphn2SypYN2O6bddj6vB=63Mp=T5YVEt2oGvyw@mail.gmail.com>
 <CANAPQzgiE1rMP3F=5NJg3hp2uBXtq44+vTRBdkHwdfHyXJ8MQQ@mail.gmail.com>
 <CANAPQzgD312EPSbvaQTE6U+wn85L65+xZHms7DP509ApxWvSZA@mail.gmail.com>
 <CANAPQzgXN2UOjuwV1fRofN2syxG933kSaB9S7DyFAykHHMRzew@mail.gmail.com>
 <CAGp9Lzr4KsXEXbj+4h+Lk2fKU7z6BqtL5krzZmu-_So2-bN4_Q@mail.gmail.com> <CANAPQzj24sTgnuXMo3wqVDhA==UQ6JQLESk0AernQUUmZvTi2w@mail.gmail.com>
In-Reply-To: <CANAPQzj24sTgnuXMo3wqVDhA==UQ6JQLESk0AernQUUmZvTi2w@mail.gmail.com>
From: bryam vargas <bryamestebanvargas@gmail.com>
Date: Thu, 12 Mar 2026 13:22:41 -0500
X-Gm-Features: AaiRm53sk3Du3eBUb_EUpLygsbeXq9bvqY4JK38zl7w4HgAXVxAkxj9ZZwg0wN8
Message-ID: <CANAPQziOh3sB7B8G+U3AZsFfeFN1uAg4munhwA_feZi56D7W+Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] mt76: connac: fix txpower_cur not updated in mt76_connac_mcu_set_rate_txpower()
To: Sean Wang <sean.wang@kernel.org>
Cc: linux-wireless@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_112255_014004_8E9A1472 
X-CRM114-Status: GOOD (  15.59  )
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

Subject: Bug: mt7921u unrecoverable chip hang requiring system reboot
(USB device disappears from bus)

Hi,

I'm filing a bug report for a recurring failure mode on the MT7921U USB
WiFi adapter where the chip becomes completely unresponsive and
eventually disappears from the USB bus, requiring a full system reboot
to recover.

This follows up on Sean Wang's suggestion to document the failure before
proposing driver-level recovery mechanisms.


=3D=3D Hardware =3D=3D

  System:    Minisforum NAB9 (Intel i9-12900H)
  Adapter:   MediaTek MT7921AU USB (VID 35bc, PID 0107)
  Kernel:    6.18.x (Ubuntu 24.04)
  Location:  Bogot=C3=A1, Colombia (2400m altitude)
  Uptime:    Continuous operation as home server (6-12 daily users)


=3D=3D Symptoms =3D=3D

The MT7921U periodically enters a state where:

1. nmcli device show / iw dev wlan0 info time out
2. WiFi scan requests hang indefinitely
3. The interface exists in ip link but is non-functional
4. All software recovery attempts fail (driver reload, USB
   unbind/rebind, USB controller reset, uhubctl power cycle)
5. The device eventually disappears from lsusb entirely
6. Only a full system reboot restores the adapter


=3D=3D Structured Event Log =3D=3D

I run an automated monitoring script (net-rescue.sh) that checks chip
responsiveness every 10 minutes and logs events with timestamps and
system uptime. Here is the complete chip-events.log from January
through March 2026:

Recoverable events (soft USB reset succeeds):
  2026-01-11 20:29 HANG -> RECOVERED (soft_usb_reset) [8s]
  2026-01-11 20:34 HANG -> RECOVERED (soft_usb_reset) [7s]
  2026-01-11 20:45 HANG -> RECOVERED (soft_usb_reset) [8s]
  2026-01-11 20:55 HANG -> RECOVERED (soft_usb_reset) [7s]
  2026-01-14 09:34 HANG -> RECOVERED (soft_usb_reset) [373s]
  2026-01-16 13:37 HANG -> RECOVERED (soft_usb_reset) [313s]
  2026-01-17 15:21 HANG -> RECOVERED (soft_usb_reset) [129s]
  2026-02-28 13:49 HANG -> RECOVERED (soft_usb_reset) [99s]

Unrecoverable events (all escalation levels fail):
  2026-01-13 17:16 HANG -> FAILED (all_recovery_attempts_failed)
  2026-01-26 14:10 HANG -> FAILED (all_recovery_attempts_failed)
  2026-02-09 14:33 HANG -> FAILED (all_recovery_attempts_failed)
  2026-02-11 11:07 HANG -> FAILED -> 14x DISAPPEARED over 3+ hours
  2026-02-22 09:45 HANG -> FAILED -> 35x DISAPPEARED over 6+ hours

The DISAPPEARED entries mean the device is no longer visible on the
USB bus at all. The monitoring script runs every ~10 minutes, so each
DISAPPEARED entry is a separate detection cycle confirming the device
remains absent.

The Feb 11 and Feb 22 incidents are the most telling: after the initial
hang and failed recovery, the chip vanished from the bus entirely and
stayed gone for hours until the daily 2:00 AM scheduled reboot
restored it.


=3D=3D Recovery Escalation (all fail in unrecoverable case) =3D=3D

  Level 1: USB deauthorize/reauthorize via sysfs
  Level 2: modprobe -r mt7921u / modprobe mt7921u
  Level 3: USB unbind/rebind via /sys/bus/usb/drivers/usb/
  Level 4: uhubctl power cycle (physical power cut to USB port)
  Level 5: xhci_pci / ehci_pci module reload

When the chip enters the unrecoverable state, mt792xu_wfsys_reset()
cannot succeed because the chip does not respond to USB vendor
requests. Even cutting physical power to the USB port via uhubctl
and restoring it does not bring the device back. Only a full system
reboot (which resets the xHCI controller at BIOS level) recovers it.


=3D=3D Pattern Analysis =3D=3D

From the event log:
  - 10 HANG events over ~2 months of continuous operation
  - 8 recovered via soft USB reset (80% success rate)
  - 5 required system reboot (escalation completely failed)
  - 2 incidents with extended DISAPPEARED state (3-6 hours)

The Jan 11 cluster (4 HANGs in 30 minutes) suggests a transient
condition that resolves with soft resets. The Feb 11 and Feb 22
incidents represent a different, more severe failure where the
chip enters a state that no software recovery can address.


=3D=3D Pending Data =3D=3D

I can provide the following on request or when the next event occurs:
  - Full dmesg around HANG/DISAPPEARED transitions
  - lsusb -t (USB topology) and lsusb -v -d 0e8d:7961
  - usbmon traces during the failure
  - journalctl entries from net-rescue.service

The static USB data (topology, device descriptor) I can provide
immediately. The dynamic data (dmesg during failure) requires waiting
for the next natural occurrence, as the system has been stable since
the last incident.


=3D=3D Related Reports =3D=3D

  https://github.com/openwrt/mt76/issues/838
  https://github.com/morrownr/USB-WiFi/issues/410
  https://github.com/raspberrypi/linux/issues/5193

All describe the same symptom: mt7921u interface becomes a zombie
(UP but unable to TX/RX), requiring physical USB unplug or system
reboot.


=3D=3D Note on Environment =3D=3D

This system operates at 2400m altitude where atmospheric neutron
flux is elevated compared to sea level. I initially attributed these
events to cosmic radiation-induced SEFI (Single Event Functional
Interrupt), but as Sean correctly pointed out, the failure mode needs
to be understood before attributing a cause. The structured event log
is provided as evidence of the failure pattern regardless of root
cause.

This is a home server under active development running multiple
services (ERP, Minecraft, Tailscale, DNS/DHCP, containers). When the
chip enters the unrecoverable state and I'm not physically near the
hardware, the system can remain without WiFi connectivity for days
until I can manually reboot it.

Best regards,
Bryam Vargas

