Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F14CA0EE0
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Aug 2025 04:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mNCpJgQjq+GS4YzNy98cq9BJV9qzo09+hdPjGhITOTw=; b=Mgj396izQtyivFf2NRGKIAwkKn
	huWPHaAKOJHoWC+Ti42JwgQjjAnaWd8SYQqRgiEjFSpG7bJ7ue2g9A4Y1CH/ABORhPSpEPpz7vlnz
	OsVlAecBdMQ5PnM3Vl7Cc82s332NZYlW8WvyIcT6uXNlV/kqqQp4tY3b7MRgSWNMYomH33OMcXOfV
	EuyTeJgigRobuoBRTwLslJGl+Ur7NVPpqUT7x33jffNrKIIBhUZan0tp38Qd118yg7MY2tzECU//h
	1yU1YB0MpukcLwH/aj/cXXeDhdVF/ca9IUA5V7IW2Bddj//b6pqWx1X/U6dDCLri6US0W506AjeDO
	cLIAcJuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umljx-00000001NVn-3k45;
	Fri, 15 Aug 2025 04:08:29 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umlT0-00000001LEe-3Ndj
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Aug 2025 03:50:59 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-55ce5284d63so1452220e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 14 Aug 2025 20:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755229857; x=1755834657; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mNCpJgQjq+GS4YzNy98cq9BJV9qzo09+hdPjGhITOTw=;
        b=nVr8DRseUzUay4fkJhjYPREL5JCXedxE1UjrRC/kMY7OrGDEv7voUiJxRF05wMWhtm
         TnVSr1bLEcSMGvWxzGcGJ9cGtruukYBnu+2ZpOmre1FobF5AZt2DOsq1DuA/R3I/3GC3
         XZUCFIp+jjKm4WM6aLkrecssZwcLWwVq3XSeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755229857; x=1755834657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mNCpJgQjq+GS4YzNy98cq9BJV9qzo09+hdPjGhITOTw=;
        b=ijAbfy7L7BVGK3LSG8TGZY9ADIH5MbqldB1xpk742O5Tz6HyEozirGSxP8TJREm4E4
         UT6pLt38B0Oz21hUHXhwZRNdwsk92VbQYjC6PFbiQbFTdYIXSU9BohDRG0vgRRJ/uZJv
         cwuFRu1d95jWn2mPcjY8bhapQ49F1+slGgOCuTL6benbP8zKpZR4Wji9R/IZdnSCIOe7
         un6UHsoRGEWgMoEr1Jmhl+yJZ/2S/CcWg84YHHlrDBuLWma8gA9G9iBL0hKMaiXUywrg
         PPoIJhMKu7EA89BEE4hOwMmSA90FJr1nq/n/HaUKPE18CbsQybqv66/apyzCGnM1EhKA
         0RPg==
X-Forwarded-Encrypted: i=1; AJvYcCX7OqWRKZym1jvVlhK0TrESpuIlM6gfh0llvze0E7TuHCH/qZ29FRLTcQWsWo1sisJNnhojs6ZDp4jPe1WUHQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLMu3VldN2KlKYDtKaUh3a/LAj5L56WHGKNsu8oT3XwFdNYglA
	hA906BHgKzXCZPJkFrf6c6cQcaMFk1G1dKov9ycPBXuz6nPI0kGhOXsoKfsPLwBd4NpZ/7l8L90
	LoJgcaMGObB4kfLZ1Rrb4Rrr1Ty/t0f5yfwv+UrLr96Ev1XSOeGCiwA==
X-Gm-Gg: ASbGnctCMhhyn+z51bC8PbMqaXaiozDCPF622dTc1ajbIDoTBBBFC8cUWsgMaMVqVs0
	SMkJ14xuyJvbWA0FacI80lJfIVZI8HWdW5DN+yaRgveN1VEWpHF1G9RI4edfqHI9NqrYqiYwQqq
	s2+1JKrGZuDY0+Wcqlls9TJPjMsoZ/YvDSHnq1IdK4CE5Obfm6ZwbKVwlrTBJYn1NeFQq8I1vfm
	3DKIn5EmpdXLU6m2wEOaVTdsC5WydCKtte1AA==
X-Google-Smtp-Source: AGHT+IHanR5W4aT2CMpF63TjQl6R4IN1HWWDRZ1tieU0aIdSV3su7803eNqcJODnfoQ+Iaia8tnU4ymR0P29h1PYZxw=
X-Received: by 2002:a05:6512:110c:b0:55b:814a:a7fa with SMTP id
 2adb3069b0e04-55ce6276b14mr1674516e87.8.1755229857008; Thu, 14 Aug 2025
 20:50:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250805135447.149231-1-laura.nao@collabora.com> <20250805135447.149231-16-laura.nao@collabora.com>
