Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61679E8FDC8
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Oct 2023 10:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YVObFCNLlwBPipdK3H8KmPs3z72Q3xYU1AFPpgt6DIU=; b=q4t5x2vBwfiLc+OvnMpyrngUZ5
	RPlUhZJfLiyCmNQFYvtixovYBjzOnH7/Sv/6sIj3uGAW11I5HwBkoGm0lBfWlbL1kWS+htCnDqHBc
	n28BLckKlznCdHjLWcJyamY3Y2gM3iZiuKp0YMSiK7M/vL4UpK+/pukueLHcNwwoJ1njPJtbEPTvx
	yzz/46+sfRfZgzgyRasy+fvExaNFQAekdJCiSFPAbzVd3iEp//7+pUDWDQlCeqstWbQxvtTwgMiMW
	xtMowDlkbYktB+hYC1JtVYOg2UmsDAxn2Nl5Hshx10ymg7t/qcgcxSs3IvB5UJo2abGN1lIOuqxTj
	GCIaAjpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoLp3-001vrK-04;
	Thu, 05 Oct 2023 10:43:13 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoLoz-001voc-0o
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Oct 2023 10:43:11 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5042bfb4fe9so1040571e87.1
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Oct 2023 03:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696502585; x=1697107385; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVObFCNLlwBPipdK3H8KmPs3z72Q3xYU1AFPpgt6DIU=;
        b=GLVR93zaONczdmfSSo9YqYAutaE31tnDOJEHAE+96O+g/WOzriyGi+AcUPK75oeaOt
         lfk2loAdTDepQahPoFWkhEHEbdKXr/8P5y+RUdbEIcRqfrA+Wc6XkRLGB6xMdLEmvcgQ
         NUTRdeq9Ukm9XVZzNC0QenH0/+F0oimDXCfZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696502585; x=1697107385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YVObFCNLlwBPipdK3H8KmPs3z72Q3xYU1AFPpgt6DIU=;
        b=ulN81SXe2aoO99FHQKe8pu3SAjlT/sPlL/GSyar5QVriODPdMwkdwiK1M2BGZ54e4/
         Ht/pM8R/XSYOHlT0RKC7dkW8rRn4NXDXfLNEJmOtsDFnLe1LVkuIgej4624gXN7EJEDO
         ETmURYkOxv3kFCTgTnsvgSmS4FMGZpAV7R4xMG1ypP/FOsEnroS/3CGaCNmE0dQkBg91
         TlNBxocgs8wLdubf5pK8n/TCoZB7bjKNY/Ms3SH74Q698TgYygSO5hG2HrQAuMy9DnR9
         VNX3b9yTuZBkJnxdgLIBHQSfOF29c+kHOZ8ja5bz+kfcjRwVRLdy6GTkJ1P5V6nIdNfX
         d++g==
X-Gm-Message-State: AOJu0Yzw0NsH53gafWyyFC0whO/XQY0oohuphetFApWql3gbH0585syY
	Run+g+TXTNeCeDAIORbp4xwSkfmVXSSMpcAdVRBEiw==
X-Google-Smtp-Source: AGHT+IHq9DTTPcqEv9hIoZgRG2eMrgjishCCWpwEDsoQWepchJMVarAVpJnzNCiyrgnB7Vjj2+qg9uOeeeYiBZ0Vpnw=
X-Received: by 2002:a19:4f4d:0:b0:500:bff5:54ec with SMTP id
 a13-20020a194f4d000000b00500bff554ecmr3807702lfk.3.1696502584574; Thu, 05 Oct
 2023 03:43:04 -0700 (PDT)
MIME-Version: 1.0
References: <20231005103041.352478-1-eugen.hristev@collabora.com>
In-Reply-To: <20231005103041.352478-1-eugen.hristev@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 5 Oct 2023 18:42:53 +0800
Message-ID: <CAGXv+5GRhqC98=PARwbD4ueaWqdWZiYwSPS4F8TEUF57dnH2WQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8186: fix clock names for power domains
To: Eugen Hristev <eugen.hristev@collabora.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	allen-kh.cheng@mediatek.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_034309_327701_BA6F93F5 
X-CRM114-Status: GOOD (  22.95  )
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

