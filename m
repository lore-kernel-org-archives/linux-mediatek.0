Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3F1FCA177
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Mar 2026 19:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pXhBEdQGcnN0qoRku0HoZmNcFhiZMtfh8n8ATcjwOdc=; b=rR0hUjVgRvsfs51nTPUvkQ0D8V
	AjAk0KiCoEkYmIDNieMgphTY4qDcnEr2I36Ah7klGOjxW+dVBEH5O8tJeavo0SXkcrRn4sEd7WGr4
	T8KektbNkpBw1zdDwh9wIZ9gSutRSckb59/Azm3hhcih1yCgNwdDEj8ukZI2Jm7hv75m/o9iEmPRv
	pmHnUWlo9ip01IvNhv2kRYCOq3IIXy9sw/d8vHhkq6Usy4k4HlMeEL64asqAqHbjlfeUTff5joKpM
	jBWgcsitby6aGCGQiKVdcPL1ePkAozutPEF3gAOiouCrk4rROG8Umxcv52ernyIs/+Bbrdkk/lC4a
	lH0f+pyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzg25-000000082SN-1Btn;
	Mon, 09 Mar 2026 19:12:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzg24-000000082RX-1c6P
	for linux-mediatek@bombadil.infradead.org;
	Mon, 09 Mar 2026 19:12:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=pXhBEdQGcnN0qoRku0HoZmNcFhiZMtfh8n8ATcjwOdc=; b=gFHVkGD8WC7snWLztOdCEGsGaH
	hU4msW5gi4mLq5fr1gUAdHDQ6+ccMk6UqUCrQT3LmjctRZHxpBOX3UpsHER7Q688lrrLlXWTYGFkp
	sNqZhfxC6HtYTqJ1WcmzKoQsA6q6Z4JjO3MK3qKVkRV/9H/OPd/cAsNNQ3tCcBwzWKhE7AMOpwuUI
	DO8BzEbmbTqm7lZ7X1iONEKcamvIiW7ptn+edIXRQdd4UHjZeOgwviK+CS9IQ0ca4dXxsDdKZ/DzP
	lRvVuC8PgljWFTzdSCz+56rEMDKyZhiljdu2SndTeKPhJtXq6tki+AU8m/0l4wMWMJ33WN6dw7XOx
	gBcUlqxA==;
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzg21-0000000D28E-2snf
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Mar 2026 19:12:47 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-509192d11ecso1445371cf.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Mar 2026 12:12:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773083563; cv=none;
        d=google.com; s=arc-20240605;
        b=Jm5hJnsalapri0aPTiyEMQfrygpGFVru1hQ6x7oNI8xA6RUtahVcOgsMFTjJ1Oze3Q
         kmUTtGH0YMbgeaOyb2rOKKBME/YNBCBuM2c+SlNZrVRvj8HoIGt64FBvhUn7NeUyUqx6
         2OMOsRCqgLTJArI9sVUJw3BqQeqlj633YCu3fPxasU5hvcPz56RBCTC9Fs8mwBpl0WPv
         tSJcwmti84duDVCSXS22u+gztkjE1kzMajs0MvdVzxEABwyRzcWgPRMvQzBXroYoVOiI
         RIDY9KHOLGTrNscuzdUzGo6cPLQNT4QJ+4djHRo4+oS9LgSG5FzQUwg9wKdF29Zp2t0I
         Wk3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=pXhBEdQGcnN0qoRku0HoZmNcFhiZMtfh8n8ATcjwOdc=;
        fh=qxEInRX4DT+23r2EI44h5rTNEA8IxjSjEWmYEqW0hD8=;
        b=j/TaYNq0KjlSpatp/ZE/kcLydk188sSmjOVxY193PMtJy4p+1VziIhOCALkVL4jQGM
         2doSpZDk2+fGoxJZ5j7cZGuts/cVu668eKTFCRLxJip4oRxZze5di3ZI9ml9QPv3xnmU
         uC6SMsIRPbg630G1/r6OeJj9j/ajRWpNQhETCGe2AcRHu+c8qqCehwh90QbElagGX7mQ
         T+gPJqZq1py2rJlQgyESqnYe/HwHMpsolFuIqjOqo9cjp/Ksa04qsAZsj1y7rv9KkaH4
         6mBmPYntA9YZkXAjsWwksAXhnNCl18/qbl3pZdX6AEBqR1TWQecIeYom0A5ZHRO/af0d
         b8RQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773083563; x=1773688363; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pXhBEdQGcnN0qoRku0HoZmNcFhiZMtfh8n8ATcjwOdc=;
        b=c5Ot+OyS86VsjyIoh1MF/MEIMyuGfgWYmhZqdZWNWbI+ChU8Tyiv725SOBOXHBIOFI
         YMA2T8Ff5LANZ3pvElJ831gV0oe/m3PUvzus15dvmd/hlNNZGh2ZWrPggdtTLrE4fMh0
         bUxeuPsYC5FYemsz435WbhREq8fmodMYdI5TmDrJ4bKr8jktRMeWddiOZXxsjrDH3IQS
         zXYvMijpno4xwd+3QAy6oimfe+NA0R6C98AuoQnWI9fO1D3kGWxtDWsZrsRtmGIhXX7I
         p34YzQauEnMR7FCaOZP8Ixto14xUWU58NfVEf28beUG0/j22RO5BeFafgl5VEr6FHGHy
         3c0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773083563; x=1773688363;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pXhBEdQGcnN0qoRku0HoZmNcFhiZMtfh8n8ATcjwOdc=;
        b=NjlVs40nHgLCaCqyIwDvf0RHbkfcMH0jIpbp10gZWT4fFWtAQ2E1YNaEf0KoVgrGjW
         PbALfEeBpVd5cS+oa68Nf6OqHIwD08oFAwEQKY/VnEdxW+df2yK7T+nx1dbxOUdmMcxj
         iv69rd6NrmdhJ59m4xm+xQ05VZAF7/ikrmYKrv1QRLLDKeg/DSbTBKuemyaPol+Dl60u
         eXTKoiLvJrbKtMgnMj/J3cYSJqqPtU/J5VcOd4nKyT9G1I0v7+V7u9/NGu/WhChGiscV
         5Hx4owwaibqhbAmDkSA1wJfHzpxwYeg8//l/fRANeK9UAtvT6rjMRPGwPVNsLRSMbXBl
         M9Bg==
