Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34018C7EE23
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 22:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lr3uzPjW/d4gyLS8sXedsJGTzRUpAStKO+3vD4nOdKM=; b=l/VabHmEaP7BgtfBLRU1gGNTRI
	dHwTMc005s0udP7M+0MKJ/D7EOu7Sv8LEQqpu6VDwtDlN85AUdmsP+oaKZDrPGtLE+KGBzoWZ0D2P
	DYQndUGLmFFpCC9/Mjhb0BJFk6w6e54O7CAgCUmQESyZ+nhDeIHkgFNQLhgkKCYMvbbClwpxs3Ps9
	z0wUwITaIz8uy4tFtXt4YmD8FGOAaPkyQ8iLKGxd/SoMTBp1hVAnIvhsxVrhKTsUvzLS0vUTWPXoL
	SLodyPznIEIO7eZdgwDZzPQdYBpC3ehEvdqiKH5WS+oQdTUw3TX7GEssBiGNvDVJeUUWlVUWTac5j
	PwbLhiww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q47Qq-00FFtR-2I;
	Tue, 30 May 2023 22:03:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q47Qn-00FFrw-1a;
	Tue, 30 May 2023 22:03:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 996C7621EC;
	Tue, 30 May 2023 22:03:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 224FFC433EF;
	Tue, 30 May 2023 22:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685484182;
	bh=ZD8nYca2NjWhCTYonNsPmbGUZda8J8W62Zg3gxJ03ns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NmFPR0kbo8TPcX5QgSpJzC/M6X6lh3TNqzgv/iTOEC6SUj0Pv/oBqi/tXrdCGQpYj
	 wnfXzDDZuc0Ib6/PsP2YfCtU7BmOiVbFwTPKOHkzcW30PitHeKDjQYsrJ6tSQwd1/e
	 A42lRR8/tkfqK+uKP/+73dAQuMFZv2i4XMyUnCnQO24P/FPE2oE04U1AilbpqSE93G
	 8sh4Dt7gy/92gbsZpludOA+iCrGOweobffp/KANebliiJCxTc3B8xebfuMZYX9G85X
	 Nw6aZdqwFBDS6TvIIcUBrVCTIQr8VA9gjZx5W+XVQX4qyUzOKrH/LxamhMf9EZo4OK
	 LNMoLllZc3D2g==
Date: Tue, 30 May 2023 23:02:56 +0100
From: Conor Dooley <conor@kernel.org>
To: matthias.bgg@kernel.org
Cc: rafael@kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, Amit Kucheria <amitk@kernel.org>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, Zhang Rui <rui.zhang@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: thermal: mediatek: Move auxdac binding
 to yaml
Message-ID: <20230530-thaw-unpaved-a1708d46eb5a@spud>
References: <20230530150413.12918-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ObYA+NJ4eGs7IVg9"
Content-Disposition: inline
In-Reply-To: <20230530150413.12918-1-matthias.bgg@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_150305_577022_F488E2E5 
X-CRM114-Status: GOOD (  15.96  )
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


--ObYA+NJ4eGs7IVg9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Matthias,

On Tue, May 30, 2023 at 05:04:12PM +0200, matthias.bgg@kernel.org wrote:

> +  The MediaTek thermal controller measures the on-SoC temperatures.
> +  This device does not have its own ADC, instead it directly controls
> +  the AUXADC via AHB bus accesses. For this reason this device needs
> +  phandles to the AUXADC. Also it controls a mux in the apmixedsys
> +  register space via AHB bus accesses, so a phandle to the APMIXEDSYS
> +  is also needed.

That double "also" bothers my OCD greatly, but it is a faithful
conversion.

> +  "#thermal-sensor-cells":
> +    const: 1

> -- #thermal-sensor-cells : Should be 0. See Documentation/devicetree/bindings/thermal/thermal-sensor.yaml for a description.

How come this has changed? I didn't see an explanation for it in either
of the patches.

Cheers,
Conor.

--ObYA+NJ4eGs7IVg9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHZykAAKCRB4tDGHoIJi
0hC4AP4umpuP8KFghCmvHITUZSdVQShZ8HJEKLtQj22QodFfQQD/UUmajqYpMOxp
TG5jLg2JDrr4wbLO6ArZSJORQtEAVQE=
=WerN
-----END PGP SIGNATURE-----

--ObYA+NJ4eGs7IVg9--

