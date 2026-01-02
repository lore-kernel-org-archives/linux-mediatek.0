Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8003FC6160
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jan 2026 20:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uRB/GMkUOZQKL62/6S3QoUiStZiACBm9ZEli7ks4aAc=; b=HsSEG/pTKsfdJH33gPHdnbTtzE
	tlp/blKrp3bDyA0e4gyRs9Vt8y9X/FunxCT23Ke/6IkM8PjZMaE70TcgpyMviB86ZBCRQRyOclNba
	0QSF0bGSeJwgGUSn2N5fNz59X2kQauXRgSty158yRlJx2kN/XAlFKxIIbb8mSaV0XmtpViM6rt9eX
	Pzi90qyDd/qa2Z976OS13t0QT5qfY3gHpA2vmfE5rv3Nrmt4W0ywlTsu6QP2IuRCrjROCEjtpnY29
	H/qAPtAFJTnAD2Q1ygWOzAobVfRxOJ1bdKBZU6dsVTMzgqHKkxoPRVUsdg90KBG12y0WtDGe5wrQc
	FzGzyZBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vblMq-00000008ggq-0a5m;
	Fri, 02 Jan 2026 20:03:24 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vblMm-00000008gfC-2XQp
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Jan 2026 20:03:22 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2a1022dda33so100384755ad.2
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Jan 2026 12:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767384200; x=1767989000; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRB/GMkUOZQKL62/6S3QoUiStZiACBm9ZEli7ks4aAc=;
        b=Xc5FIYSpdJxflKZi9TwanM7wXSl/3UetB9IpmizDwmRnY4uIyrIGqChtWrjQg3DmqF
         bn17S+xMjRBUITDo582sB/TUtgZmQWKvMrIYn32l1iQVWl09uavHPFfxj6RVymvPa2e0
         XHy4vZ73urAmueVPOtaiYAcqGgPhiPcPHYKR74TCS4Dv1JJpxj5t08/dRbjt4TrOS9wD
         fW6cTs8PDqNHeFMJoDwuq7fWwvhs7AAOEHvENUlfTPJ9lb/JuHUghDvD7P/vRKuT+I8r
         xk6I4lYuTjTAAHqKzYtETy2Jzwcw5IeXFznIzfmO/kooI5r0Jvuxb0f+9Q7w4zF0fhmO
         mfNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767384200; x=1767989000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uRB/GMkUOZQKL62/6S3QoUiStZiACBm9ZEli7ks4aAc=;
        b=UJHEltnSEjV8PwkVH/CWrMDLj/fUKqNJYgUiL6HHK5H5EKPRNDCcCOY+KK9Us1OnJt
         woqXlsX4+CqXDbKf3zh+hfMc0yogZAdNnko6myWGWkp2G1Ndnfj3bnBrG3B9EZSaBHnx
         DGBL9io2c4qcomVg0ZyovGAJ9S7wcj9q7HAB3Vy1m2b45fNslsz+72+nTHioK/PYlSmf
         GQKwNIhYzNpi7h9uZTssw43e56eBxp7TUk47aznvJ36s4oTEuAI/pOs6P83+J3xxcbJn
         MyDoKYRU4pqJZ9XFq/YkVJ7/deo5rm/If/c5L/y5ubPYeUtxwQxrrQNbTnHaCoHMXUwp
         xmGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsqSapB7BNaHeEP9zj68nag8cgUd4bNt8Dwwsd9dM7eSLUyqmVcZGUGvK0LrKwcmevOvx1JPK21/QtzMYG4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/aLt8lgp8Dgj8Hbb6xwiHsKfbVBHpLNg7vvRXi9tLnucgAe7w
	Yb+FRHe0zmiLiroI2KTyO4XjNg14xyLyX27CP1urXyFlmbbTtDEWg281
X-Gm-Gg: AY/fxX6v28qQVSpMzysN3y7vFy7f53nri6KDu68FzXF5v23QPZ1wkWvDICRrDAC7HbT
	WujI/R4tuuAYC8lzp1NyjoQW8IysxfZ2FcLmY1Bpi1emF+39XArXaKoMLIqDN1l+3wgVVAOA48l
	UyBLFRlngNTcOuspQ+1P4V9t8KEbr3gVkSg48/Cs+P52TnQW1/mMWR+wWpaCk6RfnOM7BQunaLw
	d9hBjRfWz11FkT76MDccTGlELqVgOmh4K0mG6C27BmeJ7m8TgQ/qZy2xXkeSa6BusE0FklqM9cY
	jjimitRD4mn+VIBBbpyyaRDh2ziFlet2ECgdUK5xzCCm8mZWm31jUbn9x4K/PD3C/ORhP6Hq7ur
	g9S4YzZA6CElOhtgINw5jdmAdQlY28e0VSNAmQKMIgtfv4QYLPK7yko6yKt9hM4d2GtR86J2cV6
	Ele+drVhJj4PcNUG+Iz9qIezrUuYSY4sZ8vPEuPg4iSa7ekIAy3Trz7Al2bwLWzOY=
X-Google-Smtp-Source: AGHT+IFBSUfFL7mHg821Z4iXp+NFgdGr+i44ARHcNYNV/RBJ9bl+fL+NqsT3peNN1SqyHKAuIrBvVA==
X-Received: by 2002:a05:7022:42a7:b0:121:a060:6d80 with SMTP id a92af1059eb24-121a06075f9mr28800779c88.25.1767384199803;
        Fri, 02 Jan 2026 12:03:19 -0800 (PST)
Received: from zubuntu.bengal-mercat.ts.net ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253bfe2sm120203795c88.10.2026.01.02.12.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 12:03:19 -0800 (PST)
From: Zac Bowling <zbowling@gmail.com>
To: zbowling@gmail.com
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com
Subject: [PATCH] wifi: mt76: mt7925: fix kernel warning in MLO ROC setup when channel not configured
Date: Fri,  2 Jan 2026 12:03:11 -0800
Message-ID: <20260102200315.290015-3-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102200315.290015-1-zbowling@gmail.com>
References: <20260101062543.186499-1-zbowling@gmail.com>
 <20260102200315.290015-1-zbowling@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_120320_646925_36ABC595 
X-CRM114-Status: GOOD (  16.51  )
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

mt7925_mcu_set_mlo_roc() uses WARN_ON_ONCE() to check if link_conf or
channel is NULL. However, during MLO AP setup, it's normal for the
channel to not be configured yet when this function is called. The
WARN_ON_ONCE triggers a kernel warning/oops that makes the system
appear to have crashed, even though it's just a timing issue.

Replace WARN_ON_ONCE with regular NULL checks and return -ENOLINK to
indicate the link isn't fully configured yet. This allows the upper
layers to retry when the link is ready, without spamming the kernel
log with warnings.

Also add a check for mconf in the first loop to match the pattern
used in the second loop, preventing potential NULL dereference.

This fixes kernel oops reported during MLO AP setup on OpenWrt with
MT7925E hardware.

Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 mt7925/mcu.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/mt7925/mcu.c b/mt7925/mcu.c
index bd38807e..b0bbeb5a 100644
--- a/mt7925/mcu.c
+++ b/mt7925/mcu.c
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
2.51.0


