Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDADAC636D6
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Feb 2023 20:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l9CBXqz5Ym6vyKdYB/UcZABuHubzocvDFl1/6+aRGTU=; b=hSbPgYQg6NP8GgO6f+z+iHk1WY
	yYGPb6GyZXhwW8xR8lfaR7Gqv9cvyIpGu0JPiVMYiX/iRxHDHBVHqqZaz2Nzc3yjr/FLrU7K8hwEH
	IM5/s/MaopQ2qUJOjdV3anFhGRXqoXrLwgVCFYbFxjSpJ1ynDz0xGJASkq+SKw8rrsFGiR7/yb7fl
	EyWkP6nBQKPnjQfR9+xenVeb0sT02ZMVnKyETsTydvEUnZ/NS/JFkLv58FEe0NMb3lKkeXAEQktVo
	jK6ZuBt3DXbGgsdfyNCw5K7DP8bcSlmbE5DHxdDmm2Y/nizd9cbGTWo65Eb7801wAp91xn2D+1MsB
	lrufkaEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUCUZ-005Tc6-9g; Mon, 20 Feb 2023 20:10:31 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUCUV-005Tb7-Dg
	for linux-mediatek@lists.infradead.org; Mon, 20 Feb 2023 20:10:29 +0000
Received: by mail-wm1-x336.google.com with SMTP id bg28so1734797wmb.0
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Feb 2023 12:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l9CBXqz5Ym6vyKdYB/UcZABuHubzocvDFl1/6+aRGTU=;
        b=Ip9paFpl6CVybhOZXCupqpnDcguBljmABnOUP73mVxYqpP6Jq3V+3J3KfDf2VdP2u4
         /epbDB4GhTlDBSPLK/1Ng6PPJ3k4c8MPA/mvPhyMiPD0pK1xLxllykKdHNARsgWcrhrp
         T48mUQ8SuUh5NfBFzeLhLlObbDmvmBqcSqy8bexYf2EDrJxB4+E/Us7NNWD6UQnWB8DO
         w1aqMkRilpmKd0ahPO5rEYPrPVLkSVG1rN4jLgVym1svqJGumVsfLpEYYQb1et5C607I
         ghdbaaFG31NMT9nCScHJHLddvoHraFT99FWVoXzAtrsOasTZ7d8K96GGzegtODDCdMBc
         /bEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9CBXqz5Ym6vyKdYB/UcZABuHubzocvDFl1/6+aRGTU=;
        b=LWeriYy2BeaBZKP7PgT8h4XOI5VQXZvuG/+drKJK9qUm9C3uQJ+H4uBoD6mj20XgIH
         MqdDGlhdQE5Ru7pjfhKfcmjFOLWduhXIHmivrQEKUesiqypsaxln5RS3m70srOodYj7n
         LnqEV3thM5kB2XD1/+OvDynKrSOi/TP6xJ0eSs1U1MbTyoxSpz8583NccAHvnL/wzmvH
         +gqBdAiSTiB85O/CVMt+JCq5frE9++yZLvXfIISqOXdIGhaHhMqjue8NDEGIiG3UvDq0
         UMZ03IvUC0ZBXQbFZeNZVD9M0f2mMmOZa2EdfABiq0y6bcYy8NCCccNXgy4ep0BqwWsD
         z3PQ==
X-Gm-Message-State: AO0yUKXGTMoUwglPPjsOYZ3SfQpGzFTGDxyZx2wgMLvHRbGwGfdD+8zi
	JAh28ZJpvmu/2nuY1W7Wkq4ZIA==
X-Google-Smtp-Source: AK7set9o9hcBk+G3Tqr5Nkg+e2vlF9zQ3Wr5OIKk5DsSQPAxZy/Zd7AkwhlX4VeT6HeBWiDhEe4vBw==
X-Received: by 2002:a05:600c:1e12:b0:3df:9858:c033 with SMTP id ay18-20020a05600c1e1200b003df9858c033mr1564082wmb.8.1676923824413;
        Mon, 20 Feb 2023 12:10:24 -0800 (PST)
Received: from blmsp ([2001:4090:a247:8056:be7d:83e:a6a5:4659])
        by smtp.gmail.com with ESMTPSA id p8-20020a05600c468800b003e2232d0960sm2954068wmo.23.2023.02.20.12.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 12:10:23 -0800 (PST)
Date: Mon, 20 Feb 2023 21:10:23 +0100
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <parent.f@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH 1/8] dt-bindings: power: Add MT8365 power domains
Message-ID: <20230220201023.ozy6ogdumhf35nwm@blmsp>
References: <20230105170735.1637416-1-msp@baylibre.com>
 <20230105170735.1637416-2-msp@baylibre.com>
 <6f6f1be3-358d-d062-31e1-c307dca56907@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6f6f1be3-358d-d062-31e1-c307dca56907@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_121027_503481_4C47FE7C 
