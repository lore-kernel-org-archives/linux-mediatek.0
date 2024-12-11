Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFB4E77180
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2024 01:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YvLYpyR5eCI3+Y1o7ii3SvRbYIqhS4yWBFBtNSrsqIo=; b=ZQ2n9XuK8c3KC0ar59RYA99MGC
	a6dwLfmBdmhlEnVe+n5qEQTt5a6kcVl6HVzfVHXmXNakVCajrQmqaK4adjdtBcEcZtbbUyG3FApOi
	0lN+97jt3aIDJZvjc3W8yAqLHsM2Hkh7WvHfMXQNYcN2ujyjSpMyZko8cm8GMHbEFBWxJxZ2B31OS
	NHsurLCKUjuC12iYR454RVaWIQxcQ7dkcMwsfXslcddT951RRqpuPSsLltdh6+W0VqpVq/qLU79kx
	eErpB6MI90C8G4atyNlyqVRL7tT5KyAFQyd2meD/XVDvAA9YMrPmTgJrqJZQwfzvyw90v7T/YlLpf
	0ngaDnVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBOo-0000000DOw0-1nQO;
	Wed, 11 Dec 2024 01:20:22 +0000
Received: from mail-oa1-f41.google.com ([209.85.160.41])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBOm-0000000DOu7-0BPE
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Dec 2024 01:20:21 +0000
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-29e998c70f9so3584533fac.2
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Dec 2024 17:20:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733880019; x=1734484819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YvLYpyR5eCI3+Y1o7ii3SvRbYIqhS4yWBFBtNSrsqIo=;
        b=gmeHX9pR0U56gDfic6in5lMJ8q3KbrW9VupiU+woe1NgxZWxTtkPiwHBgpIB7E507J
         e97Jdqz89Eq+2UqbWciot8042cr9s5Pp1XvkeUxstWfOkhiK9jRzjupqukX9F9Hd337E
         ry2blPbX7pyPBS3zG60WfPX4vIxVL8GJivz0t0CVsJOi7YK5UemlH+vn/06SqMvX+r9E
         SFyC1G5Tx7x9XZ4QIUoN0+rFDc/bEGJm9pU/0HZvRhrQ+YfGZfrMV68NiZVglA/ZPpII
         1Lr0LOrhfPswKD1b/zgGRusVbH12msYGUtapenWDl/M+32qHz2fWn2zHlM5KaBV5sOwd
         vQIA==
X-Forwarded-Encrypted: i=1; AJvYcCWnRrG3jZzImASJWqC453Xd4u8M+gnI73HWzE8RPUq6WE7k48nUM5GGogpqkcVsBPwoVOrhNeCb5V4u017SWw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywj3ll1gkOTcO5NxobZ8GWux/BngpRpf2Bsk4xJ6SNYOYD8CKlc
	Yld+0FElfBa1YwF5cccxKyOetr1GQmkd9lnBYqgv4yW8JBBUI+SF
X-Gm-Gg: ASbGnctaXF9+I7wTn64aDGUdXDuioBbNrIansvz2jC9qAw+K8rX0XjEia3kQtoxb9Aw
	UIHV0d/Nd3yKwJD1HB898JO7SFlplVxD0CAbrWwosjPQC9HJCHwrZYfKrW6XW8Ikduj6YtNnwMi
	IEzAEcRQXYKMtVYRSSl9ZYJWT1fuSZaG1qbD5vGnnYt7YZmxKB51K9bgGOZHMX9OWpB3T9fLj45
	W2Nw0Cj9SWNaa+d9Wlola5OJUGTz6q0TXB4KcqRpSF082SOzLXJUP8s8FYE2azTjnSU16k=
X-Google-Smtp-Source: AGHT+IFvjvpgdG+j02OXVpvjD6zMw/zx1NdUsngbozfn/+B6x1XAX1y4CJhegoGRL3gvUB+sxUc79Q==
X-Received: by 2002:a05:6870:55d2:b0:287:4904:7125 with SMTP id 586e51a60fabf-2a012db0fd6mr678464fac.14.1733880019143;
        Tue, 10 Dec 2024 17:20:19 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29f93552d34sm2705701fac.24.2024.12.10.17.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 17:20:17 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 12/17] wifi: mt76: mt7925: Update mt7925_unassign_vif_chanctx for per-link BSS
Date: Tue, 10 Dec 2024 17:19:21 -0800
Message-Id: <20241211011926.5002-12-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241211011926.5002-1-sean.wang@kernel.org>
References: <20241211011926.5002-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_172020_077819_7CF0D8B3 
X-CRM114-Status: GOOD (  10.17  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

Update mt7925_unassign_vif_chanctx to support per-link BSS.

Fixes: 86c051f2c418 ("wifi: mt76: mt7925: enabling MLO when the firmware supports it")
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 9e9f33b6a1bb..615d7a370923 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -2090,7 +2090,7 @@ static void mt7925_unassign_vif_chanctx(struct ieee80211_hw *hw,
 
 		if (vif->type == NL80211_IFTYPE_STATION &&
 		    mconf == &mvif->bss_conf)
-			mt7925_mcu_add_bss_info(&dev->phy, NULL, pri_link_conf,
+			mt7925_mcu_add_bss_info(&dev->phy, NULL, link_conf,
 						NULL, false);
 	} else {
 		mconf = &mvif->bss_conf;
-- 
2.25.1


