Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A01EC53219
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2026 17:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O4KRrR5InAG6qbH+2o0ICn/FfbIaKM6RpEitfK9J2zk=; b=FD53zCrLWcCY9UsCXw/54Ksqmo
	5G45A/UNR+XvwUsI3qjcvMtkP6KbyOCDWK8sCAmK6wyJjjJ6Pkt96MZWq86oCMAH6d5IoRBUfOwhB
	l5YG5xHvvddHDVMXogdJrFGO891gYweHQ4RF6OvFe1mfJ2lIpy1mAOPcAnB6Sw6cNSTHE3/Na+AZN
	83n5lmxW9VE0fNvOiLiW/qYuS+LL0M/ZHJN0qEXFYjPbuztxWLzXWMqD9vvgKmX0POMfaoJd7jad8
	20sWwHpNa4kfjiKWrGEH4dyTN3BPq499VGGxY5DggOVzDK0JKU8AYWBo6TuhhRUwgJ9q7lCBieiXu
	4NxGtSvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8DG-00000008ihu-0Wpr;
	Wed, 29 Jul 2026 17:37:02 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8D7-00000008ieH-1yyU
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Jul 2026 17:36:55 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cca0c5799eso13112545ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Jul 2026 10:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785346612; x=1785951412; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O4KRrR5InAG6qbH+2o0ICn/FfbIaKM6RpEitfK9J2zk=;
        b=TG4EZtyTF3SDmoQ1gO1DuzLzGHsmVkRMdzmpXzBl88g81zCL2D0CIxAXfsU5UpSizQ
         C6Zn0q02xraBLPuDjW27xVMiDcgxGBcgvmggQRV87V90hSx5TS+4CEtoXYU87kvSu8CW
         +6Yv832PL0689DQDn5dV7HzbZrtZxT7vqaswmVO7S6Dvn8At3hFuY77kRs88whfqkHgN
         E7rGqcQHpVVghAzboNdxS/30nGsyzJ0jVdsu+iSijoiwCRy7AVplyrlyZWPIf7vnihlY
         w3FqUKsew+80z9M4qXSLuAwz0IbTxWhcBnYzfPgRmc8dXQmyIRbzRnZDBpiPJg49qV5f
         wd0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785346612; x=1785951412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O4KRrR5InAG6qbH+2o0ICn/FfbIaKM6RpEitfK9J2zk=;
        b=m+KedwukN/0vVlkdvsTGaSQyVblxweitr5RTUpzu9P+t8BBhmWvbMoP72aWVlhGBxB
         CcO/IRKm8EoOQEIGZ7+O6tmmoKWpI8Hvr5UUniVCainK7tgwf9YZNsOyS6UnZvcpd2BN
         b3AS8ywRK0JidtExqyvPh331F91KGK6Ir0vdf6uuqHD47T3BtbCpw7s1DtCfv9KL/KD4
         Mzd9UeOpBWiPgh3FJr0RofX73JP8a+W8Wq+qNFLXWECRZMLiWJzItCRdETmxz9hq57LV
         TSf9+olYORl281+j7ezk41NxYF0Zsf1VE4mjYGaCpzzUmKkizcshIdU9pJehIWh5h4Qy
         Ekog==
X-Forwarded-Encrypted: i=1; AHgh+Rp+NrXdQqANQ4zqwtDvsLO1cq2gzT7kWu+W+gR3QH7fJaL24uvdQ2anMENtUqEDBSPb0gc3UH07vcAvQQ39Wg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUQHso0vewk7W/kLZOYSBs5ToOzcjveXept92MwW924P0LPkUD
	t1DINDA9CAgC2ViIP23D5k0ZhTd6IO878jQsfKJxyokNFgihONMWA12d
