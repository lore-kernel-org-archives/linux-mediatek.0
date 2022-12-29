Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240DEC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Dec 2022 09:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DUKUkVmPyy2LUhYv/ZtwyCB+zREreWR4W1eVUnhSAhw=; b=1A1qAzznlpuWkRlUfZbLKgDf2N
	baesiy3QMrEgJvVsW0IiXFHLnzwyDYbyXg7qMdd13gPfptEcmCJTfNi44BrE0vWAKeS745AdOpgaS
	4ZnleJIaqSqojNtjwEdGfjfTAckwI/tw5jq1rGOZxSMNmOgTNPbv4STCO53xz6hmg/2fj9wwaCvwb
	PpxQ61u3dQHrwWDRMd5TV/mmTin2RGvkKnnGqTT+RiF8hbks3MnP1sBEV3/iL5ysO/bDqpniid62t
	zHe+vKiL6LtIgHXB5s9YSm0dCaPn2qPXO0QlP0F0zK75WVz/XyaFHapv8vHKMbULcx+xbZL627Z9y
	halK1XUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pApJR-00EEuV-R6; Thu, 29 Dec 2022 09:34:57 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pApHY-00EDcY-7K
	for linux-mediatek@lists.infradead.org; Thu, 29 Dec 2022 09:33:03 +0000
Received: from dggpemm500007.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NjNSM45NfzmWws;
	Thu, 29 Dec 2022 17:31:31 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 29 Dec
 2022 17:32:49 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-clk@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
CC: <johnson.wang@mediatek.com>, <edward-jw.yang@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>, <wenst@chromium.org>,
	<yangyingliang@huawei.com>
Subject: [PATCH] clk: mediatek: clk-pllfh: fix missing of_node_put() in fhctl_parse_dt()
Date: Thu, 29 Dec 2022 17:29:46 +0800
Message-ID: <20221229092946.4162345-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_013300_988790_DB3F3934 
X-CRM114-Status: UNSURE (   9.17  )
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

The device_node pointer returned by of_find_compatible_node() with
refcount incremented, when finish using it, the refcount need be
decreased.

Fixes: d7964de8a8ea ("clk: mediatek: Add new clock driver to handle FHCTL hardware")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/clk/mediatek/clk-pllfh.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-pllfh.c b/drivers/clk/mediatek/clk-pllfh.c
index f48780bec507..bc2b30a55f60 100644
--- a/drivers/clk/mediatek/clk-pllfh.c
+++ b/drivers/clk/mediatek/clk-pllfh.c
@@ -75,13 +75,13 @@ void fhctl_parse_dt(const u8 *compatible_node, struct mtk_pllfh_data *pllfhs,
 	base = of_iomap(node, 0);
 	if (!base) {
 		pr_err("%s(): ioremap failed\n", __func__);
-		return;
+		goto out_node_put;
 	}
 
 	num_clocks = of_clk_get_parent_count(node);
 	if (!num_clocks) {
 		pr_err("%s(): failed to get clocks property\n", __func__);
-		return;
+		goto out_node_put;
 	}
 
 	for (i = 0; i < num_clocks; i++) {
@@ -102,6 +102,9 @@ void fhctl_parse_dt(const u8 *compatible_node, struct mtk_pllfh_data *pllfhs,
 		pllfh->state.ssc_rate = ssc_rate;
 		pllfh->state.base = base;
 	}
+
+out_node_put:
+	of_node_put(node);
 }
 
 static void pllfh_init(struct mtk_fh *fh, struct mtk_pllfh_data *pllfh_data)
-- 
2.25.1


