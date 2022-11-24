Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7796C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Nov 2022 07:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lyffu8/VZ3rXBqY5LKX2OqRHXuF19YU8nElgz5QAR+o=; b=Llc9nl3sFIQJH6zNvtDGwO45u8
	nDgNG7JBPSKYQbYS6AmfCAh2TxVnZWdxbx+aM0HueCamEVOhDgQ0xvx7R23G8yMPkCmN65LAvleFF
	ZTn9YNJsn581N7h+FMvz5zTuf/aaqWMIGHTLxIzAeLv2EmX5QCfnsxZpGd0UQGxuyaQNn1FZ1aISB
	DnOGg00Ie6JYuLMs0O6IHMv4BClnnEN1JiSUFLXAXAP/Ac2X2aebTCvxoc6JDyFodDZ3yb7FM4Zkd
	QZq84AZoMXUPWqEioafH/vPy/ecMz/HQ+j80fELGO1MrRIwibPvDQaiVRc0lm3w3eS6W/ey1d5KeY
	semnmzrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy760-006OOl-7b; Thu, 24 Nov 2022 07:56:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy75n-006OJ0-RI; Thu, 24 Nov 2022 07:56:21 +0000
X-UUID: 1b46a019487b473eac700d5d6647e46b-20221124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Lyffu8/VZ3rXBqY5LKX2OqRHXuF19YU8nElgz5QAR+o=;
	b=Kf7DajNWDgRhoCsqj3+EGGTHTgvdVeno02hVv/7Q/fzcjidJBrcvzQdQ8HNdBEX2an7b9vWx8by8kJeCiGc3qPAQQ4I+J0Bsw1hEiB/iESl5/2rHksnwHKdKzPjLL7E05y7gSFXx/eEosXQ4Inngdy/R9kcDqvPAbwvcJWpmV0A=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Spam_GS6885AD
X-CID-O-INFO: VERSION:1.1.14,REQID:a21569f2-7e88-4605-9265-7448c24bef77,IP:0,U
	RL:0,TC:0,Content:100,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS6885AD,A
	CTION:quarantine,TS:200
X-CID-INFO: VERSION:1.1.14,REQID:a21569f2-7e88-4605-9265-7448c24bef77,IP:0,URL
	:0,TC:0,Content:100,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_HTS54396,ACT
	ION:quarantine,TS:200
X-CID-META: VersionHash:dcaaed0,CLOUDID:b4deb32f-2938-482e-aafd-98d66723b8a9,B
	ulkID:2211241555411V7KIS32,BulkQuantity:1,Recheck:0,SF:38|28|16|19|48|801,
	TC:nil,Content:3,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,CO
	L:0
X-UUID: 1b46a019487b473eac700d5d6647e46b-20221124
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <elvis.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1907809654; Thu, 24 Nov 2022 00:56:15 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 24 Nov 2022 15:55:38 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 24 Nov 2022 15:55:37 +0800
From: Elvis.Wang <Elvis.Wang@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: "jason-jh . lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Elvis Wang
	<Elvis.Wang@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: [PATCH v4 2/2] dt-bindings: mailbox: mediatek,gce-mailbox: add mt8188 compatible name
Date: Thu, 24 Nov 2022 15:55:16 +0800
Message-ID: <20221124075516.1669-3-Elvis.Wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124075516.1669-1-Elvis.Wang@mediatek.com>
References: <20221124075516.1669-1-Elvis.Wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_235619_912241_46C9B8A1 
X-CRM114-Status: UNSURE (   8.76  )
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


