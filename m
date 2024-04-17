Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C93C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 14:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHh2ZU+aq7qA3HLrHL+4Y12Uhvm6rwQrq8TLu+FI42s=; b=lE7vZU/IZF2iixJD+ORgdb/am7
	/QmM5AmbU/kXDQTQt1hVFdFPCYp6VH+RQJmG/tN7S3K4adNqyhdvioG2d3MC0KUDM6SfFqrMxUFg7
	CivvuHrRvnKTGl5/Fwekh2ocrGGwZS3ZvFFc4P4o0fmgDH+tCx2nh0ewdQH2RAy+ERPuNzjRkqtEI
	MBn1ZrDzJvYG/4LL9VDZLmzooSO0qj6yr5BSE8NB1naR5/c8BOHGHvK2IF+yLWaxVz+WOfULxLmIS
	wEmMEZEe0GuqUe/c7sCPZ0FXRcxI7PX9sM/3ST0UfeFEWiqGfKMDyJwTjsaIvdDy3hbujzpwJK9LN
	8DzWWDxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx6Y5-0000000GPtK-3Jv1;
	Wed, 17 Apr 2024 14:46:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx6Y1-0000000GPr1-2XOn;
	Wed, 17 Apr 2024 14:46:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 26105614F5;
	Wed, 17 Apr 2024 14:46:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F455C072AA;
	Wed, 17 Apr 2024 14:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713365163;
	bh=prPpqIgiR4oXSxGZdm2JqXUifFqx02INBPy2HFhAkmQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=eNiKY2lnozJF11dncEK2YbaJceSMgiwx58CzqwYYQEB5wKVOJZmLgtgTQqOqm8j8j
	 F9tQ9uB9D8bFmgcCHTKgp6fkrJdhNhBrdNkmkYe8bV5NPzotpwPvjDeVhDeURVWgIc
	 DgNqBDo1j+7HH4+/KXpdKBrvCm0b0DkpomHDCvsKe382SCerBfbUKy1KiuLqC8SE5v
	 06YBGe8EikMoM5t2caquC6eV1rT/XaeQmYaRtmmERF5+w4JlKLmQDYsgbx5DXXbPdF
	 CnM7JPxLhD0RaBu4JbIsGzFrZ38N7KViL0Mtba9puEh8hxaM0p62uki5t94C1lEOL8
	 nBZBFIh8FIYkw==
Date: Wed, 17 Apr 2024 09:46:02 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: broonie@kernel.org, henryc.chen@mediatek.com, 
 linux-kernel@vger.kernel.org, keescook@chromium.org, djakov@kernel.org, 
 amergnat@baylibre.com, krzysztof.kozlowski+dt@linaro.org, 
 matthias.bgg@gmail.com, linux-pm@vger.kernel.org, lgirdwood@gmail.com, 
 devicetree@vger.kernel.org, gustavoars@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel@collabora.com, conor+dt@kernel.org, wenst@chromium.org
In-Reply-To: <20240417091442.170505-3-angelogioacchino.delregno@collabora.com>
References: <20240417091442.170505-1-angelogioacchino.delregno@collabora.com>
 <20240417091442.170505-3-angelogioacchino.delregno@collabora.com>
Message-Id: <171336511841.2347811.4883072068871368220.robh@kernel.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: interconnect: Add MediaTek EMI
 Interconnect bindings
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_074605_731465_C313ECE5 
X-CRM114-Status: GOOD (  11.22  )
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


On Wed, 17 Apr 2024 11:14:37 +0200, AngeloGioacchino Del Regno wrote:
> Add bindings for the MediaTek External Memory Interface Interconnect,
> which providers support system bandwidth requirements through Dynamic
> Voltage Frequency Scaling Resource Collector (DVFSRC) hardware.
> 
> This adds bindings for MediaTek MT8183 and MT8195 SoCs.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../interconnect/mediatek,mt8183-emi.yaml     | 76 +++++++++++++++++++
>  .../interconnect/mediatek,mt8183.h            | 23 ++++++
>  .../interconnect/mediatek,mt8195.h            | 44 +++++++++++
>  3 files changed, 143 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interconnect/mediatek,mt8183-emi.yaml
>  create mode 100644 include/dt-bindings/interconnect/mediatek,mt8183.h
>  create mode 100644 include/dt-bindings/interconnect/mediatek,mt8195.h
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/interconnect/mediatek,mt8183-emi.example.dtb: /example-0/soc/system-controller@10012000: failed to match any schema with compatible: ['mediatek,mt8195-dvfsrc']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240417091442.170505-3-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


