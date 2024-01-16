Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E218C47077
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jan 2024 15:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jxCyQZwNbDNl0nONyJqst9sda5njmxl8cVr5tAs4E6E=; b=JFuxET2dfarTtyBDJbEct/CE6a
	t+i/lnCLQJtQfp/MuOmNwWkz89n2gxia4iTEvxceHWvtro4Mc6u2RpeEI39YWBqK8thSbvM7wdJmu
	dvvRpdaCgeklL4tUY0cIzl8rjEpNVuGsDpyYc/u8NuS1dmBfK3ligw8vsGKSiCa0blHkc+6rfebSl
	J4LMKGNzRu8eeIwsRZ7YWgBm+z2kemqB2TX6Aw8OFkoUrJZoKt7uD63PSFGT5D/EbTEI+nwwmxgb9
	zfnlbdBg+8ezdtRQzRSwsHrA1ZCtEOUXVvS4Mre5J26fFffDY1UAocIktp7yagVf74C2MChKwYUcc
	SjY17JHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPlZU-00CT7a-0W;
	Tue, 16 Jan 2024 15:41:48 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPlZQ-00CT6i-2l;
	Tue, 16 Jan 2024 15:41:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 3FD7FB80D6C;
	Tue, 16 Jan 2024 15:41:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E09D9C433C7;
	Tue, 16 Jan 2024 15:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705419702;
	bh=jxCyQZwNbDNl0nONyJqst9sda5njmxl8cVr5tAs4E6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dsp2tg04xZe2Jy2dRXcM8+R4ecZ51WGAX+kSDrAtwOBxWt/I9Lx4ltnsdsE0YWvNX
	 hw1chck62SipAPkHdFSufV9TyIcMBHe7mTwXXFdXVYz6I20fKkghQaynL1OOk6tuSd
	 op36QQ84gylzFofdKxjfE6z+w1myyfEMw54TAyuCAtQVR2uRTSUNDdiAxFO2i5ChjE
	 lnG8Odo879NgvHo4ifG4DDEHw0fZl162yVc4RlRz9vApM/iOWJZlxxTAxNECzF/Ipv
	 HUPMerxJQ4MNXnYPlXmMrbqwmc07PsvkhHmVvakoJSDb+3aCqlaFWuGp0zaMKoV8gC
	 u6g1M1M9BiJCQ==
Date: Tue, 16 Jan 2024 15:41:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-spi@vger.kernel.org,
	kernel@pengutronix.de, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 23/33] spi: slave-mt27xx: Follow renaming of SPI "master"
 to "controller"
Message-ID: <9e396453-3979-41bd-bcb3-0a4c2fe3d804@sirena.org.uk>
References: <cover.1705348269.git.u.kleine-koenig@pengutronix.de>
 <ce0557861684ad5b6c51cf8f537c69b5a59947f1.1705348270.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lnhaZFfqnb7DhkjJ"
Content-Disposition: inline
In-Reply-To: <ce0557861684ad5b6c51cf8f537c69b5a59947f1.1705348270.git.u.kleine-koenig@pengutronix.de>
X-Cookie: Programmers do it bit by bit.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_074145_073286_087A1669 
X-CRM114-Status: GOOD (  10.99  )
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


--lnhaZFfqnb7DhkjJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 15, 2024 at 09:13:09PM +0100, Uwe Kleine-K=F6nig wrote:
> In commit 8caab75fd2c2 ("spi: Generalize SPI "master" to "controller"")
> some functions and struct members were renamed. To not break all drivers
> compatibility macros were provided.
>=20
> To be able to remove these compatibility macros push the renaming into
> this driver.

There's obviously a rather large elephant in the room with this one :/

--lnhaZFfqnb7DhkjJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWmo68ACgkQJNaLcl1U
h9D8lwf/ZhQYFD3maLXuFyT7mmGI4bKhBsI2Ql4UpW1PT/I6J1tKGKk/S0oeVCDl
uG32Z9pWSc3IBPBscsn8pbRilVB9bkNuNNaepPUOjOxLVf+ivmT5xA/C2/o+zVCl
eJIY2VTANVTlGi3VI/vq7zdKWrvIxb4edbRxXp4yTsBD5UPVneUoQM+nh5Xne5Bd
bDkvHy2hpGfSfyG9Vh+URa7WOAF56O67k+IImTlCGAK0u0h/qaf5mpkQZbqvwyW2
oBsPHiQ3tdcu+iBRUhcA+U/YjfWIsHUr1xSGrr39R4slchpzd9BszpFU8V9XP/Ep
GUzEaPW8bhWmt+GoQI+1B+jrllxWOA==
=ijMg
-----END PGP SIGNATURE-----

--lnhaZFfqnb7DhkjJ--

