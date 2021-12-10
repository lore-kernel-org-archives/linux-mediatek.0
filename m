Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D316C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 17:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RT5jyHyi90V0YvJklC/WNFAXdS0rcSDYWlgjh/WLzjc=; b=dHdQbAuiq35OVD
	pw9BGzW8moEuPTlvd29P/a6Pc9wbIzkpPGA9C+W7SNTH2EwoBU06iSENKOC76lX5vOXf+gkRjiNXc
	r5JOktRQYQszOBOpnlbmPjT+FnaB21Pey5fGU865FxCvVaNZgYkPyVW5QVGe9QRfJljdIzNp75qgR
	GsE+GRUJ0O6yY9FcGpocPdaUEyBje+lsetKQfU8OEnnL0YqkKf7iHw/9xymVHVswXgTrsYMTwDok+
	B32lCsFyOS/w0ptZ5ISCbGuM34vNy3ovpm3p+3/sovEw+wG7XATC/Y9i9WqqUo+sxAR1Q7/yx575U
	DM93PkdwMhg5XJAK0ilg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvjIQ-002hf1-MQ; Fri, 10 Dec 2021 17:02:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvjHM-002hGy-RE; Fri, 10 Dec 2021 17:01:54 +0000
X-UUID: 8d39c17e98ab4a579253cca94e5491fe-20211210
X-UUID: 8d39c17e98ab4a579253cca94e5491fe-20211210
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 811516473; Fri, 10 Dec 2021 10:01:47 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Dec 2021 09:01:45 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Dec 2021 01:01:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Dec 2021 01:01:43 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Flora Fu <flora.fu@mediatek.com>, "Yong
 Wu" <yong.wu@mediatek.com>, JB Tsai <jb.tsai@mediatek.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>
Subject: [PATCH v4 6/8] arm64: dts: mt8192: Add APU node
Date: Sat, 11 Dec 2021 01:01:11 +0800
Message-ID: <20211210170113.30063-7-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211210170113.30063-1-flora.fu@mediatek.com>
References: <20211210170113.30063-1-flora.fu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_090152_935056_93180B04 
X-CRM114-Status: UNSURE (   8.86  )
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

Add APU node to MT8192.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>

---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index ed4a5749c45a..9e4057d4e1ac 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -906,6 +906,18 @@
 			#clock-cells = <1>;
 		};
 
+		apu_conn: apu_conn@19020000 {
+			compatible = "mediatek,mt8192-apu-conn", "syscon";
+			reg = <0 0x19020000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		apu_vcore: apu_vcore@19029000 {
+			compatible = "mediatek,mt8192-apu-vcore", "syscon";
+			reg = <0 0x19029000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
 		camsys: clock-controller@1a000000 {
 			compatible = "mediatek,mt8192-camsys";
 			reg = <0 0x1a000000 0 0x1000>;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
