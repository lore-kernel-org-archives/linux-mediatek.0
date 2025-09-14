Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E927CA0EE8
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Sep 2025 21:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frEB1stw5N7XnViY1459uXBp+ytNJah/GP226JlkULM=; b=Q1uJGYXbeAYHe4ZFxEwR0cN5eQ
	MxOEkaEwWS11S9xg5O4XJD0nBj21YnlrZcl/XrEQnaLtMcBexlMkkwVfBY4wfG98Kuhx2R65xG0nm
	c5f1DJAF7gAh94JFswL0MVKBFV8zftnmGxbSrF42ztGi9SWYOUyDASbM+qR5b/741boDrsCe+CvcY
	v+tpfbegN1H6/VY5kbF2tYqmi6scqb9o7UfN098xs6lZIAOPgzgLhoC+wOyfp1IKRL5GdVxXsT8V4
	nzzEYZznDu0HcXctb5TqEC6vsOE4PosIvQus2cum4t+WqasykZ+EzIbVyd+HxZLkNX1s5xKJUq4ob
	FQZk7ZEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxuj8-00000002H76-37pj;
	Sun, 14 Sep 2025 21:57:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxuj7-00000002H6r-0MF1;
	Sun, 14 Sep 2025 21:57:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1FEC5601AC;
	Sun, 14 Sep 2025 21:57:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 651FEC4CEF0;
	Sun, 14 Sep 2025 21:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757887059;
	bh=UzomXMO2OVf/W47Q+4CtX5NoW3MYQVWQvopO9CDJOjc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=DIfT072ZUKWuwafbT+XzNyblKmtqMiLwjIe2LsTqvzKFVgkD24Hil6F9doh8y3HN5
	 RBiGg4uRdZK3CtZiPyKr5uVsP6N/LDKF+FzhiurEBJM+4hxaYkS2POFMncjxOiKEIE
	 k8hKs8rKCaxqjEpT+EZAyTbDij3gjHnyvxFxXe5T2BkLt6NhBGurpnWhLp4oppvUZK
	 xLMk0HIWgRlKr1CTpkx6w7zI8YC7HsSBfyDX7rgGRYwdpCJiK3GM7SK7X6oN0X1Fzu
	 +b1HnZhGitHed6KFpMgxJusg5De/AlcTNy8iezumCH1hA1lwQ+X94hSDfgqttsqCSU
	 LNHOBCO5hj25g==
Date: Sun, 14 Sep 2025 16:57:39 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Jjian Zhou <Jjian.Zhou@mediatek.com>, 
 Xiangzhi Tang <Xiangzhi.Tang@mediatek.com>, 
 linux-mediatek@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hailong Fan <Hailong.Fan@mediatek.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
To: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
In-Reply-To: <20250914122943.10412-2-xiangzhi.tang@mediatek.com>
References: <20250914122943.10412-1-xiangzhi.tang@mediatek.com>
 <20250914122943.10412-2-xiangzhi.tang@mediatek.com>
Message-Id: <175788697866.1955455.17302760216827607004.robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: remoteproc: Add VCP support for
 mt8196
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


On Sun, 14 Sep 2025 20:29:24 +0800, Xiangzhi Tang wrote:
> Add the new binding document for MediaTek Video Companion
> Processor(VCP) on MediaTek mt8196.
> 
> Signed-off-by: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
> ---
>  .../remoteproc/mediatek,mt8196-vcp.yaml       | 165 ++++++++++++++++++
>  1 file changed, 165 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml: patternProperties:^vcp@[a-f0-9]+$:properties:mtk,vcp-core-twohart: 'anyOf' conditional failed, one must be fixed:
	'description' is a dependency of '$ref'
	'/schemas/types.yaml#/definitions/uint32' does not match '^#/(definitions|\\$defs)/'
		hint: A vendor property can have a $ref to a a $defs schema
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.example.dts:26:18: fatal error: dt-bindings/power/mt8196-power.h: No such file or directory
   26 |         #include <dt-bindings/power/mt8196-power.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:132: Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1525: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250914122943.10412-2-xiangzhi.tang@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


