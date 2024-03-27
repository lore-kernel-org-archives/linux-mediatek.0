Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444E3C47DD9
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Mar 2024 09:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oB7UTjU+JNYBvQTBKyLSnfhcxVEQJ+c3z986qfvPm2g=; b=P9N/1mAs6AEZtG3uzxHlmzzER1
	+N0pyvgsgjrhUKtKeHb8d/+uH3m5BzIbokU05Ata+uH/XE2mxAwTxe9o7phJ1DSMS/GNtd/jI/pBq
	QsYhR/bxor0sFZ0BiiTAob0FGpVGXOG0LeurGMM1+OqGyF6CRgdRKy4amyqt3Z/5AGeRgyF8DePU+
	o3MmiiRDefn2BjHBlC679JvLCJPqGYTL3YB1AX+Y4bOX2VXT2F5vYiDeN5OJoDzl1iyyg3qCSXMQL
	gbtldaqg+S9AEfSjfqP0abWNQYIauVW5f/YkY07wMy687zA319z31XdOt/sb0qaZwIWCNZSPl0/cB
	x4ad9+DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpPAV-000000088zP-1l78;
	Wed, 27 Mar 2024 09:01:59 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpPAO-000000088wf-1Q3E;
	Wed, 27 Mar 2024 09:01:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1DA80CE25AD;
	Wed, 27 Mar 2024 09:01:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2981BC43390;
	Wed, 27 Mar 2024 09:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711530108;
	bh=lyIEGaS1jPdeUhemduBEQ1WVoVPKb/fAHOq4AFGqAlY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=VahVV8sPUT8wuLtiT+/FuwYXJASdefezzd/GOLaob/zAnNobMN2Z+yBBon0KF0kog
	 WOqTFmPtX/3HWDyyP+CcaTxRqv6getFWAvw4kjgxYFdsnjHGHgqBpyHf04aACOWIZa
	 xrquFEwTS0eY2PlhGhceKPg6I5XG0Gnz1vuu0Q5v3jCOicg/NM6fUZZ1iSojhvkdi7
	 bgIWXlPXNA6gdiR7qV7VjH4uSppKPKWdp6WVYCvZKClNEB+PPS7TX7ARg0VE2z40UH
	 ZBzdjwfjOyN+rkOqqV4+4iKP8GGIrW7oBijefo/rq+1sPJvak59EmPfgcwvo0f9aYP
	 l0HgDlG+ODwFg==
Date: Wed, 27 Mar 2024 04:01:47 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: "yu-chang.lee" <yu-chang.lee@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
 MandyJH Liu <mandyjh.liu@mediatek.com>, xiufeng.li@mediatek.com, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-mediatek@lists.infradead.org, Ulf Hansson <ulf.hansson@linaro.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, fan.chen@mediatek.com, 
 linux-pm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <20240327055732.28198-3-yu-chang.lee@mediatek.com>
References: <20240327055732.28198-1-yu-chang.lee@mediatek.com>
 <20240327055732.28198-3-yu-chang.lee@mediatek.com>
Message-Id: <171153010608.1499881.4707871183250112406.robh@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: power: Add mediatek larb
 definition
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_020152_776766_56AEDC5E 
X-CRM114-Status: GOOD (  11.88  )
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


On Wed, 27 Mar 2024 13:57:31 +0800, yu-chang.lee wrote:
> Add Smart Multimedia Interface Local Arbiter to mediatek
> power domain.
> 
> Signed-off-by: yu-chang.lee <yu-chang.lee@mediatek.com>
> ---
>  .../devicetree/bindings/power/mediatek,power-controller.yaml  | 4 ++++
>  1 file changed, 4 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/power/mediatek,power-controller.yaml:128:6: [error] syntax error: expected <block end>, but found '<block mapping start>' (syntax)
./Documentation/devicetree/bindings/power/mediatek,power-controller.yaml:129:9: [warning] wrong indentation: expected 7 but found 8 (indentation)

dtschema/dtc warnings/errors:
make[2]: *** Deleting file 'Documentation/devicetree/bindings/power/mediatek,power-controller.example.dts'
Documentation/devicetree/bindings/power/mediatek,power-controller.yaml:128:6: did not find expected key
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/power/mediatek,power-controller.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml:
while parsing a block mapping
  in "<unicode string>", line 64, column 5
did not find expected key
  in "<unicode string>", line 128, column 6
./Documentation/devicetree/bindings/power/mediatek,power-controller.yaml:128:6: did not find expected key
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml: ignoring, error parsing file
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1430: dt_binding_check] Error 2
make: *** [Makefile:240: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240327055732.28198-3-yu-chang.lee@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


