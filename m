Return-Path: <SRS0=6w7/=HO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1933C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Feb 2021 02:13:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0D1064E3D
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Feb 2021 02:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0D1064E3D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YdPvlCFj3ErHvZMWCTvG2Gw8lzl59yzIbsr79lDFw4U=; b=w5CQEJICAWpjJNrjanIvTJOnm
	7bYiFw8ZXlyk0KckRo3jbpmBnIfEDu317yt45c8qi/ibi7CVTjGA6zQOFMHW74Ncv0Ase0U4fbCKG
	GWkHNrEJPsl2Z9ES3p8K6xvkqGgHD2ZB+OobyLAj9StdjZZyg0r4cPqF4WzZIMHDjdKYNs1ii+lxt
	Q/63OKO+T04r8xRv/EGd13b7uSYkfla6lDev16W7aEfRHL8iUcw00+pea08ALEtDnWl8RqONQwaWl
	Lz1I02HrVq93shP7z5GXPmOVecXe+0N1LM5oIcdzbZUEPlM04+vGjMvkYIRICnvIx05OGtdjzYUIn
	yWHx8QNUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lANxT-0001Ts-QK; Fri, 12 Feb 2021 02:13:23 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lANxO-0001SE-RE
 for linux-mediatek@lists.infradead.org; Fri, 12 Feb 2021 02:13:20 +0000
Received: by mail-io1-xd33.google.com with SMTP id z21so6488827iob.7
 for <linux-mediatek@lists.infradead.org>; Thu, 11 Feb 2021 18:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DQ4hezKs/564pdp9qVVgnPCiXwargfZBqBE6eVRsn+Q=;
 b=O2A+7SU0HlH0ayRNJlNnkiPnkN3FroFezBXYoKB5Hkc7SZ/9cCozwuf/rgAhxxotDc
 jZZ2SfEmVz0popr3/CwyFZoXjjINoGa0PZ/UYHtzqna/btPfYNB21tgjnDSs8Hic/yAl
 fWSshxDMpyC3mNRSsKIYBWO/HGqK1T8Fre38o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DQ4hezKs/564pdp9qVVgnPCiXwargfZBqBE6eVRsn+Q=;
 b=CBn806Ze74HhOXd/TFDj5+fCMKYTaN734YRrlbs/BtW2l8z+tmT5YPlAwpUjhsZn8l
 MPAh/z+SNOLIrJdLaH+wPcEJ3PMDslqEA1eImhhEr+H26bv/uXrab98WiRtd1M4LRPdC
 VvqdJY6AmNUkTsU7AqWJI7z5kD6RBVlOFfDsgpjVH8/e12UALsR4EYLLiPeuZIjSLehS
 qUYyFzBc84/BJA1ehNBQ8FgMHx6Kh8VP1fFFyH9NKC7LcguIdGb5mBu1pLmeWLVbvQeS
 cpQ8UoI9Vw/lSTxSRC7YosQBA9S/AS5Kx6Ak06bFws6ZIYCgEwvkMM4ZVW99/vdbc8dn
 4L9A==
X-Gm-Message-State: AOAM5307G922TWvZ6S5vhIclTHxwGB4fWRjj1Auc5t4lNIOcJjdXrfTj
 m+6D9YiPnC6rHpEnF+L4ypwrNg==
X-Google-Smtp-Source: ABdhPJwkz20+sR+9d0DlpiYpRe67c8FB0IhGdSj7e4dPSnKAx4BE5wv47oFR2uoK7lzyje/0pFkzrg==
X-Received: by 2002:a6b:5002:: with SMTP id e2mr528669iob.152.1613095994176;
 Thu, 11 Feb 2021 18:13:14 -0800 (PST)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id c2sm3480594ilk.32.2021.02.11.18.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 18:13:13 -0800 (PST)
