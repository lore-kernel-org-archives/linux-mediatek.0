Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED68CAC582
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Sep 2025 08:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zi88VRbZEuFnGbKkriA0LDu6mR+gOJpwP4/2p/PnZ1A=; b=jq78Nd2LlXkhyZ2xh+JR1Lvwsh
	oERyk35hzBRvR4VUeOYUIelAug+VkXXSODhA6LA8X2IicRmEqoY9EEf2PXazhOlNye07WlgZl9Ig+
	cgs4aNIZCC/cWlyyO5tFA1tHj4y1rcpnO0ycawAFQUI+VwBJMFmHyE1tVgbdoA5icozyUubQVQ4wl
	UywwopVaLMx+qWn71ZRuGGlTC2M6xS6clH3RlneVqOiYoe6dNvV3VrnoXtzkMXEZ0YfYWFQwvuwlk
	DLrgiBrxfbiWKU8wA/ixOjAU+gr1Thg+COl/HkQHG8dcbD1UhIc5NRaUI5rbBayxStIz7igVjeO8G
	CfQ2dexw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwz8V-00000007vGM-1SMB;
	Fri, 12 Sep 2025 08:28:03 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwz8R-00000007vCN-0Um0
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Sep 2025 08:28:01 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-336ce4a894cso13391191fa.1
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Sep 2025 01:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757665677; x=1758270477; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zi88VRbZEuFnGbKkriA0LDu6mR+gOJpwP4/2p/PnZ1A=;
        b=ZnUnQv/H8g4s5q2Gm43UgaskdcysLL7XsaPwwqtecEeBbonQFY4oWRjGAQUODZNJUC
         98e3mDfQ0ZqhYgjlCtj1/+wnK1Xu4iL5Jj1U9XH+qQ4+Pt+jtsA9xRlclpV5njdhpuUw
         O9R7RL0pRno7W2mFX+JzMoTtrrR/2bOgtIJmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757665677; x=1758270477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zi88VRbZEuFnGbKkriA0LDu6mR+gOJpwP4/2p/PnZ1A=;
        b=Gj+wtdMfwOJNbiLShCMwZZG8t+RoSpIly8CayKs8VVvLnevcBXVZa4LN1LynoGgZyA
         0UrlbpKc8buCthHSQKOW4hCw6fM2Xgx3k01bH4XvF43TeQTLb6QNBY/IBvmUUZyOhB07
         vDZUnnIprrkTlMl5Uw39CElKu9r5OVfwciD8dPCZ1vcUdhoOREB9oLsAt04wwwh1ToDJ
         v2jR/+l7vg1Q2pFYvCk7MGFzLQgFgIAg3f1IFHOScAzj6mtvwgvVNaRvVHv616GNAmxj
         gFSvo2xKY7uXCmuzsNwFw/W1yet+kCQ6MTUGuf1g1kQZuY0jU8mIUg37bnCCF7Gd0QLG
         Vqgw==
X-Forwarded-Encrypted: i=1; AJvYcCXReiWiWe4ZqRfj9QPoVcYEMZurXaYI1GS2n7sTUE1L1AcMRVmHHtn6QFWYV9KDscNd4vxKcWI2CUJi1+NRrA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFE+IbtLH2igJEkzo3VXpgvJdrLlAM9VtseLrtwa8byfI0VeBX
	8DmesnToRuKKgkJZVzdTA5B0iAYBI5+macOT1+hl/E5EnIEn1XVdXbdZBFiyk9r3ITZvIT7dB7r
	mO9FsWe/Ux2YtmvbcKWeimLVbcXtCjlxYYzkImANP
X-Gm-Gg: ASbGncuRFbe4UxXBEIB69auJUYiyaj1sPNG/Vqyt9eoZeFBKOTv6WJF+o1VOdrt48Fk
	/D0foHGGMTHRz48UyptIzDk3k3K7pT6eqm2bbW+XdcdXABpPZk8tmE2e70cBNgR6JSQERZhD8TP
	I0vvNAoAC/cyf/S1X24choWqajPdd3CUYUvxjui546UdUtTYWjjP6ji/lyiW2qwjwrCLNMTs55J
	JoljQkRKEjG61KllWBadgmXlVCJwGDSTeV2Fw==
X-Google-Smtp-Source: AGHT+IGuFu/6x8GGdyKs3uZP46gycKBj+oJ6yMQK+fd/K5sFBfDmEqPc/X66Qf0G8U/XPK4phpEvZh/Ddpcm0n+c0BE=
X-Received: by 2002:a05:651c:4350:20b0:336:6481:1549 with SMTP id
 38308e7fff4ca-3513aeb2e2amr5142751fa.12.1757665676867; Fri, 12 Sep 2025
 01:27:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-2-ariel.dalessandro@collabora.com> <20250912-alluring-turaco-of-conversion-dca193@kuoka>
