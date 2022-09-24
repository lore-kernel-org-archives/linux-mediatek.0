Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2429CC04A95
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Sep 2022 02:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ltnR/gdEzuzk8lDhgARMsg8IoEWLCS8xP/4W9s7zyPM=; b=iUT5c5l/trTPmPFtN8VDiqFXcQ
	C0UAs4oZuXA3Gw72JvvJeM8P9O81EMNKztOnYsWQK0y2Ebcws8NDz1vtKVMh1fX14p1lHlsqR57R5
	wqEN1TeKB2uQg4/l6SgX1MSRYCR5EGEUW4cTjyoad48i89+8BfhkNhPa5BMxfWhQWo6O1s+BS4vb7
	7ktL8laQOS+AhSNUqJnHkvRT1f9ZGKc7441D6T+M8KHCssINH1buR1MaPQB9G33qyBD/uhJ1MIBBI
	OUPq1MC3yIocbtxSoahDttNsZsgJvyXNniZF4mEOLaM++Be6XSy/x9fdmTIbtgRSSQWFOTLdpgmCo
	Til0zZ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obvBx-006B29-3d; Sat, 24 Sep 2022 02:46:57 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obvBl-006AxG-NJ; Sat, 24 Sep 2022 02:46:47 +0000
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MZCwY0Tj4z1P6pG;
	Sat, 24 Sep 2022 10:42:21 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 24 Sep
 2022 10:46:30 +0800
From: Yuan Can <yuancan@huawei.com>
To: <matthias.bgg@gmail.com>, <broonie@kernel.org>,
	<tinghan.shen@mediatek.com>, <tzungbi@google.com>, <yc.hung@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <yuancan@huawei.com>
Subject: [PATCH] firmware: mediatek: Use dev_err_probe() to simplify code
Date: Sat, 24 Sep 2022 02:43:59 +0000
Message-ID: <20220924024359.26949-1-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_194645_960488_AF773743 
X-CRM114-Status: UNSURE (   9.72  )
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

In the probe path, dev_err() can be replaced with dev_err_probe()
which will check if error code is -EPROBE_DEFER and prints the
error name. It also sets the defer probe reason which can be
checked later through debugfs.

Signed-off-by: Yuan Can <yuancan@huawei.com>
---
 drivers/firmware/mtk-adsp-ipc.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/mtk-adsp-ipc.c b/drivers/firmware/mtk-adsp-ipc.c
index 3c071f814455..c57880949521 100644
--- a/drivers/firmware/mtk-adsp-ipc.c
+++ b/drivers/firmware/mtk-adsp-ipc.c
@@ -96,10 +96,9 @@ static int mtk_adsp_ipc_probe(struct platform_device *pdev)
 		adsp_chan->idx = i;
 		adsp_chan->ch = mbox_request_channel_byname(cl, adsp_mbox_ch_names[i]);
 		if (IS_ERR(adsp_chan->ch)) {
-			ret = PTR_ERR(adsp_chan->ch);
-			if (ret != -EPROBE_DEFER)
-				dev_err(dev, "Failed to request mbox chan %s ret %d\n",
-					adsp_mbox_ch_names[i], ret);
+			ret = dev_err_probe(dev, PTR_ERR(adsp_chan->ch),
+					    "Failed to request mbox chan %s\n",
+					    adsp_mbox_ch_names[i]);
 
 			for (j = 0; j < i; j++) {
 				adsp_chan = &adsp_ipc->chans[j];
-- 
2.17.1


