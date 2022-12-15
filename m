Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839E3C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Dec 2022 12:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wEtcKJxSE9mxxuhtX/9piOaTQKW2w7JZNGu4dtoOPgQ=; b=gdUiMADw+vl/k/fnq/ohroYnuO
	k3OZHoQBfnRB0lTr8W/OYfJgapbY5OCzthyqJ+cP+jxXlsTAR/zVAxge9v8YTxvDlyDmXDerLnq9c
	h8ixr5fZ1oKM6GAl0J5loTmyT0psmY6Z9a61NMP5FfvE4BTQULz+PCtLAUvUhvr+ddx3cDDC3pucM
	qIiOJ1161fhnOuXg4QI11A8gMi5IFxvheqijrA43XEiN8gvhROE9zvOuDV0qW896hbnrM/rwnCBEB
	xI5flD3VfswAkmyU5EWk9eX6am3qgfb63WBD5NISOTpK7PVauVLICfxks1FIgFsMT8kn2GxVD0tHl
	L2Uno1VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5mv1-009BcN-6S; Thu, 15 Dec 2022 12:00:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5muy-009BaG-8P; Thu, 15 Dec 2022 12:00:53 +0000
X-UUID: 419a2dabad644246a8fcc1e888f2fc44-20221215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=wEtcKJxSE9mxxuhtX/9piOaTQKW2w7JZNGu4dtoOPgQ=;
	b=crkgtFRPQ4te7/X2zeYhDY7MKNEdoyAWrRZbfZwg6hI2Ns/XvdIEow2ow9du8tTlQ16UJtR4abICdB6aSiqSYQJM9ilyRuJrUY9/5LYP0Fp4+amGRuMrpboZHEhpoYUa7BIJzztQSzS6P7BlisxvlJAwcku5kuiSoQfbMlkECa8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:a2234733-75e1-4dcf-9fe4-64de3e58570f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:10755635-a6a3-44f7-8aad-08fee1939a08,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 419a2dabad644246a8fcc1e888f2fc44-20221215
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1657777463; Thu, 15 Dec 2022 05:00:46 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 15 Dec 2022 20:00:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 15 Dec 2022 20:00:18 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>, Stephen
 Boyd <sboyd@kernel.org>, Ikjoon Jang <ikjn@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH 1/4] dt-bindings: power: Add MT8192 ADSP power domain
Date: Thu, 15 Dec 2022 20:00:13 +0800
Message-ID: <20221215120016.26611-2-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221215120016.26611-1-allen-kh.cheng@mediatek.com>
References: <20221215120016.26611-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_040052_320102_A078D15A 
X-CRM114-Status: UNSURE (   9.97  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add power domain ID for the ADSP power partition found on MT8192 SoC.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 include/dt-bindings/power/mt8192-power.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/power/mt8192-power.h b/include/dt-bindings/power/mt8192-power.h
index 4eaa53d7270a..63e81cd0d06d 100644
--- a/include/dt-bindings/power/mt8192-power.h
+++ b/include/dt-bindings/power/mt8192-power.h
@@ -28,5 +28,6 @@
 #define MT8192_POWER_DOMAIN_CAM_RAWA	18
 #define MT8192_POWER_DOMAIN_CAM_RAWB	19
 #define MT8192_POWER_DOMAIN_CAM_RAWC	20
+#define MT8192_POWER_DOMAIN_ADSP	21
 
 #endif /* _DT_BINDINGS_POWER_MT8192_POWER_H */
-- 
2.18.0


