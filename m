Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EF6C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 19:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0KZnJHGbvqc7ynX5ku1O3Dy12Mvfqc8FmxtXzpc+/Y8=; b=L9KGINeBNUMmui67blTIthn12L
	xWRUOB5qWiykVTNhX4YZMMBnVFiFkumLmTfkny1C62Jnryc9GGnq4tpcd9xam8+c6pFwoionZZjq9
	c+Q1JzF7Wb7qEZEbPKHTJmPRDVQBdomLQBNxrXcFA/UP9V/irtufLlpO66GFVjt0zErP9qPFe4WBX
	FhsXwio4RAzx+FVkbJgsRTe1Yuvh3GcWDXdaWBfRATMyeoHcmkiHHiwXmom6BzL109RSoXnxd9Ycc
	FiO/HopmNPfBkCud4O402MULPq0b4oCVXNixzTFbgqBmuIFtQlC7T0u7KZhHlqNIz8iDAbhKTSk2T
	Vvpo28Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olbG1-001NXH-GE; Thu, 20 Oct 2022 19:31:09 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olbFq-001NQx-CD; Thu, 20 Oct 2022 19:30:59 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1olbFY-0005rT-9N; Thu, 20 Oct 2022 21:30:40 +0200
Date: Thu, 20 Oct 2022 20:30:37 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-iio@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: iio: adc: mediatek,mt2701-auxadc: new
 32k clock
Message-ID: <Y1Gh3TQOznz3dmSJ@makrotopia.org>
References: <f98ed7f3fc15a0614443a57427d46ce17ec2e0cc.1666190235.git.daniel@makrotopia.org>
 <dbe88fd2f7ea5b2f419dce6ecb48c20e96e2e634.1666190235.git.daniel@makrotopia.org>
 <b33b9d2a-f6d5-b2a7-bcb8-1ed2303c04b4@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b33b9d2a-f6d5-b2a7-bcb8-1ed2303c04b4@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_123058_436602_C5575F64 
X-CRM114-Status: GOOD (  22.08  )
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

On Thu, Oct 20, 2022 at 10:28:02AM +0200, AngeloGioacchino Del Regno wrote:
> Il 19/10/22 16:38, Daniel Golle ha scritto:
> > Newer MediaTek SoCs need an additional clock to be brought up for
> > AUXADC to work. Add this new optional clock to
> > mediatek,mt2701-auxadc.yaml.
> > 
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> >   .../bindings/iio/adc/mediatek,mt2701-auxadc.yaml          | 8 ++++++--
> >   1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
> > index 7f79a06e76f596..c2a1813dd54152 100644
> > --- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
> > +++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
> > @@ -44,10 +44,14 @@ properties:
> >       maxItems: 1
> >     clocks:
> > -    maxItems: 1
> > +    maxItems: 2
> > +    minItems: 1
> >     clock-names:
> > -    const: main
> > +    items:
> > +      - const: main
> > +      - const: 32k
> 
> You're adding this for MT7986, and I don't see any 32KHz ADC clock on that SoC.
> I suppose that your '32k' clock is CLK_INFRA_ADC_FRC_CK, currently parented to
> 'csw_f26m_sel', so that's 26MHz, not 32KHz.
> 
> Since you'll need the same changes for thermal as well, I would consider setting
> "infra_adc_frc" as a parent of "infra_adc_26m", like so:
> 
> 	GATE_INFRA1(CLK_INFRA_ADC_26M_CK, "infra_adc_26m", "infra_adc_frc", 20),
> 	GATE_INFRA1(CLK_INFRA_ADC_FRC_CK, "infra_adc_frc", "csw_f26m_sel", 21),
> 
> ...just because there's apparently no reason to have one of them enabled but not
> the other or, at least, it looks like we *always* need ADC_26M_CK enabled when
> ADC_FRC_CK is enabled.
> 

Yes, this change is for MT7986 and MT7981, immitating the behavior
found in MediaTek's SDK sources. Embedding the dependency into the
clock driver as you have suggested should also be possible as it is
true that you always need them both and a similar change for the
thermal driver would be needed as well.

Unless you were planning to do so already I will send a patch with your
suggested change to drivers/clk/mediatek/clk-mt7986-infracfg.c.
In any case, this series can be dropped then.

Thank you for the review!


Cheers


Daniel


> Regards,
> Angelo

