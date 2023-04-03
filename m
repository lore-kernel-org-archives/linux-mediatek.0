Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5298C761A6
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 10:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MACGSAZmyR/w2HF0G9yYs7FT83rX9wpSQaZs48CH4zY=; b=4Du88sG3TDTfhJ/T/cF2nn5maj
	Yg4vyNJRQVKm1NuUmrR0VVzcBpmdfjUOtQwA2ayBRT0nr5PO4c6+URyyGbDzV5ftZyMzPZo7CtbNn
	PWjPCsxG0jdXuiqvzyRjBife9/Z6hrIYRLK+HMiaj1kJMvRQZwAmDR1TwPxcMLNgGg6VwoF9cLvFk
	Cn7PKK+ToOJWEREfnU8JSAPAxJ9Id6MnKzqoj219YtfKvYzOEa8ABym4hsZXcDVs2CEtBtW+o4Shv
	CjD5La6m0nd6KdokrfW3QrrhBtqIYZpbhKYG359kgqOEkltgcZnEL1aI9IHNxa/35gtKWRiH0jqt3
	3W5sVuhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjHEX-00EtEd-0H;
	Mon, 03 Apr 2023 10:16:17 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjHES-00EtD9-1P;
	Mon, 03 Apr 2023 10:16:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B05A6B816D9;
	Mon,  3 Apr 2023 10:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53720C433D2;
	Mon,  3 Apr 2023 10:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680516967;
	bh=5HFO1/RS3+GfhEvCCUbP0dlLKdHoh/rzuLr+Hm1DWRc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tMVrA1iW3mfBUp6m3x9ahp3O1uvEXmZ9qoCzeBdhKRrSuSckrkcHK7B/1I1PkoGVD
	 +E3Sws/4kGXbZ538hkiZNnOotQCG+6anbV9ddH9+t/M6NxcpqqaI4d223UEi0SbMlh
	 AWTRy4fd6QbC3U57sc7+Z6GNt55f6+x0N9lm+rqiEAyyOLXW5YF2XeHdXdfDppoYwi
	 RV2+6qyixo0Kda0KRZhWzoTc08QMwCetagk3Uc549pMPEBlzr62nyO3LpnFVvOmFD7
	 y3eFCiFPP+hyo8pSgorw8RLLaSX5wWH+W7HkIyGqat9JQTpzSj8iVRw59ih/IyO4Q0
	 7i29cV5h5HBCA==
Received: by mail-lf1-f52.google.com with SMTP id j11so37323984lfg.13;
        Mon, 03 Apr 2023 03:16:07 -0700 (PDT)
X-Gm-Message-State: AAQBX9dH4cQXBeNgdhOcwtm10Gg8/DK4c5A79cVs4PrGp4DAuLrHoS7Z
	HroaB4OEUmUfTmAKv4XyzaPsX26zVnAhhjieWg==
X-Google-Smtp-Source: AKy350a6AWS0wXlKuF5pe+AmTsaAEGr6dp/NJrmnFPufQQTE7JlMBuNWDF4zk2dhoeM1A4qjskgjTlKotAgPQvIU9cg=
X-Received: by 2002:ac2:43ce:0:b0:4eb:2643:d5cf with SMTP id
 u14-20020ac243ce000000b004eb2643d5cfmr4522340lfl.7.1680516965357; Mon, 03 Apr
 2023 03:16:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230403071929.360911-1-jstephan@baylibre.com> <20230403071929.360911-3-jstephan@baylibre.com>
In-Reply-To: <20230403071929.360911-3-jstephan@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 3 Apr 2023 18:15:53 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8h0gROVKOVNrTpJGKgZhJbQ1A6EaZT+vpb5bJaYqYaFg@mail.gmail.com>
Message-ID: <CAAOTY_8h0gROVKOVNrTpJGKgZhJbQ1A6EaZT+vpb5bJaYqYaFg@mail.gmail.com>
Subject: Re: [PATCH 2/2] phy: mtk-mipi-csi: add driver for CSI phy
To: Julien Stephan <jstephan@baylibre.com>
Cc: Phi-bang Nguyen <pnguyen@baylibre.com>, Louis Kuo <louis.kuo@mediatek.com>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Andy Hsieh <andy.hsieh@mediatek.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"moderated list:ARM/Mediatek USB3 PHY DRIVER" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek USB3 PHY DRIVER" <linux-mediatek@lists.infradead.org>, 
	"open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:DRM DRIVERS FOR MEDIATEK" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_031612_773430_EE3BA4DD 
