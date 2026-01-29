Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4406D358DC
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jan 2026 08:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q14ebJgYOBwi4oXp2H6aUXb34czVGi/YpKLXXPgCXl0=; b=sOPnN0mu8yTTn3DpfXigFo0RQ6
	S9LksVTw3aAOJj4+EO3xplIdIuE/o/zihZmvkMR+IJyeD+LsR9nFgkoh6n2cbw5tvk4KW4lNezsHi
	hv2eWP2yGL5mnhEJGhKyZkFfAtPOEPCrCkJMiFGbdtog42+yLV6ZY48RwiXvwB05+3xIkTiPSxx5E
	WZpuktcj6iz9XFIGivSVzax+QXfuQTbDVjL80TCxAx3Q96sWaH8E5pKUXKp7YUgYWhGNDe+l3a+Qn
	yZZ+CPA8/VB4DjdqIvxz7WAwmJfYZk9ch0gw2XxnsCdX7I5HYnsj7uqI9IGmS38D8MzaeS6Y8swCa
	5vFhFW9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNF0-0000000HRtp-3lb5;
	Thu, 29 Jan 2026 08:19:02 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNEu-0000000HRqJ-0lA6
	for linux-mediatek@lists.infradead.org;
	Thu, 29 Jan 2026 08:18:57 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-2b6fd5bec41so1509488eec.1
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Jan 2026 00:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769674735; x=1770279535; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q14ebJgYOBwi4oXp2H6aUXb34czVGi/YpKLXXPgCXl0=;
        b=DhhxguEsWYmnm4DATsIaCyo1fbdC1IX+uIHj7WvXLs5PtMMtZ4yV9efsXqof7pacol
         zizfP69GLs+OHISgQrVO/OWP1mFzksDlcVKPYxbyiwww6dToiBK4VMHzbgXXnrqY1o3S
         1yQ4SIRBbJO0y5im00I+9ycYO9fs93cbd2rWD7zFI8GUYfawptb2kQIK2pVJRJJBCtqy
         CAwZKmC90jdQ3E7TkH+dzwH7iNNXPpKup275lyGxMjtRtssKHMzXMS3t9nC0mg3L5IM9
         anI0ZSnTwca78TxrVQzsHsdm79hPER1Rrw6rxIFCijFWG3aPcvWgSxXPo1VrgTW+rEY9
         f1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769674735; x=1770279535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q14ebJgYOBwi4oXp2H6aUXb34czVGi/YpKLXXPgCXl0=;
        b=arCCeHLBSEqQBfQZ+5/Of1U7ZEWjzt/I4c43bN6GdQfsnbE3fxPMNMER0vtDQ/MiU0
         7Ew19cpYYhLd9bsed9sHbN27LVG9W0vhDyYjeh/FpBbwA0Dn/G1/5aUm88lPd2ZJ1d2r
         JA0fY4YQ/Cf8Xsdvj7E2X7sBjBJ/1fXXY4G16vw5EFms11ZM+IV59R3lEaTYJpl9yAV4
         oAF8muNU8wZscU4NBeybsP0pQaNZlQ647d8v6LEPMlIOVxJUEGxUQmLPmzY4aMM7fg6g
         Gh56OQee+nVveNyhl2ggWDCk4fh7NANMxZzgsm8c7xOSfN1wQeV3y4CDffSI2lHL1bL3
         /diA==
X-Forwarded-Encrypted: i=1; AJvYcCXSfLgJbEMbz1rVoee956mzlFAbDM4hqxxBiYym9dCKqyb19WAs95f8/t2JV116bz+hR3AeZD8M4Uvf3EkWUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyO1lr/gwI7rRNFHl+MCPppFDQz7czfoDixbE0UDJ/ZNzMxb9WW
	KT+gend/lb2FTorY+re5BKOd8F/ze27765+2Q/2e3Xa2yeRLXNZue88n
X-Gm-Gg: AZuq6aJeRgKocxJQKQHQanEFTrZWPlv3u0q4SnkNNDFt8AQiJUm6HNw0Y5RuR7S7iSj
	OhFFI9LACiUgXpcbpPBcKGCgNLZ83O8q0YcWfgB1eHnxydiMtqs5V9Y4phOMx+vgHYsyn598vnL
	QODhB/VwWwaovBJTCu594xtyLsB3qy+VzfEuM7cs72uCQBY+uGpJrv5MjrABJOLX5RStIpBqkKF
	AkhCwy6TVJS7/vaWJVa0EjGu9Ft0N7PTE8O6Z4fQ9rJ2xWqbQbHUL+rqQAWXIDzqmPmL6xzKxJQ
	zqWWZyWETpwjPbK//mSReqWIC3uueFmbQSLXcPhZ8xsgLCkAzQG8fQfDbeZY3ny8JQx8gplTfJi
	vpK01lfclOFKVZdRGiJGUzM7TNmp0Fy80heDvDG9lwz7Lu0JkiVpRvCB1GgFnLyJ8NdFohhMvBG
	OJfl/IhfmKrZdjNlkqFexY4zVjTNIQLb4099KlDfUH2PI9Mbvavf40+YphGGFF
