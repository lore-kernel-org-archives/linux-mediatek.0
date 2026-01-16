Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFCFD47CB4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jan 2026 01:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JxAIadq5UWGlyJvy2LxwAuNLP4e79ezvRvh2d89gw+s=; b=HKytNat6dFX/15aK6sssy2IBJm
	nxTDboxncdCHARQdmdfmGEoPIk7JaXuKKrww5FalAlvg6i/U0qN9PEqWD7/NM6kxbpLVTcvC7jpxY
	KfVltJnyUvGXlXXB/f6+zQ28VGp+/ClALjN7PH17g6JjHGfmzucIlbtvx4d6GUR1hylK80VfhDuAI
	rsKZPIlqE16qGj/qXAJfpngS69Pa9zQ4Gd6D/rid9DaIhLexd5J98Fc+r1wRlnhFDrzIDQD1Xwq6A
	lxSwFpHleP2nowf6k5ocW7wGhbI+Zt2S2p3j6Nf5gcCtHrqAVQ32xSdvFp9Ho4P4jngluj8cy2CSe
	pfMmm/pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHf-0000000DOfZ-1QJS;
	Fri, 16 Jan 2026 01:05:51 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHX-0000000DOYi-3eeL
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Jan 2026 01:05:45 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-2ae38f81be1so2100456eec.0
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Jan 2026 17:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768525543; x=1769130343; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JxAIadq5UWGlyJvy2LxwAuNLP4e79ezvRvh2d89gw+s=;
        b=ZvVtPDbtY5Ta/+XsebJG5iXDPjqafdrBQl5I6rH1u7zVL34jU+dJGFogQLoNq0X4wC
         y0UVQcVgiD6f+0mzMxfHYM7EwsjaMiwcWtIP/FitS0OHVoTuSheOW6sYU0oUzp3yYqW0
         qFQH2VFx1yKc7WhmSy62icjSx73lKrpoKI+Scj4qw56z19Fl11Wm3kcmeW3bABNxAJ/F
         OVFgGjNJj6LSq/2KekLtqtJbo4NRV014m7yoiAPARFaGa/Vlsm6C6QT5H7NrsIK0ONsq
         xHVb7rtfCPxpMvm/OVCN6RXrsp7vS3g99DmeG+xfyDb0zy7TBf0uDbBCJEYKSmRzRVsQ
         gYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768525543; x=1769130343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JxAIadq5UWGlyJvy2LxwAuNLP4e79ezvRvh2d89gw+s=;
        b=ggRQ/70ELLveE09tv/F7iRWv4OfZ2eJY6RMRmxyvYuvnBLVSqKLKLPPTpj9lbFgS3I
         lFIdRQ2s72EKmRdwMREmsYa+QVrCzca3o3nDC+pWDIwSAau7uJySBpgWIvNWEviNZsAH
         HwI7trRnAjexwAL9l5SqYfzPFc55lcc9FiKJkVmCrIp23WKMASI47AzmVm9mWzVzLw+N
         5hvPR0t8wXosFZ2fTYX/sLgm/Gr9wt1kpXgRtryeJbsEbSmrU6B7J2rp5s/A0ZWNyr/F
         O/coMfOFxmGhPr6TFr87qnhkS9pXPycfQPgIvHHxDSbbIGWRkkYo/7jmYC0+ydhtIpUQ
         Lo8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXRp8mTc76e22o/WcWJLdrdWkoCxpA5jBTreGEKf+Hr2G++DY9mtRd/I87yGEaxoHxV4R0+gKnwayY8fDuhNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx42ASU92UEBKlfMSQsCaugtfbNQPnOov3+ozQy7ezslrOcrxMQ
	2TdfzlH3x5md/W48T4AOPQ31XccI5JDGZ1NJhcsfFJE/6hgbEgCat9q4
