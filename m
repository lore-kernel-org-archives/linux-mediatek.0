Return-Path: <SRS0=ikIt=NE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B86AEC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 16:33:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 818C6610E9
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 16:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 818C6610E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M1JwcduOaLOMruwrzeimjX33Stuv9XQwtPmhwdGTaHA=; b=lAey5MdlCaSjFhgWw/rG/vtROp
	clB5hQsBjkaxOddQFNpmg1TKUOg1762yZJWTObD/b1vMh7s/51cv4v5gyzToOrEoiFtl1tJpGv2K+
	+uAoEvKpAxIxjk1RldU4t5DLeA1fgb5a04IHWyklqs800aoN2kyYWcpnCsfgRIADFTBwKiWcE0NM2
	LSYXQVLsd3Eb5+qiGeSfyZLe/FTyMlf8d3XMRYsyfdFZqh5+MUI1ngVGgYeFJIoNxC2AJorTbag1O
	PW4lwCoY0DrHNojnqcBO3A5y9gcg148ywTKXtG6WDZiD3CmEokO4cdirORztgd4J22UCeOLNVt+fl
	EQJCyFoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEa7c-00D8IL-C8; Fri, 13 Aug 2021 16:33:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEa7Q-00D8GS-3e; Fri, 13 Aug 2021 16:33:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E011610E9;
 Fri, 13 Aug 2021 16:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628872394;
 bh=RsV8b7RStf2aqBJP+j/Ai99xGWXWnGgnyJ6Mj4v1/4g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UA6Ffbs4QUyvRzsMPdO7rMhcGsOFpNMxceFWbpvL8FZ9RVpBNCt6EDoHuLdVEjzmg
 tXqSFeABDp+bCfql/5Gt25nfVPJwqsotFphDY15t9zmicU/g9VbLfs+4SP0nNTwcGM
 kyVp3rOEIZ9yuRhn5VzWvhVuMIHQU8wX4Oh1pFri0cdiPH+RA+UwYCooL1fHjJuvWt
 UQnUUW6cfMSbqSLPVDvUy4QdpwGdWBWbIBgSD+5o/HBgjSL0Ucn9LuheyxTt6TgoB4
 FHvj6ywBn8d1Dff8cch3kZnO6ouhIwGfDOxiyeIZycGZUKwouvZrPjmut+8uykNZGb
 ILANYOViAGq2A==
Date: Fri, 13 Aug 2021 17:32:54 +0100
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
Message-ID: <20210813163254.GF5209@sirena.org.uk>
References: <20210719033914.16990-1-gene.chen.richtek@gmail.com>
 <20210813155438.4ssph6deqksob2uv@earth.universe>
 <20210813155858.GD5209@sirena.org.uk>
 <20210813162029.q5slrkubelfy3mvh@earth.universe>
MIME-Version: 1.0
In-Reply-To: <20210813162029.q5slrkubelfy3mvh@earth.universe>
X-Cookie: E Pluribus Unix
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_093316_211271_3B03DD71 
X-CRM114-Status: GOOD (  14.31  )
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
Content-Type: multipart/mixed; boundary="===============1553324515210664362=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1553324515210664362==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l+goss899txtYvYf"
Content-Disposition: inline


--l+goss899txtYvYf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 13, 2021 at 06:20:29PM +0200, Sebastian Reichel wrote:
> On Fri, Aug 13, 2021 at 04:58:58PM +0100, Mark Brown wrote:

> > We're still waiting for review from Matti on the linear ranges bit -
> > normally that goes through the regulator tree, do you have a tag to pull
> > in case of merge conflicts?

> He actually already provided his Rb in v5, Gene did not carry it
> over properly (I added it) and the patch looks simple enough, that
> Linus will know what to do in case of a conflict. But if you insist
> I can unroll my tree and create a topic branch for this.

It would be better, the issues I'm worrying about are more general
refactorings or whatever that create actual dependencies rather than
just trivial add/add type issues - it can make doing some kinds of work
really painful if things go via a different tree.

--l+goss899txtYvYf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEWnrUACgkQJNaLcl1U
h9CcoQf/Winqb6RX4ilu9FDNU8XLNiJFX2+ApqvxEDI72rwph0/OJ5DfJ2sbXltf
EQaGfnmUSWRlGRsGnuE/QdnmgJ++HwfaA6NL4BmYalIAsRZvg/+bGxRLwEDLZZpz
grdaGitjklhn3vrT00339tbQcPn4gOSMxvnO0gCMtRnGd1MWYenRg02Dptq60v2K
xF+i06p+PQX2aIHk+Xnyo9QCap1y+6A2Yjd8z/BEuQ+0hJBLXpzeNAxltd5DsbGA
DjFDEokCy+9eZ6gvjnU9/T2Dl6rn7iNIP3NA0CJZcesIFLgx9i/bmfhbdVXsXDGS
ggSqbh8TenBgdCiK/riOYOLQ7nOCDQ==
=InBg
-----END PGP SIGNATURE-----

--l+goss899txtYvYf--


--===============1553324515210664362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1553324515210664362==--

