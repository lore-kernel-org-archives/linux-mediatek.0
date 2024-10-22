Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5392CDD0EA
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 21:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1+ip9NKRqZ+a+yqxcpVfVzuWI8ImsALm3Y9TWNLNLzU=; b=gY1wL9EgK3FuSep/ayZ876FCDF
	FlB/XlRFBUcHiiIjNOlOCWneL0yWAJoCfy+jOtB77Xju3h/UDaLzP3OGm/8wGPHlzOKu2oILpT6Cu
	oattNUbzcyqRm2buxJMSbJywfZG4jS6CsH0gf/kGEWQocaZyjgge49e6YU1GDZs/iztaGsc2nq8Xq
	uc14zWAxbCN3o6FKY0KAlO+UXymZuv7+eOnlz2OD59xBAhzwqMfUNs+1V/gHRosvFn7UmYZjR+Pjh
	3hB2pwHr1qhRpRIOhZW6YgxAHRlc0np6QosuXUxmmI3y2CgYbr5xWAeBcJ8YfcY7ZCeaDeIEEJQQF
	80pPlCAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3M9D-0000000CBCe-3mpw;
	Tue, 22 Oct 2024 21:10:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3M7h-0000000CB1O-1OJD;
	Tue, 22 Oct 2024 21:09:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 28392A4015E;
	Tue, 22 Oct 2024 21:08:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D9FAC4CEC3;
	Tue, 22 Oct 2024 21:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729631339;
	bh=3tpcmpalVrPV8Hg6tU9RLZ1k32epHZFxnCWMpj022Do=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aklXZcYzsQPUs90EoImnG92rb8PpiTTghNdIwWNOjrmdMXYMbKFjcOQMM4yNUguPY
	 tXGaeOkr1Xzh55frYU0k9YEzCtiT2PU31C0s394+63eOJhT+gkBYseBKB8Gy6c0FZJ
	 8JN9dsdw8jqi3L3JfvZusSQS+G3PkzahqSzqN5Nf6+PLyUttzvx/wYmtmkoW0xsXy8
	 71g8t44aOdqW7+7rdsA/SjEjdPLC7nctEzGoaTRWNzPwqPyuefF3dvyMkb2rzcWxeI
	 cqM+xxn50PpPxNWvYdXSS55ZAKDAOnLo4fydoOqhOp0d1t99Q04E3GaoGhIba5MPxf
	 i6h5P91zPkdaQ==
Date: Tue, 22 Oct 2024 16:08:58 -0500
From: Rob Herring <robh@kernel.org>
To: Benjamin Larsson <benjamin.larsson@genexis.eu>
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
	upstream@airoha.com, ansuelsmth@gmail.com,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH v8 3/6] dt-bindings: pwm: airoha: Add EN7581 pwm
Message-ID: <20241022210858.GA1565063-robh@kernel.org>
References: <20241018-en7581-pinctrl-v8-0-b676b966a1d1@kernel.org>
 <20241018-en7581-pinctrl-v8-3-b676b966a1d1@kernel.org>
 <20241021190053.GA948525-robh@kernel.org>
 <2da79425-0cfc-4c73-8fb9-bd3c92aa28d7@genexis.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2da79425-0cfc-4c73-8fb9-bd3c92aa28d7@genexis.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_140901_456981_B26DBEA2 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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

On Tue, Oct 22, 2024 at 10:02:05PM +0200, Benjamin Larsson wrote:
> On 21/10/2024 21:00, Rob Herring wrote:
> > > +  airoha,sipo-clock-divisor:
> > > +    description: Declare Shift Register chip clock divisor (clock source is
> > > +      from SoC APB Clock)
> > Where is the clock source defined?
> > 
> By measurement the clock was found to be 125MHz.

What I mean is the clock input should be a 'clocks' property. Assuming 
this is a clock input to the PWM which I'm not so sure about given the 
other replies.

Rob

