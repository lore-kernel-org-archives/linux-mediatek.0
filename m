Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975B4C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Mar 2022 09:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Iyn6FttzNfa7SKbGn8cEm/M/oJXHiflxM/2URYmtgPY=; b=HIZtnjOOykpU68
	xnAX5WE2FdNBIViD+YSN5ZSPecSR6V/spELtfpA50fPCdTWjZvOVSKCDrogS52YWXe4QuEYaGYTm4
	XnmfgTdKAm/WFs7RGvG579pJcxZimYYtQZwFhh/oWerwXaSy1if9rnvOsjhlTcGLjK71lI7AcZVja
	zIcAQvLypbgvBVGV4b4sjz2mbD1HhEp3b794pT1X7x/4mGMIZyDIBV/eOOKs2nE6JuMWrpRS7y6OS
	E89Ovg7tgARgLi9ftoxnwvo8HSv17I8KIrS9v7IENqRdOvKJmftNNM2/vcdxZR9erZ+NMbfNyq+gw
	dU7wuY+wU0nswrS+SArg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWahK-00AZQx-Ea; Tue, 22 Mar 2022 09:21:02 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWah4-00AZK0-Or; Tue, 22 Mar 2022 09:20:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 024181F42543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647940845;
 bh=RGXVtcqwObkEQ+VQOAEz9wVt9MEokAHE3MUZMVVtBvc=;
 h=From:To:Cc:Subject:Date:From;
 b=UzOwni4fe5KpVwbEvF0d/tDv9CWET0DGk7i0Y2J0bOi0gSgpOvoiaVUVDA1ZXEDKu
 CY5vufRptkjeDYrWaG4mUc6dBYcuWHulOFodk6OxZCkuN/Zlz7u9PhbolfPtBbhEqt
 N4TOjRzW+IMTkriCer9Qh6CE74x2PMxAPZKdWXlUPE7CmVo2UQSUR7ILhEnMhyTiZb
 PvdKO6vCCPqwt59DdAp3CocDdkKEOBM+avVgUoUoKwcrQkx4aHwABOweg9/3/b88Ed
 fyIwo+izlElu82xou8Sd9RqcUNcA+17/YTC+sdIVpB4Tv0ikETL7VK9Ud/twe1OYk+
 XO6/v3b2ZNtnw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 rex-bc.chen@mediatek.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] soc: mediatek: mmsys: Add sw0_rst_offset for MT8192
Date: Tue, 22 Mar 2022 10:20:40 +0100
Message-Id: <20220322092040.12010-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_022046_968347_D76B9C90 
X-CRM114-Status: UNSURE (   9.52  )
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

MT8192 has the same sw0 reset offset as MT8183: add the parameter
to be able to use mmsys as a reset controller for managing at
least the DSI reset line.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
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
+	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
 };
 
 static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
