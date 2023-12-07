Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE51FC4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 05:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pbKB3KDCHyMmrCqIdSUXcNbNj3UTGK2AJVOLsxCphNY=; b=Es+uia1w4yv5CbBE0qsPGYJiQh
	5znkzVfbLgOfndWOZ02UThUdZX8NKFnbsJnsP2WbXUozFW5VA4f+7y0vjHpJi/WGVwUIqBBTB9G/v
	dyo2+zKAt54fLKW//H1p/Z+AJToqJrV/b9ioUPbkHpe9FHogDdqHODtG0Aak+AR7Ju33AQBOo7o05
	DwVMiHAKlcRV7DvduzN8ojR+YmYO8EzX+Yxl3/qqmo70JZYJzM9nNtvGWhkrzYGDglfcU5SLpNvye
	BzPNb+6AseGS33ZYJlmfmbnNX6OwzS29CGAScWf9CAJjw0m00UCgKJEa0DzOuSIjT2T4yz4Zx3O6l
	QIcfErlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rB78Q-00Bv92-0d;
	Thu, 07 Dec 2023 05:41:18 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rB78N-00Bv8M-38
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Dec 2023 05:41:17 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-5c699b44dddso363757a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 06 Dec 2023 21:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701927674; x=1702532474; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pbKB3KDCHyMmrCqIdSUXcNbNj3UTGK2AJVOLsxCphNY=;
        b=m9222u/UAglfqMr6R6uX25WRs4UYFrVvZSutx4BTrSU6DDRyAJfGng2UJr9zyGeDfW
         PVulegPGOAX4HyEyE72GsB89fuD8FlY1jiZiS7UBlzKm4eh/lLwWMf1yt7ueIagZVsEP
         77FRBjQxjVGTX0uTvif0/c640XyoxpOPmNUgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701927674; x=1702532474;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pbKB3KDCHyMmrCqIdSUXcNbNj3UTGK2AJVOLsxCphNY=;
        b=H03a955Rf/j06HRJ+Vb6vOFQJoDx1AxyrtGX+4sahpoavdj1fg4mFWrHMgMEDHxEfd
         LBQpA9nH6fWvVkkG8RulqrNpiZWsaqui0SKDQOZGgmQzciNezVZl+cOg2UsIeMebc9BW
         tEorQD9db4tvWI/CXFl5jQqvisupVzGIPe2D5tKwH8yjfeMO29rbL/gwFQtktbZQTYsV
         ZL5CYasxY4XlduDDQDNPwGPlIZBqOrENxwcIsEfJown6fVCIuMlRaHlf7FDgBETJE8FT
         RfgwP8NEq78F0LTlgWlm6qg+pnS9Uoy/iSnXE/zhM9iVpzPTwZJEOCE32WhbRktm+auE
         AWMQ==
X-Gm-Message-State: AOJu0Yynzwpo2NwEdN0iBT7eqpnjehIGbzHEvu1YNykYdPREDTn0aSTS
	Pg9bVIguarG60IO4DyuA6z8EOw==
X-Google-Smtp-Source: AGHT+IHHosznfHApdXk8jYxZAt0sihG02bvRnehAM3xUMEk/MMegzZD6wM4oAv68dbfWDeAIqA3S4w==
X-Received: by 2002:a05:6a20:160b:b0:18f:457b:7ad3 with SMTP id l11-20020a056a20160b00b0018f457b7ad3mr2052550pzj.51.1701927674594;
        Wed, 06 Dec 2023 21:41:14 -0800 (PST)
Received: from google.com ([2401:fa00:8f:201:ae3:d021:818:26c8])
        by smtp.gmail.com with ESMTPSA id hi16-20020a17090b30d000b00286bd821426sm408812pjb.26.2023.12.06.21.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 21:41:14 -0800 (PST)
Date: Thu, 7 Dec 2023 14:41:09 +0900
From: Chen-Yu Tsai <wenst@chromium.org>
To: Eugen Hristev <eugen.hristev@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 6/9] arm64: dts: mediatek: Add MT8186 Krabby platform
 based Tentacruel / Tentacool
