Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB555C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 09:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8daaeKhBztjo9uw6x8rEOnZAoSNZgBc/Daqp05Q7XsQ=; b=B5l8l5EVjQGv3I
	O2LZmmubciLc0CasMAc0cci1NgSQsYSnUYpujPuWyiSosJLCt4rCwHjZubbuIvFDZYfjWA1/O4tr+
	CnMw6VFDBrv2XKwx/slaXqKA0kaZcYEDPN4Iv2dVeSaBVWc1olsFpn8dqyWVcARK3f3PKVM2nVCcU
	P1Tq2f73Extfqyivy2gbwLlhp61PB3DBSVHWCaMcxpSo63PKZi6SuGL+b0JovnP5O6GxvX9ku7JkC
	fA2yL0tj8S1kcub/wMksXxK2a2Uh+UTC06yYBt1T6OlnWStJyTjJ09Y/ZHtCrbXVSD+GNijfHB0N7
	duJTLIeYW0nWB2YJBwzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKzdy-00DZxI-FY; Fri, 18 Feb 2022 09:33:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKzXS-00DWbl-JV; Fri, 18 Feb 2022 09:26:56 +0000
X-UUID: 14176fd1280b4a3ba73eea26ed0cec28-20220218
X-UUID: 14176fd1280b4a3ba73eea26ed0cec28-20220218
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 825644431; Fri, 18 Feb 2022 02:26:47 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Feb 2022 01:16:52 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 18 Feb 2022 17:16:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 18 Feb 2022 17:16:45 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, --to=Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Chen-Yu Tsai" <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v2 09/23] arm64: dts: mt8192: Add infracfg_rst node
Date: Fri, 18 Feb 2022 17:16:19 +0800
Message-ID: <20220218091633.9368-10-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_012654_680910_F354E4B6 
X-CRM114-Status: GOOD (  12.43  )
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

add infracfg_rst node for mt8192 SoC.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index f93fe3779161..a935a22babbb 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/power/mt8192-power.h>
+#include <dt-bindings/reset/ti-syscon.h>
 
 / {
 	compatible = "mediatek,mt8192";
@@ -267,10 +268,23 @@
 			#clock-cells = <1>;
 		};
 
-		infracfg: syscon@10001000 {
-			compatible = "mediatek,mt8192-infracfg", "syscon";
+		infracfg: infracfg@10001000 {
+			compatible = "mediatek,mt8192-infracfg", "syscon", "simple-mfd";
 			reg = <0 0x10001000 0 0x1000>;
 			#clock-cells = <1>;
+
+			infracfg_rst: reset-controller {
+				compatible = "ti,syscon-reset";
+				#reset-cells = <1>;
+
+				ti,reset-bits = <
+					0x120 0 0x124 0 0 0	(ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* 0: lvts_ap */
+					0x730 12 0x734 12 0 0	(ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* 1: lvts_mcu */
+					0x140 15 0x144 15 0 0	(ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* 2: pcie phy */
+					0x730 1 0x734 1 0 0	(ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* 3: pcie top */
+					0x150 5 0x154 5 0 0	(ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* 4: svs */
+				>;
+			};
 		};
 
 		pericfg: syscon@10003000 {
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
