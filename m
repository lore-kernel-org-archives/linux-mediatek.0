Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8622C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 02:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nsb0GMRPsz23FtrJAjSnZQrzzTCaFmzg6VcGFcB/Bq4=; b=SAMmciR6/zc1NLllc7e5BQyBJl
	MUmYsiYNFqJ+iM1eYLWJAZldrQ2PRu6vryKRsipLzIckNcl+afb9VfM+l3b8uRgwUQt5vfHKxjgyf
	ig9y/YH+hl8OO4GoRSjZL5KmdBeZphQani0WvQOM+fJoSfW7im3Un5Ry+kox/IHEQE4JG8UKObfB8
	yQkAWTpRDFR6q5CgR5EvADzubit17AnnHrE8dIognmokhTdc8k0DX7sGYIZnCkNI7G4NBwHn0vCD8
	rjpBp6JorbxBxbQGvhFD71gbkXBhKilxncq0ODpsFspPUDTgdAqwmTbialHVl9Frg8h0HQ9/059Ws
	RcctTB3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEiMH-00Gtk5-Gz; Fri, 22 Jul 2022 02:25:41 +0000
Received: from mail.zju.edu.cn ([61.164.42.155] helo=zju.edu.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEiM5-00GtF3-MN; Fri, 22 Jul 2022 02:25:31 +0000
Received: from localhost.localdomain (unknown [10.12.77.33])
	by mail-app4 (Coremail) with SMTP id cS_KCgDn6Mx_CtpiRg0IAQ--.0S4;
	Fri, 22 Jul 2022 10:25:03 +0800 (CST)
From: Lin Ma <linma@zju.edu.cn>
To: dongchun.zhu@mediatek.com,
	zhengsq@rock-chips.com,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Lin Ma <linma@zju.edu.cn>
Subject: [PATCH v0] media: i2c: fix the erroneous pointer initializer
Date: Fri, 22 Jul 2022 10:24:59 +0800
Message-Id: <20220722022459.5030-1-linma@zju.edu.cn>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cS_KCgDn6Mx_CtpiRg0IAQ--.0S4
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr4rtw47GF1UtrykurW8tFb_yoW8ZFy5pF
	ZrX34akryYgr4jqF17J3yUuFyYga1xJFy8KFW3uw15ZFWUCryIvryftF4Yyr1kGrWDKa4I
	qw1rtrW3Aa1xAF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkI1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
	w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
	IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2
	z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcV
	Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j
	6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v
	1sIEY20_GFWkJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
	18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vI
	r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
	1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
	x4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-CM-SenderInfo: qtrwiiyqvtljo62m3hxhgxhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_192530_123690_A77EE292 
X-CRM114-Status: UNSURE (   9.49  )
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

There are obvious errors for the initializer of ov02a10_i2c_driver,
ov2682_i2c_driver, and ov5695_i2c_driver as the code intended to assign
"address of function pointer" to function pointer. This patch fixes them
by removing redundant & operators.

Signed-off-by: Lin Ma <linma@zju.edu.cn>
---
 drivers/media/i2c/ov02a10.c | 4 ++--
 drivers/media/i2c/ov2685.c  | 4 ++--
 drivers/media/i2c/ov5695.c  | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
index 0f08c05333ea..5d205454ca4e 100644
--- a/drivers/media/i2c/ov02a10.c
+++ b/drivers/media/i2c/ov02a10.c
@@ -1004,8 +1004,8 @@ static struct i2c_driver ov02a10_i2c_driver = {
 		.pm = &ov02a10_pm_ops,
 		.of_match_table = ov02a10_of_match,
 	},
-	.probe_new	= &ov02a10_probe,
-	.remove		= &ov02a10_remove,
+	.probe_new	= ov02a10_probe,
+	.remove		= ov02a10_remove,
 };
 module_i2c_driver(ov02a10_i2c_driver);
 
diff --git a/drivers/media/i2c/ov2685.c b/drivers/media/i2c/ov2685.c
index b6e010ea3249..4b9f4f3a0194 100644
--- a/drivers/media/i2c/ov2685.c
+++ b/drivers/media/i2c/ov2685.c
@@ -832,8 +832,8 @@ static struct i2c_driver ov2685_i2c_driver = {
 		.pm = &ov2685_pm_ops,
 		.of_match_table = of_match_ptr(ov2685_of_match),
 	},
-	.probe		= &ov2685_probe,
-	.remove		= &ov2685_remove,
+	.probe		= ov2685_probe,
+	.remove		= ov2685_remove,
 };
 
 module_i2c_driver(ov2685_i2c_driver);
diff --git a/drivers/media/i2c/ov5695.c b/drivers/media/i2c/ov5695.c
index 910309783885..59da66f4f810 100644
--- a/drivers/media/i2c/ov5695.c
+++ b/drivers/media/i2c/ov5695.c
@@ -1395,8 +1395,8 @@ static struct i2c_driver ov5695_i2c_driver = {
 		.pm = &ov5695_pm_ops,
 		.of_match_table = of_match_ptr(ov5695_of_match),
 	},
-	.probe		= &ov5695_probe,
-	.remove		= &ov5695_remove,
+	.probe		= ov5695_probe,
+	.remove		= ov5695_remove,
 };
 
 module_i2c_driver(ov5695_i2c_driver);
-- 
2.36.1


