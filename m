Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D38C76196
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 15:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DqP+QRGf+rrQD2kliDbDIMvrPOs6hCR+o4Khphli5Yg=; b=aOK6o97f/UOmYBGhWnL90P0BIL
	gHQTpMAaN7MVOfUBEinyVVbaUZk9OEJZ1z5xmmGs/j8Qx+sOWMlDZg8o4uROqnw9DsQQ73R0LWrmx
	s2U9w2R5XOE4km0r3O+Ra7za2vv/VBqvqwAyXg445bobj7HbemKIds+MJGzK5EEEkOL5mg+1q4CPs
	ijXJKN3DgnQKynIJFWD9u3oy3+SvJzjbFqtMTJILKqa6UezzI/zsRhvpKc6U1Xqmgq4HPwgBg5g6g
	P9M/i0OwItAzhf7slLlfS19O40Oc7ImxDtde0pLdPPR6ro3Gh0WxOSmB/0mCTAbDDxspqDwoGO3N8
	YfeS05YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjM0a-00FlMF-1E;
	Mon, 03 Apr 2023 15:22:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjM0H-00FlJm-1q;
	Mon, 03 Apr 2023 15:21:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1B69260B5F;
	Mon,  3 Apr 2023 15:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DC2AC4339B;
	Mon,  3 Apr 2023 15:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680535312;
	bh=LKyj2hwPi42lkcaWN3TMXoQR+q6WYCbdhvtoyLpvRzk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=efq5ine+EsMFH+WcS5cjeha3Dry9tfLq3C8DRkJhnQrIpYlm7DOfWmNv2Bjun+nlF
	 skJ5Xix2JZ8m02L27GMmQkrcTi4Ste4xFWP4VUnkHql7+fM2PYYvX1Pv4ZDs2wa+Zx
	 FVcJ1epYo1ITKpgy0wkdRAjAmjK+j6r4ZmwEIHWvz0cDbjWc+tnz4lprVhBIIctxgR
	 YZMv+njBtzNhqMzBfGS+FZEmseYz1lj5CK0bw1SM5zo0Xz4nV3de8nZRmdWJW235hq
	 hE5ckzXtq5Cht0yWYrMK9JoeaLwClA2lCXlybofbFFBONxBOuJ/sluhGFc07EFRYYn
	 rOexfBdNBnLxw==
Received: by mail-lj1-f176.google.com with SMTP id x20so30719751ljq.9;
        Mon, 03 Apr 2023 08:21:52 -0700 (PDT)
X-Gm-Message-State: AAQBX9dSQMu+6rGcqBH6WFAEj3Jb6NqjIrpSVW11ZPTm23X1Lt342Tuv
	R+QLt6BoqeQcFz5mlbIqNoNVgmmeXJlQV2NMcg==
X-Google-Smtp-Source: AKy350aTiBCcmkf5yaiSw9a/oh0FWNKIycpSVHuTeBKMLpgJoW35W0t7pwb2F74OQGePnsI1l2Satrcxa386y3dUOtA=
X-Received: by 2002:a2e:9792:0:b0:2a3:fc8:711b with SMTP id
 y18-20020a2e9792000000b002a30fc8711bmr10925454lji.10.1680535310524; Mon, 03
 Apr 2023 08:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230403071929.360911-1-jstephan@baylibre.com> <20230403071929.360911-3-jstephan@baylibre.com>
In-Reply-To: <20230403071929.360911-3-jstephan@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 3 Apr 2023 23:21:38 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-SJKPkq+saOrQHKYDpZ3cr0350bYNTSpTMwdoApV+Jvw@mail.gmail.com>
Message-ID: <CAAOTY_-SJKPkq+saOrQHKYDpZ3cr0350bYNTSpTMwdoApV+Jvw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230403_082153_714614_2B7C6BDF 
X-CRM114-Status: GOOD (  14.71  )
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

> +
> +#define MIPI_RX_ANA04_CSIxA                                             =
       0x0004

Useless, so drop this.

> +#define MIPI_RX_ANA04_CSIxA_RG_CSIxA_BG_LPRX_VTH_SEL_SHIFT              =
       0
> +#define MIPI_RX_ANA04_CSIxA_RG_CSIxA_BG_LPRX_VTH_SEL_MASK               =
       GENMASK(2, 0)
> +#define MIPI_RX_ANA04_CSIxA_RG_CSIxA_BG_LPRX_VTL_SEL_SHIFT              =
       4
