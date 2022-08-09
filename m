Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42D1C19F2D
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Aug 2022 09:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kFDmMzyEzTYNBwRWu31AZJ5AbILkXUIXqRV/7NlKW30=; b=DMWZiqG1kLuoVzJTyNVga5Q4Vs
	wnPFcehzyPr/Czg7j1sod4ytp8PxFJA9O1bC0/yni5zFLi2tw3VHAlf4Y5nrBw4MkCnqvIcOyJmR/
	Axe9zc3v9XxkaWUKQVvtOmdWPjmyKvqjJJqcKMhj+ikSKedOCyPhhKbJbd1qZWntRfVLq2+9mU+lg
	cpwYX1cGgTAqY3C7ygC/ifDHknhlgFgp1hgepfborOa7UNdkuz6MzaU2YauLfC+HLlU1wDOb79Vwl
	zu9R3xx8F8JF4adypQElf/moaFDreO/RPxl2g2XXPi8NW61paZcPcxHIQGAb78oDvsNah92IH3WCU
	2DOYGLbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLLBM-002w93-0i; Tue, 09 Aug 2022 09:05:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLLBJ-002w7E-97; Tue, 09 Aug 2022 09:05:46 +0000
X-UUID: e6bf8181e4e4405c90bb03c3aa73c9c7-20220809
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:9104e256-abbe-40ba-acba-56168775731d,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_H
	am,ACTION:release,TS:0
X-CID-META: VersionHash:3d8acc9,CLOUDID:4619cffc-9e71-4a0f-ba6b-417998daea35,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e6bf8181e4e4405c90bb03c3aa73c9c7-20220809
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <kewei.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 440017382; Tue, 09 Aug 2022 02:05:37 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 9 Aug 2022 16:45:06 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 9 Aug 2022 16:45:05 +0800
From: <kewei.xu@mediatek.com>
To: <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
	<qii.wang@mediatek.com>, <liguo.zhang@mediatek.com>,
	<caiyu.chen@mediatek.com>, <kewei.xu@mediatek.com>,
	<david-yh.chiu@mediatek.com>
Subject: [PATCH v2 1/1] dt-binding: serial: mediatek,uart: update bingding for MT8188
Date: Tue, 9 Aug 2022 16:44:57 +0800
Message-ID: <20220809084457.31381-1-kewei.xu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_020545_350670_79B2B0AB 
X-CRM114-Status: UNSURE (   8.30  )
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

From: Kewei Xu <kewei.xu@mediatek.com>

Add a DT binding documentation for the MT8188 soc.

Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
---
v2: Resumbit the patch based on the linux-next branch.
---
 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index 4ff27d6d4d5b..fe098d98af6e 100644
--- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -42,6 +42,7 @@ properties:
               - mediatek,mt8173-uart
               - mediatek,mt8183-uart
               - mediatek,mt8186-uart
+              - mediatek,mt8188-uart
               - mediatek,mt8192-uart
               - mediatek,mt8195-uart
               - mediatek,mt8516-uart
-- 
2.18.0


