Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360BBC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Apr 2022 08:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+uXTO4/YiDuWnGDVpqD5h7zNPdwkA1DCLj9CZplarFs=; b=0G1tY1CAWgy0fm
	Wb+WU+NNeis3Ii4iGU5cAEn/6DPtSG2IN8rhFbzuGwXX9pvWAujZrWrxsHP9eZAhruHFqH8TD07i+
	F5ax61DlIhC8GmIK6rzhOKjKXeKZOM0Q1Li6uAIYVmPTJhsK2DJIWIILvLRYcy0QnUbWXHnLxo3Wd
	oi80atzXqh9lf+vioZypon39MPXOMIqMSyHqOtAiRLTbjdfxuq/PZdQBrL5kfw3NcXjtDrgksIEGY
	q1R6/E1mFODN9iJxSCjE3krrJT2MiBdNiEbrJqQ9aLIirB6/mf86KTK2NJ6D5EbcFjhMcepdOm95V
	CdeVwSDbZ+AKarS7nP5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngMbA-00FyYb-Mj; Mon, 18 Apr 2022 08:19:04 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngMay-00FyTx-Ed; Mon, 18 Apr 2022 08:18:54 +0000
Received: by mail-pg1-x52e.google.com with SMTP id h5so17609347pgc.7;
 Mon, 18 Apr 2022 01:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RKXep+OukE4SdMu+cRqxBY4lHOeFUaKFcve1sEKphTA=;
 b=GWCh7Axovc+n32OceNnsigXAf/o8hGt3MJRtpKvMZoGI9wr3zWxS6HY+G7ePpWxnuE
 K7rkGYJVcee7UIgwJ/up6hqHYVB3675nYqpKT31MZkmQZe1jr7HiQKoVslAEVN6Pazle
 NQPuPQGvEZktumhJJUFBce0Mwykn2Zs2Ee9JMk192atchDJBmtEAuGaaUFamJxSBCdHS
 PJ8adGyrcT4JvgqndH5IKFwkAqlVzusobcohzdv+8HwWSbPhCzBte4LPptJ8BDt5Bqir
 iHLhDGvS2+Csu5sdDcw8aPeyN8L5b+fGT529kNwQlMHsqJU0ORIJKQBTCUfVC0lofzkP
 rNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RKXep+OukE4SdMu+cRqxBY4lHOeFUaKFcve1sEKphTA=;
 b=A0Iky0iK0XYzkqOCLUPLnuY3AUo8LpegAWrtC5lR5RMVGsOkh9RZnZS4SB5ymg+oNr
 P6wGs6bov1LwwNjE55bm9nsGhPyzh5U82cDPDcPKgxlNvAhpnePMwftk0asl30og6tDM
 xyG80cxNp8ko6Esvi8oe0O8DNgm2ggEkCTYykBOZDranQFMRXwNlFfjSWhmz5xKD5Psw
 +5augVDNDZIBiIRSkHZkutL+awunxI3zQCQvnlPbm3CulrNI4RqaN5ah8GYPFZLKatn4
 VKtI2T9f2oboX02npEBQxTMDdoWjbUXRwt0a7LcFGELsfRs5T4QSaOaoShuxS1mRS4Tp
 jQyg==
X-Gm-Message-State: AOAM530Ehx7v8hoKEfNfzBcH8cKrNqXBD1zfP6s56u30TNprK/AOoLWP
 vHyra23IRkLedZ/LmgcM+uLXsO9vhD9lFZXe4p/ssQ==
X-Google-Smtp-Source: ABdhPJy5ecPy3tYjBbv8BqYjQDZ9JlHc+eZlWxXe+vT/jIZeYVzhGPIQlHzbHEFym/a3gTfYiMmGog==
X-Received: by 2002:a63:450d:0:b0:3a8:f2ed:1aa5 with SMTP id
 s13-20020a63450d000000b003a8f2ed1aa5mr6024926pga.367.1650269930978; 
 Mon, 18 Apr 2022 01:18:50 -0700 (PDT)
Received: from localhost ([58.251.76.82]) by smtp.gmail.com with ESMTPSA id
 t20-20020a63eb14000000b0039e28245722sm12048717pgh.54.2022.04.18.01.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 01:18:50 -0700 (PDT)
From: Yunbo Yu <yuyunbo519@gmail.com>
To: nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com,
 shayne.chen@mediatek.com, sean.wang@mediatek.com, kvalo@kernel.org,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, yuyunbo519@gmail.com
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] =?UTF-8?q?mt76=EF=BC=9Amt7603=EF=BC=9A=20move=20spin=5Flo?=
 =?UTF-8?q?ck=5Fbh()=20to=20spin=5Flock()?=
Date: Mon, 18 Apr 2022 16:18:44 +0800
Message-Id: <20220418081844.1236577-1-yuyunbo519@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_011852_529299_2AD657C0 
X-CRM114-Status: UNSURE (   9.86  )
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
