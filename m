Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D774C433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 10:15:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81839221EB
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 10:15:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PK+r5KC4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="uIhtv5Tm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81839221EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0WKM0Q/UFytiihaShkfc7mkWgdbbemEBYWEL6LnlOrA=; b=PK+r5KC4NlePLdzaCwjrCfnjW
	9OImic/isTOan+CE0sJoTSJwZBoLwukIX/widaLhmVWc+nCKBqARdr1gREaqVY7MyAw5HQOlCi5UL
	3JSB6fH9c3RPRKj7yGtghHsMq89tpRCeRt1NmXRK+V23OZeHwSAbJ52PlNu/ux9HFZaSSokEToUkW
	5jzTBHeQWKo6qy5fUoi3IsSvGQs1aW4ydozSVFeAoN8qqB15Vn/ex/mHbAFUIUy2l8QsgH0/Q0hDp
	/CH9NCHQWoFM1gXaNb8PbYiZzsLC0jZm0GBDgrmlmAl5SG0mZdg0+dWO5D/dRh1KTHcuYo0So7fBI
	NNspBakog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGg4z-0002Et-KR; Fri, 11 Sep 2020 10:14:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGg4x-0002ER-CI
 for linux-mediatek@lists.infradead.org; Fri, 11 Sep 2020 10:14:52 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1EF95221E5;
 Fri, 11 Sep 2020 10:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599819290;
 bh=OSLR7WKpAsGFlS6cyFXhE4P0iBeRMG6g97ZnysjYs9I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uIhtv5TmIdUsva4pkKFlcwwY9QQNLFFp5BsYD0SGKi3zGarqbRxQoOojXs5tIkGc1
 2txw19EnpMJOLh0o7h4uiZcOkeQM4/znc+DWUQEfKIsiUJwuuelh3ws6bS0uU0kepB
 72C8S/34jXvvHX+CVpIgjs0PrHcQXpZqcyUUUop4=
Date: Fri, 11 Sep 2020 11:14:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Subject: Re: [PATCH] ASoC: core: Optionaly add the component driver name to
 the component name
Message-ID: <20200911101404.GB4895@sirena.org.uk>
References: <20200910200308.9125-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20200910200308.9125-1-dafna.hirschfeld@collabora.com>
X-Cookie: Only God can make random selections.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_061451_536629_ABBCCDC8 
X-CRM114-Status: GOOD (  10.94  )
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
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, dafna3@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, ranjani.sridharan@linux.intel.com,
 enric.balletbo@collabora.com, dmitry.baryshkov@linaro.org,
 kernel@collabora.com, perex@perex.cz
Content-Type: multipart/mixed; boundary="===============3309155669643040429=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3309155669643040429==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Content-Disposition: inline


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 10, 2020 at 10:03:08PM +0200, Dafna Hirschfeld wrote:

> The ASoC platform driver for Mediatek MT8173 registers
> several components with identical name. This cause an

Why is one driver registering multiple components for a single
underlying device in the first place?

--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9bTesACgkQJNaLcl1U
h9C04gf7BZZwKrvOB5Cwa45nlXvWKuAww5NnRsik9jaFHToimYmlsocC/X6dQxkK
GbNBq3MLq4jn+v+S/A4B+rIRc7DOJr1pkgCmQJNKFbhvPIw+SxSiaBF6Plq6hXpE
GzCYiys6uXGG0XM128wHwPyBMxK/hy7hcTBtIFoSC2N/srTNCuYlkWK7FE6QFTnk
EuGkVWt4Hxg4io0Z9v8eDeBvSn5NfXjA48A3ekBbGpacSh1/B7heZ4aj7bUWWnTJ
hjGUuRopKXa9XiRXii6zh5f89qiAN7Vqo0oLv+G05eZO5SFNGr7z/fT4Fw24RCNj
tdlYwU70jcs993mUwt4ezK2UMrpKbQ==
=T1Tz
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--


--===============3309155669643040429==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3309155669643040429==--

