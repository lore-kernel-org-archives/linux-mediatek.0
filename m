Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C546C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 05:07:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C18E20836
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 05:07:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h+8S2cMB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OHI23XSw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C18E20836
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HfYkVcWLEaNu6YQnIG3jmZh509B39FUpmFcR2EbRAOo=; b=h+8S2cMB+94IoKChyEARjCsOH
	T5MTg/y82+XteUBwBBFAVYP4xJcxVV5q1bhP9XTL1rQ1tcng3j8SNHFEPE/NWVmQDZces+2ZVYDlZ
	0+NrTwjkFVv/y+W3xoEADzifJVWICOjh6+kRBIDMBrXz84RJCAU/MUgJd+Q7UmY/pbmjM3Jb6OQFr
	No909XcnTItVSoLr2JozysWdTKR721kPekX9LVy1GBEqBvkn++TUg5/gWgkjhYsjbUuOEKGx1cLpQ
	9n2Nks0MKgdFYjYcPpdX+WTqYqLpZ3Is9FXFy+eo7TFQ7irz9cBuTalAaULNUqurpcr7enhD6o85n
	kfSgSlhLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqrRX-0004BH-LA; Thu, 02 Jul 2020 05:07:27 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqrRS-00048a-Vy
 for linux-mediatek@lists.infradead.org; Thu, 02 Jul 2020 05:07:23 +0000
Received: by mail-io1-xd44.google.com with SMTP id q8so27531154iow.7
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Jul 2020 22:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pEqgfz4dMPy0M8UdIl/OP3qCi5/0HDdWhm7+x1JpE8k=;
 b=OHI23XSwOoCtKab9Yrumej03I6gMMsQ5SpRG7rrzTOpLPZPhQBysLX48g5rqWJUmR8
 QrBW5CeLisMKbOFKtg8gbHTK50mBkqkv7GZiOxihU/SU3qE+QAeq6z9A9jASZ+geI9Ib
 wpCuDzRKDdfr0EEUrvTKzx4t0U8xDkCAR91o4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pEqgfz4dMPy0M8UdIl/OP3qCi5/0HDdWhm7+x1JpE8k=;
 b=BCcSiLsQwVSvf3hdh+h7Nt0cjRbXzm1XnM7r97PRPL6GlZv7kMwIsSBxM2uq/UKgTF
 NmdqHeSZHb8CVbEEsGJwQswyM1ssB9z6KQy0U9F4VN1bYvEH8GaF6glxEjpOICGZhSWu
 8WZwHxsnzRlmeZ7bsgn+M94TPm6te0CEXdJG+hD9QSb0EvfG1ID3e9UL13zsgPQBwyOY
 zDZehnylrjnU2eVVBxwkNDDamZ11CsJmHE2/2Lmel4bSch6iYzb1POOuCZxOkUF1vDW3
 i7I+iBp3FOXXKXN9tEHyARdw5VmxMoLxyT2OdWUVeBI/tLGLRweaQOjwVeQzyOHIuQJD
 omGg==
X-Gm-Message-State: AOAM533soSXfYNjZoXmu/UqJPGS5SB5/9wXKFltCsYemlvPNFPnka7pJ
 hkr7lawCcgwVOpMuGXskBhQHc3Iso441XdpFM/Q4ug==
X-Google-Smtp-Source: ABdhPJzARNPpL/MZGeCd0M+vUHJWSbbCFc9ks584J5OlpKLVXK1oxKo3tdUOmzXarQh4NOVw2SgC++mS/VX9KJKONhk=
X-Received: by 2002:a02:30c4:: with SMTP id
 q187mr31283874jaq.102.1593666441584; 
 Wed, 01 Jul 2020 22:07:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200625101757.101775-1-enric.balletbo@collabora.com>
 <20200625101757.101775-7-enric.balletbo@collabora.com>
