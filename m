Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB3DCFD31C
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Nov 2025 07:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9fxQrOSZ8EH2ePBO4+eXT9MMDc+xGvvwMkbeTGrDmXs=; b=Hsv/GTFJukOWt965RuqqdPPfqi
	LIh1Tv7Pyj379ZfuQfXj2UiKmpzE67kVsLkuqS0O+yUhv9/xSdjjfMW47Qouvj7d0/7dGV9ZFXW8f
	ECkQXwWJpbuMsSNw3E39+CKudwoGVuf/vMoaJSv5b5vvpkk2ZjPdJNDsmBXjJPHqRWmalAg8Fv4gC
	Z0xFfsSwscBP8EoG1mFu8zL3p2QuI9wPy7CX7p/Hg3x9f3vdUoTbhp3fouPj6XstB8sPplc1v0BDT
	DclPlEgFQnYFPp1+PJYZyg44oUX9w7yJTuN5tjpQMg0bksznQ0ZvUhQTkZveGs3MOQc0pKJXNtsoc
	anHUHE/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNQjG-0000000BCnW-03K7;
	Mon, 24 Nov 2025 07:11:18 +0000
Received: from mailgate01.uberspace.is ([2001:1a50:11:0:c83f:a8ff:fea6:c8da])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNQjC-0000000BCkc-2U51
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Nov 2025 07:11:16 +0000
Received: from cressida.uberspace.de (cressida.uberspace.de [185.26.156.202])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id F417B60705
	for <linux-mediatek@lists.infradead.org>; Mon, 24 Nov 2025 08:11:03 +0100 (CET)
Received: (qmail 5511 invoked by uid 989); 24 Nov 2025 07:11:03 -0000
Authentication-Results: cressida.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by cressida.uberspace.de (Haraka/3.0.1) with ESMTPSA; Mon, 24 Nov 2025 08:11:03 +0100
Date: Mon, 24 Nov 2025 08:11:01 +0100
From: Matthias Beyer <mail@beyermatthias.de>
To: screens <screenss@fastmail.com>
Cc: linux-mediatek@lists.infradead.org, sean.wang@mediatek.com
Subject: Re: mt7921e kernel driver issues
Message-ID: <ftrmcr7da4v53etvepm4io2tyqimqwwhfai37pwfdfsuavjqgv@4mnnutdpw3s6>
References: <cd45ed44-ee2d-40f6-a45a-cec56c2cdd00@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rh2fxkdnvb2uvgds"
Content-Disposition: inline
In-Reply-To: <cd45ed44-ee2d-40f6-a45a-cec56c2cdd00@app.fastmail.com>
X-Rspamd-Bar: ----
X-Rspamd-Report: BAYES_HAM(-2.992972) MID_RHS_NOT_FQDN(0.5) SIGNED_PGP(-2) MIME_GOOD(-0.2)
X-Rspamd-Score: -4.692972
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=beyermatthias.de; s=uberspace;
	h=from:to:cc:subject:date;
	bh=3SLA6eUDrp9wmCNdH+NfIKDyrp6sw9fEfgNPybuTu80=;
	b=EupiUab5ytIHxt0uhiZc3TcXXUw4UrL7bbPj0xZoJQyf68sjITzIOEgimYFHMvHegPwr4xqozh
	22NMdahvVRUMxTSv+R6EyevTDeQ8TSuAkOhMw4MV8OIsJ8eOENwYJKOjM+63om5m5+WqxeC7RKgl
	mdQ5TXzuTT832G3CVMxXEeQppBly5orrMFqmGJTcMgEOfcwC8wdf8AzotZ0GeRf44zOGu5QMm8U4
	XWSpswdS2Lb7X1nGh6ZWfUhQtPFSF3yoFeXbhi3ytLeee/xhJx6O/4emZOF+f+aOSwGGoL4BvSW7
	G8XhG4SCk3jMj3GN82nn/s48zAYU/ex4NZdcSw4Yjm7ea4DOe918KUZ2giwomrCUleTsZuK5u0i8
	6sMuBA9L+17QruovuVZigdnIbfMsCaKMVBWmYGTSXppPM0mJsnLE+k805NykD9Af++gOiOLmWf2x
	se2AXiHcUE5QdKUmeixdqkdsB5gjplhpju/O1QBIhgqneBz1lwtcHhrJReuVpZNpSgcD9vtLhFaQ
	8/YEmOD9sCb1iGA/z5iAvmzAkR2jRmJM08lVZJQd5/VVxjvjBgU5Q82duGahWjDtTxbE2IvTZClr
	DZwL07NFwNe/2rc9/7ha1edg/VV9HmXssnK4HE5hHN7F51S26Denm2koipPekYF0L2Bpx3IFsGrd
	Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_231114_892021_FAC6E293 
