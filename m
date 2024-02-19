Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54C7C48BF8
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Feb 2024 15:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Message-Id:Date:Mime-Version:Content-Type:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tiqLc5KdCmtjYQt/eIFsjHHh0iB3V/zgzPhPHivKtAs=; b=kZDE2bNktHY5WDSGYu4Ogloy/D
	uc2bcmooyyfsxB2UU4US9X6PNYkmwvb/cFA/LCrXOVfKe5fwafLHWo0JaYcnW9ZW0SHjs8emZ4k3l
	+lN+QcCwNLnztfsW941yOG1NvlVM6KJmxtBfhFzsMIlNLASqUyryxHwEMBFerm/YIYM6lW+TxkXaW
	vdnbL6MPkDFr1znT+9oGhwG82bZ1gilBaTmQSbdJxU6FvE33R18D7MreP/UtzE50c2mzPWUSnLG3+
	jLJRBxnnno3zGDhmfQVQMeXilnwXm+3dxg+tbm1JXS4IKhwbR1wwRSVK2gk1nRBpziOu9q3ncKRlC
	xHPWo83Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc62L-0000000BEYd-3p5u;
	Mon, 19 Feb 2024 15:58:33 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc62H-0000000BEVn-0Y3f;
	Mon, 19 Feb 2024 15:58:30 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-563d56ee65cso3956372a12.2;
        Mon, 19 Feb 2024 07:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708358307; x=1708963107; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:message-id:date:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tiqLc5KdCmtjYQt/eIFsjHHh0iB3V/zgzPhPHivKtAs=;
        b=c+PPF1D6kbyAFAvHpE9KoiVY6WzOTCadGla2QtCuQdBNl0zv5ubOZmIz9CphfZst5+
         J2ue31TE9f9CxqBouriUiu3OR1u2ehqH76W85Yw7nw9AdoXPqgqc3KHtLtmWfHkNp3cJ
         zTn5RTwrhCOB78rKWmKmcAni87k/0nOndR/TLGunuznjPPS5Th4+GXz8uBC5Qk+dnifN
         tA6WcSwdGjKO2iIqAtCxmz0aFVAQ5BHOofeY6bRRhT0ELlqF+CoaEU2w78PxHhVmcLft
         tUipe5l4+YWOD6RzaQjcuQ7tEPC3wGXagf2LmhZDlI2bO2NMS2Z8VshhlaO1gdf3JWxs
         xiIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708358307; x=1708963107;
        h=in-reply-to:references:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tiqLc5KdCmtjYQt/eIFsjHHh0iB3V/zgzPhPHivKtAs=;
        b=cd17skTmlqcKf+Cs/EhA3yvF+FqbYQYTyaXXdtx5uarE1MaT1Vl3pOMOw5cLJS77KS
         UaOkr0kSn1lctyDRgqAUX3tJo2BXGuAdBx9boDHbdzJJ5lOv692HyQ67P7HufnbsuKhn
         oMpZBy39Hu6dNA+1KyAcqT/seOyPKUeO4J7RUFCsObErkM7yWHheo5NA71jsnRZoKOO7
         IteSsU1XEiRRtu2OVk1xHOfD84n9H9HS+0tuzamGXNk+BMLogXc6QgsNVTIdFpaP5o8N
         t+NPw84koKy/LAQq9JA97vwpsc+967HHMofvSgNmDbSKq5UBSzf6S1sfcdh/9e3zKpuu
         IPXg==
X-Forwarded-Encrypted: i=1; AJvYcCWKTpQd8Af/Q7SQ/1CbQhwPRMVlSJfkMKZtVGiF2f1dhNwrDeKQJV87gQpXi9v7fsTLAto1X3pwHq76/wqMhFSHl7KFu2/deZ1X3cnKTIuNYY0/Gig6YNmtKt/mopicLoehzPD39MPorDsSXb1z+OCEKrosMywbuNt+aJxivyR0iobK+FMJ+3wh8R5Czb1BoD+PMRUz1bCKzXq4vBKp90ci6P2XM72UCDEhqxOAQLB69030C5iprGYn+fW2KKLxHpZ8vQZmzrSzf2LUoiOxWRENL7l025P7Itwwh65BWXc=
X-Gm-Message-State: AOJu0Ywi/MvUpjGKUnFud/DCBDoj6JTH5OMgH2nx446H7Xc+mhzaGcZs
	+ElO84Ql6aJYko9Kh0NgKYuBiv+A/I78lLqv2eVxdzTPS3oHZS4U
