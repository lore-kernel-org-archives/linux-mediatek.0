Return-Path: <SRS0=bnG6=GB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 972E5C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Dec 2020 21:16:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43B8C20727
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Dec 2020 21:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43B8C20727
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pQN3//iotl+kmrArzxvJZ8KRjSiOKr43w5Hct3k052M=; b=XE3i25HdcvwjeeWBCUJ42A3Xx3
	RpEMtFBGkZFFK/22j9dYUTESQQ/cN9T1ZXxn7kOdacWLoI1DckjdplKNcKWIOjnUpMtuDxvv/5Iru
	4SM+v/UsvQxpnZYgLjysdzZOkUf8fcoL9kmYhYcNzqqf3Rl0IWC2Bwp693Ux7xsDZeY1xjGnPqDlL
	GG5LKV3qed+eoSXYAldoJwLv2FydQrhgEL+GKgr+apERGZwZoq9OVY0uNk+NQMFOkgo7MHEgp7xJH
	lMu606NO1JNEzZnFz8OuNkBCad105nosSJ2WuwBKtzgJqvhKPUjgMoNZDF9dCWH1HhpXWk7lOBd6O
	Q+KCzhOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuMM3-0008SF-Ix; Tue, 29 Dec 2020 21:16:31 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuMM1-0008Rc-Kw
 for linux-mediatek@lists.infradead.org; Tue, 29 Dec 2020 21:16:30 +0000
Received: by mail-qt1-x834.google.com with SMTP id z3so9774456qtw.9
 for <linux-mediatek@lists.infradead.org>; Tue, 29 Dec 2020 13:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e5c5L6PkkRukqnqeirSiRa0wobmulUeCxBAdDa7q5Wo=;
 b=LBdtKJhZaU2qug8bi0oFTpSYo1HQ1o+LWSO4EH6JqS0CUojDNPaxArNMKzmAvKG1QV
 xTH8T0iAeZ6VNgO1+Nb03Qy9FRjnXiCpb0zRo7jmwbtncZedDuM/WLY1L51m8cc9Bqym
 xoFCi8UpXrDSH+BXcfyU9vrj++WU4BuP4NIXnA9pksYbHlotLtetUpkImMPquuoXnj3H
 F7wx0n15Q2mm7na2izyy98jq0aDd/z3/TAxKHwzYIuTrEeluSLvL45J4UHffgOYbPhp1
 KjtveWHrpl/a70y22HNIKbMkxGdurizftBVc5V9OGn7HJ2zThfzmX6s8/dQ3uFslF4kb
 r+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e5c5L6PkkRukqnqeirSiRa0wobmulUeCxBAdDa7q5Wo=;
 b=XrVN46a+gmTSiaNNA43eek+3qMIKzf6e7GN9b4MRtrDMqnTwum4f9duW7QM9SZMDYu
 Vq1ZcqJ7BrKr1rd9PgppB4JoVqUHS11uzdRNZ92y+ukq6vkex34jvUh2xioXhnFj4Q/M
 qm/GXob6eu472J8QbvwMZXHeT8HNMj5l8vM1GL6xQ+SMW6SNGVqTaCaMM33y1FLyAwvS
 YEcuFJBJkRGNGA0iONBTNseopkHODKXJAYrarcy2AFrNeYfaUnYSCQzFALZ+4xvpSXMg
 55dcBS4GZ9MD5TC/waZCrSDpFzP77tRp2JnoXRLyqApGoUQGCFPUxJCAx8lR1p+QQfWq
 mHGA==
X-Gm-Message-State: AOAM530yvMOg79OzY7wkfml6aYOsertX9S+MKkQ0p2YIu5RMovInH5Ih
 Qsf0M6N1ThVotfThtI4FxMg=
X-Google-Smtp-Source: ABdhPJxykmySgmkP73cl/xMh/k7U71ysJZwMD04YDaZs3K5u4rIQSefyX4MBBc4sjEUyhHi9+/ANtA==
X-Received: by 2002:ac8:5786:: with SMTP id v6mr51450739qta.268.1609276585265; 
 Tue, 29 Dec 2020 13:16:25 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:45f1:1d00::1])
 by smtp.gmail.com with ESMTPSA id l11sm26656665qtn.83.2020.12.29.13.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Dec 2020 13:16:24 -0800 (PST)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>
