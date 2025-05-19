Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0A6C2D0CD
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 May 2025 15:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DaQWvWsw3oOgXKm2fONwUyOY8e59GUzYmRtivJS0iws=; b=hmvkJ5vzm9TBJo4wOlkNDcIynN
	MGsh5yRffU+3OQ0QDRuUoPhVhgFqMIBn+wBlE0FG7c+3PGx4WQxjFbN1X9o1psSgWmA0XSak//xIl
	3xU20KKHaun5RP64RslAJKnBzITDCxwtDOd/kDF3kiBQhroii+pSq/G9mMaZvYVCqrEeIUTIiOYoi
	VN23ZyEeeLrGdOn0oh2Eyg5rTLWBBTiG3wAkJi91M5vZaTn1nTwsjiK1i2BGQN8BtyD9xVTgy4+dt
	OkwI3iST1t0FpN9ASEm055ueCtvMrzuAynWqpM5Anp5Vkabf6cHNuNBesO9BNR9lYnO9YtYgmxpG7
	j0Szzk/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH2TF-00000009cox-2AA3;
	Mon, 19 May 2025 15:32:05 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH1mJ-00000009Une-3yKs
	for linux-mediatek@lists.infradead.org;
	Mon, 19 May 2025 14:47:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=DaQW
	vWsw3oOgXKm2fONwUyOY8e59GUzYmRtivJS0iws=; b=Oa2i8hLGt0Jdgu81TAxR
	42Sq/n5Fy06uXNsziux+wldXdqK8G8Z80rUrQNuT+3gELRNOV36sDV4bOgtcWFQh
	WbtOMLrjM7t15wXZOZGj2mmPwRKmvpu2+zfGlbhbsoFIUsdd+G4+5ABdYKF1nVCn
	7T/xLeRYiPSx0ZpyRsIPHve6rda6mcFtludrKaa4PHiNj4F2AUcmMx5oVi3zJrp1
	mu7hWjngUZV4Zm/vwcgGsj8VzBCyLNjjOQk7bm1s8O2gjN16+gLSZcN3cthfmLlK
	klzN7Nm/6Isc29qsKwJvByK1Bt0iBEM4smkLBBvfsSVe+gJqoRJ7qdwld5sGuLry
	EQ==
Received: (qmail 2526926 invoked from network); 19 May 2025 16:47:34 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 16:47:34 +0200
X-UD-Smtp-Session: l3s3148p1@veEiNn41guhZz6uL
Date: Mon, 19 May 2025 16:47:30 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	loongarch@lists.linux.dev,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>,
	WANG Xuerui <kernel@xen0n.name>
Subject: Re: [PATCH 0/7] archs: use proper node names for GPIO based I2C
 busses
Message-ID: <aCtEgg55uuXQ87HP@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	loongarch@lists.linux.dev,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>,
	WANG Xuerui <kernel@xen0n.name>
References: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdUOXZOe++Zpk_fGnPuGtQARN1fLQvTr0YX108OzZi4YmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N7Vk71n9RCcoPa7f"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUOXZOe++Zpk_fGnPuGtQARN1fLQvTr0YX108OzZi4YmA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_074744_257756_F2B48AA0 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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


--N7Vk71n9RCcoPa7f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Hmmm... which of these changes affect the R-Car board? ;-)

Right, in this series, none :)

> Am I missing something?

I tested another series on top of this series with Lager. After the
EmbeddedRecipes break, I forgot that only the next series affects Lager.
Sorry for the confusion!


--N7Vk71n9RCcoPa7f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgrRIIACgkQFA3kzBSg
KbbgVRAAmUME4MmnnZpUQF8oA9Puxa4+zkHCjVgbOIgusPPh2aR5/c0/7PUXw2Bx
ukaYwg8/xwbBBinpd9xhp1DmqZGsGGSJO5XLiNKrX6OBBaMNZpd4v5Ei9z8E4UJL
UlVumquQLHo1ZDXbOfcDNkMfUrNnX7TtnZ0c30giIbm6nonKr8s+QYV0q7lC/DpI
Oltxl6kw1P/dWfnL2NJz5TyspBwEIHcocL7D1PIIfvtZEgVQnHSZFrh6fQBpcX4F
54FtZCi9DDbf0HZm9EfFzz3ZwRIZlzRW1Y9tgxl2qpX2Qp7jAM8wTVt10o4l4ETp
M7tnC4Z1Kuu8H49QB/LjJg3QzJbwbxpEFXATgxtu6AzlkNx/IiNXWalPyfnSu77v
ZOMT0GEooVmBZQsDZdOhW5MlPHkOZ2J5CSaGL/OvuFv5yU32ptbpaIbg2zrz8TCa
k80QJ6g6yYIyWnYYWW3qOMlp3UFBecMKI9ySmCdrgJBFA/1dPeaj2oaS/QcTWMh9
ZF2/zsYXssh8d3RBIUeNSXjkPtqa25SQkSadSMtBp1qnf7krcS0BaYwKcFFEmMAL
oxBozBVc2c1cTc5A0ASRTNBObEw6GNwm117KzDjFvKaToLfpJjh6miCw7u9VDYV0
SwabTA88Llt75S083kfsEK4rmvosJnLWTNuClppH+ziwVhboPa4=
=DyAR
-----END PGP SIGNATURE-----

--N7Vk71n9RCcoPa7f--

