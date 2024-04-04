Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347E5CD1284
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Apr 2024 08:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=928WMazBTQiFul/v7tsYd25ECLQJ/jMJ7+LkLZ0468I=; b=blI+BZBZFHIfgAIvzTAnq0Bu6T
	pOSaQO1ugPY4BRxiM2nSb9H/UVIJ9WgL29YzoL96rOhTZS/ywols9up355dlcJXIsoCcyUGgLeG2n
	BMwY2Rqvu5VmDKEpJJguG4jh8izSScuOZz+M4DH82lV0w6YmeIis1Foyek+F8ESeH9jOXWjjBMs2U
	TI/XsVXxzfWYdmsbt6inDCVkAloLTfmHsqoKa8OUla104OfLKpwBT5E8o0qgHN1RZ+4sSEb/HtRWn
	Nm3H53eV8jfuS/kyr3/syl6f0BF3QCWFKkqIB8wR4+LXXAIXaOKUDw5SdN9gaw4xPiTVhksKHixyH
	SoKz2gAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsILQ-00000001ouV-2Ubo;
	Thu, 04 Apr 2024 08:21:12 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsILM-00000001otb-3ln3;
	Thu, 04 Apr 2024 08:21:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712218867;
	bh=ZEtC6p3eqLajMjSFMEfgcznQoOgf/GOK5EvLHiJ18k8=;
	h=From:To:Cc:Subject:Date:From;
	b=QUIfpFikDU1gQstK+WVQ7bUPCL1a3RRJEdM0fDR9v0qyLyoXHZt7BI6PXVHUG13Te
	 HQs3XV55VoppCjXHij20Igpnrp4AvSeA/uhyVcBzmBOLhyQvs6zz2MtWkMVNvyaKoO
	 oxmyQwHDldv84KduEQnF9KT1pXbHXflpZb9ZhzTE71uawyCUxnHyu/yjLhVhELDZFy
	 1xur4Om8W3Lo7O5803zxGJt1lCbGX0sVIGJTJhixqBEdq7nNEPCJqybdolHycT8Ko8
	 CaRpm3rSz0sGZcRoAvyV0/ZVT76+udpreaOR1st2JlZBN81OVieERaeibPnMWLgVZI
	 QUI+jvmOV4HVA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B6B2837813A4;
	Thu,  4 Apr 2024 08:21:06 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org,
	kernel@collabora.com
Subject: [PATCH] soc: mediatek: mtk-socinfo: Add entry for MT8395AV/ZA Genio 1200
Date: Thu,  4 Apr 2024 10:20:56 +0200
Message-ID: <20240404082056.93454-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_012109_088176_CC516384 
X-CRM114-Status: UNSURE (   7.92  )
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

Add an entry for the MT8395 SoC with commercial name Genio 1200.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mtk-socinfo.c b/drivers/soc/mediatek/mtk-socinfo.c
index 4494cca1d075..6943ab29f095 100644
--- a/drivers/soc/mediatek/mtk-socinfo.c
+++ b/drivers/soc/mediatek/mtk-socinfo.c
@@ -56,6 +56,7 @@ static struct socinfo_data socinfo_data_table[] = {
 	MTK_SOCINFO_ENTRY("MT8195", "MT8195GV/EHZA", "Kompanio 1200", 0x81950304, CELL_NOT_USED),
 	MTK_SOCINFO_ENTRY("MT8195", "MT8195TV/EZA", "Kompanio 1380", 0x81950400, CELL_NOT_USED),
 	MTK_SOCINFO_ENTRY("MT8195", "MT8195TV/EHZA", "Kompanio 1380", 0x81950404, CELL_NOT_USED),
+	MTK_SOCINFO_ENTRY("MT8395", "MT8395AV/ZA", "Genio 1200", 0x83950100, CELL_NOT_USED),
 };
 
 static int mtk_socinfo_create_socinfo_node(struct mtk_socinfo *mtk_socinfop)
-- 
2.44.0