In-Reply-To: <20250805135447.149231-16-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 15 Aug 2025 12:50:46 +0900
X-Gm-Features: Ac12FXwHRx7C4fyOWZyt0EB-zyYHFrLdTdYy_27o2coqKVBHEp62jlgbsZo1EGQ
Message-ID: <CAGXv+5GH6ypcuXn9+XED7du_CJaeDs3M1ODjtN7pDH_FA0gmjg@mail.gmail.com>
Subject: Re: [PATCH v4 15/27] clk: mediatek: Add MT8196 ufssys clock support
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com, =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_205058_856524_76D0EEFC 
X-CRM114-Status: GOOD (  21.98  )
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

On Tue, Aug 5, 2025 at 10:55=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> Add support for the MT8196 ufssys clock controller, which provides clock
> gate control for UFS.
>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  drivers/clk/mediatek/Kconfig             |   7 ++
>  drivers/clk/mediatek/Makefile            |   1 +
>  drivers/clk/mediatek/clk-mt8196-ufs_ao.c | 109 +++++++++++++++++++++++
>  3 files changed, 117 insertions(+)
>  create mode 100644 drivers/clk/mediatek/clk-mt8196-ufs_ao.c
>
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index 1e0c6f177ecd..d99c39a7f10e 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -1010,6 +1010,13 @@ config COMMON_CLK_MT8196
>         help
>           This driver supports MediaTek MT8196 basic clocks.
>
> +config COMMON_CLK_MT8196_UFSSYS
> +       tristate "Clock driver for MediaTek MT8196 ufssys"
> +       depends on COMMON_CLK_MT8196
> +       default COMMON_CLK_MT8196
> +       help
> +         This driver supports MediaTek MT8196 ufssys clocks.
> +
>  config COMMON_CLK_MT8365
>         tristate "Clock driver for MediaTek MT8365"
>         depends on ARCH_MEDIATEK || COMPILE_TEST
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefil=
e
> index 8888ffd3d7ba..1a497de00846 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -153,6 +153,7 @@ obj-$(CONFIG_COMMON_CLK_MT8195_WPESYS) +=3D clk-mt819=
5-wpe.o
>  obj-$(CONFIG_COMMON_CLK_MT8196) +=3D clk-mt8196-apmixedsys.o clk-mt8196-=
topckgen.o \
>                                    clk-mt8196-topckgen2.o clk-mt8196-vlpc=
kgen.o \
>                                    clk-mt8196-peri_ao.o
> +obj-$(CONFIG_COMMON_CLK_MT8196_UFSSYS) +=3D clk-mt8196-ufs_ao.o
>  obj-$(CONFIG_COMMON_CLK_MT8365) +=3D clk-mt8365-apmixedsys.o clk-mt8365.=
o
>  obj-$(CONFIG_COMMON_CLK_MT8365_APU) +=3D clk-mt8365-apu.o
>  obj-$(CONFIG_COMMON_CLK_MT8365_CAM) +=3D clk-mt8365-cam.o
> diff --git a/drivers/clk/mediatek/clk-mt8196-ufs_ao.c b/drivers/clk/media=
tek/clk-mt8196-ufs_ao.c
> new file mode 100644
> index 000000000000..858706b3ba6f
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8196-ufs_ao.c
> @@ -0,0 +1,109 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025 MediaTek Inc.
> + *                    Guangjie Song <guangjie.song@mediatek.com>
> + * Copyright (c) 2025 Collabora Ltd.
> + *                    Laura Nao <laura.nao@collabora.com>
> + */
> +#include <dt-bindings/clock/mediatek,mt8196-clock.h>
> +#include <dt-bindings/reset/mediatek,mt8196-resets.h>

Nit: add empty line here for separation.

> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +
> +#include "clk-gate.h"
> +#include "clk-mtk.h"
> +
> +#define MT8196_UFSAO_RST0_SET_OFFSET   0x48
> +#define MT8196_UFSAO_RST1_SET_OFFSET   0x148
> +
> +static const struct mtk_gate_regs ufsao0_cg_regs =3D {
> +       .set_ofs =3D 0x108,
> +       .clr_ofs =3D 0x10c,
> +       .sta_ofs =3D 0x104,
> +};
> +
> +static const struct mtk_gate_regs ufsao1_cg_regs =3D {
> +       .set_ofs =3D 0x8,
> +       .clr_ofs =3D 0xc,
> +       .sta_ofs =3D 0x4,
> +};
> +
> +#define GATE_UFSAO0(_id, _name, _parent, _shift) {     \
> +               .id =3D _id,                              \
> +               .name =3D _name,                          \
> +               .parent_name =3D _parent,                 \
> +               .regs =3D &ufsao0_cg_regs,                \
> +               .shift =3D _shift,                        \
> +               .flags =3D CLK_OPS_PARENT_ENABLE,         \

