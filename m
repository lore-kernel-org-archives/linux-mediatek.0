Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF84FC4708C
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Dec 2022 02:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4waRqiQHmOM+yfFItnDIrEDG8meeS95gNv8ySnkY1WQ=; b=xET5mqd2b+w2RFrdAhFl3C4IfE
	Iil2irmnVDodaTu+XL0qJO1bKFz/ojsYriIiGD/KKWZty//hPyDltxmgqxt4kxKmz7KDpGsysYXgj
	9nr5launJK2iVzJsYQZVzrpE0/kROeAce30UBBQxa9UeQGwhw3TJX3X2rYMD5nkEZtYfCHHDBEvrI
	d4Ei813qidGacxTGh0uxH9L7Ld4hcQ5wHcq6ca8JR7rLWCvoWy0eQRIqU7FkWYGif2TyTLtRWmb40
	bSvyx77jYkGJM2aQvpNy6kLmEHDx9fzzG4TnvE3+zSVr5JcqRsqNxKWEedY4I0KHrDyNAGl6o4Yk1
	d9rC0EUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2NGt-00FCoa-A2; Tue, 06 Dec 2022 02:01:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2NGr-00FCl5-5d; Tue, 06 Dec 2022 02:01:22 +0000
X-UUID: 39a3b4720cb644d3a02730cde191fa89-20221205
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=4waRqiQHmOM+yfFItnDIrEDG8meeS95gNv8ySnkY1WQ=;
	b=uyCa8cdpoq2rmcjbZoP7zSBKOb7jrcQZiXWauxcs1PDTwIrsAiqwt/ci3EcIy5plVjVxtjgVS2w0zlaYyMZDS8eQxnb0c0aAYShjbk/dtUDwxoKdufywETf6RxDQQys66auOEqRj9KZQ5/s+4Wns61VNSICOnbT1ZJ4jYSsI0TI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:080ec4bb-e624-4d65-9672-9386663bf9d6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:354ebbd1-652d-43fd-a13a-a5dd3c69a43d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 39a3b4720cb644d3a02730cde191fa89-20221205
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <nathan.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1263688115; Mon, 05 Dec 2022 19:01:14 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 6 Dec 2022 10:00:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 6 Dec 2022 10:00:58 +0800
From: nathan.lu <nathan.lu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: "jason-jh . lin" <jason-jh.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rex-BC
 Chen <rex-bc.chen@mediatek.com>, Nathan Lu <nathan.lu@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <lancelot.wu@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 2/6] dt-bindings: mediatek: modify VDOSYS0 mmsys device tree Documentations for MT8188
Date: Tue, 6 Dec 2022 10:00:42 +0800
Message-ID: <20221206020046.11333-3-nathan.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221206020046.11333-1-nathan.lu@mediatek.com>
References: <20221206020046.11333-1-nathan.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_180121_229139_79AFC6DC 
X-CRM114-Status: UNSURE (   7.56  )
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

From: Nathan Lu <nathan.lu@mediatek.com>

modify VDOSYS0 mmsys device tree Documentations for MT8188.

Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
---
 .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index 0711f1834fbd..84de12709323 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -31,6 +31,7 @@ properties:
               - mediatek,mt8173-mmsys
               - mediatek,mt8183-mmsys
               - mediatek,mt8186-mmsys
+              - mediatek,mt8188-vdosys0
               - mediatek,mt8192-mmsys
               - mediatek,mt8365-mmsys
           - const: syscon
-- 
2.18.0


