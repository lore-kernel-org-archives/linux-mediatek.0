Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFC71112241
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Apr 2026 23:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1sXBNqug0DkE2sO3RKQReACBcJvWTOGM7QqwiJSRO1g=; b=whAM6q4neI/CHNZ5beYfPenTDH
	9fkasvVSfjbLxojJfCzELEYCunq/Nu1lnuk0kMrItR8ib04qIsEdwS/rTVpSZ1GZeABFrE88rTujd
	+o0rziE1Z6v3M/WH+wwPu90HOqsLw4diUKWF4x0GOcIFOYmvy4BrotkgsQJ6SfmbCdliqWocuZqoO
	0z5ADzTNySFOBefq2478D0g1hvJXRhWc7CZzJh+ckDSVtS5G7IZbLcwtlkriMhkw/4FxS2V3YiRk4
	KMfLpvB7HgT7DzyEl8ZxyObLtt46iY9m7jCK7ShvwlBPm+2qI+ZkFj8WirauxJ6yWXYog8l4GzhNv
	mkbST3qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w853p-0000000GRfl-2Z97;
	Wed, 01 Apr 2026 23:33:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w853j-0000000GRf6-3Ood
	for linux-mediatek@lists.infradead.org;
	Wed, 01 Apr 2026 23:33:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 12C1F43208
	for <linux-mediatek@lists.infradead.org>; Wed,  1 Apr 2026 23:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0B53C2BCB0
	for <linux-mediatek@lists.infradead.org>; Wed,  1 Apr 2026 23:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775086394;
	bh=1sXBNqug0DkE2sO3RKQReACBcJvWTOGM7QqwiJSRO1g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=b/5T8d5hK0Af0DpF0zqeb3jsYu8NsJg3mz2UzZZplfwnYEiZO7g2QA3Ff1NC7R4XJ
	 0gowvLGs0sXRxQMBqi8h8owSdKNg7+ZvH2B1DICiRBsC5aooxonbeOSuDztkf4SkGs
	 UA9DK8ybPw8uRake+0k2t6TLlChHe8W91kNaI+RnWO12YauXMI9V9rCX0HB5RvXDSO
	 4jB5lScb1ASi6LJFVLnLqoHMQ0uqnhGmjemtWh+LndetKe+NKxgeRzWo/+oYYB6VIU
	 YmnqsJR+jGhbkWDp+wpOduMqwJq83LphwNQe8nLfmKG2bEca1MpwB/aDp0iq3aVgGi
	 uh6Q/6IiGERPA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38a23dd61c1so2698031fa.1
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Apr 2026 16:33:14 -0700 (PDT)
X-Gm-Message-State: AOJu0YyLvnMQRAO5J3Z+1632d8UrItkl450kM2WFDlSICz4fizzE0ZEl
	dN+fjzIqzA2eF4jQcUKLYOSUvvlw96Dd10rjsT5WZzjJ8aUEWLB5aJmurxk8y68Zn1Vq8hLChm/
	OIG8qljiuXY1v05vElA1a90fjpO/W+VU=
X-Received: by 2002:a2e:96c4:0:b0:38b:fd3e:c42f with SMTP id
 38308e7fff4ca-38cc2f6d560mr14044901fa.14.1775086393244; Wed, 01 Apr 2026
 16:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAEoHs0hONW_X8POryv-YC8ahGAVoOsvXXJw9VnDOguSgq52v=Q@mail.gmail.com>
