Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A29CC43217
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Mar 2022 09:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bD7wuhql5bTOMUyAlTB3MrqHB33e486MVkQPWq17Ehc=; b=P9t6gz6KDsLZqB
	Vw58I4hc+GXklOXCZ6vSnVtTNX7PVvMedAlwaL/K6o/L+21nFfUyfSY+cyMVTArCrpb12WpAZYGnj
	6bHCF9hSLpHAa3jp9/Udn7j5I2pSDJfrp8RzAbEjav5jIv8nz0KVPet4NLWuXVHf8kH6BUYQXIgX6
	Y4obeTYsAAPvfROJL/sPEowS/yV6pzNbSfFGJHRNrZu9Rps+eBtu/h/57gXqAFocxNlLrKS2Sx9cG
	SpdcbNZvF/FRxo8ktJ1f99vwRfCnpvdLRmexYEN2Tra+Jd5VSbXsrHp/lCuslNKjLBKnG2BtBUdgD
	Qww6ZXnhqk8hc8ZCcfUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWx9s-00DDjv-RG; Wed, 23 Mar 2022 09:20:00 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWx9g-00DDhH-Fg; Wed, 23 Mar 2022 09:19:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 944671F43FE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648027185;
 bh=Knb3Qbz4FitufncDzqCAXY9iWmZ7oO2JSE4/JnyALn8=;
 h=From:To:Cc:Subject:Date:From;
 b=XGwOPIe2HYdU9TA+y06TluGf1bR0lZefNH5+gEcIAZBM/eQLWcnKIgS44l8x1HE39
 oFb8+spytzkN1/C8bUEPowRsB0Vj9XIrInGe5xiYLAFbnzmxf+XR/lRJuX18t/zWwG
 m47keWojG2LHU1FnBoAIq9X+Fkrd5Jjr8f6tDo9pGU/2ilPTJmALeB6Z2c6FfWSDVp
 kcnhzcEu7Sn447yW0CerVS8bNy8SbHAcJUGKZD0rRH9uKIOh4T8ypYgbPMkjRg2AlN
 RZY4iayneA5Y4fPh3KY582mrmFONwVCuzZZZEddLKJ0i4jqohN4tuaJhaSz20qestH
 KNixtcFQRR6mw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 rex-bc.chen@mediatek.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2] soc: mediatek: mmsys: Add sw0_rst_offset for MT8192
Date: Wed, 23 Mar 2022 10:19:32 +0100
Message-Id: <20220323091932.10648-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_021948_734382_52859673 
X-CRM114-Status: UNSURE (   9.73  )
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

MT8192 has the same sw0 reset offset as MT8186: add the parameter
to be able to use mmsys as a reset controller for managing at
least the DSI reset line.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

v2: Change the offset to 0x160 (as defined for MT8186). Thanks, Rex-BC!

 drivers/soc/mediatek/mtk-mmsys.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 4fc4c2c9ea20..f69521fabcce 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -70,6 +70,7 @@ static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
 	.clk_driver = "clk-mt8192-mm",
 	.routes = mmsys_mt8192_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_mt8192_routing_table),
+	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
 };
 
 static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
