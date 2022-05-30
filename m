Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C959C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 09:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pUR/cqYBNiKvclr3ohz0L2YgU1yfGvJtyh9L9TkLKvw=; b=nfHM7UKdf6jP0M
	ObXR0CZuvqMRJBInOkJv5Qf1dKBfnqidB6N3081O7ivDYCahIuaNAOfqtA0JujrY6G9ESEB7rxgyc
	VCQYXAj65z5LRfh2fMxhwvrkRr9gsd4AQimIxvT/0Q/k0nkXya0hFh4sthVkLXTrRm4HuZSUi+WIE
	p55l18xLwCIeEW3h3k4uN7nP++TuzOICSdV4tFSVFvg9ZEINxzm/2cnCtfTv2/XvxVIEOVfz5RXDJ
	NCsKbZwHU5d/OPxbOpm4NqjVwrWGu73eDC4CDacPDPiP9NZxa/y4GxZ2ezKPP1nVXGeC9rIeG6RXw
	jR6dpg+1h+ri6ZTDQvGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvbKA-0063v1-Gd; Mon, 30 May 2022 09:04:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvbJr-0063lq-8d; Mon, 30 May 2022 09:04:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1653901450; x=1685437450;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=BqttjK6LoysDCfGp3a/aAnQzKKWODvXywQSQ/I73aMM=;
  b=pqM7aLUi8j9ErghA8GzeIebW9pf55mT2BUo5u7yD0u6MiDrc4xCuxnjV
   Ty7UxXQGhW25+PAQWAt2ipQtZYM7nryAMY1EpCNgx1ErNIAVBHeD3058n
   VnHsXszbuLRo/owrsPBu+5ke1bK+Gxwcim4UAx1dBXG6Lz/OddjnxSQtE
   2av4hGt83tLQZ1Cuk1mL/Wg+OZkUdEu0n++Nhqxd9vMQVuH8Upa3DF9BM
   zK90dad2s2fdXrzVaJUWqSIA+EOUyV2U9TH0NIRVhh0tgNXvDRVRzMT0K
   F58KNk1a54ubmz7urVsGlmSLNFtqUsyeEbcmb0+nGPnBn90cstTfCK90M
   g==;
X-IronPort-AV: E=Sophos;i="5.91,262,1647327600"; 
   d="scan'208";a="175650657"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 May 2022 02:04:06 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 30 May 2022 02:04:06 -0700
Received: from [10.159.205.135] (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 30 May 2022 02:04:01 -0700
Message-ID: <3704e284-3fd0-b073-9a3b-68ae2e966181@microchip.com>
Date: Mon, 30 May 2022 11:03:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] dt-bindings: net: Fix unevaluatedProperties warnings in
 examples
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Felix Fietkau <nbd@nbd.name>, "Lorenzo
 Bianconi" <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, "Shayne
 Chen" <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, "Kalle
 Valo" <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Claudiu
 Beznea" <claudiu.beznea@microchip.com>, Biao Huang <biao.huang@mediatek.com>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
References: <20220526014149.2872762-1-robh@kernel.org>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20220526014149.2872762-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_020411_422993_8E294DDF 
X-CRM114-Status: GOOD (  18.99  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 26/05/2022 at 03:41, Rob Herring wrote:
> The 'unevaluatedProperties' schema checks is not fully working and doesn't
> catch some cases where there's a $ref to another schema. A fix is pending,
> but results in new warnings in examples. Fix the warnings by removing
> spurious properties or adding missing properties to the schema.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   Documentation/devicetree/bindings/net/cdns,macb.yaml           | 1 -
>   Documentation/devicetree/bindings/net/mediatek,net.yaml        | 3 +++
>   Documentation/devicetree/bindings/net/mediatek-dwmac.yaml      | 3 +++
>   .../devicetree/bindings/net/wireless/mediatek,mt76.yaml        | 2 +-
>   4 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/cdns,macb.yaml b/Documentation/devicetree/bindings/net/cdns,macb.yaml
> index 337cec4d85ca..86fc31c2d91b 100644
> --- a/Documentation/devicetree/bindings/net/cdns,macb.yaml
> +++ b/Documentation/devicetree/bindings/net/cdns,macb.yaml
> @@ -191,7 +191,6 @@ examples:
>                       clock-names = "pclk", "hclk", "tx_clk", "rx_clk", "tsu_clk";
>                       #address-cells = <1>;
>                       #size-cells = <0>;
> -                    #stream-id-cells = <1>;
>                       iommus = <&smmu 0x875>;
>                       power-domains = <&zynqmp_firmware PD_ETH_1>;
>                       resets = <&zynqmp_reset ZYNQMP_RESET_GEM1>;

For cdns,macb.yaml:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks Rob. Best regards,
   Nicolas

> diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> index 699164dd1295..f5564ecddb62 100644
> --- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
> +++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> @@ -27,6 +27,9 @@ properties:
>     reg:
>       maxItems: 1
> 
> +  clocks: true
> +  clock-names: true
> +
>     interrupts:
>       minItems: 3
>       maxItems: 4
> diff --git a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> index 901944683322..61b2fb9e141b 100644
> --- a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> @@ -58,6 +58,9 @@ properties:
>         - const: rmii_internal
>         - const: mac_cg
> 
> +  power-domains:
> +    maxItems: 1
> +
>     mediatek,pericfg:
>       $ref: /schemas/types.yaml#/definitions/phandle
>       description:
> diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> index 249967d8d750..5a12dc32288a 100644
> --- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> @@ -51,7 +51,7 @@ properties:
>       description:
>         Specify the consys reset for mt7986.
> 
> -  reset-name:
> +  reset-names:
>       const: consys
> 
>     mediatek,infracfg:
> --
> 2.34.1
> 


-- 
Nicolas Ferre

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
