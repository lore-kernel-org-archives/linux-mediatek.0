Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19043C2BD09
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jul 2024 17:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uShTqoxc6RNU1rIlpJf5CgEMe9RNeuaEiAoOaCJyBZY=; b=qypB3RlAMJoGu/7+Ptt+mWJYpH
	afDJvN0sHHVr/hgjAjm68POk+pMlVdhxMTSxQinDc3pVm7/Xu3DQ1j4YwvbHpikujjGYNmlToT1Nk
	EHxoYpJk78rW0l17WNJdYsGhb467OZEEyfvShAO4aRk1DFLIhBkqLh7j8Q/StifqA8ILQLu79pilk
	S59bZuVy3H+4muE8O+0HhP9gXcjdv2CYLgNuQVIVVLcjO5mmSV0zI7Ko079rxIQj4gYYuKN7ygErh
	7DDMUmW6w1v4D5/wMUcfjzLddAICWBKRvlGbSr0891zJPiqM27PPWLciyYZmUpYpatmRF42sZFErK
	KBV58dkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOKfD-00000004HQR-259I;
	Mon, 01 Jul 2024 17:18:03 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOKf1-00000004HNh-26fb;
	Mon, 01 Jul 2024 17:17:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6972ECE1A54;
	Mon,  1 Jul 2024 17:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EFA6C32781;
	Mon,  1 Jul 2024 17:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719854268;
	bh=wcPmXYJTY/CZ/O9Vqbj7WeF4g6HD757l9DFr+Lr3X9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bolHJ7srqPaWrIl0M7Fhi0mOI0NKVup0Hn+YS7KAXpRUutabBFd/cH9HhGpudTeV/
	 uv7e/pJWjXF0xIqIObZEzLmCVLiROKFrGY9DclRq3vLFsIUpgSqiHA0cZI98b2e+4Z
	 9NR7tE9tBEhkO/K/FxFFvCqoNoeVsQTtxPBWrGQA/qfrasM5+dcfBILq8bafUqDlb+
	 3nN9ZqhY/IiImL76A6ncDncuO2j6H7FX9HwEVXiGc2kMJobxe4BipfR3drCZjsKz/a
	 rdnYQUqY5DTQYSGdHyEPhwLSnmdKgle8x7vli2BEMW9E1E1L4giRA11pdFU06OqdZl
	 WyauZ5knxF9Rw==
Date: Mon, 1 Jul 2024 11:17:47 -0600
From: Rob Herring <robh@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	lars@metafoo.de, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, lee@kernel.org, andy@kernel.org,
	nuno.sa@analog.com, bigunclemax@gmail.com, dlechner@baylibre.com,
	marius.cristea@microchip.com, marcelo.schmitt@analog.com,
	fr0st61te@gmail.com, mitrutzceclan@gmail.com,
	mike.looijmans@topic.nl, marcus.folkesson@gmail.com,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, andy.shevchenko@gmail.com,
	kernel@collabora.com
Subject: Re: [PATCH v2 1/5] dt-bindings: iio: adc: Add MediaTek MT6359 PMIC
 AUXADC
Message-ID: <20240701171747.GA133215-robh@kernel.org>
References: <20240604123008.327424-1-angelogioacchino.delregno@collabora.com>
 <20240604123008.327424-2-angelogioacchino.delregno@collabora.com>
 <20240605235239.GA3455504-robh@kernel.org>
 <e71a38a9-7a92-4156-a7f0-52f71d461d61@collabora.com>
 <20240617203314.641e84a9@jic23-huawei>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617203314.641e84a9@jic23-huawei>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_101751_922033_21CFF3CA 
X-CRM114-Status: GOOD (  28.49  )
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

On Mon, Jun 17, 2024 at 08:33:14PM +0100, Jonathan Cameron wrote:
> On Mon, 10 Jun 2024 10:00:55 +0200
> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:
> 
> > Il 06/06/24 01:52, Rob Herring ha scritto:
> > > On Tue, Jun 04, 2024 at 02:30:04PM +0200, AngeloGioacchino Del Regno wrote:  
> > >> Add a new binding for the MT6350 Series (MT6357/8/9) PMIC AUXADC,
> > >> providing various ADC channels for both internal temperatures and
> > >> voltages, audio accessory detection (hp/mic/hp+mic and buttons,
> > >> usually on a 3.5mm jack) other than some basic battery statistics
> > >> on boards where the battery is managed by this PMIC.
> > >>
> > >> Also add the necessary dt-binding headers for devicetree consumers.
> > >>
> > >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > >> ---
> > >>   .../iio/adc/mediatek,mt6359-auxadc.yaml       | 33 +++++++++++++++++++
> > >>   .../iio/adc/mediatek,mt6357-auxadc.h          | 21 ++++++++++++
> > >>   .../iio/adc/mediatek,mt6358-auxadc.h          | 22 +++++++++++++
> > >>   .../iio/adc/mediatek,mt6359-auxadc.h          | 22 +++++++++++++
> > >>   4 files changed, 98 insertions(+)
> > >>   create mode 100644 Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
> > >>   create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6357-auxadc.h
> > >>   create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6358-auxadc.h
> > >>   create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6359-auxadc.h
> > >>
> > >> diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
> > >> new file mode 100644
> > >> index 000000000000..6497c416094d
> > >> --- /dev/null
> > >> +++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
> > >> @@ -0,0 +1,33 @@
> > >> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > >> +%YAML 1.2
> > >> +---
> > >> +$id: http://devicetree.org/schemas/iio/adc/mediatek,mt6359-auxadc.yaml#
> > >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > >> +
> > >> +title: MediaTek MT6350 series PMIC AUXADC
> > >> +
> > >> +maintainers:
> > >> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > >> +
> > >> +description:
> > >> +  The Auxiliary Analog/Digital Converter (AUXADC) is an ADC found
> > >> +  in some MediaTek PMICs, performing various PMIC related measurements
> > >> +  such as battery and PMIC internal voltage regulators temperatures,
> > >> +  accessory detection resistance (usually, for a 3.5mm audio jack)
> > >> +  other than voltages for various PMIC internal components.
> > >> +
> > >> +properties:
> > >> +  compatible:
> > >> +    enum:
> > >> +      - mediatek,mt6357-auxadc
> > >> +      - mediatek,mt6358-auxadc
> > >> +      - mediatek,mt6359-auxadc
> > >> +
> > >> +  "#io-channel-cells":
> > >> +    const: 1  
> > > 
> > > Why do you need a node here? Just add #io-channel-cells to the parent
> > > node.
> > >   
> > 
> > Because some boards will want to avoid probing the related driver, as that will
> > trigger a reset and this may not play well with ECs (namely, some Chromebooks),
> > which are reading the same AUXADC block.
> > 
> > If I avoid using a new node, instead of just using `status`, I'll have to add a
> > "mediatek,disable-auxadc" property to the parent node, which isn't pretty...
> 
> Rob, does this answer the question to your satisfaction?
> 
> If you are fine with this I'd like to queue it up (with the typo in one of the
> patch descriptions that Andy caught fixed up).

Yes.

Reviewed-by: Rob Herring <robh@kernel.org>

