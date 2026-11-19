Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC570606A335
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 23:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GnKYs2NX;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AIZt2S04
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Zd5y4/iKVR8cIRL5xSomMHsnhEvzs0tFOB3YXKd6Dto=; b=GnKYs2NX8tNmDw2bwmdtl3sKjx
	8kmGf5XRCN3dgPtZpdwfmiwcygv+fTV5PXwI3CjxhZfoI5rrYykcp6DyAsdULKLy+z/V9dJ9BDz6h
	8xBvDxtMJ92K3/OZadNrOnMY56fX6/SlUMy7p48wxaUs+dhC6EWnmH3t2bgf5nZfj96jQ/35pjiTo
	o1c2s5DFIy9vRTm59kdydjY32727tbu5I9wHAWNmsKnqshjaN7u6fs6nHIgC22TPpu4HaDiYGKJti
	8wrrp4mcsDb/G/2pnUeydxDTwdxfGiz0oyD/uHSG/HkhlFA6GGz5DQ7o+EnUZJ81AwmuA8Owkcc0e
	cW8VN9cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUB9w-0000000DdFH-2kFz;
	Thu, 19 Nov 2026 23:03:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUB9v-0000000DdEx-1ADU;
	Thu, 19 Nov 2026 23:03:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AED1D45DAA;
	Thu, 19 Nov 2026 23:03:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B73B1F000C4;
	Thu, 19 Nov 2026 23:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795129394;
	bh=Zd5y4/iKVR8cIRL5xSomMHsnhEvzs0tFOB3YXKd6Dto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AIZt2S04HsqBdjUj8LQzR5dJNwK1YywkqDmC/aeovDrNCPKjqLA0/uhaIfmPHAaWF
	 eIl20UPXqPNBAE5VSm5VOCae3HAXxDyk0+7WL73MgFETZ6ZjA87bIzgJ9LOGDeetuJ
	 FuAEGRUfBrSxqi83tULgQmNbgPrcBg4rO3m7k6GYSPre9r7j3/oD9Bu+ItyB3vArjP
	 RyxBjsnhY1XoVt72SETxdsXHzsp9YNwLI7L96XtjTLBeFw1AMFuJiKz9z+XIbcWtTw
	 q7IZuA2Ftp8RXrcrxIU8I9lVDN5yDuJ+nnvEZaNDxNOXoXuENnYVwD4phhe/6KAQLc
	 P655iNDbFJOPw==
Date: Thu, 19 Nov 2026 23:03:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/8] regulator: core: Add "enable and wait" functions
Message-ID: <7d52cef3-03ca-481a-a554-3a1002e2b8d7@sirena.org.uk>
References: <20261103043734.2179858-1-wenst@chromium.org>
 <20261103043734.2179858-2-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="guRl6a/jxrclhYOU"
Content-Disposition: inline
In-Reply-To: <20261103043734.2179858-2-wenst@chromium.org>
X-Cookie: HAIR TONICS, please!!
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--guRl6a/jxrclhYOU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 03, 2026 at 12:37:25PM +0800, Chen-Yu Tsai wrote:
> In device power sequencing and initialization use cases, it is common
> for the driver to enable the regulator and then wait for a certain
> period of time to pass before continuing.

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-enable-wait

for you to fetch changes up to 9f9bcca6adc314d35818fc903a2d73898c169062:

  regulator: core: Add "enable and wait" functions (2026-11-07 16:42:09 +0000)

----------------------------------------------------------------
regulator: Add enable and wait functions

Add helpers which smooth and optimise the process of powering on a
regulator then giving the device time to stabalize after it has come up,
taking into account if it was already powered.

----------------------------------------------------------------
Chen-Yu Tsai (1):
      regulator: core: Add "enable and wait" functions

 drivers/regulator/core.c           | 129 ++++++++++++++++++++++++++++++++-----
 include/linux/regulator/consumer.h |  21 ++++--
 include/linux/regulator/driver.h   |   2 +
 rust/helpers/regulator.c           |   5 +-
 rust/kernel/regulator.rs           |   2 +-
 5 files changed, 135 insertions(+), 24 deletions(-)

--guRl6a/jxrclhYOU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr/gCgACgkQJNaLcl1U
h9A1rggAhuZF29Wh+qc2EFGYh5zC2YrRDm05Yr9iUHO8DE2x+DAQLvxONEKLyWKd
hKGejRYBe12LmUet8wpvLHTPZXCrHXmgpK8Q8WzjpsQ4KVbwtechoDUL9uYdOgpq
Cqf4QUpaTYrBN+VIQLC3qBwTkk4PViEkdd+3IP3srRUurwAdLczvWQW1rn+6goXE
/MeZP5Nr0E5gELLlZ72PxJ8GeVKXMCAlh3I61PelsRYl3yZMnBekDyugOf69UO2u
jof5/kkk4xGdHCK342b8idblZ6E6+Fwq8fYX/IxuNzNoGuDgG5rD88EoVJ+cIoeV
dM0dbJKQqVV98NAV6CkLRJTQw7+AWw==
=NHAI
-----END PGP SIGNATURE-----

--guRl6a/jxrclhYOU--

