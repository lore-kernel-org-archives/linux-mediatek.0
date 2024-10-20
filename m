Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC54D3C92D
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Oct 2024 18:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7OOwWusk6gEaG/8hbzuWvjxkguVQUEpUcpHpEOGOhQA=; b=Fs6G2sMZ/OLhAS6hZjPKrAsOSm
	UTd45w5durF3HS8XmqsjIGu6vBdSjyB6L4oyUI6mIq59aG6Yo0TYnPWV1hUEj4iAaKCf5L81Kv5UT
	g5BMI8C2JLFkpo5VaBBn2P7q3p3coYqrQK5jcRKaxrDDbJD61MQEVDJlFW+c8L9cHyfecRdM4X5WL
	gOvTngXtFkabhFnWlcuRyKWEa4tbUcvcdYNqAQ71Q4CM1uiRlKVkUpbhKKsk46Rbk+ETVYG6LrjUn
	XDUD8i79DILteg50G5Qj1q6Qj4Z9voVrtpH6xQC3BKwT0tS103JeRQCzRLCRjopUFxjXLXUnTX+dF
	DbF6qkeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2aLU-00000005EUV-3uuH;
	Sun, 20 Oct 2024 18:08:04 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2aI4-00000005ECe-1vyM
	for linux-mediatek@lists.infradead.org;
	Sun, 20 Oct 2024 18:04:34 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-6e5b85d41deso27623597b3.3
        for <linux-mediatek@lists.infradead.org>; Sun, 20 Oct 2024 11:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rothemail-net.20230601.gappssmtp.com; s=20230601; t=1729447471; x=1730052271; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7OOwWusk6gEaG/8hbzuWvjxkguVQUEpUcpHpEOGOhQA=;
        b=UK/CZWaBtVTc+8czilztTcPgRCzztigpIf0kD6wRcFiL7Gyuqj05m0vpmaXIEbeLYD
         +O2vZKH40MH42QgKys3badcHwBNmhpESP1w3wPTJt2/JrMODJBvYOl+IqDsawMYDYLo6
         GSS+BRsB7Gq838V8pQKTjpsNE03Q6dpcvgvokZxeunt/fVg+Q2rdv4LxkyEwzAETAecQ
         xwu4Od3L5NTZoULBx21Hj5j5MVFo7HVGA3Y/PVIbEaR9mFr0XG8IxgyYEC6XrrlqwwCB
         wAKg6cxbhaGFNLmTiuEpVM8jl0zzfOO/lIYAa/bXCjdV0sA/kOPX9S190exzagS7cWnQ
         Sz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729447471; x=1730052271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7OOwWusk6gEaG/8hbzuWvjxkguVQUEpUcpHpEOGOhQA=;
        b=FwYyEnfEf98ZfiFnmHnm/+PpkZQbQZ/in+CwNe99PZXxPeSmmgUrc0jjtGRrru40eW
         VW81uKrvWFUV3V8NSx6KMLuG87mB3qU0gtxxx0AF2Oc+IoYh0MkHSD4/anKOdTJODCsy
         YokfsmdCOG7fWO+On/+GkGe6bx2+Je9EDvCzXri5fUE66zwINMXfBBrrSHTBQZXR0bZg
         ZoB0wOsOcwmwqZWC6MA2veJzlWF9VodYE/SP4rx2VjEEXSNd1/459E88mOMecMmHhaxN
         NmD2A3GFvitKqheeYyxH/Qkb5lEVzB9dC5hPPVigJkjqdlBRtcTXT5YCSsOUfpdLZjFq
         0+YQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVBYGr1e+Pgohf4NQcZaPxADJiID+nyd3pG+cTDLvZ+o/3zg72YRieX8eV/TYahNdPwYxgpOUQeX7oHiUpsQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7mjt/HVOaALo2X0v2WwQotcqU7gnG0VCBUjnc3/XFLZTqTAs5
	W8eNgtkygmgt78DHAf7chC9NREFJN2e/DZV6YPQ4ECqHaiZrnxt9Nx0XuDnzAwf45IGPtlUEqXo
	WlfDQ0VyzsNlZiJXYbeAl//QkZRH50bImccNuIQ==
X-Google-Smtp-Source: AGHT+IF8tda2rePv5A+duyzJqGM5e/U7BomZq6sQw+zaQZl7zuF0j93HaSioMcmaiDUo0U6AiZmyGyOi0SdPfStiUpQ=
X-Received: by 2002:a05:690c:3747:b0:6e3:34b9:961d with SMTP id
 00721157ae682-6e5bfc8ce70mr82212367b3.38.1729447470821; Sun, 20 Oct 2024
 11:04:30 -0700 (PDT)
