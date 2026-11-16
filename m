Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECA8606A32C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 16:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fO7mDb6e;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VrnrA0DP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pD7prHhiJ8g/6FZtF/D8PiiXNhYA2KHBJ1gkM5psetQ=; b=fO7mDb6eQqWsE34AdDx6H/B6AW
	Z9GOnqy1S/qeLVOHGVLOPvcxtyep/N27gzbQfARNzsukQ2aGb/DKsP1WBnveFaIoAlPqsZ9XVnfpg
	4ZmUk+G904Z3BdSkJkPftyLyGOrAJxVwu3XZdghcoLuVH3/PkrF/a9RzcbLhIJqLhl4d7YJYKJmOt
	+oiB7WP2i/2193WKFxA8g+LgeHL7KYjafsm5NEJ7tq0FekE0p+5Chw5j04zpwjxHQ8/UtdHKeHRQ/
	BgXP/RK4iFeLL25scJvc3qAFrBE8Rqgr5na0/3AnDMVuxt1HO/M46/qPR/TXBaACCFIegKuGACP6M
	RFkVeDEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzdv-00000003EfG-2MXZ;
	Mon, 16 Nov 2026 16:33:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzdu-00000003EeS-1fzQ;
	Mon, 16 Nov 2026 16:33:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E50F61292;
	Mon, 16 Nov 2026 16:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E41001F000C4;
	Mon, 16 Nov 2026 16:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794846797;
	bh=pD7prHhiJ8g/6FZtF/D8PiiXNhYA2KHBJ1gkM5psetQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VrnrA0DP/p1+KjOsC8vMgMEU17+Cvb5TlrgTiKxQo4luy9v2Y3GnHDct3cGh5ilot
	 mMVAirBCcjnN93hWGB16XyODO2SNhrZwa9bs3QHV0/FWLq6pETZqOF+fEXae7FL9Hg
	 EkrW2NXYYkvwVrLQrDu+/st9wxetbJyq62f+ZPsqRx7fjeZiAx+JAF3wUXrWRVIY/c
	 iJEOJ3ocH/EsTkrTh6yC//OHPp9GlD3yPVjNq4R0qU4YFSN+tYmVm1Kg5LI/ToATY+
	 tlKQ2h/XU2wHFe2zGKBxy37W+Y0pYQOjJ+LeKXEZzl3cnXSt/KIdB0NK9uft90ZVVo
	 yfHte0leQcGlA==
Date: Mon, 16 Nov 2026 10:33:15 -0600
From: Rob Herring <robh@kernel.org>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bin Liu <bin.liu@mediatek.com>,
	kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	irui wang <irui.wang@mediatek.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v19 09/13] dt-bindings: soc: mediatek: Add MT8196 JPEG
 SMMU
Message-ID: <20261116163315.GA2488434-robh@kernel.org>
References: <20261116013402.1273016-1-kyrie.wu@mediatek.com>
 <20261116013402.1273016-10-kyrie.wu@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116013402.1273016-10-kyrie.wu@mediatek.com>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 09:33:34AM +0800, Kyrie Wu wrote:
> Document the dedicated MT8196 JPEG SMMU configuration syscon and its
> GUSER_ID register block. JPEG decoder and encoder cores use this shared
> register block to configure their SMMU stream IDs.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
>  .../mediatek/mediatek,mt8196-jpeg-smmu.yaml   | 41 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +
>  2 files changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-jpeg-smmu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-jpeg-smmu.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-jpeg-smmu.yaml
> new file mode 100644
> index 000000000..2bc67a2af
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt8196-jpeg-smmu.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/mediatek/mediatek,mt8196-jpeg-smmu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT8196 JPEG SMMU configuration registers
> +
> +maintainers:
> +  - Kyrie Wu <kyrie.wu@mediatek.corp-partner.google.com>
> +
> +description:
> +  The MT8196 JPEG SMMU configuration register block contains the GUSER_ID
> +  fields used by the JPEG decoder and encoder hardware.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: mediatek,mt8196-jpeg-smmu
> +      - const: syscon

Trivial syscon's like this can go in syscon.yaml.

Rob

