Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770D4C6FD18
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 08:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g87QtYvbyFcpRIEyNYcMCc4cgeNxfkvSk5Vpj0Hyzc8=; b=wrGQbEKyVIJKotF6UgBFXG6FxV
	4bIyN6UU6fKTHc1TjC1emck5qQ38L+FD+16b+H0V2pOTimzjAOTG3ANlDf//2KjzRv4axu0Vj2qbi
	Sjz3DdbblDZJ9TehhMdYKv7IPoZFMS7/X4Ze4bKHTJkYVEotEBsyS+zm+SXw7OqDL3izddn8Hj5WC
	mruaDtRagpiMSfe6L6kbfRsFmCUxn9klDBcmZu+8AT9j7gB6dQCDpSbs4zW1LjK/liv6OXevczMqN
	ANqXhJzH1pLypUskSd/qG1D3roWRvtbDxkrytjK3sZziw5cOHmeXldsdbzRNxaZdapdVAORjQnqfH
	HbtQmZxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prDyW-000TdE-25;
	Tue, 25 Apr 2023 08:24:36 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prDyS-000TbI-1B
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Apr 2023 08:24:33 +0000
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-4404c4221e2so1784170e0c.2
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Apr 2023 01:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682411070; x=1685003070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g87QtYvbyFcpRIEyNYcMCc4cgeNxfkvSk5Vpj0Hyzc8=;
        b=C5PFkPyWgHmed4xAl9jksbPjuO1O2fl9/NtlZo3jOPuJZ+9YSApk2q8BkcrCmi7hKH
         dYeKRMBDcgwB8cTSypzr4BghpfSgFTYwL549V6Qa3RCmU8Jcenh/U+SF0HCd9k/cVdy5
         GSmivlXBqNkYPv9yH3AToHRFh3b4Ol7y1obYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682411070; x=1685003070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g87QtYvbyFcpRIEyNYcMCc4cgeNxfkvSk5Vpj0Hyzc8=;
        b=PMNtIYvqurzoXMs83/chErQ+NKiYGfMM9JLM8lcfSXj4jzhCYtVS/m+me2HLFvBZBI
         mbwgNPstZjLnF2AhJ9RLHT2HsSLURHSh3XKJcf2g3J3nu9rJC3EE36GBTs+wBWH9lziB
         l+RnxvFfSeTCkOvP9o8XEqGAu6xA7XRgIvc/xKBTCcG+Pzo+t642l/yBBDACTO27Y2gV
         tAgBrHFjgLB9nX37MuGzjifT1ulaaWhbzz7WEJBRJSzCRc+QDkx/JpVl5paErTtUaOxd
         Mg/nqmJKttt3JEEk8MPXO7Q6ZTs/GwStYZYkTSylfID+4cnT/84z7a4j0WvA0NnvWEpq
         bWCQ==
X-Gm-Message-State: AAQBX9fHiOmb3dsKcnKGT+23OQVIuq9CFqfxsguaRuToN1bfDHwxrhbS
	f9ZPPgI/hCkaQIg3j5QssqGqL/2QrRyMsETiByDAPw==
X-Google-Smtp-Source: AKy350Z7WMHqqGuvOh2NxaHyv6xpmzZoT+sqVI0LpFCd9RViLaPMK29XRpHTZFU4r87tkLGoH1ciasV226IsVo/SiYU=
X-Received: by 2002:a1f:41c1:0:b0:40f:f3e1:53c with SMTP id
 o184-20020a1f41c1000000b0040ff3e1053cmr4535386vka.1.1682411070145; Tue, 25
 Apr 2023 01:24:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230424112523.1436926-1-angelogioacchino.delregno@collabora.com> <20230424112523.1436926-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230424112523.1436926-4-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 25 Apr 2023 16:24:19 +0800
Message-ID: <CAGXv+5EHAGMYE7Z-n6Wtss-sXXa0Rvv=jkse2sqyTOtGYpqR-A@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: mediatek: cherry: Configure eDP and
 internal display
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_012432_402039_04EDD36C 
X-CRM114-Status: GOOD (  14.05  )
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

On Mon, Apr 24, 2023 at 7:25=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add the required nodes to enable the DisplayPort interface, connected
> to the Embedded DisplayPort port, where we have an internal display.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../boot/dts/mediatek/mt8195-cherry.dtsi      | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64=
/boot/dts/mediatek/mt8195-cherry.dtsi
> index 4229f4f7dc2f..adbda4dccdd5 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> @@ -47,6 +47,18 @@ memory@40000000 {
>                 reg =3D <0 0x40000000 0 0x80000000>;
>         };
>
> +       pp3300_disp_x: regulator-pp3300-disp-x {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "pp3300_disp_x";
> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +               enable-active-high;
> +               gpio =3D <&pio 55 GPIO_ACTIVE_HIGH>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&panel_fixed_pins>;
> +               regulator-always-on;

I think you missed my comment on v1 about this regulator's supplier and
enable delay.

ChenYu

> +       };
> +
>         /* system wide LDO 3.3V power rail */
>         pp3300_z5: regulator-pp3300-ldo-z5 {
>                 compatible =3D "regulator-fixed";
> @@ -288,6 +300,20 @@ port@1 {
>                         reg =3D <1>;
>                         edp_out: endpoint {
>                                 data-lanes =3D <0 1 2 3>;
> +                               remote-endpoint =3D <&panel_in>;
> +                       };
> +               };
> +       };
> +
> +       aux-bus {
> +               panel {
> +                       compatible =3D "edp-panel";
> +                       power-supply =3D <&pp3300_disp_x>;
> +                       backlight =3D <&backlight_lcd0>;
> +                       port {
> +                               panel_in: endpoint {
> +                                       remote-endpoint =3D <&edp_out>;
> +                               };
>                         };
>                 };
>         };
> @@ -927,6 +953,12 @@ pins-cs {
>                 };
>         };
>
> +       panel_fixed_pins: panel-pwr-default-pins {
> +               pins-vreg-en {
> +                       pinmux =3D <PINMUX_GPIO55__FUNC_GPIO55>;
> +               };
> +       };
> +
>         pio_default: pio-default-pins {
>                 pins-wifi-enable {
>                         pinmux =3D <PINMUX_GPIO58__FUNC_GPIO58>;
> --
> 2.40.0
>
>

