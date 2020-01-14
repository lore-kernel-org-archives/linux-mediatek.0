Return-Path: <SRS0=z6AG=3D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F5F0C33CB1
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2020 12:29:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51C6A24676
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2020 12:29:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O18TAG2o";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZarmXPcV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51C6A24676
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T1OjpY25eYFJGmmIxKN942sGaF7Lrygg94rUq5L2zWQ=; b=O18TAG2o7Lpyjp
	g9/HQYo2u19T2AyRVo23t40/b88o0TTtywn+2CkKQhcCP/KUBRf4wYc1Ek1RRhe2yTKa/PRNwez+W
	JHqgAYNwZ6kdU++ffmkAapMsPg9HWK1dB1y6bxUculDmoHigmhhj85vPxmtVsSdzy8UsBt2Eq98Ll
	3a110mc9UpQxF/dDvp+/QSA5mEZMN1vvdJsiJOnmrudFzvGj9Ps36DkudSS4F6F0tt8LjHlUMcIM9
	J16fmxm/vXPbdsk40WeihRwOwOyzxQumL1HBhkMMgSZtjrKCaQDZ22KsiR/kplBKXVvF5jvoJNJXm
	wkVYsj1dgaIedpijf4jA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irLJc-0005fQ-2y; Tue, 14 Jan 2020 12:29:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irLJQ-0005Y4-Ji; Tue, 14 Jan 2020 12:28:52 +0000
X-UUID: 3d642d84fa0d4515b2d1955e5a856251-20200114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=J8T9bKL4+rT6ECk7fHkaUQ6eIH0IIiO37yIffBojcV0=; 
 b=ZarmXPcVbIf1AhBExiSiEMCkCMbpSmIy+AFoGY4j3N2n74+6ORqyFp99PFKaaIBrdhET6I1HYhrn04X9FZLhi1NX+4VQ0SoLelc66rZVLohbPI0fzONO973p8Jc0axHxpw3qI6Kg5vzX3KDkxXwI99P8MX8nLQNbzXAq5QoHtR0=;
X-UUID: 3d642d84fa0d4515b2d1955e5a856251-20200114
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <fengping.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1150786340; Tue, 14 Jan 2020 04:28:42 -0800
Received: from MTKMBS32DR.mediatek.inc (172.27.6.104) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 14 Jan 2020 04:28:40 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS32DR.mediatek.inc (172.27.6.104) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 14 Jan 2020 20:27:43 +0800
Received: from localhost.localdomain (10.15.43.140) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 14 Jan 2020 20:29:23 +0800
From: fengping.yu <fengping.yu@mediatek.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Marco Felsch <m.felsch@pengutronix.de>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH V3 1/2] dt-bindings: add matrix keypad documentation
Date: Tue, 14 Jan 2020 20:27:39 +0800
Message-ID: <20200114122738.103344-2-fengping.yu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200114122738.103344-1-fengping.yu@mediatek.com>
References: <20200114122738.103344-1-fengping.yu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 062437C73D0CE646AB6BB04BBA4704A28E51BDED43DC487C3097445714317BF62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_042848_652352_992F088C 
X-CRM114-Status: GOOD (  11.37  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-input@vger.kernel.org,
 "fengping.yu" <fengping.yu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Signed-off-by: fengping.yu <fengping.yu@mediatek.com>

Add matrix keypad binding documentation for keypad on MTK SoC.

---
 .../devicetree/bindings/input/mtk-kpd.txt     | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/mtk-kpd.txt

diff --git a/Documentation/devicetree/bindings/input/mtk-kpd.txt b/Documentation/devicetree/bindings/input/mtk-kpd.txt
new file mode 100644
index 000000000000..fda744decbb2
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/mtk-kpd.txt
@@ -0,0 +1,55 @@
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
+	* "mediatek,kp" for common keypad
+
+- reg: The base address of the Keypad register bank.
+
+- interrupts: A single interrupt specifier.
+
+- mediatek,debounce-us: Debounce interval in microseconds, maximum value
+  is 256000ms
+
+- keypad,num-rows: Number of row lines connected to the keypad controller
+
+- keypad,num-columns: Number of column lines connected to the keypad controller
+
+- linux,keymap: The keymap for keys as described in the binding document
+  devicetree/bindings/input/matrix-keymap.txt.
+
+- pinctrl: Should specify pin control groups used for this controller.
+  See ../pinctrl/pinctrl-bindings.txt for details.
+
+- clocks: Must contain one entry, for the module clock.
+  See ../clocks/clock-bindings.txt for details.
+
+Optional Properties:
+- wakeup-source: use any event on keypad as wakeup event.
+
+Example:
+
+	keypad: kp@10010000 {
+		compatible = "mediatek,kp";
+		reg = <0 0x10010000 0 0x1000>;
+		wakeup-source;
+		interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_FALLING>;
+		clocks = <&clk26m>;
+		clock-names = "kpd";
+	};
+
+	&keypad {
+		mediatek,debounce-us = <32000>;
+		keypad,num-rows = <8>;
+		keypad,num-columns = <9>;
+		linux,keymap = < MATRIX_KEY(0x00, 0x00, KEY_VOLUMEDOWN) >;
+		status = "okay";
+		pinctrl-names = "default";
+		pinctrl-0 = <&kpd_gpios_def_cfg>;
+	};
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
