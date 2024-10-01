Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A753CE837A
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 13:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LP6ELGazWyBxjIxYddUey6rEw0LS6Z2m0BpeY7Wqbxc=; b=bycqCL3gGlvQkJhofcYMuP0AWt
	4PP2LyVXWeT6cOusMVHu1hJbhoPf1GuOJTi1OY6dSmSpOlerbg2rYlVLIclheREpnC+sceVdDYyOK
	LG1hc+gASghAHEGSPlMYnUQhSWpv8q5pug8AC5Xx9r9mLI1G1g0o0pJeQqDHBPKFS8iIbq0qUZxIO
	ilGtpwbyjvR+cCMTvcfRr0aYcf4GH7EZJlG1jcSplzJ9eDKDGhy7U1xHzSWyk0BFA2qpCPIZT9AK8
	54B2958uDPm8pB4UV0gpvAn6kEm3sMhy8NiyPYR0PKfuX/LRcY42x9Mk3bKiPLNeddXh7w/twIgRk
	f+nqkM7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svcaM-00000002rd9-3cmw;
	Tue, 01 Oct 2024 13:06:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svca8-00000002rZj-2tD4
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Oct 2024 13:06:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C47985C542A;
	Tue,  1 Oct 2024 13:06:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 354A0C4CEC6;
	Tue,  1 Oct 2024 13:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727787983;
	bh=cFOTlNXs9lvP/XXg2/XHyR4LIBvLe3YCumZ4xkyzg6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qDh1XgYuwiZxQx/AJCeypD0C93AMDEUh87R4p9LcQ3eqNcvzurmHFyMUjKwkrh3RW
	 DwiDtWa3j1UsZL6gLI9T6GBThbrVnZdYFME2t9rEd0Sf6ZP9p8GS43TWdkDPFFqGjg
	 G9fHX11SHBUrOXWnxyyQD63aqR8DHdWIQq4jhu3sjnPs7fu35uzGxBM1xqZjwCNy+e
	 H0WbWZuoUFaxOeVUF+mtXBdmNLjhM2At92X0YCHJEKme50cmv0PJ0mqBzhYVaOjMrR
	 h6LVUXQCTGn2fGGlmsqYSHIY1dKadkdXSNF8RtU0DsDk3f8Z0zQZbUL82KfTcfSVXK
	 6/F/F+trOs+VA==
Date: Tue, 1 Oct 2024 14:06:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] Input: elan_i2c - Wait for initialization after enabling
 regulator supply
Message-ID: <7db1299f-f925-4689-806f-f1ea4191fd4c@sirena.org.uk>
References: <20241001093815.2481899-1-wenst@chromium.org>
 <ZvvHdlD6E5bzsWwV@google.com>
 <ZvvX5KcKaVBLedD1@finisterre.sirena.org.uk>
 <ZvvyEux8f2ylRQOn@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9FG04CYkkI4pyKXe"
Content-Disposition: inline
In-Reply-To: <ZvvyEux8f2ylRQOn@google.com>
X-Cookie: Even a hawk is an eagle among crows.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_060624_790591_6293204D 
X-CRM114-Status: GOOD (  14.18  )
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


--9FG04CYkkI4pyKXe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 01, 2024 at 05:58:58AM -0700, Dmitry Torokhov wrote:
> On Tue, Oct 01, 2024 at 12:07:16PM +0100, Mark Brown wrote:

> > availalbe when a regulator is turned on?  There's also no difference
> > between DT and ACPI systems here, both could have the regulator fixed on
> > and I'd certainly not want to rely on an ACPI system implementing a
> > device specific delay after power on given the sort of stuff they like
> > to put into machine specific drivers.

> Well with Elan in native mode ACPI FW does do proper power sequencing,
> that is why this commit mentions failures observed on Mediatek devices.

Yeah, but that's got to get washed through the individual system
firmwares to get deployed and my confidence in vendors is not high.

--9FG04CYkkI4pyKXe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmb788oACgkQJNaLcl1U
h9Brogf/TJNU2WRZY2mkqAck0/ybRptVqwd2DVZdO6y6WsZB4PZsj1lwGL5WY2/j
7xotH4A4gcYmQXH9uBO/tWkVR7XSQev8e8/8ZTUiqhvPwrE8s3UEs8mA7IIiHTsL
GLPCNqN2b0UZbJ6n4L8s6YpZ9/nmh/mmYIKHgVHouVjYIU6IzcpPVJBNENmQ9clK
VLajmL2IVHsFYFez27PdQdSjvvO8wW5Q6a7EVQDfHb9zvSzz+SrXbnIqFtzgsfW1
DwWlM1rD/F3k4hhHofiUMph/xE+jvrRQZTeFeDZD5WdEx2EiHnj71OKR/SEEgNRJ
VZhln3AkvKTHzHpEfupY+2qYpmLJ+Q==
=ZiUy
-----END PGP SIGNATURE-----

--9FG04CYkkI4pyKXe--

