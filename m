Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBF5CEE351
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 21:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zyQGwFRGuZBcGFfZDAjfr9avYs4H7lw0jA2Eg8Htifc=; b=xLlRYS6wskZzDXN3+q884UHkCr
	Xg016WBsh7A3m0m4owqXzTnGHFDQ/pulNg4sJ1Z/KnQCscUOQivQgI6zQrMXtjR1tNwENrI12wwhF
	47fvBV46Ej4JmfECjQDdUJVEADra/l+KCeYRPhMPrOr3eWVqOHCoowApsVVrfWIpF7RWTZwJ6T0py
	qXp8FedHIEeI+/2VUeSApk7aDVoHVGYuBT6wbUS536D6+s8zgEuaqPzCe7prL2MVLDIzwqRrwyKK5
	pxL0C6zx5KRHFVcBV/LWOtf3aC99qbRsIaKVy6FszaQ8ADl45DnZuCx7WSQ/Jg7MaDt8NMO8xYoBa
	1fsZ53tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sye2Q-0000000AkRr-2514;
	Wed, 09 Oct 2024 21:16:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sycgM-0000000AXEZ-2Fcx;
	Wed, 09 Oct 2024 19:49:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E6D625C5CDF;
	Wed,  9 Oct 2024 19:49:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A52BC4CEC3;
	Wed,  9 Oct 2024 19:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728503352;
	bh=C1NpSIwyabYuPOgSxRtFpJJ+JGk1iE4Uf4o/+dftn4U=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=iUco/PJ0EvyCK95r884GLz5452WgNbDLEaiZHE338NnjcNkuXgb00c/5wIRO7/0zZ
	 0xMTbCI7amCfzMPcCeXtHvOOM+cv3zdp6gh0SBSHWGwRKElVMXxAQW6iVBR17eqOG9
	 rXwuDk4Ec0K5r4rXWm1prPtrq+UVVFpCBRVSjo4BzwKjKuPsm16jDI7RVYzzz/qUUs
	 iCK8BgheyblKxeDpsB03mszQ2JACq0u6FA9VhwCyi2/bIXbvKuXyDn4qNTTgU9wGlJ
	 u7VjwRCr55RbbouFol1rJTNJZnUtS+HWXAN7V4Kf01s9jPV2o6OnskggJtSFV9Zzg6
	 Llj4/phkn6ZLg==
Date: Wed, 09 Oct 2024 14:49:11 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
In-Reply-To: <20241009165547.5959-2-linux@fw-web.de>
References: <20241009165547.5959-1-linux@fw-web.de>
 <20241009165547.5959-2-linux@fw-web.de>
Message-Id: <172850335071.570182.9793183065235967586.robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: mmc: mtk-sd: Add mt7988 SoC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_124914_691371_698FB5A0 
X-CRM114-Status: GOOD (  12.40  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org, daniel@makrotopia.org, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Chaotian Jing <chaotian.jing@mediatek.com>, john@phrozen.org, eladwf@gmail.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, ansuelsmth@gmail.com, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Wed, 09 Oct 2024 18:55:41 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add binding definitions for mmc on MT7988 SoC.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v3:
> - fixed minItems on clock-names too
> v2:
> - fixed minItems to 4
> ---
>  .../devicetree/bindings/mmc/mtk-sd.yaml       | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mmc/mtk-sd.yaml: allOf:5:then:properties:clocks: 'oneOf' conditional failed, one must be fixed:
	[{'description': 'source clock'}, {'description': 'HCLK which used for host'}, {'description': 'Advanced eXtensible Interface'}, {'description': 'Advanced High-performance Bus clock'}] is too long
	[{'description': 'source clock'}, {'description': 'HCLK which used for host'}, {'description': 'Advanced eXtensible Interface'}, {'description': 'Advanced High-performance Bus clock'}] is too short
	False schema does not allow 4
	1 was expected
	4 is greater than the maximum of 2
	4 is greater than the maximum of 3
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mmc/mtk-sd.yaml: allOf:5:then:properties:clock-names: 'oneOf' conditional failed, one must be fixed:
	[{'const': 'source'}, {'const': 'hclk'}, {'const': 'axi_cg'}, {'const': 'ahb_cg'}] is too long
	[{'const': 'source'}, {'const': 'hclk'}, {'const': 'axi_cg'}, {'const': 'ahb_cg'}] is too short
	False schema does not allow 4
	1 was expected
	4 is greater than the maximum of 2
	4 is greater than the maximum of 3
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241009165547.5959-2-linux@fw-web.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


