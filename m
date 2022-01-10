Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D34C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 09:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Dei9HF3ZkEbiz0eOBr+T9FqCtObv8SioVrHrto1p2w=; b=wL4YQvji5BkEQc
	GvsDqtVWMQ6qCcPublBc829UAVDxN2nT6hF44TJgXtxHVzD/aDGxB7UnPyy8/VWvBeViA4LrIKnhb
	gGN8FK473lU/U7tHiqJd2XmUObixGq6Ir6GaKVbqFBUGihMysTbvPFpD5CZTPhmhAAB+JbMOPD/kL
	ugg0xX+NZ6XU3kBwVEPIKQQRO+CPClKhB/CZEdlkd/thcyAWZ7avKA6b7INGHegYO0lT8ykTkwvtd
	2F/FCiD1HflEjmvY5A6bafkbG0k5+qXfQVLYom570X27AGvKOyQJ1uTX1grodr8tVz8WpNsau5PdE
	s7gvjxHKa1w8mVO6kC4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6qna-00AGcS-LB; Mon, 10 Jan 2022 09:17:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6qU2-00A67u-EN; Mon, 10 Jan 2022 08:56:55 +0000
X-UUID: 1109052424cb4336a088101024e75d42-20220110
X-UUID: 1109052424cb4336a088101024e75d42-20220110
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <guodong.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 437060197; Mon, 10 Jan 2022 01:56:52 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Jan 2022 00:48:47 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Jan 2022 16:48:45 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 10 Jan 2022 16:48:45 +0800
From: Guodong Liu <guodong.liu@mediatek.com>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>
CC: <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Guodong Liu
 <guodong.liu@mediatek.com>
Subject: [PATCH v1 2/2] iio: adc: mt8186: Add compatible node for mt8186
Date: Mon, 10 Jan 2022 16:48:41 +0800
Message-ID: <20220110084841.575-2-guodong.liu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220110084841.575-1-guodong.liu@mediatek.com>
References: <20220110084841.575-1-guodong.liu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_005654_517569_95C442B8 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This commit adds mt8186 compatible node.

Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
---
 drivers/iio/adc/mt6577_auxadc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/iio/adc/mt6577_auxadc.c b/drivers/iio/adc/mt6577_auxadc.c
index d4fccd52ef08..fb08d761589a 100644
--- a/drivers/iio/adc/mt6577_auxadc.c
+++ b/drivers/iio/adc/mt6577_auxadc.c
@@ -46,6 +46,11 @@ struct mt6577_auxadc_device {
 	const struct mtk_auxadc_compatible *dev_comp;
 };
 
+static const struct mtk_auxadc_compatible mt8186_compat = {
+	.sample_data_cali = false,
+	.check_global_idle = false,
+};
+
 static const struct mtk_auxadc_compatible mt8173_compat = {
 	.sample_data_cali = false,
 	.check_global_idle = true,
@@ -334,6 +339,7 @@ static const struct of_device_id mt6577_auxadc_of_match[] = {
 	{ .compatible = "mediatek,mt2712-auxadc", .data = &mt8173_compat},
 	{ .compatible = "mediatek,mt7622-auxadc", .data = &mt8173_compat},
 	{ .compatible = "mediatek,mt8173-auxadc", .data = &mt8173_compat},
+	{ .compatible = "mediatek,mt8186-auxadc", .data = &mt8186_compat},
 	{ .compatible = "mediatek,mt6765-auxadc", .data = &mt6765_compat},
 	{ }
 };
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
