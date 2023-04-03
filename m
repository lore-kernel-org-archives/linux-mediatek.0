Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A20C76188
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 18:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uJI+R7Z2OIlFqVuwYWesbGzyliYONi9PcdnjVEKDM1o=; b=xcFRUcbPyYLAHTC43uXpkbEf20
	2kOP8sYrr1qgrnyoFiHqQx/Xr7W7iMccge4DeekCWkgsk/2f1zwuSjTQXxEMX+IZ39+a23Myydvhp
	NcX4FX+qdAzsJjTh4uuJ+Lc4TSrlRb8hEzQBzdTrJjU9lkDbmMoz2WxmhjlpHiOfZcm21wzJyFo/t
	VNiue2/ZjMGQwjygRUwV9O8PavNfxfMrWsaDxg1pcDDTRjWGQqkS9nKojYKI6gQug2KC6c94JlUnd
	ZQT4WsjgzvbyizEiKh1nG5cJsqnnhJBQvC8q/uGgdAYdy4qjOmNq92EIkVpfoOkw9zP4v/XBDMXFL
	cw5LU1HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjOwu-00GD6a-3D;
	Mon, 03 Apr 2023 18:30:37 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjNvl-00G4Nb-0L
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Apr 2023 17:25:22 +0000
Received: by mail-wm1-x32c.google.com with SMTP id l10-20020a05600c1d0a00b003f04bd3691eso3686140wms.5
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Apr 2023 10:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680542718;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uJI+R7Z2OIlFqVuwYWesbGzyliYONi9PcdnjVEKDM1o=;
        b=n1quY7QqUla1CplzUDYkiQ/27vTXjJRjzVQEvjeb+uaNXP/M7Phaim99ZCXxkMShMp
         YqRhsALQleSLEIbfBWl/lOOhFUJI7S6j73gamrYhmjuYBJ9Sr/ORnl+h4hJ4kpbzue2r
         tsENu+oE1gOY4u1+Gn2gigXmGtZoH4zbri/qRhjXykYLaVXx9rEhKTL4ng/LaIGwCzbI
         awQczryb4NoalCjVLGre6jrV0N5fWV9PH84TuulLReYJXlL0xo1QBumUlI2Z2k2fN2k7
         takPOyr9GQFYMLIbcoHybFP/YvG44IXLlmxPcuzja0I+FCOuHdZSn1BVdaJlhrlUnNG6
         oybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680542718;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uJI+R7Z2OIlFqVuwYWesbGzyliYONi9PcdnjVEKDM1o=;
        b=Q/gdC6EHCTPHMr1B3cJh6xG19lQv7qSjyV2Nfix3K12BUSxWGb9b7HbhCWdtCRygqO
         pKg/9ZPZmAKfv3hPtOZq4GtuCiCy584khWWb/9uFxWDdoipXaPYHFadBjIrN6exYCCBA
         KZzAP5xqhpxNaAu1hPUtXUunM8cObK7yh46YXgoOitZyaDOLoV5PNbN9YyQXzK0O5EvE
         wWdg/k+3mnR1CPM2G7TVCjYCLLM14CrkzFAFhB8D4VAERd1YJPUfE/AV1WtupOzZe3FL
         wn6xvq83UkKuXjVshWya1rPUKSX+zaFTPC0NHLMsBkTiIFtSRrl6I4Y1QHKOKb1UjC7F
         T3JA==
X-Gm-Message-State: AAQBX9fb9TuA78QH5+j15xjI+5eeYdX/5AypFXa8hbFxl27WKOFi/zj1
	hQkufDl4EZQzkDtbnpSqq37facKxN3IeiYQTDXPHcw==
X-Google-Smtp-Source: AKy350arJwJZmf6GVJKgYAqtK3M80H/h0YB5IchzMw/j7dNdVnxhUoZAx0FpTRuSfsdgq1F0LivXm+9/d34VX5Qsqhg=
X-Received: by 2002:a05:600c:291:b0:3f0:4429:2eb5 with SMTP id
 17-20020a05600c029100b003f044292eb5mr59662wmk.5.1680542718041; Mon, 03 Apr
 2023 10:25:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230328022733.29910-1-tinghan.shen@mediatek.com>
 <20230328022733.29910-12-tinghan.shen@mediatek.com> <848971ea-b142-d088-df6f-74ee2d807950@gmail.com>
