Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C300DC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 12:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e8Q87N2jMyWQqEiUwkYlSPYlOcn2GWku/XFizOWYIxI=; b=zId031ruMST45u
	uPoFyKomcztCQoWkrVNzW66SkUl2Vmbec/6Wwx+UdDM3hc0NS3lG+ZqHTku5GLe0l0gBDVSDgnqVu
	cQLT4NTZGWNhCN7crVV4YMo7H5iSv69wHvNEwJ+eAFxBx5pdMkwCgcwO5hMxnGBZsmz2aFeU/HV2Y
	Hi6Lg48eJAuZLDndtxvp5xznJQO31zidRyMvPPnXf/zs2flR/P7y0Y5CywGh12V8Xa4zR7hO+WFtl
	7euJcuDfEYZtPR8QPjw9SmOk5TUhDUwtpXSSvlBuV5hwSUAkGcri4sz+Plr9OoPAMn/APoQ3UicGS
	5JTiwhFYN49YxFGmDVVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neFF4-00DwHu-FP; Tue, 12 Apr 2022 12:03:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neF9g-00Dtdz-0c; Tue, 12 Apr 2022 11:57:57 +0000
X-UUID: 87b4185651764928889acfadfa8aaa1f-20220412
X-UUID: 87b4185651764928889acfadfa8aaa1f-20220412
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 412828065; Tue, 12 Apr 2022 04:57:48 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Apr 2022 04:57:46 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Apr 2022 19:57:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 12 Apr 2022 19:57:44 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Ikjoon Jang <ikjn@chromium.org>
CC: <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Allen-KH Cheng
 <allen-kh.cheng@mediatek.com>
Subject: [PATCH] spi: spi-mtk-nor: initialize spi controller after resume
Date: Tue, 12 Apr 2022 19:57:43 +0800
Message-ID: <20220412115743.22641-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_045756_129568_F65E879C 
X-CRM114-Status: GOOD (  11.95  )
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

After system resumes, the registers of nor controller are
initialized with default values. The nor controller will
not function properly.

To handle both issues above, we add mtk_nor_init() in
mtk_nor_resume after pm_runtime_force_resume().

Fixes: 3bfd9103c7af ("spi: spi-mtk-nor: Add power management support")

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 drivers/spi/spi-mtk-nor.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index 94fb09696677..d167699a1a96 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -960,7 +960,17 @@ static int __maybe_unused mtk_nor_suspend(struct device *dev)
 
 static int __maybe_unused mtk_nor_resume(struct device *dev)
 {
-	return pm_runtime_force_resume(dev);
+	struct spi_controller *ctlr = dev_get_drvdata(dev);
+	struct mtk_nor *sp = spi_controller_get_devdata(ctlr);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret)
+		return ret;
+
+	mtk_nor_init(sp);
+
+	return 0;
 }
 
 static const struct dev_pm_ops mtk_nor_pm_ops = {
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