On Thu, Oct 5, 2023 at 6:31=E2=80=AFPM Eugen Hristev
<eugen.hristev@collabora.com> wrote:
>
> Clocks for each power domain are split into big categories: pd clocks
> and subsys clocks.
> According to the binding, all clocks which have a dash '-' in their name
> are treated as subsys clocks, and must be placed at the end of the list.
> The other clocks which are pd clocks must come first.
> Fixed the naming and the placing of all clocks in the power domains.
> For the avoidance of doubt, prefixed all subsys clocks with the 'subsys'
> prefix. The binding does not enforce strict clock names, the driver
> uses them in bulk, only making a difference for pd clocks vs subsys clock=
s.
>
> The above problem appears to be trivial, however, it leads to incorrect
> power up and power down sequence of the power domains, because some
> clocks will be mistakenly taken for subsys clocks and viceversa.
> One consequence is the fact that if the DIS power domain goes power down
> and power back up during the boot process, when it comes back up, there
> are still transactions left on the bus which makes the display inoperable=
.
>
> Some of the clocks for the DIS power domain were wrongly using '_' instea=
d
> of '-', which again made these clocks being treated as pd clocks instead =
of
> subsys clocks.
>
> Fixes: d9e43c1e7a38 ("arm64: dts: mt8186: Add power domains controller")
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

This brings the display back to life on my MT8186 device. :D
Thank you for tracking down the issue!

