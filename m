Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F6510FC456
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Apr 2026 01:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MadnNngCxJC8yYjvjyaGGRQRw+73E0DoH8OrsCxju0I=; b=g+7ioDliOKkGWIhBIka7Ta9miX
	gpbe+PTCrC/s4mY0mKAwT2HbjcGnOuGATNkws5HNSxHSt/LnEf/hai2uPrjsQ4Dcv74hVXnIa/bSq
	3yBSlqthEXhM1htn4n25GyqAbTXlIC6tsGyks5/ss7uq9y4SiXKe469imJ+vVO0T3cEEbwhzzgsal
	waAJSqIOZfXrlWMoIW5NfnSP1DTK5eoYVcCU33LHPEeO0YKCvEJV8JKrkGww8k2lY31sRil49epux
	N7okZ/ldaL6YSKNlA4Va+nnKJcp5VYnDC12sbOqTtdgdvvs+A8Ot9pommhVMcaHfNzDOaSkZ1g5bd
	VSTDL9FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAeOw-00000009aPB-2g3j;
	Thu, 09 Apr 2026 01:41:46 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAeOt-00000009aOo-2iOO
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Apr 2026 01:41:44 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-2ce22328930so336574eec.0
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Apr 2026 18:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775698902; x=1776303702; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MadnNngCxJC8yYjvjyaGGRQRw+73E0DoH8OrsCxju0I=;
        b=QfKq/5hdKtVMnbutwSXlWep32IP0DvO1X0mWhV/SWdoQUaDsTC8WOojMfiloaVPOgw
         d6e9IaeYyWqS3v7Z/f3u1QZFUbyyZKi2TnVtGxiU9i7uebrfmjy1SIEyKmCcUlRwPLao
         4MDXlJBZE4vgLLLJO1fCB60PhyoIvvAHakEAFqhFuNYZ1cyD2pjQbj80uoC2iYI9DuB9
         mIQ4ql3JICCLiH+QypduHhjXYeV/fKmY03jPzDp7fAUmgG42f8YBCgOboUSzbxMOA332
         sflPnYzudPjsQlws25wz2jvTprQVJLGjXvkjkHA7JbUphtSClM/qZBkE+Cl/GcpodWy8
         bqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775698902; x=1776303702;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MadnNngCxJC8yYjvjyaGGRQRw+73E0DoH8OrsCxju0I=;
        b=TL6fQh4LNp1zc7uRuL5aM3fGubo71/xD3RgadCEjsW4oCEfQ79b8kGUKufjCQt4IdU
         FsCk66AUg3yQLCYHTuWzFIlNsRWrGzDOo+VVyrYrYQhgnGithlMhWM4dKhtDCtnUebHD
         m0O9jIc/G8ah1Yx0ankb0ge47j+vHjzS54QXA5eBlaeFdMdAh+wKv0yUqhRQmTk56GzC
         KuInhpuBKGTUIRkYluJIWnLp07YAOiCoq3HVCEy7E+/BqvubVZCfFa7cTGr1UA5TQ9rH
         OvZ3MamnXbw7OD4qDN0varNlrL0BaffOmcSj+BuS6AdgvTfaEVmJraCi2s6CWMKQh5ts
         tBAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdanOwK1si+Kq2gfjWdVdrjEG4DmW2SDt33vDetsp7HoyKx9JQb+aMgMWsuhaDJ7cvVhTu8ntdC4LzUkR1ow==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAF5e93kgvbMDBzVxxqysWhcugYuZGRPQiDdAi1agg58gm6y5q
	WwJokUshCSDG+qi1AWFHTYrskAFsmfhstwEboEUvETcgP/Yt9Vt+P+j3
