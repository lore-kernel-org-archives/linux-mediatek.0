Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC99D3C92A
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Oct 2024 18:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oC94XqAfObW7gsifgeU8sWbkg+sAsaXMzC798gctVto=; b=Ugk8lmjP99emJBt26PKlDkB2cY
	uYNZ5fvkQpj5O5AdoKIMBY2vvJbDa8eWbG5G3ba8ZYEg5Q40mxGbaSM+iM7qhUIjZQPzqNxDqAHP7
	02mbSgefl+ebMahLzOqNxJgNw0KGS23+ACVMmQvEKO1G4xLpnq+KX+hNGptQIWQoRcjrDLLm3nFOc
	OZgk5OcDikqi/0Ef7x2E3aWIfi0PvRNs/xmpkNv0ytHuzVkA65+Y0YE5jOrdhn+tX5TcKZ6s3fxLu
	P+v+M6l2SQlKI3WuJPxf4pGs8FGESuyFFGluFDPLTt+M90reo5cIBgbfkc+cNJ12Qg7Mxt5x5nUTp
	725Z8+ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2ajA-00000005GKV-1qKL;
	Sun, 20 Oct 2024 18:32:32 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2ae7-00000005FqY-3PCs;
	Sun, 20 Oct 2024 18:27:21 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4314c452180so31701775e9.0;
        Sun, 20 Oct 2024 11:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729448837; x=1730053637; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oC94XqAfObW7gsifgeU8sWbkg+sAsaXMzC798gctVto=;
        b=istYBLleJEh8tq5i/qBZ5sfavl6BtllXzf4hPIoCGRIVqWa8oBpt6ucnUtQ1jtVnUi
         NBhdA4bDBHrOWFJZeI26YSSOePjk6bwngh37BGTj2qQ+VpowcwsRIxrpEzg8yi/GLaHz
         8oK1eNjRT4PxpjV7jR6/cLnR6cKsVxfEFciiesDo/k5pP/PuGpJDCqKHgUB4jtrLwVe3
         BfQ+LF54vruXzZ00mlcGDVPSsQ9fjP/34AYYEmOOYANUPL8VTvN6yn3KEMxkQv9CRXfq
         3cqqrHJWWfjGpayGlQ+nKwKpd3HtzhEy+h34lzcOmDGoAy8edQSYuh9dO+bu7CSRxPCh
         FCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729448837; x=1730053637;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oC94XqAfObW7gsifgeU8sWbkg+sAsaXMzC798gctVto=;
        b=vkuPg2H1iRZHNPYkz0Lj2aflaat13JAWqaegtH9/RsjPLdJ3cg2M6IIS1vrpqK7QlG
         3vcfcVuDRtxejb5mkROsrVPqMlHfLrJTnGmgHmcCw0mPD+p3r8Kuh1AzJnVIAmE1E1EQ
         g1VZaGRMKY3sesfaE6eDIqPrlntI2rH6zlO40ntws60UIgwcS6OoIDJbikZopSbm4Ssv
         tA0Pl1eaM6S+NZYyWRSWY+kXCCBjJAO6WcTAco9OUv3fTbN9O8YVJ6Li6/BXq/nrK5s/
         q5MTmunPzVItXXN7R0bFLDL8sPHn2NV+VRHiCVhWmkZwQYhySbPo15Qyxplx/O6xmuUG
         22Tg==
X-Forwarded-Encrypted: i=1; AJvYcCUnL8xbHZz6Axq/f3e5YNrAoiJFe6b6xTpDceKarEKN2Kw3psEa8rmAYK8l4qAowVldnq/H44aaKFlanS4n8t7rUw==@lists.infradead.org, AJvYcCVyf4jJ/RHMtYlKqYcUXuhYjbMGLJ36eUfd2HmyKjOcb6HVxN5arYOkGmHHn7uzyOLZeLmx9iJ67I/NbI9UsNI=@lists.infradead.org, AJvYcCXn1AbABkXbPLvyJdHFYZnhTNuK9MWlE1EIMfSBbqXk3waPInGVsJf0CHNw+AWTF6rCdRYI8zb5lKE3i+Eiaycz@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/QxJGeWgr4C0M/3rg0MxBFINwVYGTYfCrpkZRz7IRFIWb0I02
	cLebMfXakPfLmLlGEPrkXsyTim0mwmDmpyK5ouCZeNbhNEqCfIValwS27Rr8
