Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC8D606A31A
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2026 08:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pEy7KYc2;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LCstpISX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=x3LnsTRS1dnrRM4yNtWpemXuIEJdYAT0PtyCG1QfkdQ=; b=pEy7KYc2gNJhgvemEsWeJyWNTO
	a2f4ROKhoQTx2lERMVYFxOLdW+FaDSy/LJzgakhon9Vw42YiEhzvzMMREGB7S+OU6zSq0Spn4A1sn
	7mitj49fzloLidjl280dtApb2I5Hi82T5puYYf0iO2ZtWksfVKGl7YOj8QM++Ob18wzIIjfb5bn/S
	a9K187/YKToXA4b5UZArqtqwh/rHFdeNEhQKX4e1sTZi8se2wgEx+PIbpVFD9dP8IquLzD8I0NJ12
	vENlmgFchwVMhHa3TfqtVo8h4D4JxwpG/RhDRanOg5pepCaxCY6MMbXja7gl9fGIWhdJ6ejbU8qUv
	fHSnKE9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJoWC-0000000DlO0-31O0;
	Thu, 22 Oct 2026 08:51:24 +0000
Received: from out-160.mta0.migadu.com ([2001:41d0:1004:224b::a0] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJoW8-0000000DlMi-05wo
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Oct 2026 08:51:23 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=2f8PtKyL+H9I/dXyzzOyuH2jrH5LoCjaCgKtz8un7Pk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792659075; v=1; x=1793263875;
 b=LCstpISX/qKcFrStc7RUSvzSRZTQSA8jxyys/kekD/Be0ki4pJj2cpEcfQLTNISbiPVRBb9k
 GbtsKBCWtQBuz+UDzaWvkjI7XJaot5ZOB/Ol4FcbIa4EwIEILzmeubOoiu//afMpoy1DCJNeU9F
 XrM8jEhuiuzuqiao6ixWApVw=
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by mta10.migadu.com with ESMTPS id 7d77fb6879c93d29;
	Thu, 22 Oct 2026 08:51:14 +0000
X-Mizu-Trace-ID: 7d77fb6879c93d29
X-Migadu-Flow: FLOW_OUT
From: Yi Cong <cong.yi@linux.dev>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	mingyen.hsieh@mediatek.com,
	emery.hsin@mediatek.com,
	Yi Cong <yicong@kylinos.cn>
Subject: [PATCH] wifi: mt76: mt7925: do not report resume failure after reset recovery
Date: Thu, 22 Oct 2026 16:51:00 +0800
Message-Id: <20261022085100.132368-1-cong.yi@linux.dev>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_015120_561829_F9A2F387 
X-CRM114-Status: GOOD (  10.99  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Yi Cong <yicong@kylinos.cn>

When the firmware loses its state over suspend-to-RAM, e.g. on
platforms that cut PCIe auxiliary power, the HIF resume handshake on
the resume path always times out. The mt792x_reset() fallback already
recovers the device with a full reinitialization, just like the
hibernate restore path:

commit d54424fbc53b4 ("wifi: mt76: mt7925: add pci restore for hibernate")

Yet the callback still returns -ETIMEDOUT, so the PM core reports a
resume failure for an already recovered device on every resume:

mt7925e 0000:12:00.0: PM: dpm_run_callback(): pci_pm_resume returns -110
mt7925e 0000:12:00.0: PM: failed to resume async: error -110

Report success instead once the reset fallback is scheduled, and skip
the follow-up commands that the reloaded firmware cannot answer.
Platforms whose firmware survives suspend are unaffected.

Signed-off-by: Yi Cong <yicong@kylinos.cn>
---
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index 0d477dc1086c..82ee58eca78c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -886,6 +886,7 @@ static int _mt7925_pci_resume(struct device *device, bool restore)
 	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
 	struct mt76_connac_pm *pm = &dev->pm;
 	int i, err, ret;
+	bool hif_timeout = false;
 
 	dev->hif_idle = false;
 	err = mt792x_mcu_drv_pmctrl(dev);
@@ -927,7 +928,9 @@ static int _mt7925_pci_resume(struct device *device, bool restore)
 	ret = wait_event_timeout(dev->wait,
 				 dev->hif_resumed, 3 * HZ);
 	if (!ret) {
-		err = -ETIMEDOUT;
+		hif_timeout = true;
+		dev_info(mdev->dev,
+			 "HIF resume handshake timed out, recovering through reset\n");
 		goto failed;
 	}
 
@@ -939,7 +942,7 @@ static int _mt7925_pci_resume(struct device *device, bool restore)
 failed:
 	pm->suspended = false;
 
-	if (err < 0 || restore)
+	if (err < 0 || restore || hif_timeout)
 		mt792x_reset(&dev->mt76);
 
 	return err;
-- 
2.25.1


