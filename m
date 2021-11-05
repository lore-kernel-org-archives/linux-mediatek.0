Return-Path: <SRS0=Oz0f=PY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D02C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Nov 2021 15:39:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E62961250
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Nov 2021 15:39:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E62961250
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tm7KRRUDqRtaDJ7496hiPiHZeZwXN/CrVBBpiDt7DqE=; b=UoYc2eFAEn66DrygFOsHBjx/fW
	CKfnFvJmS3F+uErvOedNiWieOP0u75ihMXDlvwWDKjfx+CTN2LdsJcJHMvbx6vwsil5SMBkoFSTCS
	wsATTbCHECCY8gtcIAR8BFwZl5qnPInTpZPSlnjKH57UuS9XqZIRsLVtDF7ywrxTSwiVoR3fxFAL1
	kNZs/6XATTRXt+qQqQce6vELk64+xHioMHcpR+jNGbszI14dg+8M/ET91q4pm0j7wZ+SETVYQIxMv
	DBYq2RVNNYoLUGuGYXMHa1OMqIQFPIQt4sMXAGrfVUWcVNVBb9AqUqE90nHn4y47XrnvhkTmm41/c
	cyzL91yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mj1J9-00BkHe-7I; Fri, 05 Nov 2021 15:39:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mj1Iv-00BkDr-S7; Fri, 05 Nov 2021 15:38:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 89AC261262;
 Fri,  5 Nov 2021 15:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636126736;
 bh=n+X3HnJrn5I94lNBI4oN/v0sCIelBvNfe55+cq90v10=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e9Ucd2v6QRgwynLsGWWjsZ9DrN41cZWBcOU3fmyszspj5juzbIaCUnMbf1VmMIF6N
 OXBBbWMH3izsCDC59sQJOPq2RS8zSwSzK68HNT0IBbJbb/WvBHajwwZprNjtSw+IxC
 JAhLQ+Vd+JZKdQPaG2yuM3b88Mzm9RcoUcmXndlzWT7j0Wbcvuuqhs0gpa3rnfL+yC
 usnFsjkkMEWgP0/fsohMi+zg9pr12EzyHT5R2ZTg8G7Xj86kBwRLDN62oJ00nXm0Qj
 XRuz5Nz9l67rfJqK8ypCHB9i9HKcJpwenJLCPNjFtcszgAcvs2I158u20QJm1vJ+2Q
 CfNcVtRNRxzrg==
Date: Fri, 5 Nov 2021 15:38:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: tiwai@suse.com, robh+dt@kernel.org, matthias.bgg@gmail.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, yc.hung@mediatek.com, daniel.baluta@nxp.com
Subject: Re: [PATCH 3/4] ASoC: mediatek: mt8195: separate the common code
 from machine driver
Message-ID: <YYVQC7KLZx8oxdXT@sirena.org.uk>
References: <20211103100040.11933-1-trevor.wu@mediatek.com>
 <20211103100040.11933-4-trevor.wu@mediatek.com>
 <YYP+l7tMofYoB+aC@sirena.org.uk>
 <b4360ea17c3045759e85ee13fa9c001afe73c93c.camel@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <b4360ea17c3045759e85ee13fa9c001afe73c93c.camel@mediatek.com>
X-Cookie: For recreational use only.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211105_083857_955805_1C7706CC 
X-CRM114-Status: GOOD (  17.61  )
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
Content-Type: multipart/mixed; boundary="===============2632836288049006691=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2632836288049006691==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t/JfaRmZozyWm9hx"
Content-Disposition: inline


--t/JfaRmZozyWm9hx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 05, 2021 at 12:11:55PM +0800, Trevor Wu wrote:
> On Thu, 2021-11-04 at 15:39 +0000, Mark Brown wrote:

> > I don't follow why the DSP support requires a new driver?  Shouldn't
> > all
> > systems with the DSP present be using it?

> We need to keep the solution without DSP, so we can replace DSP
> solution with non-DSP when it's required. But when we introduce SOF for
> DSP control, there will be more routes in machine driver and device
> tree usage is different from the original. So it's hard to share the
> same driver for these two solutions.

We shouldn't be requiring people to load completely different drivers
based on software configuration, what if a system wants to bypass the
DSP in some but not all configurations?  Can we not just have controls
allowing users to route round the DSP where appropriate?

--t/JfaRmZozyWm9hx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGFUAoACgkQJNaLcl1U
h9AcIQf/UzpTAAC3VR+zMJZTNX3wEOw/Bi2D9vxmvTBGIwB7G/FlETQmVwaUxECA
azgmnw3jnHqEQO1aNTlkf5su9mzgHkUuQTiNy0AHeQwBcxSmOk5xad6W2mTurLbf
GexsEap8koTYYrIGYaD4DkBef34y5WcEnMmm2DS9lHcpAge/XD9agMmB5QrH3PWR
dcLcfVzHVNGSZbGd6Woxi7xb8Y9wciaFuMyyEcl5YNbXpJO36x/rrxOOA5Okv2rD
McStZ5dJaOvw1juc+ndps1GwyfUSTKFre0NjTSFAVGOelVzIfL9vmIYIqo/pm2/7
weWT+28cmDv+DuB48D7CT5v1QGs11w==
=sW00
-----END PGP SIGNATURE-----

--t/JfaRmZozyWm9hx--


--===============2632836288049006691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2632836288049006691==--

