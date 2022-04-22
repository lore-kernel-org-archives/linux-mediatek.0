Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15C2C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 06:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+uXTO4/YiDuWnGDVpqD5h7zNPdwkA1DCLj9CZplarFs=; b=tuyU2l8NitUTJK
	lP9lOPrcjWortaKzwOhPP8xjxaxhav5cnFuC7wtRlzc0nlU7xIfqdac4Xy/Fj3lJKJDCw8DmwkoYl
	zKGnKAjx2stqkzjJHIatdXtmYWy1taTw37J1rDoDQaPRj+0w1Pe5ubc3B+ypIKPmnAFh8rHKW4nuT
	FWOxldrpMA19iwJ3du4uj4mDR/dKAainnzGEAaYrNIKFMOuIQRGfh9dKLMIjYnc+gQwKtRBDodN6G
	m9HWQ60F+ZGi8SJBkN/mejhqxMEfkMbI0aSetZrM9NJ5vg8tTrigmk9ixXXRkLs0dbWMETg1LZlSo
	Up447sbiBB287IoYgDKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhmTR-00GOfa-Fo; Fri, 22 Apr 2022 06:08:57 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhmS2-00GNyL-3S; Fri, 22 Apr 2022 06:07:31 +0000
Received: by mail-pf1-x431.google.com with SMTP id w16so611149pfj.2;
 Thu, 21 Apr 2022 23:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RKXep+OukE4SdMu+cRqxBY4lHOeFUaKFcve1sEKphTA=;
 b=jCZAmk1J3ai9mz8LMYhy0icEUgmMobhYJOM9rZP/QZ8VIOGWFCIsnEbVX8GH9uBLFj
 QfSjjArjgiyCEWsmRlujguU1HdcUoypu10BuTqAZbOu+VK33Axfbb7j1sdjscz8iNc+Q
 S3Gjv7IqKqodjaP2KwYY68LlyhF/vqCWaHlm9KrtLHrt/w6wtNpCZNxHONMnyWabt3qV
 1oeh6yykcCbjMwNvN9zEunXZLeAknr+i/xGjbs/LiOPCy+Xmgs+rK+7g4AsmCW1JFqlj
 lDjqBjbzfPS/E7btQ+EtdlGMvkfg9ir27+egMbPEnlddMJbR9pBUdlQpkZ+/YVgFQguY
 EKGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RKXep+OukE4SdMu+cRqxBY4lHOeFUaKFcve1sEKphTA=;
 b=q5A+st1jfDIoKIYSUnYbcJaWoIcDi98w12JH4WSx1gqNckF748TfQB1ZIkrHWZZCiK
 LFdq/A6iET1h4c09r4Z+3NE5n1shWCmNsGuZg+ExYzoD5Ax+iyrEvHLVPgN4o6Q4fobi
 pT0L+XsCpqEmrv4OTlGVeitLMLlWmKDd6bqRDLS686z9kQHykjpXg/gM+j3C35m0Q66L
 4jKTpIHtJ3x8UYA+HBdWAzR4hvgroIwoqFiFOB3g8xGRbV1TYdyuLqS5s+wEvX/Zm/L4
 qmdWW5pdDUkS2aMh9/EFnWd3bhy60M2bjtUPH5NUa5yPzHUz7BPktMyCghXdvzihP68N
 dxWQ==
X-Gm-Message-State: AOAM531XQSK35I3f5ctEFuz1iBiPlWvwZfhKodSEEd5vABTrp2LLvFtf
 8hZvgfd8CBKNDBcjLIGeZ30=
X-Google-Smtp-Source: ABdhPJySViXl8wduQ1NeG0I3VsxtliLWMqqABy+BwpIMEwoXPK2LckYjJVk7VmCSpzVnZev2TQfOlw==
X-Received: by 2002:a05:6a00:1354:b0:50c:e672:edfc with SMTP id
 k20-20020a056a00135400b0050ce672edfcmr2963574pfu.50.1650607648237; 
 Thu, 21 Apr 2022 23:07:28 -0700 (PDT)
Received: from localhost ([58.251.76.82]) by smtp.gmail.com with ESMTPSA id
 124-20020a621982000000b0050a73577a37sm1120679pfz.45.2022.04.21.23.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 23:07:27 -0700 (PDT)
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
Date: Fri, 22 Apr 2022 14:07:23 +0800
Message-Id: <20220422060723.424862-1-yuyunbo519@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_230730_197244_C0C1189A 
X-CRM114-Status: UNSURE (   9.72  )
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
