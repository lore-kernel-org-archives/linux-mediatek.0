Return-Path: <SRS0=JxEE=7O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F44EC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jun 2020 09:33:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52C88206A4
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jun 2020 09:33:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JG96wuYm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52C88206A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5HC0KcRykG1zUDcK67Jt6mTrztXZePlxboWOuonhEUM=; b=JG96wuYmIp3opy
	GZNM2xL8FHy2AFx3NnQzHO6AYhgsZdR5S2XQfQe+KbJb9rhnv6rIFUMB1ML2EPl6D7f8+Od5NJWym
	yMKXVBbMjF/Sw7iFyyfMuaMeVxIGyxv8n1j8uh9QiS5YsIFOo/1zbfKJYKAdBHZNNxS1R8nasYBMj
	JFBH2CvJSXoxbhSxKAHQKR8eNxCZmnPamHfXQdl6lcGujoifmRteSUZ5etOmzMVasB9gowJWPBTnd
	IEjv3TKYkSAzPeA6kwbuMtcu0b16Sxd+CQNG+OUYOb9QPRmjMbHlfY4URtyQNkO0lHjslQ5IPOQHo
	vxDQzGU0AzXQmqQ97rZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfgoK-000210-Q3; Mon, 01 Jun 2020 09:32:48 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfgo9-0001s9-S3; Mon, 01 Jun 2020 09:32:39 +0000
IronPort-SDR: 44f3qzUo6GAK5Ghh+n+EGLadC5mJuDxZE2MOkOResZiZuEzhBRDgatUXeZenvaRtgQW4TKttH1
 3XzJr6wU35Fw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2020 02:32:37 -0700
IronPort-SDR: nTif1mTtkHi87XZiGU70czwtX/SDkyvcmgJrttLqVCTKcoabc4BmuzI7P5TPPZVdLGzswEnEVZ
 hKGv+W/ALVvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,460,1583222400"; d="scan'208";a="470229744"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga006.fm.intel.com with ESMTP; 01 Jun 2020 02:32:34 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jfgo9-00AC72-GP; Mon, 01 Jun 2020 12:32:37 +0300
Date: Mon, 1 Jun 2020 12:32:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Fengping Yu <fengping.yu@mediatek.com>
Subject: Re: [PATCH v13 1/3] dt-bindings: Add keypad devicetree documentation
Message-ID: <20200601093237.GB2428291@smile.fi.intel.com>
References: <20200601022548.18213-1-fengping.yu@mediatek.com>
 <20200601022548.18213-2-fengping.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200601022548.18213-2-fengping.yu@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_023237_926774_22CC535F 
X-CRM114-Status: GOOD (  20.77  )
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
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Marco Felsch <m.felsch@pengutronix.de>, linux-mediatek@lists.infradead.org,
 linux-input@vger.kernel.org, Yingjoe Chen <yingjoe.chen@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jun 01, 2020 at 10:25:47AM +0800, Fengping Yu wrote:
> From: "fengping.yu" <fengping.yu@mediatek.com>
> 
> Add Mediatek matrix keypad dt-bindings doc as yaml schema.
> 
> Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>

> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I didn't review this.

> ---
>  .../devicetree/bindings/input/mtk-kpd.yaml    | 95 +++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/mtk-kpd.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/mtk-kpd.yaml b/Documentation/devicetree/bindings/input/mtk-kpd.yaml
> new file mode 100644
> index 000000000000..586cd196dd00
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/mtk-kpd.yaml
> @@ -0,0 +1,95 @@
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
> +
> +  pinctrl-0:
> +    description: Specify pin control groups used for this controller
> +    refs: devicetree/bindings/pinctrl/pinctrl-bindings.txt
> +
> +  pinctrl-names:
> +    description: Names for optional pin modes
> +    maxItems: 1
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
> +
> +  mediatek,debounce-us:
> +    description: Debounce interval in microseconds
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
> +    compatible = "mediatek,mt6779-keypad";
> +    reg = <0 0x10010000 0 0x1000>;
> +    linux,keymap = < MATRIX_KEY(0x00, 0x00, KEY_VOLUMEDOWN) >;
> +    interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_FALLING>;
> +    clocks = <&clk26m>;
> +    clock-names = "kpd";
> +    pinctrl-names = "default";
> +    pinctrl-0 = <&kpd_gpios_def_cfg>;
> +  };
> -- 
> 2.18.0

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