X-Google-Smtp-Source: AGHT+IFtwqfaW9gJsxLy3j5F49CYy1xFjRlT0RRadI4Z0IOCUNhh1itGGGOPl5tKEJMCv67TBumOMw==
X-Received: by 2002:a17:906:851:b0:a3d:80d7:d1e3 with SMTP id f17-20020a170906085100b00a3d80d7d1e3mr7428154ejd.77.1708358306585;
        Mon, 19 Feb 2024 07:58:26 -0800 (PST)
Received: from localhost (p200300e41f2d4600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f2d:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id rf23-20020a1709076a1700b00a3da5bf6aa5sm3076542ejc.211.2024.02.19.07.58.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 07:58:26 -0800 (PST)
Content-Type: multipart/signed;
 boundary=f0caf17c841197981a0b66a2ac604de0b745306e0ba899959bfe0165d31f;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Mime-Version: 1.0
Date: Mon, 19 Feb 2024 16:58:25 +0100
Message-Id: <CZ96H72GI4Z0.SZJBZXA1VXJZ@gmail.com>
Subject: Re: [PATCH] phy: constify of_phandle_args in xlate
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Vinod Koul"
 <vkoul@kernel.org>, "Kishon Vijay Abraham I" <kishon@kernel.org>,
 "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Jonathan Hunter" <jonathanh@nvidia.com>,
 "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Linus Walleij"
 <linus.walleij@linaro.org>, <linux-phy@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <netdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <linux-tegra@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240217093937.58234-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240217093937.58234-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_075829_201019_870F0EC7 
X-CRM114-Status: UNSURE (   9.15  )
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

--f0caf17c841197981a0b66a2ac604de0b745306e0ba899959bfe0165d31f
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sat Feb 17, 2024 at 10:39 AM CET, Krzysztof Kozlowski wrote:
> The xlate callbacks are supposed to translate of_phandle_args to proper
> provider without modifying the of_phandle_args.  Make the argument
> pointer to const for code safety and readability.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/phy/allwinner/phy-sun4i-usb.c              |  2 +-
>  drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c     |  2 +-
>  drivers/phy/broadcom/phy-bcm-sr-pcie.c             |  2 +-
>  drivers/phy/broadcom/phy-bcm-sr-usb.c              |  2 +-
>  drivers/phy/broadcom/phy-bcm63xx-usbh.c            |  2 +-
>  drivers/phy/broadcom/phy-brcm-usb.c                |  2 +-
>  drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c    |  2 +-
>  drivers/phy/freescale/phy-fsl-lynx-28g.c           |  2 +-
>  drivers/phy/hisilicon/phy-histb-combphy.c          |  2 +-
>  drivers/phy/intel/phy-intel-lgm-combo.c            |  2 +-
>  drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c        |  2 +-
>  drivers/phy/marvell/phy-armada375-usb2.c           |  2 +-
>  drivers/phy/marvell/phy-armada38x-comphy.c         |  2 +-
>  drivers/phy/marvell/phy-berlin-sata.c              |  2 +-
>  drivers/phy/marvell/phy-mvebu-a3700-comphy.c       |  2 +-
>  drivers/phy/marvell/phy-mvebu-cp110-comphy.c       |  2 +-
>  drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c        |  2 +-
>  drivers/phy/mediatek/phy-mtk-tphy.c                |  2 +-
>  drivers/phy/mediatek/phy-mtk-xsphy.c               |  2 +-
>  drivers/phy/microchip/lan966x_serdes.c             |  2 +-
>  drivers/phy/microchip/sparx5_serdes.c              |  2 +-
>  drivers/phy/mscc/phy-ocelot-serdes.c               |  2 +-
>  drivers/phy/phy-core.c                             |  8 ++++----
>  drivers/phy/phy-xgene.c                            |  2 +-
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c          |  2 +-
>  drivers/phy/ralink/phy-mt7621-pci.c                |  2 +-
>  drivers/phy/renesas/phy-rcar-gen2.c                |  2 +-
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c           |  2 +-
>  drivers/phy/renesas/r8a779f0-ether-serdes.c        |  2 +-
>  drivers/phy/rockchip/phy-rockchip-naneng-combphy.c |  2 +-
>  drivers/phy/rockchip/phy-rockchip-pcie.c           |  2 +-
>  drivers/phy/samsung/phy-exynos-mipi-video.c        |  2 +-
>  drivers/phy/samsung/phy-exynos5-usbdrd.c           |  2 +-
>  drivers/phy/samsung/phy-samsung-usb2.c             |  2 +-
>  drivers/phy/socionext/phy-uniphier-usb2.c          |  2 +-
>  drivers/phy/st/phy-miphy28lp.c                     |  2 +-
>  drivers/phy/st/phy-spear1310-miphy.c               |  2 +-
>  drivers/phy/st/phy-spear1340-miphy.c               |  2 +-
>  drivers/phy/st/phy-stm32-usbphyc.c                 |  2 +-
>  drivers/phy/tegra/xusb.c                           |  2 +-
>  drivers/phy/ti/phy-am654-serdes.c                  |  2 +-
>  drivers/phy/ti/phy-da8xx-usb.c                     |  2 +-
>  drivers/phy/ti/phy-gmii-sel.c                      |  2 +-
>  drivers/phy/xilinx/phy-zynqmp.c                    |  2 +-
>  drivers/pinctrl/tegra/pinctrl-tegra-xusb.c         |  2 +-
>  include/linux/phy/phy.h                            | 14 +++++++-------
>  46 files changed, 55 insertions(+), 55 deletions(-)

Makes sense:

Acked-by: Thierry Reding <treding@nvidia.com>

--f0caf17c841197981a0b66a2ac604de0b745306e0ba899959bfe0165d31f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmXTeqIACgkQ3SOs138+
s6GdEBAAsZtqIRL7k6ZV5nu5N0juG6RO7Sm34o9+isHlbNUAhmDQeIXxdlWIF3qc
ap2W/H4jLtQnrDaCtdFWa5oPx8Ud41AKoeOQRlZq6goHZemt2JbUyB5IzsMIL0KN
FUGwvVEZdDnJbhe2+8YX0fN8WG4qpAYo7vrb1XsgP4RzGwgkwH64LbCOtoAoYtYl
rOc7hn6eNJrIYlW1LaU37BApWV0KgdMiI1YSILAT5YJK24fYst7j//8UxyEQP4aO
S+3uPr8/1K1JifAihpgqu7w5kyDcMW1ncoAamilKe2xDzz7wJ8wxtYcdypnwBSpd
/+rhMybnEj2kgbDrSbY+LVlczSU6Wf/SEtZzB+DOCE4+CZrtFyMVsSgAeVXFT1n0
L5vTh0182skHEAm97GXHwoQOmLND8wJJVZR+Sw1OApxEYI1Y8hTx33NrbA+5hiVq
15m0Jq8NXvpd237p5obNfFNuDmK/BlMhlq3x+3/aWGqT+pRlavF1i0HP/wEV9YoC
6zleWWkx9BAonksD76uhrk/LBnYnc3wb9O5B4KS6dp+tYE3ekIWauHxzhg4tpOcg
FqcY6ObCs+Jjtplo4vtrTBR6A4jdvunJQcp4WqSO/5RkZd/ySVdSbpvCdK1yy/JM
j7SSnUWV03IbkbGoBduin/a8YT84GAn3seVzxO0ik5dpZHGbAPM=
=Z186
-----END PGP SIGNATURE-----

--f0caf17c841197981a0b66a2ac604de0b745306e0ba899959bfe0165d31f--