X-Gm-Message-State: AOJu0YyE6U7+dOWtp3ShgW3WG9Vxt7tXXFdOFzVW5qucWrtkHOLZmsyi
	oFZf+Ef2bqys9wEvRpnkWuxD7NyCvb4DKmvR+JuAUnTQzQa/UNZrBtifoQc9rUgA+owEGagJWs4
	nHEcCBIYiVbSsLDfVbIuim6is+OM+61gVRcTHc44mgCGmtQ==
X-Gm-Gg: ATEYQzyOpqXSJTvsAj4KlvbMvKVRSizLoaNBs594KpQ2Xs0FFWLxXxy07whMfzeeBjt
	V++gI3QuNskHSP1bdl3RCMk2GhiwIVTmM/k9sveZlpsN1Y6XDRfgVH4/Z9J8H/J62agTH4RLfAv
	Gj8IBXqaUrnYbu5UnGa4ZERP1I38UkVLFe1ZtFE8IbxGVE94HB4XXln2j50eZkwTYQ6psJK2Qo1
	rc5T125CbkUO8MPwgMdoQPAgt7k3wmkiw/XIP3xI9Cnl0kf3YxuTxtlTcjdr5VlYWz3hANzpXaL
	FuZ3+J6kvbKV/T9JCN/r8pqXeZb8l0vhqWJfQInF2izZ+Pv2kKLXQ/18qjd2996YJl5/TA==
X-Received: by 2002:a05:622a:1a92:b0:509:219f:8e34 with SMTP id
 d75a77b69052e-509219f950cmr27757211cf.0.1773083562925; Mon, 09 Mar 2026
 12:12:42 -0700 (PDT)
MIME-Version: 1.0
From: Ross <rosspayant@gmail.com>
Date: Mon, 9 Mar 2026 15:13:15 -0400
X-Gm-Features: AaiRm51jddNVjoRcK1qA5v9l-_4tFtwEQK9aBsMeUXcvrw54qUePQscalDtrb1s
Message-ID: <CAEoHs0hONW_X8POryv-YC8ahGAVoOsvXXJw9VnDOguSgq52v=Q@mail.gmail.com>
Subject: [BUG] mt7925e: MSI Vector A16 HX A8WHG-004US reports permanent
 hardware rfkill block under Linux; ACPI GPPA.WLAN AE_ALREADY_EXISTS
To: linux-mediatek@lists.infradead.org
Cc: nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com, 
	shayne.chen@mediatek.com, sean.wang@mediatek.com, deren.wu@mediatek.com, 
	linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_191245_763912_0F21C791 
X-CRM114-Status: GOOD (  16.08  )
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

Hello, I want to report a wifi bug. This bug makes the wifi hard lock
on my computer under Arch Linux as well as Fedora. Wifi does work on
Linux LTE and Windows 11. The computer is a Vector A16 HX A8WHG-004US
and this it's actually the second I bought. I returned the first one
because of the exact same bug. Since I got the second one I've stuck
it through hoping there would be a fix, it's been three months now.
I've tried all the possible fixes (on both machines), nothing. "sudo
rfkill unblock all" and "sudo rfkill unblock wifi" do not work. There
is no switch in the bios or "airplane mode" hotkey to toggle either.
The wifi just does not work in Linux (apart from LTE). I've updated
the bios to the new version every time a new one drops (including the
most recent one from a couple days ago) and nothing has changed
anything. I've updated everything else frequently. No dice.

Anyway, I suppose this is where I go to file report bugs like this?
I've never issued a bug report before so I'm not sure. Thank you so
much for giving this the time of day, as well as all the other work
you do on the LInux project. If you need further information I'll give
you whatever you need.

