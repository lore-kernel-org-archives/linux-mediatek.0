Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA803C2BD09
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 16:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZ2Ynn+HMr3ipaYxOM6p42cuKYY0DO2xjG1rpcTu8M4=; b=2LP2fiQEFA6PQe+23RQ3are/Py
	8MwGHuPGLglsjpl5mGWdkWjOdYQDzBrwnDpKvTpi80ovGfsH6OVS1WRIrY8q3l38l6P8QNZ5+7KqD
	eeg30MWfPIvqXT64tw6tDmQEl99vWlyn2YcA+xGpKe0vlrcPlJvPcMo5uZIZDeb1x+5HTiDKglw9l
	iyqMziTUbVpqr2RKl8PxK1Vy46b0bpBedmgQE29hSFD9nKjMFdkYxUVprsa4YjvE+r/aMWtJyJYy2
	Wo1mNqmfFqMdMHXLkytwJraJxItUIWdIDFa5XLWT6bmyRm5fB/pOeiCEr3hTeL3pCl4Y8R/iFoKWV
	JY3oHKOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMrgC-0000000AzR3-1ZW7;
	Thu, 27 Jun 2024 16:09:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMrg2-0000000AzQ3-3CDQ;
	Thu, 27 Jun 2024 16:08:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 81DBE61E1B;
	Thu, 27 Jun 2024 16:08:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCC65C2BBFC;
	Thu, 27 Jun 2024 16:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719504529;
	bh=UvvB9I+OgH/8xfj7J4ex+IlmHc9nIRL5By2AyR5g2VY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AfgjuZutP9Yi9KF01fUc7C9CHJgbKTj4/fWIOi34dC2+/URSxG4dJFccgjTM4KpaV
	 8RHbnWodxabvZm7+PdCJ2PbuO9VG5DIVcfLxQYfDWU3w59BVv5onIwKs9ypB1Ib5iL
	 Xerul6ojTt6wqbH4lURYwXNAq018hhTqB4/Tx4xH2D5d2/rt+J9/LnRebWAmR4Sil2
	 Sy4aA7fGruCbDbhB3ZcxhV3JKbRi6aLhhKq8M+u1feh+JXnzDyQ26Of6RXsULOBMIT
	 TJHQvi1dnWVn9sAsYeJ0kGlgif84MC1/oXcwFE/zc/1YGzsIdh67Cht5qay1GaBWFW
	 md+ZzpwAbFHTQ==
Date: Thu, 27 Jun 2024 10:08:47 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>, linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] dt-bindings: net: bluetooth: convert MT7622 Bluetooth to
 the json-schema
Message-ID: <20240627160847.GA3506035-robh@kernel.org>
References: <20240627054011.26621-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240627054011.26621-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_090851_042587_ED65C269 
X-CRM114-Status: GOOD (  16.64  )
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

On Thu, Jun 27, 2024 at 07:40:11AM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../bluetooth/mediatek,mt7622-bluetooth.yaml  | 61 +++++++++++++++++++
>  .../bindings/net/mediatek-bluetooth.txt       | 36 -----------
>  2 files changed, 61 insertions(+), 36 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7622-bluetooth.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7622-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7622-bluetooth.yaml
> new file mode 100644
> index 000000000000..cb8ff93c93eb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7622-bluetooth.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/bluetooth/mediatek,mt7622-bluetooth.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek SoC built-in Bluetooth
> +
> +description:
> +  This device is a serial attached device to BTIF device and thus it must be a
> +  child node of the serial node with BTIF. The dt-bindings details for BTIF
> +  device can be known via Documentation/devicetree/bindings/serial/8250.yaml.
> +
> +maintainers:
> +  - Sean Wang <sean.wang@mediatek.com>
> +
> +allOf:
> +  - $ref: bluetooth-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt7622-bluetooth
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: ref
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - clocks
> +  - clock-names
> +  - power-domains
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt7622-clk.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/mt7622-power.h>
> +
> +    serial@1100c000 {
> +        compatible = "mediatek,mt7622-btif", "mediatek,mtk-btif";
> +        reg = <0 0x1100c000 0 0x1000>;
> +        interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_LOW>;
> +        clocks = <&pericfg CLK_PERI_BTIF_PD>;
> +        clock-names = "main";
> +        reg-shift = <2>;
> +        reg-io-width = <4>;

Just drop all this. Not relevant to *this* example.

You just need:

serial {

> +
> +        bluetooth {
> +            compatible = "mediatek,mt7622-bluetooth";
> +            power-domains = <&scpsys MT7622_POWER_DOMAIN_WB>;
> +            clocks = <&clk25m>;
> +            clock-names = "ref";
> +        };
> +    };

