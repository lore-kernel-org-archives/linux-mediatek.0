Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF11606A336
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 07:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=adr30RON;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=i4yI/PNl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NMNkbp66ywBLd5rjR6iy1oAU+1Es85uVz72d+/vYbYM=; b=adr30RONURJNGpTQwCm0sSwmUL
	hJ2YhpILM8wKeMn0oY5XFVMFZF5m+8l0k3//0oLNAjymWbruo/S13yMU3CM2/0nQfLcGdHAZrUk2F
	uFMIxkdIoqpPSrWXuaD5UShBPwx9uWpCS87yDUwh6qbdsG+hbj7P2UkncE/AhJiGaOY/Fu/q+d8A2
	J82Wnh83UWaZ9yotXR2mTLS9E/uqVgwFp4Lhvs/G8HxyaDDRyyP+s0de4VUBaXFoYg96QSBaKGADo
	0MKjVO2f4ZvXLMUdbSabOz2qcIjshLU/VAKgznzAmzbL6Rx3QcaWjH7MveBrs80vNlHvFdAvmDOKS
	odjSxZIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPEg-00000008vgk-2Ok3;
	Thu, 12 Nov 2026 07:28:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPEe-00000008vfo-1gCL
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Nov 2026 07:28:41 +0000
X-UUID: aab5593cde6a11f1acbe4559397dec65-20261112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=NMNkbp66ywBLd5rjR6iy1oAU+1Es85uVz72d+/vYbYM=;
	b=i4yI/PNlUFdNErz4FFVdVa8lMCLnjKt2+9Xr+RjJhAqCx85m2qm6gSfNU/m8M6Qkrozyjmq9IYzeFK1vXeIs+H/+lJRx6Bsc5n/uLvgWS9hCmUo3r7TQuLfg6VjoMUnWHR6pW9C7K6cPWdMlQWuJhvRi7ZwiAQaUg87nlhEenz8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:f36dc369-bfff-4076-9836-2683402b1273,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:a7b5bf30-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: aab5593cde6a11f1acbe4559397dec65-20261112
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 491205378; Thu, 12 Nov 2026 00:28:33 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 12 Nov 2026 15:28:32 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 12 Nov 2026 15:28:32 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <Charlie-cy.Wu@mediatek.com>,
	<jb.tsai@mediatek.com>
Subject: [PATCH 2/2] wifi: mt76: always initialize *ret_skb in MCU send helpers
Date: Thu, 12 Nov 2026 15:28:27 +0800
Message-ID: <20261112072827.1796829-2-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261112072827.1796829-1-jb.tsai@mediatek.com>
References: <20261112072827.1796829-1-jb.tsai@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_232840_451809_48613B2A 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>

mt76_mcu_skb_send_and_get_msg() can return -EIO on an SDIO bus hang
before *ret_skb is cleared, and mt76_mcu_send_and_get_msg() returns
from the mcu_send_msg and -ENOMEM paths without touching *ret_skb.
Callers such as mt7925_mcu_get_nic_capability(),
mt7925_mcu_chip_config_query() and mt7921_mcu_get_nic_capability() are
then left with an uninitialized skb pointer.

Clear *ret_skb at the top of both helpers so that every return path
leaves it initialized.

Signed-off-by: Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mcu.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mcu.c b/drivers/net/wireless/mediatek/mt76/mcu.c
index 54b2ef2d5916..d8821dc89247 100644
--- a/drivers/net/wireless/mediatek/mt76/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mcu.c
@@ -58,6 +58,9 @@ int mt76_mcu_send_and_get_msg(struct mt76_dev *dev, int cmd, const void *data,
 {
 	struct sk_buff *skb;
 
+	if (ret_skb)
+		*ret_skb = NULL;
+
 	if (dev->mcu_ops->mcu_send_msg)
 		return dev->mcu_ops->mcu_send_msg(dev, cmd, data, len, wait_resp);
 
@@ -78,15 +81,15 @@ int mt76_mcu_skb_send_and_get_msg(struct mt76_dev *dev, struct sk_buff *skb,
 	unsigned long expires;
 	int ret, seq;
 
+	if (ret_skb)
+		*ret_skb = NULL;
+
 	if (mt76_is_sdio(dev))
 		if (test_bit(MT76_RESET, &dev->phy.state) && atomic_read(&dev->bus_hung)) {
 			dev_kfree_skb(skb);
 			return -EIO;
 		}
 
-	if (ret_skb)
-		*ret_skb = NULL;
-
 	mutex_lock(&dev->mcu.mutex);
 
 	if (dev->mcu_ops->mcu_skb_prepare_msg) {
-- 
2.18.0


