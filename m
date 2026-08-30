Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C265FC61DE2
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Aug 2026 07:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cAJxRQQXvVgRQc+qrTy5F1Tifzrj9A/VOza63N0XwI4=; b=Qz6tAHP4aD8Gv7jTejCwZNQz7E
	9cQRaP1ZmrmVreOV64xTKNzp7MvEZZzCjTAhRf6WnRiibEu+b9retJ2hOSKVn5TdkdZEvAPxYk5Wh
	d3fQVc6u0ya8V8HbOBcH//nQGpA0Ukr+DHemD1/NN4Bve4224nSPPLs8p25JSed4YdHs3t49YvZVg
	vTtqrcD6lqtboBV3NMUtrcGVhh09CQfTWBu41QKUFIiAPThSKdTfBHicavKf9rZCEsADM79auUNFx
	tVV8PWrMrbqgrMRf8NIJCSLFWEz/7rEY/OkaDcxVj3dal9hZMFBGgVO+fniMHJac3zRKg/EKGkMlu
	RDZtTzPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0aQh-00000007Z2I-320d;
	Sun, 30 Aug 2026 07:58:15 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0aQf-00000007Yzk-0phJ
	for linux-mediatek@lists.infradead.org;
	Sun, 30 Aug 2026 07:58:14 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso4391085e9.3
        for <linux-mediatek@lists.infradead.org>; Sun, 30 Aug 2026 00:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788076691; x=1788681491; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cAJxRQQXvVgRQc+qrTy5F1Tifzrj9A/VOza63N0XwI4=;
        b=olq4rqnmR6ZSQvoghrLutMzkcM0dYzjjCSeYnUr4O1wnqJX/5bb3G80DTYHgVJTTMe
         dCzgehBDXeYPzYZ6nS395Vvf2AysGSlYP78BIriL5XyjqTR6YXWB+ylDRW029cTMGUeS
         6PGHae90PzD8wwGeSHvMfXlBn86nYbGyqnnx1m5srKtE91J+DxGME7sRy7tobSd+kGp3
         67hJ7dabPxT4fCJKbTX9/CpnNe0XYm/DvEWJNueBIruKU8SH+kqR8Fo7loZCKK7wApW5
         MzQ1maD5g0bkM7fT/M9QOCXCQ9CnxvvKYqPG2ylcqh189oRyhuEdK61SjIHoi65FBMfp
         0cCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788076691; x=1788681491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cAJxRQQXvVgRQc+qrTy5F1Tifzrj9A/VOza63N0XwI4=;
        b=iq0ChcbHXl1Nhv88eqSeMaWoibfu47mYyqi6w4TnnffOpmzVoVCYm5f4sgs1B2S8CR
         h+jQ/jr+I2sX1rVSHCX+OQYpAQddXVNaCgoOOwfR/PzCzJoktukhPcTY2rRif+AeCR4O
         /IQda5koKHM4OKiDEXr131lfgiZwyFKxzv/y0fddWHWYYYhgkoI2CVHVJb2vsWe+tsvC
         b8Ix2LHAm2IED7Bm858EG/DWnP1gtKjcsMfvZHN5WWeL96majqgfS53RoNY57mksxOUB
         TYKeSNPto0JajNyjQtkZnZyfXLER3qtuSfbWoGPAQmWlWc0t8avgyLFfFTcst76zuQNw
         ZvOQ==
X-Forwarded-Encrypted: i=1; AHgh+RrMz10prM2SZZrWD4tHnkX08cUZcyiX1ECwTO8ffUa4GDBE/JnOMlPU+scgyrxnO/NV+SkUaXCdFWz//k63og==@lists.infradead.org
X-Gm-Message-State: AFuF++kByjEZxRxm19x6yyyxSsO6kuGWYyZPJMEPYV1u8L/kvSTtndtY
	CPY5wBj9XT6DxEuGfaBHiHUDCGU0SZs4Ril9UKDq15+7TjHOaQT382M=
X-Gm-Gg: AR+sD11gOmz5Q6+/yHA47pOTSLQhQxuokTTyQwzwpZNXQY+Qd6e0ZeSWJp469MxgEXB
	PAUlCHtd2m0vhxaTzK8dYP4HO8kk+K9k4XRPrE2GPZvT7X7Iw04pnd4gQhF2Vsn5c1mL9voZ+ty
	lJZLWT7hK48B9cSLzEeZiSyFD9b4Y/do5bIQzE6lxKTsk73uArQuDQe/MW7VKeblZ+EGOZ+Bn2P
	GIH99ZAPaUAoXdhzCgBL/2mQE+k4fsgCjFfuXdR/peHNslhP0R1VdItbqMEFJUcJ8tHuCG32Dhy
	voVvmhQmU2bn31nUPKxtcm71rw6dYSmj5RfWrjVnnQe2zyvXUeNKhJZdLj76uMu2f6BFKP+iKh0
	/Nv+U0iHysZnDQTjbvkgue1YQ5e+9Kx85bKAIEAsWFXZozVLRZgS81pBbRvZEVM8iYcWIsjRMN3
	hg7Y7HVcnE6u4j/TDseJyGHB0AAJ/PvDcySlMKupg3ALdpLA945Ck=
