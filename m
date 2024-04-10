Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B8ACD11C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 19:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZuN+F9V8zQKDQ2JVnzohQXPyx+7uGvUKPz6LV1hDlDU=; b=eumtd4TF5QwnHNha1dPm1EjU7i
	4qY2q7pGmdilEDydMgfkZTqc8exISW85dfcy0Oa0ndYs5NuYtVmnLQIKTrJ8COMMNLB/HzDXLxSB4
	xIR8kaEz4k1BG2zjA6Em+ZHuMoiumDwzWnZfvnebHl9aJ6LId6n2kMl37dNreqtAsXg8B5opa6Hkc
	ubkQwZoIazww32/eN+oj04tqmf16tHht18nUIaXtcW8GQTK0v3q1cFmVWWX1kc+UiJRmtD4k6Wzm9
	g3NKwhiHcUXNo9O3l8DjHNjTphM90rU7veo/bDW7D2q1NYOBuFZ0QZefUQg1BYA+cBv8rFWIyheGb
	Nu2o47Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rudPx-00000008eNa-22ea;
	Wed, 10 Apr 2024 19:15:33 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rudPu-00000008eMX-0SQ6;
	Wed, 10 Apr 2024 19:15:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 02186CE2B57;
	Wed, 10 Apr 2024 19:15:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3F79C433C7;
	Wed, 10 Apr 2024 19:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712776527;
	bh=Y8HrYr9N2X54zlXcRSCoc2hhNScMqkdWP9FAh9Krwpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O6D/MyhRjX4ilUEZ8v2TxELy3AD7IFMbhHI+0f3QYn6legTjbs42EOHPa6Zy/N1Cv
	 8YdZnZW13beNY1N/uwPLTXi/TBR2m5pfJzQ48FsByqAFNfWGKYGXjP3lH8eU47iMcN
	 CSB/bud3Vs5fHAeuVXp7i9I4vmDpFB5W2U1iP6Z8oHNACDu9ZoGsmH7b8xVMCdLRjm
	 giGQSJMdm9AAKD2Q+Mar3iE5l6Pq7TiMnEkuHcnLw+Xl8E8yOeEpYeAO4VuVf0msiJ
	 CDs7PTm8dmFC/Pzq/Jg8gMPDsu6+wGfX2fqBHzQvlC4gxjU8Lrg0WmgZQrSfZDqG3+
	 92LTTQTuF6w+g==
Date: Wed, 10 Apr 2024 14:15:24 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
	daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com,
	shawn.sung@mediatek.com, yu-chang.lee@mediatek.com,
	ck.hu@mediatek.com, jitao.shi@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, wenst@chromium.org,
	kernel@collabora.com
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph
 support for board path
Message-ID: <20240410191524.GA903053-robh@kernel.org>
References: <20240409120211.321153-1-angelogioacchino.delregno@collabora.com>
 <20240409120211.321153-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240409120211.321153-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_121530_533101_4F17E477 
X-CRM114-Status: GOOD (  18.42  )
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

On Tue, Apr 09, 2024 at 02:02:10PM +0200, AngeloGioacchino Del Regno wrote:
> Document OF graph on MMSYS/VDOSYS: this supports up to three DDP paths
> per HW instance (so potentially up to six displays for multi-vdo SoCs).
> 
> The MMSYS or VDOSYS is always the first component in the DDP pipeline,
> so it only supports an output port with multiple endpoints - where each
> endpoint defines the starting point for one of the (currently three)
> possible hardware paths.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/arm/mediatek/mediatek,mmsys.yaml | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index b3c6888c1457..4e9acd966aa5 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -93,6 +93,29 @@ properties:
>    '#reset-cells':
>      const: 1
>  
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description:
> +      Output port node. This port connects the MMSYS/VDOSYS output to
> +      the first component of one display pipeline, for example one of
> +      the available OVL or RDMA blocks.
> +      Some MediaTek SoCs support up to three display outputs per MMSYS.

I'm have a hard time understanding this, but is it 3 outputs 
simultaneously or connect mmsys to 1 of 3. Generally it's multiple ports 
for the former and endpoints for the latter.

> +    properties:
> +      endpoint@0:
> +        $ref: /schemas/graph.yaml#/properties/endpoint
> +        description: Output to the primary display pipeline
> +
> +      endpoint@1:
> +        $ref: /schemas/graph.yaml#/properties/endpoint
> +        description: Output to the secondary display pipeline
> +
> +      endpoint@2:
> +        $ref: /schemas/graph.yaml#/properties/endpoint
> +        description: Output to the tertiary display pipeline
> +
> +    required:
> +      - endpoint@0
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.44.0
> 

