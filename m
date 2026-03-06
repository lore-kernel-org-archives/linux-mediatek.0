Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED9EFC9EC0
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2026 23:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZHt1hQYwL2zDMvByDBWz3LSjb+YIIi96dDLYWC91BQ=; b=URfnDeH8zFuSunEwn9vDIqBkPF
	V435emkDiCY2yTImEXSRV7TwXj9aKiajeB+te/vRWxQ3QFUVir6rEhFvM18CX3kiTN0vX5gBNef6i
	6Z7pspmqMmPyYDZExPnDtR4ZTl8wJpK5f1zhm7iKklnp/cLLajUBBtUSMAFvuhu/rFLuOipgg8xTv
	p/CfuZXTJyMxo+mPGm4GGFlt0Fgf2+hLIIa/l3SzCnnVzXsmnealpjL/Mu1IuasT+3eYvVDTRP1ig
	KXj9oCwY+CJgAPZVJHQD8Jh+MYm1NFQdsU8VZl5fe1W5m+dVICAWYbY+7vBnZ2h5sFsawUPBcDp32
	o5cGi2mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeWQ-00000004dlv-3C9S;
	Fri, 06 Mar 2026 23:23:54 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeWN-00000004djk-3woB
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Mar 2026 23:23:53 +0000
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7d4cb7e10efso10845123a34.0
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Mar 2026 15:23:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772839430; x=1773444230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RZHt1hQYwL2zDMvByDBWz3LSjb+YIIi96dDLYWC91BQ=;
        b=HIgLu/V6dQnO9mGmMIAWf9/l2HKvdit0UMJPvk2H34/40CXyIzaaN2EUqHYpARX73b
         qFbthHBvScgrtk8gzwGAubfHB683gIrdhgwM/vqSbfGVYaT6FZM/E5vmFXzJQ6uj05iW
         PIUhaGm9YEfAqUpUSMFmL6GL5EjSLmqZtrgGj33jkXcB9sGIPIQu3iuNw3WlGx0ts4Vo
         05xVrrVKcTjLOwElavMu4Kwo01+yKMAz/mVxuTWPGJy44/WFIKiH0GRsCuMTI4yZFOkJ
         yxVPvwTJDLn5K4PKCwZvavzXgPQgJtm/pJbMHW5ic9PgClwcn/6RiXElSnFzq9lhzDSg
         rzKg==
X-Forwarded-Encrypted: i=1; AJvYcCXUuABZ80sXTiSBMCW429EVtk8L/npDVz9LtVwhtgFgnVN6NNAiPfhtEd76lzD3/DpUvJoviXatcsFLqt473g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+V4JjXZKNbvQGFGF2GPHwSJkF9QsjRQJs2IkmoSnxvDeiEMsH
	QWcA9NitVnzIWtLtsV6ZxAAECQfQvebbkIuZKTBO4D7gYHB4g1/Yx9a0
X-Gm-Gg: ATEYQzwh9c2Sb00TBAWK1Rtai70xae7Z4BD3xL5GNpAuFtS/T7QuPmKDDNr1vFBJEAO
	7TN2RrnklGm0d+/Nv+0JQ8xRJEtZpEz7di9Ij1XuJXpemuPOOVlSFAr9QzZsUX9ABoKYSgxQK73
	7Jr3bTjgZXXgibu+EbnelY68ch2eoh01gzkFyLv4NgOc4uZUvaQgemUhgWuMvLpNrUQIOy+/+JM
	rRqIDYQ2Qmy7ujsV6pf3Nw4zeECiagtAZGfKyBOOSG5TICZ/Z2W3lIogz9RPkDNoYtVpAMk+eum
	qOj3+EFK75ViySZ1GwETwDQhItpBwIZiOa/+Zr3/K0psIlrGCpEMiNWRQmVNErNAONRpr6AkN7N
	QIvzvSgtfODZtKnAUQheTrmPkq+d/InDfK/Ra54wxVJ2TLI28+W6bfwLtTpgdcvtKBtYrJdiwcc
	+oy98fXrGxaJo2krHoqwguKAM7cS/WWvqWw1MR7MgOzQUjX9g=
X-Received: by 2002:a05:6808:7006:b0:463:1f4a:3b91 with SMTP id 5614622812f47-466dca336ffmr2127111b6e.14.1772839430495;
        Fri, 06 Mar 2026 15:23:50 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-416e65b1c82sm2572344fac.5.2026.03.06.15.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 15:23:49 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 15/19] wifi: mt76: mt7925: drop WCID reinit after publish
Date: Fri,  6 Mar 2026 17:22:34 -0600
Message-ID: <20260306232238.2039675-16-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306232238.2039675-1-sean.wang@kernel.org>
References: <20260306232238.2039675-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_152352_057721_03CBE696 
X-CRM114-Status: UNSURE (   8.07  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Remove the redundant mt76_wcid_init() call after publishing the WCID in
mt7925_mac_link_sta_add().

WCID is already initialized before publication, so reinitializing it
afterward is unnecessary and makes the setup ordering less clear.

No functional change intended.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index dbde91727cd0..d99dbd707fcd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -891,7 +891,6 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 	ewma_signal_init(&wcid->rssi);
 	rcu_assign_pointer(dev->mt76.wcid[wcid->idx], wcid);
 	wcid_published = true;
-	mt76_wcid_init(wcid, 0);
 	ewma_avg_signal_init(&mlink->avg_ack_signal);
 	memset(mlink->airtime_ac, 0,
 	       sizeof(msta->deflink.airtime_ac));
-- 
2.43.0


