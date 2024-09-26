Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646D9CEBF60
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 23:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m7h6S8dVKu0rivFQ344WPkvtRjYXL2xD9tqPuM/hQA0=; b=eHm86RWbXjGAKvXxKS1RqIadvl
	zFGF7RNkrAzbtO3+wk+AUwEQvIznBwcOr3lNigTEFCYCPJQEC6ccY91cPIJcWsZflwQh+tL8BZT3J
	QVnJme5GyJbymC9vTbxzy0VL5mLTrM4D/gyLfXRxTv97EJmOOQ/PcCk6p3TbIrubu/U3pyty0Wirs
	aYxke6UVPg8S03IDmEkXVN6nUD3kGjHbxEWVyJlTD0eQh8q+YckzOpS+9JSfLQFeg//WdVPO8Q9gD
	ldlB/zan/RC4kiv8vI5zXzN9ANitLB+bLx2qkEEApcbsY9dY3gW+E1nuTvJ7/wrYKTEqhcqS0XHdE
	z6/RvgZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sty3d-00000009bqZ-1Vv5;
	Thu, 26 Sep 2024 23:38:01 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stxnt-00000009Z2d-0W57;
	Thu, 26 Sep 2024 23:21:46 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a86e9db75b9so235064666b.1;
        Thu, 26 Sep 2024 16:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392903; x=1727997703; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m7h6S8dVKu0rivFQ344WPkvtRjYXL2xD9tqPuM/hQA0=;
        b=fzEYUtEYafeXp1K1Wxnud6vDdbuPhLu//Rokmhhc4g6dUQ7KW5WAaBOHH+T3/du5uY
         o/vlVxR9GXcnJO0yZ+Ph46lC0eyn8YrlIU6rZG8xcmqMe3vavYjFwV8npHqwkqLKlDKM
         ClTgyBnpRmlYLxXMJXoLHTyjYegFaCXfqTiV8kKOL7+44WTzy31av8XrkVCCcDF3ju9o
         uOi6PpPOKzhfSzoSB84AN1JZJuliWwu1SmR8oAw5Eu0YEDtJRJxXOja5W25swHp/1ZFw
         je+YLMwt9ML8ZFHQ1xz2NK/TxYBeTshg/rkLGx/tiFPY8JUVlxCsGM6eO+eko1s2inzZ
         lPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392903; x=1727997703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m7h6S8dVKu0rivFQ344WPkvtRjYXL2xD9tqPuM/hQA0=;
        b=c37qmEe9QMRzhUDXMvMrZ8yeanZacIYGX64leRzd5r9bolq0rY2m9xMOxQaH3k6lPa
         hWQsdhBiqDcgC8yUTy3WuBhCBFzfcI8glJF2GrqTcIG3jG2ynkxl7xYvXYhh6h/Ojju4
         M+eF8OCXio5iC4kmPjccDyTZUDzFryoK02/DYgwNWGtJCmuAF/jOg/x+ZNZbzYr63XBJ
         etWLZZU10djkVOLdBJHVvLrYt7PtTVaanbYBkc/TRLxYGkzwJJgfpNU/Tf/1GqnCIdWA
         L/eDvCszf1hD3YlZK8c6M8C9x2QMWl7iM7C3BGZfqS4L5MEBN4zBdaGvosJU1P/wSZLW
         bcuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAWBn1N5N1VR553N/i3VzcGB4OWOqeVQvsPChYjsoLmmTS2tMeIc6ICBIv41oTl/G1BinaKNkob4eU5qniSWY=@lists.infradead.org, AJvYcCWkNZbUDWWX705iuufKMNuXdQoASqfzmqRb++v1Ujy5A3WK/Csvm6WK6JyNBfi5gBsBixM7MddrHDzhmbjeLqmh@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6l17Wsds3W/rR2RjRWr/bKoIdWYBFftx7RRV+FE8oYmzfiCyJ
	0Z3dAeo7K28+IBAzmT0wVlRcger9a22LoOZJj1wD6vSEygNAsYVpyA7Czc+Y
X-Google-Smtp-Source: AGHT+IGvoYtTRlxo+ZCSr+7IZ7oL03DwfddA8kVTy/0vVLsrqZIZv4yAr3ANwPUYnXfyhoxnViIYyQ==
X-Received: by 2002:a17:907:3fa2:b0:a8d:29b7:ecfd with SMTP id a640c23a62f3a-a93c4aab828mr100357366b.54.1727392902592;
        Thu, 26 Sep 2024 16:21:42 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:41 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:21:03 +0200
Subject: [PATCH 12/18] leds: ns2: switch to
 device_for_each_child_node_scoped()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-12-95c0614b38c8@gmail.com>
References: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
In-Reply-To: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Gene Chen <gene_chen@richtek.com>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=1248;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=Jz/4B/tgbBWqjdHctAGZYjiz0MxFy7WzJiMpp8ER/SE=;
 b=qKqtyfzAGtYGnjb8UqcfA9/S/SX/eIKdm4rVtvNbSdblTDBXwzHMlUAHLJLiyKXWonL5oGDQU
 78Jcr4LvBg5AaqQMyyw/4oVbokWmBpUiGyTqttgSpH73fYZpZIVLpnW
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_162145_230156_611551A3 
X-CRM114-Status: GOOD (  14.12  )
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

Switch to device_for_each_child_node_scoped() to simplify the code by
removing the need for calls to fwnode_handle_put() in the error path.

This also prevents possible memory leaks if new error paths are added
without the required call to fwnode_handle_put().

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/leds-ns2.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index f3010c472bbd..4c6f04a5bd87 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -238,7 +238,6 @@ static int ns2_led_register(struct device *dev, struct fwnode_handle *node,
 static int ns2_led_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct fwnode_handle *child;
 	struct ns2_led *leds;
 	int count;
 	int ret;
@@ -251,12 +250,10 @@ static int ns2_led_probe(struct platform_device *pdev)
 	if (!leds)
 		return -ENOMEM;
 
-	device_for_each_child_node(dev, child) {
+	device_for_each_child_node_scoped(dev, child) {
 		ret = ns2_led_register(dev, child, leds++);
-		if (ret) {
-			fwnode_handle_put(child);
+		if (ret)
 			return ret;
-		}
 	}
 
 	return 0;

-- 
2.43.0


