Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DDCCCD193
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Oct 2025 22:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3PiqMwenMTlOQRYVJtFaUTaeqCobXUHeKnO8dE/8wLE=; b=aE+hsIPZP1G8J/4cBcs9TXhRTn
	5ejyEJkkyPn/MpXRdC3k8cm/vTKzEKi5GnaDWWk8lO6iws5iY+WPTqgg7NqFTyjlJ9qR+lVMsM8Ej
	Jv4KgSlCQ9fMJfhniQi/yWrAc7Fc7cv1UqBN8Y5O642495pP/xcb71PuUEdXm2nrL0zyt9ojwL1ep
	NHFjk12SaMbeoe7CJme7ERnA1UbGFHU8LkcTdaa6GuISMZCTI7DxTxkQ3TFStVO9DBaoGbGqsPx3U
	Hmry1BA8HFM9WQczlVfW481VnAo3XunmbxKA7Y9NDW2pACq1PV009IyOOg2bNi4v3tD/t5eUMJC1V
	BECZnP+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9AQf-000000032t8-3AU0;
	Wed, 15 Oct 2025 22:57:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9AQf-000000032t0-0M1V
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Oct 2025 22:57:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 589CE60323
	for <linux-mediatek@lists.infradead.org>; Wed, 15 Oct 2025 22:57:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 067CEC4AF0B
	for <linux-mediatek@lists.infradead.org>; Wed, 15 Oct 2025 22:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760569028;
	bh=wCxCuFV+ZgSpXmX71bZY0UpUFS1gGjv49aosWoHBmn0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bxJJO4UizonQ3104Dy1ghV4S+n+vTN/uKSOQkwFJq4TRQ5lJQS70c+laNoe1O+Iwj
	 jyyk6A9Rx1bv7e07AseJi4MCGSJ0tShKRX8v1dlJ+mu+iBxODAqfDxzCqrYwFrpm/U
	 xv5feeJwDdPz6YgpJw+EgaA3DsKUmR/eChW5i8lDexfkxz75UFU4rEvCMHpAacuiq8
	 4o5m2LPrPW4D7ItarBUfg+4UZMSXGwzXvGEedVV6dicQjT2LQd79V4LYAy0IKeVlIM
	 aI19/cIphuxm1eMlo7oYrt8Z2GP3hU7FcZKZFO5XAf0lgZ7Ysiq0+ypsaRITBodMXt
	 J2v6BHRCIieDA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59093250aabso130345e87.2
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Oct 2025 15:57:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWR04HlhPdtmG/SwKB5oqIYMdAMX3bSBWuDpJ3wpFWs2wbVHTiwR0vsQXiodxJTWFoaudRqG2G3OIAnazRM6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2gJEfHQs+PBzgRwgcrxX5eMhCtlOYDA3659+HtqfPc3bvHnmp
	bSeLw/OmazayfLMul1Gi8Z1BrW/Nf2i/aM6vQDaORhMhyz5ZtJNpJo8eTBSXj934tTMpNbExc7q
	fIK7KXKkSr64m7kttTGDwZ7Kj1IbFgj4=
X-Google-Smtp-Source: AGHT+IG+/X5R1ZTZ4dfjVO4h6pavIg7zAVvsJrMtanP9NZghUGvVv86hOkwmY0GFwz90F8mhrNUHQqCRq1FbPgXJObM=
X-Received: by 2002:a05:651c:222c:b0:36d:e147:3f34 with SMTP id
 38308e7fff4ca-37609cea8d5mr79612831fa.2.1760569026357; Wed, 15 Oct 2025
 15:57:06 -0700 (PDT)
MIME-Version: 1.0
References: <gzdSvfc7SQjhFkcntlBuhEWV1nthryRut4Tlw-45PuMe0Zs69tE8sDcR0g1lio07xaaNFMhB5SpMF6aAYIHTc5ZWjhtgZQvBZr0c5YeG0OI=@proko.dev>
In-Reply-To: <gzdSvfc7SQjhFkcntlBuhEWV1nthryRut4Tlw-45PuMe0Zs69tE8sDcR0g1lio07xaaNFMhB5SpMF6aAYIHTc5ZWjhtgZQvBZr0c5YeG0OI=@proko.dev>
From: Sean Wang <sean.wang@kernel.org>
Date: Wed, 15 Oct 2025 17:56:54 -0500
X-Gmail-Original-Message-ID: <CAGp9Lzq17MXB1s3U9EXCpCPAwdjO1fNmAzftoJ_hyVinXsLG3A@mail.gmail.com>
X-Gm-Features: AS18NWBvDxF-hMjZyqvSHzRT2HhNlOKLXSLrtiiY_mc4WdQGiTPMmcEfGJCH5nQ
Message-ID: <CAGp9Lzq17MXB1s3U9EXCpCPAwdjO1fNmAzftoJ_hyVinXsLG3A@mail.gmail.com>
Subject: Re: [BUG] btmtk: LE Audio connection failure on MT7925
To: =?UTF-8?Q?Ar=C5=ABnas_Prokopas?= <arunas@proko.dev>
Cc: "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hello Ar=C5=ABnas,
Could you please capture and share a btmon log while reproducing the
LE Audio issue? It will help the vendor diagnose the problem
effectively.
Thank you!

