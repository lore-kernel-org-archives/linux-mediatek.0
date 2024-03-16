Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733A9C54E58
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Mar 2024 01:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/2mV4x22F/QVgIh76C3BMbNB2KLcrxBXoWVMuW7h7mg=; b=30C1o9EYbk7Og1IbtzRJtASjXZ
	NdK/sCcjv8/HNFjCHJl2dS9vOknZMWfbm7HGtnIncC0H1/uxKfPeiaikg7eUQv/hbeRjlldQ0CcQN
	bWGu1a5YiujOS4POohL4z9HtHNbv1931zngaqoca2U0fSVPkMQz0e9neb6dBno5XnTELpZ6zMfktP
	fDee9MCB6cR2wfIv8SFde3OfrUy+aWAbuw3JpYbd97Qtv58OkYvjh3z18x249ejHvedGc20574k/h
	lZqSaby5Fq7lsJK4364O+iGanf1dAlo8vasHWC2VPn6qqCPoFS2OuP09VO+PUtkWIR/7n+0z3F2xX
	Xh7Sk/Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlIa0-000000021nQ-1mvU;
	Sat, 16 Mar 2024 01:11:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlIZv-000000021mL-2ly6;
	Sat, 16 Mar 2024 01:11:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 840F161826;
	Sat, 16 Mar 2024 01:11:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F49CC43390;
	Sat, 16 Mar 2024 01:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710551474;
	bh=/2mV4x22F/QVgIh76C3BMbNB2KLcrxBXoWVMuW7h7mg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VyOJbXVj8BQowIBfk7EMLO87izqo47PBgcN7S2u76zsD+gwyLmpIOEQHH8p/LCtub
	 w4mS7gFbhyVIJEh+i4eV2kqfFm93ipbOPmzBqCNjDCWFw9GES06tF4HrO6lkOgwcDz
	 OJiCDHJEoD0U/No4D1VlSZ7y4bf2/Hj9YjgDYAlTWsTlMvlcWba/H4hNGDeAW67FYR
	 7IaufWPMPM6gdP2flaw3iSA9sx5xvRTxaawqXWoENgXVvYis3gnB5wObVV5J/QqLHH
	 2ISa5M0hntATc02lNQ+05IjfhOX/9HJ1x0vz3NT/nkUuR41WKCKGqsRUeR3m6uqxhu
	 UdWcb+baTEpbw==
Date: Sat, 16 Mar 2024 01:11:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Justin Swartz <justin.swartz@risingedge.co.za>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] spi: mt7621: allow GPIO chip select lines
Message-ID: <81c2c997-52f8-48a6-ace5-1bf503462f25@sirena.org.uk>
References: <20240316005917.20526-1-justin.swartz@risingedge.co.za>
 <182aa3a1fcd05a2e25b55442f58ced5b@risingedge.co.za>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0+AF4gs/20AJKM5f"
Content-Disposition: inline
In-Reply-To: <182aa3a1fcd05a2e25b55442f58ced5b@risingedge.co.za>
X-Cookie: A well-known friend is a treasure.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_181115_903379_A9561DEE 
X-CRM114-Status: GOOD (  11.39  )
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


--0+AF4gs/20AJKM5f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Mar 16, 2024 at 03:01:02AM +0200, Justin Swartz wrote:

> Please ignore this patch. It was accidentally sent without
> "v2" nor --in-reply-to=...

The --in-reply-to should be avoided:

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

--0+AF4gs/20AJKM5f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmX08awACgkQJNaLcl1U
h9CI0wf7BetQ9uuB98Mxk6JweW8nndlgvuseO/vOtdWIr+mUTeIaAAVdgh4NgVs/
sDcjKdJAs3FFmRqfXcaS7DT2Ycg8S+NPw1NBJ9fEpPcirFUwP5kao4QZXziSBEdv
nvhZKZWWjWN9Y3iJF0zBDrd6V36xOaZdl3eOXRwgFKOOOpffVeb1sHVDHs2832jw
CNvukno+dvaW5q9zNfp6l+oLPsPgzuhZnDfcytvdpm2SqGw2ACqK2w+eFfKyOJfu
e8T+wKmdM84+PKWu/Fxp4IEj21RBxCb+AF4HJqeLYek7KkBAjg4ibhDwBBHSExpf
VjbAOlXUKXULbiOShjlGEWrigaeQ+A==
=0jKr
-----END PGP SIGNATURE-----

--0+AF4gs/20AJKM5f--

