Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE69C0219B
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Feb 2025 12:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xqk0H2ycKvl+JBGD4e2jUVl7so4lMUSwhls6hqomkM=; b=irvF8UfBNk/tYfAWHXElqetYHB
	1tsXx5TiIDOPQ3Bi1KXK+V4k06Hg2sgg2ihZS8WmUB4w/zYkwTiIjXTtXl3cxyj12CoxQaChssSYl
	nt516UTbUYJMwnCT9ATPYKVXjfDaSz7dPC/jqjcdQnk8RE3j2qEx9DybYETY83y+IA1xfOguuEg9L
	yFkfbKT8SsRtT5TyU3ff4qmTCke74FGV8RAOo/rf9KGS+SqiE88fBKTtV6f/tEfXQVhk08tdP4iG7
	nbtD9Thpw5h5o32lvwVslnZ0tgXuCUwoxSQ/+RPH6QBJDdhw8LfG8u5K35Ml+qws/OadQdsDSN8tT
	DQeyR22A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thpDV-00000003kFG-2vc0;
	Tue, 11 Feb 2025 12:18:17 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thoXi-00000003Z5f-0ywa;
	Tue, 11 Feb 2025 11:35:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739273705;
	bh=a3hLnJudcxQA/+esIRp1SpuZ0KWSZ19ubGovf8MoZ3E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cj2NzvKIJ28NDK7kZF2Kk7OSBiyOka0cz7/Ul4qHmJRN67cehI57jPRaOgyk3n42c
	 4KQ8cC1DeaE3K9pIYuQsQAiRBZ6pKQn1KMJrrAwRFQ8Mrz/FF6uPmDFswJz7jOCD/d
	 TtwUpqfCiFjiplo6gVoy2nCpdScoWWV9nU3uDaopEKnbINTPNGjXuzNBMFcci8zClt
	 JMy40HlPLxJFC34aq0rTtQ65iO8ESkHmgadu4X+HZmUsxHWlKT1eadIdQd2eDNPNes
	 U/3JjTp8E8FRd23lJGfKNKkgksWeFoZUBpemgszoIGZfMUa5modtiiJauhoxlOM1Ch
	 ojFOzjmber9NQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A5F0617E1562;
	Tue, 11 Feb 2025 12:35:03 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	jie.qiu@mediatek.com,
	junzhi.zhao@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	dmitry.baryshkov@linaro.org,
	lewis.liao@mediatek.com,
	ives.chenjh@mediatek.com,
	tommyyl.chen@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH v6 30/42] drm/mediatek: mtk_hdmi: Remove goto in mtk_hdmi_clk_enable_audio()
Date: Tue, 11 Feb 2025 12:33:57 +0100
Message-ID: <20250211113409.1517534-31-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
References: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_033506_441461_ED230B8B 
X-CRM114-Status: GOOD (  11.41  )
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

If the clk_prepare_enable() call for the SPDIF clock fails, just
disable and unprepare the clock in the error check branch and
return immediately instead of jumping to the end with a goto,
slightly reducing code size.

This commit brings no functional changes.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index ae5023298ff4..9c929092a9a9 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1095,13 +1095,12 @@ static int mtk_hdmi_clk_enable_audio(struct mtk_hdmi *hdmi)
 		return ret;
 
 	ret = clk_prepare_enable(hdmi->clk[MTK_HDMI_CLK_AUD_SPDIF]);
-	if (ret)
-		goto err;
+	if (ret) {
+		clk_disable_unprepare(hdmi->clk[MTK_HDMI_CLK_AUD_BCLK]);
+		return ret;
+	}
 
 	return 0;
-err:
-	clk_disable_unprepare(hdmi->clk[MTK_HDMI_CLK_AUD_BCLK]);
-	return ret;
 }
 
 static void mtk_hdmi_clk_disable_audio(struct mtk_hdmi *hdmi)
-- 
2.48.1


