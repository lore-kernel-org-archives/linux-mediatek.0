Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D24FCFA74C
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Nov 2025 08:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FvvnsKc+o8tKSz3sTOIZDQ1/jp3Fg+8fiiV6TySMAAM=; b=wbjrs6K8CegQU5eSmcPxl8LZ09
	M4n+lOcYt1v78Xm+3JTrhIslvArLqco32xGnR4Eb8z+Xj28M2unKChJf5CqHixNOX3iVYaPICn3g+
	g8ZSgBVzziEK+85McB06OWUGN9ejGJHTKJN4GEeqWNCFiFod1j9rQfBpcl7J2FDd+sHXSFsfUiLa5
	ofExyF0er8xqvOSezxkJvLCAEezyizdgDn7u0MZouqNyepitZCVi3ZVY8DBV0nJ6LA942GTXpL+98
	S2xw28WuwDY2ZpLHOKqwtZqxyi9+pqJlXdizOr8/LXD1Ghzvzq1wiZbao0N3iuGmrCrRptJFPXSz3
	BWNpO0yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMcp-0000000852g-2hIU;
	Fri, 21 Nov 2025 08:36:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMcn-0000000852B-3LiC;
	Fri, 21 Nov 2025 08:36:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E559E601EF;
	Fri, 21 Nov 2025 08:36:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 198DBC4CEF1;
	Fri, 21 Nov 2025 08:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763714172;
	bh=wRWUK4bk6yrVyHCmWgCal/1GBP6ThIRnf47wECoe8Ys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bKUpJ3HNhxrHvWQAxAA0RXMem7B5UOlso5mqgKnDuSVikvF4NR/7xKQcFE300OtQy
	 6riPlRiWRMtaNKd1w91P4PYJZ2RDATwsriSXGdl5BOAc8MkH/XMS0lUS8kS0zLSRfr
	 4JJh/agPnKVIOHU4tNdc28VekkH3JycBAmdX6UuNIYPWZ8dTPx7pDy8lDdl+N8JaVu
	 4SkT7ael30CRWT5c4zcsNXrOkcLT5PAOpz5ZPsYXKN/88oAFP4L6ujhSK3yFH0m6Ot
	 xV7rwzoB9Gw9vy7rvyeMKLKzy3a1qDm+0NNBuA1rCTkYASVqY4Dllk6PfpgiKMVZLY
	 fnDYe1Ptd3nMg==
Date: Fri, 21 Nov 2025 09:36:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Arnd Bergmann <arnd@arndb.de>, 
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, upstream@airoha.com
Subject: Re: [PATCH v2 2/3] ASoC: dt-bindings: Add Airoha AN7581 AFE YAML
Message-ID: <20251121-daft-secret-collie-629a2c@kuoka>
References: <20251121054537.25796-1-ansuelsmth@gmail.com>
 <20251121054537.25796-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251121054537.25796-3-ansuelsmth@gmail.com>
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

On Fri, Nov 21, 2025 at 06:45:00AM +0100, Christian Marangi wrote:
> Add documentation for Airoha AN7581 AFE YAML schema.

Drop YAML and YAML schema from subbect and commit description. See also
submitting-patches in DT dir. You cannot add documentation for YAML
schema. It's like adding a Linux driver for C code.

> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/sound/airoha,an7581-wm8960.yaml  | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
> new file mode 100644
> index 000000000000..ebeda0876280
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/airoha,an7581-wm8960.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha AN7581 sound card with WM8960 codec
> +
> +maintainers:
> +  - Christian Marangi <ansuelsmth@gmail.com>
> +
> +allOf:
> +  - $ref: sound-card-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: airoha,an7581-wm8960-sound
> +
> +  platform:
> +    type: object
> +    additionalProperties: false
> +    properties:
> +      sound-dai:
> +        description: The phandle of AN7581 platform.
> +        maxItems: 1
> +    required:
> +      - sound-dai
> +
> +  codec:
> +    type: object
> +    additionalProperties: false
> +    properties:
> +      sound-dai:
> +        description: The phandle of wm8960 codec.
> +        maxItems: 1
> +    required:
> +      - sound-dai
> +
> +unevaluatedProperties: false

Please place it after 'required:' block.

> +
> +required:
> +  - compatible
> +  - audio-routing
> +  - platform
> +  - codec

Best regards,
Krzysztof


