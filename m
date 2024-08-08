Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F56C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Aug 2024 12:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y9U7hc3HWOjBtSeo2Yo2dy3Ka3e7IadtwKYF+f72BIc=; b=Gol0Qbr+9723MZ6O1WWFZlpiJa
	0pqalSIPAtB5AjpYcYYD16WjqmigHsfL82fwpcsWUWSk0ZCqA++3WorzOHAlTNUw5BE4i0rlF4CNn
	BdpRqzjUFQ8qH+WcxXkc4ORc0QKvZahYHhv1TjXVr3xhxvB4T40FI9zG5wZOXoGpc1kuESRFnxyC4
	u701SOkrnPKlkKn68WO9YcBeg/egfI5U1D9pIY7oD7E0oZu1103PEv816ZHjFVH5YYxSjnjckohve
	kgt8WO0vtGoK6l+L7TlByPb1wsNexMK4yWE2dv/kCBCmR/c6GpHsHKKRweO2dLkce3kp2dLou+aOs
	YGpxOuZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc24k-00000008BGk-26dB;
	Thu, 08 Aug 2024 12:17:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc247-00000008BAS-1ph5;
	Thu, 08 Aug 2024 12:16:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8808D615BE;
	Thu,  8 Aug 2024 12:16:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BADAC32782;
	Thu,  8 Aug 2024 12:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723119382;
	bh=9gyaJEUMUMSe2uDu+d3QbguiaZOSU0iKh7jcahtV+uU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=gBtAruPebUYpBpqupwKxeMEth5wWYn8LnIPQtOqxxmHTS6wWuWBE7QCFTlsCHAl4J
	 515HgoAWOY7jlwF5Ll2iVdnbaNMhFVwgmQhjFl/Kts1fKfe4liC+uvw9FDKmrAJ2DR
	 QICteE7YmxXmEx+GUU67hPkJtCjnB9oSJcrO3hrd7sr3+JmMeqnZe4vM8q3CQ1GYQk
	 FrDa94zs6v48LbCfQCImbK1RqbZwv8lMo8zMZaOZKKa7raJqlURlOTfhpeXtyq/BVX
	 8NyQ5YMwr9dtPLQ878HOZOh88bmycX92LRIvYorOxrgu+wKydmmkVBfHy4t5QWKutN
	 wrzDkLsmUyIiw==
Date: Thu, 08 Aug 2024 06:16:21 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Sen Chu <sen.chu@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chris-qj chen <chris-qj.chen@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Macpaul Lin <macpaul@gmail.com>, 
 MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, devicetree@vger.kernel.org, 
 Jason-ch Chen <Jason-ch.Chen@mediatek.com>, 
 Bear Wang <bear.wang@mediatek.com>, Conor Dooley <conor+dt@kernel.org>, 
 Pablo Sun <pablo.sun@mediatek.com>
In-Reply-To: <20240808105722.7222-1-macpaul.lin@mediatek.com>
References: <20240808105722.7222-1-macpaul.lin@mediatek.com>
Message-Id: <172311938097.907347.11999674320636548730.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: mfd: mediatek: mt6397: Convert to DT
 schema format
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_051626_184083_7C6E8FA6 
X-CRM114-Status: GOOD (  15.19  )
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


On Thu, 08 Aug 2024 18:57:22 +0800, Macpaul Lin wrote:
> Convert the mfd: mediatek: mt6397 binding to DT schema format.
> 
> New updates in this conversion:
>  - Align generic names of DT schema "audio-codec" and "regulators".
>  - mt6397-regulators: Replace the "txt" reference with newly added DT
>    schema.
> 
> Signed-off-by: Sen Chu <sen.chu@mediatek.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  .../bindings/mfd/mediatek,mt6397.yaml         | 202 ++++++++++++++++++
>  .../devicetree/bindings/mfd/mt6397.txt        | 110 ----------
>  2 files changed, 202 insertions(+), 110 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mfd/mt6397.txt
> 
> Changes for v1:
>  - This patch depends on conversion of mediatek,mt6397-regulator.yaml
>    [1] https://lore.kernel.org/lkml/20240807091738.18387-1-macpaul.lin@mediatek.com/T/
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6397.example.dtb: pmic: regulators: 'oneOf' conditional failed, one must be fixed:
	'buck_vpca15', 'ldo_vgp4' do not match any of the regexes: '^(buck_)?v(core|dram1|gpu|modem|pa|proc1[12]|s[12])$', '^(ldo_)?v((aux|cn|io|rf)18|camio)$', '^(ldo_)?v(aud|bif|cn|fe|io)28$', '^(ldo_)?v(a|rf)12$', '^(ldo_)?v(cama[12]|camd|cn33|dram2|efuse|emc|ibr|ldo28|m18|mc|mch|mddr|sim[12])$', '^(ldo_)?vsram[_-](core|gpu|others|proc1[12])$', '^(ldo_)?vusb$', '^(ldo_)?vxo22$', 'pinctrl-[0-9]+'
	False schema does not allow {'compatible': ['mediatek,mt6397-regulator'], 'buck_vpca15': {'regulator-name': ['vpca15'], 'regulator-min-microvolt': [[850000]], 'regulator-max-microvolt': [[1400000]], 'regulator-ramp-delay': 12500, 'regulator-always-on': True}, 'ldo_vgp4': {'regulator-name': ['vgp4'], 'regulator-min-microvolt': [[1200000]], 'regulator-max-microvolt': [[3300000]], 'regulator-enable-ramp-delay': 218}}
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6397.example.dtb: pmic: regulators:compatible: 'oneOf' conditional failed, one must be fixed:
		['mediatek,mt6397-regulator'] is too short
		'mediatek,mt6358-regulator' was expected
		'mediatek,mt6366-regulator' was expected
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6397.example.dtb: pmic: regulators: Unevaluated properties are not allowed ('buck_vpca15', 'ldo_vgp4' were unexpected)
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#

doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/mt6397.txt
Warning: Documentation/devicetree/bindings/leds/leds-mt6323.txt references a file that doesn't exist: Documentation/devicetree/bindings/mfd/mt6397.txt
Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml: Documentation/devicetree/bindings/mfd/mt6397.txt
Documentation/devicetree/bindings/leds/leds-mt6323.txt: Documentation/devicetree/bindings/mfd/mt6397.txt

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240808105722.7222-1-macpaul.lin@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