Subject: [PATCH] mt76: Fix queue ID variable types after mcu queue split
Date: Tue, 29 Dec 2020 14:15:48 -0700
Message-Id: <20201229211548.1348077-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201229_161629_705363_FFB868DB 
X-CRM114-Status: GOOD (  16.33  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, linux-mediatek@lists.infradead.org,
 Nathan Chancellor <natechancellor@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Clang warns in both mt7615 and mt7915:

drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:271:9: warning: implicit
conversion from enumeration type 'enum mt76_mcuq_id' to different
enumeration type 'enum mt76_txq_id' [-Wenum-conversion]
                txq = MT_MCUQ_FWDL;
                    ~ ^~~~~~~~~~~~
drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:278:9: warning: implicit
conversion from enumeration type 'enum mt76_mcuq_id' to different
enumeration type 'enum mt76_txq_id' [-Wenum-conversion]
                txq = MT_MCUQ_WA;
                    ~ ^~~~~~~~~~
drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:282:9: warning: implicit
conversion from enumeration type 'enum mt76_mcuq_id' to different
enumeration type 'enum mt76_txq_id' [-Wenum-conversion]
                txq = MT_MCUQ_WM;
                    ~ ^~~~~~~~~~
3 warnings generated.

drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:238:9: warning: implicit
conversion from enumeration type 'enum mt76_mcuq_id' to different
enumeration type 'enum mt76_txq_id' [-Wenum-conversion]
                qid = MT_MCUQ_WM;
                    ~ ^~~~~~~~~~
drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:240:9: warning: implicit
conversion from enumeration type 'enum mt76_mcuq_id' to different
enumeration type 'enum mt76_txq_id' [-Wenum-conversion]
                qid = MT_MCUQ_FWDL;
                    ~ ^~~~~~~~~~~~
2 warnings generated.

Use the proper type for the queue ID variables to fix these warnings.
Additionally, rename the txq variable in mt7915_mcu_send_message to be
more neutral like mt7615_mcu_send_message.

Fixes: e637763b606b ("mt76: move mcu queues to mt76_dev q_mcu array")
Link: https://github.com/ClangBuiltLinux/linux/issues/1229
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index a44b7766dec6..c13547841a4e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -231,7 +231,7 @@ mt7615_mcu_send_message(struct mt76_dev *mdev, struct sk_buff *skb,
 			int cmd, int *seq)
 {
 	struct mt7615_dev *dev = container_of(mdev, struct mt7615_dev, mt76);
-	enum mt76_txq_id qid;
+	enum mt76_mcuq_id qid;
 
 	mt7615_mcu_fill_msg(dev, skb, cmd, seq);
 	if (test_bit(MT76_STATE_MCU_RUNNING, &dev->mphy.state))
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 5fdd1a6d32ee..e211a2bd4d3c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -256,7 +256,7 @@ mt7915_mcu_send_message(struct mt76_dev *mdev, struct sk_buff *skb,
 	struct mt7915_dev *dev = container_of(mdev, struct mt7915_dev, mt76);
 	struct mt7915_mcu_txd *mcu_txd;
 	u8 seq, pkt_fmt, qidx;
-	enum mt76_txq_id txq;
+	enum mt76_mcuq_id qid;
 	__le32 *txd;
 	u32 val;
 
@@ -268,18 +268,18 @@ mt7915_mcu_send_message(struct mt76_dev *mdev, struct sk_buff *skb,
 		seq = ++dev->mt76.mcu.msg_seq & 0xf;
 
 	if (cmd == -MCU_CMD_FW_SCATTER) {
-		txq = MT_MCUQ_FWDL;
+		qid = MT_MCUQ_FWDL;
 		goto exit;
 	}
 
 	mcu_txd = (struct mt7915_mcu_txd *)skb_push(skb, sizeof(*mcu_txd));
 
 	if (test_bit(MT76_STATE_MCU_RUNNING, &dev->mphy.state)) {
-		txq = MT_MCUQ_WA;
+		qid = MT_MCUQ_WA;
 		qidx = MT_TX_MCU_PORT_RX_Q0;
 		pkt_fmt = MT_TX_TYPE_CMD;
 	} else {
-		txq = MT_MCUQ_WM;
+		qid = MT_MCUQ_WM;
 		qidx = MT_TX_MCU_PORT_RX_Q0;
 		pkt_fmt = MT_TX_TYPE_CMD;
 	}
@@ -326,7 +326,7 @@ mt7915_mcu_send_message(struct mt76_dev *mdev, struct sk_buff *skb,
 	if (wait_seq)
 		*wait_seq = seq;
 
-	return mt76_tx_queue_skb_raw(dev, mdev->q_mcu[txq], skb, 0);
+	return mt76_tx_queue_skb_raw(dev, mdev->q_mcu[qid], skb, 0);
 }
 
 static void

base-commit: 5c8fe583cce542aa0b84adc939ce85293de36e5e
-- 
2.30.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