X-Gm-Gg: AeBDieuV2tg6WVGIRlwsf8WCJun8zNC8yvEi4xxHZe0nkfr84s7lOTvHNuHyaeez15Z
	PK0sCZdMivUUgysCgVecmQePcc40uaJN7ozEA2MQmGkHb289N9CEBxBVTX7Tb9gbMLSpqY8vHY8
	tdvcOkKLGIoCveOeasNVVKmyOd4RRvc0zJeODpp0CocQRsshkU1IySgm+kNuqGw7/J0+N1ZBl2j
	dzoVSb1FGYZkhCo2Es+In6dmx9LBGDMb2NH070tsOBNaVMC6ortFNtsH9i3ICnZg7/+J2HxVP0z
	zsrOyXLspg1fpy6K8h3uzEs1fZnKfD27qHL98ZfYh/I/11fkRP3aFC8Tp+hLiCEVo1AZdWaHNoS
	pZ2CuXuXWu99m/OmvJFLOriJTdKv1JJV5Jk2SOcj5cFmXv+/2+bapMO6OTuXl4yzEkZqkaWcL0d
	Soq6Gkxn7CY2ZPYS07mQGAk730VMlpnDvyk2OJDw1ZObC2nulOEipG4pmUzPhIX4Mt4hq+VDNs0
	XkCsjIqVgDob/4vs5EWqDRXNFHcq91/OmVS
X-Received: by 2002:a05:7300:2310:b0:2d4:2cc8:68d with SMTP id 5a478bee46e88-2d42cc80a4bmr710272eec.25.1775698901971;
        Wed, 08 Apr 2026 18:41:41 -0700 (PDT)
