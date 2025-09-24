Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952F0CAC5AC
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Sep 2025 01:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:From:To:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NkhB5Eq7YNc6UEPLQ7O7mqejLfm1SynA0VfL58RAiiA=; b=hZaOTG8pEmO/eE9RxW+hSwdJr2
	GW+jlYbKYoptCCX9DnNcYg7RC6VpnLofUBD/oHAwA1QuQrtoLFq4EOspo1K8DDMGLohrv7lLsDDwm
	LQnzRP5NbG2HmZ7VqKcCS9YUQOkXwSXAaN9YNsUPhwncwHs7/+H8hKrJ7cuULqeYNJW0o+FFTY97c
	sWXmlWFICvBojJRI4fBD8W4rIxtIBDr3JwVxReTYi/x2OQtjbGr66VlwLI1lOT+GG0j+ZhRUTMuVI
	mis0CtIY9tyIvb5qxbwlXNF/eri6VE2ePq5WcEXaaBWgL9Z403UXdHgppQTE4iXkvlNdkTG/zOzD1
	JqZYQqRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1EaM-0000000FJUY-2L03;
	Wed, 24 Sep 2025 01:46:22 +0000
Received: from mail-10624.protonmail.ch ([79.135.106.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1EaJ-0000000FJSp-3axq
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Sep 2025 01:46:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proko.dev;
	s=protonmail2; t=1758678364; x=1758937564;
	bh=NkhB5Eq7YNc6UEPLQ7O7mqejLfm1SynA0VfL58RAiiA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=vCbeovVpbqbCRGYU3IRvgoOqAyozewUjHwpOgnjXNR9UX3lVhbtjXhviI+3zcPoLr
	 EpXdWxCCr+F02LwIaVCYtoY56Vk4ros97LAmEzYdf98gl/SwebSLupxKE1FKRNKzc9
	 8xUzc/CvOHw9g+UK0Fs5hdibR+V98JWw2BqeyWa2iN5hh7pOBEwbv+tuWhZ+y9ZPVs
	 O8YZemZ1MoLDis08A1JO2O2nSHBUEXS5GGGOEwTRvMuN4lSTfo+syrjyTO6P39nvjr
	 vG83/fJjXAAgAHe3vW1d8X2q5i0lQ3xPcmhrAm2HZbdbgMYbfJEssIckr2bikXcqzq
	 TbG5TtlVhObIQ==
Date: Wed, 24 Sep 2025 01:46:00 +0000
To: "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
From: =?utf-8?Q?Ar=C5=ABnas_Prokopas?= <arunas@proko.dev>
Cc: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>
Subject: [BUG] btmtk: LE Audio connection failure on MT7925
Message-ID: <gzdSvfc7SQjhFkcntlBuhEWV1nthryRut4Tlw-45PuMe0Zs69tE8sDcR0g1lio07xaaNFMhB5SpMF6aAYIHTc5ZWjhtgZQvBZr0c5YeG0OI=@proko.dev>
Feedback-ID: 40422888:user:proton
X-Pm-Message-ID: 48b753933a5aedc6e048182e66aecdf385fc5b78
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------23be822eaf6f29a9fa8e45f6de37f67e4ea89f254d6ce8aef03a168f2517e4f7"; charset=utf-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_184620_751760_1AD63B94 
X-CRM114-Status: GOOD (  10.98  )
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------23be822eaf6f29a9fa8e45f6de37f67e4ea89f254d6ce8aef03a168f2517e4f7
Content-Type: multipart/mixed;boundary=---------------------dda14af2ed8ea6ed0fb54b1225defdf7

-----------------------dda14af2ed8ea6ed0fb54b1225defdf7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

Hello,

I have encounter a bug with the btmtk driver on an MT7925 chip, where LE A=
udio (ISO) connections consistently fail. Classic A2DP audio works correct=
ly.


Setup:

Device: Motherboard with onboard MediaTek MT7925
Kernel: 6.16-8-2-cachyos
BlueZ: 5.84-1
linux-firmware: 1:20250808-1 (provides `mediatek/mt7925/BT_RAM_CODE_MT7925=
_1_1_hdr.bin`)


Steps to Reproduce:

- Enable and force LE audio in `/etc/bluetooth/main.conf`:
    [General]
    Experimental =3D true
    KernelExperimental =3D 6fbaf188-05e0-496a-9885-d6ddfdb4e03e
    ControllerMode =3D le
- Restart the bluetooth service: `systemctl restart bluetooth.service`
- Re-pair the LE audio device
- Attempt to connect


Expected Behavior:

The LE Audio transport should be established successfully, as the hardware=
 advertises support for the necessary features to the host driver.


Observed Behavior:

The device connects, but the audio transport fails to establish. `bluetoot=
hctl` shows a continuous loop of creating and deleting transports. The ker=
nel and bluetoothd logs show a clear failure.


1. The kernel log (`dmesg`) show a few issues:

- The firmware version isn't reported correctly, suggesting an initializat=
ion problem.
- A warning is logged that a feature is being advertised but not supported=
.
- Despite the ISO layer being initialized by kernel successfully, the driv=
er rejects the `LE_SET_CIG_PARAMS` command (Opcode `0x2062`) repeatedly.

    [   36.005161] mt7925e 0000:0b:00.0: enabling device (0000 -> 0002)
    [   36.009348] mt7925e 0000:0b:00.0: ASIC revision: 79250000
    [   36.084024] mt7925e 0000:0b:00.0: HW/SW Version: 0x8a108a10, Build =
Time: 20250721232852a
    [   36.423286] mt7925e 0000:0b:00.0: WM Firmware Version: ____000000, =
Build Time: 20250721232943
    ...
    [   63.633518] Bluetooth: hci1: HW/SW Version: 0x00000000, Build Time:=
 20250825220109
    [   82.298593] Bluetooth: hci1: Device setup in 18160764 usecs
    [   82.298597] Bluetooth: hci1: HCI Enhanced Setup Synchronous Connect=
ion command is advertised, but not supported.
    ...
    [   82.515641] Bluetooth: ISO socket layer initialized
    ...
    [ 1272.202995] Bluetooth: hci1: Opcode 0x2062 failed: -95
    [ 1272.446987] Bluetooth: hci1: Opcode 0x2062 failed: -95
    [ 1272.474975] Bluetooth: hci1: Opcode 0x2062 failed: -95


2. The bluetoothd log (`journalctl`) correctly reports the error from the =
kernel:

    Sep 24 01:58:19 my-pc bluetoothd[17487]: profiles/audio/bap.c:iso_conn=
ect_cb() connect to 80:99:E7:F0:37:7E: Operation not supported (95)
    Sep 24 01:58:19 my-pc bluetoothd[17487]: profiles/audio/bap.c:iso_conn=
ect_cb() connect to 80:99:E7:F0:37:7E: Operation not supported (95)


3. `bluetoothctl` output (sample of the loop):

    [CHG] Device 80:99:E7:F0:37:7E Connected: yes
    [CHG] LE 80:99:E7:F0:37:7E Connected: yes
    [NEW] Transport /org/bluez/hci1/dev_80_99_E7_F0_37_7E/pac_sink0/fd14 =


    [NEW] Transport /org/bluez/hci1/dev_80_99_E7_F0_37_7E/pac_source0/fd15=
 =


    [CHG] Transport /org/bluez/hci1/dev_80_99_E7_F0_37_7E/pac_sink0/fd14 L=
inks: /org/bluez/hci1/dev_80_99_E7_F0_37_7E/pac_source0/fd15
    [CHG] Transport /org/bluez/hci1/dev_80_99_E7_F0_37_7E/pac_source0/fd15=
 Links: /org/bluez/hci1/dev_80_99_E7_F0_37_7E/pac_sink0/fd14
    [DEL] Transport /org/bluez/hci1/dev_80_99_E7_F0_37_7E/pac_sink0/fd14 =


    [DEL] Transport /org/bluez/hci1/dev_80_99_E7_F0_37_7E/pac_source0/fd15=
 =


    [NEW] Transport /org/bluez/hci1/dev_80_99_E7_F0_37_7E/pac_sink0/fd16 =


    [CHG] Transport /org/bluez/hci1/dev_80_99_E7_F0_37_7E/pac_sink0/fd16 V=
olume: 0x0066 (102)
    [DEL] Transport /org/bluez/hci1/dev_80_99_E7_F0_37_7E/pac_sink0/fd16 =




Additional Context:

This may indicate an incomplete implementation for this specific chipset, =
possibly related to the development work discussed in this thread from May=
 2024:
Link: https://lore.kernel.org/linux-bluetooth/dc0445c08b4a7189388a006765d4=
c647e6ba0164.camel@mediatek.com/


Please let me know if any further logs, tests, or information are needed.

Thanks,
Arunas Prokopas
-----------------------dda14af2ed8ea6ed0fb54b1225defdf7--

--------23be822eaf6f29a9fa8e45f6de37f67e4ea89f254d6ce8aef03a168f2517e4f7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wrsEARYKAG0FgmjTTUkJEBVkAXWAamtsRRQAAAAAABwAIHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmeeRaR0lVu43ADT3mxoO1I7z0WNiPb/Yh5Zl/7g
4iHeFhYhBNGCHEbLGv7NNnhLIhVkAXWAamtsAABWswEAlARK73kKRAHUMxkk
E+tN3VxUGPNsmn6mYeUHLfSK0cIA/2pNLmmPVn8dGJH4G5f587RHxG2jaJL9
/ceW5rR39YIE
=EwrF
-----END PGP SIGNATURE-----


--------23be822eaf6f29a9fa8e45f6de37f67e4ea89f254d6ce8aef03a168f2517e4f7--