> ---
>  arch/arm64/boot/dts/mediatek/mt8186.dtsi | 42 +++++++++++++++---------
>  1 file changed, 27 insertions(+), 15 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8186.dtsi
> index af6f6687de35..7121d4312bee 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -924,7 +924,8 @@ power-domain@MT8186_POWER_DOMAIN_CSIRX_TOP {
>                                         reg =3D <MT8186_POWER_DOMAIN_CSIR=
X_TOP>;
>                                         clocks =3D <&topckgen CLK_TOP_SEN=
INF>,
>                                                  <&topckgen CLK_TOP_SENIN=
F1>;
> -                                       clock-names =3D "csirx_top0", "cs=
irx_top1";
> +                                       clock-names =3D "subsys-csirx-top=
0",
> +                                                     "subsys-csirx-top1"=
;
>                                         #power-domain-cells =3D <0>;
>                                 };
>
> @@ -942,7 +943,8 @@ power-domain@MT8186_POWER_DOMAIN_ADSP_AO {
>                                         reg =3D <MT8186_POWER_DOMAIN_ADSP=
_AO>;
>                                         clocks =3D <&topckgen CLK_TOP_AUD=
IODSP>,
>                                                  <&topckgen CLK_TOP_ADSP_=
BUS>;
> -                                       clock-names =3D "audioadsp", "ads=
p_bus";
> +                                       clock-names =3D "audioadsp",
> +                                                     "subsys-adsp-bus";
>                                         #address-cells =3D <1>;
>                                         #size-cells =3D <0>;
>                                         #power-domain-cells =3D <1>;
> @@ -975,8 +977,11 @@ power-domain@MT8186_POWER_DOMAIN_DIS {
>                                                  <&mmsys CLK_MM_SMI_COMMO=
N>,
>                                                  <&mmsys CLK_MM_SMI_GALS>=
,
>                                                  <&mmsys CLK_MM_SMI_IOMMU=
>;
> -                                       clock-names =3D "disp", "mdp", "s=
mi_infra", "smi_common",
> -                                                    "smi_gals", "smi_iom=
mu";
> +                                       clock-names =3D "disp", "mdp",
> +                                                     "subsys-smi-infra",
> +                                                     "subsys-smi-common"=
,
> +                                                     "subsys-smi-gals",
> +                                                     "subsys-smi-iommu";
>                                         mediatek,infracfg =3D <&infracfg_=
ao>;
>                                         #address-cells =3D <1>;
>                                         #size-cells =3D <0>;
> @@ -993,15 +998,17 @@ power-domain@MT8186_POWER_DOMAIN_VDEC {
>
>                                         power-domain@MT8186_POWER_DOMAIN_=
CAM {
>                                                 reg =3D <MT8186_POWER_DOM=
AIN_CAM>;
> -                                               clocks =3D <&topckgen CLK=
_TOP_CAM>,
> -                                                        <&topckgen CLK_T=
OP_SENINF>,
> +                                               clocks =3D <&topckgen CLK=
_TOP_SENINF>,
>                                                          <&topckgen CLK_T=
OP_SENINF1>,
>                                                          <&topckgen CLK_T=
OP_SENINF2>,
>                                                          <&topckgen CLK_T=
OP_SENINF3>,
> +                                                        <&camsys CLK_CAM=
2MM_GALS>,
>                                                          <&topckgen CLK_T=
OP_CAMTM>,
> -                                                        <&camsys CLK_CAM=
2MM_GALS>;
> -                                               clock-names =3D "cam-top"=
, "cam0", "cam1", "cam2",
> -                                                            "cam3", "cam=
-tm", "gals";
> +                                                        <&topckgen CLK_T=
OP_CAM>;
> +                                               clock-names =3D "cam0", "=
cam1", "cam2",
> +                                                             "cam3", "ga=
ls",
> +                                                             "subsys-cam=
-tm",
> +                                                             "subsys-cam=
-top";
>                                                 mediatek,infracfg =3D <&i=
nfracfg_ao>;
>                                                 #address-cells =3D <1>;
>                                                 #size-cells =3D <0>;
> @@ -1020,9 +1027,9 @@ power-domain@MT8186_POWER_DOMAIN_CAM_RAWA {
>
>                                         power-domain@MT8186_POWER_DOMAIN_=
IMG {
>                                                 reg =3D <MT8186_POWER_DOM=
AIN_IMG>;
> -                                               clocks =3D <&topckgen CLK=
_TOP_IMG1>,
> -                                                        <&imgsys1 CLK_IM=
G1_GALS_IMG1>;
> -                                               clock-names =3D "img-top"=
, "gals";
> +                                               clocks =3D <&imgsys1 CLK_=
IMG1_GALS_IMG1>,
> +                                                        <&topckgen CLK_T=
OP_IMG1>;
> +                                               clock-names =3D "gals", "=
subsys-img-top";
>                                                 mediatek,infracfg =3D <&i=
nfracfg_ao>;
>                                                 #address-cells =3D <1>;
>                                                 #size-cells =3D <0>;
> @@ -1041,8 +1048,11 @@ power-domain@MT8186_POWER_DOMAIN_IPE {
>                                                          <&ipesys CLK_IPE=
_LARB20>,
>                                                          <&ipesys CLK_IPE=
_SMI_SUBCOM>,
>                                                          <&ipesys CLK_IPE=
_GALS_IPE>;
> -                                               clock-names =3D "ipe-top"=
, "ipe-larb0", "ipe-larb1",
> -                                                             "ipe-smi", =
"ipe-gals";
> +                                               clock-names =3D "subsys-i=
pe-top",
> +                                                             "subsys-ipe=
-larb0",
> +                                                             "subsys-ipe=
-larb1",
> +                                                             "subsys-ipe=
-smi",
> +                                                             "subsys-ipe=
-gals";
>                                                 mediatek,infracfg =3D <&i=
nfracfg_ao>;
>                                                 #power-domain-cells =3D <=
0>;
>                                         };
> @@ -1061,7 +1071,9 @@ power-domain@MT8186_POWER_DOMAIN_WPE {
>                                                 clocks =3D <&topckgen CLK=
_TOP_WPE>,
>                                                          <&wpesys CLK_WPE=
_SMI_LARB8_CK_EN>,
>                                                          <&wpesys CLK_WPE=
_SMI_LARB8_PCLK_EN>;
> -                                               clock-names =3D "wpe0", "=
larb-ck", "larb-pclk";
> +                                               clock-names =3D "wpe0",
> +                                                             "subsys-lar=
b-ck",
> +                                                             "subsys-lar=
b-pclk";
>                                                 mediatek,infracfg =3D <&i=
nfracfg_ao>;
>                                                 #power-domain-cells =3D <=
0>;
>                                         };
> --
> 2.34.1
>
>