I had the following written for me by AI but I can confirm it's
accurate to the problem:


I am reporting what appears to be an MSI-platform-specific MT7925
hard-rfkill issue on Linux.

Hardware
- Laptop: MSI Vector A16 HX A8WHG-004US
- WLAN: MEDIATEK MT7925 802.11be 160MHz 2x2 PCIe Wireless Network
Adapter [14c3:7925]
- Subsystem: Foxconn International, Inc. Device [105b:e138]

Software
- BIOS: E15MMAMS.107
- Kernel: 6.19.6-arch1-1
- linux-firmware: 20260221-1
- Distro: Arch Linux

Problem
- The Wi-Fi device is detected correctly.
- The mt7925e driver binds successfully.
- Firmware appears to load.
- The interface is created/renamed to wlp5s0.
- However, rfkill always reports the WLAN as hard blocked.

Current rfkill state
- Bluetooth: Soft blocked: no / Hard blocked: no
- Wireless LAN: Soft blocked: no / Hard blocked: yes

Attempted commands
- sudo rfkill unblock wifi
- sudo rfkill unblock all

Neither command changes the WLAN hard block.

Relevant observations
- lspci shows:
MEDIATEK Corp. MT7925 802.11be 160MHz 2x2 PCIe Wireless Network
Adapter [Filogic 360] [14c3:7925]
Kernel driver in use: mt7925e
- The boot log shows the device being enabled, ASIC revision detected,
firmware information printed, and the interface renamed from wlan0 to
wlp5s0.
- The same boot log also shows repeated ACPI errors involving WLAN
objects under \_SB.PCI0.GPPA.WLAN..., including repeated
AE_ALREADY_EXISTS failures.

This makes it look like:
- the device is present,
- the mt7925e driver is loading,
- but platform/ACPI state may be forcing or misreporting hardware rfkill.

Relevant kernel log excerpt

mt7925e 0000:05:00.0: enabling device (0000 -> 0002)
mt7925e 0000:05:00.0: ASIC revision: 79250000
mt7925e 0000:05:00.0: HW/SW Version: 0x8a108a10, Build Time: 20260106153007a
mt7925e 0000:05:00.0: WM Firmware Version: ____000000, Build Time:
20260106153120
mt7925e 0000:05:00.0 wlp5s0: renamed from wlan0

ACPI BIOS Error (bug): Failure creating named object
[\_SB.PCI0.GPPA.WLAN._S0W], AE_ALREADY_EXISTS
ACPI BIOS Error (bug): Failure creating named object
[\_SB.PCI0.GPPA.WLAN._S4W], AE_ALREADY_EXISTS
ACPI BIOS Error (bug): Failure creating named object
[\_SB.PCI0.GPPA.WLAN._DSM], AE_ALREADY_EXISTS
ACPI BIOS Error (bug): Failure creating named object
[\_SB.PCI0.GPPA.WLAN.PCIF], AE_ALREADY_EXISTS
ACPI BIOS Error (bug): Failure creating named object
[\_SB.PCI0.GPPA.WLAN.NVID], AE_ALREADY_EXISTS
ACPI BIOS Error (bug): Failure creating named object
[\_SB.PCI0.GPPA.WLAN.NDID], AE_ALREADY_EXISTS
ACPI BIOS Error (bug): Failure creating named object
[\_SB.PCI0.GPPA.WLAN.PWR1], AE_ALREADY_EXISTS
ACPI BIOS Error (bug): Failure creating named object
[\_SB.PCI0.GPPA.WLAN._PR0], AE_ALREADY_EXISTS
ACPI BIOS Error (bug): Failure creating named object
[\_SB.PCI0.GPPA.WLAN._PR2], AE_ALREADY_EXISTS
ACPI BIOS Error (bug): Failure creating named object
[\_SB.PCI0.GPPA.WLAN._PR3], AE_ALREADY_EXISTS
ACPI BIOS Error (bug): Failure creating named object
[\_SB.PCI0.GPPA.WLAN.PWFR], AE_ALREADY_EXISTS
ACPI BIOS Error (bug): Failure creating named object
[\_SB.PCI0.GPPA.WLAN._PRR], AE_ALREADY_EXISTS

Reproduction
1. Boot Linux normally.
2. Run:
rfkill list all
3. Wireless LAN is always reported as:
Soft blocked: no
Hard blocked: yes

Additional notes
- Windows 11 on the same laptop can use Wi-Fi normally.
- Updating BIOS from E15MMAMS.106 to E15MMAMS.107 did not resolve the issue.
- This may be similar in shape to other MT7925 hard-rfkill issues that
required a machine-specific quirk, but on this MSI model the prominent
clue is the repeated ACPI GPPA.WLAN object collision.

Please let me know if you want:
- full lspci -nnk output
- full dmesg/journalctl -b -k
- acpidump / decoded DSDT
- additional testing with a proposed patch or boot parameter

-- 
Ross Payant

