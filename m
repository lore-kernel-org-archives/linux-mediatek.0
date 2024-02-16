Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69105C48260
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Feb 2024 11:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Mime-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PLhCxXeXfTy0oKV1PZq76pGTpwbsrb7RXVp5Ag35IfA=; b=rhInSctvQOVOzppVyT+bA1kndK
	RSxeLrVY0RM58o0/oU4zZNe2g3Lah8ZMDdJld78KImmElp5MW3l/YWj2DfRmW68E00PgtTQdKw/z3
	5xfG23hpyRz6UpnfV8CNIARrDknj43oRAjkoXL/MxuhK3LZizYE7aNMIGqUC8tITiHy/4nUUiGKy4
	X1RhM/lCqyMimsbZXx9PGrqaj4hSiTt81y2P4ROZOw4a50OYs506QnR6mQzeP4NI81qCEcTcWMBZe
	UEE3pGxJ3TycvKs7VMcHAs0u77brwookhIx5N5ka8kTcmDoQ/20bulAmErOE8Nfe5D5Ir4RrqgrhK
	0V50s81A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ravxB-000000022oY-2mvN;
	Fri, 16 Feb 2024 11:00:25 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ravx8-000000022o0-0w9K;
	Fri, 16 Feb 2024 11:00:23 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a3d82926ed2so76060866b.0;
        Fri, 16 Feb 2024 03:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708081220; x=1708686020; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PLhCxXeXfTy0oKV1PZq76pGTpwbsrb7RXVp5Ag35IfA=;
        b=nVznd8xVtdIQg72RWao7EMDdAQCOQyb0GPVayN9EDEBWibmD0vYxZfef2FmG+/Wk+9
         8+TS/0PPB7jDReAx3McZFY/yswYqbnhPtgVayRS8KX2z0D9kJ+zRQGM2boClYfDtbyyX
         te5Jhs7p27wIBCAAQR7anHUtKUck6pulUHYmcmpW1qfbvj7KU02JCBavDQWQXAHUTPAA
         TMR3Z+O6HNIuFgcAnpi54fATAFS/Dbm9u0acOT8/uQ+UUzBRDrn31qP/OBkVCmkBwoZ1
         IY+LCI8JM61WHXc8KZ99B9Gsz2y5MqlzzeE+vNE/gDWP7R4iHEeyr3YO5OWkq9NLVmkU
         AyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708081220; x=1708686020;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PLhCxXeXfTy0oKV1PZq76pGTpwbsrb7RXVp5Ag35IfA=;
        b=PNOQsAixyjI3EfR0HUD6MklDkZnJVqnK8dMSkdRzuvkGYzR/OxgMLOhL1u7DthdoSM
         AuczaLUXg2EWyibSwgLr+ou4nIwgofffNaRinVEaurWxL+3jn6+Q75b7EQEAgwIfagbT
         xff1DMfzOkbRI/yNJrVTApDOkLPSM2L6nZbJ8pmb2ee7bL2Y+fUZlFb7AEczRocz+OjJ
         BuLJZiOMVbopM380CbVhEV9Oek1WrcvyFDoLxw9jLkc7pw25Exd4f2AOv2dn2bZzzmxk
         c6eGCGneuXhtyUZT4hBW4Isp+ivtKtOhQt11rYb6dSWZYCEq7jYKjY22lvixQIJkUV3x
         pXGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqcxI78fbWHEGk8HYGAGctVz+sJ1VmY/lbyaRdlwm4myZNEpiTacUGRhIb65dq4Q62NXcHPAG6y8LAYa6i7t3SIw7zlM6VqM6PdFdpXjms2YBy
X-Gm-Message-State: AOJu0Yxq5y+U3zCSeLKWfXjoF8mq+++mbPcJZ7H5oss4X9+WhWnTCAck
	6PGzVAPBVrL9keRrK2Y+q41rsUxJPkPOdyc3EMydHW1wNLZ0KmPe
X-Google-Smtp-Source: AGHT+IGJg1U3l1s0cZ7SNrJJLULfB++IrJsj8RGS0gGWbyw09mvwxmMXattq7dTy3fEu4mQVbz3vaQ==
X-Received: by 2002:a17:906:46da:b0:a3c:f6dc:ea46 with SMTP id k26-20020a17090646da00b00a3cf6dcea46mr3038631ejs.49.1708081220098;
        Fri, 16 Feb 2024 03:00:20 -0800 (PST)