Message-ID: <20231207054109.GA37230@google.com>
References: <20231204084012.2281292-1-wenst@chromium.org>
 <20231204084012.2281292-7-wenst@chromium.org>
 <4a7c0cd5-d705-4369-90dd-92d6a27c4723@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a7c0cd5-d705-4369-90dd-92d6a27c4723@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_214116_074570_1452E2D9 
X-CRM114-Status: GOOD (  37.00  )
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

On Mon, Dec 04, 2023 at 01:55:06PM +0200, Eugen Hristev wrote:
> Hello Chen-Yu,
> 
> On 12/4/23 10:40, Chen-Yu Tsai wrote:
> > Tentacruel and Tentacool are MT8186 based Chromebooks based on the
> > Krabby design.
> > 
> > Tentacruel, also known as the ASUS Chromebook CM14 Flip CM1402F, is a
> > convertible device with touchscreen and stylus.
> > 
> > Tentacool, also known as the ASUS Chromebook CM14 CM1402C, is a laptop
> > device. It does not have a touchscreen or stylus.
> > 
> > The two devices both have two variants. The difference is a second
> > source touchpad controller that shares the same address as the original,
> > but is incompatible.
> > 
> > The extra SKU IDs for the Tentacruel devices map to different sensor
> > components attached to the Embedded Controller. These are not visible
> > to the main processor.
> > 
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> > Changes since v2:
> > - Picked up Conor's ack
> > - Rename touchpad to trackpad
> > - Drop pinctrl properties from trackpad in tentacruel/tentacool second
> >   source trackpad
> > 
> > Changes since v1:
> > - Reorder SKU numbers in descending order.
> > - Fixed pinconfig node names
> > - Moved pinctrl-* properties after interrupts-*
> > - Switched to interrupts-extended for external components
> > - Marked ADSP as explicitly disabled, with a comment explaining that it
> >   stalls the system
> > - Renamed "touchpad" to "trackpad"
> > - Dropped bogus "no-laneswap" property from it6505 node
> > - Moved "realtek,jd-src" property to after all the regulator supplies
> > - Switched to macros for MT6366 regulator "regulator-allowed-modes"
> > - Renamed "vgpu" regulator name to allow coupling, with a comment
> >   containing the name used in the design
> > - Renamed "cr50" node name to "tpm"
> > - Moved trackpad_pins reference up to i2c2; workaround for second source
> >   component resource sharing.
> > - Fix copyright year
> > - Fixed touchscreen supply name
> > 
> >  arch/arm64/boot/dts/mediatek/Makefile         |    4 +
> >  .../dts/mediatek/mt8186-corsola-krabby.dtsi   |  129 ++
> >  .../mt8186-corsola-tentacool-sku327681.dts    |   57 +
> >  .../mt8186-corsola-tentacool-sku327683.dts    |   24 +
> >  .../mt8186-corsola-tentacruel-sku262144.dts   |   44 +
> >  .../mt8186-corsola-tentacruel-sku262148.dts   |   26 +
> >  .../boot/dts/mediatek/mt8186-corsola.dtsi     | 1719 +++++++++++++++++
> >  7 files changed, 2003 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-krabby.dtsi
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi

[...]

> > diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
> > new file mode 100644
> > index 000000000000..8726b2916ef1
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
> > @@ -0,0 +1,1719 @@

[...]

