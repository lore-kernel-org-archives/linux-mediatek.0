Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BA0C4829A
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Feb 2024 02:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ovBI+uozlzSNIPcQOV2IPQFi3mWSCogjgpUAT5X2LTg=; b=EBaP9ZwlgPku2/PnEiDCBJnqxR
	/F2M1AMXiD40VZn6qY2kz8yA2kACQqniu5aPb1iJLudilLzsxK/CYXw9Q/RekCguftTeH/Ff3iR9N
	pas7EnYOWXnhs63ag6Rracnyy4SDVIZ0sv1ZM2WBvmpmBCgSEJHh7yWEamSOG6HFXHVQLaOGjhGss
	T23mYB4iAhfmjsJF72MGdpqpPCZCBe72flihqyJybhDHhh1PH5viUA543ZY3cxpBOfqsTJ+m++nzG
	h/Qtybb5Y3UAEGkoBraJi4TGA97oMSHAe/XY9uVLFWbbUWO6juYA43bXMOeyFXhP7u/A04dvD8jAC
	kugUlTuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZM5H-000000048vq-15fn;
	Mon, 12 Feb 2024 02:30:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZJki-00000003bZS-2e8V;
	Mon, 12 Feb 2024 00:00:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ovBI+uozlzSNIPcQOV2IPQFi3mWSCogjgpUAT5X2LTg=; b=F8jD8vc77kgURvIb3sD/v7vOA6
	aUd3yg83kxScU4XXPIjAxL6ZDb0NesG+IGGMqb57P8YnSw6IjNSE7APgrLpq2Q9hP1+7DRF4bNWU6
	0TjVwBNFtnbZYsNSA7Btj006x/3vfN23UXX4cEkeUniI5+GFskuNKkWGa/3S5JvoZ9fmiaAB5EdRH
	vzvTG+St07D1cZOG2CZQgaJTCzPQlckj3xTMGq9r73GaEaSVUCPp9doa0RV8HenNCt4/jGTP1u1Zy
	xA+TVgtr9/F6YpgxyDrRmy+nhSDk6gS31vCKmS1OAkzagMY/hcBlqhYZt82m8f2YEBQidNx6UwjsV
	T0Q3Uk5A==;
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZJkf-0000000F1nd-2BAA;
	Mon, 12 Feb 2024 00:00:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707695668;
	bh=ovBI+uozlzSNIPcQOV2IPQFi3mWSCogjgpUAT5X2LTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H+aK+zcLH30LUeJMhwmJsA0Psgi+FXPI4q+bHJ7MFBdJs8ZO3E1z0CPnGjMQb8sgE
	 7CHm+OZrCOQBfvElIJc8gUU5g+8oaBQx1QLUq0kaMZeFgcSkTnjZUkhifKrj7+SvUM
	 GyBZKh6Q24TXpJX6vUJ6eGWO7zUEtQ3k+65zWOipU/sbO2tBa9Our5TJ2BPxd/ngi3
	 M16lKM2Sgl6+enOKCEWDOVtZYhsa22vJnGEKBTvZUI5iFwAkfsPx/vp+KpX2iI9s0M
	 EqUFBLiqysTjsNawf1tpjmkjrFFGM11QPV1gXpb12yUlQHrsRuSY4ZH335xLEjZZ12
	 UDyfbKrlNdpVw==
Received: from mercury (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id BEC6437810EF;
	Sun, 11 Feb 2024 23:54:28 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
	id 370D4106043F; Mon, 12 Feb 2024 00:54:28 +0100 (CET)
Date: Mon, 12 Feb 2024 00:54:27 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Andrew Davis <afd@ti.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Cristian Ciocaltea <cristian.ciocaltea@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 00/19] Remove pm_power_off use in drivers/power/reset
Message-ID: <iinovq4p3dn5pic6ipptqzi3minqz5dznfdzhzl2onttxb325k@l7bhoiibsxkz>
References: <20240208170410.67975-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vsdi4o5bg7tjzwfb"
Content-Disposition: inline
In-Reply-To: <20240208170410.67975-1-afd@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_000049_740192_C0FAD790 
X-CRM114-Status: GOOD (  10.71  )
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


--vsdi4o5bg7tjzwfb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Feb 08, 2024 at 11:03:51AM -0600, Andrew Davis wrote:
> Use of pm_power_off is considered legacy and should be replaced
> with register_sys_off*(). Same for register_restart_handler(). Do
> this for the drivers/power/reset subsystem for all trivial cases.

Apart from the issue in patch 18 the series LGTM.

-- Sebastian

--vsdi4o5bg7tjzwfb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmXJXjMACgkQ2O7X88g7
+po+tRAAgCDIMC15ePLlQVTIKQd+OyONaoHDs6t6lhLgu8eFavGhqI0XqMvogDuP
hHbpzhPxUZP2+P+Sl7h8o/mKhujuR5YZymX3F+gP6aM7Wj8AWaTqSet4hvFxR/Sx
4xYY9gYnWAdPHuR+g9qwVZk5qPeNTwh5bEqGSPDl6hzyUAAG+DIa4652XAgF7xc4
QCcj82KH9g/+DNq9e1NDmIWY6bcrdSVH9UeQHzZbjlcmykiiKdtE35//hVS4nA7Z
dMNgh4xxz86RLEId4mqPbacv9jaNJmAAr/DEiEIwCsv51rIHPNEfHejR8C1Yowlh
9+u5AOJD/Dj1UlACIWBgoz/LYr3rxEX6vQxJkQq0L9QaqpeUwCYLGpxgF9DunAPx
86juxqF4keF/bxpiuDVsMh2hGPxbzf14MysCDF8cTuzR2rBUdUNUxZL3XVXKtmug
QIswLHjRiert6xEvEThVe/V0wd+Ts8Vd9NTPIP2+zWaagdGryLsQbmOxXJdpjzgT
IpdagnQaw8zOUqPLnI2WA1gLy0fTDttMoVtp63iE53JXSE6EPhp3njJiCCKg32js
URuI9Wr1hBs08KtLRZOj2EtREz+McEWKLJdBG0jsTS26zv1UHH2NB353nC2K9v82
fzHvACBM4kCbVyg5anS0GDmz5x8eddiJOcntikHGtYaVlKIF614=
=UK2f
-----END PGP SIGNATURE-----

--vsdi4o5bg7tjzwfb--

