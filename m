Return-Path: <SRS0=j7dB=GK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BD6C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 05:27:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9230722D71
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 05:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9230722D71
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sSca74/TaH19R/koOboonSopPjmE1Vxl0YrTgTDDLh4=; b=mgkCmBBEsZuuFP5aoRz1TCtVg
	D/H/Crh8kAB/0ukWsBEpBfqCexKGiAyLvzQZx4VaxnFhuyN1Mcu7pVXDhb8JhKTIrAbyzu5+Nf1KG
	0o4Z7yO0WOQlhphOqErNoJQNIKstODGWkPgKYMi/ffQ6zoYkoopyU7UKxeoSkQIx8HZ2yE20/efya
	d5xKM4gt0ewss3SrB+iieBQo2bf+gOTXggceM0xG/fKaWFY6GHYHXQaC8SCRwjiZ3lCtRZIVOoBph
	nuImqzibWkGwqfCNCy/q9dbPkjaAHMqqEC53RwcEXLCGIzH8xTiY6qijdU6T23xFuRjnHnQ3SsB1o
	5YH7ItMcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxNpH-0004Sr-CT; Thu, 07 Jan 2021 05:27:11 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxNpE-0004Rm-D5
 for linux-mediatek@lists.infradead.org; Thu, 07 Jan 2021 05:27:09 +0000
Received: by mail-ua1-x92c.google.com with SMTP id i25so1624869uat.0
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Jan 2021 21:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DL77our55iztoQFTHcrzUPd8D74YCElR4PL+z7wu+tE=;
 b=OjyQY9vIgfuLF929d9DU5SnHiUtSpxLXxLvQtJZ2SZyiA7P3AmVHw+4xzcD07euXZH
 iAeFcVqv2ly3jq3fBIFqHUl7OII9uiJQT5O2ZhI4ERoovHY2bndHVBdfFkqKm9vvkX5R
 pFbb8V7es0KIqSQOUe0KRJlSA5gGBDBsrdyJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DL77our55iztoQFTHcrzUPd8D74YCElR4PL+z7wu+tE=;
 b=RUKf+Z0Q0kEdCiLFjc5dssK1W/tQNqynvo1NbvGg+DTjoUEWnNjEu2sA9oNGfvpcaz
 dm59s8DtWWQARL15XFxCx3xv4gv2lxYvEl1Aa436t0TN28kZyyxYedGW35C+FMa7IekW
 ItmVys6FuGpihcUQ3MbOq1lXd4s8V1J1xxJ2scjWFzQA0wZl9hO+FU+9kLNRc6f3Dkwf
 Li39uSl9NjM4PMbcfVYJd6Uq+bOFlj7yzliQu8hUJhehmzHxNYuj0RD/wK/LsknvbcQS
 L+IkYAgnUlQ7caQfi0yyCdIBkVhX892WTLFNcXFQGvQDIIpnHJofupZHhraI289tC2ez
 iGlg==
X-Gm-Message-State: AOAM533J/F/Zq5MN7rWbGGly+uJzpD2LjuMY7uZ/+ASWNDVu/P1TKAEv
 2eRj6vOmwFjvqBgzH5d3DagnzcGiJkVsjuRu6WO5/Q==
X-Google-Smtp-Source: ABdhPJza3lS4l/BC3JjMmkmHf9Pi95rSoxNXaGQIp2kYtkNvVExUIZyYTCtGmm/WEDb6QKqPXjyKM8SQjMKPBVwMy3Q=
X-Received: by 2002:ab0:74d2:: with SMTP id f18mr6292889uaq.48.1609997226350; 
 Wed, 06 Jan 2021 21:27:06 -0800 (PST)
MIME-Version: 1.0
References: <20210107052206.2599844-1-hsinyi@chromium.org>
In-Reply-To: <20210107052206.2599844-1-hsinyi@chromium.org>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Thu, 7 Jan 2021 13:26:55 +0800
Message-ID: <CANMq1KCadbb+P9Lm7VD+Eq9UoY5ky9UEZjYOYBFSNj3qM4NKJQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: mt8183: config dsi node
To: Hsin-Yi Wang <hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_002708_477102_A445998A 
X-CRM114-Status: GOOD (  17.39  )
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
 lkml <linux-kernel@vger.kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jan 7, 2021 at 1:22 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> Config dsi node for mt8183 kukui. Set panel and ports.
>
> Several kukui boards share the same panel property and only compatible
> is different. So compatible will be set in board dts for comparison
> convenience.

I like this, but maybe others have different opinions ,-)

Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>

> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> Change:
> v2: move compatible to board dts
> ---
>  .../mediatek/mt8183-kukui-krane-sku176.dts    |  5 +++
>  .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 37 +++++++++++++++++++
>  2 files changed, 42 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts
> index 47113e275cb52..721d16f9c3b4f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts
> @@ -16,3 +16,8 @@ / {
>         model = "MediaTek krane sku176 board";
>         compatible = "google,krane-sku176", "google,krane", "mediatek,mt8183";
>  };
> +
> +&panel {
> +        status = "okay";
> +        compatible = "boe,tv101wum-nl6";
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index bf2ad1294dd30..d3d20e4773cf1 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -249,6 +249,35 @@ &cpu7 {
>         proc-supply = <&mt6358_vproc11_reg>;
>  };
>
> +&dsi0 {
> +       status = "okay";
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       panel: panel@0 {
> +               // compatible will be set in board dts
> +               reg = <0>;
> +               enable-gpios = <&pio 45 0>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&panel_pins_default>;
> +               avdd-supply = <&ppvarn_lcd>;
> +               avee-supply = <&ppvarp_lcd>;
> +               pp1800-supply = <&pp1800_lcd>;
> +               port {
> +                       panel_in: endpoint {
> +                               remote-endpoint = <&dsi_out>;
> +                       };
> +               };
> +       };
> +
> +       ports {
> +               port {
> +                       dsi_out: endpoint {
> +                               remote-endpoint = <&panel_in>;
> +                       };
> +               };
> +       };
> +};
> +
>  &i2c0 {
>         pinctrl-names = "default";
>         pinctrl-0 = <&i2c0_pins>;
> @@ -547,6 +576,14 @@ pins_clk {
>                 };
>         };
>
> +       panel_pins_default: panel_pins_default {
> +               panel_reset {
> +                       pinmux = <PINMUX_GPIO45__FUNC_GPIO45>;
> +                       output-low;
> +                       bias-pull-up;
> +               };
> +       };
> +
>         pwm0_pin_default: pwm0_pin_default {
>                 pins1 {
>                         pinmux = <PINMUX_GPIO176__FUNC_GPIO176>;
> --
> 2.29.2.729.g45daf8777d-goog
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
