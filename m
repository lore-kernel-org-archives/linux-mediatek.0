Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFD9C87FCA
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 13:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pDqaLZwStKi6Z4/3DX7faFt+0KgWHqlolEyhY7mNuGA=; b=y0XlqHnYK/GzsFxd/GQoZg1I6O
	EfUELIkDiQ8vJEVp6rCJHLT6XMlVsG2n6WS7rTjzSzZ6OuOrnI6H6gynR9tQrbnZq33Ks6IQ2sTqS
	XwYHQUpDHaL5nBWe/cUAUsv/NNWyNOpFgMJDTG4fS4EY1iwlTHmA0ESPLx8oBnM6fFjYonTab78T3
	UB5AUnOJXmhX7cUjaKEqvYvnddwVwUj2PLvtCSEUt1mBeTRuOlP6uL6F6b8EeLrmJR4ma7qNsD43Y
	WY1/68Mq40p9qtq4U2DATlnq76BeazWSL9fV1ILLhcgVzIXlrH++LqdAnOv0zmw3jVciR7R9DGhjZ
	59+Q8S0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewOB-00000007bCi-2fhT;
	Thu, 24 Jul 2025 13:53:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uetz3-00000007K8M-1ej1;
	Thu, 24 Jul 2025 11:19:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BDE9C449F5;
	Thu, 24 Jul 2025 11:19:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BECBC4AF09;
	Thu, 24 Jul 2025 11:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753355972;
	bh=fKCuPREZ1fbNq7ig0PZdlTERupyUK7tD1jI8Qmyxs+g=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=sB9F7RQrKGg3BH5HBxZKEtr+kJAxtHztDJOH4j06rLBPmyPtxR8iCzQpvE8FN+9Iy
	 mcD/YAzmcUN8OsUa43o8rwSj9x+YBqvRJh5DMVuUHTFfj26IXlM/FWU+DH4kTUOUnl
	 FTi6NYjKApl0W1cCWyKtot5HZx3NdodGu8tGv8g+/FaCls7mqFfxAzSgirg+XBM7mp
	 YGT8Ybuu8+k/A3ti+/lmcOOP8rNX+h4vLb+A/HBHRXSF2bbwqJj6IdGKM6kE5fzSw3
	 zV9RNcWAGwDhEKw8LyJsm8l8Xse6hXdc0a6Hv6btUM7ggBxiqyHO9q+EUnGjDVQupz
	 EcJuB5Dd0NFIg==
Date: Thu, 24 Jul 2025 06:19:31 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-9-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-9-angelogioacchino.delregno@collabora.com>
Message-Id: <175335596917.1587632.3054141049365225304.robh@kernel.org>
Subject: Re: [PATCH 08/38] dt-bindings: pinctrl: mediatek,mt7622-pinctrl:
 Add missing base reg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_041933_478938_751308F4 
X-CRM114-Status: GOOD (  11.33  )
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
Cc: jassisinghbrar@gmail.com, mwalle@kernel.org, chunkuang.hu@kernel.org, linus.walleij@linaro.org, simona@ffwll.ch, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, fparent@baylibre.com, linux-phy@lists.infradead.org, airlied@gmail.com, kishon@kernel.org, andersson@kernel.org, herbert@gondor.apana.org.au, daniel.lezcano@linaro.org, jiaxin.yu@mediatek.com, chunfeng.yun@mediatek.com, andy.teng@mediatek.com, ck.hu@mediatek.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, broonie@kernel.org, eugen.hristev@linaro.org, mripard@kernel.org, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org, shane.chien@mediatek.com, atenart@kernel.org, sean.wang@kernel.org, lgirdwood@gmail.com, davem@davemloft.net, houlong.wei@mediatek.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, tzimmermann@suse.de, linux-mediatek@lists.infradead.org, krzk+dt@kernel.org, jieyy.yang@mediatek.com, tinghan.shen@mediatek.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Thu, 24 Jul 2025 10:38:44 +0200, AngeloGioacchino Del Regno wrote:
> The pin controller for both MT7622 and MT7629 need both a "base"
> and an "eint" MMIO like the ones found on other MediaTek SoCs:
> while devicetrees have always been correct, the binding is not,
> as it only allows an "eint" reg.
> 
> Add "base" to reg-names and increment maxItems for reg to two.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml   | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.example.dtb: pinctrl@10211000 (mediatek,mt7622-pinctrl): reg: [[0, 270602240, 0, 4096]] is too short
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250724083914.61351-9-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