X-CRM114-Status: GOOD (  10.35  )
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


--rh2fxkdnvb2uvgds
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: mt7921e kernel driver issues
MIME-Version: 1.0

Hi,

I am seemingly experiencing the same issue on my (wifes) tuxedo OS
running with

    linux-firmware/noble-updates,noble-security,now 20240318.git3b128b60-0u=
buntu2.19 amd64

on

    $ uname -a
    Linux [REDACTED] 6.14.0-115036-tuxedo #36~24.04.1tux1 SMP PREEMPT_DYNAM=
IC Mon Nov  3 17:34:07 UTC 2025 x86_64 x86_64 x86_64 GNU/Linux

The journal tells me:

    $ sudo journalctl -b -2 --grep mt7921e
    Okt 18 12:43:33 [REDACTED] kernel: mt7921e 0000:0f:00.0: enabling devic=
e (0000 -> 0002)
    Okt 18 12:43:33 [REDACTED] kernel: mt7921e 0000:0f:00.0: ASIC revision:=
 79220010
    Okt 18 12:43:33 [REDACTED] kernel: mt7921e 0000:0f:00.0: HW/SW Version:=
 0x8a108a10, Build Time: 20240219103244a
    Okt 18 12:43:33 [REDACTED] kernel: mt7921e 0000:0f:00.0: WM Firmware Ve=
rsion: ____000000, Build Time: 20240219103337
    Okt 18 12:43:34 [REDACTED] kernel: mt7921e 0000:0f:00.0 wlp15s0: rename=
d from wlan0
    Okt 18 12:43:40 [REDACTED] NetworkManager[1137]: <info>  [1760784220.17=
21] rfkill0: found Wi-Fi radio killswitch (at /sys/devices/pci0000:00/0000:=
00:02.1/0000:05:00.0/0000:06:0b.0/0000:0f:00.0/ieee80211/phy0/rfkill0) (dri=
ver mt7921e)
    Nov 23 15:09:05 [REDACTED] kernel: mt7921e 0000:0f:00.0: Message 000000=
10 (seq 14) timeout
    Nov 23 15:09:05 [REDACTED] kernel: mt7921e 0000:0f:00.0: Failed to get =
patch semaphore
    Nov 23 15:09:08 [REDACTED] kernel: mt7921e 0000:0f:00.0: Message 000000=
10 (seq 15) timeout
    Nov 23 15:09:08 [REDACTED] kernel: mt7921e 0000:0f:00.0: Failed to get =
patch semaphore
    Nov 23 15:09:11 [REDACTED] kernel: mt7921e 0000:0f:00.0: Message 000000=
10 (seq 1) timeout
    Nov 23 15:09:11 [REDACTED] kernel: mt7921e 0000:0f:00.0: Failed to get =
patch semaphore
    Nov 23 15:09:14 [REDACTED] kernel: mt7921e 0000:0f:00.0: Message 000000=
10 (seq 2) timeout
    Nov 23 15:09:14 [REDACTED] kernel: mt7921e 0000:0f:00.0: Failed to get =
patch semaphore
    Nov 23 15:09:17 [REDACTED] kernel: mt7921e 0000:0f:00.0: Message 000000=
10 (seq 3) timeout
    Nov 23 15:09:17 [REDACTED] kernel: mt7921e 0000:0f:00.0: Failed to get =
patch semaphore
    Nov 23 15:09:21 [REDACTED] kernel: mt7921e 0000:0f:00.0: Message 000000=
10 (seq 4) timeout
    Nov 23 15:09:21 [REDACTED] kernel: mt7921e 0000:0f:00.0: Failed to get =
