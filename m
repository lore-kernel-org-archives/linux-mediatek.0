Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951FBCF58F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Sep 2024 09:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fRe1VZ/Qwt/rmp6qCSIHfvjAQpuxXapDK6bFJMZDscY=; b=EtDbKj3GOflokhV3t4rkbcP+Jk
	fKMzaGcZwjpwVEpBpFlmwSQ1Z/7QnQuNoth2fYm+B1MJJ/TO0/xip5jPEggJNoxMwrWyotX8gIzRe
	Y9oIwq9udhbOuSB1LLU/cR18VkzK6bXwK75glTK5GHoT4SxBXCcH6sUpgA9PTCEcOw6+cnud/z23o
	/9e7PJFItEaoQTjWXKWpQ5iMb/hK0ayIwMMSwMNLyWne84dK2uaosvy94NQM8gqK9CrwGfBX93b1u
	CoidB+wsCRIRL38KS9CzKGuMzK+Pt6sUU4LQ9dz4WW6Xph6GfBn0psB3J9MfJCuwXOMxpvFyU6IaO
	v1Rca0Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srZlL-0000000BuUK-0j04;
	Fri, 20 Sep 2024 09:17:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srZlI-0000000BuTp-47zT;
	Fri, 20 Sep 2024 09:17:14 +0000
X-UUID: 1c1cb7d0773111efba0aef63c0775dbf-20240920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=fRe1VZ/Qwt/rmp6qCSIHfvjAQpuxXapDK6bFJMZDscY=;
	b=WYcoQKGRU+nF4dpO1oaiIEron4EDROPJuuL+E6NSZsXwx+xUfRwyE9ORc/lDBRzVxg1ubZ/nsee4371DrBj6uVEUV3SpH1eIdBjryns4owjCZvVDt0/XsExprpwBcJEqDXMPXKJ6JPC2kkdqY6q/cYzcj/6yR1h/4LVen+J5y4k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:907c63e8-e6c4-4ede-944a-7ca9668468b4,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:e3c6fc17-b42d-49a6-94d2-a75fa0df01d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1c1cb7d0773111efba0aef63c0775dbf-20240920
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <mark-pk.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2061067278; Fri, 20 Sep 2024 02:17:08 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 20 Sep 2024 17:17:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 20 Sep 2024 17:17:03 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <yj.chiang@mediatek.com>, <jy.ho@mediatek.com>, Mark-PK Tsai
	<mark-pk.tsai@mediatek.com>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH] remoteproc: virtio: Add synchronize_cbs to remoteproc_virtio
Date: Fri, 20 Sep 2024 17:16:51 +0800
Message-ID: <20240920091659.3933-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.256200-8.000000
X-TMASE-MatchedRID: XAa2d/45j8TxoFpSGnAM9UKcYi5Qw/RVMVx/3ZYby7+167wFD1iaKCMO
	uGtF4L1EbgqpvRqEHYk5Q3MXYJcEPa9VPpt+QVb+uHNkj91+t06y4iyjvVWToiz+5QCTrE/s+Vi
	hXqn9xLHBfR/WU+6YOHoyMsz8I0FQ1u8gqr2ks0XJ5W6OZe5hhSz3IJiNRHpLEB/Asc4oaYGbYz
	0jngQCJe7oid8NU9FAhiP008Dj4sgfE8yM4pjsDwtuKBGekqUpOlxBO2IcOBarhi1Jehn9vCTrR
	OMfzR3Se5e3W4VU1suoDdfoNQDR8uTW6GQajoDi1uSsQLBEGz0QKZBcLpl2MqeKDnSxteKciYxc
	+Xu5AWXBkGBTIlURuXoXDz8+lMxFpW+aIDJ4DaRzkxJ+SIkUjlAEm1wpw5h+lExlQIQeRG0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.256200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: EC54C13B8C08C7F17351EC38C392DE2B6C3BA37345CE0C8721E3E72B41C4F3142000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_021713_056576_012BE997 
X-CRM114-Status: GOOD (  12.96  )
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

Add synchornize_cbs to rproc_virtio_config_ops and a
synchronize_vqs callback to the rproc_ops to ensure vqs'
state changes are visible in vring_interrupts when the vq is
broken or removed.

And when VIRTIO_HARDEN_NOTIFICATION is not set, call
rproc_virtio_synchronize_cbs directly in __rproc_virtio_del_vqs
before virtqueue is free to ensure that rproc_vq_interrupt is
aware of the virtqueue removal.

The synchronized_vqs is expected to be implemented in rproc
driver to ensure that all previous vring_interrupts are handled
before the vqs are marked as broken or removed.

Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 drivers/remoteproc/remoteproc_virtio.c | 12 ++++++++++++
 include/linux/remoteproc.h             |  4 ++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index d3f39009b28e..e18258b69851 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -74,6 +74,14 @@ static bool rproc_virtio_notify(struct virtqueue *vq)
 	return true;
 }
 
+static void rproc_virtio_synchronize_cbs(struct virtio_device *vdev)
+{
+	struct rproc *rproc = vdev_to_rproc(vdev);
+
+	if (rproc->ops->synchronize_vqs)
+		rproc->ops->synchronize_vqs(rproc);
+}
+
 /**
  * rproc_vq_interrupt() - tell remoteproc that a virtqueue is interrupted
  * @rproc: handle to the remote processor
@@ -171,6 +179,9 @@ static void __rproc_virtio_del_vqs(struct virtio_device *vdev)
 	list_for_each_entry_safe(vq, n, &vdev->vqs, list) {
 		rvring = vq->priv;
 		rvring->vq = NULL;
+#ifndef CONFIG_VIRTIO_HARDEN_NOTIFICATION
+		rproc_virtio_synchronize_cbs(vdev);
+#endif
 		vring_del_virtqueue(vq);
 	}
 }
@@ -334,6 +345,7 @@ static const struct virtio_config_ops rproc_virtio_config_ops = {
 	.get_status	= rproc_virtio_get_status,
 	.get		= rproc_virtio_get,
 	.set		= rproc_virtio_set,
+	.synchronize_cbs = rproc_virtio_synchronize_cbs,
 };
 
 /*
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index b4795698d8c2..73901678ac7d 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -381,6 +381,9 @@ enum rsc_handling_status {
  * @panic:	optional callback to react to system panic, core will delay
  *		panic at least the returned number of milliseconds
  * @coredump:	  collect firmware dump after the subsystem is shutdown
+ * @synchronize_vqs:	optional callback to guarantee all memory operations
+ *			on the virtqueue before it are visible to the
+ *			rproc_vq_interrupt().
  */
 struct rproc_ops {
 	int (*prepare)(struct rproc *rproc);
@@ -403,6 +406,7 @@ struct rproc_ops {
 	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
 	unsigned long (*panic)(struct rproc *rproc);
 	void (*coredump)(struct rproc *rproc);
+	void (*synchronize_vqs)(struct rproc *rproc);
 };
 
 /**
-- 
2.45.2