X-Received: by 2002:a05:7300:7307:b0:2b0:5012:734a with SMTP id 5a478bee46e88-2b78d9f0bc0mr4601976eec.34.1769674735088;
        Thu, 29 Jan 2026 00:18:55 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f31e:1cb:296a:cc2a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9efb4casm5483508c88.16.2026.01.29.00.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 00:18:54 -0800 (PST)
From: Zac <zac@zacbowling.com>
To: nbd@nbd.name
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux@frame.work,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	sean.wang@kernel.org,
	sean.wang@mediatek.com,
	zac@zacbowling.com,
	zbowling@gmail.com
Subject: [PATCH v7 6/6] wifi: mt76: mt7925: fix MLO ROC setup error handling
Date: Thu, 29 Jan 2026 00:18:39 -0800
Message-ID: <20260129081839.179709-7-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129081839.179709-1-zac@zacbowling.com>
References: <c9b81e89-cd29-44f2-b4e8-0179b2049c21@nbd.name>
 <20260129081839.179709-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_001856_222014_E6020AFE 
X-CRM114-Status: GOOD (  13.19  )
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

Replace noisy WARN_ON_ONCE checks with silent returns in
mt7925_mcu_set_mlo_roc(). During MLO setup, links may not be fully
configured when ROC is requested. The WARN_ON_ONCE statements were
triggering unnecessary kernel warnings during normal operation.

Changes:
- Replace WARN_ON_ONCE(!link_conf) with silent if (!link_conf)
- Replace WARN_ON_ONCE(!links[i].chan) with silent check
- Add explicit mconf NULL check before use
- Use -ENOLINK error code to indicate link not ready
- Replace continue with return to fail fast on invalid links

The -ENOLINK error code properly indicates that the link is not yet
ready for ROC, allowing upper layers to retry later without generating
spurious kernel warnings.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 device")
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 20 +++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 2ed4af282120..5ca2106b1ce0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1341,15 +1341,23 @@ int mt7925_mcu_set_mlo_roc(struct mt792x_phy *phy, struct mt792x_bss_conf *mconf
 	for (i = 0; i < ARRAY_SIZE(links); i++) {
 		links[i].id = i ? __ffs(~BIT(mconf->link_id) & sel_links) :
 				 mconf->link_id;
+
 		link_conf = mt792x_vif_to_bss_conf(vif, links[i].id);
-		if (WARN_ON_ONCE(!link_conf))
-			return -EPERM;
+		if (!link_conf)
+			return -ENOLINK;
 
 		links[i].chan = link_conf->chanreq.oper.chan;
-		if (WARN_ON_ONCE(!links[i].chan))
-			return -EPERM;
+		if (!links[i].chan)
+			/* Channel not configured yet - this can happen during
+			 * MLO AP setup when links are being added sequentially.
+			 * Return -ENOLINK to indicate link not ready.
+			 */
+			return -ENOLINK;
 
 		links[i].mconf = mt792x_vif_to_link(mvif, links[i].id);
+		if (!links[i].mconf)
+			return -ENOLINK;
+
 		links[i].tag = links[i].id == mconf->link_id ?
 			       UNI_ROC_ACQUIRE : UNI_ROC_SUB_LINK;
 
@@ -1364,8 +1372,8 @@ int mt7925_mcu_set_mlo_roc(struct mt792x_phy *phy, struct mt792x_bss_conf *mconf
 		type = MT7925_ROC_REQ_JOIN;
 
 	for (i = 0; i < ARRAY_SIZE(links) && i < hweight16(vif->active_links); i++) {
-		if (WARN_ON_ONCE(!links[i].mconf || !links[i].chan))
-			continue;
+		if (!links[i].mconf || !links[i].chan)
+			return -ENOLINK;
 
 		chan = links[i].chan;
 		center_ch = ieee80211_frequency_to_channel(chan->center_freq);
-- 
2.52.0


