Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCF8C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 09:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zKYjd0dyCrEmRgxONpUvT+Xkif1YW2Ie5BucqWkgw2w=; b=zpVaSUZoT3KtGK
	AzvgalHga0dzcKlPscW8wkiXRWiLgyX/+m/Hvv3S1X6nK2/R1/TUnG4QakbaRhqH/2rmmU86xGljh
	bXozQTPTlgO34siXh5WFVvizvx0VTxh8knntFI2FFOXkSNa6NcyPjJnSIT4srLPjzizTVulVDV136
	q6Ot5lnl0bssWC+pw5keuRii+JUxZSB2YpPRhs16kYXowvVmiikymsm+PalFmLljgwl33MsA6UD2G
	NPiWfCovY6e+z8SL2Mm9KGe4IZmZQHmsGJk51L/i5YSK6vGWhaIvyrwDc/ggPcdS4F39YQuoMaxyc
	p3LyntpGarQDMjscJz4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk0X6-005kCE-4g; Thu, 28 Apr 2022 09:33:56 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk0WX-005jzL-OZ; Thu, 28 Apr 2022 09:33:26 +0000
Received: by mail-pl1-x630.google.com with SMTP id u7so3827330plg.13;
 Thu, 28 Apr 2022 02:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=NM66A5OAYldkjcIb7EpGVNaXhKoeVCq/L19afQaEiL8=;
 b=hh5ezwk8i9ar3NTDhQHy0zyGei9208iSfcYM4YKq7O7K0RrZv8nlLNVmZC5WZjFeyG
 wSX/vbgQt2Owd+lFxbpKWcSA8srI+fqG+qf+la3Z5DnRkViqZk9izZXHExD0DrFrdU6g
 znQ5hG8nP1Qm/IlUv5O9ZnAEjDc0HzgE7Joasu9VCfXtqikXU5Mf1J6AjzQuQCYMFEJX
 8XnAzmx4tNgZn8QLBihX54lO8xfa9WhADOdlOAG/dWZIgCLDmQ7YEYe4LKRiFPa2NU6z
 rjv+mv8su9wKGjN9xhgry1eXts98AoZqtZSFfEafhAowpMyfOrW4ALy/NGCPxvkZWxoh
 4Cfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=NM66A5OAYldkjcIb7EpGVNaXhKoeVCq/L19afQaEiL8=;
 b=6yXwgwvh5nTMzo1QQWzB0a0YnWuRzcizNIgc7e/E1D5Dq5jAQZAf9pPrtIJ3X857c3
 7mj5DpIL2c4keq/BpVQqtGbB5fH7hGr4xfKyN7s+JnJ6iB+kVBphpnzKESEfhc4ZlpMe
 Tm00eM6dMtDs4rXFMnb7abvS2n8JmQ9Bj7y7GhPCdJYoippnh9Z831vxX1YqQAtlpGQz
 jmjw9hW/jEH0z2Nsf1m4iQrdOrY7Hy8GIZkJRImlYwRYg/K9atl/pbLtLHfP0awdLqWu
 ECy0+zNHNPLPS/q3TSyrpKVY3Nm8sMPj4Q2p7rOHulNsOTSTW1la3jqyw0fdrgvbdQEz
 ku8Q==
X-Gm-Message-State: AOAM533fF6sFLUrkz5yG7j+ojyXmnHS8vUA6jrTV5VA41lSB4KZ9c1ER
 tLF3IjOeBdgxLLe67kK2w74QuDOSYqI=
X-Google-Smtp-Source: ABdhPJy/iXJqbVKjkw099C2uzmg24SKXb49S4CmFSCjXdPCaT9YW/nJ4DtvBfrGPZAG8YdZqZYDZvw==
X-Received: by 2002:a17:902:8c81:b0:156:7fee:643b with SMTP id
 t1-20020a1709028c8100b001567fee643bmr32899635plo.59.1651138398072; 
 Thu, 28 Apr 2022 02:33:18 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:569:2b1f:d169:337e:6359:8ff7])
 by smtp.gmail.com with ESMTPSA id
 i66-20020a628745000000b0050d36a5fe70sm15457932pfe.127.2022.04.28.02.33.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Apr 2022 02:33:17 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: pavel@ucw.cz,
	matthias.bgg@gmail.com
Cc: cy_huang@richtek.com, jacek.anaszewski@gmail.com, gene_chen@richtek.com,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] leds: flash: mt6360: Remove unused dependency in Kconfig
Date: Thu, 28 Apr 2022 17:32:43 +0800
Message-Id: <1651138365-17362-3-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1651138365-17362-1-git-send-email-u0084500@gmail.com>
References: <1651138365-17362-1-git-send-email-u0084500@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_023321_843022_624FE7E1 
X-CRM114-Status: GOOD (  11.11  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: ChiYuan Huang <cy_huang@richtek.com>

Kconfig already guarantee LED_CLASS_FLASH will be selected.
Remove useless dependency for LEDS_CLASS/LEDS_CLASS_FLASH.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 drivers/leds/flash/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
index d3eb689..38b325c 100644
--- a/drivers/leds/flash/Kconfig
+++ b/drivers/leds/flash/Kconfig
@@ -50,8 +50,7 @@ config LEDS_MAX77693
 
 config LEDS_MT6360
 	tristate "LED Support for Mediatek MT6360 PMIC"
-	depends on LEDS_CLASS && OF
-	depends on LEDS_CLASS_FLASH || !LEDS_CLASS_FLASH
+	depends on OF
 	depends on LEDS_CLASS_MULTICOLOR || !LEDS_CLASS_MULTICOLOR
 	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
 	depends on MFD_MT6360
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
