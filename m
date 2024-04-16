Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC8DC4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 16:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/mA1YEbRtC/CRaf940SL9ULAYtBGFjq9Y6wFyIptv4c=; b=ZHXrmFkeO0kLEGbmfT1RYKP1i4
	mpvEGTZ5YavGfQ/uJaJ7d3fD94kbz/PfZuYcAeDiLdOp6hMOSWoQyus0WGczk1OUCWLD7TPHGOSLc
	Q0FCdmLaN2Z1ON9UuGF6d9FNyLfTjqCxZQPCjW1aJ2oaEbxXhvB08ikL5WWIAyfsob1lDffjZi/0y
	osClMoke91KDF4IWtijQM74l8bbFREQkRqKR4TgWcirqA/JsSf5NFY8QAJ7JEcSJSnxzLYHVGvl2n
	VBKcUbJ5/5HVtsj4kFk7C6hF31rjaOwvVRnVDZpNuX7WUnoAdV4FPzGjNaSHxqZ1mEY24yrNGAszh
	eX1Z16VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwlkA-0000000D24Y-01dt;
	Tue, 16 Apr 2024 16:33:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwlk4-0000000D21r-1ev6;
	Tue, 16 Apr 2024 16:33:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A2F2361259;
	Tue, 16 Apr 2024 16:33:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D243C2BD10;
	Tue, 16 Apr 2024 16:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713285187;
	bh=10WnQNId+Y5d5f+aR4s4gUOkQlkagdBYHfATkPI0LyI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=pGvdWpIVXlbCicg6uf72xABxgaKkoNZ8cfAv19WxMB6ZBawWZrDCSUfksff3Saqmm
	 ix9GTX9QME7c1kK+FHpxlQu+BJgcqhvtelEvJt5T12oiMOKDf/vyNyrsjN/sPqLCQP
	 Jt6D3yRuj3j8niO44bBrOQF/LWRlgcSGwFLdhZCqbuzthaMS7/a6uD3h4eXN17ujcg
	 WgGI1TBAwHLRT6avrhmyfgEBcUU3Bgx+mvRPn6aOVqq2+B2ns7QIVxMO/XC6g/YJQd
	 Nq8qNXdyW7+PziEFFBewiAhG9W848P2r0ejDxQXpu8RO8ouNTm1oq7EH+G2/BFPEiy
	 X8EnERjZABDfg==
Date: Tue, 16 Apr 2024 11:33:06 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: keescook@chromium.org, gustavoars@kernel.org, 
 devicetree@vger.kernel.org, djakov@kernel.org, henryc.chen@mediatek.com, 
 linux-pm@vger.kernel.org, wenst@chromium.org, 
 linux-arm-kernel@lists.infradead.org, amergnat@baylibre.com, 
 matthias.bgg@gmail.com, lgirdwood@gmail.com, 
 krzysztof.kozlowski+dt@linaro.org, linux-mediatek@lists.infradead.org, 
 kernel@collabora.com, linux-kernel@vger.kernel.org, conor+dt@kernel.org, 
 broonie@kernel.org
In-Reply-To: <20240416153805.431118-3-angelogioacchino.delregno@collabora.com>
References: <20240416153805.431118-1-angelogioacchino.delregno@collabora.com>
 <20240416153805.431118-3-angelogioacchino.delregno@collabora.com>
Message-Id: <171328518448.2610972.14839354170690825161.robh@kernel.org>
Subject: Re: [PATCH v1 2/6] dt-bindings: interconnect: Add MediaTek EMI
 Interconnect bindings
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_093308_512136_206D8A41 
X-CRM114-Status: GOOD (  10.81  )
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


On Tue, 16 Apr 2024 17:38:01 +0200, AngeloGioacchino Del Regno wrote:
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
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interconnect/mediatek,mt8183-emi.example.dtb: dvfsrc@10012000: '#address-cells', '#size-cells' do not match any of the regexes: '@[0-9a-f]+$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mt8183-dvfsrc.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240416153805.431118-3-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