This probably doesn't work correctly, since not every clock defined
below has the "ufs" clock as its parent. If the requirement is that
the "ufs" clock be enabled for accessing this register, it is going
to fail (badly).

ChenYu

> +               .ops =3D &mtk_clk_gate_ops_setclr,        \
> +       }
> +
> +#define GATE_UFSAO1(_id, _name, _parent, _shift) {     \
> +               .id =3D _id,                              \
> +               .name =3D _name,                          \
> +               .parent_name =3D _parent,                 \
> +               .regs =3D &ufsao1_cg_regs,                \
> +               .shift =3D _shift,                        \
> +               .flags =3D CLK_OPS_PARENT_ENABLE,         \
> +               .ops =3D &mtk_clk_gate_ops_setclr,        \
> +       }
> +
> +static const struct mtk_gate ufsao_clks[] =3D {
> +       /* UFSAO0 */
> +       GATE_UFSAO0(CLK_UFSAO_UFSHCI_UFS, "ufsao_ufshci_ufs", "ufs", 0),
> +       GATE_UFSAO0(CLK_UFSAO_UFSHCI_AES, "ufsao_ufshci_aes", "aes_ufsfde=
", 1),
> +       /* UFSAO1 */
> +       GATE_UFSAO1(CLK_UFSAO_UNIPRO_TX_SYM, "ufsao_unipro_tx_sym", "clk2=
6m", 0),
> +       GATE_UFSAO1(CLK_UFSAO_UNIPRO_RX_SYM0, "ufsao_unipro_rx_sym0", "cl=
k26m", 1),
> +       GATE_UFSAO1(CLK_UFSAO_UNIPRO_RX_SYM1, "ufsao_unipro_rx_sym1", "cl=
k26m", 2),
> +       GATE_UFSAO1(CLK_UFSAO_UNIPRO_SYS, "ufsao_unipro_sys", "ufs", 3),
> +       GATE_UFSAO1(CLK_UFSAO_UNIPRO_SAP, "ufsao_unipro_sap", "clk26m", 4=
),
> +       GATE_UFSAO1(CLK_UFSAO_PHY_SAP, "ufsao_phy_sap", "clk26m", 8),
> +};
> +
> +static u16 ufsao_rst_ofs[] =3D {
> +       MT8196_UFSAO_RST0_SET_OFFSET,
> +       MT8196_UFSAO_RST1_SET_OFFSET
> +};
> +
> +static u16 ufsao_rst_idx_map[] =3D {
> +       [MT8196_UFSAO_RST0_UFS_MPHY] =3D 8,
> +       [MT8196_UFSAO_RST1_UFS_UNIPRO] =3D 1 * RST_NR_PER_BANK + 0,
> +       [MT8196_UFSAO_RST1_UFS_CRYPTO] =3D 1 * RST_NR_PER_BANK + 1,
> +       [MT8196_UFSAO_RST1_UFSHCI] =3D 1 * RST_NR_PER_BANK + 2,
> +};
> +
> +static const struct mtk_clk_rst_desc ufsao_rst_desc =3D {
> +       .version =3D MTK_RST_SET_CLR,
> +       .rst_bank_ofs =3D ufsao_rst_ofs,
> +       .rst_bank_nr =3D ARRAY_SIZE(ufsao_rst_ofs),
> +       .rst_idx_map =3D ufsao_rst_idx_map,
> +       .rst_idx_map_nr =3D ARRAY_SIZE(ufsao_rst_idx_map),
> +};
> +
> +static const struct mtk_clk_desc ufsao_mcd =3D {
> +       .clks =3D ufsao_clks,
> +       .num_clks =3D ARRAY_SIZE(ufsao_clks),
> +       .rst_desc =3D &ufsao_rst_desc,
> +};
> +
> +static const struct of_device_id of_match_clk_mt8196_ufs_ao[] =3D {
> +       { .compatible =3D "mediatek,mt8196-ufscfg-ao", .data =3D &ufsao_m=
cd },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, of_match_clk_mt8196_ufs_ao);
> +
> +static struct platform_driver clk_mt8196_ufs_ao_drv =3D {
> +       .probe =3D mtk_clk_simple_probe,
> +       .remove =3D mtk_clk_simple_remove,
> +       .driver =3D {
> +               .name =3D "clk-mt8196-ufs-ao",
> +               .of_match_table =3D of_match_clk_mt8196_ufs_ao,
> +       },
> +};
> +
> +module_platform_driver(clk_mt8196_ufs_ao_drv);
> +MODULE_DESCRIPTION("MediaTek MT8196 ufs_ao clocks driver");
> +MODULE_LICENSE("GPL");
> --
> 2.39.5
>

