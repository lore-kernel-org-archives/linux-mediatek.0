Return-Path: <SRS0=dAcd=5W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 417ADC2BA17
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Apr 2020 15:21:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 123312489D
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Apr 2020 15:21:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DtLiELmh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NVeeb3/R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 123312489D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PRuK+cR1N3ZmKEorgjE+uORdIktSbpYpdC7XOpizrtk=; b=DtLiELmhU27nPG
	x0r+V3/HqccoV/kRiTk0GkTR/TZaMnDWWAJJiRdBL6G7qR4l3ia73ItjvsXh86r5lzMK98JtNrNal
	hSxCnf+dIKGcPzMu7GfWZ1Oy8fdU9Aadiy5FQ1vre753GXrGjccz7c+40llw+Wbk4MVtJvgTInA1X
	1W7YKeFvUevpoDMkKqTSfEhGD48/HduSsrN6x5C0xgGzRuj6TP8MTrhqMuffjwOXv2LKE2onyk0zU
	kGe//6zJrvOI9LuUEngHTOiwy135NLFf6Cw34pegQO2j/ahBThrycVc2fW9G7HtFLAmFYffFYsN52
	ha11RufRtAr7IfbUfh6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLTYt-0000ll-L3; Mon, 06 Apr 2020 15:21:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLTYq-0000l0-22
 for linux-mediatek@lists.infradead.org; Mon, 06 Apr 2020 15:21:17 +0000
X-UUID: b97dc3466141441983ed56f9f4b79353-20200406
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=3OlaYNErFyD2hbxvIYzxZi/mkt9Qf+6ntyxJBhEC7Wc=; 
 b=NVeeb3/RBYm4h9h/6QZFyBRj3c+pxRXrDL0IrWgZx2RXO4hHj33pwaQ6+cQv1ZbtNQ2e3b8sdDIQ9W+z5Xy4aHKCNsMdoV+NvstDFcIx8qOCjVwVfBvuofIeHBQiXZukKFlpBAUUrq3czCDxhfNy7WAVXa7F2/TU1xnh0QrRehA=;
X-UUID: b97dc3466141441983ed56f9f4b79353-20200406
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yingjoe.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 251148896; Mon, 06 Apr 2020 07:21:09 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Apr 2020 08:20:59 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Apr 2020 23:20:58 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 6 Apr 2020 23:20:58 +0800
Message-ID: <1586186461.9762.3.camel@mtksdaap41>
Subject: Re: [PATCH v3 1/2] add dt-binding document for MediaTek Keypad
From: Yingjoe Chen <yingjoe.chen@mediatek.com>
To: Fengping yu <fengping.yu@mediatek.com>
Date: Mon, 6 Apr 2020 23:21:01 +0800
In-Reply-To: <20200405020114.14787-2-fengping.yu@mediatek.com>
References: <20200405020114.14787-1-fengping.yu@mediatek.com>
 <20200405020114.14787-2-fengping.yu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200406_082116_111370_B522557C 
X-CRM114-Status: GOOD (  17.15  )
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
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Fengping,

I think this is V4, you sent v3 in
http://lists.infradead.org/pipermail/linux-mediatek/2020-January/026390.html



On Sun, 2020-04-05 at 10:01 +0800, Fengping yu wrote:
> From: "fengping.yu" <fengping.yu@mediatek.com>

This is a regression, please restore commit message (including first
line).

Many of my comments in previous version are not addressed.
Please either change according to comment, or discuss why you think you
shouldn't.

Joe.C



> 
> Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
> ---
>  .../devicetree/bindings/input/mtk-kpd.txt     | 61 +++++++++++++++++++
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

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