In-Reply-To: <20250912-alluring-turaco-of-conversion-dca193@kuoka>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Sep 2025 16:27:45 +0800
X-Gm-Features: Ac12FXxVG1RuSVKZojzF8lrEoj8T-u7pZlbyr1abmA13aynWyYRO-SXBCvUw2XE
Message-ID: <CAGXv+5GovP7NuG042AwfmtC-sPJMGuFAm6iZ0iqNZgU0VE+qmQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] dt-bindings: media: Convert MediaTek mt8173-mdp
 bindings to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>, airlied@gmail.com, 
	amergnat@baylibre.com, andrew+netdev@lunn.ch, andrew-ct.chen@mediatek.com, 
	angelogioacchino.delregno@collabora.com, broonie@kernel.org, 
	chunkuang.hu@kernel.org, conor+dt@kernel.org, davem@davemloft.net, 
	dmitry.torokhov@gmail.com, edumazet@google.com, flora.fu@mediatek.com, 
	heiko@sntech.de, houlong.wei@mediatek.com, jeesw@melfas.com, 
	kernel@collabora.com, krzk+dt@kernel.org, kuba@kernel.org, 
	lgirdwood@gmail.com, linus.walleij@linaro.org, 
	louisalexis.eyraud@collabora.com, luiz.dentz@gmail.com, 
	maarten.lankhorst@linux.intel.com, marcel@holtmann.org, 
	matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com, 
	mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com, 
	robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch, 
	support.opensource@diasemi.com, tiffany.lin@mediatek.com, tzimmermann@suse.de, 
	yunfei.dong@mediatek.com, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-bluetooth@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_012759_239141_985FBB3F 
X-CRM114-Status: GOOD (  25.37  )
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

On Fri, Sep 12, 2025 at 2:06=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Thu, Sep 11, 2025 at 12:09:50PM -0300, Ariel D'Alessandro wrote:
> > Convert the existing text-based DT bindings for MediaTek MT8173 Media D=
ata
> > Path to a DT schema.
> >
> > Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> > ---
> >  .../bindings/media/mediatek,mt8173-mdp.yaml   | 169 ++++++++++++++++++
> >  .../bindings/media/mediatek-mdp.txt           |  95 ----------
> >  2 files changed, 169 insertions(+), 95 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt=
8173-mdp.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/media/mediatek-md=
p.txt
> >
> > diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8173-md=
p.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
> > new file mode 100644
> > index 0000000000000..8ca33a733c478
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
> > @@ -0,0 +1,169 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/mediatek,mt8173-mdp.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek MT8173 Media Data Path
> > +
> > +maintainers:
> > +  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> > +
> > +description:
> > +  Media Data Path is used for scaling and color space conversion.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - enum:
> > +          - mediatek,mt8173-mdp-rdma
> > +          - mediatek,mt8173-mdp-rsz
> > +          - mediatek,mt8173-mdp-wdma
> > +          - mediatek,mt8173-mdp-wrot
>
> Why there is no mediatek,mt8173-mdp here? What does this compatible
> represent?
>
> > +      - items:
> > +          - const: mediatek,mt8173-mdp-rdma
>
> Still suspicious. Device cannot be simulatanously: compatible and not
> compatible. This is not a well known cat that has superposition of two
> states, whenenver you look the other way.
>
> Maybe the old binding was incorrect, maybe the in-tree DTS is incorrect.
> Whichever the reason, this must be investigated and documented, because
> by standard rules this is wrong. Each wrong code needs very clear
> explanations (and "someone did it" is not a good enough explanation).

My guess is that "mediatek,mt8173-mdp" is meant to serve as a single
entry point for the implementation to bind the driver to. The MDP is
a Data Pipeline and there could be multiple instances of the same
IP block, as seen in the original example.

The datasheet I have doesn't cover the "RDMA" block specifically, so
I can't say whether there is an actual difference between the two RDMA
blocks.


ChenYu

> > +          - const: mediatek,mt8173-mdp
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  mediatek,vpu:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      phandle to Mediatek Video Processor Unit for HW Codec encode/dec=
ode and
> > +      image processing.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - power-domains
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: mediatek,mt8173-mdp-rdma
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: Main clock
> > +            - description: Mutex clock
> > +    else:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: Main clock
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - mediatek,mt8173-mdp-rdma
> > +              - mediatek,mt8173-mdp-wdma
> > +              - mediatek,mt8173-mdp-wrot
> > +    then:
> > +      required:
> > +        - iommus
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: mediatek,mt8173-mdp
> > +    then:
> > +      required:
> > +        - mediatek,vpu
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt8173-clk.h>
> > +    #include <dt-bindings/memory/mt8173-larb-port.h>
> > +    #include <dt-bindings/power/mt8173-power.h>
> > +
> > +    soc {
> > +        #address-cells =3D <2>;
> > +        #size-cells =3D <2>;
> > +
> > +        mdp_rdma0: rdma@14001000 {
> > +            compatible =3D "mediatek,mt8173-mdp-rdma",
> > +                         "mediatek,mt8173-mdp";
> > +            reg =3D <0 0x14001000 0 0x1000>;
> > +            clocks =3D <&mmsys CLK_MM_MDP_RDMA0>,
> > +                     <&mmsys CLK_MM_MUTEX_32K>;
> > +            power-domains =3D <&spm MT8173_POWER_DOMAIN_MM>;
> > +            iommus =3D <&iommu M4U_PORT_MDP_RDMA0>;
> > +            mediatek,vpu =3D <&vpu>;
> > +        };
> > +
> > +        mdp_rdma1: rdma@14002000 {
> > +            compatible =3D "mediatek,mt8173-mdp-rdma";
> > +            reg =3D <0 0x14002000 0 0x1000>;
> > +            clocks =3D <&mmsys CLK_MM_MDP_RDMA1>,
> > +                     <&mmsys CLK_MM_MUTEX_32K>;
> > +            power-domains =3D <&spm MT8173_POWER_DOMAIN_MM>;
> > +            iommus =3D <&iommu M4U_PORT_MDP_RDMA1>;
> > +        };
>
> My previous comment applies.
>
> Keep one or two examples.
>
> Best regards,
> Krzysztof
>