On Tue, Sep 23, 2025 at 8:48=E2=80=AFPM Ar=C5=ABnas Prokopas <arunas@proko.=
dev> wrote:
>
> Hello,
>
> I have encounter a bug with the btmtk driver on an MT7925 chip, where LE =
Audio (ISO) connections consistently fail. Classic A2DP audio works correct=
ly.
>
>
> Setup:
>
> Device: Motherboard with onboard MediaTek MT7925
> Kernel: 6.16-8-2-cachyos
> BlueZ: 5.84-1
> linux-firmware: 1:20250808-1 (provides `mediatek/mt7925/BT_RAM_CODE_MT792=
5_1_1_hdr.bin`)
>
>
> Steps to Reproduce:
>
> - Enable and force LE audio in `/etc/bluetooth/main.conf`:
>     [General]
>     Experimental =3D true
>     KernelExperimental =3D 6fbaf188-05e0-496a-9885-d6ddfdb4e03e
>     ControllerMode =3D le
> - Restart the bluetooth service: `systemctl restart bluetooth.service`
> - Re-pair the LE audio device
> - Attempt to connect
>
>
> Expected Behavior:
>
> The LE Audio transport should be established successfully, as the hardwar=
e advertises support for the necessary features to the host driver.
>
>
> Observed Behavior:
>
> The device connects, but the audio transport fails to establish. `bluetoo=
thctl` shows a continuous loop of creating and deleting transports. The ker=
nel and bluetoothd logs show a clear failure.
>
>
> 1. The kernel log (`dmesg`) show a few issues:
>
> - The firmware version isn't reported correctly, suggesting an initializa=
tion problem.
> - A warning is logged that a feature is being advertised but not supporte=
d.
> - Despite the ISO layer being initialized by kernel successfully, the dri=
ver rejects the `LE_SET_CIG_PARAMS` command (Opcode `0x2062`) repeatedly.
>
>     [   36.005161] mt7925e 0000:0b:00.0: enabling device (0000 -> 0002)
>     [   36.009348] mt7925e 0000:0b:00.0: ASIC revision: 79250000
>     [   36.084024] mt7925e 0000:0b:00.0: HW/SW Version: 0x8a108a10, Build=
 Time: 20250721232852a
>     [   36.423286] mt7925e 0000:0b:00.0: WM Firmware Version: ____000000,=
 Build Time: 20250721232943
>     ...
>     [   63.633518] Bluetooth: hci1: HW/SW Version: 0x00000000, Build Time=
: 20250825220109
>     [   82.298593] Bluetooth: hci1: Device setup in 18160764 usecs
>     [   82.298597] Bluetooth: hci1: HCI Enhanced Setup Synchronous Connec=
tion command is advertised, but not supported.
>     ...
>     [   82.515641] Bluetooth: ISO socket layer initialized
>     ...
>     [ 1272.202995] Bluetooth: hci1: Opcode 0x2062 failed: -95
>     [ 1272.446987] Bluetooth: hci1: Opcode 0x2062 failed: -95
>     [ 1272.474975] Bluetooth: hci1: Opcode 0x2062 failed: -95
>
>
> 2. The bluetoothd log (`journalctl`) correctly reports the error from the=
 kernel:
>
>     Sep 24 01:58:19 my-pc bluetoothd[17487]: profiles/audio/bap.c:iso_con=
nect_cb() connect to 80:99:E7:F0:37:7E: Operation not supported (95)
>     Sep 24 01:58:19 my-pc bluetoothd[17487]: profiles/audio/bap.c:iso_con=
nect_cb() connect to 80:99:E7:F0:37:7E: Operation not supported (95)
>
>
> 3. `bluetoothctl` output (sample of the loop):
>
>     [CHG] Device 80:99:E7:F0:37:7E Connected: yes
>     [CHG] LE 80:99:E7:F0:37:7E Connected: yes
>     [NEW] Transport /org/bluez/hci1/dev_80_99_E7_F0_37_7E/pac_sink0/fd14
>
>     [NEW] Transport /org/bluez/hci1/dev_80_99_E7_F0_37_7E/pac_source0/fd1=
5
>
>     [CHG] Transport /org/bluez/hci1/dev_80_99_E7_F0_37_7E/pac_sink0/fd14 =
Links: /org/bluez/hci1/dev_80_99_E7_F0_37_7E/pac_source0/fd15
>     [CHG] Transport /org/bluez/hci1/dev_80_99_E7_F0_37_7E/pac_source0/fd1=
5 Links: /org/bluez/hci1/dev_80_99_E7_F0_37_7E/pac_sink0/fd14
>     [DEL] Transport /org/bluez/hci1/dev_80_99_E7_F0_37_7E/pac_sink0/fd14
>
>     [DEL] Transport /org/bluez/hci1/dev_80_99_E7_F0_37_7E/pac_source0/fd1=
5
>
>     [NEW] Transport /org/bluez/hci1/dev_80_99_E7_F0_37_7E/pac_sink0/fd16
>
>     [CHG] Transport /org/bluez/hci1/dev_80_99_E7_F0_37_7E/pac_sink0/fd16 =
Volume: 0x0066 (102)
>     [DEL] Transport /org/bluez/hci1/dev_80_99_E7_F0_37_7E/pac_sink0/fd16
>
>
>
> Additional Context:
>
> This may indicate an incomplete implementation for this specific chipset,=
 possibly related to the development work discussed in this thread from May=
 2024:
> Link: https://lore.kernel.org/linux-bluetooth/dc0445c08b4a7189388a006765d=
4c647e6ba0164.camel@mediatek.com/
>
>
> Please let me know if any further logs, tests, or information are needed.
>
> Thanks,
> Arunas Prokopas

