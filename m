Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA248ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 06:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQs6Q3+RWefSzzUisUoYCLIBCbSdiczGmhp+W4Fkwq0=; b=cXpfOwGUv49wnmd6w3HTPK1edd
	CRZ4ghHGAnfQv5VeBdJuCMFBiJZyAIxDw2S1fBPG5SUgrOvCpphUVBfa+EH4WqVuswDekbru9Eut5
	P4xYgUzjOIWUMFLnccnE2M2ewPaGuzjv9p+IV+P+JClJqKvTc0G2yRtBlyhV1noSYV6Ih7B4SDasP
	hyPy6UxTl5iX+KR9lxuoogLP0rfl5YvjHbwq2yI3a+GIWU2wvE3FRKnS2D6LhryrKfO00eFbL0YHh
	O7Yp69msNKBCyvB6oDAprm01oUe4DJ5gzgFN0BMqhSJYkH6AcbFbJ/r1/13IZicbZwSAP4JUIwfa4
	wqZiUH4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSuvV-00EU09-SP; Tue, 30 Aug 2022 06:40:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSuuo-00ETdZ-Rb; Tue, 30 Aug 2022 06:40:09 +0000
X-UUID: a3c39addd76f4622b07c41f541802582-20220829
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=TQs6Q3+RWefSzzUisUoYCLIBCbSdiczGmhp+W4Fkwq0=;
	b=nK1t6B9yqpNX3ZNQ8OWYoVrWKkBIZl5HY5inE3+V7FG4txBLC/15u7lBdu2v8hTThvDkfBl9VHsLc1miDUPgx+F3YarucIYZUmBaT481CzvaEQiM2HIA4ELdxK/qsYgnRsLe4Kvzj+R7BlilbDHunViSojuB2gxDHlsGLiOmXAs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:eea840f4-4b73-4eda-b23d-89da78d2a3bd,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:b9c9fb55-e800-47dc-8adf-0c936acf4f1b,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: a3c39addd76f4622b07c41f541802582-20220829
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <zheng-yan.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 547780646; Mon, 29 Aug 2022 23:39:52 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 30 Aug 2022 14:39:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 30 Aug 2022 14:39:32 +0800
From: zheng-yan.chen <zheng-yan.chen@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, zheng-yan.chen
	<zheng-yan.chen@mediatek.com>
Subject: [PATCH v2 1/3] dt-bindings: mediatek: Add gamma compatible for mt8195
Date: Tue, 30 Aug 2022 14:39:27 +0800
Message-ID: <20220830063929.13390-2-zheng-yan.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220830063929.13390-1-zheng-yan.chen@mediatek.com>
References: <20220830063929.13390-1-zheng-yan.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_234007_504612_0DDDCA97 
X-CRM114-Status: GOOD (  11.56  )
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

mt8195 uses 10bit-to-12bit gamma-LUT, which is not compatible with
current 9bit-to-10bit gamma-LUT.

This patch thus add constant compatible for mt8195, which means that
mt8195 should only use specified mt8195 gamma driver data.

Also, delete related compatible from enum, to ensure that
mt8195 will not accidentally get others' gamma driver data and thus
cause fatal error.

Fixes: a79257bae9bf ("dt-bindings: display: mediatek: add mt8195 SoC binding for vdosys0")
Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
index a89ea0ea7542..fbd7b9664a78 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -25,11 +25,12 @@ properties:
           - const: mediatek,mt8173-disp-gamma
       - items:
           - const: mediatek,mt8183-disp-gamma
+      - items:
+          - const: mediatek,mt8195-disp-gamma
       - items:
           - enum:
               - mediatek,mt8186-disp-gamma
               - mediatek,mt8192-disp-gamma
-              - mediatek,mt8195-disp-gamma
           - const: mediatek,mt8183-disp-gamma
 
   reg:
-- 
2.18.0


