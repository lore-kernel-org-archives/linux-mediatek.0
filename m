Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3B4C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 03:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gN69LAWli57eTXc0OfsB3miO4hrUcXTy4Nki4aN3t2U=; b=zpevFbuF3ZEhXBnnkMbraQJstN
	yGaqZBk9hySrvJkS8AV0YWXGLPPPqGeleD32Bjs6tDZ4ZHPKTZDfO85WEtnh/2brvu1w9oVboPp74
	R7purIWtPTfMDNxmbh9M4h4f6N5+frFlmPf5xHbd6vKhQegale0SrL98ENK7HEy3GJcjv4yIqexm1
	9eXPwTAjUqYiTX0rAyAASZcg7dwp4+vkmZJMstmEC/0jL0cCDcOhYVHMPw00jpqtAZ4UkyCmpAMj9
	pLwgU1R4ObD1vcumm0/8gBrhPqeof1LCHXND9bL+t0s2YotqNm5uber16WMbveViVq9Tg1wIbGadJ
	GLf787QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9emn-001ZJo-UX; Fri, 08 Jul 2022 03:36:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9eml-001ZJF-5N; Fri, 08 Jul 2022 03:36:08 +0000
X-UUID: eaef196cf5964b1ba8372a71f9a92e29-20220707
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:8907d509-a5af-4fa6-a432-598b3a947c4e,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:0872de86-57f0-47ca-ba27-fe8c57fbf305,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: eaef196cf5964b1ba8372a71f9a92e29-20220707
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <kewei.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 626141009; Thu, 07 Jul 2022 20:36:04 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 8 Jul 2022 11:15:25 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Jul 2022 11:15:24 +0800
From: <kewei.xu@mediatek.com>
To: <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <leilk.liu@mediatek.com>,
	<qii.wang@mediatek.com>, <liguo.zhang@mediatek.com>,
	<caiyu.chen@mediatek.com>, <housong.zhang@mediatek.com>,
	<yuhan.wei@mediatek.com>, <kewei.xu@mediatek.com>,
	<david-yh.chiu@mediatek.com>, <liju-clr.chen@mediatek.com>
Subject: [PATCH 1/2] dt-bindings: i2c: update bindings for MT8188 SoC
Date: Fri, 8 Jul 2022 11:15:18 +0800
Message-ID: <20220708031520.22053-1-kewei.xu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_203607_249828_5721B08F 
X-CRM114-Status: UNSURE (   7.61  )
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
Change-Id: Iae781c7c68becbf3c5dea3511acb18cdd40d5c08
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
index 16a1a3118204..4e730fb7be56 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -27,6 +27,7 @@ properties:
       - const: mediatek,mt8173-i2c
       - const: mediatek,mt8183-i2c
       - const: mediatek,mt8186-i2c
+      - const: mediatek,mt8188-i2c
       - const: mediatek,mt8192-i2c
       - items:
           - enum:
-- 
2.18.0


