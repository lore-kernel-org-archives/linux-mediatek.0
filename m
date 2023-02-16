Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B2AC61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 13:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qsSyYq+Qss+zPdIWKLya3SqY04aSJtbQX7OYAHoLry0=; b=FRSm6afI7FUgrk27DC3iAaEZat
	dNcaCqcGlWhnXVTBMZ0jenEH47xrQi6P03ZC1utFn3po+sCAvksox0LkeAiYwNrVyFSbuMmbEkxJ5
	++eNOkVJV8XgZ6WXBdaaBNcUE6RIr1fSJz/pTblw6uA3AR7o9xjnAVsoGlr+Kur3RykWsUigA1ihR
	vU3U7h7IlEjn93zaGrSS6XpE6Qu2hsrDdQ35yavvF2eHQh98ujwg6Cj/0ypzzJUV9JsEeIhhz7Wwh
	Rrp7uQQX35b96K8M54azXf9Q5Jhsrigui2SLs2Xv/Xgo6ra2y2tWuX7mElUqu+xinixZULLJL+If4
	zxPv0J6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSdtL-00AEak-U2; Thu, 16 Feb 2023 13:01:39 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSdsG-00AE3C-H1; Thu, 16 Feb 2023 13:00:35 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F37D566021AA;
	Thu, 16 Feb 2023 13:00:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676552429;
	bh=8zBu4kGYwwp9PXGSRlrzgSAywExWb3oFBHKR72jcTw0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xr36F/PtZtNxk+3TKAnY6WohFo7esdaFOj+uKoSq4m0fm9cN2bEIWFzNyhL1qpRhB
	 FEEYxUt/sY0ExU9aaXsBhoHuPIkx7mJxRbg+gzTi8S9l56dboeYCOtbOq8ZnFK99l3
	 KSR1R0CVczWzT6tEttlSPgxt+qUjbFkS9FEIhmkt0tCIA7DFwJY0Q8gAqGYr+Uuuts
	 gLwWiYgjHcMB0srvKpJ9aWitgyxorXcVuASvJQvvpXI0aveDlmTzeh+xD6SljLdr2M
	 tEW5zorsP7kULKmkbPmP0mkZBcM8C6PRvcXWlpnwlznW8h2sQmcCTl0iE7kUCHhvCx
	 uD0U1Igch7K4Q==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: jason-jh.lin@mediatek.com,
	chunkuang.hu@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v1 4/9] soc: mediatek: mtk-mmsys: Add MODULE_DEVICE_TABLE() to allow auto-load
Date: Thu, 16 Feb 2023 14:00:16 +0100
Message-Id: <20230216130021.64875-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216130021.64875-1-angelogioacchino.delregno@collabora.com>
References: <20230216130021.64875-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_050032_863031_3185C526 
X-CRM114-Status: UNSURE (   9.72  )
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

Allow module auto-loading by adding a MODULE_DEVICE_TABLE for
of_match_mmsys.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mmsys.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index fcf702fda92e..0f0fa27e17a5 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -391,6 +391,7 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
 	{ .compatible = "mediatek,mt8365-mmsys", .data = &mt8365_mmsys_driver_data },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_mtk_mmsys);
 
 static struct platform_driver mtk_mmsys_drv = {
 	.driver = {
-- 
2.39.1


