Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DB5C6379F
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 10:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ctg8ERf/4rRDsGsd3RTSMaAAkHQavwE17jWyngyXiWw=; b=0owYyz3sr6CYMpk72RXdtFOoOr
	eUN+aBMcWpZwn99IOz2CJ2y/q9hAjEmqvvvveP9UAbkgQpOBXvWSH092UE1JQntpQc4j8CdTJdhuz
	BVPo44pPNKc7f6TZgx2hfoxLaNuvh8LiGMmuB1qMgqvdsc5Q8O+foZfPTCtivdubn1msH+HyydGch
	1GI/Nr5tJMjfzE4Fpeuey+xlunNeKCIiJFWc7qtkYEBz4dEe+ii+LmlX4hfvhN7zdLrZopwZDo0ye
	ge/bbISUkZCTOo2KLvVSWJ9U+mwyvblhZpbFXOWESZuc1yCDTIfRKCbK8DmfLrMIwk3DglGhCm9x5
	wELa939A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUmMx-00BvZo-L7; Wed, 22 Feb 2023 10:29:03 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUleR-00BYg9-Qn; Wed, 22 Feb 2023 09:43:05 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 00AB766021BC;
	Wed, 22 Feb 2023 09:43:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677058982;
	bh=HdA9LzRyfYNiXvz7Hffi4ApU2JZCzXJht1XHORTPc54=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aj2IRggvt5KoR/paEff124zVV1bz7iA05sKUjbBbqW53DSgsrF8Ac/HSDp9MWgTPS
	 HCEO/WtQLd3yHAz+y093jCIDbYYvNkG4FSh3yTRWXVMKQ+o3m164hFc9o3K2RA3OLO
	 DlWsdQcMy7Y+l8cQoLZMs/jiS10fdbjVz6XMmRDk6zQFPyIiXNywAbaDYA5/ZBlmJZ
	 IiqjB8+S4VW5TWxrsSsFtb+B6Cj+O9Z+K+o/8pO/bg/YVMWnqSp9oxyQW/ayp5tbjB
	 DcAzhUnKvKoO4Vr6zuprIgzbgbLnuziDblLf2e+xnq84MjeDErNiD61Ibm35tP4Fg6
	 zI4jnG1pL1B5A==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: jason-jh.lin@mediatek.com,
	chunkuang.hu@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v2 4/9] soc: mediatek: mtk-mmsys: Add MODULE_DEVICE_TABLE() to allow auto-load
Date: Wed, 22 Feb 2023 10:42:48 +0100
Message-Id: <20230222094253.23678-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222094253.23678-1-angelogioacchino.delregno@collabora.com>
References: <20230222094253.23678-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_014304_028119_A1223209 
X-CRM114-Status: UNSURE (   9.87  )
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
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
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
2.39.2


