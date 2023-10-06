Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331BEE92FF5
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Oct 2023 07:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VP/1tDlzIPrQAvOfYhnWvYsMQpUhOw6iHjDPTiQLtRA=; b=fPBlbKZfCPx4JGMXTgB9UQAfF8
	t6j5f1fvAsbqK9I92MV5jmfBLRHAozHyE7L5dgT6J4s7mH+sy62WxRn4FpaUFYqWLlUceTUGOvmg5
	XmeEozP5B0+TcU3okSMruGbpwOyq6RoSOy4sbECnNBUtQoWMLNNBdphh8dP9nmdOwbKybfI7eoCNH
	NU43AE0oXvjJCrDhSzRfqd4NdMyA2EmcgwzQdYLnP0518awitvChg6UqLCZPZ7TRBmAiwPDpEq1Rh
	Y32VCrL5XeIwYl0CENaM+UmRqE8M0zkSZOvDueZLis3A8pbTxJ0k2AMMBq+1qrEuCYNweia9z2V1D
	WwnJjTQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qofQb-005AXt-0O;
	Fri, 06 Oct 2023 07:39:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qofQW-005AOD-0x;
	Fri, 06 Oct 2023 07:39:14 +0000
X-UUID: 6ffe1210641b11ee9b7791016c24628a-20231006
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=VP/1tDlzIPrQAvOfYhnWvYsMQpUhOw6iHjDPTiQLtRA=;
	b=Zep3L5kIdvNFY+GhugGRNVGJEKUZAnHXNzMiee1V8L6u7QtF/0XFfx/1fkPSggHO431zM2EBbaXwKvqnDt0sSwnuQ+ukuL4/KmcggkxbPm0jY3MALSDDy3K4IhsSf8GRsVGcr6o9b06S9R9KtKDvWOSyGKy8p4vNyl7q3i1aKw0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:5a73bf59-abdb-450b-a44f-54b5c4b83fb4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:28afc014-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 6ffe1210641b11ee9b7791016c24628a-20231006
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 441962312; Fri, 06 Oct 2023 00:39:10 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 6 Oct 2023 15:38:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 6 Oct 2023 15:38:34 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	Singo Chang <singo.chang@mediatek.com>, "Nancy . Lin"
	<nancy.lin@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	"Hsiao Chien Sung" <shawn.sung@mediatek.com>
Subject: [PATCH v7 03/23] dt-bindings: display: mediatek: merge: Add compatible for MT8188
Date: Fri, 6 Oct 2023 15:38:11 +0800
Message-ID: <20231006073831.10402-4-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231006073831.10402-1-shawn.sung@mediatek.com>
References: <20231006073831.10402-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.601500-8.000000
X-TMASE-MatchedRID: jhJi18RLqAIDh1tb/sWFHED6z8N1m1ALqm/9CTn1HV3fUZT83lbkEA0F
	DzFL1GEo4vM1YF6AJbbCCfuIMF6xLSdET58jp62SlrSahrV8ZuX2DoOQjbBxfp6wJ8RAqa75gmj
	xlWPJmv60oO6Ln1FEr3N1G0F6E6PP+jTS70Ufddk+xjS39zf5OS3QCb6fZPiZgITnGkK0NFNRsk
	XKHhdfKpij9M86UwHhsKHfMTjCprwNQJGvyiKf6Q==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.601500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: D988516E2A0183AC047B4E4C462E9117C23EE409236CAEAB346A92771C1D86002000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_003912_433570_3C981F36 
X-CRM114-Status: UNSURE (   7.76  )
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

Add compatible name for MediaTek MT8188 MERGE.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,merge.yaml   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
index eead5cb8636e..5c678695162e 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
@@ -27,6 +27,9 @@ properties:
       - items:
           - const: mediatek,mt6795-disp-merge
           - const: mediatek,mt8173-disp-merge
+      - items:
+          - const: mediatek,mt8188-disp-merge
+          - const: mediatek,mt8195-disp-merge
 
   reg:
     maxItems: 1
-- 
2.18.0


