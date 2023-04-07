Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0EC3C77B61
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 13:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=43UCQJrVzHswziYr5j431+xtEn2T8Kb0mLYkPJWFQYI=; b=3Io9JyuEmn6/Pljj6Nt3r+IJjl
	7MyhfFj4HChkM31u1KKLwvAcruHpUagap7lrnnSDcK8fvBhN91b03khWOPjVsldVvONvdocNKs0LX
	dooGNoQ8plJe6HVq5rDBHff+H1K4rYj01C4TaJosTwKWo8TNK2p084baYFS6zO4vc/uAxN/xTMjfl
	YMcltP/M0JgjVA3k0H/fUFp7rUW1sWUVWgyGM+laHIkwy5e5JthsxXbCbgX5zYTtkYYTQEdZi1rvG
	75ZqboHRs3Lghjjlu6L4ZOBWOspRwmSHFWPuWHos6kxcp+Z1JKigggV6sx5O7iyUmQgLOzjPnkht8
	aeDMRfRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pklv3-00AH66-2M;
	Fri, 07 Apr 2023 13:14:21 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkluz-00AH3B-2q
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 13:14:20 +0000
Received: by mail-yb1-xb32.google.com with SMTP id h198so5205053ybg.12
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 06:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680873257; x=1683465257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43UCQJrVzHswziYr5j431+xtEn2T8Kb0mLYkPJWFQYI=;
        b=3+FaYIWDw45RP1NCHb0+lFiokMfMZ7MBQBciFil7FihVwy+v7+XYsM+hGga5McbGdy
         7PEmcVy0pAuCdXb6BR+XssMrHW+d4I5au64UqgEI1ciBV3+QhU7KqkoNhQH3lfKAfInz
         DMh/I63ue5b9t9sm3w6Q8VJB/lNLtLbuCDPiuGPMuqntXafe2OWfmFLzAO9lcpFAPdla
         JioF59KPAiD7nn6N8hBu03bS2GjqUckuTy04+w4lqnxxuu18IoygELCtAsLBhuveYnDO
         ttgZkp7VRcBh/mEvcFwU+51sdh34HLQ+hw6hbebW03EI4Ko+bFqHaI982lEabisn5On4
         L2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680873257; x=1683465257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43UCQJrVzHswziYr5j431+xtEn2T8Kb0mLYkPJWFQYI=;
        b=Ja2D8e0wkxv25BIbOFoF6dLA2DKS5VHz71Ou7MMgFH/OP8uxCTd12EuB242gwG2o+6
         3BXW9C98PqKr5a4zM6NJhIDLBkZFV+ydTtjo8Ki2boQrBBenOH0TNkzU2o3FbDPaZt0L
         NwyqatUayN7G8i0R8SWh0OZUtcw2wxqP+oRVw58G0qpAcebeKrSfALl5gO3SR/3eysmt
         +chJDL+0eg8iWKdbuYvyHVAwHv0vZrB4KDAdqD19gQbAxG4b9GT8R1Lazy1X8+wjAiMt
         tnvCZjjTR2UMyBqIxDDqeSKyP4n1L7rnnV3RKQarW6CJ+0iHOLpkU064sUqiVhyFIcQo
         +auA==
X-Gm-Message-State: AAQBX9c/wGsANy+WUeo/H6fMsToo0D82AmzWENpGzcbx7i+4+0FjrqTx
	sJb/J1RnXLUApxE4AFFskPG7/5r/zKrFk3PnR+Tr/MkjT+2c6grouns=
X-Google-Smtp-Source: AKy350bBt2BGk3rQAngcNnk4+eCsUSeEfLrMscG5cjhFuWxjMzW5cxG1UfjeAjNCFrHkIAUzBImsPk28UxKQWlxNGPI=
X-Received: by 2002:a25:d28b:0:b0:b6c:2224:8a77 with SMTP id
 j133-20020a25d28b000000b00b6c22248a77mr1787926ybg.1.1680873256816; Fri, 07
 Apr 2023 06:14:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com> <20230203-evk-board-support-v5-10-1883c1b405ad@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v5-10-1883c1b405ad@baylibre.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 7 Apr 2023 15:14:06 +0200
Message-ID: <CAFGrd9qz5Xxp2xpeA0OeBPVnjCe1wX+2_QHG6_=6ipMnCzBDPw@mail.gmail.com>
Subject: Re: [PATCH v5 10/12] arm64: dts: mediatek: add OPP support for mt8365 SoC
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Zhiyong Tao <zhiyong.tao@mediatek.com>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
	catalin.marinas@arm.com, Will Deacon <will@kernel.org>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, 
	Fabien Parent <fparent@baylibre.com>, Amjad Ouled-Ameur <aouledameur@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_061417_919443_59705A83 
X-CRM114-Status: GOOD (  13.78  )
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

+ To: Catalin Marinas <catalin.marinas@arm.com>
+ To: Will Deacon <will@kernel.org>

Sorry for the noise.

Regards,
Alexandre

Le ven. 7 avr. 2023 =C3=A0 14:59, Alexandre Mergnat <amergnat@baylibre.com>=
 a =C3=A9crit :
