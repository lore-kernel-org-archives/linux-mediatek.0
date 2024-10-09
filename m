Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DAACEE35B
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 22:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0i77NC6oLQq+IeEr+P4sfxSedK09tyLyxivDjpTqakQ=; b=OWMl96Fjhv5W4Hj0SLjPikQOxN
	EFsp5xi6xG1GB5pXPuP+60/v+Vctpwd5NWlSEmOsknXDPWogmQ8GQpcsebTE36hn/nw9VqlqgcZiO
	CJ2z4Gdd7/aEYwVNRJKhh6peC4r/F/2ekkWZWRUoGioKlA68ONK0IkaWBSX1tUM7pjdT7FWr3NjIH
	++0MkiQyYE9D/eb192KRPSplgRz2JD2CzVgtWHuM649FloRZt6aaBz+Y2kXdv1eO1o/USVtMaxAMd
	Jv+WhhjpeZlvySlsiWJPJkBdUSlwLDivKydT2ywutnL3gStK7FMb1wyz1qhZxjNrGeGcG80h1s8KC
	Y4pAaqaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syevT-0000000AtuY-2HAl;
	Wed, 09 Oct 2024 22:12:59 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syeu8-0000000AtkM-1QSF;
	Wed, 09 Oct 2024 22:11:37 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-37d30e6bde6so147697f8f.1;
        Wed, 09 Oct 2024 15:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728511894; x=1729116694; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0i77NC6oLQq+IeEr+P4sfxSedK09tyLyxivDjpTqakQ=;
        b=LVRN1eWIVPy7TGtZbzJzhOy8v+mIk0JiDhcaQ/gVNgjAdtUyrwO2+GOSJUub0qBtoa
         iofpxXekFr4UMcvZ9LquhxHzhZ0bgH02uhML39keUkWrzzyDq11ida2FwLPGsb72X9Ej
         5+1Q2M+yB/D+m9B2PynQDHfYdDpT91cMYUXgrHkGv6aiunSV1FIAazXMqUNWer2qNs/L
         S8v68TRAAzljAQeKbvuQpjzJNWUSy9bd9DxsskYxL6/IoJa6HRDfH6dX0Bks5uU8yB70
         XEyoMCaR43p8K8N4QRew7kci/yyONXetRjixBw3UPIqiqBG3vMnHnBS+QPJBmLPL4huG
         yVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728511894; x=1729116694;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0i77NC6oLQq+IeEr+P4sfxSedK09tyLyxivDjpTqakQ=;
        b=Fptr0LJYCjQpG+667GbMK14dVtP83DVH1q/rKCbatH612/jSCAR/3ZUm+ggnpSoyNP
         y/sGWiuLy2kKJZ1OSQQemkp8Fdgna0zCNIOlzwSai8SYz4nn7bTqReJl5bLk4apSh3Ve
         iZoxbcKpqjzWS2QAJ2ZwQ/ZeUJxNtU2EZCLKOnSyBELwIMYQIr0eHs54AdMH/CB/URHP
         WLdv161WXX9ipfAZce/B9FavmuQDssdjPJDiwVVp6b6LVY4l+9Qki+CVlJ9sSHNSLNPM
         hQbKYwCjROHXykydKXoOKa2lUh4LmmWniNDLY60JTUE7AuzM42dM/AEhrDCABUlmL5UY
         p5og==
X-Forwarded-Encrypted: i=1; AJvYcCVBaCsGu17QsA2t3AWiSTF+gTupztmJ+oXk1kNhP0MKDHB6k7ZwcdsCc9LumwPtPDBPdngkADzdAug/r2STOf4=@lists.infradead.org, AJvYcCWJUVg44RkbXO1Wmg4mGIDMZcAAFCZ3RmRm6Zz3Yg8rrLBxQUpRPS3rEI9kcrerXFkgJW/XEwM0UpIyqjj8V8c7@lists.infradead.org
X-Gm-Message-State: AOJu0YwstgrLLIRQdIGV/ckCk72MrQ57eLkxJ6iJfEYY6846SesdnP+o
	Z+IaEsOuBA+/k21UwyRz6tMci++/mEcEAYqWCPHqSWZ1l1mgHEcy
