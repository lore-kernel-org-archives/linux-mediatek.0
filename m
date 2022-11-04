Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2D6C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Nov 2022 07:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lyffu8/VZ3rXBqY5LKX2OqRHXuF19YU8nElgz5QAR+o=; b=RPS3V3wZFKvzR1TtwJ+7ulVA1g
	H9xEsDda6Ew22q2pP+1ELzHIyjmvksT55uuHUznN+XkVtU0I0f5ke+0F9oczWFD+xmKg5Bilmli82
	hFnVSop/FdyYoxzlNJiFwsFatcsFCi/JPXnbn9iIE5uuj5NYGmYVQkkC0DHReYw5ONzABxfc2u8jM
	QF8N2LRT7OpJrU0udr42tPqi6FzYtHVlDZm7cw0HnQ25Fhm3uWJ5uvmLfqbqfRxgj01MckK2MXGlo
	FcSzCjbhuRuvj6P9I3v6n6sGNtRjNN13XZiVEprTlXVHgXJyoBYIu9IPskDBjlAnnMqXpkgMHF1VH
	YJVc1Q4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqrOm-002nkx-BY; Fri, 04 Nov 2022 07:45:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqrOj-002njW-88; Fri, 04 Nov 2022 07:45:54 +0000
X-UUID: 9db1add3e5104c5293653b18825282cb-20221104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Lyffu8/VZ3rXBqY5LKX2OqRHXuF19YU8nElgz5QAR+o=;
	b=Kpq+ynjHLx7TggC4fUKsZzNXtD5qoWNXz6vGleWpZehoiZykRneeGGzWcEP60uqr81R46Ur3NFC/JNbSMGYrnpFCPwRr0fAWDkaoxRa83wHUqH6CDIu0SAHkApJwG3r8OtGdm32dC+o+fvZF3lsmj0VKFcK9U+0vVZIz64U6ZXQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:cab6932b-f09e-458f-8666-6922cd0c6430,IP:0,U
	RL:0,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-META: VersionHash:62cd327,CLOUDID:17ab9590-1a78-4832-bd08-74b1519dcfbf,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:801|102,TC:nil,Content:3,EDM:-3,IP:n
	il,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 9db1add3e5104c5293653b18825282cb-20221104
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <elvis.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1841373778; Fri, 04 Nov 2022 00:45:50 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 4 Nov 2022 15:44:53 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 4 Nov 2022 15:44:52 +0800
From: Elvis.Wang <Elvis.Wang@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Elvis Wang <Elvis.Wang@mediatek.com>
CC: "jason-jh . lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 2/2] dt-bindings: mailbox: mediatek,gce-mailbox: add mt8188 compatible name
Date: Fri, 4 Nov 2022 15:44:43 +0800
Message-ID: <20221104074443.26172-3-Elvis.Wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104074443.26172-1-Elvis.Wang@mediatek.com>
References: <20221104074443.26172-1-Elvis.Wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_004553_334946_D601F6FE 
X-CRM114-Status: UNSURE (   8.72  )
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
Reviewed-by: AngeloGioacchino Del Regno<angelogioacchino.delregno@collabora.com>
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


