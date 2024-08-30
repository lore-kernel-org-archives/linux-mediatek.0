Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6976ACA0FFC
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Aug 2024 14:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F5lZvrP5ZATlOpYx/Xa+Q1p4cmXGlxMiTAUK9ZIKfXQ=; b=L6KvDCcx540DmCspK4wdqeYDHn
	ghIj53Th59agOOGGow826wqusC1tviYxfCikysoGnvP1Om33n6I92g/dfCoqM+bp6rxV8kB/jRFVE
	T1n6OwvInYGgnsHR84RjXWSPUP7T5gESDcgbXGFrdccdS01VvdIEKTX8jqydsbHbvuOqryJDLkEm7
	ui/BwYYCOv6slwbz3kF9G2aN/BtSxGB9KOuGnCKojnTiEJZx1A/CDeEMcQuwqCeTnKTLRYms9LZWm
	wqEb+ReTTOiQSkz8Y2bUbZvo+bjgpH+aqhFu2ceKC9hTMQveqB5euYAc4rnbRMggJPrP7fhGMF2qh
	Lh6im+Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk2yg-00000006flN-0BBs;
	Fri, 30 Aug 2024 14:51:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk2xn-00000006ff8-1XPJ;
	Fri, 30 Aug 2024 14:51:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5EF09A403D3;
	Fri, 30 Aug 2024 14:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4B2C4CEC2;
	Fri, 30 Aug 2024 14:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725029457;
	bh=kRMCF26wuGa6fCppevhtQabJCmV3ZfyXGSTCv60EXrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UoElR0+BEKAItp3ZltAJ4hfx15LW5ZCBAIc7a1KybMqxjcIKMC67E4rWLEpWHvb4a
	 G6dOkp47XunRM8zTYmFTInlOIdnkF66zoiAgixQyarenRCAkfIKMLyVYsDuU9o/kCS
	 f231oaHLP7VFwo8EsZ56fhIJTKsgzpO2kLD+FJETFf/hCbHS2PhN7sckV2nvwO3W0u
	 HJIRer6USNXJJK1SS4jTdiHTgYeKKaMKjKg3mlngzLVgu1OzQgocT4PNsMxNQsmUKc
	 xobBZQAtAVWC14jVsyb3ZpYLWIhBBpxe9LjJbsDFMaeiqyHU/hAJD+Mgocba0Dv/Jm
	 W8f85o2c7pE6g==
Date: Fri, 30 Aug 2024 09:50:56 -0500
From: Rob Herring <robh@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, Sean Wang <sean.wang@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	Sen Chu <sen.chu@mediatek.com>,
	Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v2 1/7] regulator: dt-bindings: mt6323: Convert to DT
 schema
Message-ID: <20240830145056.GA4170065-robh@kernel.org>
References: <20240830110732.30080-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830110732.30080-1-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_075059_553188_A9335EB4 
X-CRM114-Status: GOOD (  23.28  )
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

On Fri, Aug 30, 2024 at 07:07:26PM +0800, Macpaul Lin wrote:
> Convert this from the old style text based binding to the new DT schema
> style.
> 
> The examples have been trimmed down and move to parent schema
> mfd/mediatek,mt6397.yaml.
> 
> Add new maintainers and submitter from MediaTek.
> 
> Signed-off-by: Sen Chu <sen.chu@mediatek.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  .../regulator/mediatek,mt6323-regulator.yaml  |  84 +++++++
>  .../bindings/regulator/mt6323-regulator.txt   | 237 ------------------
>  2 files changed, 84 insertions(+), 237 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6323-regulator.yaml
>  delete mode 100644 Documentation/devicetree/bindings/regulator/mt6323-regulator.txt
> 
> Changes for v1 and v2:
>  - This is the first version of converting mt6323-regulator.
>    This is because converting mt6323-regulator together
>    with mfd/mediatek,mt6397.yaml, so we've create a patch set
>    instead of single patch for each skydives.
>  - This patch has been made base on linux-next/master git repo.
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6323-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6323-regulator.yaml
> new file mode 100644
> index 0000000..f7c2a03
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6323-regulator.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6323-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6323 Regulator
> +
> +maintainers:
> +  - John Crispin <john@phrozen.org>
> +  - Sen Chu <sen.chu@mediatek.com>
> +  - Macpaul Lin <macpaul.lin@mediatek.com>
> +
> +description:
> +  Regulator node of the PMIC. This node should under the PMIC's device node.
> +  All voltage regulators provided by the PMIC are described as sub-nodes of
> +  this node.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: mediatek,mt6323-regulator
> +
> +patternProperties:
> +  "^(buck_)?v(pa|proc|sys)$":
> +    description: Buck regulators
> +    type: object
> +    $ref: regulator.yaml#
> +    properties:
> +      regulator-allowed-modes: false
> +    unevaluatedProperties: false
> +
> +  "^(ldo_)?v(camio|cn18)$":

Why are buck_ and ldo_ prefixes optional? The old binding didn't reflect 
actual (upstream) users? If so, that's fine, but mention that in the 
commit message.

Rob

