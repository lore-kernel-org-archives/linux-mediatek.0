Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429E2CCF9E3
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Nov 2025 17:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Hy8PEdE/fLtMOp8zZJDYe1K5v8P86jnmwdVl01gCF0=; b=P8A2/3G49KvjT6doPwG+pqC7CU
	yit/c/edFYrBO1OMKc3kJhmiuOtbyJdyc/gLbmW0u3YMVgArxb5KL8JpiSjRKjuL1osfrLJK72sTJ
	J9wP7cxPltC/v0ot5uiDS0HmlPLfM67Om4mfZLXoS/v8ym01i/cQzF7azyqjdYomvZgrGtQeG7ThK
	Z7oCwNnkZWq6Rl/XETrIDg2ZwNN4wyQLyi2aLX5CYw1Mh8lU/tf6lfIDCX/BK0ugp3rq9/Az0Ul6D
	6BMsqGKoR/6ZM47NpMxvNl1WVnFBSfVzQaJ4eZ0ujp5lBlC+1ckWwWNbLR++Q2aZ/Y85WHkoOUJaI
	S4iLdHpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHQjW-00000000NRP-1h6O;
	Fri, 07 Nov 2025 17:58:46 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHQjU-00000000NPN-05o9
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Nov 2025 17:58:45 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-429c48e05aeso640790f8f.1
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Nov 2025 09:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762538322; x=1763143122; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4Hy8PEdE/fLtMOp8zZJDYe1K5v8P86jnmwdVl01gCF0=;
        b=Gj/ye5C4mMun8aJWVHX/sXm6v7whAj2lRr4UdAZKIJBA1aCJYqkoDGRHhUDKR9oaLK
         2bO5zeSSwfqnKRXLUhRFPguE8yIKzfCYXOh2tza61dAV9RXx755Vf0JqN2HZwqTm7gX3
         shx07YMRONhKbtFqvtoikv3269L621XKZ7mJXFCnH3MAAfCuC5HehLkoocSZ3neZ9BX2
         5utBRKVbFiFwfehA9+xdVh6quTf32irzJjOJjIjp+e7BhpskLDE5wz3ExZjlmcjO7hfE
         PXjglmL/S85mi02nPGc1AvVo3TgJ2Ks+Yt816wt80AofMN9C5k3fsI5f7PzRl+JUSjF2
         ZFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762538322; x=1763143122;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Hy8PEdE/fLtMOp8zZJDYe1K5v8P86jnmwdVl01gCF0=;
        b=iK/uW74/a43Sqh3JIweBELxgM8li7pND6YuJGWaEOuc/05+stUaFhidXKXpnutxGbj
         /RWxjgVnVO0FtG/s3XVCNAMY3xK4x4NicfwIvUaLqLkKCqx5/sHUAxveySl5rN7qF9vE
         oqaFXlpkgVbNFeAvUHtUeSRsT6dEKDeF0DLc2w1YZQ49SpV3qA4Q2GFtTuXJRLiuNQiO
         Zc97AmTLwQ9XBY3ioBs59BABJ6Xw5iQwKO3SaJYoKN5jjVM6bhTHP0rdDov03C9TIATc
         IskVr/71lOc6PFdx22xvLnJU4O5Y+NpXxyYzSQnsVbKxy7RyDH1gq87uMbYSmy1Kk8y8
         oobg==
X-Forwarded-Encrypted: i=1; AJvYcCV4b/0sE1+tllgjjZf9coO7kWRi/tjM72rCzQaMYYVLDKZ5tC+Xis6MnQLKueytlZC+PcrmdLXmfYDgCasJyw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBs6E5aZ96tjvp4cwSQa52JV/ygS5zmHyFdyg2GypXeSVbAql4
	KGmBEKZ/ojbtB7jzc2LX4wI45M92CB9BSXpkHSdDnEIPaaPlLrM6qSVP
