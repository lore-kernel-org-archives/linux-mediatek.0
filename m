Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B96ECD6E55
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2026 10:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mWj9HVq5gBiKHnyrvip7gxwpROvspRY6Q5wfNRCKOgc=; b=XwTEOgDAl6hQqiVVHiJkxgTGfD
	zcMOqTkBcHUJMq6uyUfYFlp2Iq116EEtVNtXaH1TdnKeCO5DejQn8HWnrshwMh225tpq1aKMFVU9p
	ydSVstCI/LDNCQgwdtb6PEsOttAW8IG1v+LTwH+UqtDbSobxl9UcjIuHYzrP1aGrxtWpI2gTcVD1e
	OqfpC7dZLWVh3qnaqICW29vs7NbajV7E1g/CozBphr6/XjnD9EF3V5oixrppTT8fkWIhuJgzswI5G
	KvAJ05w1LJ0qtYYGmFIBBr7vNRESeY15tqJaM2Q8LVzARM5ziBCHdbYLx7NN6Mfaz4BesZEoSPuxQ
	/2TPDUaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUirr-0000000Eop3-1iVT;
	Wed, 03 Jun 2026 10:30:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUiro-0000000EooE-1rtL;
	Wed, 03 Jun 2026 10:30:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C1B17437AD;
	Wed,  3 Jun 2026 10:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B2F1F00893;
	Wed,  3 Jun 2026 10:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780482631;
	bh=mWj9HVq5gBiKHnyrvip7gxwpROvspRY6Q5wfNRCKOgc=;
	h=From:Date:Subject:To:Cc;
	b=Mc92wN7TYo0So44/VHoRjYGK/hlL+9mfKrxNyw6jQj0ppRxP9rwN7kagfRE4QcDOj
	 IaBnZBBjLowUFa66pVaT9Wsbanw5BBUK6FoN0uhQ4U+HTnGSQs09YZPUl0jXvYwM3f
	 4MRsarKQnSyoFwsd16LD8/JUi5iwYZhKiqJH8iE5c3Nx060wpix+IQjMSL1m6l8s0Z
	 kxS8JH3vHlIemn5HcSWIpwf9x/rAlaWKjCxTe2T0qjZScQk5nKghlZViTeKR4iAKEE
	 5yW9GbF4y/sc83zsTiLOfgBN5Qo7GzP/cIcMoX9DR7zVdFRdgK732Uf5UxjmCNMXjX
	 YbX//Ok4mt42Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 03 Jun 2026 12:30:01 +0200
Subject: [PATCH net-next] net: airoha: Report extack error to the user if
 airoha_tc_htb_modify_queue() fails
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-airoha_tc_htb_modify_queue-err-message-v1-1-33ec3ab997d9@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NQQ7CIBQFr9L8tSSIBhOvYgyh9CF/UdAPbWqa3
 l3ichYzs1OFMCrdh50EK1cuucP5NFBIPr+geOpMRhurrb4oz1KSdy241EY3l4nj130WLFAQUTN
 q9d2K8DfjownX0VKPvQWRt//oQRlNZWyNnsfxAxKvlPaCAAAA
X-Change-ID: 20260603-airoha_tc_htb_modify_queue-err-message-fea72af2c4b6
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_033032_510334_0C6A8DAC 
X-CRM114-Status: GOOD (  10.18  )
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

Report an extack error message in airoha_tc_htb_modify_queue routine if
airoha_qdma_set_tx_rate_limit() fails.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 6574901ebd19..d0d13f01e50f 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2605,13 +2605,19 @@ static int airoha_tc_htb_modify_queue(struct net_device *dev,
 {
 	u32 channel = TC_H_MIN(opt->classid) % AIROHA_NUM_QOS_CHANNELS;
 	u32 rate = div_u64(opt->rate, 1000) << 3; /* kbps */
+	int err;
 
 	if (opt->parent_classid != TC_HTB_CLASSID_ROOT) {
 		NL_SET_ERR_MSG_MOD(opt->extack, "invalid parent classid");
 		return -EINVAL;
 	}
 
-	return airoha_qdma_set_tx_rate_limit(dev, channel, rate, opt->quantum);
+	err = airoha_qdma_set_tx_rate_limit(dev, channel, rate, opt->quantum);
+	if (err)
+		NL_SET_ERR_MSG_MOD(opt->extack,
+				   "failed configuring htb offload");
+
+	return err;
 }
 
 static int airoha_tc_htb_alloc_leaf_queue(struct net_device *netdev,

---
base-commit: dfcc2ff12925d99e858eaf539eaa4aaaf81fe2a6
change-id: 20260603-airoha_tc_htb_modify_queue-err-message-fea72af2c4b6

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


