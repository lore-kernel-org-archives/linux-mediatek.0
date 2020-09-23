Return-Path: <SRS0=E7TL=DA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5CB7C2D0A8
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2020 16:26:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F05F20708
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2020 16:26:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SYepKT9U";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="EZNSI23e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F05F20708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7ok3dnOgFXxV004MkCn5PdWfLRexIuz1cd8jT+C1Hgw=; b=SYepKT9UNS7kiqYE7jq2Tjrex
	vNYJqiGAms5jff66Vfy2ke/ZMQ9FXcZ+4gXgNeNL6PEpBYVSMLSWzRTILgqxm0/MI1D3S1EsXmkJn
	ks6ZLFARvYYX1Y6NwFwjxOmp83XP7Rt4VymEovKX4kBaiFNXVxgChzu1eJyEgHoic6x8C+BrfFt8N
	ijOmwGoAalmQsljozf/bUaLoMdi15f1ygdJkI+925BwRDmhnK8zTFIKd2iNFuFCzwVdUVW92rlu47
	kqVScOi9SPnTJs6ZTpaA2JudYsh1TkxW2PjZvMh8+wntYHULnvvk8I8OLJKH8eL07oAXozVB/XHgG
	zTeNH3C1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kL7aj-0004eo-0h; Wed, 23 Sep 2020 16:26:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kL7ac-0004ce-4R; Wed, 23 Sep 2020 16:25:54 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5F816206D9;
 Wed, 23 Sep 2020 16:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600878352;
 bh=PQYW/Ldo+sSZu9IaAFbupZBqQiivjpdGo9B0LIr5t9Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EZNSI23epCglEhUvEjBMb/94LIn60XKVxEbfxT8eNVWXtsZwRfw4gqnKhkdLH3Utd
 XFXL6/OATz0UZ+F75lQql/cQhwFHr/jt99cRRN0mT+UHIyVB/EWrlN4bk+DSnjd3Rs
 9S/tN0/u3gZ+M1JGYW513NoUv92jPLx4LYDC/V3E=
Date: Wed, 23 Sep 2020 17:24:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: regulator: Add document for MT6359
 regulator
Message-ID: <20200923162458.GE5707@sirena.org.uk>
References: <1600688895-9238-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1600688895-9238-4-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1600688895-9238-4-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Cookie: This report is filled with omissions.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200923_122554_269415_40C61336 
X-CRM114-Status: GOOD (  11.72  )
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
Cc: devicetree@vger.kernel.org, Wen Su <wen.su@mediatek.com>,
 srv_heupstream@mediatek.com, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============6821534999962036365=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6821534999962036365==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bi5JUZtvcfApsciF"
Content-Disposition: inline


--bi5JUZtvcfApsciF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 21, 2020 at 07:48:10PM +0800, Hsin-Hsiung Wang wrote:

> +Required properties:
> +- compatible: "mediatek,mt6359-regulator"

The compatible isn't used by the driver (which is good!) so should be
dropped from the binding document.

--bi5JUZtvcfApsciF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9rdtkACgkQJNaLcl1U
h9AxPwf8CAx/q4PAO9Rp6eYMDBKZmthTsSTtBUgfSC6WahEzOPQypNZI524yMERv
Ds+F2wmVAhQj5GLOi2zLn0TM0oVqF5u9uXewMUjlRR8l56/GBa0ZDNL4LXQlGIKZ
27QHt2czssMevBM3gdGslcDtAGTR7u3PgW8tvUjV3wSab4foD7M1zrgli0P87yEN
QVi0vDcKSybmpC4kCElZo+x5jwF+PXq+rvklMjCNE/o47c1kOSPFsrZAVWBfg09P
1f/0bFbV8XWzrmMSnYiTXn32R5xWQkdD9qdGS+UotFPgtTqpsczXtNB/L0IviDTm
Qr36BUnHbcUoxSc+rLq7PUM7Q7CUYg==
=9PNJ
-----END PGP SIGNATURE-----

--bi5JUZtvcfApsciF--


--===============6821534999962036365==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6821534999962036365==--

