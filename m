Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C809ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 03:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L0ySG7zkTVALi9ZIGfNEYqExvcGnXcFus3R5RMwOhuk=; b=JjqEPgMd73LIfa6GxbaRD0clU1
	paYK0H1E1gTuLvsY0aGIZ8Sl3h/k/Qk6gy8JyzrtLAt4xtFkf1yqzSBPABgVYauYn20JF0ZnlgECX
	e/7YEUZDNWj/jdzcuh5WJKGlEDXmW5MMluKGO5e1FltoKOzalIp1eqbREZZJOnhUc8LE8P9bBLCSg
	NbGtB70taqg6/9W4f5dl1YH7jLe6/J4Yv0n/26xzmhic0SI40N7H74zb2hSzcmhO0Yl/MBUNdrQai
	SwSfnsE1aR5eScGTuFyfp7LmLj88fU19V/wMhUewTnW0hKKER/4+2UDKOmFy5PuTboAkk6rEDddDu
	u+HYykUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obZg4-001osk-4B; Fri, 23 Sep 2022 03:48:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obYSp-001TUq-V4; Fri, 23 Sep 2022 02:30:53 +0000
X-UUID: 4ab56a07340c4e8f82735ab148fe3bc7-20220922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=L0ySG7zkTVALi9ZIGfNEYqExvcGnXcFus3R5RMwOhuk=;
	b=mkDm+FCwwylKtW9Ug8do3fV7IKBg4q1/+P93MkrqdarmNCUU8Dt0bN3CaHff6biBw1bHEg2+A+c/1GKMo7ckzRele2wxU8AKKdhrIN9wp4oDMVvSlGSurOERmALjeOdINbxkuAPpZZiSkoZK36L6o/c1dgH8BFRLz4ayPJK5vSs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:fc828ef3-1fec-4e3b-b9bb-957c14faa076,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:f8f2cba2-dc04-435c-b19b-71e131a5fc35,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 4ab56a07340c4e8f82735ab148fe3bc7-20220922
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <liangxu.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1096830910; Thu, 22 Sep 2022 19:30:45 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 23 Sep 2022 09:40:07 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 23 Sep 2022 09:40:06 +0800
From: <liangxu.xu@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <jitao.shi@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, liangxu xu
	<liangxu.xu@mediatek.com>
Subject: [PATCH] dt-bindings: display: mediatek: dp: Add compatible for MediaTek MT8188
Date: Fri, 23 Sep 2022 09:39:53 +0800
Message-ID: <20220923013953.5043-1-liangxu.xu@mediatek.com>
X-Mailer: git-send-email 2.12.5
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_193052_055935_7C2E86C8 
X-CRM114-Status: UNSURE (   7.65  )
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

From: liangxu xu <liangxu.xu@mediatek.com>

Add dt-binding documentation of dp for MediaTek MT8188 SoC.

Signed-off-by: liangxu xu <liangxu.xu@mediatek.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dp.yaml       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
index ff781f2174a0..2aef1eb32e11 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
@@ -21,6 +21,8 @@ description: |
 properties:
   compatible:
     enum:
+      - mediatek,mt8188-dp-tx
+      - mediatek,mt8188-edp-tx
       - mediatek,mt8195-dp-tx
       - mediatek,mt8195-edp-tx
 
-- 
2.25.1


