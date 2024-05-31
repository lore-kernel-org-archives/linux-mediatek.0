Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A1FC25B75
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 May 2024 07:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7AuBpLgSZMEBo2XzwoYxF5FL6n7LRJe6EeX7UzHv+C4=; b=Lfe4G79FIsWdpeFyxIe99icfZz
	erMBKTOYptuMuQrvvVY51f8sIVhZ9iXDu3LTUf920xXtNemlaSXdvRaVEtHdokO5vDVFvVA9N0Ww2
	Q0UI26MiaEPTjy7e4x+3qytwHVIaCdSrMn71I+AwkauBJUFOHBNMNnHfpbRE8eKLd3oZJd/Pgavqx
	aPhajAUpq9pyPELJYF1O+3QRx3wGqScbvR1WWqAz1vaPQYR3iX278Q9ZcXw82lYwhNk8v0eSh7pkc
	GqIfr9s8yxUQ0YmHzb/JLDBAz8G/fs7QeelFtNOOsVl1oaEJPoVBd0IMYupDfIe2wMkyj0k8jAFYg
	e0G9oRHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCwhX-00000009V75-3p24;
	Fri, 31 May 2024 07:29:23 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCwhU-00000009V6B-2Ya8
	for linux-mediatek@lists.infradead.org;
	Fri, 31 May 2024 07:29:22 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-52b03d66861so1827440e87.1
        for <linux-mediatek@lists.infradead.org>; Fri, 31 May 2024 00:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717140558; x=1717745358; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7AuBpLgSZMEBo2XzwoYxF5FL6n7LRJe6EeX7UzHv+C4=;
        b=E8t+Cfub/pcNg/wnMBgWXOaUlr8iXUtNcNM4INUQgW+IzTPddZqwWkAFLmQnZjMnWc
         e/3vqCrm76NJI2ptwJUUXwTGs3gBFd5V/3IWCMJJ5lNnMRyVCGWsUzDHYeyBuQQ+FsM0
         HF5qQ/4PP0b/2RWXTcOmuBvMPZW9ngbdUqXRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717140558; x=1717745358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7AuBpLgSZMEBo2XzwoYxF5FL6n7LRJe6EeX7UzHv+C4=;
        b=SQ55tzX7q3o9HxXGGjwwH/2/+DDRaTshLtkWFVrcndrqWaVzT3JR0rKlBZ4NamP0GJ
         EHR6UP1QJ4dlmZwEVq7krzqKWDwKwl9oKbmHdzBPSOFBnymsaWFKnhFSGZb+gcdoyMWI
         /69XqiG9nOpwI20Jh0KgqzQdovUdVUx4Hfn1hQYwLb5qHNwCNh8c2RgZmj2BUZbTBF4h
         DSIQ2mWSEWy6uQ9F8CkvcmnyvM3q8tNTstIc/xrZvYp6hXLd5RWDWt/oSeljFHgrtjzg
         7u/D6Swk72uv7SqvUcZL6I436R10LGDhiA9KYouXCO0AUlwJtw4ppy0nP0Gkm6+eWpnQ
         0Yig==
X-Forwarded-Encrypted: i=1; AJvYcCVDiJ8uphpAEX/HOA3NywwNel2iQ1QZLlNQiQeiioPYJZ2j/v65u8792zT8/djRbiA1JtBnCJ9wvxZaLrf2l8hPGdbKEOLIND3dq3kyMlyXczWh
X-Gm-Message-State: AOJu0YxwL9swm+DhyUWN7mmfggJrjTHTj4OdRjtYoMhJSIYM4Vq8ubVV
	SrUokjxeOZaFipPIuImy4D4d11LsWIEPWTuj+dLEcsyEzOjHhr25tn8heAUORrV8mS86e9wc43I
	4+Gr2AQ4+zXqFG2CQhPsP3Dl2YAI0gu2KhbgW
X-Google-Smtp-Source: AGHT+IHG9cIqzvXzXFVSJ3u+mefhmJEYsDfRGLlyDYP+0F7chk9Cih1xUPNaF4GQKusTGlZd76NQwOCqr1Bnfxqn4zw=
X-Received: by 2002:a05:6512:2029:b0:52b:8455:a9df with SMTP id
 2adb3069b0e04-52b896b8210mr483694e87.34.1717140557358; Fri, 31 May 2024
 00:29:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240530083513.4135052-1-wenst@chromium.org> <20240530083513.4135052-2-wenst@chromium.org>
 <20240530-revisit-profanity-889f1bcae21a@spud>
In-Reply-To: <20240530-revisit-profanity-889f1bcae21a@spud>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 31 May 2024 15:29:06 +0800
Message-ID: <CAGXv+5F=AEE7t=YQ0hNGtV9rbVBm75D=ftJdZKwD_JmUW9gQWQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: clock: mediatek: Add mt8173 mfgtop
To: Conor Dooley <conor@kernel.org>
Cc: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_002920_702621_73B67094 
X-CRM114-Status: GOOD (  20.94  )
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

On Thu, May 30, 2024 at 11:43=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Thu, May 30, 2024 at 04:35:00PM +0800, Chen-Yu Tsai wrote:
> > The MFG (GPU) block on the MT8173 has a small glue layer, named MFG_TOP
> > in the datasheet, that contains clock gates, some power sequence signal
> > delays, and other unknown registers that get toggled when the GPU is
> > powered on.
> >
> > The clock gates are exposed as clocks provided by a clock controller,
> > while the power sequencing bits are exposed as one singular power domai=
n.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  .../clock/mediatek,mt8173-mfgtop.yaml         | 71 +++++++++++++++++++
> >  include/dt-bindings/clock/mt8173-clk.h        |  7 ++
> >  2 files changed, 78 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt=
8173-mfgtop.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8173-mf=
gtop.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.=
yaml
> > new file mode 100644
> > index 000000000000..03c3c1f8cf75
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8173-mfgtop.ya=
ml
> > @@ -0,0 +1,71 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +
> > +$id: http://devicetree.org/schemas/clock/mediatek,mt8173-mfgtop.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek MT8173 MFG TOP controller
> > +
> > +maintainers:
> > +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.co=
m>
> > +
> > +description:
> > +  The MFG TOP glue layer controls various signals going to the MFG (GP=
U)
> > +  block on the MT8173.
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt8173-mfgtop
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 4
>
> minItems is not needed when minItems =3D=3D maxItems.

Ack.

> > +    maxItems: 4
> > +
> > +  clock-names:
> > +    items:
> > +      - const: sys
> > +      - const: mem
> > +      - const: core
> > +      - const: clk26m
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  '#clock-cells':
> > +    const: 1
> > +
> > +  '#power-domain-cells':
> > +    const: 0
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - power-domains
> > +  - '#clock-cells'
> > +  - '#power-domain-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +        #include <dt-bindings/clock/mt8173-clk.h>
> > +        #include <dt-bindings/power/mt8173-power.h>
> > +
> > +        mfgtop: clock-controller@13fff000 {
>
> The label here is used, so drop it.

Assume you mean _not_ used. Dropping. :D

> Otherwise,
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks!

