Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D9BC54E49
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 02:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=siodBAxe3jUCZrekllMPYZtT9MUfipocRXBozlziOE8=; b=cPThAAa6BSdCJD3btdc9VPSbLe
	QJlwtiuDsqrUqCzfgdfc2T0hw14n7QpK4jAU5Wpcv85bmMbrv3habLk2Bv0JE3foCiziwEau2e2Ce
	LrpI6WTQGIxP6tLz9KH1i78OBDgqYFG1ZRKbg7D/0Ax6RtmFJsGxK6LT7GEfv2Oua0JqOxYTAlv8G
	zD8hfc3uNcMmC76AvcGzszpn5Gx3kwYtRwveikRUTrsQhXl1ydGH+eY8PwnrsMRJrXnNeWs3jjGaQ
	mvxdd3i9ifDUzpmKzcfkCM1wlI2ncV/A0raQcGxVTnwfJRmuyuu8uUvXW3T+o5eK9ufM+MJ+cRwRt
	6n93lvRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfWGp-0000000Bl8e-3YPU;
	Thu, 29 Feb 2024 02:35:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfWGk-0000000Bl6Y-3kFS;
	Thu, 29 Feb 2024 02:35:36 +0000
X-UUID: 33b9fc76d6ab11ee999fed2339b27864-20240228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=siodBAxe3jUCZrekllMPYZtT9MUfipocRXBozlziOE8=;
	b=A8YcOTyFl4kBo/wJlvI6NJ38kGOcdYNkEg+O5zzaq4nejcNeXWCfZzqoboC2IFC/7kD+ymHomA00hWigOGSB40W76AKhnX7WQhFkCrDTmm6GYjPbJjBz15fr6MCwqMvPcY5saaGtao6mfAkC0fQ59ygycOExrLWDDPJ1L6x7zCo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:f4ec3870-6d63-4761-9c51-adb8f3f6a949,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:69c752ff-c16b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 33b9fc76d6ab11ee999fed2339b27864-20240228
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 424245038; Wed, 28 Feb 2024 19:35:29 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 29 Feb 2024 10:35:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 29 Feb 2024 10:35:24 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
Subject: [PATCH 1/3] dt-bindings: display: mediatek: gamma: Change MT8195 to single enum group
Date: Thu, 29 Feb 2024 10:35:20 +0800
Message-ID: <20240229023522.15870-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240229023522.15870-1-jason-jh.lin@mediatek.com>
References: <20240229023522.15870-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10-0.572500-8.000000
X-TMASE-MatchedRID: oTn/OBj9AQ9nI6of4eefuQPZZctd3P4Bw8djaG0FrZu+pmoxzV3exqPF
	jJEFr+olwXCBO/GKkVr3FLeZXNZS4IzHo47z5Aa+gVKopVj7xjuRonGTfTkJZD4EzjOU/EVrj9s
	GszqT+V0l8T+a+xOPOoqQ9E/6HR7c2mNZXsYhBSMeg2EPxk5i2qr2rQs5XG7QeZUpm6wun3ba/0
	6NhYDa4wyzCDjlUx89p2y3mIB+it/DyDYcE1wXmQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10-0.572500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: D227AF03FD96C1C6792B7CFC21F09EC2EDF623B826802693F40BCA39B067FE412000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_183534_968994_AB47878A 
X-CRM114-Status: GOOD (  10.82  )
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
Cc: devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Shawn Sung <shawn.sung@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Since MT8195 gamma has multiple bank for 12 bits LUT and it is
different from any other SoC LUT setting.

So we move MT8195 compatible from the one of items to the
single enum group.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
index c6641acd75d6..3e6cb8f48bcc 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -24,6 +24,7 @@ properties:
       - enum:
           - mediatek,mt8173-disp-gamma
           - mediatek,mt8183-disp-gamma
+          - mediatek,mt8195-disp-gamma
       - items:
           - enum:
               - mediatek,mt6795-disp-gamma
@@ -33,7 +34,6 @@ properties:
               - mediatek,mt8186-disp-gamma
               - mediatek,mt8188-disp-gamma
               - mediatek,mt8192-disp-gamma
-              - mediatek,mt8195-disp-gamma
           - const: mediatek,mt8183-disp-gamma
 
   reg:
-- 
2.18.0


