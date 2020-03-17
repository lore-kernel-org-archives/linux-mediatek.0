Return-Path: <SRS0=yvcX=5C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B017C10F29
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 16:42:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7031720753
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 16:42:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ILnwLW0N";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zlp6oDZd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7031720753
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dM9BNLmDPqUVXPfVvLynGieM0h4zyfJSsOeAuqF9sNY=; b=ILnwLW0NMvolpj
	wtC+ElfP5RxmZKqMfpIA3NYZkQMBJxl/DFz7ikcVgKEnqj9K7OMDPaYpM8P//p6Qi6mf8E9+GvSwI
	ewtzL2yK4cfndZIxC1pKJsWox1FNnpWE4CeLL75EJiY3GSVmdzprvYYH5xfuv/nhVwloD8vc75Dot
	CpmjAcR9Kt2yRdKKyjyhj5H9gC13Osa0e5ELxTcRyGzqMJ0oxKpV4Ps2Llu8JPc48J5zLc+Zu3dwu
	+QR/1anVWVG5/VCRHr/mR14iEIup7vzY6PjYZrxtnKDWPUz9N6NoXLFf0ZuwmPPATUcFZBYxnSDki
	9SSvYPgLvaLxT4+6VELw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEFI5-0006Uv-LY; Tue, 17 Mar 2020 16:42:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEFI1-0006RA-Sv
 for linux-mediatek@lists.infradead.org; Tue, 17 Mar 2020 16:42:03 +0000
Received: from lore-desk-wlan.redhat.com (unknown [151.48.128.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3CC9120663;
 Tue, 17 Mar 2020 16:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584463321;
 bh=stvEWE/UNRq2scTKJNcRVS987QpoO+8R7uUAyV0wHnM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zlp6oDZdrit/sYgaBZuT8L8O+8e/knvbic7Z0b8enlvbYh0COFAVshVbHGnuESuVF
 O82CiGcACW93QlHMhcdAkFb8AOcHLKuxkYntKNqePLiqancOLlaCXvSnFyjRLR/1Qr
 nMPpgOvKdm8iGLAtryRK6+CymKNR7lv6gQiUjbCg=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v4 05/25] mt76: always init to 0 mcu messages
Date: Tue, 17 Mar 2020 17:41:12 +0100
Message-Id: <b5ac6d7832c930281984f3f0c063ccd39e168a17.1584463004.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1584463004.git.lorenzo@kernel.org>
References: <cover.1584463004.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200317_094201_953880_42096CE8 
X-CRM114-Status: GOOD (  10.88  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org, ryder.lee@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Always initialize to 0 mcu messages since if they are not propely
configured they could hang the firmware.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mcu.c        | 6 ++++--
 drivers/net/wireless/mediatek/mt76/mt7603/mcu.c | 1 -
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 1 -
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mcu.c b/drivers/net/wireless/mediatek/mt76/mcu.c
index 633ad948c21d..4048f446e3ee 100644
--- a/drivers/net/wireless/mediatek/mt76/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mcu.c
@@ -9,14 +9,16 @@ struct sk_buff *
 mt76_mcu_msg_alloc(const void *data, int head_len,
 		   int data_len, int tail_len)
 {
+	int length = head_len + data_len + tail_len;
 	struct sk_buff *skb;
 
-	skb = alloc_skb(head_len + data_len + tail_len,
-			GFP_KERNEL);
+	skb = alloc_skb(length, GFP_KERNEL);
 	if (!skb)
 		return NULL;
 
+	memset(skb->head, 0, length);
 	skb_reserve(skb, head_len);
+
 	if (data && data_len)
 		skb_put_data(skb, data, data_len);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7603/mcu.c
index b466b3ab8a2c..77985d81c447 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/mcu.c
@@ -27,7 +27,6 @@ __mt7603_mcu_msg_send(struct mt7603_dev *dev, struct sk_buff *skb,
 		seq = ++mdev->mcu.msg_seq & 0xf;
 
 	txd = (struct mt7603_mcu_txd *)skb_push(skb, hdrlen);
-	memset(txd, 0, hdrlen);
 
 	txd->len = cpu_to_le16(skb->len);
 	if (cmd == -MCU_CMD_FW_SCATTER)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index b24240f90a7d..b94b1b73fd1a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -62,7 +62,6 @@ void mt7615_mcu_fill_msg(struct mt7615_dev *dev, struct sk_buff *skb,
 		seq = ++dev->mt76.mcu.msg_seq & 0xf;
 
 	mcu_txd = (struct mt7615_mcu_txd *)skb_push(skb, sizeof(*mcu_txd));
-	memset(mcu_txd, 0, sizeof(*mcu_txd));
 
 	if (cmd != -MCU_CMD_FW_SCATTER) {
 		q_idx = MT_TX_MCU_PORT_RX_Q0;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
