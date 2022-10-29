Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C25C433FE
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Oct 2022 11:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eBulF0Uf2mY8NE3+JkTIeQW5KKcz4EyooseItcq5YYg=; b=Bh5wUXotZX/XUxDqhZ88hxA1aL
	k9/2NrWGI3JC+2FrusxguXOUc9cE9jwrxvqjIFPwJyeY8DH83YLF6eVYyKpBIWYzGZ2G669Ba7cKV
	iXMA2i163TXuyq+MQeaHdb+VO47miHVdvel4iC1cFAjaeWC04nAuCKDneoDBKobcO32AvGiq/EUkk
	k3Hz2equnXlYvNQe8LkUKoAZIue0MTH9augwPPzmRLILPqatkww1J3D90YRLLNbI0hAJ6sBvE0wFT
	WPO18X+M0yCH+7C8L6W5jliouc8+/IfYIF69pEYlaobw4WrmwmaVpI444sDD1iCqiC7jYLhrvJWW0
	Br5qOVCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooju1-005wJe-4e; Sat, 29 Oct 2022 11:21:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oojty-005wIm-RS; Sat, 29 Oct 2022 11:21:24 +0000
X-UUID: 247a05483fa14fafad36288d1e142f8c-20221029
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=eBulF0Uf2mY8NE3+JkTIeQW5KKcz4EyooseItcq5YYg=;
	b=jVtvIXy7sjWINhINZq6R9bAvvYKYxc5MZgOq/7DD2Slf8yeW/dczRoKrFGOlohymMe83CG8/HArr5ASki2uIAfOeufmIhCCtv33FVUWrF4d+dcl0h3/newyfly1rP+fTyUmp+D3uGMLTRZZXgnRNnQjT9tl5d0NPyy6t55wghEM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:340ac8b2-dae3-4d64-90e7-e42693a01bdf,IP:0,U
	RL:0,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-META: VersionHash:62cd327,CLOUDID:023bd1ea-84ac-4628-a416-bc50d5503da6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:801|102,TC:nil,Content:3,EDM:-3,IP:n
	il,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 247a05483fa14fafad36288d1e142f8c-20221029
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <elvis.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1643146566; Sat, 29 Oct 2022 04:21:18 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Sat, 29 Oct 2022 18:50:43 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Sat, 29 Oct 2022 18:50:42 +0800
From: Elvis.Wang <Elvis.Wang@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Elvis Wang <Elvis.Wang@mediatek.com>
CC: Houlong Wei <houlong.wei@mediatek.com>, "jason-jh . lin"
	<jason-jh.lin@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH 2/2] dt-bindings: mailbox: mediatek,gce-mailbox: add mt8188 compatible name
Date: Sat, 29 Oct 2022 18:50:17 +0800
Message-ID: <20221029105017.20734-3-Elvis.Wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221029105017.20734-1-Elvis.Wang@mediatek.com>
References: <20221029105017.20734-1-Elvis.Wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221029_042122_916525_22AA30E5 
X-CRM114-Status: UNSURE (   8.86  )
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

From: Elvis Wang <Elvis.Wang@mediatek.com>

Add mt8188 compatible name.

Signed-off-by: Elvis Wang <Elvis.Wang@mediatek.com>
---
 .../devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
index c579ac074ca7..d383b2ab3ce8 100644
--- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
@@ -21,6 +21,7 @@ properties:
       - mediatek,mt8173-gce
       - mediatek,mt8183-gce
       - mediatek,mt8186-gce
+      - mediatek,mt8188-gce
       - mediatek,mt8192-gce
       - mediatek,mt8195-gce
 
-- 
2.18.0


