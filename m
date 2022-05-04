Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9E6C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 13:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XH7nhCgqtZk0d6uvDtQ+w33XWxsFgcQbpasKJG4aU7c=; b=1xM/aMiE762qWF
	dFyfiKmJPAvEQW722bp0iVJBpj1lZE41/mUYrVuL8w5SAxAyEBifC8xrtkxg4K5emTNgxhmQgJwQd
	8ucZ8byMLDzzXIv6sUOw8Flifpf28BLxxMVi0uaJuLwVRdcFEO89WH8xd/4ftVspn58nsLaRc4Jmv
	o89pVsVErGe3Ild2NF1QOliAKaocc0c28tD/w2wJo8VAUH+zKCZSdNX4DJJK+6ho9ZjJiWvX23YEu
	3VWXDbp4J2Tnd0fqFeQgfYgKcUah5iYYWU9t7TxNH//WugtAPMIvTOmyvgIZvR7jyl0cLJIhf9ec+
	xc+UHSK3uGrXklHBdSyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmEjQ-00AvX9-OJ; Wed, 04 May 2022 13:07:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmEhU-00AuBy-Es; Wed, 04 May 2022 13:05:53 +0000
X-UUID: 25223e16a46d48fe9dc1b4a95a8bfd82-20220504
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:3f2a3633-f7fb-47c6-9ff3-1d49bef341ec, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:465e8cb2-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 25223e16a46d48fe9dc1b4a95a8bfd82-20220504
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1178939342; Wed, 04 May 2022 06:05:45 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 May 2022 06:05:43 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 May 2022 21:05:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 4 May 2022 21:05:42 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <rafael@kernel.org>, <viresh.kumar@linaro.org>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <jia-wei.chang@mediatek.com>, <roger.lu@mediatek.com>,
 <hsinyi@google.com>, <khilman@baylibre.com>,
 <angelogioacchino.delregno@collabora.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH v5 9/9] arm64: dts: mediatek: Add mediatek,
 cci property for MT8183 cpufreq
Date: Wed, 4 May 2022 21:05:40 +0800
Message-ID: <20220504130540.5902-10-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220504130540.5902-1-rex-bc.chen@mediatek.com>
References: <20220504130540.5902-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_060552_570026_5CE63110 
X-CRM114-Status: UNSURE (   9.38  )
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

Add mediatek,cci property to support MediaTek CCI feature.

Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 11caf3dd85cd..e5d4a8e0c545 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -336,6 +336,7 @@
 			operating-points-v2 = <&cluster0_opp>;
 			dynamic-power-coefficient = <84>;
 			#cooling-cells = <2>;
+			mediatek,cci = <&cci>;
 		};
 
 		cpu1: cpu@1 {
@@ -351,6 +352,7 @@
 			operating-points-v2 = <&cluster0_opp>;
 			dynamic-power-coefficient = <84>;
 			#cooling-cells = <2>;
+			mediatek,cci = <&cci>;
 		};
 
 		cpu2: cpu@2 {
@@ -366,6 +368,7 @@
 			operating-points-v2 = <&cluster0_opp>;
 			dynamic-power-coefficient = <84>;
 			#cooling-cells = <2>;
+			mediatek,cci = <&cci>;
 		};
 
 		cpu3: cpu@3 {
@@ -381,6 +384,7 @@
 			operating-points-v2 = <&cluster0_opp>;
 			dynamic-power-coefficient = <84>;
 			#cooling-cells = <2>;
+			mediatek,cci = <&cci>;
 		};
 
 		cpu4: cpu@100 {
@@ -396,6 +400,7 @@
 			operating-points-v2 = <&cluster1_opp>;
 			dynamic-power-coefficient = <211>;
 			#cooling-cells = <2>;
+			mediatek,cci = <&cci>;
 		};
 
 		cpu5: cpu@101 {
@@ -411,6 +416,7 @@
 			operating-points-v2 = <&cluster1_opp>;
 			dynamic-power-coefficient = <211>;
 			#cooling-cells = <2>;
+			mediatek,cci = <&cci>;
 		};
 
 		cpu6: cpu@102 {
@@ -426,6 +432,7 @@
 			operating-points-v2 = <&cluster1_opp>;
 			dynamic-power-coefficient = <211>;
 			#cooling-cells = <2>;
+			mediatek,cci = <&cci>;
 		};
 
 		cpu7: cpu@103 {
@@ -441,6 +448,7 @@
 			operating-points-v2 = <&cluster1_opp>;
 			dynamic-power-coefficient = <211>;
 			#cooling-cells = <2>;
+			mediatek,cci = <&cci>;
 		};
 
 		idle-states {
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
