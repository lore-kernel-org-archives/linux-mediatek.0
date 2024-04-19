Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99790C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 11:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Mime-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vtm/qtvswOnFXXfebYKskz6/e32yJZ1ZzR1vI0Fp9dI=; b=4RUboPCjIQh08fOf2jeNxB3SMQ
	VGFYemUHdVyaCkxfSNVZOavUrRfgbK+Wl3CweziMNM12Lpk6U2GkdIuW+wBYRN4TzuGQ4sXLgfHyt
	IFFO/frUj1wpenSbKKD3LlgbgntbOnvYmifs6oWiPobd8vHqfbm0Jz2UF3U31nHAJEVJvKeqhl8M/
	tAfnHauZGodup7JFHMMBZqNK531XRtLdW2xhjLz7QqCXozNTmfKKfGX1zJjtZvPBQ8OqfxYFvxDR5
	Jsl4mD5mUeXrU3JKqBP/+4goqEZuXEdTOacC4iV7gFlrAVdT9agDUePHcpbmRUYlEBn/5VuBCK1MW
	IhKbqsVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxmdw-00000005V4m-2tIZ;
	Fri, 19 Apr 2024 11:43:00 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxmdr-00000005V3F-1kId;
	Fri, 19 Apr 2024 11:42:56 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-56e2c1650d8so1925394a12.0;
        Fri, 19 Apr 2024 04:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713526972; x=1714131772; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vtm/qtvswOnFXXfebYKskz6/e32yJZ1ZzR1vI0Fp9dI=;
        b=OIeKLKiWSvvRkKuMXCl0EVM0viugGcXhiZw0PS/cs6zlgahvKdX3etJo/KvJz+jM9n
         xvkdaRdvzMTS7bpYP60FeH1Rvxet/P6D/QRlub75Ytl9Q4RqOF6TjnnNbogEMHlF66Er
         Ew/gWD7GGbEnNKrjJB/FeGSZaeqQH08hinJWe2YA1EUb0RfgHZu5HZS5ymAXHzw5InLd
         LJ1hfaE+yZKFOfj/ud4PipUiSf6UMjc/3vE1F3NEJjdX4i/aZJ9xhokSjPAF98p5+ZEz
         OfCiZZkHT5rXvSCVVJJtIxMRubJVLyrGbzzR/UzEw2wweuNKbaJap88nM72C1+farpub
         cAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713526972; x=1714131772;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vtm/qtvswOnFXXfebYKskz6/e32yJZ1ZzR1vI0Fp9dI=;
        b=nnxMkYfXpeWjBldR7Kqrm9MkxXqIxuz+4dkXF8YbJoIMKjlieXqGopsCI9LkI4c2p/
         CgWqmAWiXel+OBS19xL63nY32/E0HcSwmJDTF9S/VkIoyTQCZd9lN2fxIflGhQy5SkhK
         PWhkuM20SxDpkjIbZcws/FpRSoWg3CQ93puVTrutUb1mxoqs71mQhFBQlpqnmBZ1ZXMQ
         vFNhAWLfM4De8VFzgwoTEzmSVGS2A53Y7d6u7qVaVFKntcmL6G89bRCy4A0iceT1vGLp
         XwzO20V366zBeERLXTJonP5Ngu8tW65BpkkSu+YWNGr6kfENktLvNocG3+uS28o0IiWc
         FImA==
X-Forwarded-Encrypted: i=1; AJvYcCUs5iAO/9SkdQHSMRZ7/0BKNPMw1bsOQGRprkMxOcl8UrgWvnV21lEo8XJa586DP6GkzVxtV0qFQKpFGQemvAUf0sxJiqq2M7cFgeCLj3prqNFA70HhOCdfhg7SkjpjT43XSs2/l52dphN8OtSLpRG36c9dHBwujw7dCjgm+ldkG+37QaijDsNhnzRj+1Be0BGts8dTrsd90pAaqcAh7Id9Nq320dtCuVDlOIV1L59l0Oxgu6WxA6nVI2CGyEFmyVNr8Qc4RO+MX80K1f/MY/znili1dBTtgvDxH0dMtc0qPTGHrr+CkEGPKA==
X-Gm-Message-State: AOJu0YzbiYlOLMDqC8Odb8baoev/5f2f1t5jPD9jW47Nk0VnJWGROczu
	zyombwVnhEJlNKA0M9WmyNAp+azCQCwpWH7HjQTYMiytx25qVkFE
