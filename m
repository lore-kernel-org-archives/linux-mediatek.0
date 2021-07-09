Return-Path: <SRS0=yaqe=MB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A39C07E99
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 18:27:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24D84613CA
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 18:27:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24D84613CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eJnwuftfDsEYIOwN/uUamMmM8eLUcxAy6tal6rJeUJs=; b=nkAGk6I6nomB6JcFPCKEExGNfn
	nfrUkVfOmLi/9stt09PoeNxDq+ItHyBGvk9AppmG3jMOx4Y/yB+eLlPL1iPRd0EY6foMLn/oTjuca
	D4f9BZ0nKQB7myR03fki8DrSBaGUfp+xPnmvS1cnVm3FGdgh9u6zkUllrlKr6XVeb0dVCfXttHDLX
	5BYmIrcvgMGuy3c8y5QpZF9u7qcfUYgqdQXKzNulNTOs3ekcZ7MibBjv/Sjwmx46HdhJtQUrNJzT5
	MBMnjPPbCBvJFLcnuzkeBd+ebLLNk92mf7zo9ZjJdEAT4QPpzFp3T7EC0jhbxZTe2FzrPRRHV+rAh
	4I1Z4etA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1vDC-002Hg3-Cs; Fri, 09 Jul 2021 18:26:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1vCz-002HeP-82; Fri, 09 Jul 2021 18:26:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 02A27613BF;
 Fri,  9 Jul 2021 18:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625855200;
 bh=bq7hES9922zgTAyN+l6SWN2Mf5iaz95IRfUV+Ls16ik=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=muxar4b5zjX8knNvBMU1JB3Fq1hkzWEGjTVVbmSEmNmDwmQeBxbUtZRz5Vb8Wr6IQ
 LsOKiwSf6DiSITdFPvms+EQe1fJvkam2xUwL29h3BHfKwcaYzkk+3hCTRAsHnnAtZn
 PQmcHMW0WAflzGDI51CORrUucCd06C3umoS2tVG18sMJgCh+uDaPqSrxb/ePskfSiB
 lco8qKkzSaXICfgsYkPLQIXn4QyVKJFXhYNSeVd35V1RUOeVEs4b8kFn5XXoFDhf8R
 8YChKLlpt4G7A9RmZFzA4FKiVsfgvSWWmwoXBAhlJmgHK70mWrAlQjZGMiemP0nkUs
 /AmeTrvdadxdw==
Date: Fri, 9 Jul 2021 19:26:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Mason Zhang <mason.zhang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 leilk.liu@mediatek.com, wsd_upstream@mediatek.com
Subject: Re: [PATCH 2/2] spi: mediatek: update spi master bingdings for
 MT6893 SOC
Message-ID: <20210709182606.GH4112@sirena.org.uk>
References: <20210629101310.21045-1-mason.zhang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20210629101310.21045-1-mason.zhang@mediatek.com>
X-Cookie: This fortune intentionally left blank.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_112641_342040_E536B9DC 
X-CRM114-Status: UNSURE (   8.30  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============2203856962357639302=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2203856962357639302==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4LFBTxd4L5NLO6ly"
Content-Disposition: inline


--4LFBTxd4L5NLO6ly
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 29, 2021 at 06:13:11PM +0800, Mason Zhang wrote:

> Change-Id: Iaa2840f7e89db83f9505302b50b449f8885a14c1

Please don't include noise like this in upstream patch submissions.

--4LFBTxd4L5NLO6ly
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDolL4ACgkQJNaLcl1U
h9AGuQf/fiCaDqWym+z4bphEMW/sreSQaMhUPsX89q9L53pDipBgT9J5f7DiTPNJ
NmM66kiRq9S7lp9aENzPFdHRj16H2oY/Z2R+ZkhSBl9eIX2bfSrT0iAZugxIRgb/
9LiihnkiKENv1488qf82H7geFWjUCJ3uOa8o85+B5Hc4/4PomUZRhmES+nTneMpd
RjJphzjpC2I/jYhW1YcyjSH7bA/vtSlZ1noq1SuB+NImujAzJ2M1zWxes61HvdTL
dw0yWHYBLiUSRgDSb2bd4e0eke0mAPzz5XZUgRT9UNk+4pH9XsOTw1LnnDYayAJd
z5KQ/Bake3q0K0jl0otdp1oaLsyLZQ==
=L+oc
-----END PGP SIGNATURE-----

--4LFBTxd4L5NLO6ly--


--===============2203856962357639302==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2203856962357639302==--

