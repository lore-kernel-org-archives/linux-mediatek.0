Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6F5ECAAD5
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 08:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wq/MwxWhGQSDcnOgGG44M32HNNDH9fnS/599HVdUdVU=; b=JtBKSWp82ehQ83Kja+e26kJkxh
	iBs1Z3Rgj+wS+82TY9QPI5Aud8UkcBof+ER1+VW/JXOx1YGbkwnnFA+L9KRHq4BDj+4ViqVcS/+9G
	9hVxelbLuFtQG8OAb2IbLGxLOQnAteLdsAf8xJG7vLzCq9+VxYbRpjz8NQD2Ek+ccOUH541rlsRFv
	shJfPQhBtavEj1+wVtJFdp27FjdSYDNqjZ7yJq44wRMIeK0/TWnKewwuMcgGeWJ/WoAEbHuAGkDd8
	X7mPpqsMPqRaGa0zb2ikMVf/9kNbcQ//xQvsheN412O8MFgErCuOWFWJaAxBsuwzK49AFpBtZ+uzO
	00uUxr7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU2LQ-0025L6-Md; Fri, 02 Sep 2022 08:48:08 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU2Ke-0024ad-5y; Fri, 02 Sep 2022 08:47:22 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MJrzh2ywkzlWjd;
	Fri,  2 Sep 2022 16:43:44 +0800 (CST)
Received: from kwepemm600010.china.huawei.com (7.193.23.86) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 2 Sep 2022 16:47:11 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600010.china.huawei.com
 (7.193.23.86) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 2 Sep
 2022 16:47:10 +0800
From: Sun Ke <sunke32@huawei.com>
To: <mchehab@kernel.org>, <matthias.bgg@gmail.com>,
	<hverkuil-cisco@xs4all.nl>, <ping-hsun.wu@mediatek.com>,
	<daoyuan.huang@mediatek.com>, <moudy.ho@mediatek.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <kernel-janitors@vger.kernel.org>,
	<sunke32@huawei.com>
Subject: [PATCH 1/3] media: platform: mtk-mdp3: use devm_kfree to free memory allocated with devm_kmalloc()
Date: Fri, 2 Sep 2022 16:58:18 +0800
Message-ID: <20220902085820.3777360-2-sunke32@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220902085820.3777360-1-sunke32@huawei.com>
References: <20220902085820.3777360-1-sunke32@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600010.china.huawei.com (7.193.23.86)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_014720_410999_F9803312 
X-CRM114-Status: UNSURE (   9.33  )
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

comp is allocated with devm_kmalloc(), use devm_kfree to free it.

Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
Signed-off-by: Sun Ke <sunke32@huawei.com>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
index e62abf3587bf..9a6ba5851ccb 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
@@ -869,7 +869,7 @@ static struct mdp_comp *mdp_comp_create(struct mdp_dev *mdp,
 
 	ret = mdp_comp_init(mdp, node, comp, id);
 	if (ret) {
-		kfree(comp);
+		devm_kfree(dev, comp);
 		return ERR_PTR(ret);
 	}
 	mdp->comp[id] = comp;
@@ -930,7 +930,7 @@ void mdp_comp_destroy(struct mdp_dev *mdp)
 		if (mdp->comp[i]) {
 			pm_runtime_disable(mdp->comp[i]->comp_dev);
 			mdp_comp_deinit(mdp->comp[i]);
-			kfree(mdp->comp[i]);
+			devm_kfree(mdp->comp[i]->comp_dev, mdp->comp[i]);
 			mdp->comp[i] = NULL;
 		}
 	}
-- 
2.31.1


