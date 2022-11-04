Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F4AC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Nov 2022 02:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dXN+0G2bPmNIyK+r4bcEn3c/POxfzNelk4tkp2tJDz0=; b=efRUKDlD0Sx5bq6O8Ecu8kTPo3
	iUA2//QqMpyzYEEJBl0qlZ+4tNg/uHIhqdlwEmgdQv8Fvg0dWDc/jJ9R2UzBFSbtLcPpIt/XkpRvH
	WhfwNki4RoFC3felQVoB0G66nuPpw6i6wOjRsJssurBQxveEjnMtKBToCi8QTdqzVg7r3MeaIB8md
	Zq+hH6+9N7pjknEEYms+L2+XeSSlEhpcvt7+DWfA/NUQR24EesMN8qEtD/wH/nF2fKCpg2iagyCpm
	cMaXpLcvZshzL117g7pI3srYFBMbboKnIJRFKCgm5uzaiitR4djmFNAlTpgmE/dp5lcT/caMCwTZa
	zSChjVjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqm7W-002BM9-PN; Fri, 04 Nov 2022 02:07:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqm77-002BBe-OB; Fri, 04 Nov 2022 02:07:23 +0000
X-UUID: 1c6f0096f5d84ba2b338137befbb907f-20221103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=dXN+0G2bPmNIyK+r4bcEn3c/POxfzNelk4tkp2tJDz0=;
	b=uSOgQNDyvkXz68565LGtHrhFeG+LgGWtTTSxxlrP1+pdoSQ6YfzRIQBTVGnw4dZNBgGYdauTpHBJEhPaVAtmKrrm8WqDpRNFEH2B2KW3pv9koXN5d3yO7BFDyEJh5mCFiPe9cEXlOoEK7+s1mIE/OsxEjctJmhSz0OyJEIuas9Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:4d279c8e-af52-492b-8055-7d10709d8822,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:69939ef3-a19e-4b45-8bfe-6a73c93611e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 1c6f0096f5d84ba2b338137befbb907f-20221103
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1320721742; Thu, 03 Nov 2022 19:07:09 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 4 Nov 2022 10:07:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 4 Nov 2022 10:07:07 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
CC: <nfraprado@collabora.com>, <angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.com>
Subject: [PATCH v4 7/7] dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible for MT8173
Date: Fri, 4 Nov 2022 10:07:01 +0800
Message-ID: <20221104020701.24134-8-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221104020701.24134-1-allen-kh.cheng@mediatek.com>
References: <20221104020701.24134-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_190721_813798_B381BB82 
X-CRM114-Status: UNSURE (   8.71  )
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

Add the mediatek,mt8173-wdt compatible using mediatek,mt6589-wdt as
fallback.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index d9d4aa7e27e3..58055a1aed92 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -37,6 +37,7 @@ properties:
               - mediatek,mt7622-wdt
               - mediatek,mt7623-wdt
               - mediatek,mt7629-wdt
+              - mediatek,mt8173-wdt
               - mediatek,mt8516-wdt
           - const: mediatek,mt6589-wdt
 
-- 
2.18.0


