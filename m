Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414A2C4450B
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2026 12:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e/55qtpagRdrhF5w4cNcpuXpTPRmN2/7hKWCgF4G9ag=; b=lU4mcIvD/jFNUiEXL+1CkFiwQi
	tUZgpRFgvKYve5FmxJkIjWbid2UPB4Dob3DAOKC3XfQNCJrB9dj1FjmV53/sE2Yqieu50yX35458U
	TIH88FP1QmyhC8NS1zlq9cHqgXRtx+9XrOna8RGvFDZlcBsKygOFc+IF3WOxLPQq92RJ6EOOUvhNh
	RnWBDPxijUSGZNa686mAHN7/yQq2LUZzpPvRjlfkGDx3gxsFP4v+99JfL8FgVcRcLURZ+7BplqBIc
	FEFtejgDjZ/M/Wpe2LmsyHo20Tdl4R0nu2hR6Jk7U4MIZkgHeVk1uiz9XzGGpZrHyUVKJYTVFZv4s
	s4gh+wAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcKJ-0000000Bx1P-0Qym;
	Tue, 14 Jul 2026 12:33:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcKE-0000000Bwx9-1ZME
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Jul 2026 12:33:29 +0000
X-UUID: 313c31a07f8011f1afed4741b24580c9-20260714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=e/55qtpagRdrhF5w4cNcpuXpTPRmN2/7hKWCgF4G9ag=;
	b=Hz/YKolOQCr7qMvhHRyI/wkwZ+rRiMN6yxdnC20tSKzDsq71W7PXQleXK06m3QI/uI9WSL/412M+CuxJugm6cKS2sMfbMfnkhycaNN7+uuiyHjMpkfpmOAzigzj74l5sw6esve0cv9FIL3m3ec3Imm+6QI9jxbxkAj2bhxRQc74=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:3e8cab82-870d-49d3-b40b-dc7a2b9ead37,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:118d1c19-ab14-4403-9336-76696324c5a8,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99|200|213,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 313c31a07f8011f1afed4741b24580c9-20260714
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2127432816; Tue, 14 Jul 2026 05:33:18 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 14 Jul 2026 20:33:15 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 14 Jul 2026 20:33:15 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>, Paul Menzel
	<pmenzel@molgen.mpg.de>, linux-bluetooth <linux-bluetooth@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v10 1/7] Bluetooth: btmtksdio: Fix DMA out-of-bounds access in TX path
Date: Tue, 14 Jul 2026 20:33:07 +0800
Message-ID: <20260714123314.814333-2-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260714123314.814333-1-chris.lu@mediatek.com>
References: <20260714123314.814333-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_053326_423581_C32A2EF5 
X-CRM114-Status: GOOD (  15.46  )
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

btmtksdio_tx_packet() aligns transfer size to 256 bytes using
round_up(), but does not ensure the skb buffer has sufficient space,
causing DMA to read beyond the buffer.

Fix by expanding skb tailroom if needed and zero-filling the padding.

Fixes: 9aebfd4a2200 ("Bluetooth: mediatek: add support for MediaTek MT7663S and MT7668S SDIO devices")
Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
 drivers/bluetooth/btmtksdio.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index 5b0fab7b89b5..a21edefaca99 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -272,6 +272,7 @@ static int btmtksdio_tx_packet(struct btmtksdio_dev *bdev,
 			       struct sk_buff *skb)
 {
 	struct mtkbtsdio_hdr *sdio_hdr;
+	unsigned int padded_len, pad_len;
 	int err;
 
 	/* Make sure that there are enough rooms for SDIO header */
@@ -290,18 +291,40 @@ static int btmtksdio_tx_packet(struct btmtksdio_dev *bdev,
 	sdio_hdr->reserved = cpu_to_le16(0);
 	sdio_hdr->bt_type = hci_skb_pkt_type(skb);
 
+	/* Calculate padded length for block-aligned DMA transfer.
+	 * SDIO requires transfers to be block-aligned (MTK_SDIO_BLOCK_SIZE).
+	 * Pad with zeros to prevent DMA from reading beyond skb buffer.
+	 */
+	padded_len = round_up(skb->len, MTK_SDIO_BLOCK_SIZE);
+	pad_len = padded_len - skb->len;
+
+	if (pad_len > 0) {
+		/* Ensure sufficient tailroom for padding */
+		if (unlikely(skb_tailroom(skb) < pad_len)) {
+			err = pskb_expand_head(skb, 0, pad_len, GFP_ATOMIC);
+			if (err < 0)
+				goto err_skb_pull;
+		}
+
+		/* Zero-fill padding to prevent information disclosure */
+		skb_put_zero(skb, pad_len);
+	}
+
 	clear_bit(BTMTKSDIO_HW_TX_READY, &bdev->tx_state);
-	err = sdio_writesb(bdev->func, MTK_REG_CTDR, skb->data,
-			   round_up(skb->len, MTK_SDIO_BLOCK_SIZE));
+	err = sdio_writesb(bdev->func, MTK_REG_CTDR, skb->data, padded_len);
 	if (err < 0)
-		goto err_skb_pull;
+		goto err_skb_trim;
 
-	bdev->hdev->stat.byte_tx += skb->len;
+	/* Record actual transmitted data (excluding padding) */
+	bdev->hdev->stat.byte_tx += le16_to_cpu(sdio_hdr->len);
 
 	kfree_skb(skb);
 
 	return 0;
 
+err_skb_trim:
+	if (pad_len > 0)
+		skb_trim(skb, skb->len - pad_len);
 err_skb_pull:
 	skb_pull(skb, sizeof(*sdio_hdr));
 
-- 
2.45.2


