Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D17C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 17:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tZC1lVaf6g4lIgJF7VFogSTmHVJKb3kExUNW0q5o/ZM=; b=LCh1PnfQR2gcOq
	RMC8IkcDP+bK6sgiLNXuGmvP/dkgxShGEl5nTfJCVbnQfcD7F3Ma0aNbesugwA/8J0YJTjdvhnQA7
	U6ajwXJN4nPI+3yQGphVpYTdPtdFYpgPdZnnDvNbKW1Dq42vv/uCXyDdidcyKZdo97pWbvn3ndZCa
	nBQS0Hgv5vNcu8HmwOQSdFuh7si2l84Vimk6+KyzJ8cYDGrVflFhk8nIC3NFEaH1CXW53zi5t1ykx
	NjArp7wb79lhhy6YoIinwPZK3kkJsRLV4/nUiH8NBK7UDysjDJor01Qp7dAXPzSZbiqm4egRStOp2
	k++vGQTdiGuxaYe7TZgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvjqv-002uP2-7t; Fri, 10 Dec 2021 17:38:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvjpO-002tg3-Ae; Fri, 10 Dec 2021 17:37:03 +0000
X-UUID: 06339aca5c0542cd9115b5f13ceb4360-20211210
X-UUID: 06339aca5c0542cd9115b5f13ceb4360-20211210
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 237089193; Fri, 10 Dec 2021 10:36:59 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Dec 2021 09:26:58 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 11 Dec 2021 01:26:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Dec 2021 01:26:50 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Yong Wu <yong.wu@mediatek.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, Flora Fu <flora.fu@mediatek.com>, JB Tsai
 <jb.tsai@mediatek.com>
Subject: [PATCH 14/17] arm64: dts: mt8192: Add apu tinysys node
Date: Sat, 11 Dec 2021 01:26:02 +0800
Message-ID: <20211210172605.30618-15-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211210172605.30618-1-flora.fu@mediatek.com>
References: <20211210172605.30618-1-flora.fu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_093702_420135_C2AA3527 
X-CRM114-Status: UNSURE (   9.51  )
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
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 35 ++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 62acaba7b033..de73fbf0cb90 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -914,6 +914,41 @@
 			#mbox-cells = <1>;
 		};
 
+		apusys_rv@19001000 {
+			compatible = "mediatek,mt8192-apusys-rv", "simple-mfd";
+			reg = <0 0x19000000 0 0x1000>,
+			      <0 0x19001000 0 0x1000>,
+			      <0 0x19002000 0 0x10>;
+			reg-names = "apu_mbox",
+				    "md32_sysctrl",
+				    "apu_wdt";
+			power-domains = <&apuspm 0>;
+			iommus = <&iommu_apu IOMMU_PORT_APU_DATA>;
+			interrupts = <GIC_SPI 393 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "apu_wdt";
+			mboxes = <&apu_mailbox 0>;
+
+			apu_ctrl {
+				compatible = "mediatek,apu-ctrl-rpmsg";
+				mtk,rpmsg-name = "apu-ctrl-rpmsg";
+			};
+
+			apu_pwr_tx {
+				compatible = "mediatek,apupwr-tx-rpmsg";
+				mtk,rpmsg-name = "apupwr-tx-rpmsg";
+			};
+
+			apu_pwr_rx {
+				compatible = "mediatek,apupwr-rx-rpmsg";
+				mtk,rpmsg-name = "apupwr-rx-rpmsg";
+			};
+
+			apu_mdw_rpmsg {
+				compatible = "mediatek,apu-mdw-rpmsg";
+				mtk,rpmsg-name = "apu-mdw-rpmsg";
+			};
+		};
+
 		iommu_apu: iommu@19010000 {
 			compatible = "mediatek,mt8192-iommu-apu";
 			reg = <0 0x19010000 0 0x1000>;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