MIME-Version: 1.0
From: Nicholas Roth <nicholas@rothemail.net>
Date: Sun, 20 Oct 2024 14:04:22 -0400
Message-ID: <CAD2rFCq7VAr=xVxppToAePQtNBUY2j3FNk+dXgMXDv32LHyRng@mail.gmail.com>
Subject: [REGRESSION] bluetooth: mt7921: Crash on Resume From Suspend And Hibernate
To: Sean Wang <sean.wang@mediatek.com>, linux-bluetooth@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Cc: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_110432_787399_16304314 
X-CRM114-Status: GOOD (  13.44  )
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

#regzbot introduced: v6.10..v6.11

My Framework 16 laptop (Ryzen=E2=84=A2 7 7840HS + AMD Radeon=E2=84=A2 RX 77=
00S)
recently started hanging when I open the lid after resuming from
hibernation on the very-lightly-patched 6.11.4 kernel that Arch ships
as `linux`. From the error message, this appears to be a crash.

I'm compiling torvalds/linux locally and will be able to use that to
help answer follow-up questions, but I may be slow to respond as I
have a day job. The kernel I've tested so far is _very_ close to
mainline-- at https://github.com/archlinux/linux I only see ARM/fixes,
dmaengine: cirrus:, and btrfs: send:). I posted the issue at
https://community.frame.work/t/framework-16-fails-to-resume-from-hibernate/=
59297
and it appears others see this too. Note that the 6.10-6.11 range
comes from @callahad on the forums-- I can only say for sure on the
close-to-mainline kernel that this definitely affects 6.11.4.

I was not able to collect complete logs since they don't get saved to
the journal and I don't have a serial adapter on me suitable for a
kernel TTY, but with `no_console_suspend` I was able to enhance and
OCR an image (see the forums for the original), which I'm posting in
full at the end of this mail under "Partial Panic (OCR)". Highlights
include:
[ 146.054908] RIP: 0010:hci_unregister_dev+0x45/8x1f@ [bluetooth]
...
[ 146.855890) Call Trace:
[ 146.055187] ? __die_body.cold+0x19/0=C3=9727
[ 146.055122] ? die_addr+0x3c/0x60
[ 146.055134] ? exc_general_protection+0x17d/0x400
...
[ 146.855238] ? hci_unregister_dev+0x3e/0x1f0 [bluetooth
1400000003000000474e5500314a936b2959fa34)
[ 146.055288] btusb_disconnect+0x67/0x170 [btusb
1400000003000000474e55007dd0b46154bf4bec]
...
[ 148.449222] mt7921e 8000:04:00.0: Message 00020007 (seq 4) timeout
[ 148.451497] mt7921e 0000:04:00.0: PM: dpm_run_callback();
pci_pm_restore returns -110
[ 148.454598] mt7921e 8000:04:00.0: PM: failed to restore async: error -110
[ 148.534371] mt7921e 0000:04:00.0: HW/SW Version; 8x8a188a10, Build
Time: 20240716163242a
[ 148.534371]
[ 148.912088] mt7921e 0000:04:00.0: WM Firmware Version: ____000000,
Build Time: 20240716163327

The kernel appears to be tainted with an unrelated warning.

