Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F63606A31C
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2026 02:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WH1/HLdd;
	dkim=temperror header.d=stu.xidian.edu.cn header.i=@stu.xidian.edu.cn header.a=rsa-sha256 header.s=dkim header.b=rz8XzhfX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=s9TN99h06h+xjvhYPwVB3Gbjq5FR8jNNhPs9dg8k7jA=; b=WH1/HLddHCEp52IivC8JhkFcJ9
	HlatcRas9UP4tCrAZtzS/QsbxolQIv78kine6zsfvKL5XoQb139Op9XVpW7SRE1/IIlyHQtha53VP
	ldccjOqE54QZtvnPKx4GzHABHhWfGtwKdkAszYKi7lfkkLKeXmzOSN8wWYj6TNVa4m1pEvxgsNWzf
	Xo2CbzMHqKkz0whhrmhLzaXr2vBkY+FHlvTH2qnMW9mPM2puN/qBZJTDoxwx6vxf066H7bvOix4vn
	x7eS5UufFetULKqNNT2DHu2szK4Fb20sfBClsANtvoTbFg9Z250VWTqe7jbmLwg+/k5cBfYsPn6R1
	HXHKB8Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMc7H-0000000Aeo9-2sWd;
	Fri, 30 Oct 2026 02:13:15 +0000
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMc7B-0000000Aenh-04OP
	for linux-mediatek@lists.infradead.org;
	Fri, 30 Oct 2026 02:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.xidian.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:MIME-Version:Content-Transfer-Encoding; bh=s9TN99h06h
	+xjvhYPwVB3Gbjq5FR8jNNhPs9dg8k7jA=; b=rz8XzhfXL8g+VrQiWr7OE3/xrn
	1a0fhwccJ0ErfHYoG0U+c7suy8+X2WWlxQsqHde4WcXnSLkQSkKHS0BBDUPkBtCL
	l107zRlJ4bvrDkMUC9elASAkB/D+V2O0KCXMfYMEr8Ox5ihQqPCK9J8E3TkZSoOr
	4Iy5SnHZLETGZliPQ=
Received: from user-virtual-machine.localdomain (unknown [113.200.174.123])
	by hzbj-edu-front-2.icoremail.net (Coremail) with UTF8SMTPA id BLQMCkBGif4f_eNq05gFAQ--.28179S2;
	Fri, 30 Oct 2026 10:12:48 +0800 (CST)
From: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Bin Yu <byu@xidian.edu.cn>,
	Cheng Wen <wencheng@xidian.edu.cn>
Subject: [PATCH] wifi: mt76: usb: re-enable the rx worker when resuming fails
Date: Fri, 30 Oct 2026 10:12:47 +0800
Message-Id: <20261030021247.8032-1-25031212351@stu.xidian.edu.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: BLQMCkBGif4f_eNq05gFAQ--.28179S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWF15KrW7AF4UZr1fZw45trb_yoW5GrW5pF
	WYk3yjyryDGF4DGw48A3WjyFWfAan3Gr17GryrW34ru34rAr1rA34Iga4jvryYyFWvka47
	JF4qyry3GrZYvFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBKb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq
	07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r
	18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vI
	r41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r
	4UMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
	Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x
	0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8
	JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIx
	AIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU83Ef5UUUUU=
	=
X-CM-SenderInfo: ysvqjiysrsjkur6v33wo0lvxldqovvfxof0/1tbiAQUBD2rjYVQKMAACsO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_191309_825200_8F120F06 
X-CRM114-Status: GOOD (  10.47  )
X-Spam-Score: -2.4 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mt76u_resume_rx() returns as soon as submitting the RX buffers fails, so
the mt76_worker_enable() at the end of the function is never reached and
the RX worker stays parked.  The mt792x USB reset path relies on
mt76u_stop_rx() and mt76u_resume_rx() being a balanced park/unpark pair:
if firmware download fails, mt7925_init_hardware() retries up to ten
times and calls mt792xu_init_reset() again, which parks the already
parked RX worker.  kthread_park() then hits its WARN_ON_ONCE() and
returns -EBUSY:

  WARNING: kernel/kthread.c:710 at kthread_park+0x17b/0x1b0
  Workqueue: events mt7925_init_work
  Call Trace:
   mt76_worker_disable     drivers/net/wireless/mediatek/mt76/util.h:93 [inline]
   mt76u_stop_rx+0x5b/0x2f0 drivers/net/wireless/mediatek/mt76/usb.c:757
   mt792xu_init_reset+0x52/0x80 drivers/net/wireless/mediatek/mt76/mt792x_usb.c:477
   mt7925_init_hardware     drivers/net/wireless/mediatek/mt76/mt7925/init.c:152 [inline]
   mt7925_init_work+0x49b/0x7e0 drivers/net/wireless/mediatek/mt76/mt7925/init.c:196

A stalled RX endpoint makes usb_submit_urb() return -EPIPE, which is the
failure that leaves the MCU unresponsive and triggers the retry loop.
Skip the remaining queues but always re-enable the worker, and still
return the error to the caller.

Fixes: 0d2afe09fad5 ("mt76: mt7921: add mt7921u driver")
Cc: stable@vger.kernel.org
Co-developed-by: Bin Yu <byu@xidian.edu.cn>
Signed-off-by: Bin Yu <byu@xidian.edu.cn>
Co-developed-by: Cheng Wen <wencheng@xidian.edu.cn>
Signed-off-by: Cheng Wen <wencheng@xidian.edu.cn>
Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
---
 drivers/net/wireless/mediatek/mt76/usb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/usb.c b/drivers/net/wireless/mediatek/mt76/usb.c
index a9af3aa6b80a..1c9bf3679774 100644
--- a/drivers/net/wireless/mediatek/mt76/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/usb.c
@@ -775,23 +775,23 @@ EXPORT_SYMBOL_GPL(mt76u_stop_rx);
 
 int mt76u_resume_rx(struct mt76_dev *dev)
 {
-	int i;
+	int i, err = 0;
 
 	mt76_for_each_q_rx(dev, i) {
 		struct mt76_queue *q = &dev->q_rx[i];
-		int err, j;
+		int j;
 
 		for (j = 0; j < q->ndesc; j++)
 			usb_unpoison_urb(q->entry[j].urb);
 
 		err = mt76u_submit_rx_buffers(dev, i);
 		if (err < 0)
-			return err;
+			break;
 	}
 
 	mt76_worker_enable(&dev->usb.rx_worker);
 
-	return 0;
+	return err;
 }
 EXPORT_SYMBOL_GPL(mt76u_resume_rx);
 
-- 
2.34.1


