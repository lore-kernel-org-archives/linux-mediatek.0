Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5951EC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 06:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=76kihvIEkFDM03t2xmvAgJl8Dphg7v1kM6e/JvmsQOE=; b=s8FuaoFIWRKGsx
	ZMo+09nAR3TBST6jOOiTvblkzKyGZof/5NC+SdCVe/NHR9u3lbZxTLy4wzYqk+nKSOS25T2CQs0VR
	hSQ2I5ypX04NTTdDzoL4RqSo7IlWysGBW/t0GD0qLe2yTa7IXfCVO+WbEe63WZvrXnpkqSXk1aJ+W
	lO0tIyh/gMxf+1GlgXuxz//MZoBb/RCzOTb92hoEHpkX8TudmJoH/kh0kmQtgQOK+e5Rs05tmFrOS
	zxIz/ANLCe1CmQc557kh4gNFSQQOwUMwJHUtQv9pbdOX+u3/+Qa6pUlsfjn2G31J1VI3iHSWlUzoT
	gN2+7kDYuD9MLXbuge3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8G1v-007uHb-T3; Fri, 14 Jan 2022 06:25:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8G1t-007uFF-CV
 for linux-mediatek@lists.infradead.org; Fri, 14 Jan 2022 06:25:42 +0000
X-UUID: 86805ab0c9a844a59b6868a01a3414db-20220113
X-UUID: 86805ab0c9a844a59b6868a01a3414db-20220113
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <guochun.mao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1803527018; Thu, 13 Jan 2022 23:24:29 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Jan 2022 22:24:28 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 14 Jan 2022 14:24:27 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Jan 2022 14:24:26 +0800
From: <guochun.mao@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Zhen Zhang <zhen.zhang@mediatek.com>, Bayi Cheng
 <bayi.cheng@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>, "Guochun
 Mao" <guochun.mao@mediatek.com>
Subject: [PATCH v1 3/4] spi: spi-mtk-nor: add new soc mt8186 support
Date: Fri, 14 Jan 2022 14:24:07 +0800
Message-ID: <20220114062408.9077-4-guochun.mao@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220114062408.9077-1-guochun.mao@mediatek.com>
References: <20220114062408.9077-1-guochun.mao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_222541_457564_F8276E92 
X-CRM114-Status: UNSURE (   8.95  )
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

From: Guochun Mao <guochun.mao@mediatek.com>

Add compatible mediatek,mt8186-nor implementation.

Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
Signed-off-by: Zhen Zhang <zhen.zhang@mediatek.com>
---
 drivers/spi/spi-mtk-nor.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index f3bcdc1d4d8b..f8f6e6c1b551 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -759,6 +759,11 @@ const struct mtk_nor_caps mtk_nor_caps_mt8173 = {
 	.extra_dummy_bit = 0,
 };
 
+const struct mtk_nor_caps mtk_nor_caps_mt8186 = {
+	.dma_bits = 32,
+	.extra_dummy_bit = 1,
+};
+
 const struct mtk_nor_caps mtk_nor_caps_mt8192 = {
 	.dma_bits = 36,
 	.extra_dummy_bit = 0,
@@ -766,6 +771,7 @@ const struct mtk_nor_caps mtk_nor_caps_mt8192 = {
 
 static const struct of_device_id mtk_nor_match[] = {
 	{ .compatible = "mediatek,mt8173-nor", .data = &mtk_nor_caps_mt8173 },
+	{ .compatible = "mediatek,mt8186-nor", .data = &mtk_nor_caps_mt8186 },
 	{ .compatible = "mediatek,mt8192-nor", .data = &mtk_nor_caps_mt8192 },
 	{ /* sentinel */ }
 };
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
