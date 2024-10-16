Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DD8D20698
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 04:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gmOBl26ejau5/esp+8BV+SXFKf70pqYfUEKz4LKsJpY=; b=AXZf1yvAlEToeysIyrThW3xEtR
	qoPKk26So7WNsfapjL9S6iQgWmtePi0IIPuPhjfY5LiGSf9A4fA1qERqk5gtggocAsIwCoy/oEdoS
	bIdsvHBXakGLHQ8YNaBrCqLNWkxsIAJf7PeWP7jtFcSI+2K5L8rgZLoCVbI+tquPaInkYOumR1H/O
	3OROOOJJvMHbTAiNMbdY3eQIKVmgCeFueLWeCmJtUcuik2PnEHMSP6PvVyqphvb7AYbTZLUdZgCTf
	TnNNW8pQwTd3Jfk8o3lgNPPe0Y7dRgkilKvR79MzDp2t/PyC90Z8tGuujo1CD3kWMMF45SR7KKA2Z
	AFuQrgRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0vaO-0000000AT9H-3JSx;
	Wed, 16 Oct 2024 04:24:36 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0vYw-0000000ASuG-2Ixn;
	Wed, 16 Oct 2024 04:23:08 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-71e6f085715so2057702b3a.2;
        Tue, 15 Oct 2024 21:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729052585; x=1729657385; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmOBl26ejau5/esp+8BV+SXFKf70pqYfUEKz4LKsJpY=;
        b=dRVnMvrUODIwmkZtK8BaGuy2zOZOsxo9x3RVF6HdePTCbd0DslHSYbrxvDkA+sohGE
         5UQBIqWqmOxr1Lwy3DMPTDKJYtb+xaTsZd3Wkz0hAuzyQ5U5g79+CcUlNv1mNBicBVxJ
         IgIz+LrTWJ/DApj+Lnqa3P2jTCpa+bkj4zcHJaZo0gmWwruImT/tN+iRY3dhcqz7wGGz
         TUCU6D28lcJrYB0dea9ECwqgb1aEoVf7W5iW9sN3SWZEDVxDUWG9HGIB0nRh3+4/x+5H
         SRuuv10EIEDFC3N1HJwJXJnqfWz/VBcSDOkSTpoiPW0/Jmi8a8SCC/KdPvIjlyuqRXOm
         AkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729052585; x=1729657385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gmOBl26ejau5/esp+8BV+SXFKf70pqYfUEKz4LKsJpY=;
        b=BnezE/l3Q2d7SAm+H2O6Jy7fpaW+TcXVzB/FNNbzPWYUExOe0/wKTJMFuqjwWJNGao
         HtJ+U+KLfayL4XJQNrKsbh9Y6Rod1IfdVGLOcxr6eDTj34q+oQya5Kc2j6fsmohHt8F5
         Tdd4Rql5eKTwVVuMncZJZOcTKujhen+etOe6o9KAx0YPtHqtoeIyeHLuQO1iMvROblkh
         GHBQvO/WJ57yhrBa8d1b2lt/oJsf4qMWnCRAgIk/pwxZbgdiojslJn3UQZuUdecXfSxu
         FeqM9Tc2JjyvI2XfuwaudGz59ZJkzhrFq+jDgum56f0GLF3KMM8QxhYBSX4909gwhj/H
         7r6A==
X-Forwarded-Encrypted: i=1; AJvYcCUECTNbGwJbtRabrBExxndiX6PBfegawgPxoXoe1ajIIH8EgkL+fCU5HT4M2pDIzA3D0VZGK8bgWE63uO+5SUA=@lists.infradead.org, AJvYcCUgTefYSpaH/RrStF4KNqzyGdpAXTFZATuvSE3Q6D4aNnebAUzATRynNbeBN/NtOzI7rURAmFzreAWvrXmYp4Nf@lists.infradead.org
X-Gm-Message-State: AOJu0Yww9FnEEPcau5UmNlHabkPnL1Eo1fDe9PA7ln8dUvv3KrtSY0N4
	16iAEV+/v7dyxj6Zwivxppjpu1DJyo/NBcUTNFOhzljZPvP6q2rQ
X-Google-Smtp-Source: AGHT+IGyfYPslhJwRcAU6liAsqT25zSnwSsDE6zYG2noVYjDGvopXZPINLehXxi+3oijkmz8hoSnpg==
X-Received: by 2002:a05:6a00:181d:b0:71e:104d:6316 with SMTP id d2e1a72fcca58-71e4c1bfb5cmr21039998b3a.21.1729052584819;
        Tue, 15 Oct 2024 21:23:04 -0700 (PDT)
Received: from purva-IdeaPad-Gaming-3-15IHU6.lan ([2409:40c0:11a6:bd6f:94e5:e911:e544:8911])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e773a2f2asm2175122b3a.51.2024.10.15.21.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 21:23:04 -0700 (PDT)
From: Suraj Sonawane <surajsonawane0215@gmail.com>
To: lee@kernel.org
Cc: angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	pavel@ucw.cz,
	surajsonawane0215@gmail.com
Subject: [PATCH v2] leds: Fix uninitialized variable 'ret' in mt6370_mc_pattern_clear
Date: Wed, 16 Oct 2024 09:51:42 +0530
Message-Id: <20241016042142.8088-1-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015085842.GC8348@google.com>
References: <20241015085842.GC8348@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_212306_632853_79C5D70F 
X-CRM114-Status: GOOD (  11.46  )
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

Fix the uninitialized symbol 'ret' in the function mt6370_mc_pattern_clear
to resolve the following warning:
drivers/leds/rgb/leds-mt6370-rgb.c:604 mt6370_mc_pattern_clear()
error: uninitialized symbol 'ret'.
Initialize 'ret' to 0 to prevent undefined behavior from uninitialized
access.

Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
---
V1 : https://lore.kernel.org/linux-arm-kernel/83572cde-19a1-4089-b02b-361a8ef40bee@gmail.com/T/
V2 : Updated .gitconfig to use the real name "Suraj Sonawane" as per the feedback.

 drivers/leds/rgb/leds-mt6370-rgb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/rgb/leds-mt6370-rgb.c b/drivers/leds/rgb/leds-mt6370-rgb.c
index 10a0b5b45..87805c21e 100644
--- a/drivers/leds/rgb/leds-mt6370-rgb.c
+++ b/drivers/leds/rgb/leds-mt6370-rgb.c
@@ -587,7 +587,7 @@ static inline int mt6370_mc_pattern_clear(struct led_classdev *lcdev)
 	struct mt6370_led *led = container_of(mccdev, struct mt6370_led, mc);
 	struct mt6370_priv *priv = led->priv;
 	struct mc_subled *subled;
-	int i, ret;
+	int i, ret = 0;
 
 	mutex_lock(&led->priv->lock);
 
-- 
2.34.1


