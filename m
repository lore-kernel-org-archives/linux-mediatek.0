Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8385EC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 10:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=upwB+A44K88YVY9gCKyzpx5OoEMkk8o0WT1ZH5efEh4=; b=h+be3/7NjeeSh0
	vDrWZxLhfHmCVA69dS0/AtJvWkhUIT2UZN9bmM0YaezZy/FwakEFKU228x4bLT5CPZ+YK1qTmT33W
	WRpbjsZTZb674AGqL1dEZ7NYV+MGF2AGR3tnhP27iKBeFgDI0S7vkyNm3THWiJnd4jb+Jps3iYgu7
	sVk76n1uThYlgA6l9UFPSUF3yMcGVclk04GIVza5vRHdrnMGc6hRb3+nAsrdrRfj65ynd42kI2WfC
	4T+zJeii4amihlkuuBaeMyI635HpGqoBTYKQ19wF8QJOv9SwUbLC+cZGfBobRQqDuZ75L61JM8BWi
	kI0Vdf58J4rsbMi/58vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlqCx-005QEO-0w; Tue, 03 May 2022 10:56:43 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlq9w-005OW1-RR; Tue, 03 May 2022 10:53:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1327C1F43E31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651575215;
 bh=DOmjN0rIyrLrzlWHjHQiavdG+fuRwNEWPLPHorvQTtI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CDMc302w1OAhW9kbsJulrPFYSr/a9+Z4wAAI2QGfXGNs/J3TySQw600gYSv1f2Htm
 1R+lPVPTRaT5jv5DuHOBuRMerlYcvry+DumksFA1MwxKwpWDpTvCYi173ITFPbMYAI
 7b2XRialKZwUxFg2gLhtWHhgu9Ne32TRy6q80cjTtOrqtvdyln++76+W2YVnJ4Msrf
 6BnA8ImlAhDZpHrx4phkmpkr46U3pIGfgVpOzFsR4Q8s6Ex6cs1pHjgS60H+cFjGir
 aTPBL4vTy/6FbtopOIy4KpYhIGGy/Y+hBljKtnk0QJZ11YHGWiBZVd9CcmsqFQZw2A
 nVdSW7cdiK8SQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sean.wang@mediatek.com
Cc: vkoul@kernel.org, matthias.bgg@gmail.com, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 nfraprado@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/2] dmaengine: mediatek-cqdma: Add support for MediaTek MT6795
Date: Tue,  3 May 2022 12:53:28 +0200
Message-Id: <20220503105328.54755-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503105328.54755-1-angelogioacchino.delregno@collabora.com>
References: <20220503105328.54755-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_035337_062299_A5FE56EF 
X-CRM114-Status: UNSURE (   9.67  )
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
index 7d8c54da3d58..5f8f44d37037 100644
--- a/drivers/dma/mediatek/mtk-cqdma.c
+++ b/drivers/dma/mediatek/mtk-cqdma.c
@@ -756,8 +756,14 @@ static const struct mtk_cqdma_plat_data cqdma_mt6765 {
 	.reg_src2 = 0x60,
 };
 
+static const struct mtk_cqdma_plat_data cqdma_mt6795 {
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
