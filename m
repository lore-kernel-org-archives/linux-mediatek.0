Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD36FCD37AA
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Sep 2024 17:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+IBsYaPbezPpgRuG1uD3riOzo1Dt0eeW8YyHRQcRrcA=; b=uIhGLIM7pVh9bi8oe64f9cHTYM
	XAtxozUQs8TSX/9rLus6a1UHgmQVBYVdc3DENp2+5ouZjLXjXVEuFpqDX4zB2OMcvJKf0s3DLYdQB
	x/RSt0Gsn+iMVZQRg3hoZvxB1vj7EmtlS3X0i05mL35HfqtM4aw9lC/Sj67B3TIC8xH6jqcQB7wav
	b4IfmkvuoszcFMko1/dQRIKEO4buhORNS1SAAF2VoYHRX+FIVhEg5NjY5LRHA/hz4w0zHbMuesO97
	UUaCQ4rPSb7O8tcGvAV9IBB0k289GOlDB6ndjxGgYDDJL/xKJdYAWXR74kWDdekKMbSo2mCP+WLtO
	iyu2uW+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slXb0-00000001LTg-1Ezl;
	Tue, 03 Sep 2024 17:45:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slWbp-00000001AMs-2jmT;
	Tue, 03 Sep 2024 16:42:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 688BE5C55E2;
	Tue,  3 Sep 2024 16:42:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A82BC4CEC4;
	Tue,  3 Sep 2024 16:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725381744;
	bh=ysx2yq2EzG2SmeMo3CLySNMcvk3ddYkzx0Kw43XPAxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XgCqPXZazwzGXgfGAhqlE+vpCryS6mxbB6qDi2nJMtReK0UuPyw1UIERUdA36XOgx
	 WDxqlO5jl7O5CapgicZ8MVPOkcojtyHi3qvPdKgYDGAzo9OtCWfBzAZh7QqeQC3MrK
	 1VrUL5vWukZR8FWRGHp14byhFqupVrqQpdh985FojvyqjwFs4XVGr5ZJAvd6PglQ4U
	 XQk5k3/pmyZBDIQdpxVRXXGile+ffCXoRKvpg0sEZmBvfU5PVA9tametbMV8sM87Jn
	 o84+B+tFOlo+AgtR5XGka5zi/SBUFzD/yIQOeONzQyeIzkRV4u7WAn1fGUSuI4RW7Z
	 YQeezY7rQRlQA==
Date: Tue, 3 Sep 2024 17:42:18 +0100
From: Lee Jones <lee@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com, benjamin.larsson@genexis.eu,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH v3 2/5] dt-bindings: mfd: Add support for Airoha EN7581
 GPIO System Controller
Message-ID: <20240903164218.GC6858@google.com>
References: <20240831-en7581-pinctrl-v3-0-98eebfb4da66@kernel.org>
 <20240831-en7581-pinctrl-v3-2-98eebfb4da66@kernel.org>
 <20240903153353.GZ6858@google.com>
 <66d72ea9.df0a0220.21f5f.029f@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <66d72ea9.df0a0220.21f5f.029f@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_094225_846484_6E466D93 
X-CRM114-Status: GOOD (  30.42  )
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

On Tue, 03 Sep 2024, Christian Marangi wrote:

> On Tue, Sep 03, 2024 at 04:33:53PM +0100, Lee Jones wrote:
> > On Sat, 31 Aug 2024, Lorenzo Bianconi wrote:
> > 
> > > From: Christian Marangi <ansuelsmth@gmail.com>
> > > 
> > > Add support for Airoha EN7581 GPIO System Controller which provide a
> > > register map for controlling the GPIO, pinctrl and PWM of the SoC.
> > > 
> > > Schema define cells for both gpio/interrupt controller and PWM.
> > > Moreover it provides a dedicated pinctrl node for pins and config
> > > definitions.
> > > 
> > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > > ---
> > >  .../bindings/mfd/airoha,en7581-gpio-sysctl.yaml    | 433 +++++++++++++++++++++
> > >  1 file changed, 433 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/mfd/airoha,en7581-gpio-sysctl.yaml b/Documentation/devicetree/bindings/mfd/airoha,en7581-gpio-sysctl.yaml
> > > new file mode 100644
> > > index 000000000000..a9080c7f50f9
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mfd/airoha,en7581-gpio-sysctl.yaml
> > > @@ -0,0 +1,433 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/mfd/airoha,en7581-gpio-sysctl.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Airoha EN7581 GPIO System Controller
> > > +
> > > +maintainers:
> > > +  - Christian Marangi <ansuelsmth@gmail.com>
> > > +  - Lorenzo Bianconi <lorenzo@kernel.org>
> > > +
> > > +description:
> > > +  Airoha EN7581 SoC GPIO system controller which provided a register map
> > > +  for controlling the GPIO, pins and PWM of the SoC.
> > 
> > This whole thing is just about pins.
> > 
> > The MFD portion of this submission doesn't do anything.
> >
> 
> Hi Lee,
> 
> thanks for the review. I think you missed the other series as it was
> requested to use MFD implementation due to shared register map.
> 
> > Please rework this to omit the MFD driver.
> 
> I'm a bit confused by this you mean in the schema? Putting PWM property
> in a pinctrl schema looks wrong to me :(
> 
> > 
> > After just a glance, it looks like simple-mfd _might_ work.
> 
> Simple-mfd works if register map are well defined and you can have
> something like
> - parent define the whole register
> - child can user reg property to register offset and subsection of the
>   parent register
> 
> Here it's all mixed and scrambled and also it was requested to have a
> very simple node that include both pwm and pinctrl property (cause that
> is how the HW register block is designed and schema must reflect HW)
> 
> Hope you can understand these reasons.

Thinking very quickly before I have to rush off.

Have you considered syscon?

-- 
Lee Jones [李琼斯]

