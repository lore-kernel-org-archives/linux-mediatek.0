Return-Path: <SRS0=XWkL=5J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2F79C43331
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2020 20:38:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 850A52070A
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2020 20:38:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lYG4hxgZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 850A52070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sm/p5yQgj2Zc/Hv82N5e0/OlqP90JdJWgMttyg/h+d8=; b=lYG4hxgZ6NnaJ8mPM+FXkQB/m
	9V5kMyai4Bqzvsifx9kbBFIRyxZyLm4KbouojZJ+H6z3sAKlhNvVKB6kTj7AHAfWW/rV2v8b3WmU4
	iNAZ6Le+iVXlQy2F7fwqx44I5dQJzYpJu2KzlxIcY1S3L9JeIVj5kzNgaAHVnsQsx1y+0ipF5pReR
	X6q/G/QjYNEvckTpvYJ+v2siVKlIn+G3aCUeu1Tf9ihTH7h74zitVo+CGZx/SVMsAU6+9MxtsaYy5
	+uZ3qVrALHEeXpkoQ4ja9RoHzb8mn5LClD5PEdUzRhIot7pxD8mkIIeIA8176KD/gz9d62C4YPni7
	zoR+oPYMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGqJz-0006Eb-EN; Tue, 24 Mar 2020 20:38:47 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGqJo-00061e-Sc; Tue, 24 Mar 2020 20:38:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F36731B;
 Tue, 24 Mar 2020 13:38:36 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FE7A3F71F;
 Tue, 24 Mar 2020 13:38:35 -0700 (PDT)
Date: Tue, 24 Mar 2020 20:38:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Henry Chen <henryc.chen@mediatek.com>
Subject: Re: [PATCH V4 11/13] dt-bindings: regulator: add DVFSRC regulator
 dt-bindings
Message-ID: <20200324203833.GL7039@sirena.org.uk>
References: <1584092066-24425-1-git-send-email-henryc.chen@mediatek.com>
 <1584092066-24425-12-git-send-email-henryc.chen@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1584092066-24425-12-git-send-email-henryc.chen@mediatek.com>
X-Cookie: I feel ... JUGULAR ...
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200324_133836_969445_A8780987 
X-CRM114-Status: UNSURE (   9.87  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 Mike Turquette <mturquette@linaro.org>, srv_heupstream@mediatek.com,
 James Liao <jamesjj.liao@mediatek.com>, Viresh Kumar <vireshk@kernel.org>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Fan Chen <fan.chen@mediatek.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Ryan Case <ryandcase@chromium.org>, Arvin Wang <arvin.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Georgi Djakov <georgi.djakov@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1120042092321438839=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1120042092321438839==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1hKfHPzOXWu1rh0v"
Content-Disposition: inline


--1hKfHPzOXWu1rh0v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 13, 2020 at 05:34:24PM +0800, Henry Chen wrote:

> +- regulator : The DVFSRC regulator is modelled as a subdevice of the DVFSRC.
> +	Because DVFSRC can request power directly via register read/write, likes
> +	vcore which is a core power of mt8183. As such, the DVFSRC regulator
> +	requires that DVFSRC nodes be present. shall contain only one of the
> +	following: "mediatek,mt8183-dvfsrc-regulator"

Why do we even need a compatible here - it's not adding any new
information to the parent mt8183 node, the compatible is mainly for the
way Linux divides things up rather than a description of the hardware.
We could just say that the regulator node always has a particular name
instead.

It's also not quite true that it contains "only" the compatible - it
also allows the regulator constraints to be defined.

--1hKfHPzOXWu1rh0v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl56b8kACgkQJNaLcl1U
h9BVDwf/RAYKDpswM9LzY+qhfj6MLLg7KpdzLRHMUjmy5/LLU1HpBEtu8YhHSzBX
/+V7JmuFIoswcuE1W6nL9Rvtxp5cNAFwUbWyHKeP+wKCRrMRy3BCwICR/CqLTt4i
aloftUH1AythmDbWKFeMF47RRo5cqaEklU5MW4MK+b+mGluEyvX2AEiqvIwgEyi3
+a5P7KtSH22jRWOx5z7B5/zMRIrG3kSReLWh3nTeRX7ky5tV/sKVW/2Z1MgRyxyF
VReF9OlRZyAvNJ6IqfjjOXwroaJs0nTWR3MXRFd5xf+RTIdvkvU+YH6nvrIwxpqi
gU0MdPkAAbq4e7HzdchQ/hsXz16mOw==
=f2rY
-----END PGP SIGNATURE-----

--1hKfHPzOXWu1rh0v--


--===============1120042092321438839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1120042092321438839==--

