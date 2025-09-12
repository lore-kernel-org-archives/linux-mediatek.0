Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0009CA101F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Sep 2025 21:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RS6dsPYFszHuSjK7qI4StyWMs+p9b5Aa8Uii6eXeOJk=; b=TooHvBKmK73qMnzzGLfgATLioU
	JkSGrH8CZr3cBk+mGwUa0wdGAu7TP5M/8YQvyCxAH/e4SwEXOed40riVaTZK23mCagQYV/vxpToNQ
	upeNjPFLMiTOAAVEd4fScP07gcguj19JxJVrt8VKZlEQHDAQgvCIRropFlyrptqhErqAW/1JmWoQO
	GAOCumt3p2z9iibGhCUWfM5HCNgY5MIVlYCSkvTJecS3JqNdRpogOQDcoYLWjVam4K0g7r2LGCyIu
	2wok9bjKGUBUPFFOPj0LbXQIEWCyLvWrScI0RYXYJSpG6WMYvOMtvK5zTZr+xMbA3xE/EipkR/xiX
	PpSP9tBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxBEs-0000000Bcrq-2lKF;
	Fri, 12 Sep 2025 21:23:26 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxBEq-0000000Bcqr-3RNv
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Sep 2025 21:23:25 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-62a35c99b9fso297354d50.0
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Sep 2025 14:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757712203; x=1758317003; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RS6dsPYFszHuSjK7qI4StyWMs+p9b5Aa8Uii6eXeOJk=;
        b=hvvcTTdj67Cv9ImQCbixCLj8cVu9z4186jtU7H2BfO0koKmMG6I8UqV6E7Cd6tbM40
         QwYq5VnC4GoaNYaDmMd79f1+ZwMYdDV+b/k0pcJxJP/cOFjJULdaRbn9G4gOPDk8wYTf
         zjr4mrC6vRR+adlQyKCfnpLEs8/ZlhFSQTo3NvKyvBvEkWAYGifqmeLBtcMuxE6+dNGx
         kbeCM3C7Shy2x9VOFokMlCpFza2RWtDdxXBtTBU5yQBlk7unvKAqi5Sz6bOXmNjMrOOo
         olmUosiljkPSS0iP3XKWXZ8UpgEjGYBUB/PEktEtArjQFZ2Jgi8Zy44wfGAYDWzJctak
         Y3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757712203; x=1758317003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RS6dsPYFszHuSjK7qI4StyWMs+p9b5Aa8Uii6eXeOJk=;
        b=EuaKOjUT7JdXEpcn5R7s1oBPQpf8AS67HTTyVJS/B8QLE+BDu2LInXFDgXfCTQ7d5O
         uwP3f2lhDUPnFRT3tfAlS4CHOBR66ukI+z8iaT11HCxbRzLLKUe8B9L1na3oZTBcK9vB
         A/fCX83QMbfdYEv5fekmhaywJmcVbHvknr5FOitYc0CDYoAY1ORkuLfA8pvVk7MQzIjj
         VujaFOn70RQwKnmzH9RjwDUOXAhHP0baNqQA/Wf/O1EVkWNJUjQUpEVsQSBY4eF2Yn7+
         ssBajTXSr/G3jOdVwEkbGpiHepDLGbNp1cbTgzn/Ux5d2crw9nHT58xCczaaR1kp/imN
         PxHQ==
X-Forwarded-Encrypted: i=1; AJvYcCW00FKV2O+gN5r/ydBaVth/WJYkHXoI6b6js1aSiju9rEHl+k6pbSM8esy5qqgZJX+0FDFxlhnNZIUT9a16Aw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLp18HD3oWpru3X058/Mz/Xzi6dUJb+80bnMQG90gy6MoAvFxP
	3mjEljisaxeRaTtRpi7xDJUEUVXz72qYhUZeEPn8+gLQMXDxKqI1WHdRYFqd15GyIJlZrO12rjc
	C+oeYr30iFBgAklMihkkeDPSbO4cauNY=
X-Gm-Gg: ASbGncsowZvzg9FkYCHE364mlXoVxmuaf04yxGCZl61RklIGz2c9d9U2SqiQDoSlc3g
	rO8hV9oHCdjLJpheWLH4MJlabYa43Y++w19DNjn+OaZVQNPzNwYAx0zl53n2vW5BRrlTfiP4tFN
	MeRiJRO10sMjXYB4EbPDV5B1ntQ5meccN/+iXH/ce+ilNFyQ7qMPn2d7CRobZ3ThghoeipI3owL
	CpcyUfFPJ+Fw9peKrwwop8wViyM8eG+oNRDV1JMBXRLmg3CHX+EDXppQYBZlb2Dd9Q5sdLl6ACm
	6xgOHu0=
