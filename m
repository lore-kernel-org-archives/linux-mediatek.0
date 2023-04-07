Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EE0C77B70
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 13:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I3VDM6BonfxZxR/aIqG+UXRPKt9a+mpQkJxjwsAv4Mk=; b=4j2qsjRyuBMy20JbJLPfwCaPYT
	GDUW1HxTCzVXNXHlvk6YHd4ldOOOgdEzrXyoIdbFfm9CsMmKpH/qlwun1s1k85AjTWJu0Hq1lWXWn
	zs8269F9QFP7aChCJMQdpdODvHaWfFc+41CcUA9QhaVC/AoJm1n2aepN4CvBwx++IqyomWpq54/1h
	QTRgXSOUmhMVgeH0hOH5FK2WGsZej3wedHdODlDZNZ+vLHCaXwJxfE7WACsFnyM+ajpOQqixEjuai
	WWtoj8U+LkkUmACPn0y1APloGYEMMsDojq/d6mcMoP6l/DsMpuRumpEoYrSbWf1Jbullg557YsxLx
	ndecKnzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pklva-00AHOB-1G;
	Fri, 07 Apr 2023 13:14:54 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pklvX-00AHMM-31
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 13:14:53 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-545cb3c9898so720155627b3.7
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 06:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680873291; x=1683465291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3VDM6BonfxZxR/aIqG+UXRPKt9a+mpQkJxjwsAv4Mk=;
        b=EYgt6v1IEhj/HYAqnKpiJJom8T1Kf9QMdNP16lSbXvXntvHY8b+pHLX0Iz6SOI1jh8
         XwlqiLigAdgoV9bcjZ/R175Yg8h/ftYTu/rDsoTKv0sdp5GuvmW42QjmUUE8eMqrUKfg
         iiNHm6yG80c39Ibb08M3yA35Q3/aX+ePxocUywjebODgGgGViM/qjtGumsp4p+tYnfTP
         B0A6e3FMsikx9qZHkdeBVN66TrTVeRAneg/iBXPXJt4JWaxrD5YlFbnPn463f51XY6WZ
         e+vEj3MSISq2sj1XSh5g/UEacpNwxevRYv+sI7olEYYFcrXyYHkLIScyKrhsmYQGyKDO
         eeJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680873291; x=1683465291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I3VDM6BonfxZxR/aIqG+UXRPKt9a+mpQkJxjwsAv4Mk=;
        b=rfkalVjc+BwoKs6e3+VqOEKdm8E880LsSW3BQw8LKijMolWcPwlZ5OWvF7AavkWSuq
         C9bS0xOi7nlubkz7ANaRlCHWYMwBJDpmFe/G6M9Qtdgj6/SYvhCpy27GB8ZjEWaIRJVc
         ktUnV/Dk1iGLlB8VBO8CsOd9I6x+n0ZMMpqUUKijOtY14P2idAY08w6UxnOI1L6EJPSW
         Avuzlne33CbcqTODIl5vORL5aRYUmFHdaZ8ioSgKQBm8JovsIA/0LHGu1EB8iugfVxLm
         LKH7/F8cTKCYuBDYvORjWKSq2/EMUXRA7A/PGJWworq34W4Y/i8dXSW5DnQNU4U2X0DJ
         Z/Qg==
X-Gm-Message-State: AAQBX9c9LoVmGGsg3SLblbPPs9Wy8S5Dz4ebNx25pwVi7l64ErGydJ5O
	kFSMuZT36arRfIihWRxxXVhNit8wuLBrtMiVT2o5xQ==
X-Google-Smtp-Source: AKy350biNDWHsrxERmOnUuBy6jK34jRpZaUPgIp3kZ6WDTUIjrWP9DPztnBTYyClXfME+4ltxbPE84/Yb360qJlUgZg=
X-Received: by 2002:a81:af65:0:b0:544:b864:5532 with SMTP id
 x37-20020a81af65000000b00544b8645532mr1038296ywj.3.1680873291116; Fri, 07 Apr
 2023 06:14:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com> <20230203-evk-board-support-v5-12-1883c1b405ad@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v5-12-1883c1b405ad@baylibre.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 7 Apr 2023 15:14:40 +0200
