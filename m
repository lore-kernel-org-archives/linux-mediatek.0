Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A166CEE49A3
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Aug 2023 03:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PpgSyn7xJbJ2ia+L5enewNstSLbJUwgFsy1ZDAGcYqY=; b=U+cJ/A8y3308sD34aYqosaOYkb
	S/ONRxSLPiVzjpDicLEABiA79mKJllVigejNsRsml1rgorLaH3GEl4I7hYiC1X6E7PT/TMubuGRuf
	AbORtn4Xxp73bNLPePwP6h1doyz5UJqvPQYve94x/l2IUpyPWcqjkJv/tRbuJ7tAXzuH+TmNVGRHo
	b3ZBpPqzooUZ2rf0pplNMz/82SRrvJdQfomJre1Y4u7Q/lRnFMoKFesjcMSu22v7BVeQb5MkaQk64
	UDLNN1BAy/eAcmgH+HmlR/yRwZd3rj4bnZ0T9/sQ8EEjVWKTpIg1Rl56mf7ThVv1AV3dwOzuZIBMq
	IXExfV5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYexA-00HAgj-0K;
	Wed, 23 Aug 2023 03:54:44 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYex6-00HAfh-2S
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Aug 2023 03:54:42 +0000
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-7a257fabae5so1140676241.2
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Aug 2023 20:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692762878; x=1693367678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PpgSyn7xJbJ2ia+L5enewNstSLbJUwgFsy1ZDAGcYqY=;
        b=ZaVctbrBfkzXLNwJzOUDXAG923TLvSVpZLakRz0pr87hUdv3ji43rI6flITSmVn97s
         0GsVe/Bj2jtCJC1ibxYAtWWaPjKmPDS6WT+EQnbC9bLNSFtRNODixcCs3CAYj0egtFUl
         1o/DOg8zT1NKQxs8r2OgoanlufkClIcNRlH8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692762878; x=1693367678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PpgSyn7xJbJ2ia+L5enewNstSLbJUwgFsy1ZDAGcYqY=;
        b=frwQi9tpPmBPims+UGgHmwcEzv/ngON6Q0K9geXRgB5aJnbKWJ/ZULjlYmCzYUIwkm
         iG21HzOieXiebB7osU24TCbV3AVbh0Eg5jqoxa6jCKOASg3oIUixifx4tmX8p4G4l9yc
         1J/BPO9yVZwONWTPp6qA5p/TWrHV5FGz5tHK5AbyUjZwkaLZodXiirTMSk1ueALP50bU
         tIZ/y4Cs4qQv5WLUD9uFI9akZTqayl1Pr5HsXO26fl8kFMq3N7EPiHQoba/h79clw0oZ
         hgvmAfjcsxc2JF/BIBfDI6UZR09xyxaGOnSM7l0cwPP4BgquV59310svunKc3GwywYDU
         wcjg==
X-Gm-Message-State: AOJu0Yzvw/W4s6kPLE4GGwWAQBaBhatMPkkQVALsdEatFxiuTdqm6B5U
	UUj/eZru3HdtO4RLCYoom98bz7mYzFzdUaNiozYJ1A==
X-Google-Smtp-Source: AGHT+IGeb5cnr2HQwWpeveiYpAoaqUO+M9ALIglCvEP4e2MermSqivcFXfRWShboeciowdTOYhCl/FeBH0LwVp27qHI=
X-Received: by 2002:a67:de06:0:b0:44d:3c1b:2dc0 with SMTP id
 q6-20020a67de06000000b0044d3c1b2dc0mr8182225vsk.26.1692762878173; Tue, 22 Aug
 2023 20:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230822084520.564937-1-wenst@chromium.org> <20230822084520.564937-4-wenst@chromium.org>
 <5ad5ff92-1367-ba96-b126-da80511a2769@linaro.org>
In-Reply-To: <5ad5ff92-1367-ba96-b126-da80511a2769@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 23 Aug 2023 11:54:27 +0800
Message-ID: <CAGXv+5Gc+R-hUJi5gm8an+dkq3JMD2JGwP4kDakKaHbAX2P0gQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] regulator: dt-bindings: mt6358: Convert to DT schema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mark Brown <broonie@kernel.org>, 
	Zhiyong Tao <zhiyong.tao@mediatek.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_205440_795620_A1F149DF 
X-CRM114-Status: GOOD (  16.86  )
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

On Wed, Aug 23, 2023 at 3:47=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 22/08/2023 10:45, Chen-Yu Tsai wrote:
> > Convert this from the old style text based binding to the new DT schema
> > style. This will make adding the MT6366 portion easier.
> >
> > The examples have been trimmed down considerably, and the remaining
> > entries now match what is seen in actual device trees.
>
> ...
>
> > +---
> > +$id: http://devicetree.org/schemas/regulator/mediatek,mt6358-regulator=
.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek MT6358 Regulator
> > +
> > +maintainers:
> > +  - Zhiyong Tao <zhiyong.tao@mediatek.com>
> > +
> > +description: |
>
> Do not need '|' unless you need to preserve formatting.

Ack.

> > +  Regulator node of the PMIC. This node should under the PMIC's device=
 node.
> > +  All voltage regulators provided by the PMIC are described as sub-nod=
es of
> > +  this node.
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt6358-regulator
> > +
> ...
>
>
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/regulator/mediatek,mt6397-regulator.h>
>
> mt6397?
>
> > +
> > +    regulator {
> > +        compatible =3D "mediatek,mt6358-regulator";
> > +
> > +        buck_vgpu {
> > +            regulator-name =3D "vgpu";
> > +            regulator-min-microvolt =3D <625000>;
> > +            regulator-max-microvolt =3D <900000>;
> > +            regulator-ramp-delay =3D <6250>;
> > +            regulator-enable-ramp-delay =3D <200>;
> > +            regulator-allowed-modes =3D <MT6397_BUCK_MODE_AUTO
>
> mt6397?
>
> Both cases look a bit confusing.

There's only two regulator binding header files, mt6397 and mt6360.
They seem to correspond to the two classes of PMICs that MediaTek has.
I believe the two header files and thus the macros are meant to be
shared?

MT6397 and co refer to their AP PMICs, i.e. PMICs that are companion
chips to the SoC and provide most of the power rails a system needs,
along with things like RTC, audio codecs, etc.. The MT6358 and MT6366
belong to this class.

MT6360 and possibly others refer to their charger PMICs, which integrate
a battery charger, USB type-C PD stuff, LED drivers, and a handful of
regulators.


ChenYu