In-Reply-To: <CAEoHs0hONW_X8POryv-YC8ahGAVoOsvXXJw9VnDOguSgq52v=Q@mail.gmail.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Wed, 1 Apr 2026 18:33:00 -0500
X-Gmail-Original-Message-ID: <CAGp9LzqMNFwQVg248rxEQ=YPhqABprVGMHx2jREmSBBzSW91aw@mail.gmail.com>
X-Gm-Features: AQROBzDkN6WEAOoeEce2wboeQZfOu-bn-7y38aYDKlWopxuom81kQnrkfRRU5wI
Message-ID: <CAGp9LzqMNFwQVg248rxEQ=YPhqABprVGMHx2jREmSBBzSW91aw@mail.gmail.com>
Subject: Re: [BUG] mt7925e: MSI Vector A16 HX A8WHG-004US reports permanent
 hardware rfkill block under Linux; ACPI GPPA.WLAN AE_ALREADY_EXISTS
To: Ross <rosspayant@gmail.com>
Cc: linux-mediatek@lists.infradead.org, nbd@nbd.name, lorenzo@kernel.org, 
	ryder.lee@mediatek.com, shayne.chen@mediatek.com, sean.wang@mediatek.com, 
	deren.wu@mediatek.com, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_163315_895476_8C5A6385 
X-CRM114-Status: GOOD (  33.27  )
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

On Mon, Mar 9, 2026 at 2:20=E2=80=AFPM Ross <rosspayant@gmail.com> wrote:
>
> Hello, I want to report a wifi bug. This bug makes the wifi hard lock
> on my computer under Arch Linux as well as Fedora. Wifi does work on
> Linux LTE and Windows 11. The computer is a Vector A16 HX A8WHG-004US
> and this it's actually the second I bought. I returned the first one
> because of the exact same bug. Since I got the second one I've stuck
> it through hoping there would be a fix, it's been three months now.
> I've tried all the possible fixes (on both machines), nothing. "sudo
> rfkill unblock all" and "sudo rfkill unblock wifi" do not work. There
> is no switch in the bios or "airplane mode" hotkey to toggle either.
> The wifi just does not work in Linux (apart from LTE). I've updated
> the bios to the new version every time a new one drops (including the
> most recent one from a couple days ago) and nothing has changed
> anything. I've updated everything else frequently. No dice.
>
> Anyway, I suppose this is where I go to file report bugs like this?
> I've never issued a bug report before so I'm not sure. Thank you so
> much for giving this the time of day, as well as all the other work
> you do on the LInux project. If you need further information I'll give
> you whatever you need.
>
> I had the following written for me by AI but I can confirm it's
> accurate to the problem:
>
>
> I am reporting what appears to be an MSI-platform-specific MT7925
> hard-rfkill issue on Linux.
>
> Hardware
> - Laptop: MSI Vector A16 HX A8WHG-004US
> - WLAN: MEDIATEK MT7925 802.11be 160MHz 2x2 PCIe Wireless Network
> Adapter [14c3:7925]
> - Subsystem: Foxconn International, Inc. Device [105b:e138]
>
> Software
> - BIOS: E15MMAMS.107
> - Kernel: 6.19.6-arch1-1
> - linux-firmware: 20260221-1
> - Distro: Arch Linux
>
> Problem
> - The Wi-Fi device is detected correctly.
> - The mt7925e driver binds successfully.
> - Firmware appears to load.
> - The interface is created/renamed to wlp5s0.
> - However, rfkill always reports the WLAN as hard blocked.
>
> Current rfkill state
> - Bluetooth: Soft blocked: no / Hard blocked: no
> - Wireless LAN: Soft blocked: no / Hard blocked: yes
>
> Attempted commands
> - sudo rfkill unblock wifi
> - sudo rfkill unblock all
>
> Neither command changes the WLAN hard block.
>
> Relevant observations
> - lspci shows:
> MEDIATEK Corp. MT7925 802.11be 160MHz 2x2 PCIe Wireless Network
> Adapter [Filogic 360] [14c3:7925]
> Kernel driver in use: mt7925e
> - The boot log shows the device being enabled, ASIC revision detected,
> firmware information printed, and the interface renamed from wlan0 to
> wlp5s0.
> - The same boot log also shows repeated ACPI errors involving WLAN
> objects under \_SB.PCI0.GPPA.WLAN..., including repeated
> AE_ALREADY_EXISTS failures.
>
> This makes it look like:
> - the device is present,
> - the mt7925e driver is loading,
> - but platform/ACPI state may be forcing or misreporting hardware rfkill.
>
> Relevant kernel log excerpt
>
> mt7925e 0000:05:00.0: enabling device (0000 -> 0002)
> mt7925e 0000:05:00.0: ASIC revision: 79250000
> mt7925e 0000:05:00.0: HW/SW Version: 0x8a108a10, Build Time: 202601061530=
07a
> mt7925e 0000:05:00.0: WM Firmware Version: ____000000, Build Time:
> 20260106153120
> mt7925e 0000:05:00.0 wlp5s0: renamed from wlan0
>

