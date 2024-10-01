Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCD9CE837A
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 13:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W8ghwVwmar4eOYUmX5B9j0WuQw2VG2mdttchaRv44xU=; b=nMCxk45lqgE+ukA+FPOeaHkd+Q
	+3ZrbPpODWr0YQYvn2htH8pSvU03HFTnFEC35MUUXVsuMt7JKU0GvjCjrY6fo03p/EwAM87jGK1b3
	9LbowrYPILiSaSt9rmPs/fAwrEK1/OhB2Jc8fvkGq/Y1pWOdp1xzL9kXo5emFBYt6JjLlNihLDSfe
	WVi5HMtJexMEhHqfc9tDjvi1R3Pl1NWbOXjS5PtgNWeKegkuc0uyDpqzwbCeVkqWzwQ4y3gU0WLy+
	jK3uiZkzoBnW3I87RZbp8jfzyr3RhisbdU6YoOVXAO7Pphvn63HD/Ibif2X08YKNKeSEh4wPBP9eh
	liDq151A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svcgm-00000002sCH-109V;
	Tue, 01 Oct 2024 13:13:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svcgj-00000002sBt-3aS9
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Oct 2024 13:13:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BBFAFA43239;
	Tue,  1 Oct 2024 13:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7127BC4CEC6;
	Tue,  1 Oct 2024 13:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727788392;
	bh=W8ghwVwmar4eOYUmX5B9j0WuQw2VG2mdttchaRv44xU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PxpYomJtpwFkooPJYd7Fo0Lp9iPFH52dAgKNq9dZqG1cZA0yozuf8Oo4dWMVVF15V
	 ytb/19KCDZtrHFJjKlJh+nh1YtMcn6r/nYKOmJoS1ZH4BvaElLf8smTA776xMwUYtr
	 91iAcC9xzSmpaU6NBF06Dc6/fm8HOdzlP1ikx7Ra8H5jGT6Yc1gwrkJpg+wyI8XlHh
	 9T0LyCcpgY3Bkq9ubCbehhT1eZbv328o9VJc9W0yeJXCaG9pkhkSYlIOqcTS7lJHa8
	 wMJS1zh0N0SibhckRZY+NrOgOwIpTfWUrUabQET2kdcrmvuApxAxXPKk72zMI/Aq84
	 vQDiwb2Ay06yw==
Date: Tue, 1 Oct 2024 14:13:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] Input: elan_i2c - Wait for initialization after enabling
 regulator supply
Message-ID: <6626b1f3-7c3a-4531-b006-9e29155025f0@sirena.org.uk>
References: <20241001093815.2481899-1-wenst@chromium.org>
 <ZvvHdlD6E5bzsWwV@google.com>
 <ZvvX5KcKaVBLedD1@finisterre.sirena.org.uk>
 <ZvvyEux8f2ylRQOn@google.com>
 <7db1299f-f925-4689-806f-f1ea4191fd4c@sirena.org.uk>
 <Zvv1FuXBZpjDefb8@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h3gsj/MN+E0Fcf3v"
Content-Disposition: inline
In-Reply-To: <Zvv1FuXBZpjDefb8@google.com>
X-Cookie: Even a hawk is an eagle among crows.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_061313_980533_67B2D85A 
X-CRM114-Status: GOOD (  12.49  )
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


--h3gsj/MN+E0Fcf3v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 01, 2024 at 06:11:50AM -0700, Dmitry Torokhov wrote:
> On Tue, Oct 01, 2024 at 02:06:19PM +0100, Mark Brown wrote:

> > Yeah, but that's got to get washed through the individual system
> > firmwares to get deployed and my confidence in vendors is not high.

> I think native Elan is only used in Chromebooks where firmware is
> decent, the rest are I2C-HID.

Ah, OK - in that case I agree there should be no problems with ACPI.

--h3gsj/MN+E0Fcf3v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmb79WQACgkQJNaLcl1U
h9C0gAf/UvWgb06F4oVn6jHF+ko908f4HFveFOTbNiT6raI8r4DoVrYGq9fTi17E
ukCv2sW9PCBsw8jRiKgKMnCagMiBcPV1gbJbKqv3k48LMGp7pRK7st4IVApVaW8G
kK7HoOjYCKRtH/MRujrUrEXLUD2UM1AH2pP0ZmDki3nKe31iKCgZA+0A4vbiFV3h
SWjX0oT9cLS+wN0jrZ29bZ33UfTMNBoZPSJS1f2pURn331VLiHslp8FvRhThRB7A
rp/18eqr0fclvuxaCxI6LFwjpd2h3HppbrrrSj+bDgwNvP7uul6py40MPjwjriMT
jSPXKK09gDwGMau1Ya3ErIslX4NofA==
=n6ix
-----END PGP SIGNATURE-----

--h3gsj/MN+E0Fcf3v--

