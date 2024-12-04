Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7992DE77170
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Dec 2024 19:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hA1Zct/rwnmvySI7KTOv2r1Q/QKt2sFeFNVohs4OzEc=; b=vm5mZyGSHIJdk5lA3L9znhnzJN
	0eMZvR7/w4e5pruEY+W30ckb9yXWAlSfxEbdtKWpxUaP9UCgjg4TtwxRR83jqL3dQohUHtqIs72/h
	Wb3Sh6n4n8rNU/CH+7h3YzYTUFMASPcoPpNrtycChABsdVKOwXnjF7ttxrU2JKOURaNnIPkP6hJyc
	iGuFU/4DitLGWvwA68cCTqMOiLC+dcfQPMvXG9cJFjcDnzM/RxTZ43ipJEyGZJB+fyJGBSr1uEhpy
	gwVa+pIZEC2sQdsKnupRBcrO6NPxjQYnVKbZ9P0EmAI6psQulUqtIMIy21T3mEjc6ckjETA75BN6b
	rP24qiZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIujP-0000000DcYx-2iK6;
	Wed, 04 Dec 2024 19:08:15 +0000
Received: from out-172.mta1.migadu.com ([2001:41d0:203:375::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIuiG-0000000DcBM-0Kg3
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Dec 2024 19:07:06 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1733339221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hA1Zct/rwnmvySI7KTOv2r1Q/QKt2sFeFNVohs4OzEc=;
	b=KgFfpaMTyPV/Z3goJ/i9j09JOF0W5QDtzKQn2y8GUwYPIiLo3dfhtb03ZNguFxRFE9//Qr
	FOc4bBjTIxsPYr6NMWQ5UzcaUFsbdiEn3s0kbFQfAS2ct8HbpxbjTsUsIQL1LvPxVUd/0P
	idyWpf1FbvTzeag09O55Dndz/Wj06417MtAfueQ67q/XWSxrFALUCeMLax7B9k4lEqZ4dc
	wbeLS8Kg9NOyHgUKf9/oQMTo3GL+41NEC4S1NJ1hFfnHTU8TXprC5XwgCDhgWBG/WHUf/p
	F/xUyctTtT0EpY/6vRqSQb1VhVI659gqcIernJASTecdHYxt8/vZZLdho+IGlQ==
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <fparent@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/5] arm64: dts: mediatek: mt8516: fix GICv2 range
Date: Wed,  4 Dec 2024 16:05:04 -0300
Message-ID: <20241204190524.21862-2-val@packett.cool>
In-Reply-To: <20241204190524.21862-1-val@packett.cool>
References: <20241204190524.21862-1-val@packett.cool>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_110704_253774_7FCEEBCA 
X-CRM114-Status: GOOD (  11.18  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On the MT8167 which is based on the MT8516 DTS, the following error
was appearing on boot, breaking interrupt operation:

GICv2 detected, but range too small and irqchip.gicv2_force_probe not set

Similar to what's been proposed for MT7622 which has the same issue,
fix by using the range reported by force_probe.

Link: https://lore.kernel.org/all/YmhNSLgp%2Fyg8Vr1F@makrotopia.org/
Fixes: 5236347bde42 ("arm64: dts: mediatek: add dtsi for MT8516")
Signed-off-by: Val Packett <val@packett.cool>
---
 arch/arm64/boot/dts/mediatek/mt8516.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index d0b03dc4d3f4..444429341302 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -268,7 +268,7 @@ gic: interrupt-controller@10310000 {
 			interrupt-parent = <&gic>;
 			interrupt-controller;
 			reg = <0 0x10310000 0 0x1000>,
-			      <0 0x10320000 0 0x1000>,
+			      <0 0x1032f000 0 0x2000>,
 			      <0 0x10340000 0 0x2000>,
 			      <0 0x10360000 0 0x2000>;
 			interrupts = <GIC_PPI 9
-- 
2.47.1