X-Gm-Gg: ASbGncuMzRtn3U09gGbnZedRF6F44EwWxhlaCAP0AHW7ZsGbWp5ukZ7qDsvO32YClmt
	4/rFwSaYQNPC75QX+dLkeSQjmXJw6deWt+Spxomigkcva0/r0vEt+vu3wzWikDqEvkP78u2cUf+
	92GKBXoo0kO3qqgAUHTtcvejLm9ERtfpR1KI8glqV5zqUuwKhk+kKRz5LDoIhPBLENvY5J9a77Z
	KPvmn+LGITEiNk6agWmHmKWLa+dpbYAC/GYDhGcpbF4Qeao6totVdPONeE+cKttOmXbf0wCoj1T
	2miIU5pJ3wK2m8CYxzWOnkIj/wyS5NPfNukjHSIZwsWXkQ7Xj0wogP7qvkPriiyETw/ICzpUMPT
	WI/bxtsdX97KiPQsqLtzALplLiqzxopnB9XruoT4maWT5CYK+AHSrSrmC1usRKKeCC/2OkdZVWT
	MB0FVzOg4woBrdG/SWmSaMf6JjRPtH
X-Google-Smtp-Source: AGHT+IHxrsG4B2duEE/+GCKG0QyJVFEsIc/yuwXnmYOAcLA/FUrE6rMl803DqisMTH4v+FhxV5j+Ag==
X-Received: by 2002:a05:6000:26c9:b0:429:ef72:c33a with SMTP id ffacd0b85a97d-42b26f4be9dmr2506029f8f.3.1762538322141;
        Fri, 07 Nov 2025 09:58:42 -0800 (PST)
Received: from Ansuel-XPS. (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477640fb801sm45371425e9.11.2025.11.07.09.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 09:58:41 -0800 (PST)
Message-ID: <690e3351.050a0220.15e225.cf82@mx.google.com>
X-Google-Original-Message-ID: <aQ4zTvBcOb-258Gg@Ansuel-XPS.>
Date: Fri, 7 Nov 2025 18:58:38 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/5] dt-bindings: pinctrl: airoha: Document AN7583 Pin
 Controller
References: <20251106235713.1794668-1-ansuelsmth@gmail.com>
 <20251106235713.1794668-5-ansuelsmth@gmail.com>
 <20251107-washstand-motivator-c5e5e5d30dae@spud>
 <690e311d.5d0a0220.2f18f8.2b28@mx.google.com>
 <20251107-jasmine-unarmored-e3f5d544a1b7@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107-jasmine-unarmored-e3f5d544a1b7@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_095844_077465_F5DEBDFB 
X-CRM114-Status: GOOD (  19.04  )
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

On Fri, Nov 07, 2025 at 05:55:43PM +0000, Conor Dooley wrote:
> On Fri, Nov 07, 2025 at 06:49:13PM +0100, Christian Marangi wrote:
> > On Fri, Nov 07, 2025 at 05:24:21PM +0000, Conor Dooley wrote:
> > > On Fri, Nov 07, 2025 at 12:57:07AM +0100, Christian Marangi wrote:
> > > > Document Airoha AN7583 Pin Controller based on Airoha EN7581 with some
> > > > minor difference on some function group (PCM and LED gpio).
> > > > 
> > > > To not bloat the EN7581 schema with massive if condition, use a
> > > > dedicated YAML schema for Airoha AN7583.
> > > 
> > > You went to more effort than I would have here with that conditional!
> > >
> > 
> > Well it was suggested by Rob and it's honestly a copy paste of en7581
> > with the relevant thing changed.
> > 
> > > > +patternProperties:
> > > > +  '-pins$':
> > > > +    type: object
> > > > +
> > > > +    patternProperties:
> > > > +      '^mux(-|$)':
> > > > +        type: object
> > > 
> > > What's up with this regex? Why does it allow either - or $?
> > 
> > It's to permit either mux-* or unique node name with mux. Pattern is
> > also used by mt7622 or other schema. Other use mux- to require a name
> > after the mux.
> 
> Ah right, because you can have the config properties like drive
> strength in the mux node, so sometimes a -pins has one mux node (mux:) if
> all pins share settings and sometimes there could be multiple, which
> requires a suffix.
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable

Mhhh why not-applicable ? :(

I rebased on top of linux-next, did you spot any conflict?

-- 
	Ansuel

