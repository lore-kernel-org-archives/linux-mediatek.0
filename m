Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAB5C64ED6
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 04:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qsJY49rW0m3b+G5kgYFzLlLOQxDPcqcLAB93HQM1XRw=; b=D4++n1xd8ulU69SCeMwISh0Zi8
	heONKE+SMU7AkqR1iG4MwGCP5nLvhdosEVXl8lxzwrcBQC6mnSGcq8e5C2BWZq0GBdmQWfF7gHL3B
	SBuYFAZeQjL4o0DfCTzTGvkycoqyTvtolJsH6FReLNVhiZijNX67DdUlHXdcMT2lrZYZSlrWQjrSO
	QXYma87/TZMSM728/iDV4pPtrEqZNB28uhipH5RfwaBqDN5BgZZzoMExS39aaeLsQuWR3KyJGxaUS
	vhFE0I1QPn3h9R8iKPkK7sbuqF3gN0pjH9tyAwE3iiolv5/h8bszo9jc3/KgQZzsgJI6J7fUcGbT5
	o2eeRw6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXETb-00F8KB-RO; Wed, 01 Mar 2023 04:54:03 +0000
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXETZ-00F8J0-Ct
	for linux-mediatek@lists.infradead.org; Wed, 01 Mar 2023 04:54:02 +0000
Received: by mail-ua1-x934.google.com with SMTP id bx14so2856091uab.0
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Feb 2023 20:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qsJY49rW0m3b+G5kgYFzLlLOQxDPcqcLAB93HQM1XRw=;
        b=kTGgIXpp9BkG67kug4bzyfR4XkDFSu3l/FGwmHMasBIncT4Jk7oZY3QL5i3c4ZEvtS
         pcu8YDwV8fCaq27Qv74HBbd4P8CKlmc1ninWIfcTbXEgIVSvxaaKunYpBV0IItksEQ8I
         vXi3TT15PHS3DtBvhGdKqkGdbkG04GSytuLgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qsJY49rW0m3b+G5kgYFzLlLOQxDPcqcLAB93HQM1XRw=;
        b=LlKcmtfVEGSnFKxDFdf5m4MlzKww7ofOMH9u33Oa0o/aHFKlXIw5Y3jcVfLSFp9Gzp
         /Ex+S5VpEClne62zAwacyi5Ng4Uj2njxsnGB2nWIGWAUh+c7flImFn38CBk0FNfBZEZY
         8pZ6iUGK8AnpqvfA+aI5sNWgOGb3VgBjYuOEv1RP/3IvYuP3drxAWQdzNR7RE9Vo/yNC
         +iMYngEFnmmZwiWAWPvqPpNEMOMNNHvhmDSNHT/LQ0E9vr1HdtliPIPJl3GZ4H9XWIUh
         /bbzfpaoNkv1SQGEOPRRtAc0woD/pT/w/WQVMeUCjDR/GJU+k0C10VQ1S7rMXlav+tZ4
         JAMA==
X-Gm-Message-State: AO0yUKV+hHDK9ojDRhI9YR4yXWNQGWVETE0anPWMARuZA6ntehwsaPyy
	hhrn8JCKXk6df12gfMTBj3eJigJiULPQ7MzVqhnCcQ==
X-Google-Smtp-Source: AK7set+GqkcxiNkM6nfCo0ys3BssCg6pLDlWZZDXStf63Q01t3V/mLIYphnNot1tZH0dtLtqPgc8cgjBonaVaVMNvps=
X-Received: by 2002:a1f:58c5:0:b0:413:1498:e843 with SMTP id
 m188-20020a1f58c5000000b004131498e843mr2809198vkb.0.1677646435063; Tue, 28
 Feb 2023 20:53:55 -0800 (PST)
MIME-Version: 1.0
References: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com> <20230228104741.717819-12-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230228104741.717819-12-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 1 Mar 2023 12:53:43 +0800
Message-ID: <CAGXv+5FyjoLo1VW2Kep5JWH0tz5JE77XjbwWiKusnTntj2eZHQ@mail.gmail.com>
Subject: Re: [PATCH v3 11/18] arm64: dts: mediatek: mt8192-asurada: Couple
 VGPU and VSRAM_OTHER regulators
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_205401_460386_F8813F46 
X-CRM114-Status: GOOD (  16.85  )
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

On Tue, Feb 28, 2023 at 6:47=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add coupling for these regulators, as VSRAM_OTHER is used to power the
> GPU SRAM, and they have a strict voltage output relation to satisfy in
> order to ensure GPU stable operation.
> While at it, also add voltage constraint overrides for the GPU SRAM
> regulator "mt6359_vsram_others", but don't touch mt6315's vbuck1 as
> its constraints are fine.

The minimum voltage on vbuck1 matches the lowest OPP. However the maximum
voltage is set to the maximum of the regulator itself. The MT8192 datasheet
says the absolute maximum for the GPU is 0.8V, and the recommended range
for 0.8V is 0.72V ~ 0.88V. The highest OPP we have is 0.8V, so I would
just set the maximum voltage to that?

ChenYu

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm6=
4/boot/dts/mediatek/mt8192-asurada.dtsi
> index df477eb89f21..c8b6e1a9605b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> @@ -447,6 +447,13 @@ &mt6359_vrf12_ldo_reg {
>         regulator-always-on;
>  };
>
> +&mt6359_vsram_others_ldo_reg {
> +       regulator-min-microvolt =3D <750000>;
> +       regulator-max-microvolt =3D <850000>;
> +       regulator-coupled-with =3D <&mt6315_7_vbuck1>;
> +       regulator-coupled-max-spread =3D <10000>;
> +};
> +
>  &mt6359_vufs_ldo_reg {
>         regulator-always-on;
>  };
> @@ -1411,6 +1418,8 @@ mt6315_7_vbuck1: vbuck1 {
>                                 regulator-max-microvolt =3D <1193750>;
>                                 regulator-enable-ramp-delay =3D <256>;
>                                 regulator-allowed-modes =3D <0 1 2>;
> +                               regulator-coupled-with =3D <&mt6359_vsram=
_others_ldo_reg>;
> +                               regulator-coupled-max-spread =3D <10000>;
>                         };
>                 };
>         };
> --
> 2.39.2
>

