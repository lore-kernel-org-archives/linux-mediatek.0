Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B50FEC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 13:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4z/HIchCQ+cdyYXxer4Zxv+4O41RgVW1hy3WlDTXls8=; b=FjTE/lNVD/pVOq+vMlCvY4W7Ff
	70YBQ+Md3l8mEwaX2i7Ldit1jFkIYdvnDb2EAnvwXu9ntTomuFgp9Ndb7RKXFHN9vjLTUJ460fP+D
	JApVVq9tKA0Py60ltaix5GD7BdCv5YlD1foxNxul8PAJ2bVFhHE4UmhWmB8qbBZHO+IRJJE9vailJ
	etOHiQtQnmrbFYMUXYDYhlCCWIykRgsqA6xr36MMPvPQAF9fpySG6Tyb2T7hrzibJQsCyJeXaNBjQ
	Uwi9IumJxR4Yp3CI0kVRB2pW4pqdlsXC/Ps0VVnpe0OupbtBZwrdUFWkNrZWkKY3nO/Oo++3YzfIt
	5pbpJL1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odtGt-003Afu-UM; Thu, 29 Sep 2022 13:08:11 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odtGg-003Aar-6M; Thu, 29 Sep 2022 13:08:01 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0693866022AB;
	Thu, 29 Sep 2022 14:07:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664456872;
	bh=YREI9mVEQTMfHoST6LFhc82ktAPMChQ/u5H+Y2sHoqk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Krydl2YZIXBwOHY+gi+HZN0ErzQpjEZotHqLqaCI31iIavuxCNr8dMYFyXMJxZ2nY
	 Fp5PokdBTTBtcfGLHhnH9Eo8MEnrbEHFEf7BZy7k7+8oFLjXYTb4hPMf+WsOewxlLs
	 c56XFWbQmAHCU1SXxDBy3MjmwH5LOZ8D2wAT+cNpoTzq9RiG29hzv8zHLPdfWpBGxN
	 51VOstCMxji62VB9lhUFamo/KLlCP5ItIOoLeZ7u5l3/0Sj3sWgLvMxxiBDcnNkAu9
	 lStpuKyhdrSF4GlR/w7M8qfEUa3MzlbV5Zx8O8GdZGlO7/+EfVQ02uY2tgEQqfwWR2
	 etKjZ/8xpB68Q==
Message-ID: <ed723cb2-ba79-55d7-7869-abf153e4af0a@collabora.com>
Date: Thu, 29 Sep 2022 15:07:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 2/4] dt-bindings: arm: mediatek: Add new bindings of
 MediaTek frequency hopping
Content-Language: en-US
To: Johnson Wang <johnson.wang@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sboyd@kernel.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 kuan-hsin.lee@mediatek.com, yu-chang.wang@mediatek.com,
 Edward-JW Yang <edward-jw.yang@mediatek.com>
References: <20220929114624.16809-1-johnson.wang@mediatek.com>
 <20220929114624.16809-3-johnson.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220929114624.16809-3-johnson.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_060758_412231_442E2CF1 
X-CRM114-Status: GOOD (  16.90  )
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

Il 29/09/22 13:46, Johnson Wang ha scritto:
> Add the new binding documentation for MediaTek frequency hopping
> and spread spectrum clocking control.
> 
> Co-developed-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
> Signed-off-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> ---
>   .../arm/mediatek/mediatek,mt8186-fhctl.yaml   | 53 +++++++++++++++++++
>   1 file changed, 53 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-fhctl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-fhctl.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-fhctl.yaml
> new file mode 100644
> index 000000000000..258dff7ce6bc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-fhctl.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8186-fhctl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek frequency hopping and spread spectrum clocking control
> +
> +maintainers:
> +  - Edward-JW Yang <edward-jw.yang@mediatek.com>
> +
> +description: |
> +  Frequency hopping control (FHCTL) is a piece of hardware that control
> +  some PLLs to adopt "hopping" mechanism to adjust their frequency.
> +  Spread spectrum clocking (SSC) is another function provided by this hardware.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8186-fhctl
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: Phandles of the PLL with FHCTL hardware capability.
> +    minItems: 1
> +    maxItems: 30
> +
> +  mediatek,hopping-ssc-percent:
> +    description: The percentage of spread spectrum clocking for one PLL.
> +    minItems: 1
> +    maxItems: 30
> +    items:
> +      default: 0
> +      minimum: 0
> +      maximum: 8
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8186-clk.h>
> +    fhctl: fhctl@1000ce00 {
> +        compatible = "mediatek,mt8186-fhctl";
> +        reg = <0x1000c000 0xe00>;
> +        clocks = <&apmixedsys CLK_APMIXED_MSDCPLL>;
> +        mediatek,hopping-ssc-percent = <3>;
> +    };


.... a more realistic example:

     #include <dt-bindings/clock/mt8186-clk.h>

     soc {
         #address-cells = <2>;
         #size-cells = <2>;

         fhctl: fhctl@1000ce00 {
             compatible = "mediatek,mt8186-fhctl";
             reg = <0 0x1000c000 0 0xe00>;
             clocks = <&apmixedsys CLK_APMIXED_MSDCPLL>;
             mediatek,hopping-ssc-percent = <3>;
         };
     };

After which...

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

