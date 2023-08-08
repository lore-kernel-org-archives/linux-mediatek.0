Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B67EC001B0
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Aug 2023 13:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kf+iskFwVnVol1/klfzFd7Q4j5fZtNd9ApJUkS29c8A=; b=sa/hHBHpjrF4usM2JXTHEuzOcV
	8H/K0ldl5/Nl5KfZgmlcEMU/u5C5aoIIDc9L1phK8z3A2N6RYH9sPJDBPT8JW2984yztgkpZeQoIm
	EYQfsPSWFVSgt/gD6ZqRTvKW5L3fPUfAj0b5DA0naFuU87i76IH0Jxej+LsCwsK/iiy5RbYKZkaSH
	GffShZl/ZAliXftPqtp8Ko2B5QqOF6Vu6CPHfdr7VjceUl4yWr8T495hKYqUdEXYIW4vFj56KwGkK
	3Wrgu5kxD9vwpaDtF7ZBnlkDFDboBvZPvfP7drRXZJBpE8YX0S6Wza2ErRJwHfTMQNo/SwL4R8pgi
	9tX5SEgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTMP9-002beq-3A;
	Tue, 08 Aug 2023 13:05:43 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTMP6-002bbG-0v;
	Tue, 08 Aug 2023 13:05:42 +0000
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RKtcj3Cm3ztRrm;
	Tue,  8 Aug 2023 21:01:57 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 8 Aug
 2023 21:05:25 +0800
From: Ruan Jinjie <ruanjinjie@huawei.com>
To: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Sean Wang <sean.wang@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next] dmaengine: mediatek: Remove redundant of_match_ptr()
Date: Tue, 8 Aug 2023 21:04:56 +0800
Message-ID: <20230808130456.4079339-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_060540_536063_0632EF41 
X-CRM114-Status: GOOD (  11.29  )
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

The driver depends on CONFIG_OF, it is not necessary to use
of_match_ptr() here.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/dma/mediatek/mtk-uart-apdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index c51dc017b48a..98b4ddeaaff4 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -644,7 +644,7 @@ static struct platform_driver mtk_uart_apdma_driver = {
 	.driver = {
 		.name		= KBUILD_MODNAME,
 		.pm		= &mtk_uart_apdma_pm_ops,
-		.of_match_table = of_match_ptr(mtk_uart_apdma_match),
+		.of_match_table = mtk_uart_apdma_match,
 	},
 };
 
-- 
2.34.1


