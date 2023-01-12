Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A13C1C677F1
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jan 2023 10:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4i06mppGYiXhN0gX/mC8nb9SL6Y8d9Zg4Osy3GV9SYg=; b=X/dSQwAmTAdoCEOafR2MZizQv2
	N3LdnBucKYoHgWn+zXbgU6YBLa62AdH8x1Balujim575008BhKUFHiBLiu5Abzhy/WDIKqb1Ag5q/
	w42O3RAKZ9HZ5P/MLo3lAjUUKWlrh8Xvt2lGmrDGIE2DMfFTjs257TD4T0Sxecc5vst9Nd/uxMNKu
	SNesu/qxVJxgHxGenzT6ckSlDcwzbbCu1t5yu9agWpFslrS7Ehe2/U7lVcTfYiPULywMqQxT98vPZ
	pbBQjot5EJowh0PD+b0uQOAtKeXLPeR6Pmyy+6plNz8HIVEU3tg5yurnDv7o65NyMx0jbuQCMAs6a
	J2FF69xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFuOK-00EUqb-58; Thu, 12 Jan 2023 10:01:00 +0000
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFuOF-00EUnU-SI
	for linux-mediatek@lists.infradead.org; Thu, 12 Jan 2023 10:00:58 +0000
Received: by mail-vk1-xa33.google.com with SMTP id l3so5407842vkk.11
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Jan 2023 02:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4i06mppGYiXhN0gX/mC8nb9SL6Y8d9Zg4Osy3GV9SYg=;
        b=dJJzcYTvtPtZKZ4Oo6YyvU+v7YG1bh5MFh5fAmIWm8cSjzoLbPKfvnvSgb40a1ncK1
         3SK1jAOygeZJ+JoEVrIXG1GZg0QjdenjPGpBmGmC74dJNfyvpLkyKEktPDiWxxTXo3iW
         rcuznjSZTCQVEIaAMeNCGIOUz3heRijTYPsXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4i06mppGYiXhN0gX/mC8nb9SL6Y8d9Zg4Osy3GV9SYg=;
        b=W0TwhR2vWh79556vE5gsOSHR9nymNswks73javoavQiKq2F8jTZ9ZgBxljTfEcWFfu
         rswzLyo2iB5G2u/O83bpIKG9LAoMqDiVnIi1QUiFC8R8lLgu6KqQ0F4n5M9UdrGBcrkm
         bX6wqOOeUCx3s/Bm9UlKoaEEwwwlP24pYgG2Uipy18H4muB++uywowypR2/EbsBK6nId
         wMHMQTfbjvxk+/h4Y7F15fCNGj2p2eN1bNosyPOD+zOWtUEwUIE1+leo0jVmliX/eFbz
         yk2j/uEqJHDqY/6CXT7oaW+cd+uZ0KXHfmvVnyIRVtyHFzMLiuqMGZnDSCiluwnxcH7e
         qa/Q==
X-Gm-Message-State: AFqh2kpMhGwbaEaJMraA+yAau1oDGFO68BXEtVnD1YoPCERwaULR1DmU
	uHV18uQgdxfQ0QBiuB9CLih6+E0Ccjx1LyRIs0m17g==
X-Google-Smtp-Source: AMrXdXuwd6kfa03Fjf9jlTXF89gVtVV+1AhRmAg6v5vIaOgGq1AZS2BQHeGXdFJEDzUutm8EX+I3gEp529jY5uCS4Gs=
X-Received: by 2002:a1f:2795:0:b0:3d8:df4c:cfc4 with SMTP id
 n143-20020a1f2795000000b003d8df4ccfc4mr3797463vkn.18.1673517652955; Thu, 12
 Jan 2023 02:00:52 -0800 (PST)
MIME-Version: 1.0
References: <20230111123711.32020-1-allen-kh.cheng@mediatek.com> <20230111123711.32020-10-allen-kh.cheng@mediatek.com>
In-Reply-To: <20230111123711.32020-10-allen-kh.cheng@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 12 Jan 2023 18:00:41 +0800
Message-ID: <CAGXv+5HbTzyWqvn=iJDnWdWS-MM+wyc0w7F-vPXJN489eGYotQ@mail.gmail.com>
Subject: Re: [PATCH 9/9] arm64: dts: mediatek: mt8186: Add display nodes
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-mediatek@lists.infradead.org, hsinyi@chromium.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_020056_011230_8C2A853A 
X-CRM114-Status: GOOD (  18.89  )
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

