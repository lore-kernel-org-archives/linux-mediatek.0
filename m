Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8673ECA5FD9
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2026 08:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cFDRc4rOIO+c40lpmKovemaErB2R9zNLl58jsdIqFX4=; b=DQ/wDfDEFOv3WdOMBpRh+/F3vV
	rETl3zl/Hedlbz9rlR8rnR7htlZ+oX0/naaLSxcsnoxQektzj3ZG0WFcndqngNTN5V67wxSDphou6
	pSE2L2aDmGyaTNxe7JGcf6AF1pAAY8mhC1QP6dBgabR5RD8HVXFVS31N8IRIaRrRFT9j570LxvvU9
	P/amK+I96udjao0Ux54SLaoE1KvJR4SCGpgfqhGuaenisnjyYAPuIjOBasSwxswunqsIg2G+qUqk2
	RelmhHLsY2v48OGuh41xUqf8LQ9+2jYZ/XFouwf+F1ld+F1qpujqadwmqqTBN/ETNJK/BB2KL1ph+
	6ap5BMLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYzU-0000000B2Mr-1CyF;
	Fri, 02 Oct 2026 08:51:40 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYzS-0000000B2Lm-29ps
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Oct 2026 08:51:39 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-396ccda24afso3771805a91.3
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Oct 2026 01:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790931098; x=1791535898; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cFDRc4rOIO+c40lpmKovemaErB2R9zNLl58jsdIqFX4=;
        b=n050FP7exRAT6qS1GGJyWLNiie0mlSheN6tBth1fgG1bxm2+mwA2CJdnn/LBQM6tAs
         25whtMJ/rFR1VcG+jk2OQGoLP9fWHjmQZVFmXc5IYCB30IWOM8yl/qOKsOgd1K6RK38p
         vMDp7PnBhjQmdi4NGO4HePxyFOkyNWtd9yuWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790931098; x=1791535898;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cFDRc4rOIO+c40lpmKovemaErB2R9zNLl58jsdIqFX4=;
        b=xBvdZ3NDKmCIr3va23qTwwhlbLy+BzH5M5GRDkAJnSpUX7yKBVd3M04WsAk1HSXZYO
         phxixo90l/47hwKFB/7vvxbzy17q4J2Ev+TtwSBsJxFy7P6btE+aiakyJIHT2UeA/EQq
         cp1EMbSr3pZMDWf3qX+K5iN37xUi+0HJJi9BwZRJnqCj3BjBK6hhUHResnaIpZAa4OSq
         cIcBD4TUHn7bdO9a1q1e5VPFy1T0WdgTpDQlnI7QnGiiCuyYqM0FdmRbCuYOpteCS4tA
         CkbGB7AqYEwSdNTAMpuKHwp8tnYeh1FL6oY7N5XEzu19xEXMXhLDsWB5op56MkUYrCqs
         IrmA==
X-Forwarded-Encrypted: i=1; AKwUvBwP5B6rue3B41AVzBrtQvjHKDOmsqGWYh9Zb5LZd58WnhV84DJ/6i/hR0hI4RkwwxZZTSnjFatD+5yMNGMvjA==@lists.infradead.org
X-Gm-Message-State: AFq9FYJSZvQwG5tQCrqKvqArmI7QBQgV5O0o5u9KhbAp8TQotDvl1K+4
	a200VsuL+g8xnGu6CUez9NaEJvPX4kXSZmEREnebQ0IOwe+oknxe8cRAMq6f11wTfYsGMgzIbHz
	I5zo=
X-Gm-Gg: AYBFou0ONuIR0L2QU1zA3U7VedGzwSvXBHxYa5+jErcipSzFcGKtg4kgWl61oRqB1qX
	6Wpa6Gk3zpc6gtFSsfhFcWW5xwhIHYAFQ4zG869Wokn+scKEc9KPY3FjfLZlnnQ+jQP+UAQyYNI
	pM4ttOtwHg+pbYlNkCsPZpNlH50l/gIspLqkb33BrKgExa7u44AGOx+p2FkDCoXwiabqGmih0R4
	WElnNnyUcRD/KTtzP9Iq4K+SeQ62M1Fhysk0go14SslIPtmnLKlavC85wFa3OL6pLAtC3wW2ya+
	X+1Qxlv/aPtRcr8nj4l9ggy+EscI/AyGNjh8K4M4ElAdbatlY5LmNTqhsmoGKTEttUIyGnVv4FD
	GjIqLKQUDeO/ChK1+L1kZg4HjcDp0fHH4+W9ruYq7wjnaX8GR+JP1nxUtGNV8hUsq3ChCBLBoVX
	brSNuAqj4C04L94U+B5XJfrfYgLFGD/NyE5POg48WgViOOmsDv2j0jp7OlpTUHUXghQzITAFVvJ
	/BsGRIYWHoyljUnYu4f6Iv26H5T5Is=
X-Received: by 2002:a17:90b:48ce:b0:3a0:cc3f:b93a with SMTP id 98e67ed59e1d1-3a6cdda1a3dmr768222a91.0.1790931097477;
        Fri, 02 Oct 2026 01:51:37 -0700 (PDT)