> > +	sound: sound {
> > +		compatible = "mediatek,mt8186-mt6366-rt1019-rt5682s-sound";
> > +		pinctrl-names = "aud_clk_mosi_off",
> > +				"aud_clk_mosi_on",
> > +				"aud_clk_miso_off",
> > +				"aud_clk_miso_on",
> > +				"aud_dat_miso_off",
> > +				"aud_dat_miso_on",
> > +				"aud_dat_mosi_off",
> > +				"aud_dat_mosi_on",
> > +				"aud_gpio_i2s0_off",
> > +				"aud_gpio_i2s0_on",
> > +				"aud_gpio_i2s1_off",
> > +				"aud_gpio_i2s1_on",
> > +				"aud_gpio_i2s2_off",
> > +				"aud_gpio_i2s2_on",
> > +				"aud_gpio_i2s3_off",
> > +				"aud_gpio_i2s3_on",
> > +				"aud_gpio_tdm_off",
> > +				"aud_gpio_tdm_on",
> > +				"aud_gpio_pcm_off",
> > +				"aud_gpio_pcm_on",
> > +				"aud_gpio_dmic_sec";
> > +		pinctrl-0 = <&aud_clk_mosi_off>;
> > +		pinctrl-1 = <&aud_clk_mosi_on>;
> > +		pinctrl-2 = <&aud_clk_miso_off>;
> > +		pinctrl-3 = <&aud_clk_miso_on>;
> > +		pinctrl-4 = <&aud_dat_miso_off>;
> > +		pinctrl-5 = <&aud_dat_miso_on>;
> > +		pinctrl-6 = <&aud_dat_mosi_off>;
> > +		pinctrl-7 = <&aud_dat_mosi_on>;
> > +		pinctrl-8 = <&aud_gpio_i2s0_off>;
> > +		pinctrl-9 = <&aud_gpio_i2s0_on>;
> > +		pinctrl-10 = <&aud_gpio_i2s1_off>;
> > +		pinctrl-11 = <&aud_gpio_i2s1_on>;
> > +		pinctrl-12 = <&aud_gpio_i2s2_off>;
> > +		pinctrl-13 = <&aud_gpio_i2s2_on>;
> > +		pinctrl-14 = <&aud_gpio_i2s3_off>;
> > +		pinctrl-15 = <&aud_gpio_i2s3_on>;
> > +		pinctrl-16 = <&aud_gpio_tdm_off>;
> > +		pinctrl-17 = <&aud_gpio_tdm_on>;
> 
> These two above bring errors, as discussed

Looking at the machine driver code, it seems OK to remove them. So I
will.

> > +		pinctrl-18 = <&aud_gpio_pcm_off>;
> > +		pinctrl-19 = <&aud_gpio_pcm_on>;
> > +		pinctrl-20 = <&aud_gpio_dmic_sec>;
> > +		mediatek,adsp = <&adsp>;
> > +		mediatek,platform = <&afe>;
> > +
> > +		playback-codecs {
> > +			sound-dai = <&it6505dptx>, <&rt1019p>;
> > +		};
> > +
> > +		headset-codec {
> > +			sound-dai = <&rt5682s 0>;
> > +		};
> > +	};

[...]

> > +&afe {
> > +	i2s0-share = "I2S1";
> > +	i2s3-share = "I2S2";
> 
> These i2sX-share are not documented.

Looks like this got handled directly in the machine driver.
Will remove.

> > +	status = "okay";
> > +};

[...]

> > +&i2c2 {
> > +	pinctrl-names = "default";
> > +	/*
> > +	 * Trackpad pin put here to work around second source components
> > +	 * sharing the pinmux in steelix designs.
> > +	 */
> > +	pinctrl-0 = <&i2c2_pins>, <&trackpad_pin>;
> 
> While this makes things better, it's not correct. The i2c2 bus does not use the
> trackpad pin. I would believe a better way is to have a node that holds both
> trackpads and claims the pin for both at once. And that node not being the i2c bus
> as there could be more devices on the bus and the pin would be taken regardless of
> any trackpad probing , which is not right.

That is still a workaround, and it also doesn't work because there are
no bindings nor code for the extra device node level.

> Another option is to disable parallel probing for the trackpads, such that when one
> fails to probe, the pin is released and can be taken by the other one.

We thought about this but this workaround would impact everyone else not
dealing with second source components.

[...]

> > +	aud_gpio_tdm_off: aud-gpio-tdm-off-pins { };
> > +
> > +	aud_gpio_tdm_on: aud-gpio-tdm-on-pins { };
> 
> Guess have to remove these two empty pinctrls.

Yes. I'll try that. Looking at the code it should work.


Thanks for the review
ChenYu

