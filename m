Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C806C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 13:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PljBaFwsOSiSajmSlW90uY5IAqYtGowFmvaV1Snd28o=; b=NaOu48wKsgYKMo8ca66aBy9Dav
	024tGekUrMxSF2OcvyQg+bxD/7c3HWORF/u5OXFiN0bvA25Ct1WCZPzFUHhhUSkRgO1PFrDYrath1
	UIfWtXyhtvyZl6rsI5/IXy5VLXiDeVnoE6iuHQvyh0ol52SuC1gKsSMdPsEevgPFbMVDiUfwG+22e
	rE0TKZALY/j0DFktVuUcummjC5vtl05QT5kDoBWTV9humCJ7S805II+xozfhBkyqCEt+Z9i0Qk7uZ
	LojUu96QUuUFeungzrnEMaXBnaF5ZZ36niCsiOuvR3J3hWbbsc25o5uP1zUi9tzfEOO0hx2UmATu1
	wGBo5DXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBpg-00GWQj-MA; Thu, 23 Feb 2023 13:40:24 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBlc-00GTje-Fk
	for linux-mediatek@lists.infradead.org; Thu, 23 Feb 2023 13:36:14 +0000
Received: by mail-io1-xd2e.google.com with SMTP id b5so1083517iow.0
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Feb 2023 05:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PljBaFwsOSiSajmSlW90uY5IAqYtGowFmvaV1Snd28o=;
        b=aghVqa0j350UpMSo80F/OvikYrBe+DeIfqUhFuWit/Y3cFWt0d87987aGDYP1QY7th
         dLAh1IxLwAL2KoWKKyY84gApMjNO2hRhr3zJ5NDCbGUoZEQscH+0cxlWxRVuDOVk2uGE
         oGNmC97taMtCBsJJwx5X332w7LFW7fvpbxf1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PljBaFwsOSiSajmSlW90uY5IAqYtGowFmvaV1Snd28o=;
        b=nqPsX4uLjoKvpuT1erR+DyqXo6wS4N9+cDEKT79rUhDFjnYtzSwUURVT2NW3bP1zlL
         kMUNdCAiaqLhW4QSDSNhiWKD8WA0E7BguPoLUDbhNAMGKNpBKthXz6AyeLsQbNl3mwbE
         fgcedGc0lr5/sDnkWkAijYAVoKdi5RHysnrRA32OaEGJENVvWrSseDTRBRYSbuidzKyV
         4HwmF3wGvsnfHQSuQvb0j7ncDQMeLszwuWJ0R5G1Xnjl5fvj2FNziDElrGLkct833mJK
         NfT2C0hwbeSUMTaRIeat9XsD0kkiGJHEtbcMgOAXqJiE3CVC+sJyyiGGbaj5nk6loYLT
         xQTw==
X-Gm-Message-State: AO0yUKVfzyUgBVLtGyxb3z3Qgem7aZ/JfgRQaK+xExjSFgukNBJn491U
	I3jf7VqEgz6+fNMQtdFX7DcLRuZGgv3t40him3gSNA==
X-Google-Smtp-Source: AK7set/mpYjZt1gR0m0p7QIkrMVPg+zxHDJsHk5bPOYLBOek2gQrZmEZtY4dYkIvYNlcS5eykCYem+K5vAxatmG+zfU=
X-Received: by 2002:a6b:d205:0:b0:71a:5a1f:544c with SMTP id
 q5-20020a6bd205000000b0071a5a1f544cmr1188867iob.5.1677159370385; Thu, 23 Feb
 2023 05:36:10 -0800 (PST)
MIME-Version: 1.0
References: <20230218111712.2380225-1-treapking@chromium.org>
 <20230218111712.2380225-2-treapking@chromium.org> <20230221154124.GA2584323-robh@kernel.org>
In-Reply-To: <20230221154124.GA2584323-robh@kernel.org>
From: Pin-yen Lin <treapking@chromium.org>
Date: Thu, 23 Feb 2023 21:35:59 +0800
Message-ID: <CAEXTbpctOtgE8uQJ7Bb8-ZRSjEwzQcQDegm1AuWfMmtDV0EbwA@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: display: bridge: Add ddc-i2c-bus for anx7688
To: Rob Herring <robh@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Benson Leung <bleung@chromium.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org, 
	Nicolas Boichat <drinkcat@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Guenter Roeck <groeck@chromium.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_053612_571141_634E65D0 
X-CRM114-Status: GOOD (  26.55  )
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

(Resend this with plaintext mode. Sorry for the previous spam.)

Hi Rob,

After some internal discussions, we decided to drop this series
because the driver is trying to do runtime routing of the display
signals, which is not supported by the current DRM system, even if we
can describe the design in the device tree. I'm explaining our use
case as a record, and I can follow up on the mtk_hdmi.c change if
anyone is interested.

The more detailed schematics looks like:
   +----------+    +----------------+    +-----------+
   |   MTK    |    |                |    |   HDMI    |
   |   HDMI   +--->|    TS3DV642    +--->| connector |
   |  bridge  |    |                |    +-----------+
   +----------+    |                |
                   |    HDMI MUX    |    +-------------+
                   |                |    |  anx7688    |   +-----------+
   +----------+    |                |    |  HDMI to DP |   |  USB-C    |
   | cros EC  +--->|                +--->|  bridge     +-->| connector |
   +----------+    +----------------+    +-------------+   +-----------+

The TS3DV642 HDMI MUX is controlled by the CrOS EC to switch the HDMI
signal between two output ports, and the generic-display-mux driver
was trying to control the downstream bridges according to the GPIO
status reported by EC. However, as far as I know, this kind of runtime
routing is not supported by DRM.

And, it can work fine if we only describe the following design in DT:

  +---------+   +-------------+   +-----------+
  |  MTK    |   |  anx7688    |   |  USB-C    |
  |  HDMI   +-->|  HDMI to DP +-->| connector |
  |  bridge |   |  bridge     |   +-----------+
  +---------+   +-------------+

This can work because the anx7688 driver won't reject any display
modes when the DP lane count is 0 ([1]), which is true when the HDMI
connector is used.

Thanks for your time for reviewing this series and sorry for not
explaining everything clearly at the beginning.

[1]: https://elixir.bootlin.com/linux/v6.2/source/drivers/gpu/drm/bridge/cros-ec-anx7688.c#L87

Regards,
Pin-yen


On Tue, Feb 21, 2023 at 11:41 PM Rob Herring <robh@kernel.org> wrote:
>
> On Sat, Feb 18, 2023 at 07:17:08PM +0800, Pin-yen Lin wrote:
> > Introduce a optional "ddc-i2c-bus" property for anx7688 bridge. This
> > allows the bridge to register a .get_edid callback.
>
> What's .get_edid? This is a binding and is independent of Linux.
>
> >
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> > ---
> >
> > Changes in v3:
> > - New in v3
> >
> >  .../bindings/display/bridge/google,cros-ec-anx7688.yaml      | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> > index a44d025d33bd..9d5ce8172e88 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> > @@ -25,6 +25,10 @@ properties:
> >      maxItems: 1
> >      description: I2C address of the device.
> >
> > +  ddc-i2c-bus:
> > +    description: phandle link to the I2C controller used for DDC EDID probing
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +
>
> No, this belongs in the connector node. The DDC signals are routed to
> the connector, not the bridge chip.
>
> Rob