X-Gm-Gg: AY/fxX4dWVZPG4AFqGW/Q5ICxwdq/TpXu2nbappdZfWXeFt29V1Mw8aoJyVDcEn0xpl
	X4jGcOLjoDgbjBxehPe2dB3dVuhn7dxRAqXEbjCQK+ny4iGD6boXD+b1QY+39LlUGZNqhwBoyJJ
	RDMPVClUKLR2HV/G0KDKuqjEkuQEbzAmWGx9oC2M1pB/r1ZbdD3TTTviQq9NzGuWQfoAE9G4elG
	XFP5PwlKl2coJSoOjqaAlABLQbBFTZn9ZM9SU9jNuIu351tfbqfaCWe47jtiJKIKCIOCqnVaLOK
	lf7Rt4weUYj2vAeGvjdzJL7WPGkGH7PyXZNUpDOZOPcitj6NYw7GqdSCINg2TwuzShtjjfBr9BR
	NWSiieAaWlYGkDwVsXDqZ37P32txguWfH3cKz626iNaUNVnYqmsSJPZj2+p3hg6OCeULZfTHqIA
	6V8DtrX/s2/rZj/eWIet9sjTWtaIRvux1LB7uY4c6dZCpnipYbkCIGWRJtmeh/aQ==
X-Received: by 2002:a05:7300:6d1f:b0:2ae:5cb2:cc11 with SMTP id 5a478bee46e88-2b6b46d33b4mr1489936eec.6.1768525542657;
        Thu, 15 Jan 2026 17:05:42 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f1d2:502c:a6ff:5556])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm1019884eec.32.2026.01.15.17.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:05:41 -0800 (PST)
From: Zac <zac@zacbowling.com>
To: sean.wang@kernel.org
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	linux@frame.work,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	Zac Bowling <zbowling@gmail.com>,
	Zac Bowling <zac@zacbowling.com>
Subject: [PATCH v4 13/21] wifi: mt76: mt7925: fix kernel warning in MLO ROC setup
Date: Thu, 15 Jan 2026 17:05:11 -0800
Message-ID: <20260116010519.37001-14-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116010519.37001-1-zac@zacbowling.com>
References: <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
 <20260116010519.37001-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_170543_916187_9AF7CBE8 
X-CRM114-Status: GOOD (  16.31  )
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

From: Zac Bowling <zbowling@gmail.com>

mt7925_mcu_set_mlo_roc() uses WARN_ON_ONCE() to check if link_conf or
channel is NULL. However, during MLO AP setup, it's normal for the
channel to not be configured yet when this function is called. The
WARN_ON_ONCE triggers a kernel warning/oops that makes the system
appear to have crashed, even though it's just a timing issue.

Example kernel oops during AP setup:
  WARNING: CPU: 0 PID: 12345 at drivers/net/wireless/mediatek/mt76/mt7925/mcu.c:1345
  Call Trace:
   mt7925_mcu_set_mlo_roc+0x...
   mt7925_remain_on_channel+0x...

Replace WARN_ON_ONCE with regular NULL checks and return -ENOLINK to
indicate the link is not fully configured yet. This allows the upper
layers to retry when the link is ready, without spamming the kernel
log with warnings.

Also add a check for mconf in the first loop to match the pattern
used in the second loop, preventing potential NULL dereference.

This fixes kernel oops reported during MLO AP setup on OpenWrt with
MT7925E hardware and similar issues on standard Linux distributions.

Fixes: c5d11e4a9fa8 ("wifi: mt76: mt7925: add mt7925_change_vif_links")
Link: https://github.com/openwrt/mt76/issues/1014
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 20 +++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 958ff9da9f..8080fea30d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1337,15 +1337,23 @@ int mt7925_mcu_set_mlo_roc(struct mt792x_bss_conf *mconf, u16 sel_links,
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
 
@@ -1359,8 +1367,8 @@ int mt7925_mcu_set_mlo_roc(struct mt792x_bss_conf *mconf, u16 sel_links,
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


