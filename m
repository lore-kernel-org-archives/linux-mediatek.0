Return-Path: <SRS0=NAie=2C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA014C43603
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2019 02:42:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60CFF206C3
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2019 02:42:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kf/CHgfA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="rz5Ykv9S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60CFF206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rsIpSznzjApw5I4B7+HufbeqknruR9eZznTuDykZqWI=; b=kf/CHgfA4Vmwpn
	uTLWJLPIZR3TmbA47oK8tlHfCvPP9SohEO70QPkAFLLgKCQu9K+/EPLqR9bw6JUFxPMI/Jx4o3ohN
	EvNV5k721+LCDXK/XP/IW9jM5MI6HA2yRzJOTf4nPtQ7xQSgBUxDKv51zDJX1wfpNJuga9yEC6sZe
	j43CTPuhm1LZl4f8D2kBjAvUcqUf7/1J8EjwCyMgKnMkGnyb5P/RmkGfPpxU160z9NFMZJErcnet4
	Oq4JDJHdNSdwsFHyUqtYKE1bjAPbL43wh2aXFI0uPloAJUZ98oy3io32TKciVAk5lnUfQVKFwgeEW
	gG+Wb8ZSz9vrNex5wrvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifERB-0003Zz-Nq; Thu, 12 Dec 2019 02:42:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifEQj-00037b-3r; Thu, 12 Dec 2019 02:42:18 +0000
X-UUID: 0aea8efd06b54fb3bfb945e8e7d17ba5-20191211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=VDJkFfjQ2A7EK11jJQUQ+/nDT660s5v+Di1gVGNcQ80=; 
 b=rz5Ykv9SIMmmbMfnjh0w46ssKE14Q6Q1Zc0jK98bUnNHdjHrhdB7UJKi0w5J6iOmN93+SfrPFHMrFYPoNt+U4iBIUwzTspTaWKX8KesO/vhbhPRv+3j8bxMXrVEnIhPFekFUHYzHcg+9huYRAbgizBm7zzIA31NX9G8TPVqRmFM=;
X-UUID: 0aea8efd06b54fb3bfb945e8e7d17ba5-20191211
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1730419965; Wed, 11 Dec 2019 18:42:12 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Dec 2019 18:43:12 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 12 Dec 2019 10:42:40 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 12 Dec 2019 10:42:05 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 2/2] net-next: dt-binding: dwmac-mediatek: add more
 description for RMII
Date: Thu, 12 Dec 2019 10:41:45 +0800
Message-ID: <20191212024145.21752-3-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191212024145.21752-1-biao.huang@mediatek.com>
References: <20191212024145.21752-1-biao.huang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_184217_300626_B072AFC4 
X-CRM114-Status: GOOD (  12.38  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Biao Huang <biao.huang@mediatek.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jose
 Abreu <joabreu@synopsys.com>, linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MT2712 SoC can provides RMII reference clock,
so add corresponding description in dt-binding.

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
---
 .../devicetree/bindings/net/mediatek-dwmac.txt  | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mediatek-dwmac.txt b/Documentation/devicetree/bindings/net/mediatek-dwmac.txt
index 8a08621a5b54..34f692ea0406 100644
--- a/Documentation/devicetree/bindings/net/mediatek-dwmac.txt
+++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.txt
@@ -14,7 +14,9 @@ Required properties:
 	Should be "macirq" for the main MAC IRQ
 - clocks: Must contain a phandle for each entry in clock-names.
 - clock-names: The name of the clock listed in the clocks property. These are
-	"axi", "apb", "mac_main", "ptp_ref" for MT2712 SoC
+	"axi", "apb", "mac_main", "ptp_ref" for MT2712 SoC.
+	"rmii_internal" is optional, only for RMII when the reference clock is
+	from MT2712 SoC.
 - mac-address: See ethernet.txt in the same directory
 - phy-mode: See ethernet.txt in the same directory
 - mediatek,pericfg: A phandle to the syscon node that control ethernet
@@ -23,8 +25,10 @@ Required properties:
 Optional properties:
 - mediatek,tx-delay-ps: TX clock delay macro value. Default is 0.
 	It should be defined for RGMII/MII interface.
+	It should be defined for RMII interface when the reference clock is from MT2712 SoC.
 - mediatek,rx-delay-ps: RX clock delay macro value. Default is 0.
-	It should be defined for RGMII/MII/RMII interface.
+	It should be defined for RGMII/MII interface.
+	It should be defined for RMII interface.
 Both delay properties need to be a multiple of 170 for RGMII interface,
 or will round down. Range 0~31*170.
 Both delay properties need to be a multiple of 550 for MII/RMII interface,
@@ -34,13 +38,20 @@ or will round down. Range 0~31*550.
 	reference clock, which is from external PHYs, is connected to RXC pin
 	on MT2712 SoC.
 	Otherwise, is connected to TXC pin.
+- mediatek,rmii-clk-from-mac: boolean property, if present indicates that
+	MT2712 SoC provides the RMII reference clock, which outputs to TXC pin only.
 - mediatek,txc-inverse: boolean property, if present indicates that
 	1. tx clock will be inversed in MII/RGMII case,
 	2. tx clock inside MAC will be inversed relative to reference clock
 	   which is from external PHYs in RMII case, and it rarely happen.
+	3. the reference clock, which outputs to TXC pin will be inversed in RMII case
+	   when the reference clock is from MT2712 SoC.
 - mediatek,rxc-inverse: boolean property, if present indicates that
 	1. rx clock will be inversed in MII/RGMII case.
-	2. reference clock will be inversed when arrived at MAC in RMII case.
+	2. reference clock will be inversed when arrived at MAC in RMII case, when
+	   the reference clock is from external PHYs.
+	3. the inside clock, which be sent to MAC, will be inversed in RMII case when
+	   the reference clock is from MT2712 SoC.
 - assigned-clocks: mac_main and ptp_ref clocks
 - assigned-clock-parents: parent clocks of the assigned clocks
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