X-Google-Smtp-Source: AGHT+IHw9cL4v+z9P6U/yiMBej1wyxRUTPzlrVemNRcu+QpJcb9PafME3WdhTwugRboleUKOXk5CCg==
X-Received: by 2002:a5d:670d:0:b0:37d:476d:2d58 with SMTP id ffacd0b85a97d-37d476d2db1mr964948f8f.45.1728511893739;
        Wed, 09 Oct 2024 15:11:33 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1696f921sm11356159f8f.91.2024.10.09.15.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 15:11:33 -0700 (PDT)
Message-ID: <6706ff95.df0a0220.22b580.89e6@mx.google.com>
X-Google-Original-Message-ID: <Zwb_kucVA3WNpaGf@Ansuel-XPS.>
Date: Thu, 10 Oct 2024 00:11:30 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Richard van Schagen <vschagen@icloud.com>,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [RFC PATCH 1/2] dt-bindings: crypto: Add Mediatek EIP-93 crypto
 engine
References: <20241009171223.12695-1-ansuelsmth@gmail.com>
 <20241009212400.GA735586-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009212400.GA735586-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_151136_417579_40473A9B 
X-CRM114-Status: GOOD (  25.83  )
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

On Wed, Oct 09, 2024 at 04:24:00PM -0500, Rob Herring wrote:
> On Wed, Oct 09, 2024 at 07:12:20PM +0200, Christian Marangi wrote:
> > Add bindings for the Mediatek EIP-93 crypto engine. The same IP is also
> > present on Airoha SoC.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  .../bindings/crypto/mediatek,mtk-eip93.yaml   | 40 +++++++++++++++++++
> >  1 file changed, 40 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/crypto/mediatek,mtk-eip93.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/crypto/mediatek,mtk-eip93.yaml b/Documentation/devicetree/bindings/crypto/mediatek,mtk-eip93.yaml
> > new file mode 100644
> > index 000000000000..b0173b4da42d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/crypto/mediatek,mtk-eip93.yaml
> > @@ -0,0 +1,40 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/crypto/mediatek,mtk-eip93.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Mediatek EIP93 crypto engine
> > +
> > +maintainers:
> > +  - Christian Marangi <ansuelsmth@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - mediatek, mtk-eip93
> 
> space?
> 
> Why mediatek and mtk? Is eip93 an SoC? 
>

Hi Rob,

totally blind for not noticing this (and not even dt_binding_check
notice it wow)

Anyway the naming of this thing is a bit strange and hope you can give
some hint about what to use.

This is a crypto block included in various product like Mediatek SoC
(mt7621), DSP (ADSP-BF70x Blackfin) and in more recent stuff Airoha SoC
EN7581.

In documentation and in GPL source is called in various name... PKTE,
EIP93, geneirc "Crypto". One common name in drivers is tho EIP93.

Currently upstream it's supported the more recent version of this kind
of HW Crypto block, EIP197.

There the compatible is

"inside-secure,safexcel-eip197"

So from these info IN THEORY, the real produced of all this stuff is
inside-secure and the product is safexcel (confirmed also in other
product)

NOW the real problem.

From what I notice EIP93 HW Crytpo present on the old Mediatek SoC
(mt7621) have some small difference in some registry so maybe a specific
compatible will be needed.

Given this situation would it be acceptable to have

- inside-secure,safexcel-eip93
- inside-secure,safexcel-eip93-mt7621 (or maybe risky but
    more generic -mediatek ?)

The current driver doesn't fully account for the mediatek variant so it
would require some later changes. Maybe a better strategy is to just not
declare mediatek compatible for now? I know it sound stupid to ask a
question for something not entirely supported now but it's really to
understand how to move in the future. (just to prevent case where the
generic compatible is misused and we get mad on handling it in the
driver)

> > +      - airoha,mtk-eip93
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    crypto@1e004000 {
> > +      compatible = "airoha,mtk-eip93";
> > +      reg = <0x1fb70000 0x1000>;
> > +
> > +      interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> > +    };
> > -- 
> > 2.45.2
> > 

-- 
	Ansuel

