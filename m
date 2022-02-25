Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B109C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 02:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1qlDtgQ9wCFuj81IiGhUzWPmE0vMhDfYQONcRE21h4c=; b=vA2x2OpjqF4dkA
	JD800oFliP1kjKF0TKD2BQp5R9f2CWXCtrldAlFvO8r7FryP7hh0iCnsuvpVBViUl7bQNGEK9FsLg
	p7oX6DwOlxvYxTJoifWAFjOERtxbmBbGeqRtqb0KlVYtKJmpTImtVPcXirWhi2ydMFyHECGHB82dt
	zls8Q4EnXCD+bS8Zd3q9FH0KE19wDCqwQGEMHnpyJ+KlvQAtN9xehMYJOlt7n3nrQP6+n0lwut23k
	YXSFEuUtUDtj8yKIV+csrhIoaTeDyCup71Y/cs6aswh1e6eCqo2RjXeUINc2wLPFeKCcLI5WShbZP
	GBb3Gfe35MsySo6J0sHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNPzX-002xrB-9n; Fri, 25 Feb 2022 02:05:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNPzK-002xpm-8e; Fri, 25 Feb 2022 02:05:45 +0000
X-UUID: 95652a0169d740efa4c53ade4bc630f2-20220224
X-UUID: 95652a0169d740efa4c53ade4bc630f2-20220224
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 338333372; Thu, 24 Feb 2022 19:02:44 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Feb 2022 18:02:42 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 25 Feb 2022 10:02:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 25 Feb 2022 10:02:40 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>,
 <maciej.szmigiero@oracle.com>, David Matlack <dmatlack@google.com>, "Jing
 Zhang" <jingzhangos@google.com>, Marc Zyngier <maz@kernel.org>, "Bartosz
 Golaszewski" <bgolaszewski@baylibre.com>, Sean Wang <sean.wang@mediatek.com>, 
 Tinghan Shen <tinghan.shen@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <ryder.lee@kernel.org>,
 <wenst@chromium.org>, <chunfeng.yun@mediatek.com>, Seiya Wang
 <seiya.wang@mediatek.com>, <moudy.ho@mediatek.com>,
 <roy-cw.yeh@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <Macpaul.Lin@mediatek.com>, jason-jh.lin
 <jason-jh.lin@mediatek.com>
Subject: [PATCH v2] arm64: dts: mt8195: add gce node
Date: Fri, 25 Feb 2022 10:02:30 +0800
Message-ID: <20220225020230.24472-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_180542_337864_1743BF7D 
X-CRM114-Status: GOOD (  11.36  )
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

Add gce node and gce alias on mt8195 dts file.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
This patch is based on [1]

[1] arm64: dts: Add mediatek SoC mt8195 and evaluation board
- https://patchwork.kernel.org/project/linux-mediatek/patch/20220112114724.1953-4-tinghan.shen@mediatek.com/
--
Hi Angelo,

I'm sorry I couldn't find your last reply mail, so I reply you so late.

Thanks for the reviews!
I have fixed them.

Regards,
Jason-JH.Lin
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index a363e82f6988..75422c498309 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -6,6 +6,7 @@
 
 /dts-v1/;
 #include <dt-bindings/clock/mt8195-clk.h>
+#include <dt-bindings/gce/mt8195-gce.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/phy/phy.h>
@@ -18,6 +19,11 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		gce0 = &gce0;
+		gce1 = &gce1;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -367,6 +373,22 @@
 			assigned-clock-parents = <&topckgen CLK_TOP_ULPOSC1_D10>;
 		};
 
+		gce0: mailbox@10320000 {
+			compatible = "mediatek,mt8195-gce";
+			reg = <0 0x10320000 0 0x4000>;
+			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH 0>;
+			#mbox-cells = <2>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_GCE>;
+		};
+
+		gce1: mailbox@10330000 {
+			compatible = "mediatek,mt8195-gce";
+			reg = <0 0x10330000 0 0x4000>;
+			interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH 0>;
+			#mbox-cells = <2>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_GCE2>;
+		};
+
 		scp_adsp: clock-controller@10720000 {
 			compatible = "mediatek,mt8195-scp_adsp";
 			reg = <0 0x10720000 0 0x1000>;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
