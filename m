Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29340C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 11:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dk3xHN+V577GAx/5saXC5Y5AJtUQ0vMFEoTNneQKWnk=; b=Hefhx54iQi2ZaJ
	1+u+eKhwVSQCBoKdCmL6USjlD+keO21vcduYgbhkYpFKsAeLsYLBOVqbgHcu9RIZb/ItLnYSAOUnF
	mOJHcK6QdPkLCmtH/krf2vBZdtUR/K2qNw35nMxDXN9UhtAHs5/C+52v1xlb6z+R8OJb1lexao8JO
	y/eO1DUhpsGKWZg58Av0iOZdZvGtLS8egSNwvqDR/rQUzls4KGCguF3ifV6TNQ0ZBbcK6kcn6zSZR
	A89tO0/WDOFu4C90vhfHVIGUfShO0bXdjs2uqQsEpdTuy0TPfKxpY2zUmNwFB3qQyHDx7Ln4VBeiB
	XhftEEpw7/NT2PUsyxjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYnHg-008JVl-Ry; Mon, 28 Mar 2022 11:11:40 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYnHN-008JLi-1N; Mon, 28 Mar 2022 11:11:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 422DC1F434D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648465879;
 bh=419/BL+mLF16KS+JYf0o8RqyMhR63jMhw3wqLehWCM4=;
 h=From:To:Cc:Subject:Date:From;
 b=G8hXakp8phXhjZ9JqEyaLDuoT4TMR3hosQo+KbGJ0YBXDN63JcDNKHSoxgkqy/Yn4
 N8hScWtIJk63aIlBBXwFuAJ16hblfIri4OmoPNW5GtEYRlRg+TR4QB1BvGf5yiNK7j
 2y+Mv/tS8Ldp41/Y1ZQbYsd2OrVBOZR8u7+hEiCbGb59UPonMN2ms1f7psqvESfjYP
 aMqFIIe/OMVKeXnyw/XxnhYHsIItR+45paYxaDhu/Aa/yKnPdmVVHctIizjJhJeEZe
 21Kv3+dFYWCi1UtNWlOvkSQo/ivHfQQm0cM4t293Kc5VZiJTgdgbBJabYsvFxcCSE0
 KaoR8FmpQuepA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, chunfeng.yun@mediatek.com, kishon@ti.com,
 vkoul@kernel.org, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] phy: mediatek: phy-mtk-mipi-dsi: Simplify with dev_err_probe()
Date: Mon, 28 Mar 2022 13:11:15 +0200
Message-Id: <20220328111115.210821-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_041121_231985_08EAFBCD 
X-CRM114-Status: UNSURE (   8.84  )
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

Use the dev_err_probe() helper to simplify error handling during probe.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-mipi-dsi.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
index 67b005d5b9e3..815895e54172 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
@@ -154,11 +154,9 @@ static int mtk_mipi_tx_probe(struct platform_device *pdev)
 		return PTR_ERR(mipi_tx->regs);
 
 	ref_clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(ref_clk)) {
-		ret = PTR_ERR(ref_clk);
-		dev_err(dev, "Failed to get reference clock: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(ref_clk))
+		return dev_err_probe(dev, PTR_ERR(ref_clk),
+				     "Failed to get reference clock\n");
 
 	ret = of_property_read_u32(dev->of_node, "drive-strength-microamp",
 				   &mipi_tx->mipitx_drive);
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