> +#define MIPI_RX_ANA04_CSIxA_RG_CSIxA_BG_LPRX_VTL_SEL_MASK               =
       GENMASK(6, 4)
> +#define MIPI_RX_ANA04_CSIxA_RG_CSIxA_BG_HSDET_VTH_SEL_SHIFT             =
       8
> +#define MIPI_RX_ANA04_CSIxA_RG_CSIxA_BG_HSDET_VTH_SEL_MASK              =
       GENMASK(10, 8)
> +#define MIPI_RX_ANA04_CSIxA_RG_CSIxA_BG_HSDET_VTL_SEL_SHIFT             =
       12
> +#define MIPI_RX_ANA04_CSIxA_RG_CSIxA_BG_HSDET_VTL_SEL_MASK              =
       GENMASK(14, 12)
> +#define MIPI_RX_ANA04_CSIxA_RG_CSIxA_BG_VREF_SEL_SHIFT                  =
       16
> +#define MIPI_RX_ANA04_CSIxA_RG_CSIxA_BG_VREF_SEL_MASK                   =
       GENMASK(19, 16)
> +#define MIPI_RX_ANA04_CSIxA_RG_CSIxA_BG_MON_VREF_SEL_SHIFT              =
       24
> +#define MIPI_RX_ANA04_CSIxA_RG_CSIxA_BG_MON_VREF_SEL_MASK               =
       GENMASK(27, 24)
> +#define MIPI_RX_ANA04_CSIxA_RG_CSIxA_FORCE_HSRT_EN_SHIFT                =
       28
> +#define MIPI_RX_ANA04_CSIxA_RG_CSIxA_FORCE_HSRT_EN_MASK                 =
               BIT(28)
> +
> +#define MIPI_RX_ANA08_CSIxA                                             =
       0x0008

Ditto.

> +#define MIPI_RX_ANA08_CSIxA_RG_CSIxA_L0P_T0A_HSRT_CODE_SHIFT            =
       0
> +#define MIPI_RX_ANA08_CSIxA_RG_CSIxA_L0P_T0A_HSRT_CODE_MASK             =
       GENMASK(4, 0)
> +#define MIPI_RX_ANA08_CSIxA_RG_CSIxA_L0N_T0B_HSRT_CODE_SHIFT            =
       8
> +#define MIPI_RX_ANA08_CSIxA_RG_CSIxA_L0N_T0B_HSRT_CODE_MASK             =
       GENMASK(12, 8)
> +#define MIPI_RX_ANA08_CSIxA_RG_CSIxA_L1P_T0C_HSRT_CODE_SHIFT            =
       16
> +#define MIPI_RX_ANA08_CSIxA_RG_CSIxA_L1P_T0C_HSRT_CODE_MASK             =
       GENMASK(20, 16)
> +#define MIPI_RX_ANA08_CSIxA_RG_CSIxA_L1N_T1A_HSRT_CODE_SHIFT            =
       24
> +#define MIPI_RX_ANA08_CSIxA_RG_CSIxA_L1N_T1A_HSRT_CODE_MASK             =
       GENMASK(28, 24)
> +
> +#define MIPI_RX_ANA0C_CSIxA                                             =
       0x000c

Ditto.

> +#define MIPI_RX_ANA0C_CSIxA_RG_CSIxA_L2P_T1B_HSRT_CODE_SHIFT            =
       0
> +#define MIPI_RX_ANA0C_CSIxA_RG_CSIxA_L2P_T1B_HSRT_CODE_MASK             =
       GENMASK(4, 0)
> +#define MIPI_RX_ANA0C_CSIxA_RG_CSIxA_L2N_T1C_HSRT_CODE_SHIFT            =
       8
> +#define MIPI_RX_ANA0C_CSIxA_RG_CSIxA_L2N_T1C_HSRT_CODE_MASK             =
       GENMASK(12, 8)
> +
> +#define MIPI_RX_ANA10_CSIxA                                             =
       0x0010

Ditto.

> +#define MIPI_RX_ANA10_CSIxA_RG_CSIxA_DPHY_L0_DELAYCAL_EN_SHIFT          =
       0
> +#define MIPI_RX_ANA10_CSIxA_RG_CSIxA_DPHY_L0_DELAYCAL_EN_MASK           =
       BIT(0)
> +#define MIPI_RX_ANA10_CSIxA_RG_CSIxA_DPHY_L0_DELAYCAL_RSTB_SHIFT        =
       1
> +#define MIPI_RX_ANA10_CSIxA_RG_CSIxA_DPHY_L0_DELAYCAL_RSTB_MASK         =
               BIT(1)
