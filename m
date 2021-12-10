Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24862C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 17:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YgJHsyE2OYRW4azBxr6zMKa9rcPTnRD7iOUIZMyLHcI=; b=X4VfIDE9KTp5tr
	Y/6NjQbQ1TF0xGnn3rJzK13tDJ/Prm2GUjdff1wHdILMA4b5v8e2zx0zxIvdDFNALiNYi7D9DTzD/
	gQYZnq0wYLnSReqZqZm7Tj7HkZq9jXeKmVDbhVJ20iZgskNkuWxEI1RymJuqKiDJgnkAFl7oapko3
	Z/qualU+K/W0G8SB5exEIGARxHRTTS+JJghRjyD0pE03aH1lZxES8AxpaA9EsOHqUD4KbZf8LHJQE
	78vWk/SpGSiEgrpuaB5uPreoWsOkjLhnREHXsPl4JeBm+QKVsjH4Wt/VJFIrJurX5dcmwvevP3rA/
	59N25iV1dnKici7N6sWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvk1L-002zVL-UW; Fri, 10 Dec 2021 17:49:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvjzx-002ynp-2O; Fri, 10 Dec 2021 17:47:58 +0000
X-UUID: c2e06fa1b7814103a6d8858d9bf51b2a-20211210
X-UUID: c2e06fa1b7814103a6d8858d9bf51b2a-20211210
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1045587814; Fri, 10 Dec 2021 10:47:54 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Dec 2021 09:37:52 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 11 Dec 2021 01:37:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Dec 2021 01:37:50 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Flora
 Fu" <flora.fu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, JB Tsai
 <jb.tsai@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>
Subject: [PATCH 1/6] dt-bindings: soc: mediatek: apu: Add MT8195 APU power
 domain
Date: Sat, 11 Dec 2021 01:37:38 +0800
Message-ID: <20211210173743.30906-2-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211210173743.30906-1-flora.fu@mediatek.com>
References: <20211210173743.30906-1-flora.fu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_094757_154333_E344A6BE 
X-CRM114-Status: UNSURE (   7.43  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Document the MT8195 APU power domain bindings.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>

---
 .../devicetree/bindings/soc/mediatek/mediatek,apu-pm.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pm.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pm.yaml
index e1b7d4030dc9..66547f899014 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pm.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pm.yaml
@@ -21,6 +21,7 @@ properties:
     items:
       - enum:
           - mediatek,mt8192-apu-pm
+          - mediatek,mt8195-apu-pm
       - const: syscon
 
   reg:
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
