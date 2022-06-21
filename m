Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C069C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jun 2022 11:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vd92jmQu2+QInRjy/B3jQ7ljx4zpFy9H1zxz80/NE5c=; b=qKGEXDsXhoSQj/0/6qjdyLI8Nz
	XTb1GKMVpX4Ai48ASLEg/5CD8UR+2NAHxJHgR4D9zfk5pfBeNRD2T9X8prwRaiqvb5OF3dAkpiCW/
	gDNds6Tw7HQgwvhlWL+wbBfqv5wJSkS2CUjn6gWgfpXZX19V4mvJwIK21YQzdfY9oF8rtZkQuWNHy
	D9mmw6RYTzN3L0MIVDz3i72Iu6RmsE2ZrOVvBBPaIsK+6BS3EABqMyHeOvwrO+jUy3kEKqOFEfD2n
	1XLeTQa9Olx2wJ3mnSD3QAV9Q9vU/CZjNNOGh2rSe91IMcS/nVTzan9Eh2awM+ba+bMN3/rVjB/MC
	dcJhXJUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3cRY-005BTH-9N; Tue, 21 Jun 2022 11:53:16 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3cRF-005BKp-Qx; Tue, 21 Jun 2022 11:53:00 +0000
Received: from kwepemi500023.china.huawei.com (unknown [172.30.72.56])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4LS4b731Xdz1K9mX;
	Tue, 21 Jun 2022 19:50:43 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemi500023.china.huawei.com
 (7.221.188.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 21 Jun
 2022 19:52:48 +0800
From: Peng Wu <wupeng58@huawei.com>
To: <matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<liwei391@huawei.com>, <wupeng58@huawei.com>
Subject: [PATCH] soc: mediatek: fix missing clk_disable_unprepare() on err in svs_resume()
Date: Tue, 21 Jun 2022 11:46:58 +0000
Message-ID: <20220621114658.10054-1-wupeng58@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500023.china.huawei.com (7.221.188.76)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_045258_049669_0DBE6E02 
X-CRM114-Status: UNSURE (   7.50  )
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

Fix the missing clk_disable_unprepare() before return
from svs_resume() in the error handling case.

Signed-off-by: Peng Wu <wupeng58@huawei.com>
Reported-by: Hulk Robot <hulkci@huawei.com>
---
 drivers/soc/mediatek/mtk-svs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 606a00a2e57d..1b5c297aaec5 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -1525,6 +1525,7 @@ static int svs_resume(struct device *dev)
 
 	ret = reset_control_deassert(svsp->rst);
 	if (ret) {
+		clk_disable_unprepare(svsp->main_clk);
 		dev_err(svsp->dev, "cannot deassert reset %d\n", ret);
 		return ret;
 	}
-- 
2.17.1


