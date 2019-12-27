Return-Path: <SRS0=MHhQ=2R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 913DAC2D0C3
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Dec 2019 04:06:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6354120828
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Dec 2019 04:06:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dtkh8PIl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="lwljGazc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6354120828
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zuhW2yAJyHtX4Xcw62pxWMDGqF6/2WusxXZsopo7Ac4=; b=Dtkh8PIlgqtZT0
	RLob1LHEDVBzm/wGaZbcGRTREoLtwZj+fACzDDhodqmfEoFnszYYgBjxM9CD1hLMwCEj8b6lhEnC2
	tWgq8CD+geNFR0BeW53EXR72aPLnQ4De+it/xavyFH+cSN8C64yNUty3U9ZxFJKsauCEOc//gjA+l
	zTs8hG/Kb+r/QjLMi0BMZMfmeKEgE3wVE8yR17X9hjfSNfU6hSn4jgN0MntehHVBII9lusJkWJxvc
	QcXE1EOqa9dbyufNKg2FZlJ/OIOdbYJ6YC0Lj3pQeym7RptLptn6fS+bGUJ+j7wduKdLdxzqgkArE
	7/ke+DM+tr9cmTkm54Fg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ikgt7-00058R-6O; Fri, 27 Dec 2019 04:06:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ikgt3-00055z-D1
 for linux-mediatek@lists.infradead.org; Fri, 27 Dec 2019 04:06:06 +0000
X-UUID: 1a89e587ff2c43b59398ee2bd7fb29a5-20191226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=xA1GO3JHHJIiqP2n/wuG5wg+lkfhQRMOylvohUx+jN0=; 
 b=lwljGazcWshLL4D4sc2870esLSWyAgiVyR3XuiNtItLZ2dCl1gGrpCc160ODjrHUVuzFyKdEBl7+ocA3PR+toKv5XLDgxoM7o9DK5z/21qjUO+awzPnkYf/iYohmwLN+cqLAk0ADugaucgTAONCzpQJGCuoNVOyKGbq70aASxWg=;
X-UUID: 1a89e587ff2c43b59398ee2bd7fb29a5-20191226
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <fengping.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 320017568; Thu, 26 Dec 2019 20:05:59 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 26 Dec 2019 18:27:17 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 27 Dec 2019 09:34:59 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 27 Dec 2019 09:35:10 +0800
From: fengping.yu <fengping.yu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH V2 1/2] Documentation: devicetree: bindings: input
Date: Fri, 27 Dec 2019 09:34:17 +0800
Message-ID: <20191227013418.19842-2-fengping.yu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191227013418.19842-1-fengping.yu@mediatek.com>
References: <20191227013418.19842-1-fengping.yu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191226_200605_442170_C8D57919 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, "fengping.yu" <fengping.yu@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

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
