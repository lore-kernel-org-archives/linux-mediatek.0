Return-Path: <SRS0=dK9R=IB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C9D6C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 16:30:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21E36601FD
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 16:30:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21E36601FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IS/NY7swsefsQt206/wM20pjcii+2hfdyI4S75cN3J8=; b=Zxdi+vTAvznlJq47YvtwZcsLXP
	fJdTViA2l0qUjHOSYVnK6Y1o10lEjC4dO0bwsIUid9vWOAixg+t3E0abW/rPwuxVZyOK3vo6e+LS3
	idEArOVsSQc36+mbABPvs5RUOcEoC4sGMFkcMffWQXK5iQJZG8uv4taDvSeVlks5z+77OPxsMYu2A
	KL2qkr7wooSnGbP3vehRSNeBFOtGQEWC2L2MoVmyLb2PmXnONN4bGQApm3T44Abf/h7Pr5mCsYugV
	dtDkX764Mde+7kcjrFUdptHRPAtxAE92vjukeRbYJS0rLgDPorpWuBZOuuCVIOMlHMMAvySbiGsR6
	ljIGRgjw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHUNp-005bmS-Rz; Wed, 03 Mar 2021 16:29:57 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSpk-005E1H-0l; Wed, 03 Mar 2021 14:50:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=aS6Eu0HxJ5IATyvIgZsVEr8K1NWwHLbecPEJtee3MHg=; b=u3HxtyQ6OTiyIyNcGIvVCRRhTH
 EvQ1/gdiEudCiaZ3LYPcBpCNWq3/GA7fZdi/XM7h++dKcQKXA4H0yEWmouFgIO5QmvMqnmJOwMy7l
 8ZEw1SylPZVi5HNQsOXaB76t3z131NlIQcW6NVEgJlTw23H9NDsVjW9mIRD5VTR+WYPpLi+QSwHlQ
 gnCWh0IjUtME8xWLkLmoUQMyhuD+vo1ugxVDSqhR4JkND1KodVz+cQ2kip7k1Q8ngC/V4u99634qW
 FJkHUEfOzY68zwgah4ZL/5iJHpHH4pQEkYE3T/bwNsOPiIsod69D/7NTK5dCw4LbHTFDoxzsNA+oa
 +/8+xclw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHMbk-001nGm-OC; Wed, 03 Mar 2021 08:11:49 +0000
X-UUID: 663d940e3a294e27947a6c6166614a30-20210303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=aS6Eu0HxJ5IATyvIgZsVEr8K1NWwHLbecPEJtee3MHg=; 
 b=q0APLMPipiSW4kG8Wjf6TSzwko+A2Wo3SsRzqXUC+PnrVQjH+IJWsWQndtleh3QZEGmxQZm9qLCiC1u1zzYw2aNURgqqSqESKYwqCMAYmROeCjUUkq0k0QRqJvtDhzB4RZFOevEgiiMSltFhit98bxrOMVZVl1YgriuOZV4OGdo=;
X-UUID: 663d940e3a294e27947a6c6166614a30-20210303
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <vic.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1164406261; Wed, 03 Mar 2021 00:11:33 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Mar 2021 00:10:19 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Mar 2021 16:10:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 3 Mar 2021 16:10:12 +0800
From: Vic Wu <vic.wu@mediatek.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
CC: "David S . Miller" <davem@davemloft.net>, Ryder Lee
 <ryder.lee@mediatek.com>, <linux-crypto@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Vic Wu <vic.wu@mediatek.com>
Subject: [PATCH] crypto: mediatek - remove obsolete documentation
Date: Wed, 3 Mar 2021 16:09:23 +0800
Message-ID: <20210303080923.16761-1-vic.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_081149_486905_4CAB6E01 
X-CRM114-Status: GOOD (  13.12  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The crypto mediatek driver has been replaced by the inside-secure driver now.
Remove DT bindings documentation and update crypto engine nodes to the mt7623.dtsi files.

Signed-off-by: Vic Wu <vic.wu@mediatek.com>
Acked-by: Ryder Lee <ryder.lee@mediatek.com>
---
 Documentation/devicetree/bindings/crypto/mediatek-crypto.txt       | 25 -------------------
 arch/arm/boot/dts/mt7623.dtsi                 |  8 +++---
 2 files changed, 3 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/crypto/mediatek-crypto.txt

diff --git a/Documentation/devicetree/bindings/crypto/mediatek-crypto.txt b/Documentation/devicetree/bindings/crypto/mediatek-crypto.txt
deleted file mode 100644
index 450da3661cad..000000000000
--- a/Documentation/devicetree/bindings/crypto/mediatek-crypto.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-MediaTek cryptographic accelerators
-
-Required properties:
-- compatible: Should be "mediatek,eip97-crypto"
-- reg: Address and length of the register set for the device
-- interrupts: Should contain the five crypto engines interrupts in numeric
-	order. These are global system and four descriptor rings.
-- clocks: the clock used by the core
-- clock-names: Must contain "cryp".
-- power-domains: Must contain a reference to the PM domain.
-
-
-Example:
-	crypto: crypto@1b240000 {
-		compatible = "mediatek,eip97-crypto";
-		reg = <0 0x1b240000 0 0x20000>;
-		interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_SPI 83 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_SPI 84 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_SPI 91 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_SPI 97 IRQ_TYPE_LEVEL_LOW>;
-		clocks = <&ethsys CLK_ETHSYS_CRYPTO>;
-		clock-names = "cryp";
-		power-domains = <&scpsys MT2701_POWER_DOMAIN_ETH>;
-	};
diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index aea6809500d7..25e3f3b04123 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -949,16 +949,14 @@
 	};
 
 	crypto: crypto@1b240000 {
-		compatible = "mediatek,eip97-crypto";
+		compatible = "inside-secure,safexcel-eip97";
 		reg = <0 0x1b240000 0 0x20000>;
 		interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_SPI 83 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_SPI 84 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_SPI 91 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_SPI 97 IRQ_TYPE_LEVEL_LOW>;
+			     <GIC_SPI 91 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "ring0", "ring1", "ring2", "ring3";
 		clocks = <&ethsys CLK_ETHSYS_CRYPTO>;
-		clock-names = "cryp";
-		power-domains = <&scpsys MT2701_POWER_DOMAIN_ETH>;
 		status = "disabled";
 	};
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
