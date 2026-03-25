Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE876FEA837
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2026 09:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tSwqVoZdQNZacWES2XYjiTYyXvDYTR1yO103lSV4cKY=; b=HBw+E7DsyZJWv68ZuuYX53Y5IF
	Hv8AQJsqqQaseQ0j2kZ+r8Z91m2PVDv1615f8mFAhLVdufIi/Ty9Upq8hfSFQDOTY2j+lJKn+bkXP
	i5bdU22ehLBR5k25nAS4D6Adq/rfYfbIrRzPHzB5Z4cn9CRRzbHBytB1umIksiL74MDcPfjyQoNVe
	Htw1bVjuHKY40/GJKkawXSeRDVXnGpKvIj2gV/bnuwa4Aq6b7hYKZ/b3/ERnmYfFEWq6hBIDGYZJY
	v9y7aNVoAwZwJD8FR4ZcG8j1REWN1s6/HNaqw6UV+bBsRhv2tsuwtwLL/z70wVrPoYBq/Wt1YK9Fm
	DH9ermvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5KCg-000000030UT-0t9L;
	Wed, 25 Mar 2026 09:07:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5KCe-000000030U0-44gy;
	Wed, 25 Mar 2026 09:07:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B77B600AC;
	Wed, 25 Mar 2026 09:07:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31EC6C4CEF7;
	Wed, 25 Mar 2026 09:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774429623;
	bh=mEZNeTkS5coBoC+v6GfNNQfQ72VosjQVPAuPz8C/Glo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OpV+TO2d25ZYM3k3+wNaEYuEeVM/lc1Bn4k+HfKZc5Y3m7h57s6vqeKMypO0MP/rm
	 8ktw3KfIhhVCCW1UciIpzPAAoQb/oVPrGpFSmjJ/ZZfCQsRHWajx7kpr93FEnjrfpp
	 9PLGiaaa6yXKLVm/wwY/iIEU3/5NKB1dB02iBcMpzDbL44IFqGNvpYfmSXj5McSFxc
	 VV8tOwvGXPGE3RWw44HtoyIuDv51FHGMT3IucJ3aeqixn4eY71ac5stlKJunTDFB63
	 GLVF5O1I6RP7oVkfHWcXRphGc+KBHf/vB07gMr3ORwIl+NbsbZ5cUkanMKvoddqbI7
	 GwqKwpkpKQD/g==
Date: Wed, 25 Mar 2026 10:07:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Khushal Chitturi <khushalchitturi@gmail.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, koro.chen@mediatek.com, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: sound: mediatek,mt8173-rt5650-rt5514:
 convert to DT schema
Message-ID: <20260325-fluorescent-rebel-moth-dedf07@quoll>
References: <20260324074618.145567-1-khushalchitturi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260324074618.145567-1-khushalchitturi@gmail.com>
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

On Tue, Mar 24, 2026 at 01:16:18PM +0530, Khushal Chitturi wrote:
> Convert the Mediatek MT8173 with RT5650 and RT5514 sound card
> bindings to YAML schema.

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

> 
> Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
> ---
>  .../sound/mediatek,mt8173-rt5650-rt5514.yaml  | 41 +++++++++++++++++++
>  .../bindings/sound/mt8173-rt5650-rt5514.txt   | 15 -------
>  2 files changed, 41 insertions(+), 15 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/mt8173-rt5650-rt5514.txt
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml
> new file mode 100644
> index 000000000000..05bb18006e08
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mediatek,mt8173-rt5650-rt5514.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT8173 with RT5650 and RT5514 audio codecs
> +
> +maintainers:
> +  - Koro Chen <koro.chen@mediatek.com>
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8173-rt5650-rt5514
> +
> +  mediatek,audio-codec:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: Phandles of rt5650 and rt5514 codecs
> +    items:
> +      - description: phandle of rt5650 codec
> +      - description: phandle of rt5514 codec
> +
> +  mediatek,platform:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of MT8173 ASoC platform.
> +
> +additionalProperties: false

This goes after "required:" block.

> +
> +required:
> +  - compatible
> +  - mediatek,audio-codec
> +  - mediatek,platform
> +
> +examples:
> +  - |
> +    sound {
> +        compatible = "mediatek,mt8173-rt5650-rt5514";
> +        mediatek,audio-codec = <&rt5650 &rt5514>;

Two phandles, so two <> (<>, <>).

Best regards,
Krzysztof


