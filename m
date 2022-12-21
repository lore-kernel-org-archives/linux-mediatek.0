Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7C0C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Dec 2022 04:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XxTUsxvSetrznStelFhNNQIH6eOjSESJoSSPJi/S8LM=; b=L16NT7DOsZN/JUGDNikobtwzRc
	m7OLiGY59R5yBhpIMjd3yiSEkOH0AlzQfyoxn5flBSTVH28Plnpqx89bg7jj1fxsWkIMApTDF++iC
	CU3k1julJNiCE0JLS9o/JYQnbTmJUmPpTqOEc6Y/2hG7FrnsBIxTQgJ7YfXQL8VSJRpmadQpVUfdm
	LKTbiExqQFNbRg+wgP1s9O4vrWYIRtjW/ZMDv82vGV1n9xACQLjO6acTh5ChIEgrbIqrSRudQuRJ1
	TIDxG42ktYBnXcUg/YFRrvQWp0p5IdNv1Kiiy1d4kGqmhoBraUb36JAJMCxlwISRRF1QuCn89DEme
	SN/oOmpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7qLg-0098l2-8i; Wed, 21 Dec 2022 04:04:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7qLd-0098j9-84; Wed, 21 Dec 2022 04:04:54 +0000
X-UUID: 880cb717b83b4da5a46d4405077c96f7-20221220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=XxTUsxvSetrznStelFhNNQIH6eOjSESJoSSPJi/S8LM=;
	b=Zh89NlVwIadK/gINaK3ozStM+JhzOLIA262HcQBvmMa30OF04jzpLtQUJ1XMF0pa9EuuH/Tnxw2BMsKwvZ7LOht+U+P1lsCAeW5jKc03oEprSx7Ki9GRNi9nrnQMrWfXb6Qfm8JXtTNqpiWmsSUpuw5VhRLdats+KAO8GnQQGjI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:c5b274f1-19df-42f5-9d24-7f33b3e18160,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:1da3f3b3-85f7-455b-b2d9-bdae7043403d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 880cb717b83b4da5a46d4405077c96f7-20221220
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1166507338; Tue, 20 Dec 2022 21:04:49 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 21 Dec 2022 11:44:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 21 Dec 2022 11:44:12 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	"Stephen Boyd" <sboyd@kernel.org>, Ikjoon Jang <ikjn@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v2 3/6] dt-bindings: power: Add MT8192 ADSP power domain
Date: Wed, 21 Dec 2022 11:44:04 +0800
Message-ID: <20221221034407.19605-4-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221221034407.19605-1-allen-kh.cheng@mediatek.com>
References: <20221221034407.19605-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_200453_370212_340D290E 
X-CRM114-Status: GOOD (  10.55  )
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


