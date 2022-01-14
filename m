Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168EAC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 08:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q7MZE4LXsLXUZXbBGV5e5/ytl9FND9UpQyOZVk4HgPM=; b=Tg9P+6b7WxyJRS
	f7xF/WFATSx2Hev4TNr6rn1CMaiEg4xzle0cN2+Oe8z/TxWLb9WnImgWFGtCjcRKoYG69dmq9t2tF
	lPKvH8fMXo3N6+Ke9GdAR6upB+Dkwwllro1WQcpJDaQdrL5IlXz95pGbl47WKRWWWwM2jUlnZKMoL
	8YB7ZY5PRXZc8UIoFh6BzOt1afp+oZyDYcXN/nCdAYw2Y2mmdEPnlFB5IlZ1lO76pF/SuBkMwNpf2
	3gQJp/lov4ze2acZWE9OgpC3T/ChUFvKCySRZ+TeXuwCLjt+bQTtKRjYDJEPXyCWdIJ4ZhVNEyQFg
	7whMdRMgVO/OB9nhpGZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8HrR-008Dyu-V4; Fri, 14 Jan 2022 08:23:01 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8HrE-008Dtq-NC; Fri, 14 Jan 2022 08:22:50 +0000
Received: from localhost.localdomain (unknown [124.16.141.244])
 by APP-05 (Coremail) with SMTP id zQCowACXe0HKMuFhEsoxBg--.41354S2;
 Fri, 14 Jan 2022 16:22:34 +0800 (CST)
From: Xu Wang <vulab@iscas.ac.cn>
To: minghsiu.tsai@mediatek.com, houlong.wei@mediatek.com,
 andrew-ct.chen@mediatek.com, mchehab@kernel.org, matthias.bgg@gmail.com
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: mtk-mdp: Remove redundant 'flush_workqueue()' calls
Date: Fri, 14 Jan 2022 08:22:14 +0000
Message-Id: <20220114082214.41817-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowACXe0HKMuFhEsoxBg--.41354S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKF17Xw17ZF1DZF4rKr1xKrg_yoWDWrb_Cr
 WIgF4xWrWfGwnYkryxtF1fuFyjy3yq9r1FyaySgr4qg3yrWw1UtrZrZr4DX3yDXa1jvF1U
 AFW2gayxurnxGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb2kYjsxI4VWkCwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6r43MxAIw28I
 cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
 IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI
 42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42
 IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
 z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8Hv3UUUUUU==
X-Originating-IP: [124.16.141.244]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgkGA10Tf6iqfAAAsF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_002249_192195_04FBDA00 
X-CRM114-Status: UNSURE (   7.49  )
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

'destroy_workqueue()' already drains the queue before destroying it, so
there is no need to flush it explicitly.

Remove the redundant 'flush_workqueue()' calls.

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
index 3d38793aaa25..fbd6e06a0567 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -246,10 +246,8 @@ static int mtk_mdp_remove(struct platform_device *pdev)
 	mtk_mdp_unregister_m2m_device(mdp);
 	v4l2_device_unregister(&mdp->v4l2_dev);
 
-	flush_workqueue(mdp->wdt_wq);
 	destroy_workqueue(mdp->wdt_wq);
 
-	flush_workqueue(mdp->job_wq);
 	destroy_workqueue(mdp->job_wq);
 
 	list_for_each_entry_safe(comp, comp_temp, &mdp->comp_list, node) {
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
