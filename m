Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC20CC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 12:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5r8wCdTPMGwl15eR6oMTE8q0lw8uDAgdl7uJ5qC7aLc=; b=JoSFCmsLv726vGlpWu7VkHh6EG
	4Z/NenFEsS7FyPTjvPmMvdXL3iNch6ci6zRZRL77r1UNNGwLywfwY6XWN5fQbFQupVs0tOtS0cKxn
	BEi5pDcRjIX1bEb/k8dwaUpaSdDZnM6ribF3rw2nvZMZQzZTgp/Uso0grkpmlINcdZqZoDZFJcC9t
	8mgkTWnoUeffLVwSwqghrd6t83gRK2fjEAxWBt2rouUAiOptBQTOfjMc/08NuhpbYh9MgCC/rM5LC
	VgPkxXDeu+2nHNDiamceMdlNLJ3RggzV7f/H56e9qJDexmUq2FUGHSDIgpsvLeeEE5wf3sUxnBUzn
	vxbSYr+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRZHG-004P6k-R0; Tue, 08 Mar 2022 12:49:22 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRZH4-004P4M-Ca; Tue, 08 Mar 2022 12:49:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 11091B818B2;
 Tue,  8 Mar 2022 12:49:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0917C340EB;
 Tue,  8 Mar 2022 12:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646743747;
 bh=2uWXtW9QT2635460+Dinu7D098A/hUaWfqozGWkV7w8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KeO8tTIKHAtU2R13GSd/FvDMehJL18154CQO3JCqCvkQPQ8n+B0lvR3IxQZfSA0Lu
 1vjB9ymejx/bqO/0VJFtuKj01n/Cwapbs7aDf3gGJCVeHyrzgLP8HFt7/2YHbyeG0E
 4Ex8BOUGPcKuvUZsrre0k10LjzN2vZde+/5C98q3rUH8ckjNoXwKp7Xy0KTpRexAYB
 1RiMF7TKeFnJjyGZfCBiIfSuVpJmTalnoVOvCTKaQ6gAcue/mZHzLapOTDqswPlYjf
 lbu6mMYFvC2PQH+fKalcdrV61NatbFaQvawOwjFk1ZWoKwE8YzQ+7TearH3RjpLYlv
 F8792+X1779cg==
Date: Tue, 8 Mar 2022 12:49:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: Johnson Wang <johnson.wang@mediatek.com>, robh+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [GIT PULL - FAO MARK BROWN]: Immutable branch for MediaTek
 MT6366 due for the v5.18 merge window
Message-ID: <YidQvkIYsacSPsXv@sirena.org.uk>
References: <20220106065407.16036-1-johnson.wang@mediatek.com>
 <YicTu6FwOR7zIC6I@google.com>
MIME-Version: 1.0
In-Reply-To: <YicTu6FwOR7zIC6I@google.com>
X-Cookie: Dental health is next to mental health.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_044910_589854_0F108E83 
X-CRM114-Status: GOOD (  14.41  )
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
Content-Type: multipart/mixed; boundary="===============3152415538822928233=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3152415538822928233==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QE9JO7JgZCx+voQy"
Content-Disposition: inline


--QE9JO7JgZCx+voQy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 08, 2022 at 08:28:43AM +0000, Lee Jones wrote:
> Mark,
>=20
> This one is just for you, so you can merge the other patches.

I don't know what the other patches you're referring to here are,
someone's going to need to resend them.

I'm also not sure things like like "FAO MARK BROWN" in the subject line
of the e-mail, I can already see if a message has been sent to me from
the To and it means less of the actual subject is wrapped out of sight
in my inbox.

--QE9JO7JgZCx+voQy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmInUL0ACgkQJNaLcl1U
h9C/Qgf/WnaMYcqzKVQ8vePGa5v2ViuhDUssLXOHgpAuydZbERN+Gwrs4SHm1O9w
xgvNZuX7aZ1BAOn0IsMmhyNdj+18fvA3kvuX33MQcwi4gpg/WyQU5n0Ff4YmgaFu
MZe4Lqt0ZVAxsWccgFXjkBvrObZQwK+GB28brmPBgnteeJj/ZnAY6w7C53pTBJwm
SpxCdc20Nz5QP/Mfvfqos766weCM3ptP8dxGJzn5Cinb2Wi+ZXchoB6PU32L+lzX
FYOxFT8z3NaKPsqhFfIS9nvo+zwzhI0GJ3Cb5Oy2Cu4S5t3kcfb/3qplEJPk6hvT
YOHPeANMYG38LxYZf84nAJqKHEXoDQ==
=IkM/
-----END PGP SIGNATURE-----

--QE9JO7JgZCx+voQy--


--===============3152415538822928233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3152415538822928233==--

