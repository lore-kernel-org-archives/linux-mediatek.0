Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E11DCD98CF
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jun 2026 22:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8SsbLPE8jKHuu6btQ6EX0WxVpmk5Y39/q30/o1tZ/LY=; b=Inxpz0NikdCpY9elhENjBdVaPY
	DR0OMrdokmP3sPYvipuWE77BnO3MCG7+Orsbs7N+o2DljtA0RUkrXKeuIbTT/N58HsyTT1dO48QGU
	d1F7zEVR2WZczR+oHTXEc5GEzFdezLlBnK3NCEv5MlJOL7JjQw7cyAGefA+ESwEmInvTraLO8x97M
	dyclmbDNWRfGSII1n8CG4+z//gFl1/4Qt1ZtztddwOpxnV2CQPoUO8ww/23t4Opf3sW5THbqL/ZT3
	5Ze6h9fbSLYjD50MxBfRHV/YHpmWj5mbCuCq6Oo8y6IMznqi7oIo+bnX04Gn4RucH8aU54+tBWC5v
	P2x3dnpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYX3d-0000000Ca4g-2efS;
	Sat, 13 Jun 2026 22:42:29 +0000
Received: from mail-dy1-f175.google.com ([74.125.82.175])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYX3b-0000000Ca4M-22eP
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Jun 2026 22:42:28 +0000
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30807ba471bso6138809eec.1
        for <linux-mediatek@lists.infradead.org>; Sat, 13 Jun 2026 15:42:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781390547; x=1781995347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8SsbLPE8jKHuu6btQ6EX0WxVpmk5Y39/q30/o1tZ/LY=;
        b=Yx4+vnsg7HBlQK8yZ1GnYi2Vc+xpySUA6AVsL9ehqIWQXBV++IWhqmdMUtzndsduON
         8uLXKgv8KsVTxPU8gzk40HF/dsNQmKIhXtvUwr8HVe6bxf7Jl2cEtmiIkzoeC6zY3cZn
         5FI4C/I9yRy0q4ZPJ3Z36LcCG2TvM/ZhFkJxWoSHb/iXFIPkT1RHNiFn51hoebNyW8K6
         oUsCnNtU9d6Z4ZakSzSrC/uCDHGBQxPqbPrWVRpnHyJDveqDdnIT/EglTqOENRrZpoqA
         dymOI5gGe8z81MdnXqFes+HC39ycHTqci1JY6/RGiGgJlWacBDwZVxyYTLVmQdXdA6q4
         AltQ==
X-Forwarded-Encrypted: i=1; AFNElJ/HVxNXroSjvudM95hN8KGaxJ9HT7+Y45Z72ALHqSHNtdcBqzqPNd9vt2OowqG0deC65/D88Kv3u6TF+R9Qbg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxpbzXeHxF2Le3wxGu2iBA39igDpFOPrTU8r2+2iERiOMZ0hUDD
	vHu/oFX5L1Do/tHpTFQfNx7GxdqcE6Ljigm2i1d0SXqAyNubOseXWwGG
X-Gm-Gg: Acq92OHH21E3KTGLqrYfoEUpEDFd82YUJyrMCig1NL3RmcDCMGabUqDa29EWYaybfVL
	Oto37gr7lyCfFT9eqA0N4Ylo1bRKdVYaKO6Nq3zODDQ8d4i/fEH5wQKP+JJCTgEIb27r38La2ef
	gLd43nIGKJwis0Vi9kY/t2B2laDBwa1FmHEYAYh8m4/oAFJWr/YuitN+xjEdwA7ZNbYbklNarn2
	qsKFKc16ukU75NfQ+QMapG2YWUjMjxOws0q1gZKLtqQpdOQ4BorKl4q/4KfA4l3EHpCR+OXbihD
	Lnv+3OXjNQhOWchWSyDH+RLJSgn5ZzG53Ukf2srNySLa+PKY3xib6xIK1/1B288fsG2kCZuHVRh
	7Vv1EYN/FrFCoqgWrMms8cEoPvAkgFBj0qXLWDr0YlU6nQ1U4eeDvLjS1Eo/T68eQFJW/AjiTtb
	14p9xur/HRkLBpbePVBXMUeSV0aV5YwdgRQabYh7Jlptdkfa67sqKylnLghRxK78Vh8JIvvyazV
	e8d7UV0HvF35aQ5CBDdvbn10Xq60auFWGiVwjr6
