Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53EC2CDD0F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 21:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rNu/FvAWyLA/JckutZ/iwvJKerjABgFZGmn6jKJRXBQ=; b=U5ViqB2bzEr/GMwuwzLQ6K8urh
	/CRP+99zpl0ZyzXHBOoS+Ce0VxtBrASxBL04eLKRl3CF7v+oQwW6SZ7iWkkxTCgUIp/cbzydKM87y
	kJsGy8r/Oi+v6I3s0UMXcA3OP7q+UN7ycnan3lAYNXO0PLNfbjw5O13teW9UaIlqmaIf6XePYBYAI
	ae3EvfaC++bm9ewv5tVwB7K+Th0hrvhZPx27rJYja8YGpYAw4GpFw+8XeCUALVEGjrc2AxZbZex34
	L1WSBWyxorSCiXsnhB9DnQJSqNJRMYLaodZMpxdq5IZYd5uFrXPcKlG/umj3R11mE2T6D22h58w4F
	aI6SSCDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3MB9-0000000CBQs-18KB;
	Tue, 22 Oct 2024 21:12:35 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3MAo-0000000CBP8-2dhF;
	Tue, 22 Oct 2024 21:12:16 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43162cf1eaaso62504885e9.0;
        Tue, 22 Oct 2024 14:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729631533; x=1730236333; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rNu/FvAWyLA/JckutZ/iwvJKerjABgFZGmn6jKJRXBQ=;
        b=emFWgfMUeXBomF3Twx/VxXNBiK+bP9s4Eygqv3j/b/On193dGCupxXJ3avDX6aw7xw
         EVPN8ihiPygnR1f26EjQB6NaKLVpPrcZ2UG3vU8PKjd03/TqH8G0lbAevK10NIpo+N/y
         eN6LCsQmFHLx9HocyBFXvgqe+h0huEJvdUxvwUjxIZHeHYlY6GzhBTkUGqoWUVlH/PRg
         CWigvvsHuTwSVgELqwQPAIjNPiveLAxatDnNHH+5lbiGXqwTAzbf6cisM8qWdIUkbYLv
         r+/mynM459gdopHmoGZP9cEr7VTnxJLgVPN9qehKa2sXlkl4ikGl8m5N19OMJwU80BgT
         GUhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729631533; x=1730236333;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNu/FvAWyLA/JckutZ/iwvJKerjABgFZGmn6jKJRXBQ=;
        b=jLtboXvMMB+mw3XkVGG4hT+nV0oH9/ShAfSUlHvxMDAeVdb20DBD52eFFno9+IkAtb
         KcPVE+LJ+uq5pHAbUZYkdOwiP/AdbWxs7C7HhLYKqyIUyxiz9dNmSqamr78XOHeyjis7
         NZpRtte/RiEXWwLRi7NkS8Xi/B96GoCgWnDT1WP179nvUfAGtGmNu6IRMbLhPFe5VKov
         OVPoXWHldvUPtuhpenE5Otl2s5k6PFpmr1z1K0UEubFGSYePRGxFEToHk1GdvHag5s0p
         cNMbbWBSBpcco5SK1I92Ziq42j9yo5+soL8C4+9vLquVRtGHg4yUxtJQj07+jIN1nghy
         dk2g==
X-Forwarded-Encrypted: i=1; AJvYcCUc7OJH9L4WncJUqpzA1VcT1uiJG2Zleb0NF0UxBRzqqiO05j2hLvtegWJk0UYMlqcXLMpBTpC3GgyInzcd0K8z@lists.infradead.org, AJvYcCWabOkEjtzRlPSKWzbmYXt87gY5/+yD30fNujpGBYSVQBeiJaPTX71ej82iLAk5sdU24GQwQ12tGj3+jvjPtZU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+kUwpQ15V3gKy4iNtOuZNfHrEdf34wTZlWpqRou/eKmyDaTBF
	iHd76bQNl3nHxshBxTMQZdSINX7IPNDGMcjphzyITrbxLDMwuVvr
X-Google-Smtp-Source: AGHT+IGa88Nr1D+evYXWzyT7ItOhzzlRaH3zdup02HiVkyXY0Xjn7H177GR7+9NtHZ6zi58DyBHcTw==
X-Received: by 2002:a05:600c:46c5:b0:431:54f3:11ab with SMTP id 5b1f17b1804b1-4318424f36bmr3854185e9.33.1729631532571;
        Tue, 22 Oct 2024 14:12:12 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f5c2fa7sm99791705e9.34.2024.10.22.14.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 14:12:12 -0700 (PDT)
Message-ID: <6718152c.050a0220.3afab9.2d2b@mx.google.com>
X-Google-Original-Message-ID: <ZxgVKCj-uBPlAxw0@Ansuel-XPS.>
Date: Tue, 22 Oct 2024 23:12:08 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
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
	upstream@airoha.com, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v8 3/6] dt-bindings: pwm: airoha: Add EN7581 pwm
References: <20241018-en7581-pinctrl-v8-0-b676b966a1d1@kernel.org>
 <20241018-en7581-pinctrl-v8-3-b676b966a1d1@kernel.org>
 <20241021190053.GA948525-robh@kernel.org>
 <2da79425-0cfc-4c73-8fb9-bd3c92aa28d7@genexis.eu>
 <20241022210858.GA1565063-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022210858.GA1565063-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_141214_708939_7ACC5207 
X-CRM114-Status: GOOD (  15.26  )
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

On Tue, Oct 22, 2024 at 04:08:58PM -0500, Rob Herring wrote:
> On Tue, Oct 22, 2024 at 10:02:05PM +0200, Benjamin Larsson wrote:
> > On 21/10/2024 21:00, Rob Herring wrote:
> > > > +  airoha,sipo-clock-divisor:
> > > > +    description: Declare Shift Register chip clock divisor (clock source is
> > > > +      from SoC APB Clock)
> > > Where is the clock source defined?
> > > 
> > By measurement the clock was found to be 125MHz.
> 
> What I mean is the clock input should be a 'clocks' property. Assuming 
> this is a clock input to the PWM which I'm not so sure about given the 
> other replies.
>

Yep it's not, we are just dropping this property and hardcoding it to a
sensible value in the driver. Sorry for the confusion and thanks for the
clarification.

-- 
	Ansuel

