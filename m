Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D39C77B61
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 13:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xQXVsFW+31LBP6C4FWS3nChTZs4iEHGU72CKydQFqio=; b=ih/83pe2VonqNvJtH7RaimRxGF
	sDoJ+oRF4ZVQgMZ5zX6IV3nL4uhMOZVGA2mruEd2dBpIxa6GDTCAize80FpkAoSHPsTrGuy6/Ds6H
	qhKwcPCdcDBrfpH0sRLAxJJb9J4Z09dMdtsHq+NtZnrXZubPYOC+OGFFUW00vUm6sSj1bHS0CDvRP
	MvsC4uKLpMqC4lROSyNr7bVryKDOega/HyHV/dAgoQaazpQgvVnj699AgcXLxc6X8N+c+OgHe7gFp
	beluv66LqFHtT1WC6uMSXFJkDiwT5782FbgoEqiMCi7B/pZ5q2q5zalQXmEnHJXFW+GuJAL8Ro0tS
	+2owWXUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pklst-00AG7C-18;
	Fri, 07 Apr 2023 13:12:07 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pklsq-00AG4T-1s
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 13:12:05 +0000
Received: by mail-yb1-xb29.google.com with SMTP id i20so2365868ybg.10
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 06:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680873119; x=1683465119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQXVsFW+31LBP6C4FWS3nChTZs4iEHGU72CKydQFqio=;
        b=IRfRKDlu6RaKEu1in26D4G49/Azw2xaFqnTAKn9PDgovyFswerslmpygnixR8s2NSK
         Uo4ZH9MpPCpMTvBCBnYDuwqq0DM+Hd5ZSgVWcVQEUYgJuxamcMrN6bfhpHiB4UM6eQzQ
         WtenHFN8TMr568sj2nbpFPn7mdgbbCJWi2Hvxam4RSWBoUr730OdkkOElF8xst0Owmwp
         403ZT4hTzhqeZl2SdRJYF7GJED/PHb2RklrehALiHYJMbDN6L987/tQIz9nG80rGpbWx
         82Vjh5oByJLoImVntYRD1ruU7L+VS8wO7DLxI6wDxqACTD52/pfN43jPuw17GJMpwOXs
         vBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680873119; x=1683465119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xQXVsFW+31LBP6C4FWS3nChTZs4iEHGU72CKydQFqio=;
        b=HlIyxXlDdLonxZl/dIy0jFvROU3Eo6Yr87D5ZRJ//55xyOMc51FuMQs3tCHgI+2qYu
         oDTwagjj3mG0bXi29Q+6SbcmyJTcDyTrWdoM7rpSjjCKlqoKlhIdvN2FKs+TapN0bpYl
         CgeyF9IbMYOXg7br72MqK5ar6CsqIyQMUxlgLhrEdDWZ32VwoIlCOHWUPTmiQ7pxykQX
         4/mORMlkjk4WmIc2JnC1L1D4+ditRwEPcb9g/cZ61hXM8FcoXZCm2CqT+ldBLZBrdzlN
         ZqnfV5Io8NXAoq/2mHyOiJKJAyaFOy+50As/5Z0ssOS7cL6444NYQ0FKLCgYlrt9iqX0
         gQyA==
X-Gm-Message-State: AAQBX9du8cR5ptu5hGHROEktuM/XKt9oKdYXF/pB9QQKFm2pldSdvIDt
	qKfnCx0qNHzMIh/Kw3ZDutEawvj+6h28R+HZdEBG6Q==
X-Google-Smtp-Source: AKy350Zk0g/lHYushSDQgy/obb6GLYwu1nqG93xUzHxpoIdxq4iWwRbMDQOvwLUMYFRiSGqkf+zGcokEKcgpBOK8+e0=
X-Received: by 2002:a25:d958:0:b0:b75:3fd4:1b31 with SMTP id
 q85-20020a25d958000000b00b753fd41b31mr1813905ybg.1.1680873119001; Fri, 07 Apr
 2023 06:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com> <20230203-evk-board-support-v5-4-1883c1b405ad@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v5-4-1883c1b405ad@baylibre.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 7 Apr 2023 15:11:48 +0200
Message-ID: <CAFGrd9o0eSj4cowAZnonfYahqUqG7zc_a+wDDLea2CowBN2nsg@mail.gmail.com>
Subject: Re: [PATCH v5 04/12] arm64: dts: mediatek: add watchdog support for
 mt8365 SoC
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
X-CRM114-CacheID: sfid-20230407_061204_617908_40FA0920 
X-CRM114-Status: GOOD (  12.87  )
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
> Add watchdog support.
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8365.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8365.dtsi
> index 1f6b48359115..bb45aab2e6a9 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> @@ -162,6 +162,12 @@ syscfg_pctl: syscfg-pctl@10005000 {
>                         reg =3D <0 0x10005000 0 0x1000>;
>                 };
>
> +               watchdog: watchdog@10007000 {
> +                       compatible =3D "mediatek,mt8365-wdt", "mediatek,m=
t6589-wdt";
> +                       reg =3D <0 0x10007000 0 0x100>;
> +                       #reset-cells =3D <1>;
> +               };
> +
>                 pio: pinctrl@1000b000 {
>                         compatible =3D "mediatek,mt8365-pinctrl";
>                         reg =3D <0 0x1000b000 0 0x1000>;
>
> --
> 2.25.1
>

