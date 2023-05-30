Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12031C77B7A
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 08:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I9QLzEEeHcOqfv4kFNr/Qspw8g1QoGyjW4Pr7IpYvTM=; b=jBLhGV9Tbgx9h2X43peYBM5fKM
	MYCJHYgb8UAI+qKB2uqFakZpjN5BdhIG+ZujgOHh15hwJ7Cn42WnD/1TcQu/wpdIlcCmoViZdti2d
	nStC3hrpYivMSGO/RJiWg1AEjnAiSfmBhKS4oqDENO+/E3dsY2hMwWopJg9cvjvFGAMkARGi0yGne
	QIMlK8LInIuHcAjUv/KjognH1CHJ2ljK/0y7wZYQxZIPAFGTYZt3mBIF8jVk8Pwj04nxpqaL2m4J9
	etXdAOt1V79w+O0p1xJ7asr4ZGEeHLUl342dTJak6e4jQ6tTrsR5GypYUBzB1s2PlGpPamz58liAv
	ySrEmOJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3ujR-00CwEw-2E;
	Tue, 30 May 2023 08:29:29 +0000
Received: from mail-yw1-f179.google.com ([209.85.128.179])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3ujJ-00CwCG-2u;
	Tue, 30 May 2023 08:29:23 +0000
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-565a77af71fso34482717b3.2;
        Tue, 30 May 2023 01:29:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685435358; x=1688027358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I9QLzEEeHcOqfv4kFNr/Qspw8g1QoGyjW4Pr7IpYvTM=;
        b=IMbjFzywfDykPWOhj5ZYz8WPCZbn8AfwfFTDib39e3SGE6WiN8Y/hRQu30iq0xHYGJ
         wy1W+fWkTawMjWCKKcFzcId3JLvK8Nav+OMhhCT/W+OM1YRvMb/ZE+vkBxfHOrSUAQ1k
         n6Jx1MD0/xfCPZJxJvdxgAv4P9ZhA9AreL4AbEsTTEiDzA2S/ziaPYnhNrrR8SWd2gNE
         YcBz2YUgIO/mhRcUQEtcS6o/rMADZtoQc5bhfso25JHa2HnmoVjK2hB252CqjDoeQ6K2
         Ipv/zaBW3tjqwBpbF+yrATLlHfOr1muwnawvaoALZPo6OcjIMNLyDCWGRnx2DH4kgaIq
         0OtQ==
X-Gm-Message-State: AC+VfDxHJHVIkIE57hdFj5vMsbVXZmShyfSAQT+AFE3k8+sbprI7Wkum
	SpvQBYTfBIvgSzMh+vqQ+BZZb6MODnE2yQ==
X-Google-Smtp-Source: ACHHUZ473nqgLKdixWePNX3Ygz1WrTrZsSTWgAQF3pUmC+igyr93Lo3gKNLxcbOLXclmAaAPpq0Pwg==
X-Received: by 2002:a81:c310:0:b0:568:4918:a9b7 with SMTP id r16-20020a81c310000000b005684918a9b7mr1544787ywk.23.1685435358152;
        Tue, 30 May 2023 01:29:18 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id u130-20020a818488000000b00568b40a1bc1sm805925ywf.19.2023.05.30.01.29.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 01:29:16 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-565ba2c7554so30589337b3.3;
        Tue, 30 May 2023 01:29:16 -0700 (PDT)
X-Received: by 2002:a0d:ca83:0:b0:556:ea38:eb07 with SMTP id
 m125-20020a0dca83000000b00556ea38eb07mr1308427ywd.50.1685435356175; Tue, 30
 May 2023 01:29:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230515131353.v2.cover@dianders> <20230515131353.v2.2.I88dc0a0eb1d9d537de61604cd8994ecc55c0cac1@changeid>
In-Reply-To: <20230515131353.v2.2.I88dc0a0eb1d9d537de61604cd8994ecc55c0cac1@changeid>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 May 2023 10:29:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWM_t7uQqkesM3fnSK7THrmLszA7U54==A0-98xPH90Bw@mail.gmail.com>
Message-ID: <CAMuHMdWM_t7uQqkesM3fnSK7THrmLszA7U54==A0-98xPH90Bw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] irqchip/gic-v3: Disable pseudo NMIs on Mediatek
 devices w/ firmware issues
To: Douglas Anderson <dianders@chromium.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>, linux-mediatek@lists.infradead.org, 
	Eddie Huang <eddie.huang@mediatek.com>, Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, wenst@chromium.org, 
	yidilin@chromium.org, Tinghan Shen <tinghan.shen@mediatek.com>, jwerner@chromium.org, 
	Weiyi Lu <weiyi.lu@mediatek.com>, Ben Ho <Ben.Ho@mediatek.com>, 
	Seiya Wang <seiya.wang@mediatek.com>, linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_012921_939277_0D5394A6 
X-CRM114-Status: GOOD (  40.27  )
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

Hi Douglas,

