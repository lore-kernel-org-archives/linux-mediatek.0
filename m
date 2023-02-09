Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86149C636D4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 09:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OtO68sEVxw5jQciHBFciXR+RH1jzE55jEUA4xvtH4+I=; b=VQch/uEaLClTPX2q3ohVN5lXCu
	BYz7tOdKhqaeuSme2cchn8pKE9oF2Ghwrg46JPVbU7vx82B2TZI2Exbnbf0KBFe5Zq/omaBQSkuAt
	U4CwAi/PuS0dSHraEQbR1KdNenk/S/WlLX7yVOwpVxfGG2FEvPDImTW5ClzUYF5UbVMT+bIjUaN/z
	o2gsa034/baj/ZiWaslxobZOHPz2x1MA/Haj+4SYMJpv1iFuVLtsnEtICTUnJ7a6LjVtJ546JUcq9
	CGiZf/Eud3SJgsVavPtlxhg3PdvmIbmZo7F+JSGzKMRUHO9EILxAJ69HXlbYGPhgxRyRXJoZC6TXK
	F4qBJWng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ2ov-000eMR-P4; Thu, 09 Feb 2023 09:02:21 +0000
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ2ok-000eHP-2F; Thu, 09 Feb 2023 09:02:11 +0000
Received: from localhost.localdomain (unknown [124.16.138.125])
	by APP-01 (Coremail) with SMTP id qwCowAAXMNSJtuRj978zBA--.1832S2;
	Thu, 09 Feb 2023 17:02:01 +0800 (CST)
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	moudy.ho@mediatek.com,
	daoyuan.huang@mediatek.com,
	hverkuil-cisco@xs4all.nl
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: [PATCH] media: platform: mtk-mdp3: Add missing check and free for ida_alloc
Date: Thu,  9 Feb 2023 17:02:00 +0800
Message-Id: <20230209090200.8667-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAXMNSJtuRj978zBA--.1832S2
X-Coremail-Antispam: 1UD129KBjvJXoWruF4fKw1xZF1rAw1fWrW8tFb_yoW8JF4Upr
	WxK3y7CrWUGFnFgF40y3W7uFW5Ar1F9ayUWFZ2vw4xZas8WrsrCry5CasYvr95tryrta43
	tr4Utr43CrWYyaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc2xSY4AK67AK6r4fMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
	1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
	b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
	vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
	cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
	nxnUUI43ZEXa7VUjwSdDUUUUU==
X-Originating-IP: [124.16.138.125]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_010210_508536_93EE082F 
X-CRM114-Status: UNSURE (   8.74  )
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

Add the check for the return value of the ida_alloc in order to avoid
NULL pointer dereference.
Moreover, free allocated "ctx->id" if mdp_m2m_open fails later in order
to avoid memory leak.

Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
index 5f74ea3b7a52..857098f1d71d 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
@@ -567,6 +567,11 @@ static int mdp_m2m_open(struct file *file)
 	}
 
 	ctx->id = ida_alloc(&mdp->mdp_ida, GFP_KERNEL);
+	if (!ctx->id) {
+		ret = -ENOMEM;
+		goto err_unlock_mutex;
+	}
+
 	ctx->mdp_dev = mdp;
 
 	v4l2_fh_init(&ctx->fh, vdev);
@@ -617,6 +622,8 @@ static int mdp_m2m_open(struct file *file)
 	v4l2_fh_del(&ctx->fh);
 err_exit_fh:
 	v4l2_fh_exit(&ctx->fh);
+	ida_free(&mdp->mdp_ida, ctx->id);
+err_unlock_mutext:
 	mutex_unlock(&mdp->m2m_lock);
 err_free_ctx:
 	kfree(ctx);
-- 
2.25.1


