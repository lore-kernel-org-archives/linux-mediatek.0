Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45942C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 05:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bffELTiqqY3m9szvsaC2wxSmM4tHoYuDCrpUeVS2XXc=; b=Eh49nPkaeYDzYqs5iTWC3WUCab
	NkjoraaWcTP4e25AQ2mqNSg63rLiA0pfGxGqM9HIrlbJc4E1dA4xd4Z5Ni8AjTdeto7jSqD64FULF
	hW4imPb0juxFO5oq9PiB33dxNhlx/vNA6dlfAWy95zLdieLEfy7miePYcBFjWUtUqe406mYqUGdXL
	RVoGJ4Bo+pjh9qMgjDeSQkZABupJfXDSh6G0ZU0DJpjKUrbABZQkW+IGCCvfgCRmm8/0gnkg6sk31
	S4iTxk44iWWw5leYGUZgcfSVM14A+HMiuTvS1FZfcUhT8w7CnVMhe7NbEMJIU+ysOTOuiBpwoTms2
	GiR5/RzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9KWc-00DqCL-Sa; Thu, 07 Jul 2022 05:58:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9KWa-00DqBO-IB; Thu, 07 Jul 2022 05:58:05 +0000
X-UUID: aa7cef2f7f0540b298c1390465fa02bb-20220706
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:befc9d48-2930-4b8e-a9c1-3358f38a20bb,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:22d1a463-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: aa7cef2f7f0540b298c1390465fa02bb-20220706
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <johnson.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1236378927; Wed, 06 Jul 2022 22:57:57 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 7 Jul 2022 13:47:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 7 Jul 2022 13:47:12 +0800
From: Johnson Wang <johnson.wang@mediatek.com>
To: <ulf.hansson@linaro.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>
CC: <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Johnson Wang
	<johnson.wang@mediatek.com>
Subject: [PATCH] dt-bindings: mmc: Add compatible for MediaTek MT8188
Date: Thu, 7 Jul 2022 13:47:10 +0800
Message-ID: <20220707054710.1396-1-johnson.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_225804_637943_348D60A5 
X-CRM114-Status: UNSURE (   8.93  )
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

This commit adds dt-binding documentation of mmc for MediaTek MT8188 SoC
platform.

Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
---
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index 2a2e9fa8c188..3fbf33ad4f7c 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -32,6 +32,9 @@ properties:
       - items:
           - const: mediatek,mt8186-mmc
           - const: mediatek,mt8183-mmc
+      - items:
+          - const: mediatek,mt8188-mmc
+          - const: mediatek,mt8183-mmc
       - items:
           - const: mediatek,mt8192-mmc
           - const: mediatek,mt8183-mmc
-- 
2.18.0


