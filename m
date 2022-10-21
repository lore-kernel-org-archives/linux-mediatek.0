Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F048BC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 01:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ecocDdlY9HD0dckWSi58lakyiwrmabIaEHlrxIT6WH0=; b=Zej9XWxjtSK70eNN7O9My15bFg
	fkddBDhluGQO4eieVdprpqETfwD3Q47W0ruyjX+ITNsDywCed0kBuYGBIKqBscj5ESf+a4Zd+eUt2
	E1O2bgDARqU6prIs4EvpT3HVuUhcz2kzKwjHnyI/S9OSXlvlF6sav1gCbGG7C272cBa1RLzsRxB09
	ukpA7FbgXARKZmKT3JVDcQCoKUi2LlrabNDtGjI2kUX0DeYICbnSvpwC9l8GofKT6bcbfYtSkQsVO
	xmntVFNU4KdjscYHleWS5Dz4lm1lAdFdSmpex4r7lcFsU0TlvgkR4QThFnQxk+P13iyaXpYPHxnpr
	QdrxIGEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olgTN-003Ne3-TZ; Fri, 21 Oct 2022 01:05:17 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olgTK-003NYD-AC; Fri, 21 Oct 2022 01:05:15 +0000
Received: by mail-ot1-f44.google.com with SMTP id p24-20020a9d6958000000b00661c528849eso911954oto.9;
        Thu, 20 Oct 2022 18:05:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecocDdlY9HD0dckWSi58lakyiwrmabIaEHlrxIT6WH0=;
        b=V1GBufX1cSgbTZ5Qj3UyeP+Gj3o1EXPPlD8g8YGdvdZkJ0/Fw2RxBLtaHW6ghmQrRG
         3v84LE/GYkA57ZuLXm727/50c/+LUJhAzB2nNdCU6LY04sHjKu1+R7m0aoeVIjxqO/6r
         6UL/mkk4oHkEhjDkT+ra1L2PFiv2f305ZyPD77NP6yFe0GFP8Tr6zSK6xS9naR8wYeEI
         ZOCcRVtaqdnKd+frqHMt83oMsLRRt/CTiDF9HKXNGgrO8n9seiE65YpDsRWVMjBIfO3f
         ADs7z/18Kj3hCuO4jmtA3JRo5SZcYaKCNcTQ7zYqRE9QKHhKGG6yCsHGmdO5vpSyPBsU
         Ukbg==
X-Gm-Message-State: ACrzQf3LUXDtp/+PxCIZ15QKeMDSP+/MQk0WR89VC3OQedlFCbLFxpGI
	if975AY0GvS0Ib6ONYURVg==
X-Google-Smtp-Source: AMsMyM6tI/gHEPMEf2U2laKjn7zNaO032RwU8qbztdEvs2i2nyjTJbwEI06MkMtaR9Ee3w9ADVSNZg==
X-Received: by 2002:a05:6830:1644:b0:661:8b9f:16c3 with SMTP id h4-20020a056830164400b006618b9f16c3mr8477769otr.235.1666314311664;
        Thu, 20 Oct 2022 18:05:11 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s64-20020acaa943000000b00353fe4fb4casm550566oie.48.2022.10.20.18.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 18:05:11 -0700 (PDT)
Received: (nullmailer pid 2100343 invoked by uid 1000);
	Fri, 21 Oct 2022 01:05:12 -0000
Date: Thu, 20 Oct 2022 20:05:12 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, Chen Zhong <chen.zhong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Fabien Parent <fabien.parent@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>, devicetree@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v3 3/5] dt-bindings: regulator: Add binding schema for
 mt6357 regulators
Message-ID: <20221021010512.GA1974104-robh@kernel.org>
References: <20221005-mt6357-support-v3-0-7e0bd7c315b2@baylibre.com>
 <20221005-mt6357-support-v3-3-7e0bd7c315b2@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005-mt6357-support-v3-3-7e0bd7c315b2@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_180514_376728_E441592E 
X-CRM114-Status: GOOD (  19.67  )
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

On Thu, Oct 20, 2022 at 06:20:47PM +0200, Alexandre Mergnat wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add YAML schema for the MediaTek MT6357 regulators.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  .../regulator/mediatek,mt6357-regulator.yaml       | 292 +++++++++++++++++++++
>  1 file changed, 292 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml
> new file mode 100644
> index 000000000000..8dc1245304be
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml
> @@ -0,0 +1,292 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6357-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6357 Regulators
> +
> +maintainers:
> +  - Fabien Parent <fabien.parent@linaro.org>
> +  - Alexandre Mergnat <amergnat@baylibre.com>
> +
> +description: |
> +  The MT6357 PMIC provides 5 BUCK and 29 LDO.
> +  Regulators and nodes are named according to the regulator type:
> +  buck-<name> and ldo-<name>.
> +  MT6357 regulators node should be sub node of the MT6397 MFD node.
> +
> +patternProperties:
> +  "^buck-v(core|modem|pa|proc|s1)$":
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +    description:
> +      Properties for single BUCK regulator.
> +
> +    required:
> +      - regulator-name
> +      - regulator-min-microvolt
> +      - regulator-max-microvolt
> +
> +  "^ldo-v(aud28|aux18|cama|camd|cn18|cn28|cn33-bt|cn33-wifi|dram)$":
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +    description:
> +      Properties for single LDO regulator.
> +
> +    required:
> +      - regulator-name
> +      - regulator-min-microvolt
> +      - regulator-max-microvolt
> +
> +  "^ldo-v(efuse|emc|ibr|io18|io28|ldo28|mch|rf12|rf18)$":

vf12 and rf18 are covered by regulator-fixed binding.



> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +    description:
> +      Properties for single LDO regulator.
> +
> +    required:
> +      - regulator-name
> +      - regulator-min-microvolt
> +      - regulator-max-microvolt
> +
> +  "^ldo-v(xo22|sim1,sim2|sram-others|sram-proc|usb33|xo22)$":
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +    description:
> +      Properties for single LDO regulator.
> +
> +    required:
> +      - regulator-name
> +      - regulator-min-microvolt
> +      - regulator-max-microvolt
> +
> +additionalProperties: false

vfe28 is not listed, and this would cause an error if the schema was 
applied, but it is not as Krzysztof pointed out.


The MFD binding really needs to be converted so it can reference this 
schema. Otherwise, when it is, then all the issues have to be fixed.

Rob

