Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C391BC4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 19:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/dObR4H4ilLXy7RvU+4bCKLkA6qzotbEGfsavcKUjsA=; b=V8fCWS+MQkXojK8aT16GI9jIzm
	spi+D8ThialWK2By3S/rMTfaq73gKCuZlKVcd44yASRNBg/lWKNwfB3lQmHsYZ7C0oe0UxiNHpm4q
	sMW0P9eLwb5M+hBjdFLW04EnZEJUrpf0XBpY4ltvcRp24yQJuvp/2z96kQj+9N9bAZLem0L71JyQG
	3BQWoJs3MaXrLGC3hDLkFudI8S0zTy1rdmRraQWeTV6e30yu+NfglyYEEh1FUBXuhTU2nMPm8Tk9H
	obILVLzO1ZvHZaPHC3k2oQ04GDPHAb5KHXnxR1AMl+bkGgUA/asdBsc9vufINLQGWLNZVXx3hNTYg
	DdT11KLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxAiH-0000000HK2S-37bH;
	Wed, 17 Apr 2024 19:12:57 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxAiC-0000000HK0Y-3Ipz;
	Wed, 17 Apr 2024 19:12:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CEE20CE14E8;
	Wed, 17 Apr 2024 19:12:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAD3FC072AA;
	Wed, 17 Apr 2024 19:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713381170;
	bh=ffcHkuWgg56i0N4KooPmFmdGhTww4OCdeWXSj8ezWUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IywYCUI1xUqyVE5uPR2b2fC2zXBM4wVg5VQdWrQekJatVr1MLULvXT20s2FF9kW3m
	 c/IyJ6XpnhG/iA0ouqp11xtBYv0NvhqfmXk1EyUMBhLhEqhc0T2mrI3H5m+mJFRLqm
	 N84p+oC5j0wqx5Ng8Tc0el+2W+VSXwwcT8LdE9CZut3YDUQQQxUAij7v6vh92jVfWH
	 U/m84Loaj3bYNPpLteHud9XgExrMaEEBMI8TZth7GEBS69WubmG1FfnCH77hI5nfap
	 lwy70ENbZS82aMQIF+/Cp7UibrtG/ety53QP2loJtpkF3d1fZgET6rM41lR2ObK7I5
	 9shL3VomQL96w==
Date: Wed, 17 Apr 2024 14:12:47 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: djakov@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com,
	broonie@kernel.org, keescook@chromium.org, gustavoars@kernel.org,
	henryc.chen@mediatek.com, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com,
	wenst@chromium.org, amergnat@baylibre.com
Subject: Re: [PATCH v2 1/7] dt-bindings: regulator: Add bindings for MediaTek
 DVFSRC Regulators
Message-ID: <20240417191247.GA3101736-robh@kernel.org>
References: <20240417091442.170505-1-angelogioacchino.delregno@collabora.com>
 <20240417091442.170505-2-angelogioacchino.delregno@collabora.com>
 <20240417145238.GA2348962-robh@kernel.org>
 <b728478d-d9c9-4256-aeab-a234316d81cc@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b728478d-d9c9-4256-aeab-a234316d81cc@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_121253_210053_2C8403D0 
X-CRM114-Status: GOOD (  23.72  )
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

On Wed, Apr 17, 2024 at 05:39:12PM +0200, AngeloGioacchino Del Regno wrote:
> Il 17/04/24 16:52, Rob Herring ha scritto:
> > On Wed, Apr 17, 2024 at 11:14:36AM +0200, AngeloGioacchino Del Regno wrote:
> > > The Dynamic Voltage and Frequency Scaling Resource Collector Regulators
> > > are controlled with votes to the DVFSRC hardware.
> > > 
> > > This adds support for the regulators found in MT6873, MT8183, MT8192
> > > and MT8195 SoCs.
> > > 
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > ---
> > >   .../mediatek,mt6873-dvfsrc-regulator.yaml     | 71 +++++++++++++++++++
> > >   1 file changed, 71 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
> > > new file mode 100644
> > > index 000000000000..446f1dab4d2e
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
> > > @@ -0,0 +1,71 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/regulator/mediatek,mt6873-dvfsrc-regulator.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: MediaTek DVFSRC-controlled Regulators
> > > +
> > > +description:
> > > +  The Dynamic Voltage and Frequency Scaling Resource Collector Regulators
> > > +  are controlled with votes to the DVFSRC hardware.
> > > +
> > > +maintainers:
> > > +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - mediatek,mt6873-dvfsrc-regulator
> > > +      - mediatek,mt8183-dvfsrc-regulator
> > > +      - mediatek,mt8192-dvfsrc-regulator
> > > +      - mediatek,mt8195-dvfsrc-regulator
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  dvfsrc-vcore:
> > > +    description: DVFSRC-controlled SoC Vcore regulator
> > > +    $ref: regulator.yaml#
> > 
> >         unevaluatedProperties: false
> > 
> 
> Will do!
> 
> > > +
> > > +  dvfsrc-vscp:
> > > +    description: DVFSRC-controlled System Control Processor regulator
> > > +    $ref: regulator.yaml#
> > 
> > ditto
> > 
> > > +
> > > +required:
> > > +  - compatible
> > 
> > 'reg' is never optional. And how is no regulators at all valid?
> > 
> 
> The two nodes that I'm adding with this series don't need reg, but others
> that are not present in this do... but anyway, let's postpone that problem
> for the future me, or the future-anyone-else implementing the rest, I will
> remove the 'reg' property as it is indeed not needed for this node.

That might have been fine, but now that I know you *will* need it, it 
isn't fine. You could wait 1 week to 6 months to repost and hope I 
forget...

The ideal for these cases is you put the actual sub-range of 
MMIO registers in the child nodes. But sometimes it is just bit soup in 
the register layout and that doesn't work.

> 
> And yeah it's invalid to add that node without any regulator. Will check the
> other regulator bindings on how they're doing it.

'required' or anyOf with a list of required entries.

Rob

