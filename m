Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52DA8C28B20
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Apr 2025 09:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NvqFvLihDh/0pOLv9eRfMmIbmTTMjctegUodYgsIBs0=; b=Q/PfrmIS1uEVWiqqlofClLPklH
	IGm4LO5u39RcanMKHipKei5PcDKUPprG+V8Pu5VKdLRa/ZHWLKTEi3UHxtkTk5UhxU4Ep5c8qjDwg
	YqpN4o29Hh6c38g/dq+b68yQeKTTHpU8D8NMIiaWyYTR+B+NerSdf+K0XI2gG12IpACtGSUS4xCzN
	3/AR8Pn9dBbMY7fZ9tjdBNd/I8vgoA1lFy9tOKPhZZV4fAQO2gqgYIfWQczYbPzqnR4qzE0zhKCwd
	nmIxRHDCF765yPWcsk9snEAdwfNIWXs8Dmny6I522prfADlm0CBGhouG18awkjGzl5tcdgycSqVLz
	aegm5WPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzuYf-00000005i6W-0mxU;
	Wed, 02 Apr 2025 09:38:53 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzuV5-00000005hbz-1hEG
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Apr 2025 09:35:12 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-54c090fc7adso2242296e87.2
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Apr 2025 02:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743586510; x=1744191310; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvqFvLihDh/0pOLv9eRfMmIbmTTMjctegUodYgsIBs0=;
        b=IUkm+yEQklMtfaHcqUf54644DcAgzHK++99ieqznBlMYMRn69PuirNnysyKV34VhHZ
         cayYCHWhu95f2FGDImWcMds7NE0boq+SbuDcTPy+amrMPyphL6jS+rOOl94oa6FbQRmJ
         9JKZFbaCLrw47/vLf8ArJFf8OYwqgL2RAeffQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743586510; x=1744191310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NvqFvLihDh/0pOLv9eRfMmIbmTTMjctegUodYgsIBs0=;
        b=gwQZgLGffGQFXzGUp8X6MrkHM3D3zMZHofsxABDPKBwfpcae3kK6Liquo8X5PLeGs+
         mTFqV2f6rgHxxkqVXmuMUzy0913ksITj5YkjWlTPQ786tQ5h13GdvNDK3FMq1QgQ9Eai
         rK2ZwUJYeTy4Aira+NYtdl7RKLty58yzW/KAlrgR9j+26qMb4L2QqXsY4f0LNItjRZFN
         0+6ceGIAy4eVFNjHh4p6O+lUmd/TeLN6QeF6A5whEEUcNlZVBQetIaNQmM2mkFKVSG/h
         X3w6Nt5bUXQk2LqBFRL0E/+E2EKdSsDOrFC7feebaCok9A18WKKGQ62fKKx+IO9gtzTD
         bqYg==
X-Gm-Message-State: AOJu0YzkfFZIFyf80fI6+BgeJ2tT34DACHL7QEDvg99FKgTzVnd+Zwmb
	h6KFNTyR8rDtPVPD9gglPH6h1/kTjlArHyO6AsOV7ovxxRr60oWZLIFFyvOE0EioTE9fCbM0Ebk
	/5Z9pUjb+ff1M0XWhSweMWQRvrp8AWrlloVbG
X-Gm-Gg: ASbGncvX06Fej81GT4dnPyJAhwMEh9qpKc0qfBysXms1+onZXcbpjVOuYXTUO00sZii
	/SMWuDIzGUvTACY7vUfB84oCae0xOVM8GtRscBJT3g4iJf1kz8O9KpGFG9ZCBtpG4byLHQl5Dsk
	G3/ydO+EaHYrVvb6Vxg4AUL1fGtqIfff9IlSK9lV/mEEAvmbpdr2Tc
X-Google-Smtp-Source: AGHT+IHolYjToDJLO0MSTMBrUHXLrPk3zfgJ0HVwalaG7YqgYjm+NUtBLWq6MDeTZX2/PLh7y+9Yuwp9U64qQgsq58c=
X-Received: by 2002:a05:6512:3ca4:b0:54a:fa5a:e9b3 with SMTP id
 2adb3069b0e04-54b111401fdmr5382707e87.52.1743586509850; Wed, 02 Apr 2025
 02:35:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250402090615.25871-1-angelogioacchino.delregno@collabora.com> <20250402090615.25871-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250402090615.25871-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 2 Apr 2025 17:34:58 +0800
X-Gm-Features: AQ5f1JqvPNDibEnWSVdu_841YWdl7OuqFaP96Ge_W58uChccFThN9Of9ZLYLgag
Message-ID: <CAGXv+5GHf5D3JDh+OZ-Cxf91PTAGYk2+jvuwK1gymy=k1YOo_A@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] arm64: dts: mediatek: mt8195: Add subsys clks for
 PCIe power domains
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, weiyi.lu@mediatek.com, 
	tinghan.shen@mediatek.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_023511_464510_CF610E57 
X-CRM114-Status: GOOD (  16.81  )
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

On Wed, Apr 2, 2025 at 5:10=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The PCIe MAC needs the sram to be powered on for internal IP
> access and it has always worked before because the bootloader
> on Chromebooks was leaving the PCIe PERI_AO MEM clocks on
> before booting the kernel.
> Add the SRAM (mem) clock as a subsystem clock on the PCIe MAC
> P0 and P1 to correctly describe the hardware and to avoid any
> issue with bootloaders behaving differently.
>
> Fixes: 2b515194bf0c ("arm64: dts: mt8195: Add power domains controller")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8195.dtsi
> index b33726da900b..0cb96cba727a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -792,12 +792,16 @@ power-domain@MT8195_POWER_DOMAIN_CAM_MRAW {
>
>                                 power-domain@MT8195_POWER_DOMAIN_PCIE_MAC=
_P0 {
>                                         reg =3D <MT8195_POWER_DOMAIN_PCIE=
_MAC_P0>;
> +                                       clocks =3D <&pericfg_ao CLK_PERI_=
AO_PCIE_P0_MEM>;
> +                                       clock-names =3D "ss-pextp0-mem";

Doesn't the PCIe host controller already reference this clock?

>                                         mediatek,infracfg =3D <&infracfg_=
ao>;
>                                         #power-domain-cells =3D <0>;
>                                 };
>
>                                 power-domain@MT8195_POWER_DOMAIN_PCIE_MAC=
_P1 {
>                                         reg =3D <MT8195_POWER_DOMAIN_PCIE=
_MAC_P1>;
> +                                       clocks =3D <&pericfg_ao CLK_PERI_=
AO_PCIE_P1_MEM>;
> +                                       clock-names =3D "ss-pextp1-mem";

Not this one though, since:

         /* Designer has connect pcie1 with peri_mem_p0 clock */
         <&pericfg_ao CLK_PERI_AO_PCIE_P0_MEM>;


ChenYu

>                                         mediatek,infracfg =3D <&infracfg_=
ao>;
>                                         #power-domain-cells =3D <0>;
>                                 };
> --
> 2.48.1
>
>