Received: from google.com ([2a00:79e0:203d:7:eb6d:4917:3e16:43e8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dd4bd483sm1024611a91.4.2026.10.02.01.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 01:51:36 -0700 (PDT)
Date: Fri, 2 Oct 2026 16:51:33 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RFC] arm64: dts: mediatek: mt8183: Switch to undeprecated
 qcom,calibration-variant
Message-ID: <20261002085133.GA2343595@google.com>
References: <20250225101828.107509-1-krzysztof.kozlowski@linaro.org>
 <c50e114a-bb5b-40a4-ab01-69ee33b984b8@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c50e114a-bb5b-40a4-ab01-69ee33b984b8@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_015138_646822_754DCBFA 
X-CRM114-Status: GOOD (  18.48  )
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

On Tue, Feb 25, 2025 at 11:23:23AM +0100, AngeloGioacchino Del Regno wrote:
> Il 25/02/25 11:18, Krzysztof Kozlowski ha scritto:
> > The property qcom,ath10k-calibration-variant was deprecated in favor of
> > recently introduced generic qcom,calibration-variant, common to all
> > Qualcomm Atheros WiFi bindings.
> > 
> > Change will affect out of tree users, like other projects, of this DTS.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > 
> 
> Ah, finally. That's nice :-)
> 
> Regardless of the RFC status....:
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

I think this can be applied now?


ChenYu

> > ---
> > 
> > Dependency/RFC!
> > 
> > RFC, because this should be merged release after driver support is
> > merged:
> > https://lore.kernel.org/linux-devicetree/20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org/T/#t
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts     | 2 +-
> >   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts      | 2 +-
> >   .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts      | 2 +-
> >   .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts      | 2 +-
> >   .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts      | 2 +-
> >   .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts    | 2 +-
> >   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts  | 2 +-
> >   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi  | 2 +-
> >   .../boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts      | 2 +-
> >   .../boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts      | 2 +-
> >   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi   | 2 +-
> >   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi           | 2 +-
> >   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts       | 2 +-
> >   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts       | 2 +-
> >   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi           | 2 +-
> >   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi            | 2 +-
> >   16 files changed, 16 insertions(+), 16 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts
> > index 83bbcfe62083..f2303d9f125f 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts
> > @@ -35,5 +35,5 @@ trackpad@2c {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_COZMO";
> > +	qcom,calibration-variant = "GO_COZMO";
> >   };
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
> > index 3935d83a047e..13ec15fa284f 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
> > @@ -31,7 +31,7 @@ &mt6358codec {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_DAMU";
> > +	qcom,calibration-variant = "GO_DAMU";
> >   };
> >   &i2c2 {
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
> > index 72852b760038..b576b974cf23 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
> > @@ -40,6 +40,6 @@ &touchscreen {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_FENNEL";
> > +	qcom,calibration-variant = "GO_FENNEL";
> >   };
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
> > index 757d0afd14fb..d64581f35d2c 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
> > @@ -28,6 +28,6 @@ &touchscreen {
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_FENNEL";
> > +	qcom,calibration-variant = "GO_FENNEL";
> >   };
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
> > index 6641b087e7c5..d0c98d0aba95 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
> > @@ -28,6 +28,6 @@ &touchscreen {
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_FENNEL";
> > +	qcom,calibration-variant = "GO_FENNEL";
> >   };
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts
> > index 877256eab262..3a81786084da 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts
> > @@ -14,5 +14,5 @@ / {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_FENNEL14";
> > +	qcom,calibration-variant = "GO_FENNEL14";
> >   };
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts
> > index b981dd31a430..959c4d3d9707 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts
> > @@ -14,5 +14,5 @@ / {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_FENNEL14";
> > +	qcom,calibration-variant = "GO_FENNEL14";
> >   };
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi
> > index 078bc765646f..4788edaeab87 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi
> > @@ -22,6 +22,6 @@ trackpad@2c {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_JUNIPER";
> > +	qcom,calibration-variant = "GO_JUNIPER";
> >   };
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts
> > index ddb993521bbf..01cd59993a7c 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts
> > @@ -14,7 +14,7 @@ / {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_FENNEL14";
> > +	qcom,calibration-variant = "GO_FENNEL14";
> >   };
> >   &mmc1_pins_uhs {
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts
> > index 10c4f920a7d8..c939ef3965ec 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts
> > @@ -14,7 +14,7 @@ / {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_FENNEL14";
> > +	qcom,calibration-variant = "GO_FENNEL14";
> >   };
> >   &mmc1_pins_uhs {
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi
> > index c942e461a177..14d03419b92c 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi
> > @@ -37,5 +37,5 @@ trackpad@2c {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_JUNIPER";
> > +	qcom,calibration-variant = "GO_JUNIPER";
> >   };
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> > index ff02f63bac29..c4c08c0f715e 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> > @@ -370,7 +370,7 @@ keyboard-controller {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_KAKADU";
> > +	qcom,calibration-variant = "GO_KAKADU";
> >   };
> >   &panel {
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts
> > index 2b5a8d1f900e..7428efec95a0 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts
> > @@ -32,5 +32,5 @@ &panel {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_KATSU";
> > +	qcom,calibration-variant = "GO_KATSU";
> >   };
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts
> > index 75fadf2c7059..a36b6ddb71f6 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts
> > @@ -32,7 +32,7 @@ &panel {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_KATSU";
> > +	qcom,calibration-variant = "GO_KATSU";
> >   };
> >   &sound {
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> > index da6e767b4cee..2b283a55f653 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> > @@ -349,7 +349,7 @@ keyboard-controller {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_KODAMA";
> > +	qcom,calibration-variant = "GO_KODAMA";
> >   };
> >   &i2c_tunnel {
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> > index 8b56b8564ed7..00da50a41574 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> > @@ -353,7 +353,7 @@ keyboard-controller {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "LE_Krane";
> > +	qcom,calibration-variant = "LE_Krane";
> >   };
> >   &sound {
> 
> 
> 