>
> In order to have cpufreq support, this patch adds generic Operating
> Performance Points support.
>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8365.dtsi | 101 +++++++++++++++++++++++++=
++++++
>  1 file changed, 101 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8365.dtsi
> index bb45aab2e6a9..cfe0c67ad61f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> @@ -20,6 +20,91 @@ cpus {
>                 #address-cells =3D <1>;
>                 #size-cells =3D <0>;
>
> +       cluster0_opp: opp-table-0 {
> +               compatible =3D "operating-points-v2";
> +               opp-shared;
> +
> +               opp-850000000 {
> +                       opp-hz =3D /bits/ 64 <850000000>;
> +                       opp-microvolt =3D <650000>;
> +               };
> +
> +               opp-918000000 {
> +                       opp-hz =3D /bits/ 64 <918000000>;
> +                       opp-microvolt =3D <668750>;
> +               };
> +
> +               opp-987000000 {
> +                       opp-hz =3D /bits/ 64 <987000000>;
> +                       opp-microvolt =3D <687500>;
> +               };
> +
> +               opp-1056000000 {
> +                       opp-hz =3D /bits/ 64 <1056000000>;
> +                       opp-microvolt =3D <706250>;
> +               };
> +
> +               opp-1125000000 {
> +                       opp-hz =3D /bits/ 64 <1125000000>;
> +                       opp-microvolt =3D <725000>;
> +               };
> +
> +               opp-1216000000 {
> +                       opp-hz =3D /bits/ 64 <1216000000>;
> +                       opp-microvolt =3D <750000>;
> +               };
> +
> +               opp-1308000000 {
> +                       opp-hz =3D /bits/ 64 <1308000000>;
> +                       opp-microvolt =3D <775000>;
> +               };
> +
> +               opp-1400000000 {
> +                       opp-hz =3D /bits/ 64 <1400000000>;
> +                       opp-microvolt =3D <800000>;
> +               };
> +
> +               opp-1466000000 {
> +                       opp-hz =3D /bits/ 64 <1466000000>;
> +                       opp-microvolt =3D <825000>;
> +               };
> +
> +               opp-1533000000 {
> +                       opp-hz =3D /bits/ 64 <1533000000>;
> +                       opp-microvolt =3D <850000>;
> +               };
> +
> +               opp-1633000000 {
> +                       opp-hz =3D /bits/ 64 <1633000000>;
> +                       opp-microvolt =3D <887500>;
> +               };
> +
> +               opp-1700000000 {
> +                       opp-hz =3D /bits/ 64 <1700000000>;
> +                       opp-microvolt =3D <912500>;
> +               };
> +
> +               opp-1767000000 {
> +                       opp-hz =3D /bits/ 64 <1767000000>;
> +                       opp-microvolt =3D <937500>;
> +               };
> +
> +               opp-1834000000 {
> +                       opp-hz =3D /bits/ 64 <1834000000>;
> +                       opp-microvolt =3D <962500>;
> +               };
> +
> +               opp-1917000000 {
> +                       opp-hz =3D /bits/ 64 <1917000000>;
> +                       opp-microvolt =3D <993750>;
> +               };
> +
> +               opp-2001000000 {
> +                       opp-hz =3D /bits/ 64 <2001000000>;
> +                       opp-microvolt =3D <1025000>;
> +               };
> +       };
> +
>                 cpu-map {
>                         cluster0 {
>                                 core0 {
> @@ -50,6 +135,10 @@ cpu0: cpu@0 {
>                         d-cache-line-size =3D <64>;
>                         d-cache-sets =3D <256>;
>                         next-level-cache =3D <&l2>;
> +                       clocks =3D <&mcucfg CLK_MCU_BUS_SEL>,
> +                                <&apmixedsys CLK_APMIXED_MAINPLL>;
> +                       clock-names =3D "cpu", "intermediate";
> +                       operating-points-v2 =3D <&cluster0_opp>;
>                 };
>
>                 cpu1: cpu@1 {
> @@ -65,6 +154,10 @@ cpu1: cpu@1 {
>                         d-cache-line-size =3D <64>;
>                         d-cache-sets =3D <256>;
>                         next-level-cache =3D <&l2>;
> +                       clocks =3D <&mcucfg CLK_MCU_BUS_SEL>,
> +                                <&apmixedsys CLK_APMIXED_MAINPLL>;
> +                       clock-names =3D "cpu", "intermediate", "armpll";
> +                       operating-points-v2 =3D <&cluster0_opp>;
>                 };
>
>                 cpu2: cpu@2 {
> @@ -80,6 +173,10 @@ cpu2: cpu@2 {
>                         d-cache-line-size =3D <64>;
>                         d-cache-sets =3D <256>;
>                         next-level-cache =3D <&l2>;
> +                       clocks =3D <&mcucfg CLK_MCU_BUS_SEL>,
> +                                <&apmixedsys CLK_APMIXED_MAINPLL>;
> +                       clock-names =3D "cpu", "intermediate", "armpll";
> +                       operating-points-v2 =3D <&cluster0_opp>;
>                 };
>
>                 cpu3: cpu@3 {
> @@ -95,6 +192,10 @@ cpu3: cpu@3 {
>                         d-cache-line-size =3D <64>;
>                         d-cache-sets =3D <256>;
>                         next-level-cache =3D <&l2>;
> +                       clocks =3D <&mcucfg CLK_MCU_BUS_SEL>,
> +                                <&apmixedsys CLK_APMIXED_MAINPLL>;
> +                       clock-names =3D "cpu", "intermediate", "armpll";
> +                       operating-points-v2 =3D <&cluster0_opp>;
>                 };
>
>                 l2: l2-cache {
>
> --
> 2.25.1
>