X-Google-Smtp-Source: AGHT+IF7mDTFFlP90HyM2PZ2wkzJy8r0oa/XBSPUCOPlO84anhWl4cv9qCVo9H3l//gvGB0W4EvLmw5CX6m3/WXwn74=
X-Received: by 2002:a53:d6c8:0:b0:5f3:317c:cba3 with SMTP id
 956f58d0204a3-627235eb229mr3125344d50.36.1757712203491; Fri, 12 Sep 2025
 14:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com> <20250912-mt8196-gpufreq-v2-1-779a8a3729d9@collabora.com>
In-Reply-To: <20250912-mt8196-gpufreq-v2-1-779a8a3729d9@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 12 Sep 2025 14:23:12 -0700
X-Gm-Features: AS18NWAF1_rOqs1uHHRFV3uK_QeI_BESdlTq94oWPQCIUjh-7p1xsAHQtKCd0Gw
Message-ID: <CAPaKu7SnopwdGpzZYNQ0GaQmHzL7ES7ZD5sOPPBUMiznXiA+8Q@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] dt-bindings: gpu: mali-valhall-csf: add
 mediatek,mt8196-mali variant
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_142324_872257_902FB3B2 
X-CRM114-Status: GOOD (  21.66  )
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

On Fri, Sep 12, 2025 at 11:38=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> The Mali-based GPU on the MediaTek MT8196 SoC uses a separate MCU to
> control the power and frequency of the GPU.
>
> It lets us omit the OPP tables from the device tree, as those can now be
> enumerated at runtime from the MCU.
>
> Add the mediatek,mt8196-mali compatible, and a performance-domains
> property which points to the MCU's device tree node in this case. It's
> required on mt8196 devices.
>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  .../bindings/gpu/arm,mali-valhall-csf.yaml         | 32 ++++++++++++++++=
+++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.y=
aml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> index a5b4e00217587c5d1f889094e2fff7b76e6148eb..163b4457f7f25dcdd509c5585=
58a73694521c96d 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> @@ -19,6 +19,7 @@ properties:
>        - items:
>            - enum:
>                - rockchip,rk3588-mali
> +              - mediatek,mt8196-mali
>            - const: arm,mali-valhall-csf   # Mali Valhall GPU model/revis=
ion is fully discoverable
>
>    reg:
> @@ -53,6 +54,9 @@ properties:
>    opp-table:
>      type: object
>
> +  performance-domains:
> +    maxItems: 1
> +
>    power-domains:
>      minItems: 1
>      maxItems: 5
> @@ -91,7 +95,6 @@ required:
>    - interrupts
>    - interrupt-names
>    - clocks
> -  - mali-supply
>
>  additionalProperties: false
>
> @@ -105,9 +108,24 @@ allOf:
>        properties:
>          clocks:
>            minItems: 3
> +        performance-domains: false
>          power-domains:
>            maxItems: 1
>          power-domain-names: false
> +      required:
> +        - mali-supply
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8196-mali
> +    then:
> +      properties:
> +        mali-supply: false
> +        sram-supply: false
> +        operating-points-v2: false
> +      required:
> +        - performance-domains
>
>  examples:
>    - |
> @@ -143,5 +161,17 @@ examples:
>              };
>          };
>      };
> +  - |
> +    gpu@48000000 {
> +        compatible =3D "mediatek,mt8196-mali", "arm,mali-valhall-csf";
> +        reg =3D <0x48000000 0x480000>;
> +        clocks =3D <&mfgpll 0>;
This seems to be an input to the performance domain, not to the gpu.
The rule says

  clocks:
    minItems: 1
  power-domains:
    minItems: 1

but neither is needed on mt8196. Should we set both to 0 (and update
panthor to treat core clock as optional)?

> +        clock-names =3D "core";
> +        interrupts =3D <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH 0>,
> +                     <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH 0>,
> +                     <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH 0>;
> +        interrupt-names =3D "job", "mmu", "gpu";
> +        performance-domains =3D <&gpufreq>;
> +    };
>
>  ...
>
> --
> 2.51.0
>