X-CRM114-Status: GOOD (  28.59  )
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

Hi Matthias,

On Fri, Feb 03, 2023 at 01:31:58PM +0100, Matthias Brugger wrote:
> 
> 
> On 05/01/2023 18:07, Markus Schneider-Pargmann wrote:
> > From: Fabien Parent <fparent@baylibre.com>
> > 
> > Add power domains dt-bindings for MT8365.
> > 
> > Signed-off-by: Fabien Parent <fparent@baylibre.com>
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> > 
> > Notes:
> >      Changes in v4:
> >      - Add infracfg_nao as it is used by mt8365
> >      Changes in v3:
> >      - Renamed mt8365-power.h to mediatek,mt8365-power.h
> >      Changes in v2:
> >      - Made include/dt-bindings/power/mt8365-power.h dual-license.
> > 
> >   .../power/mediatek,power-controller.yaml      |  6 ++++++
> >   .../dt-bindings/power/mediatek,mt8365-power.h | 19 +++++++++++++++++++
> >   2 files changed, 25 insertions(+)
> >   create mode 100644 include/dt-bindings/power/mediatek,mt8365-power.h
> > 
> > diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> > index 605ec7ab5f63..a496c43cfa16 100644
> > --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> > +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> > @@ -30,6 +30,7 @@ properties:
> >         - mediatek,mt8186-power-controller
> >         - mediatek,mt8192-power-controller
> >         - mediatek,mt8195-power-controller
> > +      - mediatek,mt8365-power-controller
> >     '#power-domain-cells':
> >       const: 1
> > @@ -86,6 +87,7 @@ $defs:
> >                 "include/dt-bindings/power/mt8183-power.h" - for MT8183 type power domain.
> >                 "include/dt-bindings/power/mt8192-power.h" - for MT8192 type power domain.
> >                 "include/dt-bindings/power/mt8195-power.h" - for MT8195 type power domain.
> > +              "include/dt-bindings/power/mediatek,mt8365-power.h" - for MT8365 type power domain.
> >           maxItems: 1
> >         clocks:
> > @@ -113,6 +115,10 @@ $defs:
> >           $ref: /schemas/types.yaml#/definitions/phandle
> >           description: phandle to the device containing the INFRACFG register range.
> > +      mediatek,infracfg-nao:
> > +        $ref: /schemas/types.yaml#/definitions/phandle
> > +        description: phandle to the device containing the INFRACFG-NAO register range.
> > +
> 
> 
> Hm, so we have mediatek,mt8365-infracfg defined in mt8365-sys-clock. Also
> the description talks about infracfg_ao. You now introduce INFRACFG-NAO. Is
> that just another system clock block, or is this covered with the
> mediatek,mt8365-infracfg binding?
> 
> We would need to clean that up.

Looking through the datasheet I don't see any clock related registers
for infracfg-nao. So I don't think it is another system clock block. It
seems to be a lot of status registers and debug registers, but not all
of them. It really doesn't seem to have a specific topic here. So from
my point of view it is just a syscon block. Should I add a
mediatek,mt8365-infracfg-nao compatible to the syscon binding
documentation?

Thanks,
Markus

> 
> Regards,
> Matthias
> 
> >         mediatek,smi:
> >           $ref: /schemas/types.yaml#/definitions/phandle
> >           description: phandle to the device containing the SMI register range.
> > diff --git a/include/dt-bindings/power/mediatek,mt8365-power.h b/include/dt-bindings/power/mediatek,mt8365-power.h
> > new file mode 100644
> > index 000000000000..e6cfd0ec7871
> > --- /dev/null
> > +++ b/include/dt-bindings/power/mediatek,mt8365-power.h
> > @@ -0,0 +1,19 @@
> > +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> > +/*
> > + * Copyright (c) 2022 MediaTek Inc.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_POWER_MT8365_POWER_H
> > +#define _DT_BINDINGS_POWER_MT8365_POWER_H
> > +
> > +#define MT8365_POWER_DOMAIN_MM		0
> > +#define MT8365_POWER_DOMAIN_CONN	1
> > +#define MT8365_POWER_DOMAIN_MFG		2
> > +#define MT8365_POWER_DOMAIN_AUDIO	3
> > +#define MT8365_POWER_DOMAIN_CAM		4
> > +#define MT8365_POWER_DOMAIN_DSP		5
> > +#define MT8365_POWER_DOMAIN_VDEC	6
> > +#define MT8365_POWER_DOMAIN_VENC	7
> > +#define MT8365_POWER_DOMAIN_APU		8
> > +
> > +#endif /* _DT_BINDINGS_POWER_MT8365_POWER_H */

