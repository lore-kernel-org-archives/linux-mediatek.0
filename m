Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13BEC001B0
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Aug 2023 14:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BoGZL15qINg92iX5GzpIYjPkRrdnPmg9jKUou+Jzouk=; b=eAKQkrAEI2LcwBD89ttkIu3rLA
	zq+8/xmIX0R3slgneTtwXI2N5mHWcTydARyBhS+otWCbin8E+UajrnRFPU3mMJ9tis4zdLSBAEAXN
	NG7SkSRE5SpRYNcf80pYteR1QnXVnW6ReO3FvGtJ4f2ogfKvSGNZJCx7NsJ4TWsfAhASyuEgNO/Uj
	CgwbzTNgQmdHxDrcEtOeU0Hk/EWnlpflmeetAfOmm2Nrx0FpeAHWbg50Xng24aAbm8czFE23IWxS7
	REMXas/Untz46cT3dWiHF7mn4CZONKPoebm/mqmlnLQa1G8LfBdsOkVVG+gu0xHQO9sBg0d4h+vHy
	r8ob6iMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTNbs-002jyD-14;
	Tue, 08 Aug 2023 14:22:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTNbp-002jxE-0Y;
	Tue, 08 Aug 2023 14:22:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 98ED662561;
	Tue,  8 Aug 2023 14:22:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38757C433C8;
	Tue,  8 Aug 2023 14:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691504572;
	bh=BoGZL15qINg92iX5GzpIYjPkRrdnPmg9jKUou+Jzouk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ta/lRXrtw7X135/22WFEcwjVzLrKE5yQB+5gr7xclahM8A9Lueh96MhshT1fVEA8b
	 bNRgDfCoOVe02L4toTo6oFg/cmFPOwr8V2T9MIUu7RoMDvOqdZ/0DjTDK42ClIXNQn
	 rrygqvHN9T4oZx0Kly93o9GAYfwITMRnQ+MS09+UlSg9/I7osHpOma/SgFUenCYOzC
	 A7IiZo+EdzWHW6AV8IVvppp98GQoI5WoIjnUi9E+VL/184Jwd40frtCo5eJtQOF3qs
	 1cU0Wk2ukrPW1rNLCjnf60SKUjUg6yiYlZa750yuW+PIEaI8vx4I6VlQrlfG3oZkln
	 BRCIdj0t21C3g==
Date: Tue, 8 Aug 2023 15:22:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Tony Lindgren <tony@atomide.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 04/11] regulator: rk808: Drop useless headers
Message-ID: <78af1ca5-12c9-4c12-a08d-6ce2df29ff60@sirena.org.uk>
References: <20230808-descriptors-regulator-v1-0-939b5e84dd18@linaro.org>
 <20230808-descriptors-regulator-v1-4-939b5e84dd18@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="02s0islE/xNt6q2j"
Content-Disposition: inline
In-Reply-To: <20230808-descriptors-regulator-v1-4-939b5e84dd18@linaro.org>
X-Cookie: Beware of low-flying butterflies.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_072253_252310_C3625097 
X-CRM114-Status: GOOD (  12.54  )
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


--02s0islE/xNt6q2j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 08, 2023 at 03:46:31PM +0200, Linus Walleij wrote:
> The RK808 is already using the proper <linux/gpio/consumer.h>
> header and includes the legacy headers <linux/gpio.h> and
> <linux/of_gpio.h> for no reason, drop the includes.

This doesn't apply against current code, please check and resend.

--02s0islE/xNt6q2j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTST7UACgkQJNaLcl1U
h9BCWQf/f1t9dZeSv6IT+0vb+00EGsLxELQMnJFIxNYkecL+4eTfiotF+Xg5YzH/
4dEUdEx4lsQOrH4mCYLm1ndKhwFLTCC1ElqJI4rmdvDeMePJXUCbndA/qz/pNOwc
cpUUqlCBr5qhP35uksyfRyYkk9gclBGhbEQ4xva3IewZCq4UiL6FiW8zFw/MHbc5
/LI9IdCzBPbgmI5cw3gf5D3u7dxkgz5BKKditUYJ5gE+3f9Jnk+g13cZY23idjzT
wIWe+RH8yjoUdA8ahzLJtR47zZsNeas5mhLncA3jqFVD+XafqKzubgtqa9JNcWj2
to9N+Oej2TNpi7y/5AuwJ6BCp+AzbQ==
=1iIc
-----END PGP SIGNATURE-----

--02s0islE/xNt6q2j--