patch semaphore
    Nov 23 15:09:24 [REDACTED] kernel: mt7921e 0000:0f:00.0: Message 000000=
10 (seq 5) timeout
    Nov 23 15:09:24 [REDACTED] kernel: mt7921e 0000:0f:00.0: Failed to get =
patch semaphore
    Nov 23 15:09:27 [REDACTED] kernel: mt7921e 0000:0f:00.0: Message 000000=
10 (seq 6) timeout
    Nov 23 15:09:27 [REDACTED] kernel: mt7921e 0000:0f:00.0: Failed to get =
patch semaphore
    Nov 23 15:09:30 [REDACTED] kernel: mt7921e 0000:0f:00.0: Message 000000=
10 (seq 7) timeout
    Nov 23 15:09:30 [REDACTED] kernel: mt7921e 0000:0f:00.0: Failed to get =
patch semaphore
    Nov 23 15:09:33 [REDACTED] kernel: mt7921e 0000:0f:00.0: Message 000000=
10 (seq 8) timeout
    Nov 23 15:09:33 [REDACTED] kernel: mt7921e 0000:0f:00.0: Failed to get =
patch semaphore
    Nov 23 15:09:33 [REDACTED] kernel: mt7921e 0000:0f:00.0: chip reset fai=
led
    [continued...]

Reboot wont help.

Best,
Matthias

Am Wed, Nov 20, 2024 at 10:12:10AM -0500, schrieb screens:
> Hello, I'm reaching out in hopes to draw some attention to this Mediatek =
kernel driver issue: https://bugzilla.kernel.org/show_bug.cgi?id=3D217415
>=20
> The issue has been active for months, and there are numerous threads span=
ning many distributions and laptop forums that describe the issue and the n=
eeded workarounds.
> * https://community.frame.work/t/framework-13-amd-on-arch-issues-with-wir=
eless-after-resume/44597
> * https://community.frame.work/t/responded-arch-hibernation-woes-on-amd-1=
3/45474
> * https://bbs.archlinux.org/viewtopic.php?id=3D295916
> * https://forum.manjaro.org/t/mediatek-mt7921e-fails-in-kernel-6-6-and-la=
ter-through-6-10/164217
> * https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1975444
>=20
> Are there any plans to fully address this issue?
>=20
> Thank you.
>=20

--rh2fxkdnvb2uvgds
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEUJGUus1GMTrRclzcEKWX9Kitz80FAmkkBQUACgkQEKWX9Kit
z83WIQ/+NB2LTojKVy83nkQIjTJO/SARy3be4oro/zCxYL/TRAagIROFCaIwurlX
5hEYJZ+8oKNr4oZxcb8IxiVbKystZU9K3Ra5uuXo5lshds2LJ0vtLfqA3x0JVOk6
nWcjD296QoUEBwiT9Ma40Z3kEXTU2UXIEHVIzSssdAFML1RSaOwKS3a2kpeW78iI
VjBD2PoQDYM+4KAjt+h3WDBKyfTbkPmf2slrWNyjevDiS9/s3OK0XmVkSNP7lIRe
jHM0nd0gwlZQDnMpE7aiP+fWkARZ8QeNLwunpnkG/W4pJV05aY28e27ovt1756KD
0LSwCNgpMs7CLYElnEFuyvNuefBsPidvckjG1w+wYrTGXOuTBMxYnJq9cHSSr/xv
F471/zy+qEomkGkc2r+6rdmoJ3KIOaw7kj3+dpgwczRu1NlI1jEsD4Tb9QgDVv9O
O3+cG+oknAK4/2uzKPEutbntUqKqSR/WHjcveZFwFI61oBJSHpuK88SFjZsm3baC
d+JSrbs1X0TiMasQwsqhTVre7sryhxmRi5Uuq6ucwoMd/B6CVTUe6Ro/oYB8f1fS
n0CrWTXLcS7pjAiDkDCxaCLfZbVwC2lfV7zFZWNbMxKGO/n9uGkmO2tFyg/v24Qa
rkERKpgJQzMal1qjRFGM9tWOPiDDjGERsH5qUDDodtVg2U1meKs=
=jdwW
-----END PGP SIGNATURE-----

--rh2fxkdnvb2uvgds--

