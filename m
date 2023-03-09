Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE84C64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 04:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1HfEhdsNHcbX3MgYanmt5oONyvC5m572GacJct3ywv8=; b=20wxukwDkY/XT3XAKl+JGhlKFs
	ukEjWCsLpYs+sFpEpiUbf/7wpa8nC6mAufHuYfY0fqJdGXT8P+7y4t84fyx+eDZz/De4BMAtgZn+Y
	ADFAENdkFH1dUoxgtGCDdx24pNgjuwxci04/7IK51AP8pPwJxCXQHjzNqGp8PL2WOktGOihH3Fy6J
	K8GUo3GtWEGYF9Uq4ipJpRBXO1Isn5SfUJ0A2PYtIK62F5Svt9MNXGAaI9osMR8O9rEbmzQJTadQ6
	VdUGa4T4gp9KIg1bDR4iK7TYi6kDnWiKR//xBbIeAMDSod7Dcz5JJDVUDpVHX8nJGwvMhoS/YqQlF
	E7q9Ggbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa85E-007pJp-0c; Thu, 09 Mar 2023 04:40:52 +0000
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa85B-007pHn-H9
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 04:40:50 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id v27so552887vsa.7
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Mar 2023 20:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678336844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1HfEhdsNHcbX3MgYanmt5oONyvC5m572GacJct3ywv8=;
        b=OY4ZWjxAKzzEe17t+/omd8pzCo16GDs+lISGaBNc7ARvCqvIDcXrBWaMz3KPUKAFAx
         MKYjJMlijA0oiag/o9ltWgAulpb5GN7ubgXmPwvO0JcS+CHLTYBkBOAm+jnAVTiSj+dP
         C9gs1nBW8msTqbWyP83xeXc2dm8SJOQ5ZteXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678336844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1HfEhdsNHcbX3MgYanmt5oONyvC5m572GacJct3ywv8=;
        b=4+fvCNcoWqPZE7gV6c7fU0nRRqx8tBxA9BbwqDLt5qZjvm/R1P8STlZDc9V+N2cRPJ
         /cfjUKDJrnHeRtto+uxTfYZ651DoYOKVCfJ1/aYEl/OaG2NYqLwJjdf20mLb0Iq39RJy
         sKoudrK780YvjwEo4LY95a+qc6ydavR5g4RS3qucQ60nT0yhAdqUac+tpfL98b8G5N1M
         /nyNk02YP5B45ovFqwQLnvhbT7hDRBRHX2q3enoG698GL5B5qezJCfyv02ZZBv5ZTaNG
         9dINmC1ExYERjId14llKDVCQgfTQ4qjK11/0Obzn6EwHRHOg8ArZ5XhEEqsTiQWE2Cfq
         wIZA==
X-Gm-Message-State: AO0yUKVh8QU4qFg0N4X1J8dYT5ZNpqeoqqzj92RCNQuCBDB6QeBvvbwJ
	HwMc0TxCnsc21qBouS/c3tIK/xRPROjAg5iBEsN6UA==
X-Google-Smtp-Source: AK7set/qz7AXP379kXCwXSGP7qW4SxN2fHK9WOBBCqjE7wujg+HjwD4MbiqD6RrlzvCfV93hp0pdiEJhzThyfyxm1e0=
X-Received: by 2002:a05:6102:21ae:b0:412:364c:68be with SMTP id
 i14-20020a05610221ae00b00412364c68bemr13182027vsb.7.1678336844113; Wed, 08
 Mar 2023 20:40:44 -0800 (PST)
MIME-Version: 1.0
References: <20230307154524.118541-1-bchihi@baylibre.com> <20230307154524.118541-2-bchihi@baylibre.com>
In-Reply-To: <20230307154524.118541-2-bchihi@baylibre.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Mar 2023 12:40:33 +0800
Message-ID: <CAGXv+5FUrWEF4SZ6DKjoF8Oai--JGFffzQ3_DyzQrUrThVEQ7Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: thermal: mediatek: Add AP domain to LVTS
 thermal controllers for mt8195
To: bchihi@baylibre.com
Cc: daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com, 
	rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com, 
	matthias.bgg@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com, 
	rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_204049_633033_596C4E6D 
X-CRM114-Status: GOOD (  12.43  )
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

On Wed, Mar 8, 2023 at 12:46=E2=80=AFAM <bchihi@baylibre.com> wrote:
>
> From: Balsam CHIHI <bchihi@baylibre.com>
>
> Add AP Domain to LVTS thermal controllers dt-binding definition for mt819=
5.
>
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> ---
>  include/dt-bindings/thermal/mediatek,lvts-thermal.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/include/dt-bindings/thermal/mediatek,lvts-thermal.h b/includ=
e/dt-bindings/thermal/mediatek,lvts-thermal.h
> index c09398920468..8fa5a46675c4 100644
> --- a/include/dt-bindings/thermal/mediatek,lvts-thermal.h
> +++ b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
> @@ -16,4 +16,14 @@
>  #define MT8195_MCU_LITTLE_CPU2  6
>  #define MT8195_MCU_LITTLE_CPU3  7
>
> +#define MT8195_AP_VPU0  8

Can't this start from 0? This is a different hardware block. The index
namespace is separate. Same question for MT8192.

ChenYu

> +#define MT8195_AP_VPU1  9
> +#define MT8195_AP_GPU0  10
> +#define MT8195_AP_GPU1  11
> +#define MT8195_AP_VDEC  12
> +#define MT8195_AP_IMG   13
> +#define MT8195_AP_INFRA 14
> +#define MT8195_AP_CAM0  15
> +#define MT8195_AP_CAM1  16
> +
>  #endif /* __MEDIATEK_LVTS_DT_H */
> --
> 2.34.1
>
>

