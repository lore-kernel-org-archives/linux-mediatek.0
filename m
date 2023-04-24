Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B985C77B61
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Apr 2023 09:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cx7887igrG1FHuRUhWl71owqx8AZ7P/HQi+L6Ao/Eq0=; b=C1lOV6nQz9s3+MSHySiJyAKgBG
	Kdb9OqvDCnzZHUY9c/lf86WjzJpf1nGtoEUlwB1pXnXoXB3XHhJtEkxp+gtemI3vE7GeUDtGr7Iu7
	XXAK/yvcwKPnGUcq4/GjkCctjR6X7omtnu80H4MG2yyk1BDL6UovJDrsZFMkJ4pqnTEF4DB9myH76
	MQqEDtO1AubH/v/QGB+IMn1DR0QpjiHfuhwgMNgMnAPFxmLZ2q2zVMqS6b97d067xS1I5efr99d4f
	lhvHNNCl8J5IHD+DpXahLypZuVCyu7MDD09t+KKuqRi1R58sToAWIoRqthdiKfVKHeuaG20UCaXYB
	vDslxZQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqsIO-00FlDL-0C;
	Mon, 24 Apr 2023 09:15:40 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqsIK-00FlBw-1K
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Apr 2023 09:15:37 +0000
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-77858d8dcb5so17965667241.1
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Apr 2023 02:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682327734; x=1684919734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cx7887igrG1FHuRUhWl71owqx8AZ7P/HQi+L6Ao/Eq0=;
        b=GKGcMayBMsRsIIULpLnyaH8cw7op/k+gp79J7FQeM5m8HgIn5SCkAO8oF7WTfmXtxG
         hVO7d47c3dnOYfF+O906h6NY6fsWYMF5qhJtDw8wJxaBeKD41cLs3xtVn5OSM/S+i9B7
         t7D0AKpyaQ/OWntA/F9BWu9GNsKLD4fuItkeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682327734; x=1684919734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cx7887igrG1FHuRUhWl71owqx8AZ7P/HQi+L6Ao/Eq0=;
        b=VWZUkUra05W+0pJ38sRTccrbCXy3/koDouax0GPfvUo0OvlzT2hyHmNpRmmix5VrD3
         jJxnduaMMiGHb2AAYMiM08zvosI/rjuoKDwQLOB3yzK/KwUM4pBoDgJFfd3+wIQSi15c
         8ma3Jn4gdFdh687jYooWoMrdPhfXfzFXIC75kufgDDs1BQxVgbPEMp/Iy+ugG4A1OLc3
         n0D2BBfUq2PsJp3BzUxspPdf/JsA4gBBELzzUbL24vxj/LWTJSLvSvA/ip4tzsJIo53n
         DpjO8h0FK/Z8O+X4ZiMZi247QCyL0KNu5Npg5VtzNMfzsyShyJlke0tNBs16+XCuZoPC
         kMcg==
X-Gm-Message-State: AAQBX9f1xbpnxTjNI3/D+EyWgQ5GRA/oGwaQ34oioc5dX4LkoYULhoPS
	ASNuNIBhAAywAYXMYvOXJza5nejxaUthqAlqD+xACA==
X-Google-Smtp-Source: AKy350bh1y5Id9K/CKKzxg/hyZXchzBox+vu/bgdhz9ztQs0ughNIHIXyDUJXslVwnFaDhDVB5HgLtOtP2DIrMdm73g=
X-Received: by 2002:a1f:4582:0:b0:446:ef36:2fa4 with SMTP id
 s124-20020a1f4582000000b00446ef362fa4mr4030463vka.6.1682327734321; Mon, 24
 Apr 2023 02:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230421110327.2395804-1-wenst@chromium.org> <872e8b77-c1ea-410a-b978-dd8f49f9904b@notapiano>
In-Reply-To: <872e8b77-c1ea-410a-b978-dd8f49f9904b@notapiano>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 24 Apr 2023 17:15:23 +0800
Message-ID: <CAGXv+5G8FsSjz5+4+NBgP+HXZfN4m1SkE2aOiV_i-18xDeVoKQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8192-asurada-hayato: Enable Bluetooth
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_021536_451082_91574913 
X-CRM114-Status: GOOD (  23.89  )
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

