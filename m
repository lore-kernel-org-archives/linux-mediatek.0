Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D85DC54F54
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2026 16:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p2e6Hbr3mS3jtYf8ADqm2O2fYI50hKUDyZ+DuMwGlh8=; b=LN9tgOc9J3fYMZO0ECLEJ1xmTA
	ylTt/n+9mRlYnK1Qu1VuB+SRujEpc3k90r5j1rZq0TUa0AXlz/FXQwLt9zR03At8DAWFwu20Zf3u8
	JgbsObH+XI5oil9T7VPJHX6iYAKoYbdoEu+6IMu3wMm/DLUsgM95apMOYVcrVe9JrTiQ+KobYg33w
	t8WdvZ0zzSnVwms/oS4L8cIq4dm8TeTrAb+RQnueCoHJiUMDnJXfd0TOSFaHq6LUUoTFzo8kxEJgW
	/Ym8vcqGRZ2aCnVROANkHAUzWv7Khg68DgatOoZ0vWcOftQu2A8IJSy7bTXLUuD+SsTsmM8GtVf7s
	MjAYCkGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqOi-0000000DB0i-0Rrf;
	Fri, 31 Jul 2026 16:47:48 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqOf-0000000DAzz-2v19
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Jul 2026 16:47:47 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-38deea72eebso1266450a91.1
        for <linux-mediatek@lists.infradead.org>; Fri, 31 Jul 2026 09:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785516464; x=1786121264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p2e6Hbr3mS3jtYf8ADqm2O2fYI50hKUDyZ+DuMwGlh8=;
        b=W9941g2CExWj2kvJurPzVM4lu3XGtq6fFS9fQXs0+Y+zAc8Ic8qJZO7MpXp/wD/51s
         MRFMY1Qnwk3RTkcl7cuFlQpbtEI1JF7paEBsXsKBIFV6WEn1rc7BF5A+B4GtkUlXaBXa
         FSEUbm/Tonx6o6Zi75XwDhWgS6oVzuOeMAQqD1/Njf8uPeuHZnscK9Ihi8P4ftMFi3je
         X+MLzJd5Y8yeZqkOdvCF6tmKxXG+losE7us/Zcr0EE+H/YcxiJjgvOTJZbPrbI/O8Whl
         BljMJ4Cl6GfFL36PEvigRezMtpNhM9647wPoPAmn7M+wDizfyU4BcwrFwey+XD8Lh22+
         wJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785516464; x=1786121264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p2e6Hbr3mS3jtYf8ADqm2O2fYI50hKUDyZ+DuMwGlh8=;
        b=HkKTJoeSW1JelW1tgpqN/Is38KX9ZY1qp7qqCo4QDdcJxxHEiUV46uVEqzBWwcumin
         PM2jc8r8kec9ggHDzlUH9OCtZ7P0KT7imPjmcOdjmnHMZ4MjAXP0qvu76PY5844EbIFZ
         oKiqJH4gsdobqqbHGpt5bqtFwlJFOqvRO/VFhjuCnK0omt1oLpScxy2B1r8R0EPxqvGp
         4ZzvQiRaNzOk2uQPFsvYjbBHKc6u047q1U482FfX2UhnIP+BLCPA2wQqQYH4zQy2iRY7
         7OH/yNfdBQ4G01wIEwSj4BZhUoX4ygBAZqe7Io+g2VjLKtRHWD3EPsB8zX2bmlCJuwiH
         I0Yg==
X-Forwarded-Encrypted: i=1; AHgh+RoJ5GDatLEOWWvZrZsf/JuR3ze6BsbnE+RjlvsG60loVlrjZmrwD3rkkLBgNg9HOR7oW9yQPZptT3YD3q9YKw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwznaCqtMBDX7B6C7DhzAFmowj66MtGEzUs9+++6yY5TBE1fz+F
	o4n8Mmwt2hvT8cnYg+h/a4LYvcUB3Y4joRQvC+E33UaMXK9i/YXXxxTo
X-Gm-Gg: AR+sD13y1f27Yf9BSsChM72HGU/p8coiewqY65FPEkdzpwYIgU6tMxWP1CbYlYd56Yi
	kuV/KX+3RfoUrFyuwshOwl7PFwymRE4pi70pxSE+uTEzX0MsN2XzCCgIbhFejmgTWgX6ufbLT/S
	apFqWm8uk/FidNMhUE9bidJ4t3fMJUTOrZFk6RGWtsCA9KPv4yHDYgIiSY+24eBpYx7iLeBcDsY
	4xTv2KdVk0F8ZdbitAvW3IkNrf9UgdAt2RMdVlEMmfw/M/zDo2fWkbmJDVAqM/6ufXNc13MT22t
	LgBL0uKzt0ZjQ5Pi8jWYmMHp4P7EVpBKEnJ+VWYm73hJrd5CxfGAiXDDnleeNc49F6q3AYCFSsO
	pYkON+o6lAtjqXc2oMBkeiclesjAaWECFp2gqw3HgKBXUgS1+eTusDMK3WhLm2k8jMC+Okiuq7Y
	a+AZKxtcKd50pxPSvvQTPVZSkc756OWOYYy9KPELz1FOeB4mcyb1AR96Q=
X-Received: by 2002:a17:90b:5403:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-38fbc434501mr587545a91.11.1785516464469;
        Fri, 31 Jul 2026 09:47:44 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2575819sm970637a91.0.2026.07.31.09.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 09:47:43 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH] wifi: mt76: mt76x2: use min_not_zero() in mt76x2_get_min_rate_power()
Date: Sat,  1 Aug 2026 01:47:26 +0900
Message-ID: <20260731164729.1210247-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_094745_736841_0DCC21CD 
X-CRM114-Status: UNSURE (   9.80  )
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

The loop in mt76x2_get_min_rate_power() skips zero entries and picks
the minimum of the rest with the same logic as min_not_zero().

So use min_not_zero() instead.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt76x2/phy.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2/phy.c b/drivers/net/wireless/mediatek/mt76/mt76x2/phy.c
index a5efa13a892f..89733f3fb1f2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2/phy.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2/phy.c
@@ -121,15 +121,8 @@ mt76x2_get_min_rate_power(struct mt76x02_rate_power *r)
 	int i;
 	s8 ret = 0;
 
-	for (i = 0; i < sizeof(r->all); i++) {
-		if (!r->all[i])
-			continue;
-
-		if (ret)
-			ret = min(ret, r->all[i]);
-		else
-			ret = r->all[i];
-	}
+	for (i = 0; i < sizeof(r->all); i++)
+		ret = min_not_zero(ret, r->all[i]);
 
 	return ret;
 }
-- 
2.43.0


