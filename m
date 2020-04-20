Return-Path: <SRS0=eXAR=6E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD178C54FCB
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Apr 2020 11:59:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FFF3206D4
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Apr 2020 11:59:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LKs97hQL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Za8/hECa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FFF3206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ib0s/mA67VJEUDfRA5pN/Vc7pCyqkdv7obtMhHGnaxo=; b=LKs97hQLGO2WYG
	nHqZz8nMYbm8jEaGsQx66hS/5pe5ECqTWAkqAtCaWKdEor0FVY6upFAo7vyH3Fauxpzq6buqAIuLZ
	vceUEMe2XmAhedddWWgHbEt6a1rcURHInk9oqaGy9wRzngOmZmRle3bhfoWcjWP3HYdM7Mi1CqMY2
	Vq4rv4pYyRgFcc5me0pVaAwMkO+bEor3ZCJJrsMGDm6dY57vrkSLZuQ4emWUcNp6f+kH/whd+Pdbn
	RxdRPpfV2dzNsSIDopNL7rKPkhghM2AFyWsPohMvRwnsrgpmFGENkx00ReTleaBnhAIXlIGmJW1bg
	NQiiez/6aeJVS3irFh6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQV4k-0000ht-C8; Mon, 20 Apr 2020 11:58:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQV4h-0000gv-Jl
 for linux-mediatek@lists.infradead.org; Mon, 20 Apr 2020 11:58:56 +0000
Received: from localhost.localdomain.com (unknown [151.48.159.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E7AF22072B;
 Mon, 20 Apr 2020 11:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587383935;
 bh=vr296BXTacwYCW7+S+TQrYUYxiozu97XI9e3sys14XY=;
 h=From:To:Cc:Subject:Date:From;
 b=Za8/hECa0PmiHeZTX4RPJ1kGonEEJ1JJcZmYV0j6L8LdpPk9Qg3BNdlDtFH9bstIT
 Xcd3t7xy/XVeR7gvt2EyjiFb8qZReZUNKFq/80pIvnYy6l7YL8nGY4Sg0QzWfXgL2L
 VUV0ye/c2IsgK6maKLpOgkRHIxLYoGLGMKP58grs=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH] mt76: mt7615: parse mcu return code for unified commands
Date: Mon, 20 Apr 2020 13:58:44 +0200
Message-Id: <73930f50680e6c5fb54a9eacf07003a4e22f2570.1587383612.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_045855_673406_439A7F39 
X-CRM114-Status: UNSURE (   9.00  )
X-CRM114-Notice: Please train this message.
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
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add return code parsing for the following unified commands:
- MCU_UNI_CMD_DEV_INFO_UPDATE
- MCU_UNI_CMD_BSS_INFO_UPDATE
- MCU_UNI_CMD_STA_REC_UPDATE

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 10 ++++++++++
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.h |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 703b6996a3d8..d448bbeba1c1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -187,6 +187,16 @@ mt7615_mcu_parse_response(struct mt7615_dev *dev, int cmd,
 		skb_pull(skb, sizeof(*rxd));
 		ret = le32_to_cpu(*(__le32 *)skb->data);
 		break;
+	case MCU_UNI_CMD_DEV_INFO_UPDATE:
+	case MCU_UNI_CMD_BSS_INFO_UPDATE:
+	case MCU_UNI_CMD_STA_REC_UPDATE: {
+		struct mt7615_mcu_uni_event *event;
+
+		skb_pull(skb, sizeof(*rxd));
+		event = (struct mt7615_mcu_uni_event *)skb->data;
+		ret = le32_to_cpu(event->status);
+		break;
+	}
 	default:
 		break;
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
index 5440f24a834a..032b5f98608e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
@@ -282,6 +282,12 @@ enum {
 	MCU_UNI_CMD_STA_REC_UPDATE = MCU_UNI_PREFIX | 0x03,
 };
 
+struct mt7615_mcu_uni_event {
+	u8 cid;
+	u8 pad[3];
+	__le32 status; /* 0: success, others: fail */
+} __packed;
+
 struct mt7615_mcu_scan_ssid {
 	__le32 ssid_len;
 	u8 ssid[IEEE80211_MAX_SSID_LEN];
-- 
2.25.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
