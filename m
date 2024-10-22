Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A94D2CE00
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 16:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxWrldtj8CkDnO6DhUP04cjtdJoNzqSbZK7oqpPnv/8=; b=udHz7nKchdsRN+6wk8bJVcw9YA
	HBlupWPHfTHysnrKCfVKC5lMjTNhObUnhVcrydMI/ShmTiz7fu5f0lbw8i1T3ytk6LmY8f0Xe+nJC
	07MekJ8E5SpI/C5JDimkgVZBTrNe7idsQgIPiIvDV23JgdZTOZhKAbC4mV4A+0SNjiszzQYZRNAoT
	YrgDxT/sXNmp+xMtoMBLgruQcAfrB9S+/wE1xLsKfLhm+el5WXk0yQWJH69G55L/FInjTagiEnB9E
	+TkZ0eFOTxCxoc0pBXiv1G+RqLmxFHRrEKqGqJ8RlhTD6WHw7Mzf6yrQf6JjqsI082NjGlYrS1nJo
	wUnLhb0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Hzy-0000000BWFd-1HEl;
	Tue, 22 Oct 2024 16:44:46 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3HOd-0000000BNLa-3hXw;
	Tue, 22 Oct 2024 16:06:13 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-431695fa98bso33537665e9.3;
        Tue, 22 Oct 2024 09:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729613169; x=1730217969; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fxWrldtj8CkDnO6DhUP04cjtdJoNzqSbZK7oqpPnv/8=;
        b=NpyobW4KM7If5Wotf5faWqMSWoN8nYcZ5h9MFNBoAVH4hXdT+B0U3cYFo0VBvln3EF
         gpD7ptQrkHSbqbwdlnaJ/Uol8AbqnfPIKwumtyJ2h6lxJi9wu576euWH27EzIgkeNuI3
         /pWz+h484F/UsaFQZUYeUp31l0CjhcPkFdn/4r+sN59+DTbTwSCFaJgs+daDJ91pIKpd
         s+kqRiWMaC+fHkYRrXRlhgzFBuZoMoYobhJz93xb8paM8Lskme9T1k8icoySYcY33F32
         8NVaYaNcsBjFonx7J7TXCue6O0yY8vMBfkBn5MzPkBRgv0z3d0WJuYndfhmolbAWZUk6
         fzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729613169; x=1730217969;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxWrldtj8CkDnO6DhUP04cjtdJoNzqSbZK7oqpPnv/8=;
        b=JLtTz3iEWWOqIBFuMKL+XQiEU4O1j043Ti/4gNEy4EmZkfvhJ0eWYcpUcdqELCc55H
         KDwnxwBGx7/HXKyMhDpAsd08ELIgvEaPzCBMfwzzL10kexb8dy1Zpy4YHOutVJ6fORnw
         UGDc3t/9txteyOJbeHQVipWDIm1HBHsekm6McRhOZI1JlG6ABggchBJGHBimg+Mk1oKL
         zd0kv5s9Cb1dbmrAMUJBr19xGjZ6AtEXNsLeH6Zwvg83zPrae3Vva4P9p4gLL3ZWNCYE
         jw9uunH0LeqrDiCBL/JBqLgAX7iJE9rnAASXQbvBVbFKIosG7u2Y6kaR/0Jj1HCC9wb0
         BLVg==
X-Forwarded-Encrypted: i=1; AJvYcCU9hdaouok0gVC4reQRUKhxHZhON/HhN09fz53QsqCIRM6eyNpz0lI1Wa0tv8oYzTxAB/TQGMpyHUxDdrYaW9s=@lists.infradead.org, AJvYcCW2d4J734JZQqKzFlq9oz0Z5PGKRPihO7iPxLHuDppnC5SGamqeuXMQF8xW8IRBZPO96RY5n1G+pshQsT2edEed@lists.infradead.org
X-Gm-Message-State: AOJu0YwL8gzFRjNAIeZbn28DiTx2mWjaqnaZDjgLwjxcGgvVKvAZ0Ifh
	uCpbv/tAe1pMghZr/tHWUYPZFI5XfKUmaTn6rh+wo9g6Jk9s33N9
