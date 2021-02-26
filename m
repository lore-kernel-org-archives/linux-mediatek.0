Return-Path: <SRS0=c7Bv=H4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B3BC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 17:08:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FAEC64F21
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 17:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FAEC64F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C/BuIzAdLbqa0stX3xuif7q9LSKnpSbutXbFDo/wzMY=; b=2iLPbrGINLQ7tiqqchMKTzrmm
	8PFRF/+8AyQlKZFPaBsbTl7urqOVQxvIFPFjcyZPfednelY9jroAal92iJqAHAOb4bVvkbbyCJ4hT
	j8MGXdsjX+YbvkcEtVWxPGJeQDp0fLbD9AcR7zeGembCG1IUKVoW2zyifIRC0INKaM1k4EqyfjROu
	U4MZA7Mdqh6zHh2Zx71k88yITg+kAvALmqe3Kvo0rr6yVvg3dpl7xH/8T1s1ur/uZO+uV8fmivAlS
	B0j6AKkJg+Vc6p1kzDlLudSISiK/WTy3NArPDEyuB92aT7v67kjclz/13qe5q1JWduACwrNGugwdy
	DyBpDb9ew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFgbB-0006ig-D7; Fri, 26 Feb 2021 17:08:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFgb6-0006i3-Sv; Fri, 26 Feb 2021 17:08:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 87A9C64DDA;
 Fri, 26 Feb 2021 17:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614359290;
 bh=O7HQZaD+330mzCO72LvNyaWULgPRvPutDbGS6HTDi4Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t/Tq2XjC4GHqIBFAvBbQKGSctV/+GN7gQISbg3f7dNKisJWTgKA6o5yx0ysLHZskq
 VMg16aEFaK9F0Os7j+80soT7H4PEo24Mi4dP9ds+1bRc8SR030Lz7xSFOOJPYIZbT3
 QY853T2SI79jO+OcEDYJe/FIN5eUD8V1aBWOI1aVeFxYKej+Pj4kbH8tP1hv2LUThr
 ic98vMloG/nvq4fu/whZz8qNS2pUEBURo5Gl4bdQmO6nsuUm1SHG+zpXmfj+7eMeV6
 3jZYOdp++xNDFtNKJ8SCYRLWhuy/UITR6CWq8T9pWRSe6hqRq/BMNUHo3G3oSRcmp/
 Swa10RkZAsyIQ==
Date: Fri, 26 Feb 2021 17:07:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Mason Zhang <Mason.Zhang@mediatek.com>
Subject: Re: [PATCH 2/2] dt-binding: mediatek: mt6779: update spi document
Message-ID: <20210226170705.GB4518@sirena.org.uk>
References: <20210226110109.30500-1-Mason.Zhang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20210226110109.30500-1-Mason.Zhang@mediatek.com>
X-Cookie: Academicians care, that's who.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_120813_022188_AA2B1287 
X-CRM114-Status: UNSURE (   8.83  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 hanks.chen@mediateka.com, linux-kernel@vger.kernel.org,
 "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0152474820884376265=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0152474820884376265==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uZ3hkaAS1mZxFaxD"
Content-Disposition: inline


--uZ3hkaAS1mZxFaxD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 26, 2021 at 07:01:10PM +0800, Mason Zhang wrote:
> this patch update spi document for MT6779 SOC.

I'm missing patch 1/2 here, what's the story with dependencies?

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--uZ3hkaAS1mZxFaxD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA5KrkACgkQJNaLcl1U
h9CUygf+Ol0aJAihbCGE4oreYTsWpzbY2iMN3VMLFlwwYf7pwZ4PqvUMUh+VjlSU
kQ1lQGpmLumnZzLXu7ubr37mjzgeKZxEkOOPKr+phghVkj4I47uLh0v86bTJqc+X
XPA0yyFZSc/qgxFe6pqUntdP+Y0lG+AP9yK1TloS+XjA9Mm/GwF3tcJU9w7XPsHv
aoiTM1BT6fL8mS0eap09NtNSS3f8N+4F3ZHsbMgLruO8FdCwYIUrYTdLr5nku9ye
mR/4uyMBPFOD6PjiKcQzkr0Idqk3RTG4LgHXNLkdqubZy5X+gfStD2wI8P/VvgoE
TWm+JacwdHBtb1LfITBgCMs4scS8iQ==
=YVpM
-----END PGP SIGNATURE-----

--uZ3hkaAS1mZxFaxD--


--===============0152474820884376265==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0152474820884376265==--