X-Google-Smtp-Source: AGHT+IEwLsjbBwvBlONApjs+36NUlgAVIroqpndgR5Yohi7VmGBl9cWXP/CC/Cs/xZloP3RIelGMIw==
X-Received: by 2002:a50:a416:0:b0:56e:f64:aaf6 with SMTP id u22-20020a50a416000000b0056e0f64aaf6mr1348117edb.5.1713526972237;
        Fri, 19 Apr 2024 04:42:52 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id t16-20020aa7d4d0000000b005701f033da5sm2034565edr.79.2024.04.19.04.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Apr 2024 04:42:51 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=028f56741d52f91b0bec672921ccea60e74b58ce9c1c05854f65f7d060c2;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Mime-Version: 1.0
Date: Fri, 19 Apr 2024 13:42:50 +0200
Message-Id: <D0O2M756FW2M.2XMFVYGKJ1O7W@gmail.com>
Cc: <devicetree@vger.kernel.org>, <linux-rpi-kernel@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
 <linux-tegra@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-realtek-soc@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH v2] arm/arm64: dts: Drop "arm,armv8-pmuv3" compatible
 usage
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, <soc@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Florian Fainelli" <florian.fainelli@broadcom.com>,
 "Broadcom internal kernel review list"
 <bcm-kernel-feedback-list@broadcom.com>, "Dinh Nguyen"
 <dinguyen@kernel.org>, "Tsahee Zidenberg" <tsahee@annapurnalabs.com>,
 "Antoine Tenart" <atenart@kernel.org>, "Khuong Dinh"
 <khuong@os.amperecomputing.com>, "Liviu Dudau" <liviu.dudau@arm.com>,
 "Sudeep Holla" <sudeep.holla@arm.com>, "Lorenzo Pieralisi"
 <lpieralisi@kernel.org>, "Ray Jui" <rjui@broadcom.com>, "Scott Branden"
 <sbranden@broadcom.com>, "Robert Richter" <rric@kernel.org>, "Shawn Guo"
 <shawnguo@kernel.org>, "Li Yang" <leoyang.li@nxp.com>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Paul J.
 Murphy" <paul.j.murphy@intel.com>, "Daniele Alessandrelli"
 <daniele.alessandrelli@intel.com>, "Andrew Lunn" <andrew@lunn.ch>, "Gregory
 Clement" <gregory.clement@bootlin.com>, "Sebastian Hesselbarth"
 <sebastian.hesselbarth@gmail.com>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Jonathan Hunter"
 <jonathanh@nvidia.com>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad
 Dybcio" <konrad.dybcio@linaro.org>, =?utf-8?q?Andreas_F=C3=A4rber?=
 <afaerber@suse.de>, "Heiko Stuebner" <heiko@sntech.de>, "Orson Zhai"
 <orsonzhai@gmail.com>, "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Chunyan Zhang" <zhang.lyra@gmail.com>, "Jisheng Zhang"
 <jszhang@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>,
 <linux-fsd@tesla.com>, "Michal Simek" <michal.simek@amd.com>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240417203853.3212103-1-robh@kernel.org>
In-Reply-To: <20240417203853.3212103-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_044255_496814_BAA14EE8 
X-CRM114-Status: GOOD (  12.01  )
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