X-Google-Smtp-Source: AGHT+IGn+ZvQ2I0cnepX3Iem8TmtbcezWfjPrq8BYpHnSfPOy22mKwtv0GTJLAfmSkZIvd++rl2lXA==
X-Received: by 2002:a05:600c:4709:b0:430:56c1:644c with SMTP id 5b1f17b1804b1-43161693a2emr116369875e9.31.1729613168980;
        Tue, 22 Oct 2024 09:06:08 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a37a2fsm6921282f8f.22.2024.10.22.09.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 09:06:08 -0700 (PDT)
Message-ID: <6717cd70.df0a0220.850c6.7b5d@mx.google.com>
X-Google-Original-Message-ID: <ZxfNbgbroaqiZhkf@Ansuel-XPS.>
Date: Tue, 22 Oct 2024 18:06:06 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com, benjamin.larsson@genexis.eu,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH v8 3/6] dt-bindings: pwm: airoha: Add EN7581 pwm
References: <20241018-en7581-pinctrl-v8-0-b676b966a1d1@kernel.org>
 <20241018-en7581-pinctrl-v8-3-b676b966a1d1@kernel.org>
 <20241021190053.GA948525-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021190053.GA948525-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_090612_047761_2CE65C96 
X-CRM114-Status: GOOD (  31.79  )
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

On Mon, Oct 21, 2024 at 02:00:53PM -0500, Rob Herring wrote:
> On Fri, Oct 18, 2024 at 03:19:04PM +0200, Lorenzo Bianconi wrote:
> > Introduce device-tree binding documentation for Airoha EN7581 pwm
> > controller.
> > 
> > Co-developed-by: Christian Marangi <ansuelsmth@gmail.com>
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  .../devicetree/bindings/pwm/airoha,en7581-pwm.yaml | 61 ++++++++++++++++++++++
> >  1 file changed, 61 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/pwm/airoha,en7581-pwm.yaml b/Documentation/devicetree/bindings/pwm/airoha,en7581-pwm.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..fb68c10b037b840a571a2ceee57f13cbae78da66
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pwm/airoha,en7581-pwm.yaml
> > @@ -0,0 +1,61 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pwm/airoha,en7581-pwm.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Airoha EN7581 PWM Controller
> > +
> > +maintainers:
> > +  - Lorenzo Bianconi <lorenzo@kernel.org>
> > +
> > +allOf:
> > +  - $ref: pwm.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: airoha,en7581-pwm
> > +
> > +  "#pwm-cells":
> > +    const: 3
> > +
> > +  airoha,74hc595-mode:
> > +    description: Set the PWM to handle attached shift register chip 74HC595.
> > +
> > +      With this disabled, PWM assume a 74HC164 chip attached.
> > +
> > +      The main difference between the 2 chip is the presence of a latch pin
> > +      that needs to triggered to apply the configuration and PWM needs to
> > +      account for that.
> > +    type: boolean
> > +
> > +  airoha,sipo-clock-divisor:
> > +    description: Declare Shift Register chip clock divisor (clock source is
> > +      from SoC APB Clock)
> 
> Where is the clock source defined?
> 
> You can specify the PWM frequency in PWM cells and should be able to get 
> the APB Clock frequency. Then you can calculate the divider.
>

Hi Rob,

this property is related to the Shift Register chip and is not related
to the clock of the PWM.

It's really to configure the clock that will be feed to Shift Register
chip if for whatever reason one OEM mount a different kind (but still
register compatible) and requires to run at higher clock rate.

We can consider hardcoding it if really needed but considering the case
with 2 different kind of shift register supported, I assume configuring
this might be needed on some corner case Devices.

For the clock we are not 100% but we might have an idea of what is the
source, but still it will be just referenced and enabled in the driver
(it's always enabled).

Hope I can get some hint by you on how to proceed.

Is it ok with:

- Defining the attached clock
- Keep the property

?

> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    default: 32
> > +    enum: [4, 8, 16, 32]
> > +
> > +  airoha,sipo-clock-delay:
> > +    description: Declare Serial GPIO Clock delay.
> > +      This can be needed to permit the attached shift register to correctly
> > +      setup and apply settings. Value must NOT be greater than
> > +      "airoha,sipo-clock-divisor" / 2
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    default: 1
> > +    minimum: 1
> > +    maximum: 16
> > +
> > +required:
> > +  - compatible
> > +  - "#pwm-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    pwm {
> > +      compatible = "airoha,en7581-pwm";
> > +
> > +      #pwm-cells = <3>;
> > +    };
> > 
> > -- 
> > 2.47.0
> > 

-- 
	Ansuel

