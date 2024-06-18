Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A45EC27C4F
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jun 2024 08:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8h36Uq++xhD7IT+I08ZGGTxTdCNv1ie5zH+mwZ5tfzU=; b=XePZZg0L3rckBZQFi9he/gFiQ+
	/v7aTld5bvhfzWcxeVkIvtJtOlUEWpjHp757X1h9q+GVHx8/B0h+rUeylsbhXrd+ZR9xQF5Mr0vZu
	XSogc6v8wvQG4hGiHVNUfbTJIZYmjlhdwKjOqiuJSQ3p4w67+wrf4Jfn+IqnNlc+xGuVlod4KWxMF
	tTV8gO4a6Eb3ms+h6lks5GJ9nrwke8uhwan/o9x9Zwn60phbXV3R2bYxCGzP/Kdh1XIlhHDgKfYOX
	Q1G5Su/5wgpcDZISIHTgqMzQSTY4FSTvIwC9OqPSr9J1rGlGs0yUsmdeawfSGynquJvhVcd52wZZx
	JCu36VNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJUaU-0000000E7lO-0NJ7;
	Tue, 18 Jun 2024 08:53:10 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJUaP-0000000E7jX-0HxT;
	Tue, 18 Jun 2024 08:53:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1718700780; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=8h36Uq++xhD7IT+I08ZGGTxTdCNv1ie5zH+mwZ5tfzU=;
	b=gd6eVSbifkmFKp1xnnZQ3I8AJmIyyZK0S4CldnxVhM285OROnsp6hco341IbV105Bj/o8kMXBH45ubI9h2QvGx0SwEoTh73g/qMldqd+Tm+ITLJWibAiOG0XHpthK5vMBaALJCu/HmvNwKo+CMHShRJv+NG2hp+0X6tjirt8PUY=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R271e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045075189;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=23;SR=0;TI=SMTPD_---0W8jcBVV_1718700777;
Received: from 30.97.56.62(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0W8jcBVV_1718700777)
          by smtp.aliyun-inc.com;
          Tue, 18 Jun 2024 16:52:58 +0800
Message-ID: <fead8c04-4a10-451d-aa1b-b96ff3736e7e@linux.alibaba.com>
Date: Tue, 18 Jun 2024 16:52:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] dt-bindings: soc: sprd: sc9863a-glbregs: Document
 SC9863A syscon
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Khuong Dinh <khuong@os.amperecomputing.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lars Povlsen
 <lars.povlsen@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Nishanth Menon <nm@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240616-dt-bindings-mfd-syscon-split-v2-0-571b5850174a@linaro.org>
 <20240616-dt-bindings-mfd-syscon-split-v2-2-571b5850174a@linaro.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20240616-dt-bindings-mfd-syscon-split-v2-2-571b5850174a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_015305_651439_AF7D0175 
X-CRM114-Status: GOOD (  12.02  )
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



On 2024/6/16 21:19, Krzysztof Kozlowski wrote:
> Document sprd,sc9863a-glbregs compatible already used in DTS and other
> bindings example.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

LGTM. Thanks.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

> ---
>   .../bindings/soc/sprd/sprd,sc9863a-glbregs.yaml    | 55 ++++++++++++++++++++++
>   1 file changed, 55 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/sprd/sprd,sc9863a-glbregs.yaml b/Documentation/devicetree/bindings/soc/sprd/sprd,sc9863a-glbregs.yaml
> new file mode 100644
> index 000000000000..49add564e5e1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/sprd/sprd,sc9863a-glbregs.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/sprd/sprd,sc9863a-glbregs.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SC9863A Syscon
> +
> +maintainers:
> +  - Orson Zhai <orsonzhai@gmail.com>
> +  - Baolin Wang <baolin.wang7@gmail.com>
> +  - Chunyan Zhang <zhang.lyra@gmail.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: sprd,sc9863a-glbregs
> +      - const: syscon
> +      - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +  ranges: true
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +patternProperties:
> +  "@[0-9a-f]+$":
> +    $ref: /schemas/clock/sprd,sc9863a-clk.yaml
> +    description: Clock controllers
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    syscon@20e00000 {
> +      compatible = "sprd,sc9863a-glbregs", "syscon", "simple-mfd";
> +      reg = <0x20e00000 0x4000>;
> +      ranges = <0 0x20e00000 0x4000>;
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +
> +      apahb_gate: apahb-gate@0 {
> +        compatible = "sprd,sc9863a-apahb-gate";
> +        reg = <0x0 0x1020>;
> +        #clock-cells = <1>;
> +      };
> +    };
> +
> +...
> 

