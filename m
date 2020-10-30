Return-Path: <SRS0=gG0U=EF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDD0EC00A89
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 17:54:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 426E120724
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 17:54:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RJhtovWj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zDy+5mup"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 426E120724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y05D3+unXNS8mM7qMFTe0n1vrK2xBThnJT2cyJJg3IU=; b=RJhtovWjf0xg4HSDg7jvHL8fY
	nR5YoJ4ai6Jo44BIi/PAnKVhN9gsGwnva1hzIbNRnZUA09ZSQoy6eOUhaiZUP6sPEzAmL6ned+FNG
	HACFaHCdDgKBKGsmP66HCrn01bkP3V9QubWgngcSiYYjXKUov4NYAs8xe9TY+PmKZf9XoDkrddNWb
	+s/qC+MWCuD4S13uFGPtKUP6fSn+NI3D86/j41qmQS6Sa21na23GeuRnryYCTZLlJrFGEbbUayRbq
	R0os1r98Uac9fl/UlPMaee9w9VIAitggR/Z+LM8C3HXLoXNtKoD0sbd0iletb+D0InUKMWaDNjSof
	++VgSezFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYYbk-0003PX-Sr; Fri, 30 Oct 2020 17:54:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYYbg-0003OA-1C; Fri, 30 Oct 2020 17:54:33 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 63DD920724;
 Fri, 30 Oct 2020 17:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604080471;
 bh=WyIRFsjXv5w+8VVFK7eNxhmPJtSeLSv3UXi+yyCplRM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zDy+5mupTyPqwhFZOW7mD744CDzWz58CLBw1/RPEp2gnxtjY6r4JFNj/VDvnlhhp+
 pk2QAaOyZ5gyxO4gIX+zwUMJRMhleQKzIkIO+q1di43F49Ru8IN/q+vSv4SsFaJhJg
 hCRnoBCCokXd8NYCs+yLUMy1VE0MThP5FkMvpdOA=
Date: Fri, 30 Oct 2020 17:54:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH v3 0/9] ASoC: Mediatek: Add support for MT8192 SoC
Message-ID: <20201030175423.GI4405@sirena.org.uk>
References: <1603526339-15005-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1603526339-15005-1-git-send-email-jiaxin.yu@mediatek.com>
X-Cookie: Blow it out your ear.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_135432_169331_F89C1571 
X-CRM114-Status: GOOD (  12.52  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, shane.chien@mediatek.com,
 Bicycle.Tsai@mediatek.com, tiwai@suse.com, tzungbi@google.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, Trevor.Wu@mediatek.com,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1677377714570671045=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1677377714570671045==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qLni7iB6Dl8qUSwk"
Content-Disposition: inline


--qLni7iB6Dl8qUSwk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 24, 2020 at 03:58:50PM +0800, Jiaxin Yu wrote:
> This series of patches adds support for Mediatek AFE for MT8192 SoC. At the same
> time, the calibration function of MT6359 is completed with real machine driver.
> The patch is based on broonie tree "for-next" branch.

I had some small comments but they were all pretty minor - overall this
is basically fine once those are addressed.

--qLni7iB6Dl8qUSwk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+cU04ACgkQJNaLcl1U
h9C1ggf/YtHZAAqO9N519wguyC9a/9FWSK1GJNx4NkUmdW2O/CX/iCOyQUxNzKnt
uZTt9o6BWcs/GpIk8tDx5KtSsZc+fciFLz8wqlXmu5hgEgJ/pT9+5Wv9GSnAfiAQ
wkY98BDiiTXDFZqUUfkbMOW/gDjuCWhWYwxZCS7AVU+v3+3Mm6kw4fsbwAk2anUo
U98Sjh/26RgPpUaPXGJR2gCGhzYwy0aYodnKxEdsgF/5mhXyzjpG+ps/G1xfWDEe
Nk5T7UoQCGAwaWZYVc4DV4dk0jVGZR7h5Cywf97pUYaANBV4UUGwdH2Ssqt0tOc2
g1v0F4GmGt5dT98mnx4H6+Xiw3wiaw==
=FE4p
-----END PGP SIGNATURE-----

--qLni7iB6Dl8qUSwk--


--===============1677377714570671045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1677377714570671045==--

