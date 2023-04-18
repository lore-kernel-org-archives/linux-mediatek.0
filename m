Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3AD6C6FD18
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Apr 2023 11:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2WGHQ4pweNGFtMFZrNERPvaF8bW/gfHqLJ3MdOLvojw=; b=F1FcWIpcwwGYXjobV2UGVZ7llz
	ShW/EXtdsP440aSFZFIiV+KtBgGtS2g6G155TV5eJDZqUVDsbGI2VM8SYnFMD5yIUjK9dKvcOO3EM
	T9OR1FD8MrY5kUFKCMm4ps7hCg4S+9p3Kp/L4I8ROOXVHb1ov4wNagsp0/mbJYo6+YRqxAtVIlIW0
	b4PmU3GU3Q+PJRRd5tttUxOqGdhnu5u5rDVbnjT/iWQ4oY5gOunlMt2cxL3IOZ/ujVDm/haaW7w5D
	D4SEKduMNpC+nNdFwVUa+lHrDxH3m8F4vzxYhS+caYVSRIpnEl8JsuH6VWJurVBd7r+9CDWsDUv7g
	8F8Fk3rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pojfF-001yhN-2j;
	Tue, 18 Apr 2023 11:38:25 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pojf8-001yck-2G
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Apr 2023 11:38:23 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5058181d58dso4903546a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Apr 2023 04:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681817896; x=1684409896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2WGHQ4pweNGFtMFZrNERPvaF8bW/gfHqLJ3MdOLvojw=;
        b=3mZQM680g0A4oB1bUKqA10kScudEElxU2M7gQ1uvBHeX69gO2MxAZ0Agmm4SNRZbqk
         qdK9Lx2i/qXcIaueNhcKnXaR312LCujuN6wB9Q1E7S1a+2LThlnsIUIFv+N2x0wNub46
         9iDZEsBM1xd9gjcERF8PzUh8ev8oEK9IFLwn6SiTFZ5/DABvohDm9FKNxE9gVshIPqtR
         UqBS9/6ZfdEM/U/8fbEsR5MuKdMyA5v9HksOhXKPnKDd7/POMnjecbKl4AxlwKcBmEX2
         Nz68Fj4vDLcEmPq3lhtW5m9au0njJiEi4yCJv+aS70X+p8b2aYD//l4P4fvHBOinGBT4
         cZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681817896; x=1684409896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2WGHQ4pweNGFtMFZrNERPvaF8bW/gfHqLJ3MdOLvojw=;
        b=Ql++afqT7CMhf+C91pB48v4U73AjZ8m49qdK9Q+b/RAnyItC6cRK0mSIQznrkc/cp/
         pY9XimIPoLu3ciVa1ePJMaDZdrvbsSbDgfJaFEbXyvsHvjBmaGhROQhEhfdijJIUQNPo
         PTIpyqR8/ZLIhB4A+8bZa73ViivkhvJsDvXUdvhb6ICi9onniac3bcaJ25BoOIw0pt/e
         ohU+E6PaC9caY2LZ8yb81EfvjCNxJoNTGCzwxqavB6yZcWLhaW/DjhtfD1jj+6d4sbvt
         LiOIIyW/M3STwKQEuuShZiBNeg+17zzixlC1+qr+lW/3pL3E2tixd389HXF8KXZ5Do6U
         TC+g==
X-Gm-Message-State: AAQBX9dj0b9niJ/9+Gn6Yrdwq5Qv4ls5/Tr6Mxxe0ExVKuOoc8nMeXy5
	/kAkYj8FHXzOWxR2Ci5L/w7ZoaC7eEHli0pLHRXEoA==
X-Google-Smtp-Source: AKy350bxplDJsnCYTxx+swlOy0CuJ8Mz3uz9/H8MY7xPsfi1oVIkmtQZ/ETJiRYiVhn57K0pafXhmOVzHZQ3zZIpUz8=
X-Received: by 2002:aa7:db97:0:b0:501:d43e:d1e5 with SMTP id
 u23-20020aa7db97000000b00501d43ed1e5mr1682237edt.2.1681817895745; Tue, 18 Apr
 2023 04:38:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230405100907.53740-1-bchihi@baylibre.com>
