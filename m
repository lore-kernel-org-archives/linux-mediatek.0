Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903C0C28CF5
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jan 2022 09:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N2QXJvQMj2yqp23GS+ZAsx8lWZ1XQzw/qt9MLMStcY4=; b=ceFNVN1r+KHooX
	AiOPmY3y7u6IeSgRJmEhYWLoyM95tTrMv6LMFIXt6FS7kCVrJ1SUJvWJ/cwpwXgx7dokLAsaSFH9A
	GZUKMdLVdAtKZKtY5eVryeVWfFeqv2ht58Xm6xHeuaqJJ6afd6ih0zhXD9qWvYcMBCXxlRU7WvXOg
	Rq4HZrU1RRgP+vaewLkBl2N5p5lsV+GoF4da+2pR/K2ggfpJV3VCBEXuFVnjmm9D4QiJ2na6FU7ia
	58aPTlBPuftGM3beYNFG6GF+5TbDzb2HqeANzw54kYXQYV93IXVlv9rH7YUvH5bqlEqobLeDZYer8
	PKHeg0UdAWvuKvXSQSZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCeMJ-00Asqq-MG; Wed, 26 Jan 2022 09:12:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCeM6-00Asmz-QJ
 for linux-mediatek@lists.infradead.org; Wed, 26 Jan 2022 09:12:44 +0000
X-UUID: f33df52da93f48d79c1c4e210ac2b6b9-20220126
X-UUID: f33df52da93f48d79c1c4e210ac2b6b9-20220126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <guochun.mao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1612811072; Wed, 26 Jan 2022 02:12:39 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Jan 2022 01:12:37 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 26 Jan 2022 17:12:36 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 26 Jan 2022 17:12:35 +0800
From: <guochun.mao@mediatek.com>
To: Mark Brown <broonie@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Bayi Cheng
 <bayi.cheng@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>, Bin Zhang
 <bin.zhang@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>,
 <project_global_chrome_upstream_group@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>, Guochun Mao
 <guochun.mao@mediatek.com>, kernel test robot <lkp@intel.com>
Subject: [PATCH] spi: spi-mtk-nor: make some internal variables static
Date: Wed, 26 Jan 2022 17:11:59 +0800
Message-ID: <20220126091159.27513-1-guochun.mao@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_011242_923352_530F56D7 
X-CRM114-Status: GOOD (  10.16  )
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

From: Guochun Mao <guochun.mao@mediatek.com>

Variables mtk_nor_caps_mt8173, mtk_nor_caps_mt8186 and
mtk_nor_caps_mt8192 are not declared.
Make them static.

Fixes: 5b177234e9fd ("spi: spi-mtk-nor: improve device table for adding more capabilities")
Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/spi/spi-mtk-nor.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index 455b4dcb26e9..94fb09696677 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -770,17 +770,17 @@ static const struct spi_controller_mem_ops mtk_nor_mem_ops = {
 	.exec_op = mtk_nor_exec_op
 };
 
-const struct mtk_nor_caps mtk_nor_caps_mt8173 = {
+static const struct mtk_nor_caps mtk_nor_caps_mt8173 = {
 	.dma_bits = 32,
 	.extra_dummy_bit = 0,
 };
 
-const struct mtk_nor_caps mtk_nor_caps_mt8186 = {
+static const struct mtk_nor_caps mtk_nor_caps_mt8186 = {
 	.dma_bits = 32,
 	.extra_dummy_bit = 1,
 };
 
-const struct mtk_nor_caps mtk_nor_caps_mt8192 = {
+static const struct mtk_nor_caps mtk_nor_caps_mt8192 = {
 	.dma_bits = 36,
 	.extra_dummy_bit = 0,
 };
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