Hi,

On Wed, Jan 11, 2023 at 8:37 PM Allen-KH Cheng
<allen-kh.cheng@mediatek.com> wrote:
>
> Add display nodes and GCE info for MT8186 SoC. Also, add GCE
> (Global Command Engine) properties to the display nodes in order to
> enable the usage of the CMDQ (Command Queue), which is required for
> operating the display.
>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8186.dtsi | 128 +++++++++++++++++++++++
>  1 file changed, 128 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index eab30ab01572..8670d37970ef 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -5,6 +5,7 @@
>   */
>  /dts-v1/;
>  #include <dt-bindings/clock/mt8186-clk.h>
> +#include <dt-bindings/gce/mt8186-gce.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/memory/mt8186-memory-port.h>
> @@ -632,6 +633,15 @@
>                         clocks = <&clk13m>;
>                 };
>
> +               gce: mailbox@1022c000 {
> +                       compatible = "mediatek,mt8186-gce";
> +                       reg = <0 0X1022c000 0 0x4000>;
> +                       interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>;
> +                       #mbox-cells = <2>;
> +                       clocks = <&infracfg_ao CLK_INFRA_AO_GCE>;
> +                       clock-names = "gce";
> +               };
> +
>                 scp: scp@10500000 {
>                         compatible = "mediatek,mt8186-scp";
>                         reg = <0 0x10500000 0 0x40000>,
> @@ -1197,6 +1207,20 @@
>                         reg = <0 0x14000000 0 0x1000>;
>                         #clock-cells = <1>;
>                         #reset-cells = <1>;
> +                       mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
> +                                <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
> +                       mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
> +               };
> +
> +               mutex: mutex@14001000 {
> +                       compatible = "mediatek,mt8186-disp-mutex";
> +                       reg = <0 0x14001000 0 0x1000>;
> +                       clocks = <&mmsys CLK_MM_DISP_MUTEX0>;
> +                       interrupts = <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH 0>;
> +                       mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x1000 0x1000>;
> +                       mediatek,gce-events = <CMDQ_EVENT_DISP_STREAM_DONE_ENG_EVENT_0>,
> +                                             <CMDQ_EVENT_DISP_STREAM_DONE_ENG_EVENT_1>;
> +                       power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
>                 };
>
>                 smi_common: smi@14002000 {
> @@ -1230,6 +1254,49 @@
>                         power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
>                 };
>
> +               ovl0: ovl@14005000 {

If there's only one instance, you could drop the trailing zero. Same
for all the other nodes.

> +                       compatible = "mediatek,mt8186-disp-ovl",
> +                                    "mediatek,mt8192-disp-ovl";
> +                       reg = <0 0x14005000 0 0x1000>;
> +                       clocks = <&mmsys CLK_MM_DISP_OVL0>;
> +                       interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH 0>;
> +                       iommus = <&iommu_mm IOMMU_PORT_L0_OVL_RDMA0>;
> +                       mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x5000 0x1000>;
> +                       power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
> +               };
> +
> +               ovl0_2l: ovl@14006000 {

I think this should be "ovl_2l0" or "ovl_2l" instead?

> +                       compatible = "mediatek,mt8186-disp-ovl-2l",
> +                                    "mediatek,mt8192-disp-ovl-2l";
> +                       reg = <0 0x14006000 0 0x1000>;
> +                       power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
> +                       clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
> +                       interrupts = <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH 0>;
> +                       iommus = <&iommu_mm IOMMU_PORT_L1_OVL_2L_RDMA0>;
> +                       mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x6000 0x1000>;
> +               };

Also, this patch is missing the aliases for ovl* and rdma*. Without them
the display driver doesn't properly detect the second pipeline, and only
one CRTC is generated.

ChenYu

