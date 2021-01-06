Return-Path: <SRS0=NOVl=GJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD00C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 10:49:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB5A62310E
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 10:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB5A62310E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zivuDs/ujEy9Y8+AELPZ3J6xKy+H6Oszqbw1rLqKU40=; b=HHn+SNfBiKWYyqWcd+1obx8Tb
	sNImw/nhgAYc4JdhJlrijlgD6ROmxDOx4B50BKylTe69jf3jviS4gvM2IVWFaxM5vVAV8pUGk+Gbm
	tXZrJPiRbT9ZukTTdrrxvR0MPMEn/2mecBbFDNG1gzFm5aAsq1zZ/3y8zj6HqGxNX1X4/4OKuhR96
	81qlfbFQUL0SfdFM1SsklD09UBuQ+pBF4CPGMvQ1XD3Eh0nWCOwS5JgVIacV3V5py2HKETKBbPfdx
	dFHbgwq8f4fCPSm7ivJMrn1AoBABLsKfYczfgTpEqpfQPjSau97dsYhDMLki5R2TWxrqXNYTDfNw6
	9r6ez/ZbQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kx6NA-0004M9-Mb; Wed, 06 Jan 2021 10:49:00 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kx6N8-0004LI-17
 for linux-mediatek@lists.infradead.org; Wed, 06 Jan 2021 10:48:59 +0000
Received: by mail-vs1-xe36.google.com with SMTP id h6so1551898vsr.6
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Jan 2021 02:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=65bthvYlj9KKIS5KK6JhxNYJMD8s4MDQLZpfgKqd4vM=;
 b=X7GGMa423pBbYfE4+HR39/XGdoDcfr3nbm8+IarZvID4Pf5pRICqedHoV1eEljrqvh
 1wjAGleOvGRLUtM2TA6SjwweF91aOSKSAHJQ+VWXnmcAOjDSGBetJbOtEXmvkzoISqnO
 gun7Yry+f4793b7Iq7Mmya8p7nFGc8lI/3GsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=65bthvYlj9KKIS5KK6JhxNYJMD8s4MDQLZpfgKqd4vM=;
 b=APnj480Xb3HzNBQeGasb8kXOh/Shg6vruyYKP01yyezggJAJbfVe2MNx/6RXgS8rfu
 78BZV1DS/BmZ3jrSCUlBW4anw5eR3nWfi7BBipdIMLe/L8aDksvmqZmaKjS2g9BxGHW/
 qUlGM+3/WzDvbtyvyMDyihYGXA/xqsVulQz7RZYuQ2EFiP7oHp33h1uSl6x6aMdg1xvK
 isPexMmdGYnvAjqruq+j0ecrylQ2xldno7jPmKv19ukqN+C0mBDdJ6kysD4HjmHJ3XWM
 snSfNDAmABO7hs6WnCUoo22Fp0U7jI01Ei9wZObUJD6U1HakMKR4mNPNrIk3Zqqa4pwz
 rExw==
X-Gm-Message-State: AOAM533PokWKpiuD344JLO+QqJ0hngcrxHCZhLzZlpGGCP6E4qczdOC7
 cJIgOnsBam4bi+rtaSQtnx3m5BYjfW97KpWJVPGG8Q==
X-Google-Smtp-Source: ABdhPJz9ON8BwWq+VaecVefOOUeLpjkYUuNp9NU/OAWS/f/jzOReQa42tBRohJ5XkaU0WXUWBPttXpWvspWnaIv70xQ=
X-Received: by 2002:a67:5c03:: with SMTP id q3mr2560878vsb.47.1609930136255;
 Wed, 06 Jan 2021 02:48:56 -0800 (PST)
MIME-Version: 1.0
References: <20210106084626.2181286-1-hsinyi@chromium.org>
 <CANMq1KAoboK45uOhKMYZ-=TvBBQRZhEeij=ha6MqSKZiYx64eQ@mail.gmail.com>
In-Reply-To: <CANMq1KAoboK45uOhKMYZ-=TvBBQRZhEeij=ha6MqSKZiYx64eQ@mail.gmail.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 6 Jan 2021 18:48:45 +0800
Message-ID: <CANMq1KDGUSGE5Vb3WQMhgECkBL_PTMHnS+8wTP6W0Uhhv9RJJQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: mt8183: config dsi node
To: Hsin-Yi Wang <hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_054858_145281_7D2941EC 
X-CRM114-Status: GOOD (  20.86  )
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

On Wed, Jan 6, 2021 at 6:47 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> On Wed, Jan 6, 2021 at 4:46 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > Config dsi node for mt8183 kukui. Set panel and ports.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 38 +++++++++++++++++++
> >  1 file changed, 38 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> > index bf2ad1294dd30..4cfb3560e5d11 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> > @@ -249,6 +249,36 @@ &cpu7 {
> >         proc-supply = <&mt6358_vproc11_reg>;
> >  };
> >
> > +&dsi0 {
> > +       status = "okay";
> > +       #address-cells = <1>;
> > +       #size-cells = <0>;
> > +       panel: panel@0 {
> > +               compatible = "boe,tv101wum-nl6";
>
> We're going to have many panels in the kukui family, so I think I'd
> prefer it if you moved the compatible string to krane-sku0 dts: it
> makes it easier to figure out what's different with sku0.

I meant sku176 (since you are adding sku0 with a different panel
compatible later).

>
> Then maybe leave all the other properties in this file, as it seems
> like all MIPI panels use the exact same pin/supplies?
>
> (And add a comment here saying that the compatible needs to be set in
> board dts?)
>
> > +               reg = <0>;
> > +               enable-gpios = <&pio 45 0>;
> > +               pinctrl-names = "default";
> > +               pinctrl-0 = <&panel_pins_default>;
> > +               avdd-supply = <&ppvarn_lcd>;
> > +               avee-supply = <&ppvarp_lcd>;
> > +               pp1800-supply = <&pp1800_lcd>;
> > +               status = "okay";
> > +               port {
> > +                       panel_in: endpoint {
> > +                               remote-endpoint = <&dsi_out>;
> > +                       };
> > +               };
> > +       };
> > +
> > +       ports {
> > +               port {
> > +                       dsi_out: endpoint {
> > +                               remote-endpoint = <&panel_in>;
> > +                       };
> > +               };
> > +       };
> > +};
> > +
> >  &i2c0 {
> >         pinctrl-names = "default";
> >         pinctrl-0 = <&i2c0_pins>;
> > @@ -547,6 +577,14 @@ pins_clk {
> >                 };
> >         };
> >
> > +       panel_pins_default: panel_pins_default {
> > +               panel_reset {
> > +                       pinmux = <PINMUX_GPIO45__FUNC_GPIO45>;
> > +                       output-low;
> > +                       bias-pull-up;
> > +               };
> > +       };
> > +
> >         pwm0_pin_default: pwm0_pin_default {
> >                 pins1 {
> >                         pinmux = <PINMUX_GPIO176__FUNC_GPIO176>;
> > --
> > 2.29.2.729.g45daf8777d-goog
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
