Return-Path: <SRS0=ikIt=NE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB881C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 15:59:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BAA660EE0
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 15:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9BAA660EE0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mySaKVZoTsf06kE/5Clr/jj3T81zEviXfCFm+xt/AY0=; b=zp+nDMbO1LB+0WSuapRWaITEfP
	1miBGdgpHajpJFdV6AsYtFtA88J4jQVuyUmsNbMgVx/rb39gVgdJTE1l9I/oq1YdIDQXxoqmcDevd
	1NU0vewu9EWzVYmNH82p5GRUL7OT1WW/HL5BIqTwAIZRSF0Puf877+rt7uNuHiUl4pDe/RwFDx1iM
	fNJTbM6SBO8jmVWmrtgExiJPj639fEf9e2/ZQYWG6j2lDadclHBbPjzhg5CVS25IF1nMFt0acJ5Si
	DhmJzKzaRxiTe29a13ouhJzzFjqzMJ959zq1s/wjgkDLvArChSQASGSZ5sG7WRUY+ki4JPNokrxSK
	KfW0ZCYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEZaq-00D2J2-VS; Fri, 13 Aug 2021 15:59:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEZab-00D2EO-FK; Fri, 13 Aug 2021 15:59:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8A75261038;
 Fri, 13 Aug 2021 15:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628870359;
 bh=mmIVKecooge/8bcS9f0J7os6PhKUAnx5VYDKl8xDsBk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h0UeKtiuCmF7ZbGSAr0SIZuSsu5fpSiZqBAlXQ+aTihpG1KFZdVf83yzaeFv7bEg1
 1K+YglebukLQDc8ijvvaAipKKtcAaAQkWqvMJD08xNSRkYQ+xlqtK6AMxkm3DKEWql
 3RlkZFQQgZPHT0A4e2QSBWpGsh16HWG2wKCXu6FCEPvgMSkN9f+a5mewQGj0jJcJkA
 U/4A/q3lwab0e0RTjibr4JmKgEnBLj7YTSu5S5IcVk3CVDJUyJkAS15RtTHNexrWnn
 lNs71tHa7orNoez4ewAEK04xCTs6CMKGyY9r+/+ELDMSrWAUCgb1HN2b5WcyLBvSXb
 +oOhXJntx8Itg==
Date: Fri, 13 Aug 2021 16:58:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Gene Chen <gene.chen.richtek@gmail.com>, matthias.bgg@gmail.com,
 matti.vaittinen@fi.rohmeurope.com, robh+dt@kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org, gene_chen@richtek.com, Wilma.Wu@mediatek.com,
 cy_huang@richtek.com, benjamin.chao@mediatek.com
Subject: Re: [PATCH resend v6 0/3] power: supply: mt6360_charger: add MT6360
 charger support
Message-ID: <20210813155858.GD5209@sirena.org.uk>
References: <20210719033914.16990-1-gene.chen.richtek@gmail.com>
 <20210813155438.4ssph6deqksob2uv@earth.universe>
MIME-Version: 1.0
In-Reply-To: <20210813155438.4ssph6deqksob2uv@earth.universe>
X-Cookie: E Pluribus Unix
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_085921_574147_E345A930 
X-CRM114-Status: GOOD (  11.05  )
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
Content-Type: multipart/mixed; boundary="===============1167932900938783337=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1167932900938783337==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zbGR4y+acU1DwHSi"
Content-Disposition: inline


--zbGR4y+acU1DwHSi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 13, 2021 at 05:54:38PM +0200, Sebastian Reichel wrote:
> On Mon, Jul 19, 2021 at 11:39:11AM +0800, Gene Chen wrote:
> > This patch series add MT6360 Charger support contains driver and binding
> > document

> Thanks, queued.

We're still waiting for review from Matti on the linear ranges bit -
normally that goes through the regulator tree, do you have a tag to pull
in case of merge conflicts?

--zbGR4y+acU1DwHSi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEWlsIACgkQJNaLcl1U
h9AoZwf9HFxqK2eAq4AklZVlMqvPXdEMOIAyrwH6KkySTkl5AajtCofzW9m+02vr
rZ0r+Hbp5wngiO1gS2xHi9IiOupIZ/T0FfUSNKYavSX7+tocv+KlAkDRFd+ktpCo
7rtr9aBOqcljkdX5n2OYZKvwZdJBj6uPEh7qxNivFxpEbCmx8ymL1YWL1pEYlblR
r3sgWu/fZ1sbp1sFwCvf8GqjmP7Qexqaps6Pg+URJFRoKMlctTDp58ONiE71g8t/
Mw0vlKqG4564sYxo1Pp+cxL+lsv5GvUMvWxEwvi+2nlmc2TD0sZ0KKgkGKtQyzJd
kSrVVJ83AhIEe86ozgS7kgsj3tTR3g==
=bg/U
-----END PGP SIGNATURE-----

--zbGR4y+acU1DwHSi--


--===============1167932900938783337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1167932900938783337==--

