Return-Path: <SRS0=PJ0l=5O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11879C43331
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Mar 2020 22:54:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D558820748
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Mar 2020 22:54:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VQYnzDBw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D558820748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KK2dXckhGUxA8ZmkGed134Ln3twVgCDRPzFYP7OWYUc=; b=VQYnzDBwtymc1N
	aw8r763T8MOK3MOQaqBn7cAwOScKTghX9qhbqV1wjjvG+BYu39HaKiZSmPSPT8g0HupjjUlXKp9nL
	pEtKmmQGTZeedTUE2NlpWtMR21UJLPVjou3MmFIS5eWZCThl717zKR+XqEQyS40jxjAAXGmYTgmtU
	JZJNVYcj+70WJNd38XRmSCYepQgIpJvrk6Ol33vZfVxiVrcARUNVQB69ouicF9UslVW4400mjRmuy
	l7TlM3WveG/8VHqo5uRYDEg5uOUr5Ca8qecL+dDBkwu3ggjQRfNiN+ySgdTew2u/6VtU60Tf/LHq/
	Y6P56XvT+WCBsJ4uzP6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jIgom-0006cc-VN; Sun, 29 Mar 2020 22:54:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jIgoe-0006W9-38; Sun, 29 Mar 2020 22:54:05 +0000
X-UUID: dbfbd851ea8a4d02b54439a7c09eafe2-20200329
X-UUID: dbfbd851ea8a4d02b54439a7c09eafe2-20200329
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@kernel.org>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1195821715; Sun, 29 Mar 2020 14:53:57 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 29 Mar 2020 15:53:54 -0700
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 30 Mar 2020 06:53:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 30 Mar 2020 06:53:42 +0800
From: Ryder Lee <ryder.lee@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] arm64: dts: mt7622: add built-in Wi-Fi device nodes
Date: Mon, 30 Mar 2020 06:53:40 +0800
Message-ID: <315346e1d6fa00e5a0d7a8216982bf723af8e985.1584862530.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200329_155404_138376_326CED30 
X-CRM114-Status: UNSURE (   8.15  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Ryder Lee <ryder.lee@mediatek.com>

This enables built-in 802.11n Wi-Fi support. It's 2.4GHz only.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts     |  4 ++++
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts          |  4 ++++
 arch/arm64/boot/dts/mediatek/mt7622.dtsi              | 11 +++++++++++
 3 files changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index 83e10591e0e5..d174ad214857 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -543,3 +543,7 @@
 	pinctrl-0 = <&watchdog_pins>;
 	status = "okay";
 };
+
+&wmac {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
index 3f783348c66a..0b4de627f96e 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -506,3 +506,7 @@
 	pinctrl-0 = <&watchdog_pins>;
 	status = "okay";
 };
+
+&wmac {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index dac51e98204c..03b14a5ab7f3 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -699,6 +699,17 @@
 		status = "disabled";
 	};
 
+	wmac: wmac@18000000 {
+		compatible = "mediatek,mt7622-wmac";
+		reg = <0 0x18000000 0 0x100000>;
+		interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_LOW>;
+
+		mediatek,infracfg = <&infracfg>;
+		status = "disabled";
+
+		power-domains = <&scpsys MT7622_POWER_DOMAIN_WB>;
+	};
+
 	ssusbsys: ssusbsys@1a000000 {
 		compatible = "mediatek,mt7622-ssusbsys",
 			     "syscon";
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