In-Reply-To: <848971ea-b142-d088-df6f-74ee2d807950@gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 3 Apr 2023 11:25:07 -0600
Message-ID: <CANLsYkw1viJTWzFZ3gCjFoEwm-TjF0QCLLqqwYGvLjW0fE+6rg@mail.gmail.com>
Subject: Re: [PATCH v9 11/11] arm64: dts: mediatek: mt8195: Add SCP 2nd core
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Tinghan Shen <tinghan.shen@mediatek.com>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_102521_177163_5BD1B42A 
X-CRM114-Status: GOOD (  19.23  )
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

On Fri, 31 Mar 2023 at 05:00, Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 28/03/2023 04:27, Tinghan Shen wrote:
> > Rewrite the MT8195 SCP device node as a cluster and
> > add the SCP 2nd core in it.
> >
> > Since the SCP device node is changed to multi-core structure,
> > enable SCP cluster to enable probing SCP core 0.
> >
> > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>
> As this is a bigger change I'd prefer to take it through my tree once the driver
> and dt-bindings changes are merged. Given the fact, maybe it would make sense to
> take 2/11 through my tree as well.
>

Might as well take the whole thing through your tree, which I'm
totally fine with.  But when that happens, you will also have to pick
up other potential patches that touch these files.  We'll sort it out.

> Regards,
> Matthias
>
> > ---
> >   .../boot/dts/mediatek/mt8195-cherry.dtsi      |  6 +++-
> >   arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 32 ++++++++++++++-----
> >   2 files changed, 29 insertions(+), 9 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> > index 56749cfe7c33..31415d71b6a4 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> > @@ -933,7 +933,11 @@
> >       interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
> >   };
> >
> > -&scp {
> > +&scp_cluster {
> > +     status = "okay";
> > +};
> > +
> > +&scp_c0 {
> >       status = "okay";
> >
> >       firmware-name = "mediatek/mt8195/scp.img";
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > index 8fc527570791..5fe5fb32261e 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > @@ -826,14 +826,30 @@
> >                       clocks = <&infracfg_ao CLK_INFRA_AO_GCE2>;
> >               };
> >
> > -             scp: scp@10500000 {
> > -                     compatible = "mediatek,mt8195-scp";
> > -                     reg = <0 0x10500000 0 0x100000>,
> > -                           <0 0x10720000 0 0xe0000>,
> > -                           <0 0x10700000 0 0x8000>;
> > -                     reg-names = "sram", "cfg", "l1tcm";
> > -                     interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH 0>;
> > +             scp_cluster: scp@10500000 {
> > +                     compatible = "mediatek,mt8195-scp-dual";
> > +                     reg = <0 0x10720000 0 0xe0000>, <0 0x10700000 0 0x8000>;
> > +                     reg-names = "cfg", "l1tcm";
> > +                     #address-cells = <1>;
> > +                     #size-cells = <1>;
> > +                     ranges = <0 0 0x10500000 0x100000>;
> >                       status = "disabled";
> > +
> > +                     scp_c0: scp@0 {
> > +                             compatible = "mediatek,scp-core";
> > +                             reg = <0x0 0xa0000>;
> > +                             reg-names = "sram";
> > +                             interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH 0>;
> > +                             status = "disabled";
> > +                     };
> > +
> > +                     scp_c1: scp@a0000 {
> > +                             compatible = "mediatek,scp-core";
> > +                             reg = <0xa0000 0x20000>;
> > +                             reg-names = "sram";
> > +                             interrupts = <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH 0>;
> > +                             status = "disabled";
> > +                     };
> >               };
> >
> >               scp_adsp: clock-controller@10720000 {
> > @@ -2309,7 +2325,7 @@
> >                                <&iommu_vdo M4U_PORT_L19_VENC_REF_LUMA>,
> >                                <&iommu_vdo M4U_PORT_L19_VENC_REF_CHROMA>;
> >                       interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH 0>;
> > -                     mediatek,scp = <&scp>;
> > +                     mediatek,scp = <&scp_c0>;
> >                       clocks = <&vencsys CLK_VENC_VENC>;
> >                       clock-names = "venc_sel";
> >                       assigned-clocks = <&topckgen CLK_TOP_VENC>;

