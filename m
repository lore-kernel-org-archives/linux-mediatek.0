Return-Path: <SRS0=YyAn=5V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0304C2BA15
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Apr 2020 02:05:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A103620672
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Apr 2020 02:05:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="egJHk4tH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="m2rwi/JP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A103620672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WyC4oloOpEOeb36PZ6mIomhRJ8bXlvmvVaMtoOH1OXo=; b=egJHk4tHT9IMFx
	RuJXqZ5rLLXHSnVrkiLjjZOjj8/fUxRTzLSxaEXIXDyN5QGyV+xvkKRR4jpDRwWQHTiVWLen/4cE1
	mEZl/KaeI3JVUrPqMrdHYkldI/r22yv+fqjDJON6KVtyXr5J1egLWsP+mZw6ckw6YhjQkDtdDMUbT
	2/3JXE4Jl69hraU0pQU+k84Je+ZscGx3S4bZgoo+ujRQ8JC/dk23+1pfuqrCTD9/DH4Z9X1qJxy55
	IFMXS4CQ5ofIbRxUwN5pqxhdTYhtCdd2Vzw5KU4hnU67X74KUxchVu6w8I+UHBytsqnDtbgyrNY7T
	oLjo2sjKfKkOsAI2JkQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKued-0004F4-AY; Sun, 05 Apr 2020 02:04:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKuea-0004Dg-0q
 for linux-mediatek@lists.infradead.org; Sun, 05 Apr 2020 02:04:53 +0000
X-UUID: 97a4a26635e74a48b384dd71e655528e-20200404
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=so/zdDg19uF6HPbarG0PI/5cKMUNmyanUGRklLZ9AwM=; 
 b=m2rwi/JPdcPEUhpsQUZPvpkBnMBGqNogHbLX5J36k7laIG8tptZnZA3rdYyRek2QhIJDmCe06M+2eggHxovson5wVQpd2f4olDL3ph1WmosjCZrz7Zim6hiWkXUyN44A99c7KJeh6Ur3+uvn4Bwmdc+pz+Di2OA2N/0mKu1ID/s=;
X-UUID: 97a4a26635e74a48b384dd71e655528e-20200404
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <fengping.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1580745009; Sat, 04 Apr 2020 18:04:49 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 4 Apr 2020 19:04:47 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 5 Apr 2020 10:04:44 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 5 Apr 2020 10:04:40 +0800
From: Fengping yu <fengping.yu@mediatek.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: [PATCH v3 1/2] add dt-binding document for MediaTek Keypad
Date: Sun, 5 Apr 2020 10:01:16 +0800
Message-ID: <20200405020114.14787-2-fengping.yu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200405020114.14787-1-fengping.yu@mediatek.com>
References: <20200405020114.14787-1-fengping.yu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200404_190452_065783_84DDD488 
X-CRM114-Status: GOOD (  11.59  )
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
Cc: "fengping.yu" <fengping.yu@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "fengping.yu" <fengping.yu@mediatek.com>

Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
---
 .../devicetree/bindings/input/mtk-kpd.txt     | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/mtk-kpd.txt

diff --git a/Documentation/devicetree/bindings/input/mtk-kpd.txt b/Documentation/devicetree/bindings/input/mtk-kpd.txt
new file mode 100644
index 000000000000..8b154a5e2f7d
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/mtk-kpd.txt
@@ -0,0 +1,61 @@
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
+	* "mediatek,mt6779-keypad" for specific keypad chip
+
+- reg: The base address of the Keypad register bank.
+
+- interrupts: A single interrupt specifier.
+
+- mediatek,debounce-us: Debounce interval in microseconds, maximum value
+  is 256000 microseconds.
+
+- keypad,num-rows: Number of row lines connected to the keypad controller, it is
+	not equal to PCB rows number, instead you should add required value for each IC.
+
+- keypad,num-columns: Number of column lines connected to the keypad controller,
+	it is not equal to PCB columns number, instead you should add required value
+	for each IC.
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
+- clock-names: Names of the clocks listed in clocks property in the same order.
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