> +#define MIPI_RX_ANA10_CSIxA_RG_CSIxA_DPHY_L0_VREF_SEL_SHIFT             =
       2
> +#define MIPI_RX_ANA10_CSIxA_RG_CSIxA_DPHY_L0_VREF_SEL_MASK              =
       GENMASK(7, 2)
> +#define MIPI_RX_ANA10_CSIxA_RG_CSIxA_DPHY_L1_DELAYCAL_EN_SHIFT          =
       8
> +#define MIPI_RX_ANA10_CSIxA_RG_CSIxA_DPHY_L1_DELAYCAL_EN_MASK           =
       BIT(8)
> +#define MIPI_RX_ANA10_CSIxA_RG_CSIxA_DPHY_L1_DELAYCAL_RSTB_SHIFT        =
       9
> +#define MIPI_RX_ANA10_CSIxA_RG_CSIxA_DPHY_L1_DELAYCAL_RSTB_MASK         =
               BIT(9)
> +#define MIPI_RX_ANA10_CSIxA_RG_CSIxA_DPHY_L1_VREF_SEL_SHIFT             =
       10
> +#define MIPI_RX_ANA10_CSIxA_RG_CSIxA_DPHY_L1_VREF_SEL_MASK              =
       GENMASK(15, 10)
> +#define MIPI_RX_ANA10_CSIxA_RG_CSIxA_DPHY_L2_DELAYCAL_EN_SHIFT          =
       16
> +#define MIPI_RX_ANA10_CSIxA_RG_CSIxA_DPHY_L2_DELAYCAL_EN_MASK           =
       BIT(16)
> +#define MIPI_RX_ANA10_CSIxA_RG_CSIxA_DPHY_L2_DELAYCAL_RSTB_SHIFT        =
       17
> +#define MIPI_RX_ANA10_CSIxA_RG_CSIxA_DPHY_L2_DELAYCAL_RSTB_MASK         =
               BIT(17)
> +#define MIPI_RX_ANA10_CSIxA_RG_CSIxA_DPHY_L2_VREF_SEL_SHIFT             =
       18
> +#define MIPI_RX_ANA10_CSIxA_RG_CSIxA_DPHY_L2_VREF_SEL_MASK              =
       GENMASK(23, 18)
> +/* C-PHY fields are only available in CSIx. */
> +#define MIPI_RX_ANA10_CSIxA_RG_CSI0A_CPHY_T0_CDR_DELAYCAL_EN_SHIFT      =
       24
> +#define MIPI_RX_ANA10_CSIxA_RG_CSI0A_CPHY_T0_CDR_DELAYCAL_EN_MASK       =
       BIT(24)
> +#define MIPI_RX_ANA10_CSIxA_RG_CSI0A_CPHY_T0_CDR_DELAYCAL_RSTB_SHIFT    =
       25
> +#define MIPI_RX_ANA10_CSIxA_RG_CSI0A_CPHY_T0_CDR_DELAYCAL_RSTB_MASK     =
       BIT(25)
> +#define MIPI_RX_ANA10_CSIxA_RG_CSI0A_CPHY_T0_VREF_SEL_SHIFT             =
       26
> +#define MIPI_RX_ANA10_CSIxA_RG_CSI0A_CPHY_T0_VREF_SEL_MASK              =
       GENMASK(31, 26)
> +
> +#define MIPI_RX_ANA14_CSIxA                                             =
       0x0014

Ditto.

Regards,
Chun-Kuang.


> +/* C-PHY fields are only available in CSIx. */
> +#define MIPI_RX_ANA14_CSIxA_RG_CSI0A_CPHY_T1_CDR_DELAYCAL_EN_SHIFT      =
       0
> +#define MIPI_RX_ANA14_CSIxA_RG_CSI0A_CPHY_T1_CDR_DELAYCAL_EN_MASK       =
       BIT(0)
> +#define MIPI_RX_ANA14_CSIxA_RG_CSI0A_CPHY_T1_CDR_DELAYCAL_RSTB_SHIFT    =
       1
> +#define MIPI_RX_ANA14_CSIxA_RG_CSI0A_CPHY_T1_CDR_DELAYCAL_RSTB_MASK     =
       BIT(1)
> +#define MIPI_RX_ANA14_CSIxA_RG_CSI0A_CPHY_T1_VREF_SEL_SHIFT             =
       2
> +#define MIPI_RX_ANA14_CSIxA_RG_CSI0A_CPHY_T1_VREF_SEL_MASK              =
       GENMASK(7, 2)
> +

