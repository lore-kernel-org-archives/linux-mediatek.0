Return-Path: <SRS0=CwkH=6H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 218E0C54FD0
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Apr 2020 05:26:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5891208E4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Apr 2020 05:26:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MmgZncaS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5891208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rxU7t5s3DJCLO7nUqqvcAavrW348n+gAW6y/ZiRUxW4=; b=MmgZncaSDNXkTZ
	9qv9Vl3BSXbgeZX8X+BRQ3VkYvMgmwHQdkITWa5xVggSZZREqqp31b+aptP1/bltEUdpIS4sCPWB1
	dmA8MRg+RSqsYs3hvYNxmLDFkuuD4D85hi0AZtuS3xSzxexAHzLljnOR1ZcdAiccgKXaed6vGqUIE
	4D7vzIyWTTpfPFfHMJIbiXbRAa8crQLNIYSnHJbFdvqamTJ2/JanoHZnMOLnXsgi0QHfIhxRhmkuX
	trUWiZNYpk77yV6h/DWp9tVIMAytM8X6CroAoUQHJ9ggur0qtTCbE2vmRJNwptwC6yvty4Qz3xFir
	8gqQO7Ngb3R5i8z/Tb5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRUNk-0006X6-Vq; Thu, 23 Apr 2020 05:26:40 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRUNh-0006Ve-Qn
 for linux-mediatek@lists.infradead.org; Thu, 23 Apr 2020 05:26:39 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1jRUNS-0005wG-3M; Thu, 23 Apr 2020 07:26:22 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <mfe@pengutronix.de>)
 id 1jRUNQ-0004xB-1a; Thu, 23 Apr 2020 07:26:20 +0200
Date: Thu, 23 Apr 2020 07:26:20 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Fengping yu <fengping.yu@mediatek.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: add matrix keypad documentation
Message-ID: <20200423052619.5qi7n7q6ytmrchio@pengutronix.de>
References: <20200423011958.30521-1-fengping.yu@mediatek.com>
 <20200423011958.30521-2-fengping.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200423011958.30521-2-fengping.yu@mediatek.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 07:24:53 up 159 days, 20:43, 157 users,  load average: 0.10, 0.06,
 0.01
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_222637_871036_70FC0458 
X-CRM114-Status: GOOD (  19.90  )
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
Cc: wsd_upstream@mediatek.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-input@vger.kernel.org, Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Fengping,

On 20-04-23 09:19, Fengping yu wrote:
> From: "fengping.yu" <fengping.yu@mediatek.com>
> 
> Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
> ---
>  .../devicetree/bindings/input/mtk-kpd.txt     | 61 +++++++++++++++++++

Pls don't add new binding docs as .txt instead you should use the new
yaml schema.

Regards,
  Marco

>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/mtk-kpd.txt
> 
> diff --git a/Documentation/devicetree/bindings/input/mtk-kpd.txt b/Documentation/devicetree/bindings/input/mtk-kpd.txt
> new file mode 100644
> index 000000000000..8b154a5e2f7d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/mtk-kpd.txt
> @@ -0,0 +1,61 @@
> +* Mediatek's Keypad Controller device tree binding
> +
> +Mediatek's Keypad controller is used to interface a SoC with a matrix-type
> +keypad device. The keypad controller supports multiple row and column lines.
> +A key can be placed at each intersection of a unique row and a unique column.
> +The keypad controller can sense a key-press and key-release and report the
> +event using a interrupt to the cpu.
> +
> +Required properties:
> +- compatible should contain:
> +	* "mediatek,kp" for common keypad
> +	* "mediatek,mt6779-keypad" for specific keypad chip
> +
> +- reg: The base address of the Keypad register bank.
> +
> +- interrupts: A single interrupt specifier.
> +
> +- mediatek,debounce-us: Debounce interval in microseconds, maximum value
> +  is 256000 microseconds.
> +
> +- keypad,num-rows: Number of row lines connected to the keypad controller, it is
> +	not equal to PCB rows number, instead you should add required value for each IC.
> +
> +- keypad,num-columns: Number of column lines connected to the keypad controller,
> +	it is not equal to PCB columns number, instead you should add required value
> +	for each IC.
> +
> +- linux,keymap: The keymap for keys as described in the binding document
> +  devicetree/bindings/input/matrix-keymap.txt.
> +
> +- pinctrl: Should specify pin control groups used for this controller.
> +  See ../pinctrl/pinctrl-bindings.txt for details.
> +
> +- clocks: Must contain one entry, for the module clock.
> +  See ../clocks/clock-bindings.txt for details.
> +
> +- clock-names: Names of the clocks listed in clocks property in the same order.
> +
> +Optional Properties:
> +- wakeup-source: use any event on keypad as wakeup event.
> +
> +Example:
> +
> +	keypad: kp@10010000 {
> +		compatible = "mediatek,kp";
> +		reg = <0 0x10010000 0 0x1000>;
> +		wakeup-source;
> +		interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_FALLING>;
> +		clocks = <&clk26m>;
> +		clock-names = "kpd";
> +	};
> +
> +	&keypad {
> +		mediatek,debounce-us = <32000>;
> +		keypad,num-rows = <8>;
> +		keypad,num-columns = <9>;
> +		linux,keymap = < MATRIX_KEY(0x00, 0x00, KEY_VOLUMEDOWN) >;
> +		status = "okay";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&kpd_gpios_def_cfg>;
> +	};
> -- 
> 2.18.0

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
