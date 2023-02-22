Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14AB7C61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 10:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=96rzDARD3Mq7VYuLIo+Rq9QzGm896oZABe+FbDqtZGY=; b=HCbDVxcb8Dg1kyVDfOmVD7kM1f
	HkKqksPVaNaPjWJZ2CgKSoGL4xMUl5Xw70Zg781neQsiAKvNCg0QEHN+faITS3XTjYVKmllSsPFsj
	IUunQayjssveDOQeFS6GKgW3kudigQQvwnE/IezM6tNoQP4JtT2uJIAi4elFZNhf4A/Q3oEkKYhry
	Yg8narizxJhL5rRxK5IiKtz9nM/wUtb4nVEHLJAcEeBcjthtlOUycfgviWNoDuHqYF/+ZRJgnbyqj
	JWDzjquz7qiEsfOhPUNiS6OyHwMOHPb3NImyK2WAetcRjZcU8qjOrck9hMxbywBPuWJ3gLY+2bdaw
	XqEvodDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUmGO-00BsNk-Kv; Wed, 22 Feb 2023 10:22:16 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUleQ-00BYee-Er; Wed, 22 Feb 2023 09:43:04 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9D6D966021B8;
	Wed, 22 Feb 2023 09:43:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677058981;
	bh=rAHk+6D4DP7ZKavkjU3OoAIsoPs/edVh3yg1JAxrz8Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g4g6Jf22hidJPXb/h9Wa8OCLtlftHXym9YpMsWyHjgCb/rbi6ZzmyzhoatYtDv+M/
	 ihQFLLNEDnRriFk+ZSh0F7EwjqEwx9LXoFmd9Yxyy5gUPeYst0TAO0dkLwPT5eeLJT
	 NfHzhiOR8BGZshr6QZkR6kRtEax+109UdlzzCbW1pkLCi0G4qxTghDNLoTotkBcspL
	 aQ2WGmrWRozR4mXpxGchvduT7502ivAoW6+7JqSDwESi/EUJTxvjhKoeLKh6Qh7qbs
	 BqClANiOO9XNowtXBLIiBHUenXd6W3zpbdP9YvuJMZuOGAYOkSdBUNG5UEzVHGiPsP
	 ESxOlbKporAZQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: jason-jh.lin@mediatek.com,
	chunkuang.hu@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v2 2/9] soc: mediatek: mtk-mmsys: Use module_platform_driver() macro
Date: Wed, 22 Feb 2023 10:42:46 +0100
Message-Id: <20230222094253.23678-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222094253.23678-1-angelogioacchino.delregno@collabora.com>
References: <20230222094253.23678-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_014302_660531_7DCFB9D1 
X-CRM114-Status: UNSURE (   9.10  )
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

Instead of open-coding init/exit calls, switch to using the
module_platform_driver() macro instead, doing the exact same.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/soc/mediatek/mtk-mmsys.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index af22f3490034..1a574de9484d 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -447,19 +447,7 @@ static struct platform_driver mtk_mmsys_drv = {
 	.probe = mtk_mmsys_probe,
 	.remove = mtk_mmsys_remove,
 };
-
-static int __init mtk_mmsys_init(void)
-{
-	return platform_driver_register(&mtk_mmsys_drv);
-}
-
-static void __exit mtk_mmsys_exit(void)
-{
-	platform_driver_unregister(&mtk_mmsys_drv);
-}
-
-module_init(mtk_mmsys_init);
-module_exit(mtk_mmsys_exit);
+module_platform_driver(mtk_mmsys_drv);
 
 MODULE_AUTHOR("Yongqiang Niu <yongqiang.niu@mediatek.com>");
 MODULE_DESCRIPTION("MediaTek SoC MMSYS driver");
-- 
2.39.2