X-CRM114-Status: GOOD (  21.30  )
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

Hi, Julien:

Julien Stephan <jstephan@baylibre.com> =E6=96=BC 2023=E5=B9=B44=E6=9C=883=
=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=883:20=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> From: Phi-bang Nguyen <pnguyen@baylibre.com>
>
> This is a new driver that supports the MIPI CSI CD-PHY for mediatek
> mt8365 soc
>
> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> [Julien Stephan: use regmap]
> [Julien Stephan: use GENMASK]
> Co-developed-by: Julien Stephan <jstephan@baylibre.com>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  .../bindings/phy/mediatek,csi-phy.yaml        |   9 +-
>  MAINTAINERS                                   |   1 +
>  drivers/phy/mediatek/Kconfig                  |   8 +
>  drivers/phy/mediatek/Makefile                 |   2 +
>  .../phy/mediatek/phy-mtk-mipi-csi-rx-reg.h    | 435 ++++++++++++++++++
>  drivers/phy/mediatek/phy-mtk-mipi-csi.c       | 392 ++++++++++++++++
>  6 files changed, 845 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-csi-rx-reg.h
>  create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-csi.c
>

[snip]

> +static int mtk_mipi_phy_power_on(struct phy *phy)
> +{
> +       struct mtk_mipi_dphy_port *port =3D phy_get_drvdata(phy);
> +       struct mtk_mipi_dphy *priv =3D port->dev;
> +       struct regmap *regmap_base =3D port->regmap_base;
> +       struct regmap *regmap_4d1c =3D port->regmap_4d1c;
> +       int ret =3D 0;
> +
> +       mutex_lock(&priv->lock);
> +
> +       switch (port->id) {
> +       case MTK_MIPI_PHY_PORT_0:
> +               if (priv->ports[MTK_MIPI_PHY_PORT_0A].active ||
> +                   priv->ports[MTK_MIPI_PHY_PORT_0B].active)
> +                       ret =3D -EBUSY;
> +               break;
> +
> +       case MTK_MIPI_PHY_PORT_0A:
> +       case MTK_MIPI_PHY_PORT_0B:
> +               if (priv->ports[MTK_MIPI_PHY_PORT_0].active)
> +                       ret =3D -EBUSY;
> +               break;
> +       }
> +
> +       if (!ret)
> +               port->active =3D true;
> +
> +       mutex_unlock(&priv->lock);
> +
> +       if (ret < 0)
> +               return ret;
> +
> +       /* Set analog phy mode to DPHY */
> +       if (port->is_cdphy)
> +               REGMAP_BIT(regmap_base, MIPI_RX_ANA00_CSIxA,
> +                          RG_CSI0A_CPHY_EN, 0);
> +
> +       if (port->is_4d1c) {
> +               REGMAP_BIT(regmap_base, MIPI_RX_ANA00_CSIxA,
> +                          RG_CSIxA_DPHY_L0_CKMODE_EN, 0);
> +               REGMAP_BIT(regmap_base, MIPI_RX_ANA00_CSIxA,
> +                          RG_CSIxA_DPHY_L0_CKSEL, 1);
> +               REGMAP_BIT(regmap_base, MIPI_RX_ANA00_CSIxA,
> +                          RG_CSIxA_DPHY_L1_CKMODE_EN, 0);
> +               REGMAP_BIT(regmap_base, MIPI_RX_ANA00_CSIxA,
> +                          RG_CSIxA_DPHY_L1_CKSEL, 1);
> +               REGMAP_BIT(regmap_base, MIPI_RX_ANA00_CSIxA,
> +                          RG_CSIxA_DPHY_L2_CKMODE_EN, 1);
> +               REGMAP_BIT(regmap_base, MIPI_RX_ANA00_CSIxA,
> +                          RG_CSIxA_DPHY_L2_CKSEL, 1);
> +       } else {
> +               REGMAP_BIT(regmap_base, MIPI_RX_ANA00_CSIxA,
> +                          RG_CSIxA_DPHY_L0_CKMODE_EN, 0);
> +               REGMAP_BIT(regmap_base, MIPI_RX_ANA00_CSIxA,
> +                          RG_CSIxA_DPHY_L0_CKSEL, 0);
> +               REGMAP_BIT(regmap_base, MIPI_RX_ANA00_CSIxA,
> +                          RG_CSIxA_DPHY_L1_CKMODE_EN, 1);
> +               REGMAP_BIT(regmap_base, MIPI_RX_ANA00_CSIxA,
> +                          RG_CSIxA_DPHY_L1_CKSEL, 0);
> +               REGMAP_BIT(regmap_base, MIPI_RX_ANA00_CSIxA,
> +                          RG_CSIxA_DPHY_L2_CKMODE_EN, 0);
> +               REGMAP_BIT(regmap_base, MIPI_RX_ANA00_CSIxA,
> +                          RG_CSIxA_DPHY_L2_CKSEL, 0);
> +       }
> +
> +       if (port->is_4d1c) {
> +               if (port->is_cdphy)
> +                       REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA00_CSIxA,
> +                                  RG_CSI0A_CPHY_EN, 0);
> +
> +               REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA00_CSIxA,
> +                          RG_CSIxA_DPHY_L0_CKMODE_EN, 0);
> +               REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA00_CSIxA,
> +                          RG_CSIxA_DPHY_L0_CKSEL, 1);
> +               REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA00_CSIxA,
> +                          RG_CSIxA_DPHY_L1_CKMODE_EN, 0);
> +               REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA00_CSIxA,
> +                          RG_CSIxA_DPHY_L1_CKSEL, 1);
> +               REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA00_CSIxA,
> +                          RG_CSIxA_DPHY_L2_CKMODE_EN, 0);
> +               REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA00_CSIxA,
> +                          RG_CSIxA_DPHY_L2_CKSEL, 1);
> +       }
> +
> +       /* Byte clock invert */
> +       REGMAP_BIT(regmap_base, MIPI_RX_ANAA8_CSIxA,
> +                  RG_CSIxA_CDPHY_L0_T0_BYTECK_INVERT, 1);
> +       REGMAP_BIT(regmap_base, MIPI_RX_ANAA8_CSIxA,
> +                  RG_CSIxA_DPHY_L1_BYTECK_INVERT, 1);
> +       REGMAP_BIT(regmap_base, MIPI_RX_ANAA8_CSIxA,
> +                  RG_CSIxA_CDPHY_L2_T1_BYTECK_INVERT, 1);
> +
> +       if (port->is_4d1c) {
> +               REGMAP_BIT(regmap_4d1c, MIPI_RX_ANAA8_CSIxA,
> +                          RG_CSIxA_CDPHY_L0_T0_BYTECK_INVERT, 1);
> +               REGMAP_BIT(regmap_4d1c, MIPI_RX_ANAA8_CSIxA,
> +                          RG_CSIxA_DPHY_L1_BYTECK_INVERT, 1);
> +               REGMAP_BIT(regmap_4d1c, MIPI_RX_ANAA8_CSIxA,
> +                          RG_CSIxA_CDPHY_L2_T1_BYTECK_INVERT, 1);
> +       }
> +
> +       /* Start ANA EQ tuning */
> +       if (port->is_cdphy) {
> +               REGMAP_BIT(regmap_base, MIPI_RX_ANA18_CSIxA,
> +                          RG_CSI0A_L0_T0AB_EQ_IS, 1);
> +               REGMAP_BIT(regmap_base, MIPI_RX_ANA18_CSIxA,
> +                          RG_CSI0A_L0_T0AB_EQ_BW, 1);
> +               REGMAP_BIT(regmap_base, MIPI_RX_ANA1C_CSIxA,
> +                          RG_CSI0A_L1_T1AB_EQ_IS, 1);
> +               REGMAP_BIT(regmap_base, MIPI_RX_ANA1C_CSIxA,
> +                          RG_CSI0A_L1_T1AB_EQ_BW, 1);
> +               REGMAP_BIT(regmap_base, MIPI_RX_ANA20_CSI0A,
> +                          RG_CSI0A_L2_T1BC_EQ_IS, 1);
> +               REGMAP_BIT(regmap_base, MIPI_RX_ANA20_CSI0A,
> +                          RG_CSI0A_L2_T1BC_EQ_BW, 1);
> +
> +               if (port->is_4d1c) {
> +                       REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA18_CSIxA,
> +                                  RG_CSI0A_L0_T0AB_EQ_IS, 1);
> +                       REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA18_CSIxA,
> +                                  RG_CSI0A_L0_T0AB_EQ_BW, 1);
> +                       REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA1C_CSIxA,
> +                                  RG_CSI0A_L1_T1AB_EQ_IS, 1);
> +                       REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA1C_CSIxA,
> +                                  RG_CSI0A_L1_T1AB_EQ_BW, 1);
> +                       REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA20_CSI0A,
> +                                  RG_CSI0A_L2_T1BC_EQ_IS, 1);
> +                       REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA20_CSI0A,
> +                                  RG_CSI0A_L2_T1BC_EQ_BW, 1);
> +               }
> +       } else {
> +               REGMAP_BIT(regmap_base, MIPI_RX_ANA18_CSIxA,
> +                          RG_CSI1A_L0_EQ_IS, 1);
> +               REGMAP_BIT(regmap_base, MIPI_RX_ANA18_CSIxA,
> +                          RG_CSI1A_L0_EQ_BW, 1);
> +               REGMAP_BIT(regmap_base, MIPI_RX_ANA18_CSIxA,
> +                          RG_CSI1A_L1_EQ_IS, 1);
> +               REGMAP_BIT(regmap_base, MIPI_RX_ANA18_CSIxA,
> +                          RG_CSI1A_L1_EQ_BW, 1);
> +               REGMAP_BIT(regmap_base, MIPI_RX_ANA1C_CSIxA,
> +                          RG_CSI1A_L2_EQ_IS, 1);
> +               REGMAP_BIT(regmap_base, MIPI_RX_ANA1C_CSIxA,
> +                          RG_CSI1A_L2_EQ_BW, 1);
> +
> +               if (port->is_4d1c) {
> +                       REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA18_CSIxA,
> +                                  RG_CSI1A_L0_EQ_IS, 1);

RG_CSI1A_L0_EQ_IS is identical to RG_CSI0A_L0_T0AB_EQ_IS, and ditto
for below register. I think the function of each bitwise register is
the same. Define only one copy of the these register, don't duplicate
the same thing.

Regards,
Chun-Kuang.

> +                       REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA18_CSIxA,
> +                                  RG_CSI1A_L0_EQ_BW, 1);
> +                       REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA18_CSIxA,
> +                                  RG_CSI1A_L1_EQ_IS, 1);
> +                       REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA18_CSIxA,
> +                                  RG_CSI1A_L1_EQ_BW, 1);
> +                       REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA1C_CSIxA,
> +                                  RG_CSI1A_L2_EQ_IS, 1);
> +                       REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA1C_CSIxA,
> +                                  RG_CSI1A_L2_EQ_BW, 1);
> +               }
> +       }
> +
> +       /* End ANA EQ tuning */
> +       regmap_write(regmap_base, MIPI_RX_ANA40_CSIxA, 0x90);
> +
> +       REGMAP_BIT(regmap_base, MIPI_RX_ANA24_CSIxA,
> +                  RG_CSIxA_RESERVE, 0x40);
> +       if (port->is_4d1c)
> +               REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA24_CSIxA,
> +                          RG_CSIxA_RESERVE, 0x40);
> +       REGMAP_BIT(regmap_base, MIPI_RX_WRAPPER80_CSIxA,
> +                  CSR_CSI_RST_MODE, 0);
> +       if (port->is_4d1c)
> +               REGMAP_BIT(regmap_4d1c, MIPI_RX_WRAPPER80_CSIxA,
> +                          CSR_CSI_RST_MODE, 0);
> +       /* ANA power on */
> +       REGMAP_BIT(regmap_base, MIPI_RX_ANA00_CSIxA,
> +                  RG_CSIxA_BG_CORE_EN, 1);
> +       if (port->is_4d1c)
> +               REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA00_CSIxA,
> +                          RG_CSIxA_BG_CORE_EN, 1);
> +       usleep_range(20, 40);
> +       REGMAP_BIT(regmap_base, MIPI_RX_ANA00_CSIxA,
> +                  RG_CSIxA_BG_LPF_EN, 1);
> +       if (port->is_4d1c)
> +               REGMAP_BIT(regmap_4d1c, MIPI_RX_ANA00_CSIxA,
> +                          RG_CSIxA_BG_LPF_EN, 1);
> +
> +       return 0;
> +}
> +

