Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81265C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 14:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ENV++hi9zMryHHsI/u9cs24l/qS95g2/Ypwig41S7N8=; b=aNfOKmDD7AbJ0W
	mlnOVgrXcCDwgK8ZqFIDWwNiyplwdLaHUNH8EeW0d3TBa+f6eT3cq/vWLOqeE3+2HRsB64pKTHdE8
	RjC1e7CwGsTnN7k6R8JfF84IgboY3DktbELFUoZALD+CY0ZdEUmwnhJrTIxdgkSTGPSpwtmscvoCs
	+2WRegUvZGbLqarxS8ZdpROXKQI84v5af409kGSYQSiJ2/97vxyZN0WJQ9zjGNwIrEMfjzJNYs8v0
	Nt69aUMx1lImDrLD4XM/HtaaU1XTm21gIp2vhA/4sHQEI1XIviU51Hw5wlpmX+aDgoePf1ccHo+2P
	OjVF8r8s6e3lQl/5+kCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nltB9-0069CP-E6; Tue, 03 May 2022 14:07:03 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nltAh-0068xw-BS; Tue, 03 May 2022 14:06:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 9E4131F42D6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651586794;
 bh=ql/BpN5lmzD9fjXlRsrtZEO7EafrENS8JYhlrsgfa9s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P0aP5kkhB5SMqHgPYSnFLijiVJZju399eRbkzol8dkKVWSU5JdVC/QpR0wBPg3ERr
 +dg2XnGkoN1kzHHnVSuuRR3rPjC5DcC3SdZOcZZKC2auMfT3EuLoTIIAWLloSjvWw4
 7uG54PQmRy3SwkiC+t8m3q8yJ/aPgZeItomK8xKsnPfPWO+K3U76mI3tdg+8q1a16H
 wK46wl3qDYICe9w7uTE9pFgFCbogl7atCtdnunKxeWXErHtD/uJV6aIlKV7ULZBR4y
 keXYBT4n3x7e8PKHylfLdE/oXXP14rOFr4h92kwNefb6e+LEEfdn4Wg8MVUu1lHzQr
 0kFo7HztB2I/Q==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sean.wang@mediatek.com
Cc: vkoul@kernel.org, matthias.bgg@gmail.com, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 nfraprado@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 2/2] dmaengine: mediatek-cqdma: Add support for MediaTek
 MT6795
Date: Tue,  3 May 2022 16:06:24 +0200
Message-Id: <20220503140624.117213-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503140624.117213-1-angelogioacchino.delregno@collabora.com>
References: <20220503140624.117213-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_070635_595591_3A6BC20C 
X-CRM114-Status: UNSURE (   9.56  )
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

Add a compatible string and platform data for the Helio X10 MT6795 SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/dma/mediatek/mtk-cqdma.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-cqdma.c
index a2fb538d9483..e1772dbf50d5 100644
--- a/drivers/dma/mediatek/mtk-cqdma.c
+++ b/drivers/dma/mediatek/mtk-cqdma.c
@@ -757,8 +757,14 @@ static const struct mtk_cqdma_plat_data cqdma_mt6765 = {
 	.reg_src2 = 0x60,
 };
 
+static const struct mtk_cqdma_plat_data cqdma_mt6795 = {
+	.reg_dst2 = 0x44,
+	.reg_src2 = 0x40,
+};
+
 static const struct of_device_id mtk_cqdma_match[] = {
 	{ .compatible = "mediatek,mt6765-cqdma", .data = &cqdma_mt6765 },
+	{ .compatible = "mediatek,mt6795-cqdma", .data = &cqdma_mt6795 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_cqdma_match);
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
