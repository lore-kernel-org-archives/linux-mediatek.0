Return-Path: <SRS0=PAw8=BP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20E48C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 16:11:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1EE623433
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 16:10:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O2IBO+Tn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="wdwG1V09"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1EE623433
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m8aL/oY/UZqhgMMGQf0IjtX+nHktg55RPKGEDaDiiYw=; b=O2IBO+TnOd8arE2D5FfP4BFor
	65r0l4Bu29p0d0UowmNrDMHJV40XUpJpJ3+QzFESINEigNXMq4fdroFqJTUQe4cItBjCNep4yO+LQ
	HF9rL/wndNvEOz51/nTPYzUdynRhefyRLg5J35MV9lYHicqf85gqtGJzIEqwiLcagZHBr8HSGNpAF
	mIncFPXloVHMPLDE+yNsE1l/GEngDPAedhurY7gMEpXU0+MPrlAbQxYodg2GjD0gUxg9GzfMdOw50
	cKUkhMwTStSIhRe3UBJ30U6PNrzWKLWP8Qa7Jr3CeERyGwxRVD6hLjDK8xETd3phPS/KWb7SibTWo
	lGuVLEnRg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3M0A-0001rw-JI; Wed, 05 Aug 2020 16:10:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3M05-0001r1-1N; Wed, 05 Aug 2020 16:10:45 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C74F023406;
 Wed,  5 Aug 2020 16:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596643844;
 bh=WhoFOPfHGPgdx+utmWK9QI3Z+xfTMsThhvg3J1Yw9nw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wdwG1V09WOdsUE6fUOwmBTm3Ztbthxnyna80LJ2nU8oSYmnnsN9HK53ujcyTUdZIP
 UpHFogpal+vQnnVRVSjD0cAGqjZwUEIdvKqS1sYm5+Ccp/rbrrnVYjXW9Bt/hyvZID
 DI11Jnc5yLbZxUHesh6tfBZiYksW3oeg8WSocMyI=
Date: Wed, 5 Aug 2020 17:10:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH 9/9] mfd: mt6360: Merge different sub-devices I2C
 read/write
Message-ID: <20200805161021.GK5556@sirena.org.uk>
References: <1596558782-3415-1-git-send-email-gene.chen.richtek@gmail.com>
 <1596558782-3415-11-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1596558782-3415-11-git-send-email-gene.chen.richtek@gmail.com>
X-Cookie: Fast, cheap, good: pick two.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200805_121045_216837_F4522D35 
X-CRM114-Status: GOOD (  10.91  )
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
Cc: gene_chen@richtek.com, rafael@kernel.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 lee.jones@linaro.org, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
Content-Type: multipart/mixed; boundary="===============0970119386169244746=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0970119386169244746==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AYsPlKobQGgtCvjI"
Content-Disposition: inline


--AYsPlKobQGgtCvjI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 05, 2020 at 12:33:02AM +0800, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
>=20
> Remove unuse register definition.
> Merge different sub-devices I2C read/write functions into one Regmap,
> because PMIC and LDO part need CRC bits for access protection.

It's not clear why this isn't just done in the device regmap, there's
exactly one user?

--AYsPlKobQGgtCvjI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8q2ewACgkQJNaLcl1U
h9BJaQf/e0Lbk/kx2bARen+5ThM7i3n9dmDuHvJ9CvSxiUMx6Hru/VTrxy326CeC
1z7UW97+Jia1/NXuz8Er/QmM2b7d9Fj02CYyVnlD0tbGBmrACsvfDzQaZ0hVVgff
pAn0CcJkqK5W264AMpUYoVcJ6Og8TeUxYSQb+xRCzFDdddddQBwn2w9Y8/bO/onm
MC4uxD/rt46rStAwYxri7jd0YInN328wK0MrE7okiQuWXDtybDf4ud2Xdoi/BJ6w
FqmJaKZBSn4MMg6Ese7xewyegU0WcntH9qg08weIh8REtS/Uad0eOfyNnTk1n+Ah
99pBqYSA/cmvSTGHS48yUtSODT34Qg==
=MD5u
-----END PGP SIGNATURE-----

--AYsPlKobQGgtCvjI--


--===============0970119386169244746==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0970119386169244746==--

