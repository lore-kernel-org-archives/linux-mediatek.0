Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BA79C43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 05:34:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC46520719
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 05:34:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VCkn71vG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nY/GFWKy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC46520719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kKaNMwo42Van2iz4k2XAHm3zOxOu31/i7Efb17ywjV0=; b=VCkn71vGv6aJmFXQZHxRrHQ2J
	iL4f96syl/9u5Chs+HWlzBytpqT3TT+WPy8fwWJVGp/3hTj9vBTqgtlwsoB7wxEx1TJHx049+yvi8
	xTFmhgYi6EBRmeZjruuHc8K5ddPf4HP044f0XdsKTN7NMCSc88pVkbY3IIOswgbK7ChDlnI/B6vkY
	C/Rjsq7kZbvydoTpacW2ZaHAXNB5h36j4RCuLLoDjU1IGQp5OaV1eM9Rf9FxatUC9YtChaR+7Xw6y
	hfOI3uF9mhZaJwMeYt/TDpQwh9B0IGxWfVQmucCNcbCdIqcTUPbmM46uoPdskGhXoXBvAcPKnqxEg
	T2c+vbDNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGFDh-00051E-2K; Thu, 10 Sep 2020 05:34:05 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGFDe-000505-B5
 for linux-mediatek@lists.infradead.org; Thu, 10 Sep 2020 05:34:03 +0000
Received: by mail-ed1-x544.google.com with SMTP id t16so5002036edw.7
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Sep 2020 22:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=60m4hlTxGIMTHH9zDLpW2r5D85YdOPl2w4joQJnWmwA=;
 b=nY/GFWKyeBX/RUFO9u1oe4hlkrj2e2sOr59SOi/XTYi5toZj9oU+PlC3yWoAwPOFN2
 5i8xIU1YcBt2bAXr6Jp03/gOrEuZTChoV6Eg6JR+z8Bb75FlyvBxuquNU7tXif2hK8k0
 bJKTYNsTwz5EUDsp6fTOQJvRuIvC1csiVVvzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=60m4hlTxGIMTHH9zDLpW2r5D85YdOPl2w4joQJnWmwA=;
 b=HlszpFpA0wsBu/eJB9N20jl9e5v+lMO5jEzgJ6sbBBfyLPGgH0WzSHMa3ALdiQlHcK
 7UV7FaAToOtMG0Anphf5Oaz8K08bJ9ldivaWrt/jSsZ/aJeMl3cFIvOK47uzj8bZI6HU
 sQAwEOauUSvvsqClM6O12Ar4Yd99cixZmTzqLl+JcNA/ag+NiRosXbsk8+sNTOtzZufL
 VS58GMQ0u7UJ8nPaQDjVdquYGPmbjmhWQ9A4r36Yc+PumzGTKbGqHXLgy0BhpE49ZLjo
 pYsvimSnK22idJAh8Wluqlya8kMw3j2yf64Ay4RzMo3E0rvAF87TzJgyrpiLQNDKqYB9
 8DSg==
X-Gm-Message-State: AOAM5324N3Eiq/G4RsUmQ/7oshu+TIbbkaPtXWNCz6iiKqvhhUOOk6LD
 irITIpyJHZ/Kn5EsqiuP9OIlCwpCX2Wg3fWKxsRoZg==
X-Google-Smtp-Source: ABdhPJxZWL/a+FakIDHKml1deb33cHOcCk+94TvMWao3/i9x9TyStla5QSTT3ONizI1t9/7Icb72n5sslJD4sHHnvic=
X-Received: by 2002:a50:fe0f:: with SMTP id f15mr7513034edt.235.1599716040960; 
 Wed, 09 Sep 2020 22:34:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200909081422.2412795-1-pihsun@chromium.org>
 <dd5a6b8b-71dc-ce54-1f0d-7fa6b1dd6248@gmail.com>
In-Reply-To: <dd5a6b8b-71dc-ce54-1f0d-7fa6b1dd6248@gmail.com>
From: Pi-Hsun Shih <pihsun@chromium.org>
Date: Thu, 10 Sep 2020 13:33:24 +0800
Message-ID: <CANdKZ0dAWG7CyNF9064+WBC_7q8M=S6=Q30TFz9fpgd4YbOsOw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: mt8183-kukui: add scp node
To: Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_013402_419302_101DE7B9 
X-CRM114-Status: GOOD (  19.70  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Erin Lo <erin.lo@mediatek.com>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Eddie Huang <eddie.huang@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Sep 9, 2020 at 4:58 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 09/09/2020 10:14, Pi-Hsun Shih wrote:
> > Add scp node to mt8183-kukui
> >
> > Fixes: 0d5e41709f76 ("arm64: dts: mt8183: add scp node")
> > Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> > ---
> >
> > Change since v1:
> > * Add Fixes tag.
> >
> > ---
> >   .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 30 +++++++++++++++++++
> >   1 file changed, 30 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> > index f0a070535b34..85f7c33ba446 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> > @@ -90,6 +90,18 @@ pp3300_alw: regulator6 {
> >               regulator-max-microvolt = <3300000>;
> >       };
> >
> > +     reserved_memory: reserved-memory {
> > +             #address-cells = <2>;
> > +             #size-cells = <2>;
> > +             ranges;
> > +
> > +             scp_mem_reserved: scp_mem_region {
> > +                     compatible = "shared-dma-pool";
> > +                     reg = <0 0x50000000 0 0x2900000>;
> > +                     no-map;
> > +             };
> > +     };
> > +
>
> Do we expect other boards to have a different memory reservation? I can see that
> EVB and Kukui uses the same. If not, we should add the node in mt8183.dtsi instead.
>
> Regards,
> Matthias

All our current boards use the same memory reservation, but it's still
possible for future boards based on mt8183 to use different SCP memory
size, so I feel this should still be left out of mt8183.dtsi.

>
> >       max98357a: codec0 {
> >               compatible = "maxim,max98357a";
> >               sdmode-gpios = <&pio 175 0>;
> > @@ -524,6 +536,13 @@ pins_clk {
> >               };
> >       };
> >
> > +     scp_pins: scp {
> > +             pins_scp_uart {
> > +                     pinmux = <PINMUX_GPIO110__FUNC_TP_URXD1_AO>,
> > +                              <PINMUX_GPIO112__FUNC_TP_UTXD1_AO>;
> > +             };
> > +     };
> > +
> >       spi0_pins: spi0 {
> >               pins_spi{
> >                       pinmux = <PINMUX_GPIO85__FUNC_SPI0_MI>,
> > @@ -651,6 +670,17 @@ pins_wifi_wakeup {
> >       };
> >   };
> >
> > +&scp {
> > +     status = "okay";
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&scp_pins>;
> > +
> > +     cros_ec {
> > +             compatible = "google,cros-ec-rpmsg";
> > +             mtk,rpmsg-name = "cros-ec-rpmsg";
> > +     };
> > +};
> > +
> >   &soc_data {
> >       status = "okay";
> >   };
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
