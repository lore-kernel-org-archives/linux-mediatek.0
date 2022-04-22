Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED804C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 07:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+uXTO4/YiDuWnGDVpqD5h7zNPdwkA1DCLj9CZplarFs=; b=hprUOGcNyx4c/Z
	FLVdWKTG1sIbvuHFAzGtIOP98RQfBju3O4nUvD9/Yx91AmYpdEUZ2PJs1r4k/16rIq/D9XWbt7jYL
	gzk9gzY1NW0gQboaH/rYKoIsdWiJZR77lLfQN1ZrWUID4kAJj0E+F5EMkBz6vcT6oGTVekgDVolWb
	AKXdeBw65l0VYYujvpIbnUS8v2ReyVBGmiMYohNZWitrpKowTntGRT4/6wQpbR8Bx1dPJO6PdriW4
	WjQ66VLYO9laNEQEgE3AH7tUnFP63R0zEZR5eog1wS/zcgYoutYFQoeY7wJiUsemJMvym6tzRtATv
	aRgQsx5doQH14b79++sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhnyG-00GwPg-DT; Fri, 22 Apr 2022 07:44:52 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhnkz-00GpV8-63; Fri, 22 Apr 2022 07:31:10 +0000
Received: by mail-pl1-x62a.google.com with SMTP id b7so9046348plh.2;
 Fri, 22 Apr 2022 00:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RKXep+OukE4SdMu+cRqxBY4lHOeFUaKFcve1sEKphTA=;
 b=NApdQprPkR9X5KsKrlEItbVibHuWQMkdC6R6dIz1a0f8v08lro3Bt24bmFnX9gcIUx
 c/CvMMP1C6TE4xFIq4EpE5DIOaTjyjH6xH5joQX9P6/5DJZ+IbV+IvM0ol6mB2xYZlhG
 ZTyVvc5ig+But+NxDHgUFqIMABOyzzpBRgumMgBNEQCyAcFoDVvB5Y3PX8Ksc90G1FVm
 Pt8yRgXMrkTN4XFq3qouYGABgtD26N572duYyZbbeU6OL3GSkiuET0oTQYqIl9l3ZWEt
 FBd2MdLEjvpOMkA7XjU06fb3qigQP1aSyhn1W/PkkQe0fsN1gQRQkuCWl/iTdyYTVmxE
 x1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RKXep+OukE4SdMu+cRqxBY4lHOeFUaKFcve1sEKphTA=;
 b=QMkJu3e9mjeZPvevoiEH0CILVrNyEhel5VEz7WOot/SoKzRk435RjPS8U6jq6rHuKU
 Jnh4HEQswocR9VLyQBgcsoufDUe12HwPkzI8wa3O4GgAJgvxnRJkOpSSMZ9f3mufNfGS
 MaTxBLSFxLiB88opmfn5Rt1dRI2tzD/PqwiCKEy/WfH9Nh8I4KxgPLO6/FLXfpSpay+p
 feyyqZTj76SH5hGU3SMEsCcTllsMIo6Gv/KsGi8S+WU0aeOHJG7VRbsk6ZUvMbVESJ7M
 gmwBNBKJ2JP6vzQnRsKvzPbcEjznSnxI4GCWKtJB6Ex5+bdObuyFxcyjFOAB2ZciC2le
 cGrw==
X-Gm-Message-State: AOAM533YpHquK8QesoKxK3t/sgfTeKTvW3CsLx+Ae/kfbSRduOJZH0dC
 GWCGbdQx1eVkQqPGo0gRVxA=
X-Google-Smtp-Source: ABdhPJwiJ6sRVKvla0sQE/4lcm4QNy8KLY5artA5wt36MqIypf9P32Jf5A47gdWp+q1ok87ey6bU9w==
X-Received: by 2002:a17:902:d50c:b0:159:3fa:266 with SMTP id
 b12-20020a170902d50c00b0015903fa0266mr3311422plg.132.1650612666216; 
 Fri, 22 Apr 2022 00:31:06 -0700 (PDT)
Received: from localhost ([58.251.76.82]) by smtp.gmail.com with ESMTPSA id
 l25-20020a635719000000b0039da6cdf82dsm1287484pgb.83.2022.04.22.00.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 00:31:05 -0700 (PDT)
From: Yunbo Yu <yuyunbo519@gmail.com>
To: nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com,
 shayne.chen@mediatek.com, sean.wang@mediatek.com, kvalo@kernel.org,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, yuyunbo519@gmail.com
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] mt76:mt7603: move spin_lock_bh() to spin_lock()
Date: Fri, 22 Apr 2022 15:31:02 +0800
Message-Id: <20220422073102.426739-1-yuyunbo519@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_003109_345845_F83CF4E6 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

It is unnecessary to call spin_lock_bh(), for you are already in a tasklet.

Signed-off-by: Yunbo Yu <yuyunbo519@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7603/beacon.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/beacon.c b/drivers/net/wireless/mediatek/mt76/mt7603/beacon.c
index 5d4522f440b7..b5e8308e0cc7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/beacon.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/beacon.c
@@ -82,12 +82,12 @@ void mt7603_pre_tbtt_tasklet(struct tasklet_struct *t)
 	__skb_queue_head_init(&data.q);
 
 	q = dev->mphy.q_tx[MT_TXQ_BEACON];
-	spin_lock_bh(&q->lock);
+	spin_lock(&q->lock);
 	ieee80211_iterate_active_interfaces_atomic(mt76_hw(dev),
 		IEEE80211_IFACE_ITER_RESUME_ALL,
 		mt7603_update_beacon_iter, dev);
 	mt76_queue_kick(dev, q);
-	spin_unlock_bh(&q->lock);
+	spin_unlock(&q->lock);
 
 	/* Flush all previous CAB queue packets */
 	mt76_wr(dev, MT_WF_ARB_CAB_FLUSH, GENMASK(30, 16) | BIT(0));
@@ -117,7 +117,7 @@ void mt7603_pre_tbtt_tasklet(struct tasklet_struct *t)
 		mt76_skb_set_moredata(data.tail[i], false);
 	}
 
-	spin_lock_bh(&q->lock);
+	spin_lock(&q->lock);
 	while ((skb = __skb_dequeue(&data.q)) != NULL) {
 		struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
 		struct ieee80211_vif *vif = info->control.vif;
@@ -126,7 +126,7 @@ void mt7603_pre_tbtt_tasklet(struct tasklet_struct *t)
 		mt76_tx_queue_skb(dev, q, skb, &mvif->sta.wcid, NULL);
 	}
 	mt76_queue_kick(dev, q);
-	spin_unlock_bh(&q->lock);
+	spin_unlock(&q->lock);
 
 	for (i = 0; i < ARRAY_SIZE(data.count); i++)
 		mt76_wr(dev, MT_WF_ARB_CAB_COUNT_B0_REG(i),
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
