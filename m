Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53A2C74A5B
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 06:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=goIbo3K+z0Hxyibw+E8BXKuErUNw5ptKNsoK8dl9Ed0=; b=RFkucD1ciNUg8j57VDki/FnleE
	WvxywFWligiPHdH+j1g6MSn8jToHNuP8laojMhag+NDf7E0hbNrFWvU1ydQvVD/SRWmMvcGknaHbW
	7rZbz+N2LZ9hO5lQvZ6mtVBRJRzvSTkcMAWhI8T1H/TijEBLJvzc47KyisxbJp9X7clFKh90trWDc
	J1ut0ZLBNTLRbfz0WpXILTx3IuweQIp+Wnjj1ZvnE8eInOE6pxlZQ5b1mXJPSOqNcaalorX0/pgBg
	0dzi0eqKqRhpEyTle7qUfr0+J5c6hJfb34GT1epCU6+jTbbtuXCsBHHB6GdYqG6+dXMZEmy0SzivK
	pxgWX8Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd3Hu-00196x-0s;
	Fri, 17 Mar 2023 06:10:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd3Hr-00194m-2z;
	Fri, 17 Mar 2023 06:10:01 +0000
X-UUID: 5603845cc48a11edb5598346aad47b14-20230316
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=goIbo3K+z0Hxyibw+E8BXKuErUNw5ptKNsoK8dl9Ed0=;
	b=k8iX5NtCPlveEu6rCAF5MdNEzEjLZ3eqyrFV2eJVl72OUUa2T93Z2+CgsQ7gcn9H78hIQCy0Z6dDMeicTASsDbfEb6oMVz7h2lVVdy0KNdEf5ckKidZ73Q2dttiCak6aq8f+PvZQBswlUGxSVENdghrCZlqDVaZg52lT0hSoxXg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.21,REQID:1963ee41-a834-4522-a648-2d17f000d200,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:83295aa,CLOUDID:09d4a728-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 5603845cc48a11edb5598346aad47b14-20230316
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1498492741; Thu, 16 Mar 2023 23:09:54 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 17 Mar 2023 14:09:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 17 Mar 2023 14:09:19 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<hsinyi@chromium.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v4 2/7] dt-bindings: spmi: spmi-mtk-pmif: Document mediatek,mt8195-spmi as fallback of mediatek,mt8186-spmi
Date: Fri, 17 Mar 2023 14:09:12 +0800
Message-ID: <20230317060917.15175-3-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230317060917.15175-1-allen-kh.cheng@mediatek.com>
References: <20230317060917.15175-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_230959_966643_5E682A4C 
X-CRM114-Status: UNSURE (   9.34  )
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

The mt8186-spmi is used as compatible with mt8195-spmi on the MT8186,
document this situation.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 .../devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml   | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml b/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
index abcbbe13723f..e4f465abcfe9 100644
--- a/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
+++ b/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
@@ -18,9 +18,14 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt6873-spmi
-      - mediatek,mt8195-spmi
+    oneOf:
+      - enum:
+          - mediatek,mt6873-spmi
+          - mediatek,mt8195-spmi
+      - items:
+          - enum:
+              - mediatek,mt8186-spmi
+          - const: mediatek,mt8195-spmi
 
   reg:
     maxItems: 2
-- 
2.18.0