chktaint:
$ ./kernel-chktaint.sh
Kernel is "tainted" for the following reasons:
 * kernel issued warning (#9)
For a more detailed explanation of the various taint flags see
 Documentation/admin-guide/tainted-kernels.rst in the Linux kernel sources
 or https://kernel.org/doc/html/latest/admin-guide/tainted-kernels.html
Raw taint value as int/string: 512/'G        W         '

Warnings:
# dmesg | grep -i warn
[    2.333170] WARNING: CPU: 10 PID: 229 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_panel_cntl.c:186
dcn31_panel_cntl_construct.cold+0x1e/0x2e [amdgpu]
[    2.333967]  ? __warn.cold+0x8e/0xe8
[ 2814.691588] warning: `ThreadPoolForeg' uses wireless extensions
which will stop working for Wi-Fi 7 hardware; use nl80211

Partial Panic (OCR):
[ 146.0548891] Workqueue: async async_run_entry_fn
[ 146.054908] RIP: 0010:hci_unregister_dev+0x45/8x1f@ [bluetooth]
[ 146.054962] Code: 89 ef e8 ae 03 8b d2 f0 80 8b e9 De 00 00 08 48 89
ef e8 0e f1 8a d2 48 c7 c7 68 20 c4 c1 e8 22 52 8b d2 48 8b 43 08 48
8b 13 <48> 3b 18 0f 85 b5 c7 06 00 48 3b 5a 08 Of 85 ab c7 06 00 48 89
42
[ 146.054984] RSP: 0018: ffffbba241defcc8 EFLAGS: 00010246
[ 146.054996] RAX: dead000000000122 RBX: ffffa86a81276000 RCX: 000000000000=
0000
[ 146.055007] RDX: dead000000000100 RSI: ffffa06a81a47910 RDI: ffffffffc1c4=
2068
[ 146.055018] RBP: ffffa06a812764d0 R08: 0000000000000000 R89: ffffa06a801d=
9610
[ 146.055028] R10: ffffbba241defcd0 R11: ffffbba241defcd8 R12: ffffa06a8127=
6000
[ 146.055038] R13: ffffffffc2323278 R14: ffffffffc2323278 R15:
ffffa06a8f9f0850 146.055050] FS:
[ 146.055050] FS: 0000000000000000(0000) GS:ffffa07960000000(0000)
kn1GS:0000000000000000
[ 146.055062] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 146.055072] CR2: 0000000000000000 CR3: 000000070ba22000 CR4: 0000000000f5=
0ef0
[ 146.055083] PKRU: 55555554
[ 146.855890) Call Trace:
[ 146.055099]
[ 146.055187] ? __die_body.cold+0x19/0=C3=9727
[ 146.055122] ? die_addr+0x3c/0x60
[ 146.055134] ? exc_general_protection+0x17d/0x400
[ 146.055147] ? ep_poll_callback+0x24d/0x2a0
[ 146.055164] ? asm_exc_general_protection+0x26/0x30
[ 146.055184] ? hci_unregister_dev+0x45/0x1f@ [bluetooth
1400000003000888474e5500314a936b2959fa34]
[ 146.855238] ? hci_unregister_dev+0x3e/0x1f0 [bluetooth
1400000003000000474e5500314a936b2959fa34)
[ 146.055288] btusb_disconnect+0x67/0x170 [btusb
1400000003000000474e55007dd0b46154bf4bec]
[ 146.055307] usb_unbind_interface+0x90/0x290
[ 146.055325] device_release_driver_internal+0x19c/0x200
[ 146.055341] usb_forced_unbind_intf+0x75/0xb0
[ 146.055354] unbind_marked_interfaces.isra.0+0x59/0=C3=9780
[ 146.055368] ? __pfx_usb_dev_restore+0x10/0x10
[ 146.055381] usb_resume+0x5a/0x60
[ 146.055392] _dp_run_callback+0x47/0x150
[ 146.055407] device_resume+0xb0/0=C3=97280
[ 146.055419] async_resume+0x1d/8x30
[ 146.055431] async_run_entry_fn+0x31/0=C3=97140
[ 146.055444] process_one_work+0x17b/0x330
[ 147.894397] [drm] ring gfx_32772.1.1 was addedmes_kiq_3.1.0 uses VM
inv eng 13 on hub 0vailable 68 20 c4 c1 e8 22 52 Bb d2 48 8b 43 08 48
8b 13 <48> 3b 18 0f
[ 147.896995] [drm] ring compute_32772.2.2 was added
[ 147.098944] [drm] ring sdma_32772.3.3 was added
[ 147.102569] [dro] ring gfx_32772.1.1 ib test pass
[ 147.186131] [drm] ring compute_32772.2.2 ib test pass
[ 147.188302] [drm] ring sdma_32772.3.3 ib test pass
[ 147.136203] usb 1-4.3: reset full-speed USB device number 8 using xhci_hc=
d
[ 147.238067] usb 1-4.3: unable to get BOS descriptor set
[ 148.449222] mt7921e 8000:04:00.0: Message 00020007 (seq 4) timeout
[ 148.451497] mt7921e 0000:04:00.0: PM: dpm_run_callback();
pci_pm_restore returns -110
[ 148.454598] mt7921e 8000:04:00.0: PM: failed to restore async: error -110
[ 148.534371] mt7921e 0000:04:00.0: HW/SW Version; 8x8a188a10, Build
Time: 20240716163242a
[ 148.534371]
[ 148.912088] mt7921e 0000:04:00.0: WM Firmware Version: ____000000,
Build Time: 20240716163327

Please let me know if I am missing anything or should do something
differently. I am new to these lists.

Thanks, all!
-Nicholas