From: Shuah Khan <skhan@linuxfoundation.org>
To: nbd@nbd.name, lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com,
 kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH] mt76: hold RCU lock when calling
 ieee80211_find_sta_by_ifaddr()
Date: Thu, 11 Feb 2021 19:13:06 -0700
Message-Id: <20210212021312.40486-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <1cfa036227cfa9fdd04316c01e1d754f13a70d9e.1613090339.git.skhan@linuxfoundation.org>
References: <cover.1613090339.git.skhan@linuxfoundation.org>
 <1cfa036227cfa9fdd04316c01e1d754f13a70d9e.1613090339.git.skhan@linuxfoundation.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_211319_064182_8A3B44D4 
X-CRM114-Status: GOOD (  11.88  )
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Shuah Khan <skhan@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

ieee80211_find_sta_by_ifaddr() must be called under the RCU lock and
the resulting pointer is only valid under RCU lock as well.

Fix mt76_check_sta() to hold RCU read lock before it calls
ieee80211_find_sta_by_ifaddr() and release it when the resulting
pointer is no longer needed.

This problem was found while reviewing code to debug RCU warn from
ath10k_wmi_tlv_parse_peer_stats_info() and a subsequent manual audit
of other callers of ieee80211_find_sta_by_ifaddr() that don't hold
RCU read lock.

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
- Note: This patch is compile tested. I don't have access to
  hardware.

 drivers/net/wireless/mediatek/mt76/mac80211.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index a840396f2c74..3c732da2a53f 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -867,6 +867,9 @@ mt76_check_sta(struct mt76_dev *dev, struct sk_buff *skb)
 	bool ps;
 
 	hw = mt76_phy_hw(dev, status->ext_phy);
+
+	rcu_read_lock();
+
 	if (ieee80211_is_pspoll(hdr->frame_control) && !wcid) {
 		sta = ieee80211_find_sta_by_ifaddr(hw, hdr->addr2, NULL);
 		if (sta)
@@ -876,7 +879,7 @@ mt76_check_sta(struct mt76_dev *dev, struct sk_buff *skb)
 	mt76_airtime_check(dev, skb);
 
 	if (!wcid || !wcid->sta)
-		return;
+		goto exit;
 
 	sta = container_of((void *)wcid, struct ieee80211_sta, drv_priv);
 
@@ -886,17 +889,17 @@ mt76_check_sta(struct mt76_dev *dev, struct sk_buff *skb)
 	wcid->inactive_count = 0;
 
 	if (!test_bit(MT_WCID_FLAG_CHECK_PS, &wcid->flags))
-		return;
+		goto exit;
 
 	if (ieee80211_is_pspoll(hdr->frame_control)) {
 		ieee80211_sta_pspoll(sta);
-		return;
+		goto exit;
 	}
 
 	if (ieee80211_has_morefrags(hdr->frame_control) ||
 	    !(ieee80211_is_mgmt(hdr->frame_control) ||
 	      ieee80211_is_data(hdr->frame_control)))
-		return;
+		goto exit;
 
 	ps = ieee80211_has_pm(hdr->frame_control);
 
@@ -905,7 +908,7 @@ mt76_check_sta(struct mt76_dev *dev, struct sk_buff *skb)
 		ieee80211_sta_uapsd_trigger(sta, status->tid);
 
 	if (!!test_bit(MT_WCID_FLAG_PS, &wcid->flags) == ps)
-		return;
+		goto exit;
 
 	if (ps)
 		set_bit(MT_WCID_FLAG_PS, &wcid->flags);
@@ -914,6 +917,9 @@ mt76_check_sta(struct mt76_dev *dev, struct sk_buff *skb)
 
 	dev->drv->sta_ps(dev, sta, ps);
 	ieee80211_sta_ps_transition(sta, ps);
+
+exit:
+	rcu_read_unlock();
 }
 
 void mt76_rx_complete(struct mt76_dev *dev, struct sk_buff_head *frames,
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