From the logs so far, this does not look like a basic mt7925e
initialization failure. The device probes normally, firmware loads,
and the interface is created, but the WLAN still ends up reported as
hard blocked, so Wi-Fi never becomes usable. Typically, this kind of
blocked state comes from a platform-level source, such as a hardware
radio switch or platform-provided radio state, rather than from the
mt7925e path itself.

> ACPI BIOS Error (bug): Failure creating named object
> [\_SB.PCI0.GPPA.WLAN._S0W], AE_ALREADY_EXISTS
> ACPI BIOS Error (bug): Failure creating named object
> [\_SB.PCI0.GPPA.WLAN._S4W], AE_ALREADY_EXISTS
> ACPI BIOS Error (bug): Failure creating named object
> [\_SB.PCI0.GPPA.WLAN._DSM], AE_ALREADY_EXISTS
> ACPI BIOS Error (bug): Failure creating named object
> [\_SB.PCI0.GPPA.WLAN.PCIF], AE_ALREADY_EXISTS
> ACPI BIOS Error (bug): Failure creating named object
> [\_SB.PCI0.GPPA.WLAN.NVID], AE_ALREADY_EXISTS
> ACPI BIOS Error (bug): Failure creating named object
> [\_SB.PCI0.GPPA.WLAN.NDID], AE_ALREADY_EXISTS
> ACPI BIOS Error (bug): Failure creating named object
> [\_SB.PCI0.GPPA.WLAN.PWR1], AE_ALREADY_EXISTS
> ACPI BIOS Error (bug): Failure creating named object
> [\_SB.PCI0.GPPA.WLAN._PR0], AE_ALREADY_EXISTS
> ACPI BIOS Error (bug): Failure creating named object
> [\_SB.PCI0.GPPA.WLAN._PR2], AE_ALREADY_EXISTS
> ACPI BIOS Error (bug): Failure creating named object
> [\_SB.PCI0.GPPA.WLAN._PR3], AE_ALREADY_EXISTS
> ACPI BIOS Error (bug): Failure creating named object
> [\_SB.PCI0.GPPA.WLAN.PWFR], AE_ALREADY_EXISTS
> ACPI BIOS Error (bug): Failure creating named object
> [\_SB.PCI0.GPPA.WLAN._PRR], AE_ALREADY_EXISTS
>
> Reproduction
> 1. Boot Linux normally.
> 2. Run:
> rfkill list all
> 3. Wireless LAN is always reported as:
> Soft blocked: no
> Hard blocked: yes
>
> Additional notes
> - Windows 11 on the same laptop can use Wi-Fi normally.
> - Updating BIOS from E15MMAMS.106 to E15MMAMS.107 did not resolve the iss=
ue.
> - This may be similar in shape to other MT7925 hard-rfkill issues that
> required a machine-specific quirk, but on this MSI model the prominent
> clue is the repeated ACPI GPPA.WLAN object collision.
>
> Please let me know if you want:
> - full lspci -nnk output
> - full dmesg/journalctl -b -k
> - acpidump / decoded DSDT
> - additional testing with a proposed patch or boot parameter
>
> --
> Ross Payant
>

