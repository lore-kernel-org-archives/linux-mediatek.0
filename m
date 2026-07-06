Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CD7C43458
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2026 06:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K+iH0oScX6vUoO3wK//wIGjcdPMvMKHF3g6QanG2LHo=; b=sTCLG7JlpAzB2zFhAzoB2eFzBh
	1QXD5gIkxSxxc8w9MXw8yLzPBD0C/Gwulns5CGF8BTV+R/NmA2WTrcLnmqJ+rXDl+7Jh6ja/eYKYX
	n18kRwqSrr8K6wGBqJK9tfqyBTwogthNrTXMU2wxLaBElPDHRxHuhYac/dGOpoORTInJQ13on9Dnn
	Fu/bhLkiOuCd8Jky8leTUL94afMJpNFtUBNHTw2qui8xnM9wgJk5Kiufql9/1VnisrDU4nuajVHyd
	mSZVWdKe5p+kK7m3iyHf4Znj+PogrJmXCzYtUHdCkvlYYgAQskHEaBcjNA8vp+eXx5k+sdhkK2RHg
	jMuVwpQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdFZ-0000000Bfeu-34B4;
	Mon, 06 Jul 2026 06:56:17 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdFU-0000000BfdI-13Kg
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Jul 2026 06:56:16 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-847e6f03df8so3285262b3a.0
        for <linux-mediatek@lists.infradead.org>; Sun, 05 Jul 2026 23:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783320971; x=1783925771; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K+iH0oScX6vUoO3wK//wIGjcdPMvMKHF3g6QanG2LHo=;
        b=UMnIHIaw/j0yEqcU7m4EMrXhV3bmjGLtrAUtCpc3tAe79M7PgKt4zE1Al9T+kKh7Dl
         j7i/JXpRsM5v4wbICl51VP9EWddk2+TW+jLQAWCULsItJP8K7y+CqjB1wIbi5XNmGWJg
         DeRR0BmPtvLCmaNpjDQy0NEMIMov8OfQHpIFV3dA6hWIX9HCzCgqEieaCdZBvJ+QRNwu
         PLtDBs57rxhUTyfGJcZjTc+Dn9M/VVyiqwLJ5kw2evlq3cQn5IPc7EzDfqZRM3JIz2xF
         Qi/BRX4k/Y+kA8kYgHjVqMZ89Jakhr97GW685x9ixL2EIInqwVHMrf2atOsBK81jqco6
         c4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783320971; x=1783925771;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K+iH0oScX6vUoO3wK//wIGjcdPMvMKHF3g6QanG2LHo=;
        b=FiV2rFeIjuxdFbodTeLRJv2NZGDhJUxFfpkRNiR1TgxdnCf9EKF4qx6sN9cpNb0dX4
         Fo9cAsbDPPvBXj1ldG4YCOLp/ZY73uzOFti3caaqCE2+30lgd8IBofTlQYIms4tBdIrS
         hyJ7R8qsrzS+5SSNLbB34d07uarxk7XKX/5xZ05z93aEmxJG1BioH9uN/GWAKSFxMrsC
         4934irU7ck4biIvDEPpMbFLdU62L9JL1vU0bg4LTG6G3qurjZ1eSBPbpjprY+XRYi3yo
         YiVbOOLMk7Gd5H3d+xkKkkU1fZwA4eyVVW138U9d0w4ZQfzKpr6qDXb00GJclFSxV95f
         eYXQ==
X-Forwarded-Encrypted: i=1; AHgh+RonN15zj7bbicfEZS/g25u8OzafqpRfy7LfAeqsrRP2LBWyiX2MY/Flfq7nI6ay3hNk/AkLYWWWo5u+22hGHw==@lists.infradead.org
X-Gm-Message-State: AOJu0YweHanZy10LYQkkjOWFJd6edbMBUPg6yuhj8moC9R2eRznjOTxo
	LxQ8blpz8/w0Avt7ll/8ocXtoBD5rBA1kTio53fRch0Za1Hra7F+PCSt
X-Gm-Gg: AfdE7cnMlu5l0ayc3TTFyIFGIYb6bauZVEvAl/0r/OCKZ9j4Mhpwka8NWKg1s70+YLz
	+O00xuerDhmu0Pjb3ovarvL01yc5LPpjjnxmf90YHMoOw3ReMooZp2/gIEapsSVMFx07hUSPSCP
	TT0fdzeG7GjX06q5+LV97HF1vQcRKBw1be3LsbayFNJUPrpr51vfZ/mOPxRXezTSpmyo5ikisBT
	t0iHgicutmReMlc1MLnyMN2/9b57K+qwqXEQjVD2GdMVZAiFFRfZujeMKsdvtwZ4r7W04U+uC5X
	L3fl46nvhS7MoNNLvOhwLdEu2vCVTS4wYs3NYNQAc6XIP8QRQmvHvOyAie7vzixsJEWv0nZ5o7x
	ojr9Sin2N9tCdM5ub1F751kJn+hguaFVJ8MnhdSoFEsiI56Mqi8q1dfi44o70QYlAW9K+AZzWuh
	vpdX7LWA==
