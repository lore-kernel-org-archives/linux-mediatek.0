Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9ACC5478C
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 02:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yY3BIsvyZurSoEka72INcoDoWgUOVqa0yYbaYp9hEmY=; b=TnNKAvlNjreEqqY4fpyPCrkaAv
	J/zlfu0RzX1KPbkGYYpRMQrVOVtzjoEd9gzPYez94hI1unTiz+JQeKGFZ0984sGbBAMOIHZHFpTJ4
	tftZeGOMARM0L5CUhqZKaeC+/Uoz/2rM+mZuE0XBjpM7e5SWQMv6YqgMwqi+OJm+lQ7Pf6XVVXmtV
	xb/MzK2aktemm8GwxtpTWlk5FC97cTlU+lzG3phDuOHE4mzJ6c6tLIrijx7KQonmUrQU0asV0PJ53
	n+EIbEw0qni0j/5XvHD42GOIfJTKb+J1hFYXfgZRltQOT6S9AtSWQppFFc2WOqCyy9ImvqXNzgQrO
	6GgTXBeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfWGm-0000000Bl7R-2fM5;
	Thu, 29 Feb 2024 02:35:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfWGk-0000000Bl5u-0FKF;
	Thu, 29 Feb 2024 02:35:35 +0000
X-UUID: 33324254d6ab11ee999fed2339b27864-20240228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=yY3BIsvyZurSoEka72INcoDoWgUOVqa0yYbaYp9hEmY=;
	b=EjBimrhvosm8I/WBvPLzz4EJ0lHGyj1vm70dK4xTfQc3cUk1se/dZvD7bw2KPG3ynHyVb3bS6mR36VwwAUCEx6dhY4ely6C6JMzqyWPBeNKa6VhAS3KCzfWEpK42oeBviDWllTJKpCFZSsAjXhnP25/w+UlztFCpWbF8NxNhzh4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:5db653c6-ce64-45cb-8e82-18eba06bda37,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:f2016e84-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 33324254d6ab11ee999fed2339b27864-20240228
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 230469980; Wed, 28 Feb 2024 19:35:28 -0700
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
Subject: [PATCH 2/3] dt-bindings: display: mediatek: gamma: Add support for MT8188
Date: Thu, 29 Feb 2024 10:35:21 +0800
Message-ID: <20240229023522.15870-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240229023522.15870-1-jason-jh.lin@mediatek.com>
References: <20240229023522.15870-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.030200-8.000000
X-TMASE-MatchedRID: gGgbIWz4XUwD2WXLXdz+ASoTaU3L23VCmyiLZetSf8mfop0ytGwvXiq2
	rl3dzGQ1GpeevGsoI5fcD83U+dJo519LOuIDKPNTwMMuFiQfpYqAQ6d7hpjcailGPFab7EIscBQ
	IwYJlxh1stWZHOrXdY8IxO3dsYhCHohuAb6vFA34XRoPmWO3jekxwdkPqCq7vDEyN+J8hd+jCS9
	WgDXVPCn7cGd19dSFd
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.030200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: EF87E081E3C75DD9D52C5825BF7CF7DEA606A74AAE7419520C7D4768CB7EB3E22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_183534_135512_0C6378A2 
X-CRM114-Status: UNSURE (   9.92  )
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
Cc: devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Shawn Sung <shawn.sung@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The gamma LUT setting of MT8188 and MT8195 are the same, so we create
a one of items for MT8188 to reuse the driver data settings of MT8195.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml  | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
index 3e6cb8f48bcc..90c454eea06f 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -29,6 +29,10 @@ properties:
           - enum:
               - mediatek,mt6795-disp-gamma
           - const: mediatek,mt8173-disp-gamma
+      - items:
+          - enum:
+              - mediatek,mt8188-disp-gamma
+          - const: mediatek,mt8195-disp-gamma
       - items:
           - enum:
               - mediatek,mt8186-disp-gamma
-- 
2.18.0


