Return-Path: <SRS0=rC0f=3F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E69C33CB1
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jan 2020 09:14:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C18E20748
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jan 2020 09:14:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RFJ9Yi+/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WrRqBzaY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C18E20748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+CNwl7i7m5TlCNEqYoZyGBCjhog1+gu/ZRqZ4zsjmTg=; b=RFJ9Yi+/51FE9V
	iub8fEyStWcM86zLQGlEFlLUe2arW6Lzqj2VK69kOu0tcrwoqs6mGaTZg4hu7ogb6/HZumGfErGxv
	5IBvdLWalMLIEd0nG78nUv1Dd+E+k3tFMUdS8F6QgsfA7iTS8njg8wY1pibHxLMEHEThI7YgxZMmo
	RBfgtOkSBTzcYHUVs9mokMsYjpHlphz58vPuJiPS/Z6VWiB8m8EMoKPUbjVGJ5H4qQr9DECU3MHvc
	4G98y82oXOVwlMktvak5iEXHz9CxqcjT/yBAKmRhWv20el2fEkuDg8R5wtxW8g8B90X0Od4njbyQA
	ylkCaQfjCfTitD+ecxww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is1Dq-0000ud-Uu; Thu, 16 Jan 2020 09:13:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is1DY-0000c0-AY; Thu, 16 Jan 2020 09:13:37 +0000
X-UUID: 7c83f7c5e238494989462df9a7ffe6f7-20200116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=bGceZz61PEXjZahgRx2b8Zv7xc4wrCghM8dxd0+OLak=; 
 b=WrRqBzaY6ZuoCcHKFipDNz0AFUc/UehuzTxY/dGTMebDn3PMPMxiSnE0E4o5TcbJzBnFIOFy3KxdDln3OWtgKJGFMvUl2H61W3Qpaxks8kAzQnK1p7qtXCxvshNEm4TjlbbnYU3ksZ6MrqsPZZu1X/0r65lTFIGJ0t1MPqOcuX4=;
X-UUID: 7c83f7c5e238494989462df9a7ffe6f7-20200116
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yingjoe.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1081839511; Thu, 16 Jan 2020 01:13:26 -0800
Received: from MTKMBS32N2.mediatek.inc (172.27.4.72) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 16 Jan 2020 01:13:24 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS32N2.mediatek.inc (172.27.4.72) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 16 Jan 2020 17:13:13 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 16 Jan 2020 17:14:08 +0800
Message-ID: <1579166000.22959.10.camel@mtksdaap41>
Subject: Re: [PATCH V3 1/2] dt-bindings: add matrix keypad documentation
From: Yingjoe Chen <yingjoe.chen@mediatek.com>
To: fengping.yu <fengping.yu@mediatek.com>
Date: Thu, 16 Jan 2020 17:13:20 +0800
In-Reply-To: <20200114122738.103344-2-fengping.yu@mediatek.com>
References: <20200114122738.103344-1-fengping.yu@mediatek.com>
 <20200114122738.103344-2-fengping.yu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 65EEC7709B5BADA0529D650B6EFDEC1AB9ED42BF553571BBA943850A6A14C6F82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_011332_406414_1711AB62 
X-CRM114-Status: GOOD (  18.76  )
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
Cc: devicetree@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Marco Felsch <m.felsch@pengutronix.de>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-input@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Fengping,

Please add all people gave you comment in past series to CC list.


On Tue, 2020-01-14 at 20:27 +0800, fengping.yu wrote:
> Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
> 
> Add matrix keypad binding documentation for keypad on MTK SoC.
> 
> ---
>  .../devicetree/bindings/input/mtk-kpd.txt     | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/mtk-kpd.txt
> 
> diff --git a/Documentation/devicetree/bindings/input/mtk-kpd.txt b/Documentation/devicetree/bindings/input/mtk-kpd.txt
> new file mode 100644
> index 000000000000..fda744decbb2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/mtk-kpd.txt
> @@ -0,0 +1,55 @@
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


Not every keypad are the same. It is OK to havethis  one for
common/basic support, but you should still add IC specific compatible.


> +
> +- reg: The base address of the Keypad register bank.
> +
> +- interrupts: A single interrupt specifier.
> +
> +- mediatek,debounce-us: Debounce interval in microseconds, maximum value
> +  is 256000ms

not ms/microseconds now.


> +
> +- keypad,num-rows: Number of row lines connected to the keypad controller
> +
> +- keypad,num-columns: Number of column lines connected to the keypad controller

These number will change how driver interpret register bits.
In this case, you should add required value for each IC.

For example, if the IC have 4 columns, but PCB only use 2, dts still
need to specify 4 columns.

> +
> +- linux,keymap: The keymap for keys as described in the binding document
> +  devicetree/bindings/input/matrix-keymap.txt.
> +
> +- pinctrl: Should specify pin control groups used for this controller.
> +  See ../pinctrl/pinctrl-bindings.txt for details.
> +
> +- clocks: Must contain one entry, for the module clock.
> +  See ../clocks/clock-bindings.txt for details.

Need to include required clock-names here.

Joe.C

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
