Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33606ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 18:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/EIB0lD91u5m+75yE4pCABtLPo/3hXJozv3DCGaJfOc=; b=vbjlyT5EcEkxufB4FUysnXuVMk
	YVhSxiYN9m/Z78PqXhC0Eh/qzWv5VQmehueFMACnW8IY0zijRz99dMDAkIldU71QEE38kypAAe7i5
	Ga3SOKcZZHcDSC++InfreThwr5PINpAN2lDkE5jYrRmZ947+dz9Emak4MJCKU1vKSFVTFIzi66iQp
	jY4reJCFYNOYO4TudOy9c3i4o5ka9vN0TyImLrjn5Fpn0N0CIEsj73MbqpJk0hPGf6AX5ZB5Vv79D
	xQNT0VNq8JKghhDN/wzhZ0P0/6ZZRLNV+ktu2d3BvGVvVwzE93AmSGvE6WqLoJ9nd+zE642RlMhOk
	ZWDFEdqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooULJ-001hDX-Qv; Fri, 28 Oct 2022 18:44:33 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooUL7-001h99-A6; Fri, 28 Oct 2022 18:44:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1BCA7B82BAD;
	Fri, 28 Oct 2022 18:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FA66C433C1;
	Fri, 28 Oct 2022 18:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666982656;
	bh=B3JwPgDF3f7ACG62Nwjw0J32bbbGD43RnJnEc3pRdBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H7TzOea8j+chWb+NPhAXFXMuJIUbfoQGA5xIXvtR9de/3ZjdyeuVcSWkS6tDwYYY3
	 qRupdmLzuYflNbmmJPaOI21mmOkrem0z3Bw03MwWu+ZAFoYs0wluwuziFAfxw1m0pd
	 HD4ZanIHx5uA6xKdRrs3S2FKADSBE9aPvYVW3XGJ/qQJfNVraEZ0ODTClQkLxwkvQW
	 uszkcj86aDAjZgZdiqQY+MtT9GFSG26nl7eu/w6+0dc+sphAOsA05Z666nkZNzVLNd
	 xCP/5Moti05BLYAjVnaG5JYKbRQpc4Gsu5GRFZkMEFwHLfHx/+AGfS9eoc/r3KqnpL
	 ZdANUAnkZiTpQ==
Date: Fri, 28 Oct 2022 19:44:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	linux-mediatek@lists.infradead.org,
	"chunxu . li" <chunxu.li@mediatek.com>,
	Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v2 1/2] ASoC: mediatek: dt-bindings: modify machine
 bindings for two MICs case
Message-ID: <Y1wi+g9yVR+++iIg@sirena.org.uk>
References: <20221028172215.1471235-1-ajye_huang@compal.corp-partner.google.com>
 <20221028172215.1471235-2-ajye_huang@compal.corp-partner.google.com>
 <628ac98c-0755-e6f6-e010-f1e772c4b71a@linaro.org>
 <CALprXBY8FUc_w=JO3bp9m1e=1d5Fcvrou_En1JG8Hx0BYuETKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I1UEIiYQUOnwfuPx"
Content-Disposition: inline
In-Reply-To: <CALprXBY8FUc_w=JO3bp9m1e=1d5Fcvrou_En1JG8Hx0BYuETKw@mail.gmail.com>
X-Cookie: The time is right to make new friends.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_114421_524576_B899AFA4 
X-CRM114-Status: GOOD (  15.14  )
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


--I1UEIiYQUOnwfuPx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 29, 2022 at 02:26:30AM +0800, Ajye Huang wrote:
> On Sat, Oct 29, 2022 at 1:58 AM Krzysztof Kozlowski

> > Switching how? Enabling? What is the meaning of each GPIO pin value?

> I think I should add more like an example,
>   description: dmic-gpios optional prop for switching between two DMICs.
>                     Ex, the GPIO can control a MUX HW component to
>                     select dmic clk and data form a Front or Rear dmic.

> Do you agree with that or have other suggestions? If do, I will send
> the v3 patch for you to check, thanks

There was my thing about putting the names in DT too.

--I1UEIiYQUOnwfuPx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNcIvkACgkQJNaLcl1U
h9Cpkgf/fVls3aPRMwD1mG2Hu2WQAUaJSm7fMJ++/Hu2yFAAiM+ywsOOetAk/VoZ
A5aHmyM3TF/3vuWQ+WPMUsbB/EHGCpM6hAyc277lPmd16RIza/jFt9jah3yg0Zfq
i5iEny8ZHHp0ADd0i9JCmKd9I2AFxcALnq8xKWWCZkJ9YNm/BkkXegfxx8mBa4DM
f+cGJEHyVaoHCmB1qb4okE4ZK/JUEcrJmTaC7YmggqSwS5T7bzxjy2WmCUMKakst
4cqXghPz6QglCvL4VEuFDJ4AMCKXhzDQJEJer17YeYZYnGE7Aw0w0ovTyTueQdKQ
rOPijK+3ijD8mH2K/+WvelcMadIzmQ==
=fA2V
-----END PGP SIGNATURE-----

--I1UEIiYQUOnwfuPx--

