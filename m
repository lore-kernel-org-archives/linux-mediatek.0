Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAF5C61DB6
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2026 07:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tu10D1faxzRZxJdu+Ny2sxBSsQ2jkkXg61KqinheAZU=; b=oGbEUehWlhfJi2Sysz2fInKUXN
	FBvo2BLjRus0MGNAUDz9SWjbM74p92xxNjkFTMK7MPK5HZEvjKWcTPjgN4YwU9rLUP7zWKFpIl72B
	V0IxWTDF9143oaP235cNkuLTPP4QRvqr101QQPA7ok5opIoz5q6hTgJ6DWCLdQ6F6/d/lFz2Xh27U
	p87exv5TjLhLrjH6ojPP4u9AmIWXSBzvBfcm+BLisUIzgT1bhabjN2O6HIFviK+FtEHGj5Nkv4DyU
	V/10YLWDULOad9XpvJBc5IStjMVxGq36COKL4c3pB5KJ024irXD6BWPfmwIuV7C4k2GJpMYxgpfjQ
	/3mm+8MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wylTk-00000000HLp-1DoZ;
	Tue, 25 Aug 2026 07:21:52 +0000
Received: from mail.archlinux.org ([2a01:4f9:c010:3052::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wylT4-00000000HIK-3o8k
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Aug 2026 07:21:51 +0000
Date: Tue, 25 Aug 2026 09:20:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
	s=dkim-rsa; t=1787642460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=tu10D1faxzRZxJdu+Ny2sxBSsQ2jkkXg61KqinheAZU=;
	b=xlVhahTD+EiRw1d7g6h0Zt4KciB2gWrSgAh9Y29s5SdGLkQD8RI6LNAe7uxzcnLPjR/smO
	vQ32ZPcNIfGs5RjMBCX5LqduBPGffDQd43mLpuSjcNeZgjxCVx+jwp28Bi/cAAZbYlDCYx
	bvdaCaWpMs2Nr/bD4CRMbPbFvR2OvvwsrpFE7L4BIl+H+f7bDQf/hx+d72QFmf01sSFxJP
	p20w183SzFiR0xy3VMpPat9B2aXD+0eM9KUurW/dROhpDCrtyU4L5E/bBTj8daYbi+WaWx
	+qlg2INT2GhguBx72pW77UUBg3rR2FUNA8Avb004P2kvJqZuPP21PkfRVPywqQSJenBG6i
	RcGb7IOs63K2R/iCaDg4qhm00nqOwspUqyCZzuftT/BzbtehHOMVP1loj5STVAFmxXRKUF
	DX+X1lDi386ufrHtBeG5DkK1iFaNJddKom6VImW3DbhSmSxokj+XBuI3Ml58bDdNH/gT6X
	KiGC0IIQm6QpEARc77I9vPgu+B4+ufhb1SIRV7Mgfdv82UfgE8yIkuExpUyGxjIkJxlm0D
	T3PsYvgteLlTlMOWogKBjOhHzDzzPDrD0BsJvBm/DtJgW+luBh977mIwtkRAnBKlfJOAW8
	3j9ifnOlycJ6vVfMJxpPj47znfKUg6ELevsoS+Z0LOFumX/eLdwT0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
	s=dkim-ed25519; t=1787642460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=tu10D1faxzRZxJdu+Ny2sxBSsQ2jkkXg61KqinheAZU=;
	b=Z1c4lFKHbLygzzzZiDUQ2DBOg9G4LpdPnGVJW5dZY6FuWXF3iH5wVnQ3MHfu34+ekBWm6W
	LhXD2aVzBlAJl7Dw==
Authentication-Results: mail.archlinux.org;
	auth=pass smtp.auth=dvzrv smtp.mailfrom=dvzrv@archlinux.org
From: David Runge <dvzrv@archlinux.org>
To: linux-mediatek@lists.infradead.org
Subject: Addition of BT_RAM_CODE_MT6639_2_1_hdr.bin to linux-firmware
Message-ID: <ao1CQXyKli3LzxIZ@hmbx>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jAg0QyvNvHar0ybR"
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_002111_545575_11ADB416 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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

--jAg0QyvNvHar0ybR
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 09:20:33 +0200
From: David Runge <dvzrv@archlinux.org>
To: linux-mediatek@lists.infradead.org
Subject: Addition of BT_RAM_CODE_MT6639_2_1_hdr.bin to linux-firmware

Hi all,

sorry for sending this into a larger round.
I don't know whether anyone of you is responsible for specific segments of
mediatek firmware, but you have all contributed firmware to the linux-firmw=
are
project over the last year.

Would it be possible to add the BT_RAM_CODE_MT6639_2_1_hdr.bin firmware blob
to linux-firmware?
A third-party had already attempted to add it [1], but was missing the
permission to do so.

Please note, that without this firmware blob, on machines with relevant
hardware, the firmware loading fails on first boot and on successive boots
stalls the process for around 60s due to USB failures (which is fairly conf=
using
and of course annoying).
Thus, it would be really fantastic, if you could either add this firmware b=
lob
yourself to the linux-firmware repository, or alternatively point me at a p=
ublic
resource I can link to, that allows me to do this myself.

Greetings from Berlin,
David

[1] https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/946

P.S.: This mail has been sent to all contributors of the linux-firmware pro=
ject
with a mediatek.com mail address, that have been active within this year on
2026-08-11.
I am not a subscriber to this mailing list (seem to be unable to sign up, as
the list host redirects to https://lists.openwrt.org/mailman/listinfo), but=
 have
been asked to write here by Mario Limonciello, who maintains the linux-firm=
ware
project.

--=20
https://archlinux.org

--jAg0QyvNvHar0ybR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRizHP4hOUpV7L92IObeih9mi7GCAUCao1CQQAKCRCbeih9mi7G
CEGvAQC8Esykb/C24H6A72N8Yy/M98DFcGgMsmdrtJv4aAVJ4AEAqfyYFcpqt0NT
M9fqASp0yaaDTvsEVCX8VXynngkLewg=
=6s6F
-----END PGP SIGNATURE-----

--jAg0QyvNvHar0ybR--