Message-ID: <CAFGrd9qew3P2w7G5FxVPGyNNdx=4ZLeGjSXAktQgeQGyD2FcqA@mail.gmail.com>
Subject: Re: [PATCH v5 12/12] arm64: dts: mediatek: Add CPU Idle support
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
X-CRM114-CacheID: sfid-20230407_061451_976406_788721A4 
X-CRM114-Status: GOOD (  13.20  )
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

Le ven. 7 avr. 2023 =C3=A0 14:59, <amergnat@baylibre.com> a =C3=A9crit :
>
> From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
>
> MT8365 has 3 CPU Idle states:
> - MCDI_CPU. (Multi-Core-Deep-Idle)
> - MCDI_CLUSTER.
> - DPIDLE. (Deep-Idle)
>
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8365.dtsi | 35 ++++++++++++++++++++++++++=
++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8365.dtsi
> index cfe0c67ad61f..413496c92069 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> @@ -128,6 +128,7 @@ cpu0: cpu@0 {
>                         reg =3D <0x0>;
>                         #cooling-cells =3D <2>;
>                         enable-method =3D "psci";
> +                       cpu-idle-states =3D <&CPU_MCDI &CLUSTER_MCDI &CLU=
STER_DPIDLE>;
>                         i-cache-size =3D <0x8000>;
>                         i-cache-line-size =3D <64>;
>                         i-cache-sets =3D <256>;
> @@ -147,6 +148,7 @@ cpu1: cpu@1 {
>                         reg =3D <0x1>;
>                         #cooling-cells =3D <2>;
>                         enable-method =3D "psci";
> +                       cpu-idle-states =3D <&CPU_MCDI &CLUSTER_MCDI &CLU=
STER_DPIDLE>;
>                         i-cache-size =3D <0x8000>;
>                         i-cache-line-size =3D <64>;
>                         i-cache-sets =3D <256>;
> @@ -166,6 +168,7 @@ cpu2: cpu@2 {
>                         reg =3D <0x2>;
>                         #cooling-cells =3D <2>;
>                         enable-method =3D "psci";
> +                       cpu-idle-states =3D <&CPU_MCDI &CLUSTER_MCDI &CLU=
STER_DPIDLE>;
>                         i-cache-size =3D <0x8000>;
>                         i-cache-line-size =3D <64>;
>                         i-cache-sets =3D <256>;
> @@ -185,6 +188,7 @@ cpu3: cpu@3 {
>                         reg =3D <0x3>;
>                         #cooling-cells =3D <2>;
>                         enable-method =3D "psci";
> +                       cpu-idle-states =3D <&CPU_MCDI &CLUSTER_MCDI &CLU=
STER_DPIDLE>;
>                         i-cache-size =3D <0x8000>;
>                         i-cache-line-size =3D <64>;
>                         i-cache-sets =3D <256>;
> @@ -198,6 +202,37 @@ cpu3: cpu@3 {
>                         operating-points-v2 =3D <&cluster0_opp>;
>                 };
>
> +               idle-states {
> +                       entry-method =3D "psci";
> +
> +                       CPU_MCDI: cpu-mcdi {
> +                               compatible =3D "arm,idle-state";
> +                               local-timer-stop;
> +                               arm,psci-suspend-param =3D <0x00010001>;
> +                               entry-latency-us =3D <300>;
> +                               exit-latency-us =3D <200>;
> +                               min-residency-us =3D <1000>;
> +                       };
> +
> +                       CLUSTER_MCDI: cluster-mcdi {
> +                               compatible =3D "arm,idle-state";
> +                               local-timer-stop;
> +                               arm,psci-suspend-param =3D <0x01010001>;
> +                               entry-latency-us =3D <350>;
> +                               exit-latency-us =3D <250>;
> +                               min-residency-us =3D <1200>;
> +                       };
> +
> +                       CLUSTER_DPIDLE: cluster-dpidle {
> +                               compatible =3D "arm,idle-state";
> +                               local-timer-stop;
> +                               arm,psci-suspend-param =3D <0x01010004>;
> +                               entry-latency-us =3D <300>;
> +                               exit-latency-us =3D <800>;
> +                               min-residency-us =3D <3300>;
> +                       };
> +               };
> +
>                 l2: l2-cache {
>                         compatible =3D "cache";
>                         cache-level =3D <2>;
>
> --
> 2.25.1
>

