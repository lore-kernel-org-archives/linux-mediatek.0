Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05211C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 07:10:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A87AA64E2E
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 07:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A87AA64E2E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QJOpjuZgjv9VQPU88cgkij54reyAydqixOiDoUotTis=; b=IvQb71qlV2JwGBn1PUeNNn9tZ
	lqUC7OGW4dkSZw0WDc336dbyZbiSdCAAf/QIj5ybkdAzjtVF/KkipSPi2qPKq2jiHKBolMTJE6fWv
	6vfsZ30xLuimlfQLnEmazZMQB3SNkTDYxwr1S7DIjnsLerbxc9/jLhWx0CuPO8E+T2iliNmeixnMf
	g4eJG4mLWz2pl94Men5JuDj/SMDlzTL2qZuL54Ak+b76V4TJJLnKQ69+SkF38L8n9YMvmBLhGms0Z
	wem/SaoAjcvVA+jor0/8TVlrQFay4KhS8hES3nAmVQO/k4arl44wmwbXzIbyFEjwQD8l5SyilR/5Y
	9JbS/kL0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6TMC-0003nc-IS; Mon, 01 Feb 2021 07:10:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6TM4-0003ij-Cz; Mon, 01 Feb 2021 07:10:37 +0000
X-UUID: 13a30c46370f46fd9adb9b31e6392ed3-20210131
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=pgZiE9+1LJKLEDXqXETz5cOU5JWgX24bYc4IhfX8Z8Y=; 
 b=I+X35vWBGmaB+19kTWbnbYzMok1wVQgPrmGjGVWoHWdQ8vcePh7yzmFK6X5eTOYrpQY+PVBnJ1oN0Wb/+BJOWaK64GlSKx2nld5UIKl3UeqMznHC9MtrQFmOJuEb7JSGRoR9Ssq40CcKJGFKkEBlxgRD2qJrC30pGwedUQ8CcO0=;
X-UUID: 13a30c46370f46fd9adb9b31e6392ed3-20210131
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 793777186; Sun, 31 Jan 2021 23:10:31 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 31 Jan 2021 23:00:37 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Feb 2021 15:00:31 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 1 Feb 2021 15:00:31 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH next v3 16/16] arm: dts: mt2701: harmonize node names and
 compatibles
Date: Mon, 1 Feb 2021 15:00:16 +0800
Message-ID: <20210201070016.41721-16-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210201070016.41721-1-chunfeng.yun@mediatek.com>
References: <20210201070016.41721-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: A173D46B569DFA7EA8FA8ACCEBACDF558BD2FD648ABFF54378E075D0DEF16A5E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_021036_602268_3DD50534 
X-CRM114-Status: UNSURE (   9.84  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min Guo <min.guo@mediatek.com>,
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This is used to fix dtbs_check warning

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2~v3: no changes
---
 arch/arm/boot/dts/mt2701.dtsi | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index fade14284017..4776f85d6d5b 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -607,7 +607,7 @@
 	};
 
 	usb0: usb@1a1c0000 {
-		compatible = "mediatek,mt8173-xhci";
+		compatible = "mediatek,mt2701-xhci", "mediatek,mtk-xhci";
 		reg = <0 0x1a1c0000 0 0x1000>,
 		      <0 0x1a1c4700 0 0x0100>;
 		reg-names = "mac", "ippc";
@@ -620,8 +620,9 @@
 		status = "disabled";
 	};
 
-	u3phy0: usb-phy@1a1c4000 {
-		compatible = "mediatek,mt2701-u3phy";
+	u3phy0: t-phy@1a1c4000 {
+		compatible = "mediatek,mt2701-tphy",
+			     "mediatek,generic-tphy-v1";
 		reg = <0 0x1a1c4000 0 0x0700>;
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -646,7 +647,7 @@
 	};
 
 	usb1: usb@1a240000 {
-		compatible = "mediatek,mt8173-xhci";
+		compatible = "mediatek,mt2701-xhci", "mediatek,mtk-xhci";
 		reg = <0 0x1a240000 0 0x1000>,
 		      <0 0x1a244700 0 0x0100>;
 		reg-names = "mac", "ippc";
@@ -659,8 +660,9 @@
 		status = "disabled";
 	};
 
-	u3phy1: usb-phy@1a244000 {
-		compatible = "mediatek,mt2701-u3phy";
+	u3phy1: t-phy@1a244000 {
+		compatible = "mediatek,mt2701-tphy",
+			     "mediatek,generic-tphy-v1";
 		reg = <0 0x1a244000 0 0x0700>;
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -700,8 +702,9 @@
 		status = "disabled";
 	};
 
-	u2phy0: usb-phy@11210000 {
-		compatible = "mediatek,generic-tphy-v1";
+	u2phy0: t-phy@11210000 {
+		compatible = "mediatek,mt2701-tphy",
+			     "mediatek,generic-tphy-v1";
 		reg = <0 0x11210000 0 0x0800>;
 		#address-cells = <2>;
 		#size-cells = <2>;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
