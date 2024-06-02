Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E93C27C44
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Jun 2024 09:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RxCGS0AQMl7JiqasuHlaS3vxe0yomaeIx29Y18/p89k=; b=pnETq+5OMK0Kv+L/CHjVqvwiGe
	UpBVMkJZPHuLsKlcaBrwAAb77T4QpuWL/Wnt+irSBab9svoY4oKi02e+okCKPTMsTNMFhPjPRyAxA
	fd6UU63yi91LKgP5T9eqTKOc8KK8nKcU8jq7SW8U4/jZuOUbUTKVrYOP1eED2RRZyL2LWonix/3KF
	vVWlZo3dVA+D6TsQu7Q7JuH2f1rf7hHYIbeXtVKvxt4BN3RQeC6EVG6WukVvbzJm0rFERvSX/TPGC
	OpCpup8rxPvgaGWxIXsYxGWztJptnQvkmN0XPMDp8AJJFE65VEHN3khfrjgyAyzoVqce4B+p1JySe
	dk4ptWvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDhi9-0000000E1d2-1Hnq;
	Sun, 02 Jun 2024 09:41:09 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDhi4-0000000E1cO-2iLh;
	Sun, 02 Jun 2024 09:41:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 62FF8CE09FB;
	Sun,  2 Jun 2024 09:41:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E2FBC2BBFC;
	Sun,  2 Jun 2024 09:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717321260;
	bh=VMlBozhDWH6kdWLkZ7dwGtTG1UnJSOHejuxNsB0HXYU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nVOXBDGpyyrv03WZHl6pg/rtQShiNtSOtbUdIYJ4Lmnw1W3r+kcF2AoSoGwN0FUWu
	 JVCO3glQhtHl7POXvKz/Z+nAUypc9dm+uLQgXOcoJ9yWE1Z6ResDlVR0XUEFndiwvc
	 Y6WHw9KV5gEFmsdY2rTE768qSRic65NB+7xwg7pC895Bm++9AM5RM6wbwNvTJwlPqD
	 6DBtf+0NQJXpohHncSRMy0O1MnO+tVaeJo4WV+dZLxwYmehbc9YI5asmPPpIH/UuoP
	 NDQnPxI0tLHp2e8x8BGX4meln+5lXRSQX43x4lmo2peQ1qwwx090tR3bUxO9+ZCSVk
	 LVwg8j3EaxMUg==
Date: Sun, 2 Jun 2024 10:40:48 +0100
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
Message-ID: <20240602104048.14c75d7b@jic23-huawei>
In-Reply-To: <20240530093410.112716-2-angelogioacchino.delregno@collabora.com>
References: <20240530093410.112716-1-angelogioacchino.delregno@collabora.com>
	<20240530093410.112716-2-angelogioacchino.delregno@collabora.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240602_024105_088804_4DE1C9BE 
X-CRM114-Status: GOOD (  18.99  )
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

On Thu, 30 May 2024 11:34:07 +0200
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:

> Add a new binding for the MT6350 Series (MT6357/8/9) PMIC AUXADC,
> providing various ADC channels for both internal temperatures and
> voltages, audio accessory detection (hp/mic/hp+mic and buttons,
> usually on a 3.5mm jack) other than some basic battery statistics
> on boards where the battery is managed by this PMIC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Hi,

What are all the headers for given the binding doc doesn't use anything from
them?

Jonathan