X-Google-Smtp-Source: AGHT+IEM3cXnu7Szl4hCwHLN8wVFsmNZ4NIEh7q1lVGN/TNryiPhzRMZ+nRPrTxss73+eZIvE3gk5w==
X-Received: by 2002:a05:600c:1d27:b0:431:44aa:ee2c with SMTP id 5b1f17b1804b1-4316163bb0bmr55994265e9.9.1729448837337;
        Sun, 20 Oct 2024 11:27:17 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-6b9f-98af-2a5c-6ed2.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:6b9f:98af:2a5c:6ed2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f58af90sm31023845e9.21.2024.10.20.11.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 11:27:16 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Sun, 20 Oct 2024 20:27:13 +0200
Subject: [PATCH v2] Input: sparcspkr - use cleanup facility for device_node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241020-input_automate_of_node_put-v2-1-ddec58b4b99e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIBLFWcC/33NSw6DIBSF4a2YOy4N0Ee0o+6jMQTxojepYABNG
 8PeS03HHf5n8J0NIgbCCLdqg4ArRfKuhDxUYEbtBmTUlwbJ5Vlw3jBy85KUXpKfdELlrXK+R1V
 GJjqNjb0YLvsGCjAHtPTa8UdbeqSYfHjvX6v4rj9W8H/sKhhn2JmrFKfadra+D5Om59H4Cdqc8
 wc8IiUWxAAAAA==
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729448835; l=1854;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=Ww13dvSbpLS1CRSU7TPVVRBFuyPAJT0QbJBdP+1IZ8s=;
 b=4JJ/8rNbRS5CDLSsjceGOzrXN95Je/MHjDmrnycsm3LBmxcv6W1rD4Kud8D3RuxIWD1xGrIml
 i4ByO0r4793Bt9BGAEzqktKDKifH7g0va6oGud7Buk3Csn5Wl2gpBxs
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_112719_895025_266065E7 
X-CRM114-Status: GOOD (  13.36  )
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

Use the 'free(device_node)' macro to simplify the code by automatically
freeing the device node, which removes the need for explicit calls to
'of_node_put()'.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Changes in v2:
- rebase onto input/next, drop applied patches.
- sparcspkr: drop goto before node declaration and return -ENOMEM.
- Link to v1: https://lore.kernel.org/r/20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com
---
 drivers/input/misc/sparcspkr.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/input/misc/sparcspkr.c b/drivers/input/misc/sparcspkr.c
index ff7b6291894a..66ddea9a203a 100644
--- a/drivers/input/misc/sparcspkr.c
+++ b/drivers/input/misc/sparcspkr.c
@@ -182,25 +182,23 @@ static int bbc_beep_probe(struct platform_device *op)
 {
 	struct sparcspkr_state *state;
 	struct bbc_beep_info *info;
-	struct device_node *dp;
-	int err = -ENOMEM;
+	int err;
 
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
 	if (!state)
-		goto out_err;
+		return -ENOMEM;
 
 	state->name = "Sparc BBC Speaker";
 	state->event = bbc_spkr_event;
 	spin_lock_init(&state->lock);
 
-	dp = of_find_node_by_path("/");
 	err = -ENODEV;
+	struct device_node *dp __free(device_node) = of_find_node_by_path("/");
 	if (!dp)
 		goto out_free;
 
 	info = &state->u.bbc;
 	info->clock_freq = of_getintprop_default(dp, "clock-frequency", 0);
-	of_node_put(dp);
 	if (!info->clock_freq)
 		goto out_free;
 
@@ -221,7 +219,6 @@ static int bbc_beep_probe(struct platform_device *op)
 
 out_free:
 	kfree(state);
-out_err:
 	return err;
 }
 

---
base-commit: 00850d7b542aa4a8240cf977d43dc6d2158e48d7
change-id: 20241009-input_automate_of_node_put-1bae9f5c02d9

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


