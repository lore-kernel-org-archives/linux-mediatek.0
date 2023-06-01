Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32BBC7EE23
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 19:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/DwXhTPlEymB55aVRZ5TeCVtWl2BplpTKL9En4JkYR0=; b=KnQ2+QYexVhvvIWGfXrdZPyw3t
	TTudPXeVssrPEu3RT7J60VL2OlPFjFLkZ/F4M13k+Radf64Wb0qeG8u0Eu2zBBb1gxzHXHdSGKFXH
	NR0BwsYifN9zXMJ0VJMjwstPIRz5+vBTDMBirG1JpgYL2fQS6WyUSISe3jPzAqqw1jT6/mgdTwx7B
	HyyTxrXzbX7ObWd1taXFX5ZLhrut0OoRVydzkY8wOvBwm6QFXkbMIQCyn6C+4PVkwXrE75wUc4Plp
	C+N4aizPx8X2KoVqqQnj5a5dpjLKdA5fP/w+VfNlGBkOn5fTJyMQa916C0yQnW6FZ6HsFCIZM90gt
	dzr8c8Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4ngx-004hKG-2Z;
	Thu, 01 Jun 2023 19:10:35 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4ngu-004hHs-1e;
	Thu, 01 Jun 2023 19:10:34 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1q4ngi-0007iO-06;
	Thu, 01 Jun 2023 19:10:20 +0000
Date: Thu, 1 Jun 2023 20:10:11 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Qii Wang <qii.wang@mediatek.com>, Sam Shih <sam.shih@mediatek.com>,
	=?utf-8?B?6YOt5bCP5qGl?= <joe@gainstrong.cn>
Subject: Re: [PATCH 1/2] dt-bindings: i2c: i2c-mt65xx: add additional clocks
Message-ID: <ZHjtExYIdVFo3HnB@makrotopia.org>
References: <5f15212060f82fb94239174c4e4b46c151645fe8.1685549360.git.daniel@makrotopia.org>
 <12fea13e-e2c3-487f-8d2b-cfd320c98ba7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12fea13e-e2c3-487f-8d2b-cfd320c98ba7@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_121032_545229_6BE21B36 
X-CRM114-Status: GOOD (  16.14  )
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

On Thu, Jun 01, 2023 at 06:54:01PM +0200, Krzysztof Kozlowski wrote:
> On 31/05/2023 18:10, Daniel Golle wrote:
> > Add pck and mck clocks which are needed to access I2C registers on MT7981.
> > 
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> >  Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> > index fda0467cdd954..550795f6573c5 100644
> > --- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> > @@ -78,6 +78,8 @@ properties:
> >        - const: dma
> >        - const: arb
> >        - const: pmic
> > +      - const: mck
> > +      - const: pck
> >  
> 
> Adding names does not magically add the clocks. This wasn't tested.

Adding the clocks is done in patch 2/2 which just wasn't sent to
devicetree@ and dt maintainers, but to the relevant mailing lists
instead. Was that wrong and should I always send the complete series
also to devicetree@ as well as dt maintainers?

Anyway. It turns out that arb and pmic clocks are intended for that,
so we can cancel this and I'll just use those instead.