In-Reply-To: <20230405100907.53740-1-bchihi@baylibre.com>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Tue, 18 Apr 2023 13:37:41 +0200
Message-ID: <CAGuA+orohjh8YrO18jAntZif-OyYOkzMQEAOjC8_X2wUqEfckw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Add AP domain thermal zones
To: daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com, 
	rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com, 
	matthias.bgg@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, wenst@chromium.org, khilman@baylibre.com, 
	james.lo@mediatek.com, rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_043818_969847_B8000246 
X-CRM114-Status: GOOD (  17.30  )
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

On Wed, Apr 5, 2023 at 12:09=E2=80=AFPM <bchihi@baylibre.com> wrote:
>
> From: Balsam CHIHI <bchihi@baylibre.com>
>
> Add AP Domain thermal zones for the mt8195 and
> specify the targeted temperature thresholds.
>
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
>
> ---
> This patch squashes and replaces
>
> [PATCH 3/4] arm64: dts: mediatek: mt8195: Add AP domain thermal zones
> https://lore.kernel.org/all/20230307154524.118541-4-bchihi@baylibre.com/
>
> and
>
> [PATCH 4/4] arm64: dts: mediatek: mt8195: Add AP domain temperature thres=
holds
> https://lore.kernel.org/all/20230307154524.118541-5-bchihi@baylibre.com/
>
> of the series
>
> [PATCH 0/4] Add LVTS's AP thermal domain support for mt8195
> https://lore.kernel.org/all/20230307154524.118541-1-bchihi@baylibre.com/
> ---
> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 180 +++++++++++++++++++++++
>  1 file changed, 180 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8195.dtsi
> index 972c5b86ddae..75da456c512b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -2909,5 +2909,185 @@ map0 {
>                                 };
>                         };
>                 };
> +
> +               vpu0-thermal {
> +                       polling-delay =3D <1000>;
> +                       polling-delay-passive =3D <250>;
> +                       thermal-sensors =3D <&lvts_ap MT8195_AP_VPU0>;
> +
> +                       trips {
> +                               vpu0_alert: trip-alert {
> +                                       temperature =3D <85000>;
> +                                       hysteresis =3D <2000>;
> +                                       type =3D "passive";
> +                               };
> +
> +                               vpu0_crit: trip-crit {
> +                                       temperature =3D <100000>;
> +                                       hysteresis =3D <2000>;
> +                                       type =3D "critical";
> +                               };
> +                       };
> +               };
> +
> +               vpu1-thermal {
> +                       polling-delay =3D <1000>;
> +                       polling-delay-passive =3D <250>;
> +                       thermal-sensors =3D <&lvts_ap MT8195_AP_VPU1>;
> +
> +                       trips {
> +                               vpu1_alert: trip-alert {
> +                                       temperature =3D <85000>;
> +                                       hysteresis =3D <2000>;
> +                                       type =3D "passive";
> +                               };
> +
> +                               vpu1_crit: trip-crit {
> +                                       temperature =3D <100000>;
> +                                       hysteresis =3D <2000>;
> +                                       type =3D "critical";
> +                               };
> +                       };
> +               };
> +
> +               gpu0-thermal {
> +                       polling-delay =3D <1000>;
> +                       polling-delay-passive =3D <250>;
> +                       thermal-sensors =3D <&lvts_ap MT8195_AP_GPU0>;
> +
> +                       trips {
> +                               gpu0_alert: trip-alert {
> +                                       temperature =3D <85000>;
> +                                       hysteresis =3D <2000>;
> +                                       type =3D "passive";
> +                               };
> +
> +                               gpu0_crit: trip-crit {
> +                                       temperature =3D <100000>;
> +                                       hysteresis =3D <2000>;
> +                                       type =3D "critical";
> +                               };
> +                       };
> +               };
> +
> +               gpu1-thermal {
> +                       polling-delay =3D <1000>;
> +                       polling-delay-passive =3D <250>;
> +                       thermal-sensors =3D <&lvts_ap MT8195_AP_GPU1>;
> +
> +                       trips {
> +                               gpu1_alert: trip-alert {
> +                                       temperature =3D <85000>;
> +                                       hysteresis =3D <2000>;
> +                                       type =3D "passive";
> +                               };
> +
> +                               gpu1_crit: trip-crit {
> +                                       temperature =3D <100000>;
> +                                       hysteresis =3D <2000>;
> +                                       type =3D "critical";
> +                               };
> +                       };
> +               };
> +
> +               vdec-thermal {
> +                       polling-delay =3D <1000>;
> +                       polling-delay-passive =3D <250>;
> +                       thermal-sensors =3D <&lvts_ap MT8195_AP_VDEC>;
> +
> +                       trips {
> +                               vdec_alert: trip-alert {
> +                                       temperature =3D <85000>;
> +                                       hysteresis =3D <2000>;
> +                                       type =3D "passive";
> +                               };
> +
> +                               vdec_crit: trip-crit {
> +                                       temperature =3D <100000>;
> +                                       hysteresis =3D <2000>;
> +                                       type =3D "critical";
> +                               };
> +                       };
> +               };
> +
> +               img-thermal {
> +                       polling-delay =3D <1000>;
> +                       polling-delay-passive =3D <250>;
> +                       thermal-sensors =3D <&lvts_ap MT8195_AP_IMG>;
> +
> +                       trips {
> +                               img_alert: trip-alert {
> +                                       temperature =3D <85000>;
> +                                       hysteresis =3D <2000>;
> +                                       type =3D "passive";
> +                               };
> +
> +                               img_crit: trip-crit {
> +                                       temperature =3D <100000>;
> +                                       hysteresis =3D <2000>;
> +                                       type =3D "critical";
> +                               };
> +                       };
> +               };
> +
> +               infra-thermal {
> +                       polling-delay =3D <1000>;
> +                       polling-delay-passive =3D <250>;
> +                       thermal-sensors =3D <&lvts_ap MT8195_AP_INFRA>;
> +
> +                       trips {
> +                               infra_alert: trip-alert {
> +                                       temperature =3D <85000>;
> +                                       hysteresis =3D <2000>;
> +                                       type =3D "passive";
> +                               };
> +
> +                               infra_crit: trip-crit {
> +                                       temperature =3D <100000>;
> +                                       hysteresis =3D <2000>;
> +                                       type =3D "critical";
> +                               };
> +                       };
> +               };
> +
> +               cam0-thermal {
> +                       polling-delay =3D <1000>;
> +                       polling-delay-passive =3D <250>;
> +                       thermal-sensors =3D <&lvts_ap MT8195_AP_CAM0>;
> +
> +                       trips {
> +                               cam0_alert: trip-alert {
> +                                       temperature =3D <85000>;
> +                                       hysteresis =3D <2000>;
> +                                       type =3D "passive";
> +                               };
> +
> +                               cam0_crit: trip-crit {
> +                                       temperature =3D <100000>;
> +                                       hysteresis =3D <2000>;
> +                                       type =3D "critical";
> +                               };
> +                       };
> +               };
> +
> +               cam1-thermal {
> +                       polling-delay =3D <1000>;
> +                       polling-delay-passive =3D <250>;
> +                       thermal-sensors =3D <&lvts_ap MT8195_AP_CAM1>;
> +
> +                       trips {
> +                               cam1_alert: trip-alert {
> +                                       temperature =3D <85000>;
> +                                       hysteresis =3D <2000>;
> +                                       type =3D "passive";
> +                               };
> +
> +                               cam1_crit: trip-crit {
> +                                       temperature =3D <100000>;
> +                                       hysteresis =3D <2000>;
> +                                       type =3D "critical";
> +                               };
> +                       };
> +               };
>         };
>  };
> --
> 2.34.1
>

Hello Matthias,

Is there any news about this patch?

Best regards,
Balsam

