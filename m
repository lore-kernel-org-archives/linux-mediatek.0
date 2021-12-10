Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEDAC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 17:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iifvWlqVfd/kZ9ihAmyuUixLiC1CfgbXTMNxLQOwpb8=; b=VB1NfsiQVpYbE5
	hPpcxZhNIezc48LHI6cYsosm/PmhtKxCOyZYGPw6+BviehwiKykL2iyAKckW1NHBZeILV/wFvF/54
	crjtotrpkoOWtdh3dSPSpIgQmkwcUVsGxFRC2jttVSe6w80NESwaDeibVXbKTHRzpoUBPEhTe8ikY
	LVftBm4X0Kud393ROcsg9FGwxMJwxoYLG0WLNPpsRrcjt0mWTBWcxspvVSsotgorYedfmH7f8Nvzm
	kXLOrpDQmm8SQZzgGcrWG/TH1CcbaEsFoWORUqETvKimxZUzqy+2BQ/GQ4eaqtvGMIWUpAQ/lmmtU
	XN2VNJzin2CDkRERccPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvk4x-00313X-QN; Fri, 10 Dec 2021 17:53:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvk4W-0030r9-11; Fri, 10 Dec 2021 17:52:41 +0000
X-UUID: 9d5922e0ef184e90b5328748da47e475-20211210
X-UUID: 9d5922e0ef184e90b5328748da47e475-20211210
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1630476285; Fri, 10 Dec 2021 10:52:38 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Dec 2021 09:52:37 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Dec 2021 01:52:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Dec 2021 01:52:37 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Flora Fu <flora.fu@mediatek.com>, "JB
 Tsai" <jb.tsai@mediatek.com>
Subject: [PATCH 09/12] arm64: dts: mt8195: Add apu tinysys node
Date: Sat, 11 Dec 2021 01:52:20 +0800
Message-ID: <20211210175223.31131-10-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211210175223.31131-1-flora.fu@mediatek.com>
References: <20211210175223.31131-1-flora.fu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_095240_116494_B52090D9 
X-CRM114-Status: UNSURE (   8.72  )
X-CRM114-Notice: Please train this message.
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

Add node for APU tinysys.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>

---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 35 ++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 2f14e3326a2c..8f4f56e2f08c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1368,6 +1368,41 @@
 			#mbox-cells = <1>;
 		};
 
+		apusys_rv: apusys_rv@19001000 {
+			compatible = "mediatek,mt8195-apusys-rv", "simple-mfd";
+			reg = <0 0x19000000 0 0x1000>,
+			      <0 0x19001000 0 0x1000>,
+			      <0 0x19002000 0 0x10>;
+			reg-names = "apu_mbox",
+				    "md32_sysctrl",
+				    "apu_wdt";
+			power-domains = <&apuspm 0>;
+			iommus = <&iommu_apu0 IOMMU_PORT_APU_DATA>;
+			interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "apu_wdt";
+			mboxes = <&apu_mailbox 0>;
+
+			apu_ctrl {
+				compatible = "mediatek,apu-ctrl-rpmsg";
+				mediatek,rpmsg-name = "apu-ctrl-rpmsg";
+			};
+
+			apu_pwr_tx {
+				compatible = "mediatek,apupwr-tx-rpmsg";
+				mediatek,rpmsg-name = "apupwr-tx-rpmsg";
+			};
+
+			apu_pwr_rx {
+				compatible = "mediatek,apupwr-rx-rpmsg";
+				mediatek,rpmsg-name = "apupwr-rx-rpmsg";
+			};
+
+			apu_mdw_rpmsg {
+				compatible = "mediatek,apu-mdw-rpmsg";
+				mediatek,rpmsg-name = "apu-mdw-rpmsg";
+			};
+		};
+
 		iommu_apu0: iommu@19010000 {
 			compatible = "mediatek,mt8195-iommu-apu";
 			reg = <0 0x19010000 0 0x1000>;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
