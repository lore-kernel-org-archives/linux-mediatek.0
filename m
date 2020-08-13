Return-Path: <SRS0=lgZq=BX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB809C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 15:45:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 957B320829
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 15:45:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ee2y6/P8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lKnA/zVL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 957B320829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fs8s0VvLkZ3nEpM1rWIphLQ4uzkSLXgDNrMI75wMV+o=; b=ee2y6/P8gq37y0bTFQCKUtr32
	vGjHUMTLfGmvSprUcmK3EOOyb52nyb/k0mKUX5XOEA0ap+gY7OT0wOD4mSJoYW/qx8ZawXfY1pygQ
	APfZEY/5A5pn7fTNrWc/KypOwCQR/ynmZVankFW0lWKCd3DrywzOgSSJitGE7ycY1F2QrfRCb0mS+
	G8uNlJ9idKYq14XktCuCF1FkPoSGbPilDwe97NHRdhaPuh9lgHdIgLcjQH5XRRt8EkvIqs6GHHm4U
	zjVGSGoPPNYea/PHbcldRNpUA6MJ16Qni2wvXLDsUw6PrKtsD9Ezi9djdnhyF4hryyNIHFOaWRDjk
	QdAnerTsQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6FPW-00016l-0L; Thu, 13 Aug 2020 15:44:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6FPQ-00015b-Mt; Thu, 13 Aug 2020 15:44:53 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DC5DD20829;
 Thu, 13 Aug 2020 15:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597333491;
 bh=n+lRf4d5ROJJHRRF+9tZK3toZHtlbpLJVRPOxkuH/z8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lKnA/zVLUdkO1TJD7+L5mhYBc70cMDkgdLPUn9ffKVSLOfUZv2cftQsPNjMY7sFcR
 hTn976Kp6Chv4Md7iyAUoFoeZpIcMbrSK6O5sPcuRizWoFrDOnHXjf8xu01CRhysoo
 VsKea1izNepj0If4Xr3fFcYV0g+ELVPGho25swa0=
Date: Thu, 13 Aug 2020 16:44:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH v2 1/2] ASoC: mediatek: mt6359: add codec driver
Message-ID: <20200813154423.GC5541@sirena.org.uk>
References: <1597028754-7732-1-git-send-email-jiaxin.yu@mediatek.com>
 <1597028754-7732-2-git-send-email-jiaxin.yu@mediatek.com>
 <20200810185933.GI6438@sirena.org.uk>
 <1597217353.23246.45.camel@mhfsdcap03>
 <20200812120537.GA5545@sirena.org.uk>
 <1597333200.23246.68.camel@mhfsdcap03>
MIME-Version: 1.0
In-Reply-To: <1597333200.23246.68.camel@mhfsdcap03>
X-Cookie: Your mileage may vary.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_114452_830423_B01577AF 
X-CRM114-Status: GOOD (  20.04  )
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
Cc: alsa-devel@alsa-project.org, shane.chien@mediatek.com,
 howie.huang@mediatek.com, tiwai@suse.com, linux-kernel@vger.kernel.org,
 tzungbi@google.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 eason.yen@mediatek.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1529144449103949950=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1529144449103949950==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lMM8JwqTlfDpEaS6"
Content-Disposition: inline


--lMM8JwqTlfDpEaS6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 13, 2020 at 11:40:00PM +0800, Jiaxin Yu wrote:
> On Wed, 2020-08-12 at 13:05 +0100, Mark Brown wrote:

> > These functions are exported for other drivers to use rather than
> > something done internally by the driver - if this were internal to the
> > driver it'd not be a big deal but when it's for use by another driver
> > it'd be better to go through standard interfaces.

> Can we move this part of the operation to the codec dai driver ops, such
> as .startup and .shutdown? Because originally these functions are
> exported to machine driver's dai_link .startup and .shutdown ops.

If it's internal to the driver sure.

> > So this needs the SoC to do something as part of callibration?

> Yes, the side of MTKAIF in SoC part named adda, we need config it before
> calibration. We will also upstream machine/platform driver that use this
> codec driver later.

It would probably be better to just leave this out for now then add the
required bits to the CODEC driver as part of a patch series that also
adds the machine driver that uses it so it's clear how it all fits
together.  It sounds like it should be fine but this'd be easier to
review.

--lMM8JwqTlfDpEaS6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl81X9cACgkQJNaLcl1U
h9AgEgf8CMREa84vouym5KtpM1No5HSGwGI5+EJTOUWF8vPkS1W3IuMv5ZoWeuvF
kOFsj5OQHliWGiQbI+HI5X6H7cruLsvVPBoxUg7hHx9n7zfz25IbaTiuk5/QpTJ2
id7eshXQ5TSPfRJ4WQrcePCn07HCnvI5HkBxw3L18IBjw/z34TCPoA8cVh0SqLnS
ecTT2uq7Yjd+1OxvjHVlMsw4GE/b+JXk/IOScAFNiVe/ofYzzNP04VgJNA7f20wA
+UAs84bO5bfuqtrzbtDTRxu6P3p5Gw4d3zJuVLiqD+W481IeUVo/I5LcGFkDG+5e
20ANMcyLw+bJyzovtx+vqIMLy6AM9w==
=v+hX
-----END PGP SIGNATURE-----

--lMM8JwqTlfDpEaS6--


--===============1529144449103949950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1529144449103949950==--

