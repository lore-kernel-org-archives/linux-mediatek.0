Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F147C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 17:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zGYrhzjSjImiegtqyVf17llAO4SN5U5du/Bq7lSbqAs=; b=Tz75WJ+687k/wI
	wzUvcI5mMqqpAZbTtgLjrShlQL2Fq1nb9pIukshJWZKxPCN0xHYqhSFgUqW2z47cJW2Gor3TaRuBf
	cBcRDsTHVj8AAKpz6CgBSc+IHSbKiyZRlDY7IShZx2i1/bxq24GORdZwGxu5zsrO3Jk+7tcSqm6Fl
	aPiuZmxXla8hkMgKKlKU3guvWtnr8kk3N3lQiGFtG83LGBM+ahzalgXijimT1aroxQDoLISaZ/Gxv
	ikLenJDXfxud7uXWiMXux8JHr1/39Rg/yurFM8qm54ngueksEEb9A/bP/t0bPzyYjDFWnCyKAE9yn
	/GyG7EJVH0zSxUxORvfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvjR5-002kY5-CX; Fri, 10 Dec 2021 17:11:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvjR1-002kW7-14; Fri, 10 Dec 2021 17:11:53 +0000
X-UUID: 629c90a38da045499b81f130a071f890-20211210
X-UUID: 629c90a38da045499b81f130a071f890-20211210
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1278374239; Fri, 10 Dec 2021 10:11:48 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Dec 2021 09:01:52 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 11 Dec 2021 01:01:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Dec 2021 01:01:45 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Flora Fu <flora.fu@mediatek.com>, "Yong
 Wu" <yong.wu@mediatek.com>, JB Tsai <jb.tsai@mediatek.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>
Subject: [PATCH v4 8/8] arm64: dts: mt8192: Set up apu power domain regulators
Date: Sat, 11 Dec 2021 01:01:13 +0800
Message-ID: <20211210170113.30063-9-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211210170113.30063-1-flora.fu@mediatek.com>
References: <20211210170113.30063-1-flora.fu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_091151_095294_8EC3EAE0 
X-CRM114-Status: UNSURE (   9.01  )
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

Set up apu power domain related regulators.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>

---
Note:
This patch depends on mt6359[3] dts patches which haven't yet been accepted.
[1] https://patchwork.kernel.org/patch/12140237

---
 arch/arm64/boot/dts/mediatek/mt8192-evb.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-evb.dts b/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
index 808be492e970..5d9e108e41f5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
@@ -28,3 +28,10 @@
 &uart0 {
 	status = "okay";
 };
+
+&apuspm {
+	vsram-supply = <&mt6359_vsram_md_ldo_reg>;
+	apu_top: power-domain@0 {
+		domain-supply = <&mt6359_vproc1_buck_reg>;
+	};
+};
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
