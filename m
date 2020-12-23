Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99AD7C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 04:35:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4304220936
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 04:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4304220936
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YoGMjfcKF4HZjK4bXu55thShm3KecUMsxALbt7AtooA=; b=ev/gaTZqNNEEfQ/0ddhQEh4hao
	OZFXhWcNatrnwLEOduEs7IMiZZR/qCB2Ue3YV15rwUJJ7N2bSeysF2hmT+JdE831N374P9hzXL3Cy
	mwRJb2zG0is8lPfP0stGHuS+CYUmrzbMni39Syw89uVpKISiWUVGS9bZ2eCRygRub+bFBsuXrm0sc
	ham8gRG3+k5jJ8p99K3S2pPySPU96+hcDWquNVNa1p/6kGGTiIYe9Tm+tsyYHEnqR/IkUIU3eLWXh
	GfdLb2RQLm+64z+PJlb5gQ3hHj3tDtHBPzP0/Ronv+b7JztIuGGuI/Gd89lUEowQ2aZpraokeoaxZ
	p3yU7K3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krvru-0006JW-Si; Wed, 23 Dec 2020 04:35:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krvrs-0006It-UO; Wed, 23 Dec 2020 04:35:22 +0000
X-UUID: b22f988fe2e143b3b9bc555772cee0e4-20201222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=LJgELmTd4q7VWyG29TDl3bEgdv3YWbzNvEWHTXQHjzo=; 
 b=CYdpZY2/0EAAChrao4PCt9uJjIP170CYPRmKphVHE4TpzU7fSznqGpOla1Lbroo7EL1N2BQls4WgjonYdI6HdsJrDO8F0l0CK0GhpLyUjEwz1GT+npsUwKfsSQsKK84qtRx8RW9tVE9H4PMr8znv4plT9ARzKm4e/oDxIKbreBE=;
X-UUID: b22f988fe2e143b3b9bc555772cee0e4-20201222
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <bayi.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2093186970; Tue, 22 Dec 2020 20:23:50 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 20:23:03 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Dec 2020 12:23:04 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Dec 2020 12:23:02 +0800
From: Bayi Cheng <bayi.cheng@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v2] arm64: dts: mt8192: add nor_flash device node
Date: Wed, 23 Dec 2020 12:22:59 +0800
Message-ID: <1608697379-22025-1-git-send-email-bayi.cheng@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_233521_198067_BC43F49B 
X-CRM114-Status: GOOD (  11.67  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, bayi cheng <bayi.cheng@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Chuanhong Guo <gch981213@gmail.com>, Ikjoon Jang <ikjn@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: bayi cheng <bayi.cheng@mediatek.com>

add nor_flash device node

Change-Id: I79f0228529bd8a33e5f354b7a861a4ec8d92e9ba
Signed-off-by: bayi cheng <bayi.cheng@mediatek.com>
---
Change in v2:
1: add dependent patch of arm soc
2: change compatible name

Depends on:
https://patchwork.kernel.org/patch/11713559/
[v4,1/3] arm64: dts: Add Mediatek SoC MT8192 and evaluation board dts and Makefile
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index e12e024..751c877 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -379,6 +379,19 @@
 			status = "disabled";
 		};
 
+		nor_flash: spi@11234000 {
+			compatible = "mediatek,mt8192-nor";
+			reg = <0 0x11234000 0 0xe0>;
+			interrupts = <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&clk26m>,
+				 <&clk26m>,
+				 <&clk26m>;
+			clock-names = "spi", "sf", "axi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disable";
+		};
+
 		i2c3: i2c3@11cb0000 {
 			compatible = "mediatek,mt8192-i2c";
 			reg = <0 0x11cb0000 0 0x1000>,
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