> ---
>  .../iio/adc/mediatek,mt6359-auxadc.yaml       | 43 +++++++++++++++++++
>  .../iio/adc/mediatek,mt6357-auxadc.h          | 21 +++++++++
>  .../iio/adc/mediatek,mt6358-auxadc.h          | 22 ++++++++++
>  .../iio/adc/mediatek,mt6359-auxadc.h          | 22 ++++++++++
>  4 files changed, 108 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
>  create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6357-auxadc.h
>  create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6358-auxadc.h
>  create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6359-auxadc.h
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
> new file mode 100644
> index 000000000000..dd6c331905cf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/mediatek,mt6359-auxadc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6350 series PMIC AUXADC
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +
> +description:
> +  The Auxiliary Analog/Digital Converter (AUXADC) is an ADC found
> +  in some MediaTek PMICs, performing various PMIC related measurements
> +  such as battery and PMIC internal voltage regulators temperatures,
> +  accessory detection resistance (usually, for a 3.5mm audio jack)
> +  other than voltages for various PMIC internal components.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt6357-auxadc
> +      - mediatek,mt6358-auxadc
> +      - mediatek,mt6359-auxadc
> +
> +  "#io-channel-cells":
> +    const: 1
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - "#io-channel-cells"
> +
> +examples:
> +  - |
> +    pmic {
> +        pmic_adc: adc {
> +            compatible = "mediatek,mt6359-auxadc";
> +            #io-channel-cells = <1>;
> +        };
> +    };
> +...
> diff --git a/include/dt-bindings/iio/adc/mediatek,mt6357-auxadc.h b/include/dt-bindings/iio/adc/mediatek,mt6357-auxadc.h
> new file mode 100644
> index 000000000000..03ebb1d23953
> --- /dev/null
> +++ b/include/dt-bindings/iio/adc/mediatek,mt6357-auxadc.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +
> +#ifndef _DT_BINDINGS_MEDIATEK_MT6357_AUXADC_H
> +#define _DT_BINDINGS_MEDIATEK_MT6357_AUXADC_H
> +
> +/* ADC Channel Index */
> +#define MT6357_AUXADC_BATADC		0
> +#define MT6357_AUXADC_ISENSE		1
> +#define MT6357_AUXADC_VCDT		2
> +#define MT6357_AUXADC_BAT_TEMP		3
> +#define MT6357_AUXADC_CHIP_TEMP		4
> +#define MT6357_AUXADC_ACCDET		5
> +#define MT6357_AUXADC_VDCXO		6
> +#define MT6357_AUXADC_TSX_TEMP		7
> +#define MT6357_AUXADC_HPOFS_CAL		8
> +#define MT6357_AUXADC_DCXO_TEMP		9
> +#define MT6357_AUXADC_VCORE_TEMP	10
> +#define MT6357_AUXADC_VPROC_TEMP	11
> +#define MT6357_AUXADC_VBAT		12
> +
> +#endif
> diff --git a/include/dt-bindings/iio/adc/mediatek,mt6358-auxadc.h b/include/dt-bindings/iio/adc/mediatek,mt6358-auxadc.h
> new file mode 100644
> index 000000000000..efa08398fafd
> --- /dev/null
> +++ b/include/dt-bindings/iio/adc/mediatek,mt6358-auxadc.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +
> +#ifndef _DT_BINDINGS_MEDIATEK_MT6358_AUXADC_H
> +#define _DT_BINDINGS_MEDIATEK_MT6358_AUXADC_H
> +
> +/* ADC Channel Index */
> +#define MT6358_AUXADC_BATADC		0
> +#define MT6358_AUXADC_VCDT		1
> +#define MT6358_AUXADC_BAT_TEMP		2
> +#define MT6358_AUXADC_CHIP_TEMP		3
> +#define MT6358_AUXADC_ACCDET		4
> +#define MT6358_AUXADC_VDCXO		5
> +#define MT6358_AUXADC_TSX_TEMP		6
> +#define MT6358_AUXADC_HPOFS_CAL		7
> +#define MT6358_AUXADC_DCXO_TEMP		8
> +#define MT6358_AUXADC_VBIF		9
> +#define MT6358_AUXADC_VCORE_TEMP	10
> +#define MT6358_AUXADC_VPROC_TEMP	11
> +#define MT6358_AUXADC_VGPU_TEMP		12
> +#define MT6358_AUXADC_VBAT		13
> +
> +#endif
> diff --git a/include/dt-bindings/iio/adc/mediatek,mt6359-auxadc.h b/include/dt-bindings/iio/adc/mediatek,mt6359-auxadc.h
> new file mode 100644
> index 000000000000..59826393ee7e
> --- /dev/null
> +++ b/include/dt-bindings/iio/adc/mediatek,mt6359-auxadc.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +
> +#ifndef _DT_BINDINGS_MEDIATEK_MT6359_AUXADC_H
> +#define _DT_BINDINGS_MEDIATEK_MT6359_AUXADC_H
> +
> +/* ADC Channel Index */
> +#define MT6359_AUXADC_BATADC		0
> +#define MT6359_AUXADC_BAT_TEMP		1
> +#define MT6359_AUXADC_CHIP_TEMP		2
> +#define MT6359_AUXADC_ACCDET		3
> +#define MT6359_AUXADC_VDCXO		4
> +#define MT6359_AUXADC_TSX_TEMP		5
> +#define MT6359_AUXADC_HPOFS_CAL		6
> +#define MT6359_AUXADC_DCXO_TEMP		7
> +#define MT6359_AUXADC_VBIF		8
> +#define MT6359_AUXADC_VCORE_TEMP	9
> +#define MT6359_AUXADC_VPROC_TEMP	10
> +#define MT6359_AUXADC_VGPU_TEMP		11
> +#define MT6359_AUXADC_VBAT		12
> +#define MT6359_AUXADC_IBAT		13
> +
> +#endif