X-Received: by 2002:a05:7300:5415:b0:2f2:5c68:5052 with SMTP id 5a478bee46e88-3081ff744b8mr4489412eec.13.1781390546535;
        Sat, 13 Jun 2026 15:42:26 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.. (114-34-228-194.hinet-ip.hinet.net. [114.34.228.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb95450sm11104825eec.28.2026.06.13.15.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 15:42:26 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 3/6] wifi: mt76: mt792x: stop USB register access after bus hang
Date: Sat, 13 Jun 2026 17:41:28 -0500
Message-ID: <20260613224131.2396026-4-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613224131.2396026-1-sean.wang@kernel.org>
References: <20260613224131.2396026-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_154227_530418_BBB35BD3 
X-CRM114-Status: GOOD (  15.89  )
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

From: Sean Wang <sean.wang@mediatek.com>

Mark the mt792x USB bus hung on the first control timeout and switch
register access to no-op bus ops. Each failed vendor request may spend
up to MT_VEND_REQ_MAX_RETRY * MT_VEND_REQ_TOUT_MS, about 3 seconds, and
teardown/reset paths can keep issuing such requests after the device has
stopped responding.

Also skip the USB WFSYS reset path after bus_hung is set, since it uses
UHW vendor requests as well.

mt7925u 1-2:1.3: vendor request req:63 off:0018 failed:-110
mt7925u 1-2:1.3: vendor request req:63 off:0018 failed:-110
mt7925u 1-2:1.3: vendor request req:63 off:0018 failed:-110
mt7925u 1-2:1.3: vendor request req:63 off:0018 failed:-110
mt7925u 1-2:1.3: vendor request req:63 off:0018 failed:-110

Avoid repeating those register reads after the bus is known to be hung by
switching register access to no-op handlers.

Fixes: 0d2afe09fad5 ("mt76: mt7921: add mt7921u driver")
Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h     |  1 +
 .../net/wireless/mediatek/mt76/mt792x_usb.c   | 79 ++++++++++++++++---
 drivers/net/wireless/mediatek/mt76/usb.c      | 11 +++
 3 files changed, 82 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 07955555f84d..122e77a5f2f4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -672,6 +672,7 @@ struct mt76_usb {
 
 	u8 out_ep[__MT_EP_OUT_MAX];
 	u8 in_ep[__MT_EP_IN_MAX];
+	void (*ctrl_timeout)(struct mt76_dev *dev, int err);
 	bool sg_en;
 
 	struct mt76u_mcu {
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
index 910132e94956..d86b0918c2f8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
@@ -31,10 +31,75 @@ static void mt792xu_reset_work(struct work_struct *work)
 	atomic_set(&dev->usb_reset_pending, 0);
 }
 
+static void mt792xu_queue_usb_reset(struct mt792x_dev *dev, int err)
+{
+	if (!atomic_xchg(&dev->usb_reset_pending, 1)) {
+		dev_warn(dev->mt76.dev,
+			 "USB transport access failed (%d), queueing device reset\n",
+			 err);
+
+		schedule_work(&dev->usb_reset_work);
+	}
+}
+
+static u32 mt792xu_bus_hung_rr(struct mt76_dev *mdev, u32 offset)
+{
+	return 0;
+}
+
+static void mt792xu_bus_hung_wr(struct mt76_dev *mdev, u32 offset, u32 val)
+{
+}
+
+static u32 mt792xu_bus_hung_rmw(struct mt76_dev *mdev, u32 offset,
+				u32 mask, u32 val)
+{
+	return 0;
+}
+
+static void mt792xu_bus_hung_write_copy(struct mt76_dev *mdev, u32 offset,
+					const void *data, int len)
+{
+}
+
+static void mt792xu_bus_hung_read_copy(struct mt76_dev *mdev, u32 offset,
+				       void *data, int len)
+{
+	memset(data, 0, len);
+}
+
+static const struct mt76_bus_ops mt792xu_bus_hung_ops = {
+	.rr = mt792xu_bus_hung_rr,
+	.wr = mt792xu_bus_hung_wr,
+	.rmw = mt792xu_bus_hung_rmw,
+	.write_copy = mt792xu_bus_hung_write_copy,
+	.read_copy = mt792xu_bus_hung_read_copy,
+	.type = MT76_BUS_USB,
+};
+
+static void mt792xu_set_bus_hung(struct mt792x_dev *dev)
+{
+	atomic_set(&dev->mt76.bus_hung, true);
+
+	if (READ_ONCE(dev->mt76.bus) == &mt792xu_bus_hung_ops)
+		return;
+
+	WRITE_ONCE(dev->mt76.bus, &mt792xu_bus_hung_ops);
+}
+
+static void mt792xu_ctrl_timeout(struct mt76_dev *mdev, int err)
+{
+	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
+
+	mt792xu_set_bus_hung(dev);
+	mt792xu_queue_usb_reset(dev, err);
+}
+
 void mt792xu_reset_work_init(struct mt792x_dev *dev)
 {
 	INIT_WORK(&dev->usb_reset_work, mt792xu_reset_work);
 	atomic_set(&dev->usb_reset_pending, 0);
+	dev->mt76.usb.ctrl_timeout = mt792xu_ctrl_timeout;
 }
 EXPORT_SYMBOL_GPL(mt792xu_reset_work_init);
 
@@ -68,15 +133,8 @@ int mt792xu_reset_on_bus_error(struct mt792x_dev *dev)
 		err = mt792xu_check_bus(dev);
 
 	if (err) {
-		atomic_set(&dev->mt76.bus_hung, true);
-
-		if (!atomic_xchg(&dev->usb_reset_pending, 1)) {
-			dev_warn(dev->mt76.dev,
-				 "USB transport access failed (%d), queueing device reset\n",
-				 err);
-
-			schedule_work(&dev->usb_reset_work);
-		}
+		mt792xu_set_bus_hung(dev);
+		mt792xu_queue_usb_reset(dev, err);
 
 		return err;
 	}
@@ -344,6 +402,9 @@ int mt792xu_wfsys_reset(struct mt792x_dev *dev)
 	u32 val;
 	int i;
 
+	if (atomic_read(&dev->mt76.bus_hung))
+		return -EIO;
+
 	mt792xu_epctl_rst_opt(dev, false);
 
 	val = mt792xu_uhw_rr(&dev->mt76, desc->rst_reg);
diff --git a/drivers/net/wireless/mediatek/mt76/usb.c b/drivers/net/wireless/mediatek/mt76/usb.c
index 77a8e35b1f86..ce68e1d0c786 100644
--- a/drivers/net/wireless/mediatek/mt76/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/usb.c
@@ -30,6 +30,8 @@ int __mt76u_vendor_request(struct mt76_dev *dev, u8 req, u8 req_type,
 	for (i = 0; i < MT_VEND_REQ_MAX_RETRY; i++) {
 		if (test_bit(MT76_REMOVED, &dev->phy.state))
 			return -EIO;
+		if (dev->usb.ctrl_timeout && atomic_read(&dev->bus_hung))
+			return -EIO;
 
 		ret = usb_control_msg(udev, pipe, req, req_type, val,
 				      offset, buf, len, MT_VEND_REQ_TOUT_MS);
@@ -42,6 +44,15 @@ int __mt76u_vendor_request(struct mt76_dev *dev, u8 req, u8 req_type,
 
 	dev_err(dev->dev, "vendor request req:%02x off:%04x failed:%d\n",
 		req, offset, ret);
+
+	if (dev->usb.ctrl_timeout) {
+		atomic_set(&dev->bus_hung, true);
+		dev_err(dev->dev, "vendor request req:%02x off:%04x timed out, marking bus hung\n",
+			req, offset);
+		dev->usb.ctrl_timeout(dev, ret);
+		return ret;
+	}
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(__mt76u_vendor_request);
-- 
2.43.0


