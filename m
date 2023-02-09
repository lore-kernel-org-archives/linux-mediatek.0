Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5F1C05027
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 09:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lBH1xliTXKQyulgtFrOAWKcw+PXjkAKSnrfNqBTlAok=; b=qcumsftebpg3kWEkPEffanVsUc
	YM7mCV4hCgTkMS4THMPlFHC8VyqW/3h/SBHo0fYzmVz1PaifKz0REwa4wTBL9N1fu9rWKOOPk5h0h
	YAM1if+2OURUqyiRCtS7NYmfQZdt86lG2jSJ5jcQ5rk6pmaMMWeTEF07EkUAtlN/1H4ldNB7vslZL
	rMBdOrnbpQ0De2ELAzdRtxYQ9Dbi9rR13OLWSg75LAikT5g8UTqG8Vz00DjMYD/t8VXSfmshyMm4M
	gjBSSaixh14ckZSTsrILkopeXK8jqpFHova3s1+jgM9Xeo44m1CpBNMSnOJhA7QOz4eSBmPQ35DQ5
	xhJWqSDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ3Bp-000nhZ-81; Thu, 09 Feb 2023 09:26:01 +0000
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ3Ay-000nFn-Lb; Thu, 09 Feb 2023 09:25:10 +0000
Received: from localhost.localdomain (unknown [124.16.138.125])
	by APP-01 (Coremail) with SMTP id qwCowAB3eETvu+RjIT40BA--.2876S2;
	Thu, 09 Feb 2023 17:25:04 +0800 (CST)
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
Subject: [PATCH v3] media: platform: mtk-mdp3: Add missing check and free for ida_alloc
Date: Thu,  9 Feb 2023 17:25:02 +0800
Message-Id: <20230209092502.34300-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAB3eETvu+RjIT40BA--.2876S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uryUZFy8Kr4DAF4rKw45KFg_yoW8Gry7pr
	WIgw47CFW5GFsrKF4Iy3W7uF45AwnY9ayUWFs2v3yxAas8WrsrGryUCasYvryktry8Ja47
	tr4jqr1furWYvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9K14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
	v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU8CJmUUUUU
X-Originating-IP: [124.16.138.125]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_012509_135447_C4491724 
X-CRM114-Status: UNSURE (   9.89  )
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
Changelog:

v2 -> v3:

1. Fix the goto label.

v1 -> v2:

1. Fix the check for the ida_alloc.
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
index 5f74ea3b7a52..a2d204e90aa4 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
@@ -567,6 +567,11 @@ static int mdp_m2m_open(struct file *file)
 	}
 
 	ctx->id = ida_alloc(&mdp->mdp_ida, GFP_KERNEL);
+	if (ctx->id < 0) {
+		ret = ctx->id;
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
+err_unlock_mutex:
 	mutex_unlock(&mdp->m2m_lock);
 err_free_ctx:
 	kfree(ctx);
-- 
2.25.1


