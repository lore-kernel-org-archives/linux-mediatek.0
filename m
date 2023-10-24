Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 866B3C25B6C
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 13:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zT0/dVzTq/5/KwjP2Gaq1AJNyFqB1WS0NxFr2ZWObRU=; b=Mu+/oAdhYvCB0sS7N0SY6YPLKr
	6IRja1AxM4aCY5RLqJHB/Jsj94NcJydwPJn48xauLC0hQB1yv1/f6inULbr70kFT7HQq4kgkRF0Y2
	noe2uZ4TpwGLFSiG1E+PK7xImSJP62xR0+sJi751uT7YdEqqlSqZGLLCYkxI/HuG7+RCN0g3ksItr
	SVgsZnkU6ZZu/HGuDVfC0jG8FZCFAQApEaW6b0+kIMMz3ogk1eBTzjHXB/iOQLd2x7J2vYnusInoZ
	YxpOoq5o5VHuyMsbBsTtyXAOezXLt3YisgbJWojbtJeMU+hf2ie2pXony6yO7uEVG7NX5GWzxZ6RS
	p4SNOQtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvH4T-009s8k-0m;
	Tue, 24 Oct 2023 13:03:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvH2b-009r6G-0b;
	Tue, 24 Oct 2023 13:01:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zT0/dVzTq/5/KwjP2Gaq1AJNyFqB1WS0NxFr2ZWObRU=; b=hCL91CC/k3HOXemJ5w1iV1GcCC
	Mb9VE56lx8XiqO+oIVBZDxRKXbrHnRRhfWxB9LknJBLpu5Y7rtpc8AWHTbIyyY9hGwzfAQXBznN+f
	ITqTHrI8g7F0ubpL41LckzZ0457+TziOAEoX+UPPNjUXx5SlNF6fVtmQVQO4JrXkZRLu97MUU4tIf
	hbXQp46w8RwU9VFdOd5bZkZsA7w/3lT99dgdTA0hAqAshjQBVe+UJBqLJZGWHzl4we0VhEPPxElqX
	MaEtuF81Si+yeH1mFK2hZjcIV8JP7KaY4k8wHb7vR5wdNtZ2RMPVsfiobl1zg7aEQ9d+NhxlouHEZ
	cDOyqxwg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvH2R-00FWTF-1G;
	Tue, 24 Oct 2023 13:01:43 +0000
X-UUID: 714cd4de726d11ee9b7791016c24628a-20231024
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=zT0/dVzTq/5/KwjP2Gaq1AJNyFqB1WS0NxFr2ZWObRU=;
	b=AE7G4qiQnmG+gYORHPvx+fmqQ2yiM1wiP6SfrH/fiNFrou8IAFMmJssUlWQ78H7FK8ndnKSNDgs9L5opeHJladfX61Oka4Np07WT+6rJ5KBRy2GWvJGc9paEWLnBkfKb0eenJc/yAVrW4F9UMYk6JyvyWMXT22HJ/VZzHAJQznM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:53d3be92-247b-4573-8019-871e5417ac58,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:98dbb6fb-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 714cd4de726d11ee9b7791016c24628a-20231024
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 212109397; Tue, 24 Oct 2023 06:01:27 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 24 Oct 2023 21:00:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 24 Oct 2023 21:00:52 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v11 02/23] dt-bindings: display: mediatek: mdp-rdma: Add compatible for MT8188
Date: Tue, 24 Oct 2023 21:00:27 +0800
Message-ID: <20231024130048.14749-3-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231024130048.14749-1-shawn.sung@mediatek.com>
References: <20231024130048.14749-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.514200-8.000000
X-TMASE-MatchedRID: tiRXYRqWr+sDh1tb/sWFHED6z8N1m1ALqm/9CTn1HV3fUZT83lbkED1/
	uZDvFhzjSBg3ErWyNT+HEeMTfR0Cex8TzIzimOwPC24oEZ6SpSmb4wHqRpnaDnM7QywOsMaA7nm
	J4V/Qs0LD2w3h4bqG8G78Q8SFinQH1YTFGXn+YVpCGhrVBcn9nye2Q1OA/Wt49hViwM+K6rnffS
	22Lf8M9Ema3zYT97IFAYfQIAUhBayZvmCbKVb49sZL6x5U/HridGByp+zdaDg=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.514200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 1431D1231A71FC52505C3B5F46BB337BB03382A4E2FB49E535DCF0B9821DCCD62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_140139_958600_CFC174C1 
X-CRM114-Status: UNSURE (   8.55  )
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Moudy Ho <moudy.ho@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Johnson Wang <johnson.wang@mediatek.corp-partner.google.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Hsiao Chien Sung <shawn.sung@mediatek.com>, Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add compatible name for MediaTek MT8188 MDP-RDMA.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 .../bindings/display/mediatek/mediatek,mdp-rdma.yaml        | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
index dd12e2ff685c..7570a0684967 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-rdma.yaml
@@ -21,7 +21,11 @@ description:
 
 properties:
   compatible:
-    const: mediatek,mt8195-vdo1-rdma
+    oneOf:
+      - const: mediatek,mt8195-vdo1-rdma
+      - items:
+          - const: mediatek,mt8188-vdo1-rdma
+          - const: mediatek,mt8195-vdo1-rdma
 
   reg:
     maxItems: 1
-- 
2.18.0


