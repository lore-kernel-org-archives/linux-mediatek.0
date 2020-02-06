Return-Path: <SRS0=Uacl=32=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_DBL_ABUSE_MALW,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D588C2D0B1
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Feb 2020 11:49:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1363621741
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Feb 2020 11:49:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jyO84wa/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="uzMAt5em"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1363621741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EtRWvuvnRoW79XBdjSjOLFlfui+bK/rT2IOhgY7+VFA=; b=jyO84wa/cUqS5cMNEuLFROUz8
	iepN4lPQ0AL6WTEYSy7nAmzNx9sO9KDD0CV8ulTL/I+7TdlPcfirH4EI7a5tM9lWHtmmCbVcagaIB
	j4iTctFvJgfcT0Jpy7l+zly4HDmWvClPgP9QYuHA3Zb2F/Ghi213BAm49LfI5vmm99DFkZMeFlIop
	kmedgEhVKfpTAWmYzx0OGOAqk2uWWnHTtkqh7M/g16e40laBHLMQOMGODEsAXpEDNgskvSmmo5uPR
	FR2ILbV2CYx8X35NJj2YLOXy9fsxPP/fjMyCH2aBqZHtj3wd8hx7g3y1HSkoontxSBU02kZFFLEE9
	k7SBOJA3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izff9-0007ZX-L4; Thu, 06 Feb 2020 11:49:39 +0000
Received: from heliosphere.sirena.org.uk ([172.104.155.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izff2-0007RI-70; Thu, 06 Feb 2020 11:49:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aeh2bnGaIQasagmj+LRJPLVBSVmtzVWOfHGUZwOPl9k=; b=uzMAt5emOT/DsoAgMGDNx0ij9
 tuZOOxrxBl7YfrZ7Noe82a9tTttXG8/pzRK1mI8sousbwvv2GX0Bmkb2gfV7Ua9/Zljmiej4jNAIX
 DeFeYfFPWNLFNZuMalqtWdpZ0c+4KKrajxqsP+hHOyg0uMxoOe8gQS3kp4sjLgGUCTxcE=;
Received: from fw-tnat-cam3.arm.com ([217.140.106.51]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1izfey-0001aU-5A; Thu, 06 Feb 2020 11:49:28 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id D10C3D01D7F; Thu,  6 Feb 2020 11:49:27 +0000 (GMT)
Date: Thu, 6 Feb 2020 11:49:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Wen Su <Wen.Su@mediatek.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: regulator: Add document for MT6359
 regulator
Message-ID: <20200206114927.GN3897@sirena.org.uk>
References: <1580958411-2478-1-git-send-email-Wen.Su@mediatek.com>
 <1580958411-2478-2-git-send-email-Wen.Su@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1580958411-2478-2-git-send-email-Wen.Su@mediatek.com>
X-Cookie: Programming is an unnatural act.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_034932_254047_2A41BAFC 
X-CRM114-Status: UNSURE (   8.22  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============5273412646844671977=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5273412646844671977==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WW66Wv25qHMoYYLs"
Content-Disposition: inline


--WW66Wv25qHMoYYLs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 06, 2020 at 11:06:48AM +0800, Wen Su wrote:

> +Required properties:
> +- compatible: "mediatek,mt6359-regulator"

Why does this need a compatible string - it looks like it's just
encoding the way Linux splits devices up into the DT, not
providing some reusable IP block.

--WW66Wv25qHMoYYLs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl47/UcACgkQJNaLcl1U
h9AGqAf/ei5s8WFL5nFhQ5WtOwQKyMl6BzjPHZGCXguSsSzU+Bs45Cq1viLBg3ww
H/gXJ2VJxUuY4EU3kr3iP6Haxhe/h9TGEobGG917mADI9ZBScIkY6l7AGQPe44mQ
oCiBKl73LxwZtRu8DNFg7k1W13eAOKi0TLwQ0KaC4GalJ1loAnttpbgxUvBLVR02
BxiROqhvkQsNI1q+oh1Dnyvd0rFFT12QXDIgw0sbR6DEVkEvHFnvB9C720P5L9ld
4iFDo6hOqqSwZIecmI3G36JIpFEY3vE+f2plbZCRaf01Fd91TZPZX0YQlBSr4Qbk
uJ85eR2wboqLgi77IS+mzYNgxwg5vw==
=vTbL
-----END PGP SIGNATURE-----

--WW66Wv25qHMoYYLs--


--===============5273412646844671977==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5273412646844671977==--

