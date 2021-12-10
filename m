Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003A1C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 17:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3RDigGoDzHnHwZSxNUGG/EBefTKmSaLJsr0Lrb0LaBo=; b=XycI3lLDlBMlcJ
	D0iYKnU6uGYxkDiuSZFCZpTpDKNjkTRTmPRD44OKV5bUZcevaWaIjH/TwfkRdpV6zdP+k6kdVBxia
	u8S/0/VPWDquckBvdSKwEQOLXJKp3MZDSc+t/k5RLxV0fI3p46UCH14nyt5XZdvlhU2zuc5O/0+2j
	sEnNRonH7fZMm9BImbwNlJKbtlf+f1HSAGd81lVg3ls37o+JqwzndG2vg5q8zqMMv+fqffkhC/9vL
	i5bsB24mWYSYLkClmxHxgBPpttjmpjQll01opPL9lDRpIockPW31y1ppphrHQEarbqYVpmrW/oY8v
	+ZMh0SMfolWSA12xaMjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvjuU-002wNB-6F; Fri, 10 Dec 2021 17:42:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvjqP-002u7e-0f; Fri, 10 Dec 2021 17:38:07 +0000
X-UUID: 87a174aa98e24abbbb593adebe0626fa-20211210
X-UUID: 87a174aa98e24abbbb593adebe0626fa-20211210
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 720247628; Fri, 10 Dec 2021 10:38:03 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Dec 2021 09:38:02 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 11 Dec 2021 01:37:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Dec 2021 01:37:54 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Flora
 Fu" <flora.fu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, JB Tsai
 <jb.tsai@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>
Subject: [PATCH 4/6] arm64: dts: mt8195: Add APU nodes
Date: Sat, 11 Dec 2021 01:37:41 +0800
Message-ID: <20211210173743.30906-5-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211210173743.30906-1-flora.fu@mediatek.com>
References: <20211210173743.30906-1-flora.fu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_093805_118064_C56FE174 
X-CRM114-Status: UNSURE (   8.21  )
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

Add APU nodes to MT8195.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>

---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 4980b8329b54..828ac8a6b95f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1360,6 +1360,21 @@
 			#clock-cells = <1>;
 		};
 
+		apu_conn: syscon@19020000 {
+			compatible = "mediatek,mt8195-apu-conn", "syscon";
+			reg = <0 0x19020000 0 0x1000>;
+		};
+
+		apu_conn1: syscon@19024000 {
+			compatible = "mediatek,mt8195-apu-conn1", "syscon";
+			reg = <0 0x19024000 0 0x1000>;
+		};
+
+		apu_vcore: syscon@19029000 {
+			compatible = "mediatek,mt8195-apu-vcore", "syscon";
+			reg = <0 0x19029000 0 0x1000>;
+		};
+
 		apusys_pll: clock-controller@190f3000 {
 			compatible = "mediatek,mt8195-apusys_pll";
 			reg = <0 0x190f3000 0 0x1000>;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