X-Gm-Gg: AR+sD11P5D/b4k4hzo0KJFno2igmO6dLOEW4N62VOUKW/MyNDhOIvRYrRCrPg0DtR6z
	QIRlP8rqBDgNQnssttDZcGC4Hk5ho96N6eDkO7isvuaVR5UCyPM6v6WOJo3ZrFpzpMPOjtq1fwx
	fhUUYYMsXXIqVW4Ixnx2E10Z2ZRJ+9Kt4uoAliLnNGRNCKEhpHVwcluHPOHZrZ1TsjKVlCkKi36
	FixmtBCzvabeBfO/naBWYduMX/Y3k2T5EMxnGsSPb29hUY1lb6rv5WgZpcb+7qe+oosUa/8BGL3
	Pfw1BGt2F8VWhUXXkKFdDL8ffHNjjUYNWMxFyI+WGs0ep6o4oKjyFZkow9jDxVW1zEmQh9wUtfl
	v5Fee+EwuA/TdUjjDUxYglGcYVsXZnEhE0yaV9nUsZm9bHh4ern25081RAFU+HzQitFtpfYQhM7
	7tN6ZtUovP9T7xGwLx93GWWmY95dti3O99rvfRX3yl2S9pfWzzE9dqk1xWLyxdwPk474c8EZ8YW
	JbUObSTdol9Cdse3aFEIgejUR/Oy/lj1Jts2g==
X-Received: by 2002:a17:902:d2c9:b0:2ca:cde5:29c4 with SMTP id d9443c01a7336-2d015db90afmr81414495ad.47.1785346612435;
        Wed, 29 Jul 2026 10:36:52 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([120.234.91.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bf39cdsm14806045ad.55.2026.07.29.10.36.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 29 Jul 2026 10:36:52 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rex Lu <rex.lu@mediatek.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	Chad Monroe <chad@monroe.io>,
	Howard Hsu <howard-yh.hsu@mediatek.com>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>,
	MeiChia Chiu <meichia.chiu@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH 2/2] wifi: mt76: mt7996: unlink TWT flow on MCU add failure
Date: Thu, 30 Jul 2026 01:36:32 +0800
Message-ID: <20260729173632.14387-3-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260729173632.14387-1-enderaoelyther@gmail.com>
References: <20260729173632.14387-1-enderaoelyther@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_103653_518151_48E48279 
X-CRM114-Status: GOOD (  12.71  )
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

mt7996_mac_add_twt_setup() links a new flow into dev->twt_list before
asking the MCU to add the agreement, but exits without unlinking the flow
if the request fails. The flow-ID and table masks are only committed
after MCU success, so the still-linked flow is invisible to the
mask-gated teardown paths.

If the station retries the setup, the same slot is cleared and its
embedded list node reinitialized while it is still linked, corrupting
dev->twt_list and potentially preventing a scheduling walk from
terminating. If the station disassociates instead, teardown skips the
flow and station storage can be freed while the node remains linked. A
later scheduling or debugfs twt_stats walk can then dereference the
freed flow, resulting in a use-after-free.

Unlink the flow with list_del_init() on the MCU ADD failure path. This
restores the list to its pre-request state and leaves the node safe for a
retry. Mask and agreement accounting remain untouched because none of
it was committed before the failure.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Assisted-by: Codex:gpt-5.6-sol
Assisted-by: Kimi:K3
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 0eebc8182ca9..445bd7d63cc8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -3207,8 +3207,10 @@ void mt7996_mac_add_twt_setup(struct ieee80211_hw *hw,
 	flow->tsf = le64_to_cpu(twt_agrt->twt);
 
 	if (mt7996_mcu_twt_agrt_update(dev, &msta->vif->deflink, flow,
-				       MCU_TWT_AGRT_ADD))
+				       MCU_TWT_AGRT_ADD)) {
+		list_del_init(&flow->list);
 		goto unlock;
+	}
 
 	setup_cmd = TWT_SETUP_CMD_ACCEPT;
 	dev->twt.table_mask |= BIT(table_id);
-- 
2.50.1 (Apple Git-155)