On Mon, May 15, 2023 at 10:16=E2=80=AFPM Douglas Anderson <dianders@chromiu=
m.org> wrote:
> Some Chromebooks with Mediatek SoCs have a problem where the firmware
> doesn't properly save/restore certain GICR registers. Newer
> Chromebooks should fix this issue and we may be able to do firmware
> updates for old Chromebooks. At the moment, the only known issue with
> these Chromebooks is that we can't enable "pseudo NMIs" since the
> priority register can be lost. Enabling "pseudo NMIs" on Chromebooks
> with the problematic firmware causes crashes and freezes.
>
> Let's detect devices with this problem and then disable "pseudo NMIs"
> on them. We'll detect the problem by looking for the presence of the
> "mediatek,broken-save-restore-fw" property in the GIC device tree
> node. Any devices with fixed firmware will not have this property.
>
> Our detection plan works because we never bake a Chromebook's device
> tree into firmware. Instead, device trees are always bundled with the
> kernel. We'll update the device trees of all affected Chromebooks and
> then we'll never enable "pseudo NMI" on a kernel that is bundled with
> old device trees. When a firmware update is shipped that fixes this
> issue it will know to patch the device tree to remove the property.
>
> In order to make this work, the quick detection mechanism of the GICv3
> code is extended to be able to look for properties in addition to
> looking at "compatible".
>
> Reviewed-by: Julius Werner <jwerner@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v2:
> - mediatek,gicr-save-quirk =3D> mediatek,broken-save-restore-fw

Thanks for your patch, which is now commit 44bd78dd2b8897f5
("irqchip/gic-v3: Disable pseudo NMIs on Mediatek devices w/
firmware issues") in v6.4-rc4.

This causes enabling an unrelated workaround on R-Car V4H:

    GIC: enabling workaround for GICv3: Cavium erratum 38539

> --- a/drivers/irqchip/irq-gic-common.c
> +++ b/drivers/irqchip/irq-gic-common.c
> @@ -16,7 +16,11 @@ void gic_enable_of_quirks(const struct device_node *np=
,
>                           const struct gic_quirk *quirks, void *data)
>  {
>         for (; quirks->desc; quirks++) {
> -               if (!of_device_is_compatible(np, quirks->compatible))
> +               if (quirks->compatible &&
> +                   !of_device_is_compatible(np, quirks->compatible))
> +                       continue;
> +               if (quirks->property &&
> +                   !of_property_read_bool(np, quirks->property))
>                         continue;

Presumably the loop should continue if none of quirks-compatible
or quirks->property is set?

>                 if (quirks->init(data))
>                         pr_info("GIC: enabling workaround for %s\n",
> @@ -28,7 +32,7 @@ void gic_enable_quirks(u32 iidr, const struct gic_quirk=
 *quirks,
>                 void *data)
>  {
>         for (; quirks->desc; quirks++) {
> -               if (quirks->compatible)
> +               if (quirks->compatible || quirks->property)
>                         continue;
>                 if (quirks->iidr !=3D (quirks->mask & iidr))
>                         continue;
> diff --git a/drivers/irqchip/irq-gic-common.h b/drivers/irqchip/irq-gic-c=
ommon.h
> index 27e3d4ed4f32..3db4592cda1c 100644
> --- a/drivers/irqchip/irq-gic-common.h
> +++ b/drivers/irqchip/irq-gic-common.h
> @@ -13,6 +13,7 @@
>  struct gic_quirk {
>         const char *desc;
>         const char *compatible;
> +       const char *property;
>         bool (*init)(void *data);
>         u32 iidr;
>         u32 mask;
> diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> index 6fcee221f201..a605aa79435a 100644
> --- a/drivers/irqchip/irq-gic-v3.c
> +++ b/drivers/irqchip/irq-gic-v3.c
> @@ -39,6 +39,7 @@
>
>  #define FLAGS_WORKAROUND_GICR_WAKER_MSM8996    (1ULL << 0)
>  #define FLAGS_WORKAROUND_CAVIUM_ERRATUM_38539  (1ULL << 1)
> +#define FLAGS_WORKAROUND_MTK_GICR_SAVE         (1ULL << 2)
>
>  #define GIC_IRQ_TYPE_PARTITION (GIC_IRQ_TYPE_LPI + 1)
>
> @@ -1720,6 +1721,15 @@ static bool gic_enable_quirk_msm8996(void *data)
>         return true;
>  }
>
> +static bool gic_enable_quirk_mtk_gicr(void *data)
> +{
> +       struct gic_chip_data *d =3D data;
> +
> +       d->flags |=3D FLAGS_WORKAROUND_MTK_GICR_SAVE;
> +
> +       return true;
> +}
> +
>  static bool gic_enable_quirk_cavium_38539(void *data)
>  {
>         struct gic_chip_data *d =3D data;
> @@ -1792,6 +1802,11 @@ static const struct gic_quirk gic_quirks[] =3D {
>                 .compatible =3D "qcom,msm8996-gic-v3",
>                 .init   =3D gic_enable_quirk_msm8996,
>         },
> +       {
> +               .desc   =3D "GICv3: Mediatek Chromebook GICR save problem=
",
> +               .property =3D "mediatek,broken-save-restore-fw",
> +               .init   =3D gic_enable_quirk_mtk_gicr,
> +       },
>         {
>                 .desc   =3D "GICv3: HIP06 erratum 161010803",
>                 .iidr   =3D 0x0204043b,
> @@ -1834,6 +1849,11 @@ static void gic_enable_nmi_support(void)
>         if (!gic_prio_masking_enabled())
>                 return;
>
> +       if (gic_data.flags & FLAGS_WORKAROUND_MTK_GICR_SAVE) {
> +               pr_warn("Skipping NMI enable due to firmware issues\n");
> +               return;
> +       }
> +
>         ppi_nmi_refs =3D kcalloc(gic_data.ppi_nr, sizeof(*ppi_nmi_refs), =
GFP_KERNEL);
>         if (!ppi_nmi_refs)
>                 return;
> --
> 2.40.1.606.ga4b1b128d6-goog

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

