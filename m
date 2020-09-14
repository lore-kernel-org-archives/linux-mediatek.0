Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21213C433E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 12:33:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8D6B20735
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 12:33:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1t09Q873";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TIBVPOh3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8D6B20735
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YvGN34yNfO634NE9idinX7XL/LmFzSvsEAJB37DRPpY=; b=1t09Q873O4kil5rTcojFFC0wv
	rO/zxqd3H0i9hqRO2SvRIUcSdNMtSHVZVjNH5wU7Yx1e6+2U89dJXz9M1CzqBwMIa5ymXOIjV5GWo
	VNYoZZF4ROHpFa1O/qgGtewz4FiGslUsA3B+lDKpWjXrAzA7j+dDWl+X98LotBamD8RkrgVZRjis+
	64UuBig0eRbj4y8zzThs3iJzxWiQ7rxYHEkF/BQf9aXiqcbkkYwLYjSTza2zXtGH9gho6bEIc+1X7
	m8+Es5K+BNPTcD2gvJW4Mm4V+nvjZs1RbcsFvg6I+RkyHaWHjcWZ1a8xNjM6Sh+cFRrh7iGBVz64v
	cNcU268CA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHnfF-0005BE-GG; Mon, 14 Sep 2020 12:32:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHnfB-0005AJ-BD; Mon, 14 Sep 2020 12:32:54 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2636F20709;
 Mon, 14 Sep 2020 12:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600086771;
 bh=xFSDw8//5wJ8dFfNNw4BsdqTVRi7fxPIg8Of2LQJ/j0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TIBVPOh3DWEDLqP8H6eDP3hQf8byFbaCVkE4ZnVykam1Kjx1Z53p0OTqlrTbEgyCa
 Z3MDeth+eNr7mpjp0uDcV2ZEmoM3pmi3le9tA2h3wxoJJMcm5Q23rI3tx2KHEApyen
 KRZDFFGRpP7fNuCPUxWRlN7VrU80dJPk14bL8kxI=
Date: Mon, 14 Sep 2020 13:32:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Henry Chen <henryc.chen@mediatek.com>
Subject: Re: [PATCH V5 14/17] dt-bindings: regulator: add DVFSRC regulator
 dt-bindings
Message-ID: <20200914123202.GD4821@sirena.org.uk>
References: <1600052684-21198-1-git-send-email-henryc.chen@mediatek.com>
 <1600052684-21198-15-git-send-email-henryc.chen@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1600052684-21198-15-git-send-email-henryc.chen@mediatek.com>
X-Cookie: Disc space -- the final frontier!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_083253_447399_E637F49F 
X-CRM114-Status: GOOD (  12.79  )
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
 Mike Turquette <mturquette@linaro.org>, James Liao <jamesjj.liao@mediatek.com>,
 Viresh Kumar <vireshk@kernel.org>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Fan Chen <fan.chen@mediatek.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Ryan Case <ryandcase@chromium.org>,
 Arvin Wang <arvin.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Georgi Djakov <georgi.djakov@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1338382741683053178=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1338382741683053178==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JgQwtEuHJzHdouWu"
Content-Disposition: inline


--JgQwtEuHJzHdouWu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 14, 2020 at 11:04:41AM +0800, Henry Chen wrote:

>  		clocks = <&infracfg CLK_INFRA_DVFSRC>;
>  		clock-names = "dvfsrc";
>  		#interconnect-cells = <1>;
> +		dvfsrc-regulator {
> +			compatible = "mediatek,mt8183-dvfsrc-regulator";

This device has only one possible parent, why does it need a compatible
string?

--JgQwtEuHJzHdouWu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9fYsIACgkQJNaLcl1U
h9CGAwf+NdDwxcGz6vK2nMoZx0OSox6fapvguwKcIXo6+F97ItlNsR1WVQBnDgnb
203sE6MD8JOg6WSkRP7PnGf1oZP6C5df/tB80kqV22bPc11sqWE1i2bqiM/LQwq+
wVLFlxVYsCHQbpq0HdRBPG0fSrzkDlE3ShgUMMD2hAn94apWUL5U1cVs9SuY3oRi
3fSngH9WbCL1X7o/whxg5Ogq38X0Z2xahcNz8G8MNRJoqazFTMRrFHvgpI8fKcsT
vQ6WyeukDlkXErJnCxbl47PAOdSmpuZ0z27L2NGlUPQEkzcH3FvGYRv6MEbwFr+N
GCwB3F0SHfonZ0Sd7JobMcHzFzPKnw==
=miPV
-----END PGP SIGNATURE-----

--JgQwtEuHJzHdouWu--


--===============1338382741683053178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1338382741683053178==--

