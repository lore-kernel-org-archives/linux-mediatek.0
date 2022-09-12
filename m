Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8B1ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Sep 2022 01:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O3LUqg31O+VB4iMjWdOGL0PoqlmvD6Jw/XCEotzP8UA=; b=mjNZmXEsD6ryZxj0ZZxMNk/hSJ
	0jZsqOfB3j0g2w4vzYSxU7X3jWB6XVZKnEn+GQ1+N1zh6rNiqwvT1lrp82Gh+hfN1v5jScWSOw8hg
	HkdblZie4X087ltABPMR2JdWu3afYnl1MKuOfMSZQgBwY3tlzeiyIJ1yHajQKbwje/vOCteKxJaIK
	ttrcvC0XQrbaE2GQmJ9O7KulwTYdNeTyMHrM3jj/vMfzIW8UHojS67ndNNLm9zzcKa0IRuuUAfXM+
	b7/Wl6iAT7WVf4WmesXyY7+gP8U+uet4E62TS1XLY4YofYh/1K6Hgiksu4mE67w0feEcbaGajYr0H
	lJwAszsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXYhP-0065w1-Oz; Mon, 12 Sep 2022 01:57:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXYh8-0065nW-Tj; Mon, 12 Sep 2022 01:57:10 +0000
X-UUID: f8883d958adf423c9140b57f39ada948-20220911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=O3LUqg31O+VB4iMjWdOGL0PoqlmvD6Jw/XCEotzP8UA=;
	b=SD3khOH5gft3LWYeG4NQOIhnEevMZyDrVdmiObQt9nL4bd0DIHgkO/H7FHkLywZWobjiO9NSXxD2fzdLvWc1QDZjc1OVOg7CC61oU0ZsLwjb1z6hv+YspJjDHAbgK32gXw+ykPHodOh1+89at++xQu9jbF7/WAfW8ubRWVom4I8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:849648fa-9ef7-4265-800e-6abe5e412f51,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:3281465d-5ed4-4e28-8b00-66ed9f042fbd,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: f8883d958adf423c9140b57f39ada948-20220911
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 329916796; Sun, 11 Sep 2022 18:50:41 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 12 Sep 2022 09:30:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 12 Sep 2022 09:30:06 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, Singo
 Chang <singo.chang@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, zheng-yan.chen
	<zheng-yan.chen@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>
Subject: [PATCH RESEND v3 1/9] dt-bindings: mediatek: modify item formatting for gamma
Date: Mon, 12 Sep 2022 09:29:58 +0800
Message-ID: <20220912013006.27541-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220912013006.27541-1-jason-jh.lin@mediatek.com>
References: <20220912013006.27541-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220911_185708_741799_2F972243 
X-CRM114-Status: UNSURE (   9.37  )
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

From: "zheng-yan.chen" <zheng-yan.chen@mediatek.com>

Since the items with only one const should be dedicated as enum,
merge all such items into one enum item.

Fixes: 4ed545e7d100 ("dt-bindings: display: mediatek: disp: split each block to individual yaml")
Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 .../bindings/display/mediatek/mediatek,gamma.yaml           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
index a89ea0ea7542..c3631a3e3f05 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -22,9 +22,9 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: mediatek,mt8173-disp-gamma
-      - items:
-          - const: mediatek,mt8183-disp-gamma
+          - enum:
+              - mediatek,mt8173-disp-gamma
+              - mediatek,mt8183-disp-gamma
       - items:
           - enum:
               - mediatek,mt8186-disp-gamma
-- 
2.18.0


