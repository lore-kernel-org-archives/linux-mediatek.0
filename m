Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A704C27C52
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jun 2024 19:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IdIh3OWwrk+RZ6LTvCmftOhmcWBGFDiOXReUB6vMUaA=; b=j8IHnzxaiNObB4b7cPG1rwOYCR
	Jok9U2qmW8LmjEEwqC+Ucc1FiYV6bvyeGvSP5f8IKEMfxoBB575J8O+HyqD5UYpGLMlf4xjFsTBiJ
	4rQZiTvNcfPZKW5R0Il75BCWKXDOZbWISO+5rEZe7CaNOJW4+x1nAAt92i+Pv6CRbWy6t2dLyuKTI
	5XPVPnO9itquSQDoBd9usItWr5ADMjr56wkmn8nNpHWSFWRhXlQZZyilUgPJZlblu0ZLzdrzvCYSw
	H4vqaNPbXxHAVQO9yevoZX/qyrAurSsfy4AU8rwqlz01LFX/89Bq9KfqpKLHhC32xgRwUD2m9z9jJ
	w+ltClXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFIz0-0000000B9lV-3gYG;
	Thu, 06 Jun 2024 19:41:10 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFIyw-0000000B9if-1OIn;
	Thu, 06 Jun 2024 19:41:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0CD46CE1C60;
	Thu,  6 Jun 2024 19:40:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA373C2BD10;
	Thu,  6 Jun 2024 19:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717702858;
	bh=P0QkZtgUQjhtRPh66yB0oPQQs0jzQOCepM5SRTacekk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CspXD7QM7muSZaL7Q8b+IpA1ZXtUVeIhByTgUYvrCEis25tcxWvcSiWabz/0zmdKL
	 tz40yXgBvVzRt0/bLIb0ia6Pv3BBRBh5LvFbKEwKhsm9eAa1IQ00KHLgkSfPZE4lx0
	 +T1aDHd4bJUl7v5kS0kVd/XxvY7gRNZuNBkOtrvgdl1LI8mrZVICCi6S4fu2qiJ00d
	 a68/P204rh8+MAoTzDFFs/CEmqBQ6gBbfI51xGD3yia8i75FbFi/9FUvRKgiK79tKW
	 OAJwroFeDZtdH4XeccSqXxXUpxvAxr0fQ4xq+U+UfP3f+7+XvN9T4LYxZHDkPCYfN7
	 XO+Gwo5BmBYzQ==
Date: Thu, 6 Jun 2024 20:40:48 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lars@metafoo.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, lee@kernel.org,
 andy@kernel.org, nuno.sa@analog.com, bigunclemax@gmail.com,
 dlechner@baylibre.com, marius.cristea@microchip.com,
 marcelo.schmitt@analog.com, fr0st61te@gmail.com, mitrutzceclan@gmail.com,
 mike.looijmans@topic.nl, marcus.folkesson@gmail.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v1 1/4] dt-bindings: iio: adc: Add MediaTek MT6359 PMIC
 AUXADC
Message-ID: <20240606204048.2e06d995@jic23-huawei>
In-Reply-To: <3d364430-96c7-4f9f-98e7-e68b1e57f69e@collabora.com>
References: <20240530093410.112716-1-angelogioacchino.delregno@collabora.com>
	<20240530093410.112716-2-angelogioacchino.delregno@collabora.com>
	<20240602104048.14c75d7b@jic23-huawei>
	<3d364430-96c7-4f9f-98e7-e68b1e57f69e@collabora.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_124106_765901_76DB8874 
X-CRM114-Status: GOOD (  26.42  )
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

On Tue, 4 Jun 2024 11:04:25 +0200
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:

> Il 02/06/24 11:40, Jonathan Cameron ha scritto:
> > On Thu, 30 May 2024 11:34:07 +0200
> > AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:
> >   
> >> Add a new binding for the MT6350 Series (MT6357/8/9) PMIC AUXADC,
> >> providing various ADC channels for both internal temperatures and
> >> voltages, audio accessory detection (hp/mic/hp+mic and buttons,
> >> usually on a 3.5mm jack) other than some basic battery statistics
> >> on boards where the battery is managed by this PMIC.
> >>
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>  
> > Hi,
> > 
> > What are all the headers for given the binding doc doesn't use anything from
> > them?
> >   
> 
> The binding document doesn't use them, yes, but those are part of the devicetree
> binding itself, as those can be used by devicetrees to reference an ADC channel
> like <&pmic_adc MT6359_AUXADC_ACCDET>.
> 
> I think growing the binding example to add an "external" node using one of those
> channels is irrelevant, as that is "outside" of the description of the AUXADC HW.

Add a note on that to the patch description and that is fine.

J
> 
> Cheers,
> Angelo
> 
> > Jonathan
> >   
> >> ---
> >>   .../iio/adc/mediatek,mt6359-auxadc.yaml       | 43 +++++++++++++++++++
> >>   .../iio/adc/mediatek,mt6357-auxadc.h          | 21 +++++++++
> >>   .../iio/adc/mediatek,mt6358-auxadc.h          | 22 ++++++++++
> >>   .../iio/adc/mediatek,mt6359-auxadc.h          | 22 ++++++++++
> >>   4 files changed, 108 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
> >>   create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6357-auxadc.h
> >>   create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6358-auxadc.h
> >>   create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6359-auxadc.h
> >>
> >> diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
> >> new file mode 100644
> >> index 000000000000..dd6c331905cf
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
> >> @@ -0,0 +1,43 @@
> >> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/iio/adc/mediatek,mt6359-auxadc.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: MediaTek MT6350 series PMIC AUXADC
> >> +
> >> +maintainers:
> >> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >> +
> >> +description:
> >> +  The Auxiliary Analog/Digital Converter (AUXADC) is an ADC found
> >> +  in some MediaTek PMICs, performing various PMIC related measurements
> >> +  such as battery and PMIC internal voltage regulators temperatures,
> >> +  accessory detection resistance (usually, for a 3.5mm audio jack)
> >> +  other than voltages for various PMIC internal components.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    enum:
> >> +      - mediatek,mt6357-auxadc
> >> +      - mediatek,mt6358-auxadc
> >> +      - mediatek,mt6359-auxadc
> >> +
> >> +  "#io-channel-cells":
> >> +    const: 1
> >> +
> >> +additionalProperties: false
> >> +
> >> +required:
> >> +  - compatible
> >> +  - "#io-channel-cells"
> >> +
> >> +examples:
> >> +  - |
> >> +    pmic {
> >> +        pmic_adc: adc {
> >> +            compatible = "mediatek,mt6359-auxadc";
> >> +            #io-channel-cells = <1>;
> >> +        };
> >> +    };
> >> +...
> >> diff --git a/include/dt-bindings/iio/adc/mediatek,mt6357-auxadc.h b/include/dt-bindings/iio/adc/mediatek,mt6357-auxadc.h
> >> new file mode 100644
> >> index 000000000000..03ebb1d23953
> >> --- /dev/null
> >> +++ b/include/dt-bindings/iio/adc/mediatek,mt6357-auxadc.h
> >> @@ -0,0 +1,21 @@
> >> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> >> +
> >> +#ifndef _DT_BINDINGS_MEDIATEK_MT6357_AUXADC_H
> >> +#define _DT_BINDINGS_MEDIATEK_MT6357_AUXADC_H
> >> +
> >> +/* ADC Channel Index */
> >> +#define MT6357_AUXADC_BATADC		0
> >> +#define MT6357_AUXADC_ISENSE		1
> >> +#define MT6357_AUXADC_VCDT		2
> >> +#define MT6357_AUXADC_BAT_TEMP		3
> >> +#define MT6357_AUXADC_CHIP_TEMP		4
> >> +#define MT6357_AUXADC_ACCDET		5
> >> +#define MT6357_AUXADC_VDCXO		6
> >> +#define MT6357_AUXADC_TSX_TEMP		7
> >> +#define MT6357_AUXADC_HPOFS_CAL		8
> >> +#define MT6357_AUXADC_DCXO_TEMP		9
> >> +#define MT6357_AUXADC_VCORE_TEMP	10
> >> +#define MT6357_AUXADC_VPROC_TEMP	11
> >> +#define MT6357_AUXADC_VBAT		12
> >> +
> >> +#endif
> >> diff --git a/include/dt-bindings/iio/adc/mediatek,mt6358-auxadc.h b/include/dt-bindings/iio/adc/mediatek,mt6358-auxadc.h
> >> new file mode 100644
> >> index 000000000000..efa08398fafd
> >> --- /dev/null
> >> +++ b/include/dt-bindings/iio/adc/mediatek,mt6358-auxadc.h
> >> @@ -0,0 +1,22 @@
> >> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> >> +
> >> +#ifndef _DT_BINDINGS_MEDIATEK_MT6358_AUXADC_H
> >> +#define _DT_BINDINGS_MEDIATEK_MT6358_AUXADC_H
> >> +
> >> +/* ADC Channel Index */
> >> +#define MT6358_AUXADC_BATADC		0
> >> +#define MT6358_AUXADC_VCDT		1
> >> +#define MT6358_AUXADC_BAT_TEMP		2
> >> +#define MT6358_AUXADC_CHIP_TEMP		3
> >> +#define MT6358_AUXADC_ACCDET		4
> >> +#define MT6358_AUXADC_VDCXO		5
> >> +#define MT6358_AUXADC_TSX_TEMP		6
> >> +#define MT6358_AUXADC_HPOFS_CAL		7
> >> +#define MT6358_AUXADC_DCXO_TEMP		8
> >> +#define MT6358_AUXADC_VBIF		9
> >> +#define MT6358_AUXADC_VCORE_TEMP	10
> >> +#define MT6358_AUXADC_VPROC_TEMP	11
> >> +#define MT6358_AUXADC_VGPU_TEMP		12
> >> +#define MT6358_AUXADC_VBAT		13
> >> +
> >> +#endif
> >> diff --git a/include/dt-bindings/iio/adc/mediatek,mt6359-auxadc.h b/include/dt-bindings/iio/adc/mediatek,mt6359-auxadc.h
> >> new file mode 100644
> >> index 000000000000..59826393ee7e
> >> --- /dev/null
> >> +++ b/include/dt-bindings/iio/adc/mediatek,mt6359-auxadc.h
> >> @@ -0,0 +1,22 @@
> >> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> >> +
> >> +#ifndef _DT_BINDINGS_MEDIATEK_MT6359_AUXADC_H
> >> +#define _DT_BINDINGS_MEDIATEK_MT6359_AUXADC_H
> >> +
> >> +/* ADC Channel Index */
> >> +#define MT6359_AUXADC_BATADC		0
> >> +#define MT6359_AUXADC_BAT_TEMP		1
> >> +#define MT6359_AUXADC_CHIP_TEMP		2
> >> +#define MT6359_AUXADC_ACCDET		3
> >> +#define MT6359_AUXADC_VDCXO		4
> >> +#define MT6359_AUXADC_TSX_TEMP		5
> >> +#define MT6359_AUXADC_HPOFS_CAL		6
> >> +#define MT6359_AUXADC_DCXO_TEMP		7
> >> +#define MT6359_AUXADC_VBIF		8
> >> +#define MT6359_AUXADC_VCORE_TEMP	9
> >> +#define MT6359_AUXADC_VPROC_TEMP	10
> >> +#define MT6359_AUXADC_VGPU_TEMP		11
> >> +#define MT6359_AUXADC_VBAT		12
> >> +#define MT6359_AUXADC_IBAT		13
> >> +
> >> +#endif  
> >   
> 