Received: from localhost (p200300e41f147f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f14:7f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ts4-20020a170907c5c400b00a3df003b6a9sm219235ejc.119.2024.02.16.03.00.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 03:00:19 -0800 (PST)
Content-Type: multipart/signed;
 boundary=3f4d0b1f359aea3b19397b20b790a1177690846d9dafd4c758ed6e868b5b;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Mime-Version: 1.0
Date: Fri, 16 Feb 2024 12:00:18 +0100
Message-Id: <CZ6G9AYXMMHZ.3ABQKCJUHPSLU@gmail.com>
Cc: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
 <openbmc@lists.ozlabs.org>, <linux-tegra@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <linux-omap@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH 2/6] arm: dts: Fix dtc interrupt_provider warnings
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Rob Herring" <robh@kernel.org>, <soc@kernel.org>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "NXP Linux Team" <linux-imx@nxp.com>, "Rob Herring"
 <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Tsahee Zidenberg" <tsahee@annapurnalabs.com>, "Antoine Tenart"
 <atenart@kernel.org>, "Joel Stanley" <joel@jms.id.au>, "Andrew Jeffery"
 <andrew@codeconstruct.com.au>, "Ray Jui" <rjui@broadcom.com>, "Scott
 Branden" <sbranden@broadcom.com>, "Broadcom internal kernel review list"
 <bcm-kernel-feedback-list@broadcom.com>, "Andrew Lunn" <andrew@lunn.ch>,
 "Gregory Clement" <gregory.clement@bootlin.com>, "Sebastian Hesselbarth"
 <sebastian.hesselbarth@gmail.com>, =?utf-8?q?Jonathan_Neusch=C3=A4fer?=
 <j.neuschaefer@gmx.net>, "Jonathan Hunter" <jonathanh@nvidia.com>, "Stefan
 Agner" <stefan@agner.ch>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 =?utf-8?q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, "Tony Lindgren"
 <tony@atomide.com>, "Chanho Min" <chanho.min@lge.com>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>, "Linus
 Walleij" <linusw@kernel.org>, "Imre Kaloz" <kaloz@openwrt.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@linaro.org>, "Masahiro Yamada" <masahiroy@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier"
 <nicolas@fjasle.eu>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org>
 <20240213-arm-dt-cleanups-v1-2-f2dee1292525@kernel.org>
In-Reply-To: <20240213-arm-dt-cleanups-v1-2-f2dee1292525@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_030022_286104_54102174 
X-CRM114-Status: UNSURE (   6.41  )
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

--3f4d0b1f359aea3b19397b20b790a1177690846d9dafd4c758ed6e868b5b
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Feb 13, 2024 at 8:34 PM CET, Rob Herring wrote:
[...]
>  arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1.dtsi      |  1 -
>  arch/arm/boot/dts/nvidia/tegra30-apalis.dtsi           |  1 -
>  arch/arm/boot/dts/nvidia/tegra30-colibri.dtsi          |  1 -
[...]

Acked-by: Thierry Reding <treding@nvidia.com>

--3f4d0b1f359aea3b19397b20b790a1177690846d9dafd4c758ed6e868b5b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmXPQEMACgkQ3SOs138+
s6F44g/+KPT4RF0vNadKSFIV9/iihK84gvvjHc/8S/+Ks+sJw7//4Zws8JtsGdab
UvvmQ8R5uIrvLpONlnmdl8cjWpnA3OV1VMJRgXeYIR/kKZxuoiZF03R8COiGQvfJ
Cf4mq2od1sc4OOIFxTV0KJfp6XbmI09stW6zm5wk1F5CjbnMD0TTgxQhEAsOLfum
aDJefFKp6T8QOlCQhCeYYnXwUIBdoYs7z+SRXBuJWJvgwdPMnyc4M7/5PtW57UXZ
Vn2Hri2+u9imbcIzSUkrPLev1Kg5sWTF7CSICzmA+jTvHQUAZFQQMyjrGFkFTeI/
g/J4ljpwRqBlhXRx5ioNbGqYmptZvuljjH6bT8hDzTRNPdfvZfKJSX2+wWb5+kM7
/CdKfwORAUgMMqqABa4mSxHys/mmyeLJ2idQj/buql4pC7EpgD7SZRadqnaAkD/S
3zxA6VBVq4Jt+6X3kjgGySa0tUyBMSWydLjH/TTkcZtwu8iEEggp7MxiYA2wJhne
Pf5VjnhX5nLnPJuJn/Av5GHF1jvsrt9lENJTmpLFZIzxhxWrPntynrvfbpAV50e3
eWqEDRu7eWFatZNZTrnRhmOHcGO197HIErp20X4PVISOY0uolzuiHFpjQBCUGQdV
1xaTRZPbjaTB4pcqWNxi+mI4M6jIyDJc6COrC2G9t5GYMcbE6W4=
=HY7z
-----END PGP SIGNATURE-----

--3f4d0b1f359aea3b19397b20b790a1177690846d9dafd4c758ed6e868b5b--

