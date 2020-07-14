Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3806CC433E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 19:20:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDB7E2255F
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 19:20:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LeUv1Bgr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nZ51r8Iq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDB7E2255F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fKD4dN1Oq3ScbYiDhrrIOlMD4em9Tg2gmCOr2ecwIj8=; b=LeUv1BgrG3hra3CqxysUQtDYc
	6Cz2oUtHwfRQQRUKOupHMG7utBgn7PkjmWZrrOO175vVi3Nu57IXkDwn1Ga04Q8TNqtc3DAQ4zNmk
	pgJg/I2iV00xfNV+hlHZYLq2rP7tetGgw3p+JbH1edmFCFnDmeOJij8QVrjAAHNQ/oQb/xE24i9eq
	OoyYpAanPHZpY57TS7tdRDMU+JBl0RxinBQWLfoXjKFTl1ve/95IgENbVjEJpWm85S7NGBUdhI0Gx
	JIJp26DzgQROWFpJ54JPtMrdDCJgp4imBHLLtSvR4EDPbgdq2g7zlDEWOlLuq1oD8fNES+3QLCyo+
	YG71a//yg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvQTA-0001xp-TW; Tue, 14 Jul 2020 19:20:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvQT7-0001wx-EA; Tue, 14 Jul 2020 19:19:58 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 164902255F;
 Tue, 14 Jul 2020 19:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594754396;
 bh=pdt+ZEgfcDRHiUJp80sY+Xk7V9Swgajn9kAukK7kVoA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nZ51r8Iqlc54vZBYnsf0GzJRD/OcPD+7owGHrdIuH29eXK0ZbmN1wo77NO0QOdTtC
 8OaMdI9+n0ZXkHcNykgmpmRdZOYF2sHbjijkAUMgCqEtV1EIzgsjCdaefnN7XGJWdJ
 DvS357O/aozzO/GnIN4UXDV2fcezXUuzGOPeSInU=
Date: Tue, 14 Jul 2020 20:19:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v10 00/17] mtd: spi-nor: add xSPI Octal DTR support
Message-ID: <20200714191947.GI4900@sirena.org.uk>
References: <20200623183030.26591-1-p.yadav@ti.com>
 <e6d4c015-b70f-40e3-2275-89d245e817e8@microchip.com>
MIME-Version: 1.0
In-Reply-To: <e6d4c015-b70f-40e3-2275-89d245e817e8@microchip.com>
X-Cookie: Your password is pitifully obvious.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_151957_631661_2EC84265 
X-CRM114-Status: GOOD (  13.30  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: alexandre.belloni@bootlin.com, michal.simek@xilinx.com, vigneshr@ti.com,
 richard@nod.at, nsekhar@ti.com, Nicolas.Ferre@microchip.com,
 linux-spi@vger.kernel.org, Ludovic.Desroches@microchip.com,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, miquel.raynal@bootlin.com,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, p.yadav@ti.com,
 linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============4379785553786853290=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4379785553786853290==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nEsDIrWrg+hrB7l1"
Content-Disposition: inline


--nEsDIrWrg+hrB7l1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 13, 2020 at 06:34:12AM +0000, Tudor.Ambarus@microchip.com wrote:

> These four patches are looking good, I had just few minor comments.
> If you too think that they are ok, would you take them through the
> SPI tree? If so, I would need an immutable tag on top of v5.8-rc1
> preferably, so I can merge them back to SPI NOR and continue the
> development on top of them.

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git tags/spi-mem-dtr

for you to fetch changes up to 4728f073bfc66b8b555274ef0d7741d7f5a48947:

  spi: spi-mtk-nor: reject DTR ops (2020-07-14 17:29:40 +0100)

----------------------------------------------------------------
spi: Support for DTR ops

----------------------------------------------------------------
Pratyush Yadav (4):
      spi: spi-mem: allow specifying whether an op is DTR or not
      spi: spi-mem: allow specifying a command's extension
      spi: atmel-quadspi: reject DTR ops
      spi: spi-mtk-nor: reject DTR ops

 drivers/spi/atmel-quadspi.c |  6 ++++++
 drivers/spi/spi-mem.c       | 16 ++++++++++------
 drivers/spi/spi-mtk-nor.c   | 10 ++++++++--
 drivers/spi/spi-mxic.c      |  3 ++-
 drivers/spi/spi-zynq-qspi.c | 11 ++++++-----
 include/linux/spi/spi-mem.h | 14 +++++++++++++-
 6 files changed, 45 insertions(+), 15 deletions(-)

--nEsDIrWrg+hrB7l1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8OBVIACgkQJNaLcl1U
h9Bhygf9H+xpfxdxH22PtaRszzUoz4qNi2lr2fwNL/Z5+6EnJ6gCQCiu1AjHVWsc
o0MZPls5hAEkyvp0c+Nu6z/NXHK0HIN6KuQxPbGvGCQFPuD981uFwbKlLV1hZqbG
mQDJjTyRB9TMpBEYvUNxRpNPk+QLY0XMz1H5D0/YkRXS+TzuFtqggvLmLuaI7uri
rurYlk8YAf4YZHjVRQoKu+vX+UbSSErglMvy6lDYTKN3d54vzt6iLsusghfv/G93
t8CkM3J8QCRk1o71zrxtRBeol3xkYWKowJV1kSx3zHxyQCCzcbHcWab2QLt/qSK9
FtqJVxO5UeujOgLPZXygGjBYygkqTw==
=fMw1
-----END PGP SIGNATURE-----

--nEsDIrWrg+hrB7l1--


--===============4379785553786853290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4379785553786853290==--

