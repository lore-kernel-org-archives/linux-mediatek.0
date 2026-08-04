Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AECCC55184
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2026 18:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A9vLb3qBKhiB+XAO8QaHVpvoUO2rQtkOyTAA7HizyS4=; b=dSL8+S3+0aHGNwGpYhoHI0bIwO
	woL7Et4rV/3RL4YBWc7iToXcONYdEWTDEpZN/erZdhuzOu4EhUQUi/RhPLq0CMRWL4a7/4U+py8NX
	Q4Zc8ALnm7VOaADayZDxW3gjhGPX5WG7tVHYDHMFMbAhHaLgoh67t+DStMcR1B3GlAVHDpkZ13mwR
	XBdFIrF3Z6NWVyIsCOMJCtgcMRvWFMJacsJo79Q8cOoH/YEUyCST793Ry47PesvMEXqb4wG/uzDsx
	aU9LSQLZaOABSSH+W0QkrscRzPndbxQDSYlYl4CnT2xQyCXNrPhz3LBI8nyExrGy5K9Ymp7DatMIR
	O8vKJMaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJjP-00000002bGr-14K1;
	Tue, 04 Aug 2026 18:19:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJjN-00000002bGF-2t5D
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Aug 2026 18:19:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 635AE423CE;
	Tue,  4 Aug 2026 18:19:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25E571F000E9;
	Tue,  4 Aug 2026 18:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785867553;
	bh=A9vLb3qBKhiB+XAO8QaHVpvoUO2rQtkOyTAA7HizyS4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=hIdyKCk889GcbC+2fVuxQpIA1Xe33DyxhXN7qOiOJW8sXQy5IfR7KjyF4f6NZrvYG
	 0Tw7Ltqy2WhlLDpYkOn24mU452dj8aHiHuewPdqubUq6g7VX30Dx7YtQ1lP4DKaGL2
	 IWJWPjswbdFjbkBKGPZLX810a8IE0Zdh83nGNZgjX4UsP9PyPYfzQ0FMoW9niunVd3
	 u3Zg0PHp+aX7YW/YCmj+AbXzvg2Dtzvy169Uqyjsub93aRbky3skjyvcehNIUOlfo+
	 R/tiRqwgdKLLVJxY8XfhyoYLZs/BRCOPCq3sFJKpXm1ROlvKV8h0CHxjmgUkUPMezr
	 j8OlCj0kWannA==
Date: Tue, 04 Aug 2026 13:19:12 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-mediatek@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 Markus Gothe <markus.gothe@genexis.eu>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Matheus Sampaio Queiroga <srherobrine20@gmail.com>, 
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
In-Reply-To: <20260804160419.3592327-35-mikhail.kshevetskiy@iopsys.eu>
References: <20260804160419.3592327-1-mikhail.kshevetskiy@iopsys.eu>
 <20260804160419.3592327-35-mikhail.kshevetskiy@iopsys.eu>
Message-Id: <178586755049.1262514.15920447848565154981.robh@kernel.org>
Subject: Re: [PATCH v9 34/36] dt-bindings: pinctrl: airoha: add support of
 en7523 pin controller
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


On Tue, 04 Aug 2026 19:04:17 +0300, Mikhail Kshevetskiy wrote:
> This patch adds device tree binding schema for Airoha EN7523 SoC pin
> controller.
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  .../pinctrl/airoha,en7523-pinctrl.yaml        | 379 ++++++++++++++++++
>  1 file changed, 379 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml:28:3: [error] duplication of key "gpio-ranges" in mapping (key-duplicates)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml: error loading YAML: while constructing a mapping
  in "./Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml", line 16, column 3
found duplicate key "gpio-ranges" with value "{'maxItems': 1}" (original value: "True")
  in "./Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml", line 28, column 3

To suppress this check see:
    https://yaml.dev/doc/ruamel.yaml/api/#Duplicate_keys

./Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml:28:3: found duplicate key "gpio-ranges" with value "{}" (original value: "True")
make[2]: *** Deleting file 'Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.example.dts'
Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml:28:3: found duplicate key "gpio-ranges" with value "{}" (original value: "True")
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1703: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260804160419.3592327-35-mikhail.kshevetskiy@iopsys.eu

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


