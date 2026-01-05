Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFE3C2A062
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jan 2026 00:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDFNq4JsZcxs1GGsQxpxUqJ7LLS5xEhchca1DSQB1FY=; b=4B+dtTkaa77zEd3jsNHq6qaoQP
	3EZQVc2Rg/Eq/06xOkJwvyK2c0KuIFruuTqfM3bk2RmXrKlsFoSDm/S79ULhgS7pfZ/aJG+rRWZjM
	q8KieqmfGk3k2gD7ZowdktcjAyDJ7fEK3EvrOE/HSfj3h/kU7/kzvHu3pk+p5ssUYq5xlj2KrfQuc
	hI6zyW5NBJxXL/2sBl38XT+jvkGK2fVr4d+DBi4m9l86w20fIbuEqk994fH/Z1pmW4NGmxxjJn42I
	yeXexnz0/Srwityyw681e3D+moyHWV/bmIZQwhsgt7ZmbPv7MD8JtiFsP0CzVTJ8nLPRMSd+Hm3ia
	i3WwQj6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcYR4-0000000AZxf-1gG7;
	Mon, 05 Jan 2026 00:27:02 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcYR2-0000000AZuH-0ciU
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jan 2026 00:27:01 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7bab7c997eeso15730668b3a.0
        for <linux-mediatek@lists.infradead.org>; Sun, 04 Jan 2026 16:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767572819; x=1768177619; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDFNq4JsZcxs1GGsQxpxUqJ7LLS5xEhchca1DSQB1FY=;
        b=fy2o7qYZ4c6Dsi7R4h8rhdyRNo9eQzRfRvapaUQMUvONYmNtcdYuv7XlGpRg8U5Arz
         1edFkBUOdzbdttkEyr51IGEqkcIHOk+So6WvfHy3I9Ai47k8uK4u4fmaPR2C8aRWSMWC
         PPyVuV7VVKxuom+BJG22tDcGNPXwQYCuVKb4W2XstZblGLfXrXJuwREcV8w7oyCWPQmz
         QCAaXhbZgx6kKG5r2pgwf/9MbvcE9amoCl243HUtXrZ3Y5LiMjBhhC3FCK3qWGeV5BAM
         EUo0oR2sqwHGs7g2K5t3ELNMEqU10p8J8K6hVR9DXsQGezPjuEWgTsc/oMJHYvjW1esX
         lrnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767572819; x=1768177619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NDFNq4JsZcxs1GGsQxpxUqJ7LLS5xEhchca1DSQB1FY=;
        b=naCNx+EQXC3uaJaAIpYElsI2GLiIyA5lw5lbnZiD5vCz3HOofm7rjs4Mf/8TWHbGja
         Z5OpiGUgmcjX3goCz/BhUcw6foZ8S7rh6eT+pcRIFJWIeTRV1xxMHC8q6qjGj6zTy6zP
         DEGMs0F86fr7bufxikSjWmrAujh2aHn1s8WMvjqd19KNg0MmvEcvG6RjDygDbf+XceKM
         GLPJKv/UxdjU+szHXQCfw1P/8N1XNEDUSXJH2sZ4mmz7vojFkGuEkzbm92eicvBcSPro
         s47kMwh3SmYxFJjwhCig70/Ub8bnNNf6bMhUCdJSHdqvEq0krkBvqXxu2nf984I6b5zK
         9hZg==
X-Forwarded-Encrypted: i=1; AJvYcCXePBTGIfFqAKWRBSOY9ylb9kwbJLXxq3ydGqUVfhCABlSYvZ5PnUVuVuq/9VfhSy/F+BsSUEmz7MQgeLIzGg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ6fzOQQ2ZrM5UMGiTsd1ZmF03Xo3ihtjViH0ebdphz1F1YXJ6
	shN4qDxDw+9clHpbfaFOjkDqYlkIXCzbFI+K4lgkmU7oArlw+MjAL6jd
X-Gm-Gg: AY/fxX5GMa+NeFJ68YKP8bL3PiWxPJe6nxvEx//ULVic7hYN5bm9Vam5w6SIOyMKRXQ
	tEFq5cQzpaSNosq79auVeUFaEVQy2G94g+2k/E3j2egVU0RCX1aV4zQOE0emvkMGtKTt0u5XTPO
	Pe8n5Nhy5YMKfhRH8ZV9Y9Bq1ELMjsdDm+W7eZRknF2Y0FPtpgeHfRnLxqwTZWJY52Afh24mvF1
	HKjsgim62BjfYP2UsksvYxHrSg1oh5dSZONQ5QeOgFbZJ3BA6dAUx4tnbdaIvOgxUALQ6JFmwbz
	mUAl7SZ4H8yWIlRqw0ROsVkK1Preriqpa8TGJXBAso5Q1CteiuZJJ11qZJgnP7Lw7RZncTx3Lry
	xGAuaHDLc7JjhPR+Zc7FohpkKY6zhDQNn1lM+ko6LQ95yyRga9HmczwHAL6CGc/o1sqsVGvObxr
	yHgkFB4kA8iocO5uqukmrDFfFoNHb9OjiUCHNGPQJ7ZF6MH09Ob7vhPO4bPGMmJBpqDOLFTMg56
	Q==
X-Google-Smtp-Source: AGHT+IGeeKmkZlgIpVZni90ulNKu2CTVrD//QHX+vZIPY7voqHaSNcphqKMalZRbGAYUw9J3u9/Low==
X-Received: by 2002:a05:7022:eac1:b0:11d:c91e:3b58 with SMTP id a92af1059eb24-121722e9e26mr38779723c88.39.1767572819190;
        Sun, 04 Jan 2026 16:26:59 -0800 (PST)
Received: from zubuntu.bengal-mercat.ts.net ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724de268sm133378109c88.8.2026.01.04.16.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 16:26:58 -0800 (PST)
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
Subject: [PATCH 08/17] wifi: mt76: mt7925: add error handling for BSS info in key setup
Date: Sun,  4 Jan 2026 16:26:29 -0800
Message-ID: <20260105002638.668723-9-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105002638.668723-1-zbowling@gmail.com>
References: <20260102200524.290779-1-zbowling@gmail.com>
 <20260105002638.668723-1-zbowling@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_162700_198652_DCED12A8 
X-CRM114-Status: GOOD (  12.63  )
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

Check return value of mt7925_mcu_add_bss_info() in mt7925_set_link_key()
when setting up cipher for the first time and propagate errors.

The BSS info update with cipher information must succeed before key
programming can proceed. If this MCU command fails, continuing with
key setup would program keys into the firmware for a BSS that does not
have the correct cipher configuration.

SECURITY NOTE: Silent failure here is particularly dangerous because
the user would believe encryption is active when the firmware may not
have the cipher properly configured, potentially resulting in
unencrypted or incorrectly encrypted traffic. This ensures the error
is propagated up the stack rather than silently ignored.

Reported-by: Zac Bowling <zac@zacbowling.com>
Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index a7e1e673c4bc..058394b2e067 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -637,8 +637,10 @@ static int mt7925_set_link_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 		struct mt792x_phy *phy = mt792x_hw_phy(hw);
 
 		mconf->mt76.cipher = mt7925_mcu_get_cipher(key->cipher);
-		mt7925_mcu_add_bss_info(phy, mconf->mt76.ctx, link_conf,
-					link_sta, true);
+		err = mt7925_mcu_add_bss_info(phy, mconf->mt76.ctx, link_conf,
+					      link_sta, true);
+		if (err)
+			goto out;
 	}
 
 	if (cmd == SET_KEY)
-- 
2.51.0


