Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65993ECAAD5
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 10:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CQFx9BBIPV7rdst2Un3d9cttBBfsNAdm1vSROFPyvS8=; b=M8hXqRDnW2XehFCMdutwfQF704
	36BAbq6IGH87mvq8GaYBkqAz7sXhtmBkXomGeyqDasQO1Pp0WAQPoMDIm2zmdIu2ixVd9qzP/UY2C
	1hkAiQv3/082cfrrrkbGiD5WF/HELwqbPKZHmOmkHvhrpFU1dD1+EGZmtZmb2fDQvA0sySSh2LCYP
	3hjJmKSX68cFdfZpRl95UdVLjUMsDDJuBNrDNBGmvAEJGg8RkRBhfEZRGOQlp4WjUYVm9JY7a7BPs
	xS1OMyRKQTpSQbXbc13APG1pq2fA6RKvFHum1j25287iW9YEwv+do8UYc16eQ4vkWwavtlft0XJUE
	6IZNCbuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU3mI-003Gdg-V9; Fri, 02 Sep 2022 10:19:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU3m6-003GQ0-2G; Fri, 02 Sep 2022 10:19:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 66F0B61A14;
	Fri,  2 Sep 2022 10:19:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE557C433C1;
	Fri,  2 Sep 2022 10:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662113984;
	bh=CQFx9BBIPV7rdst2Un3d9cttBBfsNAdm1vSROFPyvS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Af1FAASI/LcZV3vInAumEI3Ik4yHBJdqHINEcBAVU3Rk3bK+6Yi0dEhhDNXTLh9Yt
	 oyH0YoYmxz2+Qo8yEEeeD3SIOUGi7KpqWLaDObeKUu5sCfsEGRswNuNZeLVn7X4z1c
	 yViv5D5x8PKeeAZY6kAw4dEVkwaRe/bPopwcO9TFCPpusAy2YwVr0UYoz0I1W7UhUj
	 qhbxO9wnqIqoZ4JYv+3QBn/0WsnWFtiiv3YBDw3cJnARowVQSgTgR6cyww/8UUqOvY
	 nbX8d/iSAhiqOgT0dwgV0QNEfiEavxzE/T267GI+0CkDrR126t/DKzkKSbqtAzwzRn
	 IjkqJIeAeOVMQ==
Date: Fri, 2 Sep 2022 11:19:38 +0100
From: Mark Brown <broonie@kernel.org>
To: "chunxu.li" <chunxu.li@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
	sound-open-firmware@alsa-project.org, tinghan.shen@mediatek.com,
	linux-mediatek@lists.infradead.org,
	project_global_chrome_upstream_group@mediatek.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	yc.hung@mediatek.com, pierre-louis.bossart@linux.intel.com,
	peter.ujfalusi@linux.intel.com, daniel.baluta@nxp.com,
	angelogioacchino.delregno@collabora.com, lgirdwood@gmail.com
Subject: Re: [PATCH v2 0/2] Introduce sof_of_machine_select
Message-ID: <YxHYusRPbwO2ZcAt@sirena.org.uk>
References: <20220805070449.6611-1-chunxu.li@mediatek.com>
 <166128061023.1031684.5884182401063110421.b4-ty@kernel.org>
 <9b3d787387685f2153fe7c99b77a8b8b482f8954.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U0OKg5qn858JZiGC"
Content-Disposition: inline
In-Reply-To: <9b3d787387685f2153fe7c99b77a8b8b482f8954.camel@mediatek.com>
X-Cookie: I doubt, therefore I might be.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_031946_175333_9285791D 
X-CRM114-Status: GOOD (  17.54  )
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


--U0OKg5qn858JZiGC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 02, 2022 at 11:57:51AM +0800, chunxu.li wrote:
> On Tue, 2022-08-23 at 19:50 +0100, Mark Brown wrote:

> > If any updates are required or you are submitting further changes
> > they
> > should be sent as incremental updates against current git, existing
> > patches will not be replaced.

> It looks like the patch didn't applied success.

> The patch link is=20
> https://patchwork.kernel.org/project/alsa-devel/patch/20220805070449.6611=
-2-chunxu.li@mediatek.com/

> the merged link is=20
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/=
?id=3D6ace85b9838dc0162b474dbbbb6b388e7561f6a7

As covered above please send incremental patches fixing any issues.

--U0OKg5qn858JZiGC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMR2LkACgkQJNaLcl1U
h9Ay6Qf9H/ErQa/tLh9xUc0xSn/fYKkv8V8kj14lZGVScxHAlQKI4cFqYZ/dRVIH
/QTdDm4kJ/W9ObW78riLSTYjbYeWHBjcBTsiYjOdFURI7LV5qjCl769st4JkYLpB
au8x+0B8e/Sv4BLY64KeRBsaQ22JwVrZT6wf9L4WhTwwDA/QpKSLR9nMsB2pwc26
TGe2wjhXZeu7b9d16wQLQZWZJ2uv0CjWgzcvuloIfTmsG16M5vf9AjCvjjVQ2Si+
fRNS59ViX8C5SYuY11b55QGMti1+iA0R73lt7tnqeqgKg23pDheUvo2Q4jNx3Lrz
ZGvqUaJwA69z7a5nAj5Fg2KC0i8btA==
=/dmj
-----END PGP SIGNATURE-----

--U0OKg5qn858JZiGC--