In-Reply-To: <20200625101757.101775-7-enric.balletbo@collabora.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 2 Jul 2020 13:06:55 +0800
Message-ID: <CAJMQK-iocK5eH9QTQQKNFHtBvpc1C2=U=3kFPXkXiUOiRxrucA@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] arm64: dts: mt8183: Add USB3.0 support
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_010723_084795_58E65ECA 
X-CRM114-Status: GOOD (  13.55  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: erwanaliasr1@gmail.com, Nicolas Boichat <drinkcat@chromium.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jun 25, 2020 at 6:18 PM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> Add the USB3.0 phyter and controller for the MediaTek's MT8183 SoC.
>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>
> Changes in v2:
> - Move adding #phy-cells to this patch. (Matthias Brugger)
>
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 58 ++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 6c00ffa275202..102105871db25 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -9,6 +9,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/reset-controller/mt8183-resets.h>
> +#include <dt-bindings/phy/phy.h>
>  #include "mt8183-pinfunc.h"
>
>  / {
> @@ -648,6 +649,36 @@ i2c8: i2c@1101b000 {
>                         status = "disabled";
>                 };
>
> +               ssusb: usb@11201000 {
> +                       compatible ="mediatek,mt8183-mtu3", "mediatek,mtu3";
> +                       reg = <0 0x11201000 0 0x2e00>,
> +                             <0 0x11203e00 0 0x0100>;
> +                       reg-names = "mac", "ippc";
> +                       interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_LOW>;
> +                       phys = <&u2port0 PHY_TYPE_USB2>,
> +                              <&u3port0 PHY_TYPE_USB3>;
> +                       clocks = <&infracfg CLK_INFRA_UNIPRO_SCK>,
> +                                <&infracfg CLK_INFRA_USB>;
> +                       clock-names = "sys_ck", "ref_ck";
> +                       mediatek,syscon-wakeup = <&pericfg 0x400 0>;
> +                       #address-cells = <2>;
> +                       #size-cells = <2>;
> +                       ranges;
> +                       status = "disabled";
> +
> +                       usb_host: xhci@11200000 {
> +                               compatible = "mediatek,mt8183-xhci",
> +                                            "mediatek,mtk-xhci";
> +                               reg = <0 0x11200000 0 0x1000>;
> +                               reg-names = "mac";
> +                               interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_LOW>;
> +                               clocks = <&infracfg CLK_INFRA_UNIPRO_SCK>,
> +                                        <&infracfg CLK_INFRA_USB>;
> +                               clock-names = "sys_ck", "ref_ck";
> +                               status = "disabled";
> +                       };
> +               };
> +
>                 audiosys: syscon@11220000 {
>                         compatible = "mediatek,mt8183-audiosys", "syscon";
>                         reg = <0 0x11220000 0 0x1000>;
> @@ -684,6 +715,33 @@ efuse: efuse@11f10000 {
>                         reg = <0 0x11f10000 0 0x1000>;
>                 };
>
> +               u3phy: usb-phy@11f40000 {
> +                       compatible = "mediatek,mt8183-tphy",
> +                                    "mediatek,generic-tphy-v2";
> +                       #address-cells = <1>;
> +                       #phy-cells = <1>;
> +                       #size-cells = <1>;
> +                       ranges = <0 0 0x11f40000 0x1000>;
> +                       status = "okay";
> +
> +                       u2port0: usb-phy@0 {
> +                               reg = <0x0 0x700>;
> +                               clocks = <&clk26m>;
> +                               clock-names = "ref";
> +                               #phy-cells = <1>;
> +                               mediatek,discth = <15>;
> +                               status = "okay";
> +                       };
> +
> +                       u3port0: usb-phy@0700 {
> +                               reg = <0x0700 0x900>;
> +                               clocks = <&clk26m>;
> +                               clock-names = "ref";
> +                               #phy-cells = <1>;
> +                               status = "okay";
> +                       };
> +               };
> +
>                 mfgcfg: syscon@13000000 {
>                         compatible = "mediatek,mt8183-mfgcfg", "syscon";
>                         reg = <0 0x13000000 0 0x1000>;
> --
> 2.27.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
