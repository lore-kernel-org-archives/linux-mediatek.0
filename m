Return-Path: <SRS0=dQnm=BJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8129AC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 02:56:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 511AB22B48
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 02:56:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FHwTpnWH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FA09KDUD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 511AB22B48
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nSDV6nm8g7+71pQPAYEjnU/GKaOpJGON+5DcS61UR+A=; b=FHwTpnWHXkIRqooAatzqzcKbP
	OuBPaP5aim3PkK0T5rTHA67AJx/8A8SEHJxtH1PnswQHyPTFx48gjdcSX/fyeyKBhO8I5MUgWQJ7+
	N/Ad8xeLyt1UuWyBzqwk9AUavvB8xEqCCWEoW0kPk05Xsx0i2meeg60723lFi2G78V0i8TQS0RoPk
	L1zL01Qe4JP7QAtbF1N6CnzPIWN96nhIjdRaKxmTBSAhWdKIqSpyfQuIUeBZP0twABKNI9Y1z0ySI
	RPtKv5JwrISiXM/3t6LLKWjbBEBL2NqJ9db+0e9q25lA2S36kFQIeinbOPEuDaQyqXmWmJz6DmgF7
	B3/UuodJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0yk6-0004mW-R8; Thu, 30 Jul 2020 02:56:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0yk2-0004lK-8h; Thu, 30 Jul 2020 02:56:23 +0000
X-UUID: fbe052cf60f84ae19182e616c19b0ef6-20200729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=i0bupk3lA9+XOW/dVZ3V8pmhPwEwozZV30mSX3eVTBE=; 
 b=FA09KDUDUV7o12uh6XA9HBe34TUr080qbkZLxPl6lbMqJvv24bn1pFDXqjV5b1iNwitQBsJmMjDEQn5tfUp+DP7rnDB3QybtIcWRdbKVKt+PZk8sk+S3d3D0bMrnNYaDGtJ16GD5+UVj0BiTx9hZYXqR+zZpXHqz1b7fhSo4DeA=;
X-UUID: fbe052cf60f84ae19182e616c19b0ef6-20200729
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yingjoe.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2039964576; Wed, 29 Jul 2020 18:56:11 -0800
Received: from MTKMBS32DR.mediatek.inc (172.27.6.104) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 19:56:15 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS32DR.mediatek.inc (172.27.6.104) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Jul 2020 10:56:10 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Jul 2020 10:56:08 +0800
Message-ID: <1596077771.11024.18.camel@mtksdaap41>
Subject: Re: [PATCH v16 1/3] dt-bindings: Add keypad devicetree documentation
From: Yingjoe Chen <yingjoe.chen@mediatek.com>
To: Fengping Yu <fengping.yu@mediatek.com>
Date: Thu, 30 Jul 2020 10:56:11 +0800
In-Reply-To: <20200727114504.28536-2-fengping.yu@mediatek.com>
References: <20200727114504.28536-1-fengping.yu@mediatek.com>
 <20200727114504.28536-2-fengping.yu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B5B7D66D4661DBC9931269635E8730C67D7D08F06E0F3BA34AF7139FCD2B3F232000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_225622_511148_C5091E52 
X-CRM114-Status: GOOD (  26.65  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Marco Felsch <m.felsch@pengutronix.de>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-input@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

Summary should specified this patch is for MediaTek:

dt-bindings: add MediaTek keypad devicetree documentation


On Mon, 2020-07-27 at 19:45 +0800, Fengping Yu wrote:
> From: "fengping.yu" <fengping.yu@mediatek.com>

> Add Mediatek matrix keypad dt-bindings doc as yaml schema.
> 
> Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
> ---
>  .../devicetree/bindings/input/mtk-kpd.yaml    | 96 +++++++++++++++++++
>  1 file changed, 96 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/mtk-kpd.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/mtk-kpd.yaml b/Documentation/devicetree/bindings/input/mtk-kpd.yaml
> new file mode 100644
> index 000000000000..3bf09e7395d0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/mtk-kpd.yaml
> @@ -0,0 +1,96 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +version: 1
> +
> +$id: http://devicetree.org/schemas/input/mtk-keypad.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek's Keypad Controller device tree bindings
> +
> +maintainer:
> +  - Fengping Yu <fengping.yu@mediatek.com>
> +
> +description: |
> +  Mediatek's Keypad controller is used to interface a SoC with a matrix-type
> +  keypad device. The keypad controller supports multiple row and column lines.
> +  A key can be placed at each intersection of a unique row and a unique column.
> +  The keypad controller can sense a key-press and key-release and report the
> +  event using a interrupt to the cpu.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: "mediatek,mt6779-keypad"
> +      - const: "mediatek,mt6873-keypad"
> +
> +  clock-names:
> +    description: Names of the clocks listed in clocks property in the same order
> +    maxItems: 1

Please list the clock-names required. In this case, 'kpd'


> +
> +  clocks:
> +    description: Must contain one entry, for the module clock
> +    refs: devicetree/bindings/clocks/clock-bindings.txt for details.
> +
> +  interrupts:
> +    description: A single interrupt specifier
> +    maxItems: 1
> +
> +  linux,keymap:
> +    description: The keymap for keys as described in the binding document
> +    refs: devicetree/bindings/input/matrix-keymap.txt
> +    minItems: 1
> +    maxItems: 16

Why is this max at 16?


> +
> +  pinctrl-0:
> +    description: Specify pin control groups used for this controller
> +    refs: devicetree/bindings/pinctrl/pinctrl-bindings.txt
> +
> +  pinctrl-names:
> +    description: Names for optional pin modes
> +    maxItems: 1

I'm not sure we should list pinctrl here. 


> +
> +  reg:
> +    description: The base address of the Keypad register bank
> +    maxItems: 1
> +
> +  wakeup-source:
> +    description: use any event on keypad as wakeup event
> +    type: boolean
> +
> +  keypad,num-columns:
> +    description: Number of column lines connected to the keypad controller,
> +    it is not equal to PCB columns number, instead you should add required value
> +    for each IC
> +
> +  keypad,num-rows:
> +    description: Number of row lines connected to the keypad controller, it is
> +    not equal to PCB rows number, instead you should add required value for each IC

So the values depend on IC HW. These are not listed as required. Can
your driver works without them? Default value?

> +
> +  mediatek,debounce-us:
> +    description: Debounce interval in microseconds, if not specified, the default
> +    value is 16000
> +    maximum: 256000
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - linux,keymap
> +  - pinctrl
> +  - clocks
> +  - clock-names
> +
> +examples:
> +  - |
> +
> +  keypad: kp@10010000 {

This should be 'keypad' or instead of kp.

Joe.C

> +    compatible = "mediatek,mt6779-keypad";
> +    reg = <0 0x10010000 0 0x1000>;
> +    linux,keymap = < MATRIX_KEY(0x00, 0x00, KEY_VOLUMEDOWN) >;
> +    interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_FALLING>;
> +    clocks = <&clk26m>;
> +    clock-names = "kpd";
> +    pinctrl-names = "default";
> +    pinctrl-0 = <&kpd_gpios_def_cfg>;
> +  };

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
