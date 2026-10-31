Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72AD606A326
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Oct 2026 16:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QChvJVxl;
	dkim=temperror header.d=stu.xidian.edu.cn header.i=@stu.xidian.edu.cn header.a=rsa-sha256 header.s=dkim header.b=dECWU22N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KCQU5UBdUKOKPuYMs15blstZHhzt4p2pk9uyUc66r64=; b=QChvJVxlUKuYSD
	67gGQyeW+kmdVVxXjZV39hDwQHc4MdMSjj7uVa3raODTq4orX9bHDNg9N5s44y7SCwVkIT69PbDYv
	p5v+7jSfPlz5C4GauozcYd2mOqmnDziBWgAvABNKJcvGS7pE/0ygM/G2LOs6ryKd0Afp9qcA7F2EK
	vTK1BTKTk4fhpfWk5TIEMnPg38g/gG9ty7qpWXk3BYcsCnWvkl1MCWPA3CCSogfWKch5BCbnGA1BS
	Zq8YGWWK8Ge8Oo9QJc+Hfn0WUZ/Jw1yiQmvSfGHfLpuIbKYqeR6Kt1P8dgvjQK0g2USgR4bDwS6lR
	VchUxTheNSqdvfg4UuXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNCIg-0000000DVEE-3vRB;
	Sat, 31 Oct 2026 16:51:27 +0000
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNCIa-0000000DVDt-1dgi
	for linux-mediatek@lists.infradead.org;
	Sat, 31 Oct 2026 16:51:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.xidian.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=KCQU5UBdUKOKPuYMs15blstZHhzt4p2pk9
	uyUc66r64=; b=dECWU22N21uPmMesS4YkdjH7dcvTyBsGdqwSTWWYoQpgg1EkZS
	x9nCJsy8Ra7Pt8gNFmqBhIKlIkLil7V1uyn8CYbvMjIqSCpsZr8lXQJtZhAVVkLs
	402Qz9mvrIGMb1LflbMHpmrbIhWfGN77JBCg9LavZQ3LH8WvdoAvUttiQ=
Received: from user-virtual-machine.localdomain (unknown [113.200.174.19])
	by hzbj-edu-front-4.icoremail.net (Coremail) with UTF8SMTPA id BrQMCkCGrAJ2HOZqZFASAQ--.38901S2;
	Sun, 01 Nov 2026 00:51:03 +0800 (CST)
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
Subject: [PATCH v2] wifi: mt76: usb: re-enable the rx worker when resuming fails
Date: Sun,  1 Nov 2026 00:51:03 +0800
Message-Id: <20261031165103.2594-1-25031212351@stu.xidian.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030021247.8032-1-25031212351@stu.xidian.edu.cn>
References: <20261030021247.8032-1-25031212351@stu.xidian.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: BrQMCkCGrAJ2HOZqZFASAQ--.38901S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWF15KrW7AF4UZr1ftr1DJrb_yoWrZr1xpF
	Z8tayayrWDGrWUK3yxAr18AayfAan3GrW7WFykW34rZws5Ar1rC340q3WjqryUCr4vka43
	JF4v93sxGrWvvFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x2
	0xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15Mc
	Ij6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l
	FIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r1l42
	xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
	GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI4
	8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4U
	MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
	8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUyXo2DUUUU
X-CM-SenderInfo: ysvqjiysrsjkur6v33wo0lvxldqovvfxof0/1tbiAQUDD2rmBFQNYAAAs5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_095121_159539_B0910289 
X-CRM114-Status: GOOD (  15.49  )
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

The early return is unbalanced with the URBs as well: mt76u_stop_rx()
poisons every URB of every RX queue, while mt76u_resume_rx() would only
unpoison the queues it reached.  If MT_RXQ_MAIN fails to submit, the URBs
of MT_RXQ_MCU keep urb->reject raised, the next stop/resume pair moves it
further away from zero instead of back to zero, and every later
submission on that queue fails with -EPERM.

A stalled RX endpoint makes usb_submit_urb() return -EPIPE, which is the
failure that leaves the MCU unresponsive and triggers the retry loop.
Unpoison and resubmit every RX queue, keep the first error, and always
re-enable the worker so that both pairs stay balanced.

Fixes: 0d2afe09fad5 ("mt76: mt7921: add mt7921u driver")
Cc: stable@vger.kernel.org
Co-developed-by: Bin Yu <byu@xidian.edu.cn>
Signed-off-by: Bin Yu <byu@xidian.edu.cn>
Co-developed-by: Cheng Wen <wencheng@xidian.edu.cn>
Signed-off-by: Cheng Wen <wencheng@xidian.edu.cn>
Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
---
v2:
 - Unpoison and resubmit every RX queue instead of breaking out of the
   loop at the first failure, so that a failing MT_RXQ_MAIN no longer
   leaves the MT_RXQ_MCU URBs poisoned across reset retries, and the queue
   indices are reset for every queue before the worker runs again.

Yes on both counts, thank you for the review.

mt76u_stop_rx() poisons the URBs of every RX queue unconditionally, so
mt76u_resume_rx() has to unpoison that same set of URBs for urb->reject to
return to zero.  The previous version only fixed the park/unpark pair:
MT_RXQ_MAIN is queue 0 and MT_RXQ_MCU is queue 1, so a submission failure
on the main queue left all MCU URBs poisoned.  The next
mt792xu_init_reset() then raised reject to 2 and the following resume
lowered it back to 1, and usb_hcd_link_urb_to_ep() keeps rejecting every
submission on that queue with -EPERM because reject is non-zero.

The skipped queue also kept its old q->head, q->tail and q->queued, since
mt76u_submit_rx_buffers() is what clears them, while the worker had
already been re-enabled.

v2 walks all RX queues, unpoisons and resubmits each of them, keeps the
first error and still always re-enables the worker.  The error is still
returned to the caller, so the firmware retry loop behaves as before.
---
 drivers/net/wireless/mediatek/mt76/usb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/usb.c b/drivers/net/wireless/mediatek/mt76/usb.c
index a9af3aa6b80a..252a18dc3cb2 100644
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
+		int ret, j;
 
 		for (j = 0; j < q->ndesc; j++)
 			usb_unpoison_urb(q->entry[j].urb);
 
-		err = mt76u_submit_rx_buffers(dev, i);
-		if (err < 0)
-			return err;
+		ret = mt76u_submit_rx_buffers(dev, i);
+		if (ret < 0 && !err)
+			err = ret;
 	}
 
 	mt76_worker_enable(&dev->usb.rx_worker);
 
-	return 0;
+	return err;
 }
 EXPORT_SYMBOL_GPL(mt76u_resume_rx);
 
-- 
2.34.1