Received: from ?IPv6:2804:1b1:fa41:f3c2:efa2:f2d9:c540:bfc4? ([2804:1b1:fa41:f3c2:efa2:f2d9:c540:bfc4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7cf1271asm27331763eec.26.2026.04.08.18.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 18:41:41 -0700 (PDT)
Message-ID: <7e1ebd83b843b6e74673117018fc5ff97f26f35e.camel@gmail.com>
Subject: Re: mt7921e: repeated driver own failures cause hanging
From: Vinicius <viniciuspython@gmail.com>
To: Sean Wang <sean.wang@kernel.org>, moosager90 <moosager90@gmail.com>
Cc: linux-wireless@vger.kernel.org, "moderated list:ARM/Mediatek SoC
 support"	 <linux-mediatek@lists.infradead.org>
Date: Wed, 08 Apr 2026 22:41:38 -0300
In-Reply-To: <CAGp9Lzp8NjVwkn2atNqT9x9-QTkWMLxK+Ntkb=3Z1fWcM6N=7A@mail.gmail.com>
References: <4870974.vXUDI8C0e8@fedora.fritz.box>
	 <CAGp9Lzp8NjVwkn2atNqT9x9-QTkWMLxK+Ntkb=3Z1fWcM6N=7A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_184143_695793_09F55FCF 
X-CRM114-Status: GOOD (  34.46  )
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

Hi Sean,

moosager90 recommended me to reply to this thread when we were talking
about a bug reported at
https://bugzilla.kernel.org/show_bug.cgi?id=3D220353

This bug reported in bugzilla is related to mt7921e raising several
"driver own failed" messages in dmesg. But it seems this same bug is
also affecting me through **mt7925e** driver.

Before posting below a log from my dmesg, which also shows several
"driver own failed" messages, I would like to say in advance that yes,
the bug was occurring every time my computer suspended. I first tried
to disable the auto-suspend feature of my linux distro and the bug
stopped happening too often, but was still happening sometimes. In
~March 28th the bug was being triggered too much (even without the
computer being suspended), freezing my computer and requiring a reboot.
So I tried adding `options mt7925e disable_aspm=3D1` to
`/etc/modprobe.d/mt7925e.conf`. I think this is what you suggested when
you said "could you also try disabling PCIe ASPM...".

**Since I added this line to disable ASPM, I have not experienced more
freezes. It seems this line really fixed the issue.**

Below you can find all the information about the kernel version I'm
using, as well as the driver version, firmware version and logs from
dmesg (a copy-paste from my message at bugzilla on March 25th):

```
# uname -a
Linux arch 6.19.9-arch1-1 #1 SMP PREEMPT_DYNAMIC Thu, 19 Mar 2026
16:33:17 +0000 x86_64 GNU/Linux

---

# journalctl -k -g mt7925e -b -1
mar 25 09:00:09 arch kernel: mt7925e 0000:01:00.0: enabling device
(0000 -> 0002)
mar 25 09:00:09 arch kernel: mt7925e 0000:01:00.0: ASIC revision:
79250000
mar 25 09:00:09 arch kernel: mt7925e 0000:01:00.0: HW/SW Version:
0x8a108a10, Build Time: 20260106153007a
mar 25 09:00:09 arch kernel: mt7925e 0000:01:00.0: WM Firmware Version:
____000000, Build Time: 20260106153120
mar 25 09:00:10 arch kernel: mt7925e 0000:01:00.0 wlp1s0: renamed from
wlan0
mar 25 10:25:16 arch kernel: mt7925e 0000:01:00.0: driver own failed
mar 25 10:25:17 arch kernel: mt7925e 0000:01:00.0: driver own failed
...
mar 25 10:25:42 arch kernel: mt7925e 0000:01:00.0: chip reset failed
mar 25 10:25:45 arch kernel: mt7925e 0000:01:00.0: Message 00020001
(seq 9) timeout
mar 25 10:25:48 arch kernel: mt7925e 0000:01:00.0: Message 00020004
(seq 10) timeout
mar 25 10:25:51 arch kernel: mt7925e 0000:01:00.0: Message 00020002
(seq 11) timeout
mar 25 10:25:54 arch kernel: mt7925e 0000:01:00.0: Message 00020001
(seq 12) timeout
mar 25 10:25:57 arch kernel: mt7925e 0000:01:00.0: Message 00020004
(seq 13) timeout
mar 25 10:25:58 arch kernel: mt7925e 0000:01:00.0: driver own failed
mar 25 10:26:00 arch kernel: mt7925e 0000:01:00.0: Message 00020027
(seq 14) timeout
mar 25 10:26:04 arch kernel: mt7925e 0000:01:00.0: driver own failed
mar 25 10:26:06 arch kernel: mt7925e 0000:01:00.0: driver own failed
mar 25 10:26:07 arch kernel: mt7925e 0000:01:00.0: driver own failed
mar 25 10:26:08 arch kernel: mt7925e 0000:01:00.0: driver own failed
mar 25 10:26:14 arch kernel: mt7925e 0000:01:00.0: Message 00020003
(seq 15) timeout

---

# modinfo mt7925e
filename:       /lib/modules/6.19.9-arch1-
1/kernel/drivers/net/wireless/mediatek/mt76/mt7925/mt7925e.ko.zst
license:        Dual BSD/GPL
description:    MediaTek MT7925E (PCIe) wireless driver
author:         Lorenzo Bianconi <lorenzo@kernel.org>
author:         Deren Wu <deren.wu@mediatek.com>
firmware:       mediatek/mt7925/WIFI_MT7925_PATCH_MCU_1_1_hdr.bin
firmware:       mediatek/mt7925/WIFI_RAM_CODE_MT7925_1_1.bin
srcversion:     CB386A1D0C64CC7F4C723D9
alias:          pci:v000014C3d00000717sv*sd*bc*sc*i*
alias:          pci:v000014C3d00007925sv*sd*bc*sc*i*
depends:        mt792x-lib,mt76-connac-lib,mt76,mt7925-common,rfkill
intree:         Y
name:           mt7925e
retpoline:      Y
vermagic:       6.19.9-arch1-1 SMP preempt mod_unload=20
sig_id:         PKCS#7
signer:         Build time autogenerated kernel key
sig_key:      =20
6F:56:40:C8:60:B3:9B:AD:DF:E1:84:24:BC:D4:A9:07:90:4E:7B:C6
sig_hashalgo:   sha512
signature:    =20
30:64:02:30:54:34:C4:0C:8E:A8:D6:EB:38:02:71:55:A3:09:CA:39:
		28:2E:F3:8C:2C:38:AB:26:89:8A:B7:3E:66:77:40:26:C7:D5:

13:12:
		CA:39:F4:99:1A:EC:3B:0C:D4:8D:D7:C0:02:30:62:78:5D:DC:

90:B7:
		57:5E:CE:F5:64:99:EF:AC:B9:3B:B7:00:3E:EE:BA:B7:81:C2:

8F:2C:
		DF:B2:F4:64:3C:76:54:24:0B:70:72:56:80:7E:28:5A:56:71:

45:D6:
		A7:57
parm:           disable_aspm:disable PCI ASPM support (bool)

```

Best regards.


On Sat, 2026-01-03 at 01:10 -0600, Sean Wang wrote:
> Hi moosager90,
>=20
> Could you please share more details on how this issue can be
> reproduced? For example, does it occur after suspend/resume, under
> heavy traffic, or during normal runtime? Also, please confirm which
> firmware version you are using.
>=20
> It would be helpful to test with the latest linux-firmware version:
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.g=
it/commit/mediatek?id=3D5cf85776762a544ad27c4447b61eaabb0d4716e7
>=20
> As a debugging step, could you also try disabling PCIe ASPM and check
> whether the issue still occurs?
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 Sean
>=20
> On Fri, Jan 2, 2026 at 4:35=E2=80=AFAM moosager90 <moosager90@gmail.com>
> wrote:
> >=20
> > Hello,
> >=20
> > There is an issue with mt7921e which causes repeated failures in
> > chip resets,
> > bringing the network down and causing hanging on every command or
> > action on the
> > system; the only workaround is to reboot. This is what the kernel
> > output looks
> > like at those times:
> >=20
> > mt7921e 0000:62:00.0: driver own failed
> > kernel: mt7921e 0000:62:00.0: Timeout for driver own
> > kernel: mt7921e 0000:62:00.0: driver own failed
> > kernel: mt7921e 0000:62:00.0: Timeout for driver own
> > kernel: mt7921e 0000:62:00.0: driver own failed
> > kernel: mt7921e 0000:62:00.0: Timeout for driver own
> > kernel: mt7921e 0000:62:00.0: driver own failed
> > kernel: mt7921e 0000:62:00.0: chip reset failed
> > kernel: mt7921e 0000:62:00.0: Timeout for driver own
> > kernel: Console: switching to colour frame buffer device 360x112
> > kernel: fbcon: Taking over console
> > kernel: mt7921e 0000:62:00.0: Message 00020001 (seq 1) timeout
> >=20
> > I have observed the issue on many untainted kernels, and I have had
> > it happen on
> > vanilla kernels not provided by my distro as well.
> >=20
> > Mine and some other people's reports are available at [1]. More
> > logs of the
> > issue on my system are in the attachments of my original report on
> > the Red Hat
> > Bugzilla [2].
> >=20
> > In the past, the issue was reported at [3], which resulted in a
> > patch [4] that
> > only keeps the system running instead of panicking. This means the
> > driver still
> > causes system hangs.
> >=20
> > I still don't know the root cause of the issue and I would like to
> > get to the
> > bottom of this; any help or guidance is appreciated. Crucially, I
> > have not found
> > a way to reproduce the issue at will.
> >=20
> > Best regards.
> >=20
> > [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D220353
> > [2] https://bugzilla.redhat.com/show_bug.cgi?id=3D2411854
> > [3]
> > https://lore.kernel.org/linux-wireless/VE1PR04MB64945C660A81D38F290E4A4=
BE59F9@VE1PR04MB6494.eurprd04.prod.outlook.com/T/#u
> > [4]
> > https://patchwork.kernel.org/project/linux-wireless/patch/727eb5ffd3c7c=
805245e512da150ecf0a7154020.1659452909.git.deren.wu@mediatek.com/
> >=20
> >=20
> >=20
> >=20
>=20

