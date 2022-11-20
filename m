Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D179C4332F
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Nov 2022 11:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ggy0qQWOQikRZXdP6PhBP9SY1KAh6GYvEPfkQOJ5x0=; b=BqzZ0mHYCFOYf2zni0xnSUACyH
	eYJg5cgeJs290ZcO1Pizj4LWn6xkz80+iX1DohiArf5W7iIWuD9adhaaPFLyuNaqMPvSdlOYotvPg
	OOmdPWxGTFcHAU5+RUrGPNSGUIMUni3Aqtpd7K9BvtJfeCs4KYoVNeQi1zP3535ycd/yWD7UbpVVJ
	cRZiqJgqktkZzExbjaEE2zLy8G6opVhIqmCjAKIdWAvbZ+FExUn/igxaF1PQ+BgUcjHOvfiMn+mxZ
	0EVxnxRctL7Cao5uu9VCYYbvFBFL535sNd0wS/BqhkPdvvnfmoNN5cALgfMdcl9Msy9rnPSVbq1HO
	2SQ4hyKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owixG-0048YV-6Z; Sun, 20 Nov 2022 11:57:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owix3-0048VA-TF; Sun, 20 Nov 2022 11:57:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 36D9A60C44;
	Sun, 20 Nov 2022 11:57:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A86C433C1;
	Sun, 20 Nov 2022 11:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668945451;
	bh=5ggy0qQWOQikRZXdP6PhBP9SY1KAh6GYvEPfkQOJ5x0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CoQOfYMy1c33U6h/6Si4Kkdk/nYqh1lkdFXZ7pJNL5n9vK4HQ3DUmgzTQOLTi3J/+
	 4L3CB5IjyqYzX7X6zG+dkWGYwvA0hdGuc7N8jgmhdeJrVuTqN/xj+dhNjZlfZ7J+m8
	 NQ3W2f0KvfT6p0noOZ/qXVAUIyJBbjFLwkXHWLqq4vnB57jfFy83AYkdplnSgmAaxg
	 zCmdzQLQ0WFjr9mXKc4j8OxmQ84ISEza82CabM3W7gyfz8kIdxOd4eSw2xfIjVG+7w
	 QNO+he23TglDYzyGgKk5ZjXVMQ7a3tWEdMTEYRmF8wOpAKAo7Hnk/oHDUutDwNLNGQ
	 zJucDyu29NEnA==
Date: Sun, 20 Nov 2022 11:57:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Ilia Lin <ilia.lin@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Yangtao Li <tiny.windzz@gmail.com>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Javier Martinez Canillas <javier@dowhile0.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Maxime Ripard <mripard@kernel.org>, Daniel Mack <zonque@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Add missing start and/or end of line regex
 anchors
Message-ID: <Y3oWJQRtgbHbqz0I@sirena.org.uk>
References: <20221118223728.1721589-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q3GCr2oBFfh1LNvT"
Content-Disposition: inline
In-Reply-To: <20221118223728.1721589-1-robh@kernel.org>
X-Cookie: Ego sum ens omnipotens.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_035734_232961_F39BABD7 
X-CRM114-Status: GOOD (  12.34  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--Q3GCr2oBFfh1LNvT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 18, 2022 at 04:37:27PM -0600, Rob Herring wrote:
> json-schema patterns by default will match anywhere in a string, so
> typically we want at least the start or end anchored. Fix the obvious
> cases where the anchors were forgotten.

Acked-by: Mark Brown <broonie@kernel.org>

--Q3GCr2oBFfh1LNvT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmN6FiQACgkQJNaLcl1U
h9AA2wf/bx63PKQM05br3AtOVY9zdnicSS3gPjXP1RhIZFx5DzHwpwd0ubzHQeEN
Kk6JXxiJGRd6UUsifgfE3wHiKuDzN/eqx3PrQeCPxvUM70Uz2XifdEqmnhRhR/ow
HSxPCKrdL/VnVCE4OGskhnQnuNKdomuoEv5pKw5+0Ue8/O2O24vxh+Ckm/qdedgr
oN+ptQEN4r+FDCGwsc98OKacDLoBwXp0NKSqoflhG0+AzYS3Pv4CWoSJyW7PPzYR
Na7vdI9pcZxlPhOQilQUYKQWmFt0yl7+uUldCPsQXO/0XTBa1KTcI9H2bRK1MsOw
EN4xxqC1SJ9Q0J7wg7TTl77qIj7PPA==
=lgNY
-----END PGP SIGNATURE-----

--Q3GCr2oBFfh1LNvT--

