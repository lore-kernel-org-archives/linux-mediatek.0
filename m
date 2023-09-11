Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24258EE57DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 10:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=otZBXVYJ7V2gQhC8KQjEU1AvrlFD4SS/KjjSDlReZ90=; b=ZEdkuQOfP4wOSiib6m5u6MJ4lZ
	k2h08XNrIxapbAXgfIVAWTt/Z4jdtK3KwDiVecc0QQRzr1WQOjqqJp5DvUI8fA52lvoYr00Pigbqy
	lht8uYfVRALRCelNQUTUKfU1Pym+qADBU9Jp5tr2Es9Hmhuu19KGuH76SmXIl5TaTFS9e362vX9/G
	DmI1O3KqoJf/8tD36JfW0v22JkVDB87Vh01YJct0vk7PfvIGQpkxCd9Aqgp3Gvz9DTwVoBTlePRh7
	VsuFUglgtqZvhuWPxhHONnJicj/NR9jPtyuFdusXerQBJNoL4mf7yKQor8q7O9A8YPV11t64tx1hB
	eX3fJ0tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfecM-000Khe-38;
	Mon, 11 Sep 2023 10:58:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfecJ-000Kcr-1f;
	Mon, 11 Sep 2023 10:58:08 +0000
X-UUID: 1156f2dc509211ee9b7791016c24628a-20230911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=otZBXVYJ7V2gQhC8KQjEU1AvrlFD4SS/KjjSDlReZ90=;
	b=PLCuyik820JfOqKGJimjane79iehjqYQPD+7L7kEEOVdABKRTwxdU/r7HBfbfuJd27cXAlrkgTPZFCF+4qI9OZoBE4qWCFO5IxDs5smRC/+id0CMC+cRok6c2cbiH9xgWwgidD5glmsE44wje1tE+ZvE4B+XtiVpeHf4qOHJTxY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:43932479-d6e3-4708-9bf6-271d5af0d216,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:756ccd13-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 1156f2dc509211ee9b7791016c24628a-20230911
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <shuijing.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1212257407; Mon, 11 Sep 2023 03:57:58 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 11 Sep 2023 18:57:21 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 11 Sep 2023 18:57:20 +0800
From: Shuijing Li <shuijing.li@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
	<daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Shuijing Li
	<shuijing.li@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3,1/3] dt-bindings: display: mediatek: dsi: Add compatible for MediaTek MT8188
Date: Mon, 11 Sep 2023 18:57:34 +0800
Message-ID: <20230911105736.11752-2-shuijing.li@mediatek.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230911105736.11752-1-shuijing.li@mediatek.com>
References: <20230911105736.11752-1-shuijing.li@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.152100-8.000000
X-TMASE-MatchedRID: D0VXqQ1iI8d0BEBFOTiHn2CnlTu2jBBznG8msLIkY3ejxYyRBa/qJcFw
	gTvxipFajoczmuoPCq0pKcsqLFaS4PYkeosi/YzlghV+E66Bg8C5a0qdOeuId/62HTAiUgV2612
	iSTkqQN4vzoIuCUru3XNL064ByjGAKnfSXHt7N1niw6uxviJP8r9tsSiUciBlQ5zsaM5qada/lr
	1yYih0SzMPwdnhe8nZlExlQIQeRG0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.152100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 7F4BB218B74CDE0E8C4DD2880589892FB0C95ED90133D61D4EC8D9BFB29A4C7F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_035807_558728_A45FE277 
X-CRM114-Status: UNSURE (   7.66  )
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

Add dt-binding documentation of dsi for MediaTek MT8188 SoC.

Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dsi.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
index 12441b937684..537e5304b730 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
@@ -30,6 +30,7 @@ properties:
           - mediatek,mt8173-dsi
           - mediatek,mt8183-dsi
           - mediatek,mt8186-dsi
+          - mediatek,mt8188-dsi
       - items:
           - enum:
               - mediatek,mt6795-dsi
-- 
2.40.1