X-Received: by 2002:a05:600c:3546:b0:499:dbc0:370d with SMTP id 5b1f17b1804b1-49b91c1dad9mr266282045e9.2.1788076691084;
        Sun, 30 Aug 2026 00:58:11 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd53a4678sm14757875e9.13.2026.08.30.00.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 00:58:10 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: [PATCH net-next 3/4] net: airoha: add rx_stall_recover ethtool counter
Date: Sun, 30 Aug 2026 10:57:16 +0100
Message-ID: <20260830095717.37218-4-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830095717.37218-1-sochnev.v.74@gmail.com>
References: <20260830095717.37218-1-sochnev.v.74@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_005813_273665_55946DFB 
X-CRM114-Status: GOOD (  15.24  )
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

Make the RX-ring hw-stall recovery added by the previous commit
observable without grepping dmesg for its dev_warn_ratelimited():
add a custom ethtool -S statistic, rx_stall_recover, incremented once
per completed recovery.

It's tracked per-QDMA-instance rather than per-netdev, since the
stalled ring can carry traffic for more than one netdev at once (VIP
classification shares ring 4 across several protocols/ports on this
hardware) - there's no single netdev to attribute an individual event
to, so all netdevs behind the same QDMA instance report the same
aggregate count.

Kept separate from the actual recovery fix since this adds new
ethtool ABI and has no bearing on correctness; happy to have it queued
independently if that's preferred.

Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 44 ++++++++++++++++++++++++
 drivers/net/ethernet/airoha/airoha_eth.h |  5 +++
 2 files changed, 49 insertions(+)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index b53fe5b17653..efb1dd69cc16 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1000,6 +1000,7 @@ static void airoha_qdma_rx_recover_work(struct work_struct *work)
 		napi_enable(&q->napi);
 		napi_schedule(&q->napi);
 
+		qdma->rx_recover_count++;
 		dev_warn_ratelimited(qdma->eth->dev,
 				     "qid=%d RX ring recovered after hw stall (RX DMA paused for %lld us on this QDMA instance)\n",
 				     qid, rx_dma_off_us);
@@ -2600,6 +2601,46 @@ static void airoha_ethtool_get_drvinfo(struct net_device *netdev,
 	strscpy(info->bus_info, dev_name(eth->dev), sizeof(info->bus_info));
 }
 
+static const char airoha_ethtool_stats_str[][ETH_GSTRING_LEN] = {
+	"rx_stall_recover",
+};
+
+static void airoha_ethtool_get_strings(struct net_device *netdev, u32 sset,
+				       u8 *data)
+{
+	int i;
+
+	if (sset != ETH_SS_STATS)
+		return;
+
+	for (i = 0; i < ARRAY_SIZE(airoha_ethtool_stats_str); i++)
+		ethtool_puts(&data, airoha_ethtool_stats_str[i]);
+}
+
+static int airoha_ethtool_get_sset_count(struct net_device *netdev, int sset)
+{
+	return sset == ETH_SS_STATS ?
+	       ARRAY_SIZE(airoha_ethtool_stats_str) : -EOPNOTSUPP;
+}
+
+static void airoha_ethtool_get_ethtool_stats(struct net_device *netdev,
+					     struct ethtool_stats *stats,
+					     u64 *data)
+{
+	struct airoha_gdm_dev *dev = netdev_priv(netdev);
+	struct airoha_qdma *qdma;
+
+	rcu_read_lock();
+	qdma = rcu_dereference(dev->qdma);
+	/* aggregate recovery count for the whole qdma instance: the
+	 * stalled ring can carry traffic for more than one netdev (VIP
+	 * classification shares ring 4 across several protocols/ports),
+	 * so there's no single netdev to attribute an individual event to
+	 */
+	data[0] = qdma ? qdma->rx_recover_count : 0;
+	rcu_read_unlock();
+}
+
 static void airoha_ethtool_get_mac_stats(struct net_device *netdev,
 					 struct ethtool_eth_mac_stats *stats)
 {
@@ -3502,6 +3543,9 @@ static const struct net_device_ops airoha_netdev_ops = {
 
 static const struct ethtool_ops airoha_ethtool_ops = {
 	.get_drvinfo		= airoha_ethtool_get_drvinfo,
+	.get_strings		= airoha_ethtool_get_strings,
+	.get_sset_count		= airoha_ethtool_get_sset_count,
+	.get_ethtool_stats	= airoha_ethtool_get_ethtool_stats,
 	.get_eth_mac_stats      = airoha_ethtool_get_mac_stats,
 	.get_rmon_stats		= airoha_ethtool_get_rmon_stats,
 	.get_link_ksettings	= phy_ethtool_get_link_ksettings,
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 483d6b59c351..d6591a779743 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -582,6 +582,11 @@ struct airoha_qdma {
 	 */
 	struct work_struct rx_recover_work;
 	DECLARE_BITMAP(rx_recover_mask, AIROHA_NUM_RX_RING);
+	/* count of completed hw-stall recoveries, exposed via ethtool -S
+	 * so a recovery event (and the packets it drops) is observable
+	 * without grepping dmesg for the dev_warn_ratelimited() above
+	 */
+	u32 rx_recover_count;
 
 	DECLARE_BITMAP(qos_channel_map, AIROHA_NUM_QOS_CHANNELS);
 };
-- 
2.55.0


