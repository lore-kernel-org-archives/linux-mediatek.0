Return-Path: <SRS0=HKXf=25=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A43BC33C9B
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2020 06:40:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E15EB2075D
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2020 06:40:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E4uY2n2s";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="o3NBuJ4F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E15EB2075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NyAePVnjr/umfq64QnaoxAvZjN0Mm9Nc68ttPb/UsMY=; b=E4uY2n2snX8/2D
	04HmBt+HxtwDzIPRom9y9ibjLs6tRaFrV+x4dzFCtAaqGb/+Y5FWWh0F7p7MYxLsOWkPtlv55WHN4
	J2Lsx8BODNZZrl3KubsubBainGLrVxU+BHFtz8U9vID8aNP78lPr/O8oziUUjaN0LzZcGvS8UNpio
	E8V/tdvH85JwP0OONT6JNgUWofEls6GELt1C30ssU2YHbwHBsB3351eQj1YWdh+czZtr5cA9Wm8kb
	OiG0O6gpETplKfq7GnCuFtHiWS6yESIxUq7U4lYPyTLDgWp4dZOg9p9OmvTQp+oswM6gPKnGyTZ2i
	4TOFCWCmEcveTLzNKR6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ip51U-0000tW-MJ; Wed, 08 Jan 2020 06:40:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ip51G-0000eE-Qf; Wed, 08 Jan 2020 06:40:44 +0000
X-UUID: 8b24be9fe49547ee8b8130303e3c89fb-20200107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=jcoI7sSAP0WUWoL73vFfOHM1Cxi2u4vd3UC1VSbMP/c=; 
 b=o3NBuJ4F7QD6x+TYY1YONYqvh2TfitcnHFoAZUa0uhrETT4C/6n2EOOVWbVquMAQ0laocvMIU5EZWqnADzhzhSIOYbf6YCyhQ33YgpE4LIUXwUuTepZ3eh+wOnfY+DI/TPy+VYxsxyIrWhqm2hBiXTNSd0bmlgrrwNfWUMujE5M=;
X-UUID: 8b24be9fe49547ee8b8130303e3c89fb-20200107
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <fengping.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2103337909; Tue, 07 Jan 2020 22:40:32 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 7 Jan 2020 22:31:08 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 8 Jan 2020 14:30:02 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 8 Jan 2020 14:30:08 +0800
From: fengping yu <fengping.yu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Olof Johansson
 <olof@lixom.net>, Aisheng Dong <aisheng.dong@nxp.com>, Anson Huang
 <Anson.Huang@nxp.com>, Maxime Ripard <mripard@kernel.org>, Leonard Crestez
 <leonard.crestez@nxp.com>, Dinh Nguyen <dinguyen@kernel.org>, "Marcin
 Juszkiewicz" <marcin.juszkiewicz@linaro.org>, Valentin Schneider
 <valentin.schneider@arm.com>, Arnd Bergmann <arnd@arndb.de>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Mark Brown <broonie@kernel.org>, Thierry
 Reding <treding@nvidia.com>, YueHaibing <yuehaibing@huawei.com>, Stefan Agner
 <stefan@agner.cn>, Jacky Bai <ping.bai@nxp.com>, Marco Felsch
 <m.felsch@pengutronix.de>
Subject: [PATCH V2 1/2] Documentation: devicetree: bindings: input
Date: Wed, 8 Jan 2020 14:29:22 +0800
Message-ID: <20200108062923.14684-2-fengping.yu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200108062923.14684-1-fengping.yu@mediatek.com>
References: <20200108062923.14684-1-fengping.yu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200107_224042_910381_40D28361 
X-CRM114-Status: GOOD (  12.58  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-input@vger.kernel.org, "fengping.yu" <fengping.yu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "fengping.yu" <fengping.yu@mediatek.com>

Add mtk keypad device tree documentation.

Change-Id: I415b76ee980784992763c768829b2dda76699dea
Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
---
 .../devicetree/bindings/input/mtk-kpd.txt     | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/mtk-kpd.txt

diff --git a/Documentation/devicetree/bindings/input/mtk-kpd.txt b/Documentation/devicetree/bindings/input/mtk-kpd.txt
new file mode 100644
index 000000000000..2af81e696159
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/mtk-kpd.txt
@@ -0,0 +1,45 @@
+* Mediatek's Keypad Controller device tree binding
+
+Mediatek's Keypad controller is used to interface a SoC with a matrix-type
+keypad device. The keypad controller supports multiple row and column lines.
+A key can be placed at each intersection of a unique row and a unique column.
+The keypad controller can sense a key-press and key-release and report the
+event using a interrupt to the cpu.
+
+Required properties:
+- compatible should contain:
+	* "mediatek,mt6779-keypad" for MT6779 keypad
+	* "mediatek,kp" for common keypad
+
+- reg: The base address of the Keypad register bank.
+
+- interrupts: A single interrupt specifier.
+
+- mediatek,key-debounce-ms: Debounce interval in milliseconds, maximum value
+  is 256ms
+
+- mediatek,hw-map-num: Number of entries of keycode in mediatek,hw-init-map
+
+- mediatek,hw-init-map: An array of packed 1-cell entries containing the
+  equivalent of hw-map-num linux key-code. Each cell is Linux keymap of
+  corresponding row/col, arrange like this:
+
+  row0col0, row0col1, row0col2,...row0col8,
+  row1col0, row1col1, row1col2,...row1col8,
+  ...
+  row7col0, row7col1, row7col2,...row7col8.
+
+Example:
+
+	keypad: kp@10010000 {
+		compatible = "mediatek,mt6779-keypad", "mediatek,kp";
+		reg = <0 0x10010000 0 0x1000>;
+		interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_FALLING>;
+	};
+
+	&keypad {
+		mediatek,key-debounce-ms = <1024>;
+		/*HW Keycode [0~71] -> Linux Keycode*/
+		mediatek,khw-map-num = <72>;
+		mediatek,hw-init-map = <114 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 >;
+	};
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
