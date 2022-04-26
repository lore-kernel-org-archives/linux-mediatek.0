Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1D6C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 19:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dFaRcznKq5BmqHaEbniBPmn578yDsOdO/02DcQFrWC4=; b=jCGTewN+0vC1yH
	2kJDb+Av6ceK8d0itdD165oPsKQQN1+pYaO8gPJ1DHHxV67x4vWRJCEgvSH88hnyzPekon91xwd/5
	rjDL5aNNRxnUwaMy3rB6qSPyn7BcLsT6RKaoQeZJfS1/7Xfe4zEBlReIvlBy4o0ZLO6tnAxDCWBrE
	kQmSmKr4eGFlEKDIv7nHuBKZE4ZnHa704HIkng5+YYuruLMeFdawgpvu9BOXArwiV/Q4qUq5x3nMt
	vy9YPdNWJ/CLESA0DZpqh9NyZljemAdKV3I9ibs5ym9El+521VNF1P1toB3xsMsiyfEjfuxTthV+0
	gVfI+0Qkj6w61GhaxEtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njRE4-00G056-7Z; Tue, 26 Apr 2022 19:51:56 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njRE1-00G03h-9H; Tue, 26 Apr 2022 19:51:55 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1njRDu-0006aF-4F; Tue, 26 Apr 2022 21:51:46 +0200
Date: Tue, 26 Apr 2022 20:51:36 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] arm64: dts: mediatek: mt7622: fix GICv2 range
Message-ID: <YmhNSLgp/yg8Vr1F@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_125153_359242_EA3D452C 
X-CRM114-Status: GOOD (  12.45  )
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

With the current range specified for the CPU interface there is an
error message at boot:

GIC: GICv2 detected, but range too small and irqchip.gicv2_force_probe not set

Setting irqchip.gicv2_force_probe=1 in bootargs results in:

GIC: Aliased GICv2 at 0x0000000010320000, trying to find the canonical range over 128kB
GIC: Adjusting CPU interface base to 0x000000001032f000
GIC: Using split EOI/Deactivate mode

Using the adjusted CPU interface base and 8K size results in only the
final line remaining and fully working system as well as /proc/interrupts
showing additional IPI3,4,5,6:

IPI3:         0          0       CPU stop (for crash dump) interrupts
IPI4:         0          0       Timer broadcast interrupts
IPI5:         0          0       IRQ work interrupts
IPI6:         0          0       CPU wake-up interrupts

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 8c2563a3919a40..759803c2ce1577 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -332,7 +332,7 @@ gic: interrupt-controller@10300000 {
 		#interrupt-cells = <3>;
 		interrupt-parent = <&gic>;
 		reg = <0 0x10310000 0 0x1000>,
-		      <0 0x10320000 0 0x1000>,
+		      <0 0x1032f000 0 0x2000>,
 		      <0 0x10340000 0 0x2000>,
 		      <0 0x10360000 0 0x2000>;
 	};
-- 
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
