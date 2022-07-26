Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C297C19F21
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 14:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ieq2hAG4AZG/Fb6ambaVWrgPRnPACpIEU3NvgFnv4bk=; b=c6bfKdAdWvPFza4vNQRpUIhO65
	iwlm4P4jVyg2EUXkM3YnlY0dd0rLNZY8kn4OutaocBt+pQMnBAE7DiyCRMr7pO5Me3TEsPBjwcvpy
	DotMDjBPIlSWMSIfqvevUrky2PixvOkGsAYr3WsJ/DzATxaurwOLlK3D2PbMe5yp6XBfkEvvYgiXq
	rk/ISUKqwughYbmn/8AFQa42viLr/D0f8Oa35pYwsx2kkencxfJFpL8GAF29aBrE8WXraBDBJ5VkK
	RamjjiF5HJd/rEHTNeCSU8b4DBvciNU97BpiObL3r5PqSoVO+iLaw9SixoxGXWYRtwqLbPRpdn3ia
	LVzGPPMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGLNn-0007cD-Oo; Tue, 26 Jul 2022 14:17:59 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGLNR-0007T7-3k; Tue, 26 Jul 2022 14:17:38 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2FC926601B21;
	Tue, 26 Jul 2022 15:17:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658845054;
	bh=0Pq7bNM/o1tXtZIQEeEKqw5+dJrRJyg3c7c9n4VhnQg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NzcgJJa47jvHM0qeQq11B4CvOqXuefN0JcZ8i8XG3h2Prnevck3URTpecbJQS5xA8
	 /C0rOFGZbYvr4B8InTEjFQKhE3MLJFB5eHYLAHn4GFm7rpB3tHM6/NxWrnPvZapvpv
	 k3QMRHgivLoiHS/ebTvfgLCUDnXdsQcQy99UA4i0Fbl35M4kH+qOzdOUROwj3CTAoF
	 w21vcDrJLwaEaHAhohdyZ7QjjZWXQiOA+TgnsU5WGDODPRJkwafaWA2ovUJanwRfFv
	 ZovAk/jIYsxymyMUsJdhpfK6JgmKq8hX12P/NhYf5rlo58HnN6RJHNGh9eE6gcB43t
	 ChflXVH5CS6Qg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: roger.lu@mediatek.com,
	khilman@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nfraprado@collabora.com,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/6] soc: mediatek: mtk-svs: Switch to platform_get_irq()
Date: Tue, 26 Jul 2022 16:16:49 +0200
Message-Id: <20220726141653.177948-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220726141653.177948-1-angelogioacchino.delregno@collabora.com>
References: <20220726141653.177948-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_071737_395488_755E6E57 
X-CRM114-Status: GOOD (  12.59  )
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

Instead of using irq_of_parse_and_map() to retrieve the interrupt from
devicetree, switch to platform_get_irq() instead: this function will
conveniently also write an error message in case the irq is not found.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-svs.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 600492dc334c..ee990acfc2d5 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -2757,8 +2757,7 @@ static struct svs_platform *svs_platform_probe(struct platform_device *pdev)
 static int svs_probe(struct platform_device *pdev)
 {
 	struct svs_platform *svsp;
-	unsigned int svsp_irq;
-	int ret;
+	int svsp_irq, ret;
 
 	svsp = svs_platform_probe(pdev);
 	if (IS_ERR(svsp))
@@ -2776,7 +2775,12 @@ static int svs_probe(struct platform_device *pdev)
 		goto svs_probe_free_resource;
 	}
 
-	svsp_irq = irq_of_parse_and_map(svsp->dev->of_node, 0);
+	svsp_irq = platform_get_irq(pdev, 0);
+	if (svsp_irq < 0) {
+		ret = svsp_irq;
+		goto svs_probe_free_resource;
+	}
+
 	ret = devm_request_threaded_irq(svsp->dev, svsp_irq, NULL, svs_isr,
 					svsp->irqflags | IRQF_ONESHOT,
 					svsp->name, svsp);
-- 
2.35.1


