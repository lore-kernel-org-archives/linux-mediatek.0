Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED4EC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 03:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oFEMZxCK/djolvQUSJ9ZgoX+sTLVZ0cVLpJ/rtD11j8=; b=2Va5ATTr7SifFaonMp5JbmOxNR
	e0ubfBxUU10g9dGZXEOvlo0XljnAfiOBmsO5yi1SaxLQ8bMwNStwAZ7IGG8DtIwSzQ7auD6bJYIB/
	J9GivfCniTeD1OD6g7hHSduKY8Xj6/8r2t7XSI8gpPbVPezpETPN8J6F/yQXtyNJth4rtu/KreO8F
	EvWihXASoGgI7Tudz1v8y7MkiAlUNFFjpsc+mjkl6LlKvtrAoz7X+G7LG2HOCILle7sTogi9tB7iC
	mHf1pMySgMU21wDFoI5axQwERqRIPTHYoMXh1JaEaYEf/TBiYp+dBZdocG4gj+alhdf0u1R/UehRX
	MIGJfJMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAjoO-00FV0b-VE; Mon, 11 Jul 2022 03:10:16 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAjoD-00FUv1-A3
	for linux-mediatek@lists.infradead.org; Mon, 11 Jul 2022 03:10:06 +0000
Received: by mail-wm1-x32b.google.com with SMTP id z23-20020a7bc7d7000000b003a2e00222acso1224506wmk.0
        for <linux-mediatek@lists.infradead.org>; Sun, 10 Jul 2022 20:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oFEMZxCK/djolvQUSJ9ZgoX+sTLVZ0cVLpJ/rtD11j8=;
        b=Eq6JEWFVZdbf2pHCpJ1ou4cgn1NeNrhvTPJ0Fg+W3dP9EAAXrEZguNEEEiprKM0km9
         ah3kPdL4JKEevIv9eeNPm0vVO9ZYW6r0VDm1C5xLvcNhUD53qZHPPq+acillaN+K14xC
         EEMjs4IpDIKobVLM4isnWpFIlSDNwECPe2kZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oFEMZxCK/djolvQUSJ9ZgoX+sTLVZ0cVLpJ/rtD11j8=;
        b=zwyfpBA8MJs4/QBoA82LxL4xJy2gCDKyNS1b6/tMufzVnCoZ6fwsmXFOPRAVSM0gjk
         reov2hxGRkNGHfP0PZ7elfG8Q+385FdcUd7bpEaTGq2NNzV7Yf1UQ7LXNC7wk/URRBZy
         TcqQ4yO6fla4qtp5Jofx9bRQEN2rkB31T1VH1rNPHHbwLuUzb27p2+GGgVu6FNkgzL96
         bf8cxxbFF4ZifF529LI4UBkzEFyxnxC0mPirruyJ28ux2ool8OKxZeeRSOuqunFFwnH/
         duo27g1wqYy81ckgldJ51J1BwDkXpTr4/nVUh5S08tePuqZ9WpjXSmAgnT5C053uHRJH
         YAfQ==
X-Gm-Message-State: AJIora9ou/6UCqW7K6wnPsUczD8rPsfoy5Gqw8fShWrjDqgnxvhdcrWN
	o6QXRmmL/CL/jzwqAnllWbiR/l6ziTWNv8O0aLP7gw==
X-Google-Smtp-Source: AGRyM1sBjrTuZpzK4XuwdVW/i96VfIBsSENgJ1XKIaFYOjZSkgDs8pG/TSMT1eQCfInpje1o8o9KcnScfs/lAo9nh1c=
X-Received: by 2002:a05:600c:2e53:b0:3a2:e51c:a6a with SMTP id
 q19-20020a05600c2e5300b003a2e51c0a6amr6258057wmf.168.1657509001388; Sun, 10
 Jul 2022 20:10:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220621091854.1904372-1-treapking@chromium.org> <de6412d4-732c-79cf-ac00-e0fccee44270@gmail.com>
In-Reply-To: <de6412d4-732c-79cf-ac00-e0fccee44270@gmail.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Mon, 11 Jul 2022 11:09:50 +0800
Message-ID: <CAEXTbpf=w6qB1X3dYSR=kdJgqNAFW-pRYuiOGuv9WWEtuY47Cw@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: mt8173: Fix elm panel DT node
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Eizan Miyamoto <eizan@chromium.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220710_201005_397173_7864E256 
X-CRM114-Status: GOOD (  25.24  )
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

All we know is that the functions mentioned in the commit message were
working in 4.19 kernel, but not in the latest kernel tree.

Unfortunately, we don't know which patch breaks the driver.

Best regards,
Pin-yen

On Thu, Jul 7, 2022 at 10:50 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 21/06/2022 11:18, Pin-Yen Lin wrote:
> > Move the panel DT node under `aux-bus` node, so it won't use the buggy
> > `ps8640_bridge_get_edid` to get the display modes. Also, change the
> > compatible string from "lg,lp120up1" to "edp-panel", so the panel-edp
> > driver gets the displays modes from the EDID instead of using the
> > predefined display mode (`lg_lp129qe_mode`) in the driver, which is
> > actually not working.
> >
>
> Do we need a fixes tag here? I'm not quite sure if we fix an upstream bug here,
> to be honest.
>
> Regards,
> Matthias
>
> > Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
> > ---
> >
> > Changes in v3:
> > - Include more details in the commit message.
> >
> > Changes in v2:
> > - Remove the Fixes tag because this change is not compatible with the
> >    old kernel versions.
> >
> >   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 26 +++++++++++---------
> >   1 file changed, 14 insertions(+), 12 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> > index 9c75fbb31f98..1e0802a6f6d2 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> > @@ -90,18 +90,6 @@ volume_up {
> >               };
> >       };
> >
> > -     panel: panel {
> > -             compatible = "lg,lp120up1";
> > -             power-supply = <&panel_fixed_3v3>;
> > -             backlight = <&backlight>;
> > -
> > -             port {
> > -                     panel_in: endpoint {
> > -                             remote-endpoint = <&ps8640_out>;
> > -                     };
> > -             };
> > -     };
> > -
> >       panel_fixed_3v3: regulator1 {
> >               compatible = "regulator-fixed";
> >               regulator-name = "PANEL_3V3";
> > @@ -282,6 +270,20 @@ ps8640_out: endpoint {
> >                               };
> >                       };
> >               };
> > +
> > +             aux-bus {
> > +                     panel {
> > +                             compatible = "edp-panel";
> > +                             power-supply = <&panel_fixed_3v3>;
> > +                             backlight = <&backlight>;
> > +
> > +                             port {
> > +                                     panel_in: endpoint {
> > +                                             remote-endpoint = <&ps8640_out>;
> > +                                     };
> > +                             };
> > +                     };
> > +             };
> >       };
> >   };
> >

