Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2429BC46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 20:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qnspcXUUXcfTB7Ax8pqAJVqBILSN3buvl5VONZJ6KKg=; b=YvZjqAMeuhbL/cLyanyMOW7f1H
	jQUAAXcADFg7AnhlOxbS3FL8d7jAcDmqqeNJ4JVp5Fcm0M/46e4vyjrlLQy3qh5TYhgd10RGLYv8Q
	ri8BnCDIsikyR/r+aWPRrtMY+qhgL4k9sih8wup6wT3sJSyCZLmbcLCbmy9sNj6C12/teA3CQEpWy
	xNLftjjc6JKiIeNgAe1XrVmhVYgktq1o4TXwOe2sm6cHNW8FzDkmKjQZg3yAvTxL+7dni9UnvZjhT
	SPzS+X1lXmyk8+PfngcOBeZBOqBLEtkf97K8RQvaI2eRmz1Dbv0PepdgX1cUt+SLbe4fAfRcXu4Cv
	PzCVFIbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUuqG-00000000URl-3PX4;
	Tue, 30 Jan 2024 20:36:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUuqD-00000000UR6-0EqY;
	Tue, 30 Jan 2024 20:36:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 763E261062;
	Tue, 30 Jan 2024 20:36:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB16C433C7;
	Tue, 30 Jan 2024 20:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706646980;
	bh=L0Z4Y+2fjawz/djs1mYllXzmcvlnHK3ZDV6yTPhasGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i1yds/eqjcxMrQ/ltGVfj/lMNN0pOHm55eLpUfjO+qRrT0W3KA5I7AKDV+d8qoA+x
	 mLud5G8F6A7GaS2Rn+ZWgQULiRpp9IOMyA3luDDge/g7aY5wl4N8gs5eADu1sGF7CK
	 lUb03ba1HoYULO/SLqW0zjp7CtPJ5R+hjQVH/MPD+WQGiZmS0DuwzuoOSizSTSN17n
	 gINuYskiCX9CeBCLimfN/MRFPTQXarDizMFviW4tjt8xkQBrHonVm1OShpD+cI5uPT
	 QW76LnZg2Va9xwHGLrsEydg6Qv7wgislPNzwIpaUzBehSbu+KPdiqcTZe2EAvm1N0y
	 a7m5yC5ATYYFw==
Date: Tue, 30 Jan 2024 14:36:17 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 1/3] dt-bindings: arm: mediatek: convert hifsys to the
 json-schema
Message-ID: <20240130203617.GB2290196-robh@kernel.org>
References: <20240123082100.7334-1-zajec5@gmail.com>
 <20240123082100.7334-2-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240123082100.7334-2-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_123621_200718_D817E872 
X-CRM114-Status: GOOD (  19.72  )
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

On Tue, Jan 23, 2024 at 09:20:58AM +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files. Introduced changes:
> 1. Documented "reg" property
> 2. Documented "#reset-cells" property
> 3. Adjusted "reg" in example
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../bindings/arm/mediatek/mediatek,hifsys.txt | 26 ---------
>  .../arm/mediatek/mediatek,mt2701-hifsys.yaml  | 54 +++++++++++++++++++

Like the other one, please move this.

>  2 files changed, 54 insertions(+), 26 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,hifsys.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt2701-hifsys.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,hifsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,hifsys.txt
> deleted file mode 100644
> index 323905af82c3..000000000000
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,hifsys.txt
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -Mediatek hifsys controller
> -============================
> -
> -The Mediatek hifsys controller provides various clocks and reset
> -outputs to the system.
> -
> -Required Properties:
> -
> -- compatible: Should be:
> -	- "mediatek,mt2701-hifsys", "syscon"
> -	- "mediatek,mt7622-hifsys", "syscon"
> -	- "mediatek,mt7623-hifsys", "mediatek,mt2701-hifsys", "syscon"
> -- #clock-cells: Must be 1
> -
> -The hifsys controller uses the common clk binding from
> -Documentation/devicetree/bindings/clock/clock-bindings.txt
> -The available clocks are defined in dt-bindings/clock/mt*-clk.h.
> -
> -Example:
> -
> -hifsys: clock-controller@1a000000 {
> -	compatible = "mediatek,mt2701-hifsys", "syscon";
> -	reg = <0 0x1a000000 0 0x1000>;
> -	#clock-cells = <1>;
> -	#reset-cells = <1>;
> -};
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt2701-hifsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt2701-hifsys.yaml
> new file mode 100644
> index 000000000000..7c7b7b7b1142
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt2701-hifsys.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt2701-hifsys.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek hifsys controller
> +
> +description:
> +  The Mediatek hifsys controller provides various clocks and reset outputs to
> +  the system.
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: mediatek,mt2701-hifsys
> +          - const: syscon
> +      - items:
> +          - enum:
> +              - mediatek,mt7623-hifsys
> +          - const: mediatek,mt2701-hifsys
> +          - const: syscon
> +      - items:
> +          - const: mediatek,mt7622-hifsys
> +          - const: syscon

The 1st and 3rd entries can be combined.

> +
> +  reg:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 1
> +    description: The available clocks are defined in dt-bindings/clock/mt*-clk.h
> +
> +  "#reset-cells":
> +    const: 1
> +
> +required:
> +  - reg
> +  - "#clock-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@1a000000 {
> +        compatible = "mediatek,mt2701-hifsys", "syscon";
> +        reg = <0x1a000000 0x1000>;
> +        #clock-cells = <1>;
> +        #reset-cells = <1>;
> +    };
> -- 
> 2.35.3
> 