On Fri, Apr 21, 2023 at 10:01=E2=80=AFPM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> On Fri, Apr 21, 2023 at 07:03:27PM +0800, Chen-Yu Tsai wrote:
> > Hayato's Realtek WiFi/BT module has it's Bluetooth function wired to
> > UART1.
> >
> > Add and enable the relevant device nodes for it.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  .../dts/mediatek/mt8192-asurada-hayato-r1.dts | 80 +++++++++++++++++++
> >  1 file changed, 80 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts =
b/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts
> > index 43a823990a92..6a7d7870525b 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts
> > @@ -40,9 +40,89 @@ CROS_STD_MAIN_KEYMAP
> >       >;
> >  };
> >
> > +&pio {
> > +     bt_pins: bt-pins {
> > +             bt_kill: pins-bt-kill {
>
> Drop this label and for the other pinconfigs below as they'll never be
> referenced.

Ack.

> > +                     pinmux =3D <PINMUX_GPIO144__FUNC_GPIO144>; /* BT_=
KILL_L */
>
> I'd also drop this and the other comments, as they're already documented =
in the
> gpio-line-names property.

Ack.

> > +                     output-low;
> > +             };
> > +
> > +             bt_wake: pins-bt-wake {
> > +                     pinmux =3D <PINMUX_GPIO22__FUNC_GPIO22>;  /* bt t=
o wake ap */
> > +                     bias-pull-up;
> > +             };
> > +
> > +             ap_wake_bt: pins-ap-wake-bt {
> > +                     pinmux =3D <PINMUX_GPIO168__FUNC_GPIO168>; /* AP_=
WAKE_BT_H */
> > +                     output-low;
> > +             };
> > +     };
> > +
> > +     uart1_pins: uart1-pins {
> > +             pins-rx {
> > +                     pinmux =3D <PINMUX_GPIO94__FUNC_URXD1>;
> > +                     input-enable;
> > +                     bias-pull-up;
> > +             };
> > +
> > +             pins-tx {
> > +                     pinmux =3D <PINMUX_GPIO95__FUNC_UTXD1>;
> > +             };
> > +
> > +             pins-cts {
> > +                     pinmux =3D <PINMUX_GPIO166__FUNC_UCTS1>;
> > +                     input-enable;
> > +             };
> > +
> > +             pins-rts {
> > +                     pinmux =3D <PINMUX_GPIO167__FUNC_URTS1>;
> > +                     output-enable;
>
> Looks like the dt-binding doesn't currently support output-enable, but th=
e
> driver does, so please just add a patch with
>
>           output-enable: true
>
> on mediatek,mt8192-pinctrl.yaml

Looking at the driver and the datasheet, there is no actual output-enable
hardware. The driver simply sets an pin direction register, which is the
same thing done when setting the GPIO direction.

On the other hand, there is actually an input enable function, but the
driver also sets the pin direction. All pins have "input enable" set
by default in hardware doesn't help.

I'll drop this for now and look into fixing the pinctrl driver.

> > +             };
> > +     };
> > +
> > +     uart1_pins_sleep: uart1-pins-sleep {
>
> "-pins" needs to come last in the name otherwise the dt-binding will comp=
lain.

Ack.

> > +             pins-rx {
> > +                     pinmux =3D <PINMUX_GPIO94__FUNC_GPIO94>;
> > +                     input-enable;
> > +                     bias-pull-up;
> > +             };
> > +             pins-tx {
> > +                     pinmux =3D <PINMUX_GPIO95__FUNC_UTXD1>;
> > +             };
> > +             pins-cts {
> > +                     pinmux =3D <PINMUX_GPIO166__FUNC_UCTS1>;
> > +                     input-enable;
> > +             };
> > +             pins-rts {
> > +                     pinmux =3D <PINMUX_GPIO167__FUNC_URTS1>;
> > +                     output-enable;
> > +             };
> > +     };
> > +};
> > +
> >  &touchscreen {
> >       compatible =3D "hid-over-i2c";
> >       post-power-on-delay-ms =3D <10>;
> >       hid-descr-addr =3D <0x0001>;
> >       vdd-supply =3D <&pp3300_u>;
> >  };
> > +
> > +&uart1 {
> > +     status =3D "okay";
> > +     pinctrl-names =3D "default", "sleep";
> > +     pinctrl-0 =3D <&uart1_pins>;
> > +     pinctrl-1 =3D <&uart1_pins_sleep>;
> > +     /delete-property/ interrupts;
> > +     interrupts-extended =3D <&gic GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>,
> > +                           <&pio 94 IRQ_TYPE_EDGE_FALLING>;
> > +
> > +     bluetooth: bluetooth {
>
> I'd also drop this label and only introduce it if/when needed.

Ack.

> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>
> Thanks,
> N=C3=ADcolas
>
> > +             compatible =3D "realtek,rtl8822cs-bt";
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&bt_pins>;
> > +
> > +             enable-gpios =3D <&pio 144 GPIO_ACTIVE_HIGH>;
> > +             device-wake-gpios =3D <&pio 168 GPIO_ACTIVE_HIGH>;
> > +             host-wake-gpios =3D <&pio 22 GPIO_ACTIVE_LOW>;
> > +     };
> > +};
> > --
> > 2.40.0.634.g4ca3ef3211-goog
> >