X-Received: by 2002:a05:6a00:4612:b0:847:84a2:cda7 with SMTP id d2e1a72fcca58-847f6d5a847mr9033848b3a.12.1783320970734;
        Sun, 05 Jul 2026 23:56:10 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d7a915sm3181753b3a.44.2026.07.05.23.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 23:56:10 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH net] net: airoha: fix HTB class modification offload
Date: Mon, 6 Jul 2026 14:18:58 +0800
Message-ID: <178332096675.2250671.599544331813347302@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_235612_285709_87C1DAD2 
X-CRM114-Status: GOOD (  11.59  )
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

HTB core does not populate parent_classid for TC_HTB_NODE_MODIFY.
Airoha currently checks parent_classid against TC_HTB_CLASSID_ROOT
in a helper shared by both TC_HTB_LEAF_ALLOC_QUEUE and
TC_HTB_NODE_MODIFY. Since the modify path leaves parent_classid as
zero, the check always fails and changing parameters of an already
offloaded HTB class is rejected with -EINVAL.

Move the root-parent check into the allocation path and validate
modify requests using the per-netdev QoS channel bitmap, consistent
with the delete and query paths.

Fixes: ef1ca9271313 ("net: airoha: Add sched HTB offload support")
Signed-off-by: Wayen Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 32 +++++++++++++++++-------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 59001fd4b6f7..8e4e79c1e4c2 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2766,18 +2766,13 @@ static int airoha_qdma_set_tx_rate_limit(struct net_device *netdev,
 	return 0;
 }
 
-static int airoha_tc_htb_modify_queue(struct net_device *dev,
-				      struct tc_htb_qopt_offload *opt)
+static int airoha_tc_htb_set_rate(struct net_device *dev,
+				  struct tc_htb_qopt_offload *opt,
+				  u32 channel)
 {
-	u32 channel = TC_H_MIN(opt->classid) % AIROHA_NUM_QOS_CHANNELS;
 	u32 rate = div_u64(opt->rate, 1000) << 3; /* kbps */
 	int err;
 
-	if (opt->parent_classid != TC_HTB_CLASSID_ROOT) {
-		NL_SET_ERR_MSG_MOD(opt->extack, "invalid parent classid");
-		return -EINVAL;
-	}
-
 	err = airoha_qdma_set_tx_rate_limit(dev, channel, rate, opt->quantum);
 	if (err)
 		NL_SET_ERR_MSG_MOD(opt->extack,
@@ -2786,6 +2781,20 @@ static int airoha_tc_htb_modify_queue(struct net_device *dev,
 	return err;
 }
 
+static int airoha_tc_htb_modify_queue(struct net_device *netdev,
+				      struct tc_htb_qopt_offload *opt)
+{
+	u32 channel = TC_H_MIN(opt->classid) % AIROHA_NUM_QOS_CHANNELS;
+	struct airoha_gdm_dev *dev = netdev_priv(netdev);
+
+	if (!test_bit(channel, dev->qos_sq_bmap)) {
+		NL_SET_ERR_MSG_MOD(opt->extack, "invalid queue id");
+		return -EINVAL;
+	}
+
+	return airoha_tc_htb_set_rate(netdev, opt, channel);
+}
+
 static int airoha_tc_htb_alloc_leaf_queue(struct net_device *netdev,
 					  struct tc_htb_qopt_offload *opt)
 {
@@ -2794,6 +2803,11 @@ static int airoha_tc_htb_alloc_leaf_queue(struct net_device *netdev,
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
 	struct airoha_qdma *qdma = dev->qdma;
 
+	if (opt->parent_classid != TC_HTB_CLASSID_ROOT) {
+		NL_SET_ERR_MSG_MOD(opt->extack, "invalid parent classid");
+		return -EINVAL;
+	}
+
 	/* Here we need to check the requested QDMA channel is not already
 	 * in use by another net_device running on the same QDMA block.
 	 */
@@ -2803,7 +2817,7 @@ static int airoha_tc_htb_alloc_leaf_queue(struct net_device *netdev,
 		return -EBUSY;
 	}
 
-	err = airoha_tc_htb_modify_queue(netdev, opt);
+	err = airoha_tc_htb_set_rate(netdev, opt, channel);
 	if (err)
 		goto error;
 
-- 
2.51.0