--028f56741d52f91b0bec672921ccea60e74b58ce9c1c05854f65f7d060c2
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Apr 17, 2024 at 10:38 PM CEST, Rob Herring (Arm) wrote:
> The "arm,armv8-pmuv3" compatible is intended only for s/w models. Primari=
ly,
> it doesn't provide any detail on uarch specific events.
>
> There's still remaining cases for CPUs without any corresponding PMU
> definition and for big.LITTLE systems which only have a single PMU node
> (there should be one per core type).
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Acked-by: Sudeep Holla <sudeep.holla@arm.com>
> Acked-by: Dinh Nguyen <dinguyen@kernel.org>
> Acked-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
> Acked-by: Bjorn Andersson <andersson@kernel.org>
> Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Acked-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
> SoC Maintainers, Can you please apply this directly.
>
> v2:
>  - Drop QCom sdm630 change
> ---
>  arch/arm/boot/dts/broadcom/bcm2711.dtsi              | 4 ++--
>  arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi    | 2 +-
>  arch/arm64/boot/dts/amazon/alpine-v2.dtsi            | 2 +-
>  arch/arm64/boot/dts/apm/apm-storm.dtsi               | 2 +-
>  arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts | 2 +-
>  arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi     | 2 +-
>  arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi  | 2 +-
>  arch/arm64/boot/dts/cavium/thunder-88xx.dtsi         | 2 +-
>  arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi        | 2 +-
>  arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi       | 2 +-
>  arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi       | 2 +-
>  arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi       | 7 +++++++
>  arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi       | 7 +++++++
>  arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi       | 5 -----
>  arch/arm64/boot/dts/freescale/imx8dxl.dtsi           | 2 +-
>  arch/arm64/boot/dts/intel/keembay-soc.dtsi           | 2 +-
>  arch/arm64/boot/dts/intel/socfpga_agilex.dtsi        | 2 +-
>  arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi        | 2 +-
>  arch/arm64/boot/dts/marvell/armada-37xx.dtsi         | 2 +-
>  arch/arm64/boot/dts/mediatek/mt8516.dtsi             | 2 +-
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi             | 2 +-
>  arch/arm64/boot/dts/qcom/qcm2290.dtsi                | 2 +-
>  arch/arm64/boot/dts/qcom/qdu1000.dtsi                | 2 +-
>  arch/arm64/boot/dts/qcom/sdx75.dtsi                  | 2 +-
>  arch/arm64/boot/dts/realtek/rtd16xx.dtsi             | 2 +-
>  arch/arm64/boot/dts/rockchip/rk3368.dtsi             | 2 +-
>  arch/arm64/boot/dts/sprd/sc9860.dtsi                 | 2 +-
>  arch/arm64/boot/dts/sprd/sc9863a.dtsi                | 2 +-
>  arch/arm64/boot/dts/synaptics/berlin4ct.dtsi         | 2 +-
>  arch/arm64/boot/dts/tesla/fsd.dtsi                   | 2 +-
>  arch/arm64/boot/dts/xilinx/zynqmp.dtsi               | 2 +-
>  31 files changed, 43 insertions(+), 34 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--028f56741d52f91b0bec672921ccea60e74b58ce9c1c05854f65f7d060c2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmYiWLsACgkQ3SOs138+
s6HVMg//Z1vpOVfPGexT+l41R4BiEbrkDCVeBZnbDapafPEWSkvhzVK3ncQk6yUO
y7l7yTq0l1PHP6Qh8orKSY6xO/Ui6eLRHnpIXJMhSj0l8hfPEYeiRlc8MSzEWhMH
ame927kd5iiRpnjhVpRVhthE/gwH8diAIvay/Rx9PULbdsQvF8YsWAPff3+AFtVB
mBz41wbhUOjDOhIW96UmbH8dwkfse0fNv5sYCuLvS1NtkvUIScL6TYHwTazMDYz0
npHZJ8XNjGttSj7QCuSGoC7chz4GB3LKTcvYWIvL9he9wxN/CQX4BAFGqv0mx+nK
FyU9Pva3xbjf6S8f48LhsIa2hbkhhET9km3FLZGftAkYivkD+0wBPFRHo8DRBx4P
p9Lbo4mpG4QTPs1UV0bvglTGlBXW5YzZkuuuc0P2eMFAkpS4SVZXNfjPzKoSXqA7
/PWBHccFqXCo64zLeJ8Ls0zhWBfC86BRQquxy/HO+WgsWdDjYNTrjp05bZ+QKkr3
CjmyXxWDg2ANMnZB/o1Z1Q0B3t2LOou3diBKCp9ez3Cr1oKnarzM1jOZXS8ahnof
ujUahheBul/NG2JO05EOV6BOabip6CrXH2B/NbfqjmYZM24kTJ+n6hBRcx07/6HJ
9ARHNqLTLCFSGnbml4wZ68W8+bNiCXuB2BYKniHguyk+zpu5YMw=
=sTJr
-----END PGP SIGNATURE-----

--028f56741d52f91b0bec672921ccea60e74b58ce9c1c05854f65f7d060c2--

