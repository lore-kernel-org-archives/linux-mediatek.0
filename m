Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF3CECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 10:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g8vhFKeVZODszpNNdcs1n44q8B0+ixfLD0v3NWycG2k=; b=Dtrut3v5A/hIuI1HfNcuW6tCQH
	QssqwvMs1GrR7L3oA+TwXRIqb0iZaAiUoeiMppfiTRHpysfdKV78yaYCCXqu349OhVCqaY1jIAhV5
	bsTGh6yOAM6BwemdgiuwZT1+kZ+Ay8cpKE5NCot26EkP4kPX5qvXQZm/Kf/bkcYH4bvLVep/vWVJC
	mrVJ8zT0+hwg5K7kKXqK2EMj5YxkwzAhpSMoh2oxIH2XpwHIcU9JW91nNHif3+HYG5fpapVe/fJT0
	mzaErUJjdqfWCyjhWouy0Xrbz2nTW512jRU09JCr+q/Ms3RM4/ONKGMUZ/PdNEG6lh2bFfgx1TFn8
	aIg6X9fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYlwB-006Y1X-85; Thu, 15 Sep 2022 10:17:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYlvy-006XgL-9o; Thu, 15 Sep 2022 10:17:27 +0000
X-UUID: ea2d893eb6c1409e84982199e813f834-20220915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=g8vhFKeVZODszpNNdcs1n44q8B0+ixfLD0v3NWycG2k=;
	b=JpC0WWmn6wRLRokglgEIY9RZ+uZzh3WCW4yhNIAHOTV+OMf+owAPdMRnC2sH15XEpREmmDinsAWqgve3j3UOzQiARe0SzX8p1H6fUWMvBdWKQxlG+DgADXy1RuqVJ91hvqmAuqjDN7+rn0K51gC1G1M0gpEKqVuuPKogZjmDzEY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:1d33e6cb-4586-4a30-b778-d0ee492f7ae5,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:25e8be7b-ea28-4199-b57e-003c7d60873a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ea2d893eb6c1409e84982199e813f834-20220915
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2042233181; Thu, 15 Sep 2022 03:17:19 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 15 Sep 2022 17:46:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 15 Sep 2022 17:46:41 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
CC: <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Bo-Chen Chen
	<rex-bc.chen@mediatek.com>
Subject: [PATCH v2 3/4] arm64: dts: mediatek: cherry: Add dp-intf ports
Date: Thu, 15 Sep 2022 17:46:39 +0800
Message-ID: <20220915094640.5571-4-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220915094640.5571-1-rex-bc.chen@mediatek.com>
References: <20220915094640.5571-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_031726_370661_527A859B 
X-CRM114-Status: UNSURE (   8.37  )
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

Dp-intfs provide the pixel data to edptx and dptx. To support edptx
and dptx, we need to add dp-intf0 and dp-intf1 ports.

Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 9b62e161db26..303dc32c64dc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -120,6 +120,24 @@
 	};
 };
 
+&dp_intf0 {
+	status = "okay";
+
+	port {
+		dp_intf0_out: endpoint {
+		};
+	};
+};
+
+&dp_intf1 {
+	status = "okay";
+
+	port {
+		dp_intf1_out: endpoint {
+		};
+	};
+};
+
 &i2c0 {
 	status = "okay";
 
-- 
2.18.0


