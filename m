Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DC7C4167D
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 06:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0DMBuJS1p4ko9e4K6RUAkGxosL4s/ft01d9Ym5y4QfA=; b=O9xeu0I/QUEK1ppGjmlwYxgkk7
	Mve/4VsrZl4bBZRCzFJTuyPAKfoboyIUCnZu4nnQDkUK+zQ07AJi75vWJWWeE3/jKDr0g7BnIvRAa
	JkrQwsLFoYFL2MFc1yFMJFa0ZzmWE5TrQkXVOwVxqe2xrIaFU0kp1WB5MFZrXOcOmr4LnsGuQ6n5g
	nbdllNpNfpS6NsJ1Jf/yA+N1Gf9JEfxGQTIf/oxHGq5WoxzlJxLmLd7QEy1a+WKu//jfd5WqRJ0kQ
	30xu5TkJUetmj4GS3aTwnadfs0Wscz82zYDsLfx9mmHZXugaImPmtcrYtezSJAuQjbKaW21e+1xfN
	o8J4hJBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozXh6-00Gpms-NY; Mon, 28 Nov 2022 06:32:44 +0000
Received: from spam.zju.edu.cn ([61.164.42.155] helo=zju.edu.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozXgr-00GpcT-Rs; Mon, 28 Nov 2022 06:32:32 +0000
Received: from ubuntu.localdomain (unknown [10.162.98.155])
	by mail-app4 (Coremail) with SMTP id cS_KCgDHPk7oVYRjHpqaCA--.63765S2;
	Mon, 28 Nov 2022 14:32:15 +0800 (CST)
From: Duoming Zhou <duoming@zju.edu.cn>
To: linux-kernel@vger.kernel.org
Cc: chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org,
	matthias.bgg@gmail.com,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH] usb: mtu3: fix sleep-in-atomic-context bug caused by usleep_range()
Date: Mon, 28 Nov 2022 14:32:07 +0800
Message-Id: <20221128063207.100596-1-duoming@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: cS_KCgDHPk7oVYRjHpqaCA--.63765S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw1ftF4rWF48KrW3JF43Wrg_yoW8Jw1rpa
	1UArW8Ar4jgrZIyFsrAF1vgw45CanrXay8KFW2q3yDuas5twn09F1kAFWYkF4UXF18Ar4Y
	gF1UGw1Fka1DuFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUka1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
	w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
	IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2
	z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcV
	Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r10
	6r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v
	1sIEY20_GFWkJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
	18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vI
	r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
	1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
	x4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUZa9-UUUUU=
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAgYIAVZdtcnh2gAasb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_223230_251696_6231163A 
X-CRM114-Status: UNSURE (   9.57  )
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

The function zero_autoresume() is a timer handler that runs in
atomic context. It is used to wake up the host connected to the
gadget. when used by usb mtu3, the zero_autoresume() calls
usleep_range() that can sleep. As a result, the sleep-in-atomic-
context bug will happen. The process is shown below.

    (atomic context)
zero_autoresume()
  usb_gadget_wakeup()
    mtu3_gadget_wakeup()
      usleep_range() //sleep

This patch changes usleep_range(10000, 11000) to mdelay(10)
in order to mitigate the bug.

Fixes: df2069acb005 ("usb: Add MediaTek USB3 DRD driver")
Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
---
 drivers/usb/mtu3/mtu3_gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
index 80236e7b089..e366c4a97d7 100644
--- a/drivers/usb/mtu3/mtu3_gadget.c
+++ b/drivers/usb/mtu3/mtu3_gadget.c
@@ -468,7 +468,7 @@ static int mtu3_gadget_wakeup(struct usb_gadget *gadget)
 	} else {
 		mtu3_setbits(mtu->mac_base, U3D_POWER_MANAGEMENT, RESUME);
 		spin_unlock_irqrestore(&mtu->lock, flags);
-		usleep_range(10000, 11000);
+		mdelay(10);
 		spin_lock_irqsave(&mtu->lock, flags);
 		mtu3_clrbits(mtu->mac_base, U3D_POWER_MANAGEMENT, RESUME);
 	}
-- 
2.17.1


