Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4804DC4321E
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 02:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UT6w43qR8toBRiiAyvAZHIOqxyE+6N7oX9Cu1pIV0Qo=; b=1dQ6d5sJQjtA0rUYZ4Lh21TqTV
	QQNGqxhYgwi1P+BqBceUjyklunflfYx6JENaePWS/zJZU0qHCbpVMy+aycHopvp5dNdSveLKvvnOx
	l045jJ1swk5Swme1Y1DAkvP6Sd6t1xnoqEth1KXGVy62iogj72NqYsVzSXGsSZrpN0m0oGaovPgF0
	hPqiR5fu5zajCPUmkSrkhEFWxbPFLrz0Az3xQhd1Gw8eAreHaezA5S81sZYMowD6lyGDo76QVW/fK
	/5fbHCelKKJwNlRPCagSzTataJzxljisELwu6/vbmMGFX/r+NN84sOyauIKIYjI5h8WDCHYIOzBQF
	fW0VXcRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0ZA5-003u8h-3n; Thu, 01 Dec 2022 02:18:53 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Z9t-003u5q-Eb; Thu, 01 Dec 2022 02:18:43 +0000
Received: from kwepemi500014.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NN08y6QGGzRpZP;
	Thu,  1 Dec 2022 10:17:54 +0800 (CST)
Received: from localhost.localdomain (10.175.112.70) by
 kwepemi500014.china.huawei.com (7.221.188.232) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 1 Dec 2022 10:18:35 +0800
From: Qiheng Lin <linqiheng@huawei.com>
To: <mchehab@kernel.org>, <matthias.bgg@gmail.com>
CC: <angelogioacchino.delregno@collabora.com>, <linux-media@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Qiheng Lin <linqiheng@huawei.com>
Subject: [PATCH v2] media: platform: mtk-mdp3: Fix return value check in mdp_probe()
Date: Thu, 1 Dec 2022 10:35:05 +0800
Message-ID: <20221201023505.48015-1-linqiheng@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.112.70]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500014.china.huawei.com (7.221.188.232)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_181841_671644_92ED7599 
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

In case of error, the function mtk_mutex_get()
returns ERR_PTR() and never returns NULL. The NULL test in the
return value check should be replaced with IS_ERR().
And also fix the err_return case.

Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
Signed-off-by: Qiheng Lin <linqiheng@huawei.com>
---

v2:
 - Add fix the err_return case.

 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index c413e59d4286..48f3e32fe54e 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -207,8 +207,8 @@ static int mdp_probe(struct platform_device *pdev)
 	}
 	for (i = 0; i < MDP_PIPE_MAX; i++) {
 		mdp->mdp_mutex[i] = mtk_mutex_get(&mm_pdev->dev);
-		if (!mdp->mdp_mutex[i]) {
-			ret = -ENODEV;
+		if (IS_ERR(mdp->mdp_mutex[i])) {
+			ret = PTR_ERR(mdp->mdp_mutex[i]);
 			goto err_return;
 		}
 	}
@@ -288,9 +288,10 @@ static int mdp_probe(struct platform_device *pdev)
 err_deinit_comp:
 	mdp_comp_destroy(mdp);
 err_return:
-	for (i = 0; i < MDP_PIPE_MAX; i++)
-		if (mdp)
-			mtk_mutex_put(mdp->mdp_mutex[i]);
+	if (mdp)
+		for (i = 0; i < MDP_PIPE_MAX; i++)
+			if (!IS_ERR_OR_NULL(mdp->mdp_mutex[i]))
+				mtk_mutex_put(mdp->mdp_mutex[i]);
 	kfree(mdp);
 	dev_dbg(dev, "Errno %d\n", ret);
 	return ret;
-- 
2.32.0


