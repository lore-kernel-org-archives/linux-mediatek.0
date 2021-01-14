Return-Path: <SRS0=30Xp=GR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8399EC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 07:33:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A04A2389E
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 07:33:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A04A2389E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+vWbh2Yq7a3EmUoTCg+ZvmZiAb7hb42RsTc+D5NFOzc=; b=kXpbeMM9usOwSkRG2VDhKLqgH
	a8nzkzsfJ4G2GWuhDyjtUieUzBg6aOFxPEAfyaDgCwzaaP6n8IyN7471XwFiFOir4/0XjYYKME5xL
	UcN8X6NzVLpOgfvle93hCHOcp49fMp2lyywj5Iqqxmhuxqp0czqDQ48UGgwl6/o+E1U6cXem8Aqch
	wXib58hElwgrH3SVXmr1nDEw5WcE0F0Ku6x/inAGM2L5zXzcwNNMAPQRRoBeTJ+952UvbmhUOHQ+Q
	QgdcMDevX/u7dQZzP9Cv3yA82yPOHjb1NIYWNYXAa5lrZvVN4v35fOS9xBe0eOXKQ754RL+ADt51p
	N/deuGtSQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzx85-0002wy-R3; Thu, 14 Jan 2021 07:33:13 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzx81-0002vU-8s
 for linux-mediatek@lists.infradead.org; Thu, 14 Jan 2021 07:33:10 +0000
Received: by mail-io1-xd35.google.com with SMTP id w18so9439368iot.0
 for <linux-mediatek@lists.infradead.org>; Wed, 13 Jan 2021 23:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gzqGVG/xVbXBY0Dcmb2ISGP5g5vH35TeAFBOy1myEJ4=;
 b=euZ6sUHI8GlsIIp589ixvB23mbfJr6r0VlF2IPuFdp1SN3KJqy+8Ipl24EwgX5mKLV
 7hmz6JZ9r8P0p8j+fzbkJb1yJhhK/5yemBh9OA+iVRi1snK/SAHlG+HxLl8yIkhhlCXs
 A2K2TDIMyAlwHMl1tHI6oD0nJ8H0GzXUgqYZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gzqGVG/xVbXBY0Dcmb2ISGP5g5vH35TeAFBOy1myEJ4=;
 b=QEw3yZFpNq5h+GdDevsaKocFi06RDnMRnftYqLi4P2mNoyqZP82KnxVYAwbLg/scO/
 jS+IkjNEi4LGDrFuS60fHwGtOvCkh07tr3xxdjmnVaXTNotkzNPhQLI8AS6+FnpDYVGR
 cTsH6h/WBy+Dz8eD0/YrvEiEEgzpCx4kxw2H931SH4bC/ishLhR0cY8D2D9q/SNGE8Hj
 aWZX/dZXOc6UscX3tj/U0RekkfN3hKsTW1sty9Rkq0V25CMzIhAdBY6RagFT/MGibzdF
 MDkfRV625dNEEMhQHVvWKv60TTzf+Hu4B2kOUUlGSiPgcGUGEri1xodLgH46iEDrP5Gp
 XBxw==
X-Gm-Message-State: AOAM532DrQLqjku7quc5X+E0/zEsbjdWyymZPLPctZNIFIlzhSoKV6CW
 w7sVLSsRic2MnuYSdUcCxfaOrCYRxZnIh1ORWaf0ww==
X-Google-Smtp-Source: ABdhPJxtpN5VhI7BK+eYcCJv9/seQtxVUNAs/Jxyu4+eQoVpf4nu9K1fxZUvqeMB3Li/PaQ1U51RbfFm1L/2r7uVQNE=
X-Received: by 2002:a92:c7d2:: with SMTP id g18mr5551980ilk.106.1610609585595; 
 Wed, 13 Jan 2021 23:33:05 -0800 (PST)
MIME-Version: 1.0
References: <20210113215723.71966-1-enric.balletbo@collabora.com>
In-Reply-To: <20210113215723.71966-1-enric.balletbo@collabora.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 14 Jan 2021 15:32:39 +0800
Message-ID: <CAJMQK-hDHaKxy9pu6BMqx37=xyzcXPPpU4JAr5rghnpMxp5WxQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mt8183: Add missing power-domain for pwm0 node
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_023309_358732_33A75F2C 
X-CRM114-Status: GOOD (  16.90  )
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
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, lkml <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jan 14, 2021 at 5:57 AM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> The MT8183 display PWM device will not work until the associated
> power-domain is enabled. Add the power-domain reference to the node
> allows the display PWM driver to operate and the backlight turn on.
>
> Fixes: f15722c0fef0 ("arm64: dts: mt8183: Add pwm and backlight node")
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>

> ---
>
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index bda283fa9245..8471c973dfd5 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -661,6 +661,7 @@ pwm0: pwm@1100e000 {
>                         compatible = "mediatek,mt8183-disp-pwm";
>                         reg = <0 0x1100e000 0 0x1000>;
>                         interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_LOW>;
> +                       power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
>                         #pwm-cells = <2>;
>                         clocks = <&topckgen CLK_TOP_MUX_DISP_PWM>,
>                                         <&infracfg CLK_INFRA_DISP_PWM>;
> --
> 2.29.2
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
