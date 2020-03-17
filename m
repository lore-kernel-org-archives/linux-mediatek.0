Return-Path: <SRS0=yvcX=5C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F05CC4CECE
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 16:42:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEAF920753
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 16:42:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mUm2YOqH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="xGPujb9A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEAF920753
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=301Cp4wDrTTwtpwGwOuR/SDHMerK7GS2cG8TPOHv5eA=; b=mUm2YOqHnsHcaR
	wvNIjt+AtJs1lgC5vH+KRqGrMdHHo82v/mScgfvOVJBHj7+aI1wLnji63Z7Du0ZKBaLu8eaD+olRF
	pPF2sLqJMVgEyFob0CrI6Pyk1VNKeO3VYcMYAh2xFnhuETPj+ClmezbsVqcV2Nmihz8z+Q42DY/z/
	mOn2T4LPxe25lixjOyx2QF5k+9lA30WQm6QAZ1WUwLP0426jvBCPPoY8Ipy3fEO630ILr+s3bg2xb
	mfLoQh65CWojjyLbTPl8HsXGtRMmKGIxJ2v83p/GEA8eB/M7W8+dd/mJTtHsA2yUbzeVVFtSyyS5m
	4+EzuFSrztVD/IXKU/mA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEFI8-0006Xs-Us; Tue, 17 Mar 2020 16:42:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEFI3-0006Si-M7
 for linux-mediatek@lists.infradead.org; Tue, 17 Mar 2020 16:42:05 +0000
Received: from lore-desk-wlan.redhat.com (unknown [151.48.128.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 097B520735;
 Tue, 17 Mar 2020 16:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584463323;
 bh=TgG4jLpiNguDpijO9q29NFjrVfGkpV8PWrC84D3BII4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xGPujb9AbSRjA4EvlnTkTr1kPF6qtj5ovaaJfb7gEX5jDXAZ/9Yq4w+re8g0Okjkf
 tp34nuMyNOqTJUwcHXvsYu80xF6QWKFnEnIuZXWIEMIr2UtsVv3hx4x3JqyGxp/N/U
 Q6L7GRGqcIXlrbjarijvw+UAXg6toeIMMVQGDWGE=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v4 06/25] mt76: mt7615: introduce mt7615_mcu_send_message
 routine
Date: Tue, 17 Mar 2020 17:41:13 +0100
Message-Id: <1093a0fb9aae0d6b332ff8799b03ae6b593f55a8.1584463004.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1584463004.git.lorenzo@kernel.org>
References: <cover.1584463004.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200317_094203_775694_F89B5EF2 
X-CRM114-Status: UNSURE (   9.97  )
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
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org, ryder.lee@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Introduce mt7615_mcu_send_message routine in order to allocate mcu skb
out of mcu sending routine. This approach is useful when the mcu
message is complicated and it is convenient to rely on skb buffer API

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt76.h     |  4 ++++
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 23 +++++++++++++------
 2 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index aca477434858..8e4759bc8f59 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -139,6 +139,8 @@ struct mt76_sw_queue {
 struct mt76_mcu_ops {
 	int (*mcu_send_msg)(struct mt76_dev *dev, int cmd, const void *data,
 			    int len, bool wait_resp);
+	int (*mcu_skb_send_msg)(struct mt76_dev *dev, struct sk_buff *skb,
+				int cmd, bool wait_resp);
 	int (*mcu_wr_rp)(struct mt76_dev *dev, u32 base,
 			 const struct mt76_reg_pair *rp, int len);
 	int (*mcu_rd_rp)(struct mt76_dev *dev, u32 base,
@@ -588,7 +590,9 @@ enum mt76_phy_type {
 #define mt76_rd_rp(dev, ...)	(dev)->mt76.bus->rd_rp(&((dev)->mt76), __VA_ARGS__)
 
 #define mt76_mcu_send_msg(dev, ...)	(dev)->mt76.mcu_ops->mcu_send_msg(&((dev)->mt76), __VA_ARGS__)
+
 #define __mt76_mcu_send_msg(dev, ...)	(dev)->mcu_ops->mcu_send_msg((dev), __VA_ARGS__)
+#define __mt76_mcu_skb_send_msg(dev, ...)	(dev)->mcu_ops->mcu_skb_send_msg((dev), __VA_ARGS__)
 #define mt76_mcu_restart(dev, ...)	(dev)->mt76.mcu_ops->mcu_restart(&((dev)->mt76))
 #define __mt76_mcu_restart(dev, ...)	(dev)->mcu_ops->mcu_restart((dev))
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index b94b1b73fd1a..eb6867a316b1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -166,17 +166,12 @@ int mt7615_mcu_wait_response(struct mt7615_dev *dev, int cmd, int seq)
 }
 
 static int
-mt7615_mcu_msg_send(struct mt76_dev *mdev, int cmd, const void *data,
-		    int len, bool wait_resp)
+mt7615_mcu_send_message(struct mt76_dev *mdev, struct sk_buff *skb,
+			int cmd, bool wait_resp)
 {
 	struct mt7615_dev *dev = container_of(mdev, struct mt7615_dev, mt76);
-	struct sk_buff *skb;
 	int ret, seq;
 
-	skb = mt7615_mcu_msg_alloc(data, len);
-	if (!skb)
-		return -ENOMEM;
-
 	mutex_lock(&mdev->mcu.mutex);
 
 	ret = __mt7615_mcu_msg_send(dev, skb, cmd, &seq);
@@ -192,6 +187,19 @@ mt7615_mcu_msg_send(struct mt76_dev *mdev, int cmd, const void *data,
 	return ret;
 }
 
+static int
+mt7615_mcu_msg_send(struct mt76_dev *mdev, int cmd, const void *data,
+		    int len, bool wait_resp)
+{
+	struct sk_buff *skb;
+
+	skb = mt7615_mcu_msg_alloc(data, len);
+	if (!skb)
+		return -ENOMEM;
+
+	return __mt76_mcu_skb_send_msg(mdev, skb, cmd, wait_resp);
+}
+
 static void
 mt7615_mcu_csa_finish(void *priv, u8 *mac, struct ieee80211_vif *vif)
 {
@@ -704,6 +712,7 @@ int mt7615_mcu_fw_log_2_host(struct mt7615_dev *dev, u8 ctrl)
 int mt7615_mcu_init(struct mt7615_dev *dev)
 {
 	static const struct mt76_mcu_ops mt7615_mcu_ops = {
+		.mcu_skb_send_msg = mt7615_mcu_send_message,
 		.mcu_send_msg = mt7615_mcu_msg_send,
 		.mcu_restart = mt7615_mcu_restart,
 	};
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
