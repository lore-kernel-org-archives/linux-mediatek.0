Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2328C04A68
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 11:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OHcOKPCYTYdLX9F8kD/v4W2mm2C6n+HycOsQeq4ijuA=; b=UHoVAA8DCPtCXKLoelIsdXE9Kg
	KNrnaqHnshdnCpu82LHN8Pp/pD1P4dwoqehTscNwf+dtZr4YcQMAf9s1mmc7Hj09OvKuBdbzFJeU6
	hBF4JN9+S36jSoDrjPHim3KK/CzGWqknQ5Z39kMWtGP/QXNrEHU7gQcwFkn3nt8MyVFIfTJRBgPYs
	wO18K15h3YmNe8u2OEyjjuuC8hPQTsCPzhlTEWKgxufZVRXwqIjPPYIMpEyfVzcgT+M28+f+0+PdT
	8pARF403rYJSHuStyC4K68eHqry6WtuSkTXPHc4+bQZD26UPmHgdSkh6RCZkZgkASg7iM5+oX8XQ0
	06y2mgaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH1Mz-008bYJ-5K; Thu, 28 Jul 2022 11:07:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH1Mo-008bUz-0Z; Thu, 28 Jul 2022 11:07:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3CE006199A;
	Thu, 28 Jul 2022 11:07:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F4EC433D6;
	Thu, 28 Jul 2022 11:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659006464;
	bh=7kmhiHLDWigtfnWVIEbBCX52nEfmZ+N0EJ/w9X+KN3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MyHIRa/lkbHLxiXssB4CsJPYHd2bdzf66hoX5m4HXVQLatBWc5w76l3WVXEZM3lzY
	 ZId8DWigVHSD04dvOILF7n/QNbIlqTIfFWBrkpqbTnCNT7cQeaaD1yj/IwZ7olDH5v
	 Y/RZ7jjrWtSvHcJVXh1DfdimRZOK/N2MWioYMwz/nelsp2VQWAY6oEnPAYsoxKjReH
	 wpR78qJ+35V3K3JZLynxqrVeqW3CX2fAjOj+2JpblFwXZRRBT0y7KjeXRdLppJSk47
	 tFhoDOkVCJE6sU8kZzcBA+rN+/dtq4eOrJIVjqcu5sVoCTZ3SSli21WrZ8iuiAOSb7
	 eIPbMeAOUO6Tw==
Date: Thu, 28 Jul 2022 12:07:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Subject: Re: [PATCH v2] pmic: add mt6366 regulator document
Message-ID: <YuJt9SF9Y2UsA4Jc@sirena.org.uk>
References: <20220728062749.18701-1-zhiyong.tao@mediatek.com>
 <20220728062749.18701-2-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K08Z7tP9qKND+pgF"
Content-Disposition: inline
In-Reply-To: <20220728062749.18701-2-zhiyong.tao@mediatek.com>
X-Cookie: People respond to people who respond.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_040746_124096_9EA8285C 
X-CRM114-Status: GOOD (  11.14  )
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
Cc: alexandre.belloni@bootlin.com, allen-kh.cheng@mediatek.com, linux-kernel@vger.kernel.org, macpaul.lin@mediatek.com, lee.jones@linaro.org, hsin-hsiung.wang@mediatek.com, linux-rtc@vger.kernel.org, wen.su@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, sean.wang@mediatek.com, zhiyong tao <zhiyong.tao@mediatk.com>, hui.liu@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org, a.zummo@towertech.it, sen.chu@mediatek.com, lgirdwood@gmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--K08Z7tP9qKND+pgF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 28, 2022 at 02:27:49PM +0800, Zhiyong Tao wrote:

> +        properties:
> +          regulator-name:
> +            pattern: "^v(dram1|core|coresshub|proc11|proc12|gpu|s2|modem|s1)$"

regulator-name should be free form text for the system integrator to
describe the use of the supply on their board, no constraints should be
placed on it by the regulator.

--K08Z7tP9qKND+pgF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLibfQACgkQJNaLcl1U
h9AnIQf/Q5AoIqoBgnEB5s1BZS67mELeo51xpoptOVEWQfXqiDJa8lTnJzrku0d6
1fZLhpWjRSfFM9Ht51vxNhdAcS618Ffw6GMn6vI9uzS4ON/GU8lL76Gu8cyYlMrB
bn3SoS/1HJso0DCsm1onC1SXSlbc8mkLfvqDshGQuS9eePkHL8VvyVbbbT9Tg6YD
rWuz9+TeXR2kaom4m9CzK2MxCSAZbMPHH0tDrIJJ/v5DkedEUXb2H2UI5gYpT2QR
wCUSIfmhlfA7uM/jsI7JkPWN4JmQRGXlWdOGUJQp9ooYyZGIk5a17N5ZBrPLpRr1
9I5pZAYTM+1NDLmkBs0w6mecARZ4Xw==
=VTMf
-----END PGP SIGNATURE-----

--K08Z7tP9qKND+pgF--

