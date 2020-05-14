Return-Path: <SRS0=tiIh=64=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B838AC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 09:31:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DB462065D
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 09:31:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lg/dnlV/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DB462065D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ne8YWyk6WFTBodzn+32DXix6i1grL0XMqBG+riDwV8c=; b=Lg/dnlV/ZXiVH0
	bKHi5VJ/QCJiGKGF0OZDOlEnp7ccAkdg+z30LGj3+KX60fyPDSdUgsbl3DX69FnWfm1xAol4P+c2A
	9W617+NGx9oLzwCRMvc7vlOXJcl0NaemoQizZIg7Cfpiq9juwZeSAP/fL85MZbUqjDuk+VEVu87mD
	1q9+CTtYomwMInzqr8n9pEMfPgAnt8JCAU7bedOwnC6OElU4qbJqmvulRXt55bhva4uEkb3owu/V8
	XTD/wll3eEsEfCIKTnqj5BM1s7wwKAenrajS5rneeRsjzPU985dNn/y3Vzc1LEyiAgvaFFSnJwMuI
	22pfFxyBTenCawc3sShw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZADJ-00026p-Ut; Thu, 14 May 2020 09:31:37 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZAD8-0001tB-0D
 for linux-mediatek@lists.infradead.org; Thu, 14 May 2020 09:31:27 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1jZACz-0001LV-Mi; Thu, 14 May 2020 11:31:17 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <mfe@pengutronix.de>)
 id 1jZACy-0005WE-PV; Thu, 14 May 2020 11:31:16 +0200
Date: Thu, 14 May 2020 11:31:16 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Fengping Yu <fengping.yu@mediatek.com>
Subject: Re: [PATCH v7 1/3] dt-bindings: Add keypad devicetree documentation
Message-ID: <20200514093116.coiz5ofsjmxhafma@pengutronix.de>
References: <20200514061747.25466-1-fengping.yu@mediatek.com>
 <20200514061747.25466-2-fengping.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200514061747.25466-2-fengping.yu@mediatek.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:26:01 up 181 days, 44 min, 197 users, load average: 0.03, 0.10, 
 0.14
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_023126_039614_F1C2A2B5 
X-CRM114-Status: GOOD (  20.32  )
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
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On 20-05-14 14:17, Fengping Yu wrote:
> From: "fengping.yu" <fengping.yu@mediatek.com>
> 
> Add Mediatek matrix keypad dt-binding doc as yaml schema.
> 
> Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
> ---
>  .../devicetree/bindings/input/mtk-kpd.yaml    | 102 ++++++++++++++++++
>  1 file changed, 102 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/mtk-kpd.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/mtk-kpd.yaml b/Documentation/devicetree/bindings/input/mtk-kpd.yaml
> new file mode 100644
> index 000000000000..8f594fe0bfc2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/mtk-kpd.yaml
> @@ -0,0 +1,102 @@
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
> +      constraint: |

enum or const ?

> +        "mediatek,mt6779-keypad"
> +        "mediatek, kp"
> +
> +    clock-names:
> +	description: Names of the clocks listed in clocks property in the same order
> +
> +    clocks:
> +	description: Must contain one entry, for the module clock
> +	refs: devicetree/bindings/clocks/clock-bindings.txt for details.
> +
> +    interrupts:
> +	description: A single interrupt specifier
> +
> +    linux,keymap:
> +	description: The keymap for keys as described in the binding document
> +	refs: devicetree/bindings/input/matrix-keymap.txt
> +
> +    pinctrl-0:
> +	description: Specify pin control groups used for this controller
> +	refs: devicetree/bindings/pinctrl/pinctrl-bindings.txt
> +
> +    pinctrl-names:
> +	description: Names for optional pin modes
> +
> +    reg:
> +	description: The base address of the Keypad register bank
> +
> +    wakeup-source:
> +	description: use any event on keypad as wakeup event
> +
> +    keypad,num-columns:
> +	description: Number of column lines connected to the keypad controller,
> + 	it is not equal to PCB columns number, instead you should add required value
> + 	for each IC
> +
> +    keypad,num-rows:
> +	description: Number of row lines connected to the keypad controller, it is
> + 	not equal to PCB rows number, instead you should add required value for each IC
> +
> +    mediatek,debounce-us:
> +	description: Debounce interval in microseconds
> +	maximum: 256000

I think that you are missing the maxItems on all your properties so we
can't make any validation. Also the indent looks wrong.

> +
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - mediatek,debounce-us
> +  - keypad,num-rows
> +  - keypad,num-columns
> +  - linux,keymap
> +  - pinctrl
> +  - clocks
> +  - clock-names
> +
> +optional:
> +  - wakeup-source:

I think the optional can be dropped.

> +examples:
> +  - |
> +
> +    keypad: kp@10010000 {
> +	compatible = "mediatek,kp";
> +	reg = <0 0x10010000 0 0x1000>;
> +	wakeup-source;
> +	interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_FALLING>;
> +	clocks = <&clk26m>;
> +	clock-names = "kpd";
> +    };
> +
> +    &keypad {
> +	mediatek,debounce-us = <32000>;
> +	keypad,num-rows = <8>;
> +	keypad,num-columns = <9>;
> +	linux,keymap = < MATRIX_KEY(0x00, 0x00, KEY_VOLUMEDOWN) >;
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&kpd_gpios_def_cfg>;
> +    };

Pls squash those nodes.

Regards,
  Marco

> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
