Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC45C54EE9
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 08:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FxB51AZDg2xmSotfybdKeI/9/Bhxfj4a7go0dQ5mwhk=; b=JSvWn0P1iE1g4L6tTrJj+EmlCc
	btZLuIa6gi0Kk2uNwvO6FS0G5o4Lp2Wxx8sccOq+Zch/0gBM5BjjfX06cd7FzMNZnmQuJRALlQbyv
	JtgP3ih3oMXuaddjQ9FPPNo8l3xGGjjTWoWdwXEIWGbNE4ilfgpScOTnDb05Nt7WEJi44VP4LKM7Q
	WAKB+dR/l5V4ylKecvg97dAicURiMPqFeueQx2Ee00snalwxhS0d37ZFsNyUiV0YVkjbgTXC0CMpP
	emx1cOXpyI66iLoa4smhkaGzie3qn83TpyORm7M+E/Bh1izR5lNz/Zve6rFnTjLJnb5X6ZY80hRHE
	7d/m8Jgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU2Mc-0026pc-Cq; Fri, 02 Sep 2022 08:49:22 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU2Kf-0024ae-Qr; Fri, 02 Sep 2022 08:47:23 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MJrzQ1rFKzkWtX;
	Fri,  2 Sep 2022 16:43:30 +0800 (CST)
Received: from kwepemm600010.china.huawei.com (7.193.23.86) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 2 Sep 2022 16:47:12 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600010.china.huawei.com
 (7.193.23.86) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 2 Sep
 2022 16:47:11 +0800
From: Sun Ke <sunke32@huawei.com>
To: <mchehab@kernel.org>, <matthias.bgg@gmail.com>,
	<hverkuil-cisco@xs4all.nl>, <ping-hsun.wu@mediatek.com>,
	<daoyuan.huang@mediatek.com>, <moudy.ho@mediatek.com>
CC: <linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <kernel-janitors@vger.kernel.org>,
	<sunke32@huawei.com>
Subject: [PATCH 2/3] media: platform: mtk-mdp3: fix PM reference leak in mdp_comp_clock_on()
Date: Fri, 2 Sep 2022 16:58:19 +0800
Message-ID: <20220902085820.3777360-3-sunke32@huawei.com>
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
X-CRM114-CacheID: sfid-20220902_014722_062590_28C96332 
X-CRM114-Status: GOOD (  10.11  )
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

mdp_comp_clock_on will increase runtime PM usage counter,
and mdp_comp_clock_off will decrease the runtime PM usage counter.
so, if mdp_comp_clock_on failed after increment runtime PM usage
counter, it should decrease it before return a error code.

pm_runtime_get_sync will increment pm usage counter even it failed.
Forgetting to putting operation will result in reference leak here.
Fix it by replacing it with pm_runtime_resume_and_get to keep usage
counter balanced.

And if failed to enable clk, add pm_runtime_put() to decrease the
runtime PM usage counter.

Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
Signed-off-by: Sun Ke <sunke32@huawei.com>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
index 9a6ba5851ccb..d3eaf8884412 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
@@ -682,7 +682,7 @@ int mdp_comp_clock_on(struct device *dev, struct mdp_comp *comp)
 	int i, ret;
 
 	if (comp->comp_dev) {
-		ret = pm_runtime_get_sync(comp->comp_dev);
+		ret = pm_runtime_resume_and_get(comp->comp_dev);
 		if (ret < 0) {
 			dev_err(dev,
 				"Failed to get power, err %d. type:%d id:%d\n",
@@ -699,6 +699,7 @@ int mdp_comp_clock_on(struct device *dev, struct mdp_comp *comp)
 			dev_err(dev,
 				"Failed to enable clk %d. type:%d id:%d\n",
 				i, comp->type, comp->id);
+			pm_runtime_put(comp->comp_dev);
 			return ret;
 		}
 	}
-- 
2.31.1


