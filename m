Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CBFBC27C5E
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jun 2024 10:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XtJLIL7jPMpbcm9Tef/+8eEhoO8iAr3puk5IcVpVt9I=; b=xMKu5bX9frW9fduWejZnfFv8XC
	4B9xhpyjUu4ESUDJUYt2B2acRS6VYiRVUU6tJekqphaFQSfNDJu5ahQJOmtciKhFjD5gpp/eXwVrQ
	FSAENfVgLD4+px6zxm6GDCmeod0cACs6chGqgnULjD5GGBn/21hocViYmZXG61xSrdpR6ZtFSJ/vT
	2CkHSYQqlQ7osE8RF5oTxik+RTc92OZgFvfIOSwr0V5kixGRjTQOmOhXv2QIEsdeJrRtsK29fDBx2
	g5q8S0nSbOOzYdcnTA5r4NR51xF4c9P9pnItrQ2haq6SKVaDt2VkBKUzlMaOqihD6Eb8SrQQM6Gw4
	MS6CMVzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGyaR-00000008QGM-3y7C;
	Tue, 11 Jun 2024 10:18:43 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGya8-00000008QAy-0CQH;
	Tue, 11 Jun 2024 10:18:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E8C51CE1AA7;
	Tue, 11 Jun 2024 10:18:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE600C2BD10;
	Tue, 11 Jun 2024 10:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718101100;
	bh=XtJLIL7jPMpbcm9Tef/+8eEhoO8iAr3puk5IcVpVt9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ow67sxJ5/f2z53fjdF8sbUz9aNzfy7r0V3x4F2IkNEA9FxfG2I6YOxddj0CrEWB8q
	 aIr8o7oPdXcMLmFf7l6LaYlnmWeD7C8MrGDLY4M0Aa/000N3VAX7c4KAXz792peW2C
	 TuFLr9Vz/5ZBT7Iy6mN1tACvSxp+hhJFU6utVjZKgeDupSOxaq0Bl5tNuHrloZjLKb
	 FnNuPnoHxQMLQusHz2HGgZWOmNyOYnczCtoJ6HNF4N8HBHLSHnwps1r9gBNle546Yl
	 NNfVvRQWx7JiUvJdTzoJxfSHONR/6RJGi1uNJWR+Ta79j37/+tzclYAUmNRaJXHVN5
	 N2+YF1B6acgjw==
Date: Tue, 11 Jun 2024 11:17:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RFT] ASoC: mediatek: mt8183-da7219-max98357: Fix kcontrol
 name collision
Message-ID: <ZmgkRWLmZpGnpv9A@finisterre.sirena.org.uk>
References: <20240531-da7219-v1-1-ac3343f3ae6a@chromium.org>
 <171762153256.557520.12011428649748199502.b4-ty@kernel.org>
 <CAHc4DNJ3q=a8Wts_q12=R34eMbMq+d4PSEFe7YR+DDs=C_Og9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bkH1k6DCw9W/Nv6X"
Content-Disposition: inline
In-Reply-To: <CAHc4DNJ3q=a8Wts_q12=R34eMbMq+d4PSEFe7YR+DDs=C_Og9g@mail.gmail.com>
X-Cookie: Your love life will be... interesting.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_031827_449318_2DD1603D 
X-CRM114-Status: GOOD (  11.44  )
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


--bkH1k6DCw9W/Nv6X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 11, 2024 at 04:02:08PM +0800, Hsin-Te Yuan wrote:

> I accidentally added a Change-Id field in the commit message. Can you
> help remove it before sending it to Linus?

Sorry, there's other commits on top of it now - one commit ID won't do
any harm, it'll be fine.

--bkH1k6DCw9W/Nv6X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZoJEEACgkQJNaLcl1U
h9Ci4gf/d/71SbUXpDvPRJoSpeImEZWIPsiA8SA2T5BH5zAUcOop4zMzkVAS9auB
AU1R6pD56doyzyk70uaz9A2esxyo0UxEM806duF97+XI40l5cNBEVEYzKIzQNN2C
e8wgdlu0DhOG611zGRq9YKhd9b4E2DKMnXDvpnM6iL18J1w2sc8DxYFj0t8zWUwY
niVYdugY2ys8IyxX6mMEHVbp9m7OrtXjx7Jmzo62lWQUybJ/A6zKGoEzxclgLK5i
nKA3a2toztPt2a4jTNHL9KdVdkk1AZwc0/15MyR8gsRveGNlr9bEaSDtjhCZ3mDp
GNf8YUONs+MTlBtCtRyRrjXK/C8oPg==
=uH5n
-----END PGP SIGNATURE-----

--bkH1k6DCw9W/Nv6X--

