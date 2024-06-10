Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753D4C27C4F
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jun 2024 22:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gpPyXWTVTerEIWhQ6o8wHto+dQPxy/WMM7tzpvoV1CQ=; b=INV63RVKJjSuleSdPuvSTNZXGZ
	6eXeG581eUfW6nh1+D/GvKTZLwjO87p/6lNBpziIKANt3pUo0IjFG2hyvPhlI+iliXPiBuYiH63wu
	xbi36BnLhMgLUC7Ld4ahkY4XQk+pVQI8L0I3JklS2C+WoGQQ/tNJzihIBOyiEszuJflJvA8E1siM4
	1EJ4NV69biz5/SPKTJRy41zPXX1GjJSmWE/T9Z6vsrcDIzv9P+4sUpaFJIZkbpmR2CGiDexG9iNe3
	HLPJqIAHmccY1XHZ1Uu+gUbArOGO2rd7JOum0zaZ2EhACgrdW92GQo3JNSc+BJQp487A4ZDdNVek5
	CLICCY8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGngp-00000006hq6-3uB4;
	Mon, 10 Jun 2024 22:40:35 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGngn-00000006hoH-1cku;
	Mon, 10 Jun 2024 22:40:34 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-354b722fe81so4296207f8f.3;
        Mon, 10 Jun 2024 15:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718059229; x=1718664029; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gpPyXWTVTerEIWhQ6o8wHto+dQPxy/WMM7tzpvoV1CQ=;
        b=VIQ4T+uNquqUDdfRJDr2lXcOZeZlsHo7+3QX+ogWvV8Hc+rD/ACwWnWiUrI165CqlB
         8aGE9e5xPuUcpm9xYZfR67YrmqT2HNHYtZfWaMteWedi6vHbUVqV1Pie+wMPC6cox0Hx
         0zVm0vYY8T+F8BI3PmoamaropPI9WhZBiKkGX6wYgItf1oXMWJwoBJCHw+ZuUTgO59WW
         3EpGsdFQhFRuE/UU1W5EbFRLZlfJ+PQXWJPPcXhxsNA2/eBjy+AbRgpVVwrhUHoiz/Qg
         0dmcTD+8SKJZcIWNp8B0CXehORxrFOSknajchBA7ssOOn10wYlSh0MvAOh+hEn/XGCv1
         EF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718059229; x=1718664029;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gpPyXWTVTerEIWhQ6o8wHto+dQPxy/WMM7tzpvoV1CQ=;
        b=sfxne+CfmaX9nSist4K5eWJPz3R5aXBmKpRyZxZkB8m/2lX+PbZknWU/yhBacJLIaD
         EO1CHoa0IE0AropGhLsAt2SdQrGipdQoIvKlpmhRa8B6YhlkIEjp9puNI0KeN1tAAYuJ
         UHkokd3dXWyy2EzbZaKkPF0YfhiZZTGi7sd9V9p2612eyq0J3vVU0r6b2Ql9QBEc+fz2
         kujQ+9rlYGoersyt6aNwAdyq3dhuAflhv9v4WRw584cT3njOxujxb62jV6pXMsh3EBAN
         1536yzDM6mpn26gmyKwlL0XhpFDEMgnmjtCSAwDEatpEMGjZza0yxowydRW1BvNJf+A8
         U2jA==
X-Forwarded-Encrypted: i=1; AJvYcCXTy3HA/Yb5OS5UZhLjPjUgTT9NDzjD1iVGynCR6+qNPLlXzCJfrim09PVj61DxTDbHDQS+V64bWcE8AyIWhiOTqB940frNeL/coy3YT1ggjeAYtm4OgOyQzJrrclA9qczVHJ3uVF+W5Uo4TtjyaefxV5zACvavI1U=
X-Gm-Message-State: AOJu0Ywe3MSbAL1tFXZbaUJbgO02ZccE5qccmn98dc9Pi3dflQto2QEs
	7YtDWQfQFxy7m3vuFNLF6TLSxhgxFeCRdEANM+6Yd5mV1noZNLZa
X-Google-Smtp-Source: AGHT+IH4nQiCT9WMClPt604ZYVbJsCXhC4V56JFsZoe2WZyh2Jw0qDjY9RyNp0aFPn3YwnD54yHR8Q==
X-Received: by 2002:a5d:5f8f:0:b0:354:ddba:303a with SMTP id ffacd0b85a97d-35efedd7dbfmr8382883f8f.54.1718059229080;
        Mon, 10 Jun 2024 15:40:29 -0700 (PDT)
Received: from [127.0.1.1] (194-208-201-054.tele.net. [194.208.201.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5d6990csm12131971f8f.58.2024.06.10.15.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 15:40:28 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Tue, 11 Jun 2024 00:40:26 +0200
Subject: [PATCH] leds: mt6360: fix memory leak in
 mt6360_init_isnk_properties()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240611-leds-mt6360-memleak-v1-1-93642eb5011e@gmail.com>
X-B4-Tracking: v=1; b=H4sIANmAZ2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDM0MD3ZzUlGLd3BIzYzMD3dzU3JzUxGxdc4u0xDTjVBNj0yQDJaDOgqL
 UtMwKsKnRsbW1ACiVgOllAAAA
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 stable@vger.kernel.org, Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718059227; l=1877;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=g10dlOBGYYkPLn3+3Cuj4VRZAJwM6Vn3EQdE5kpHkMY=;
 b=cR0LfOzpw4hwGKrOjdhmiXFbXriHLO5gLjMX4rHeP62PmE4NBWzxHdshrumFnOnhMhbrKZA4G
 Kka9SVk2V8DCemwIhzDYLmjD5RxVyuNqg306XZuey5g6snUaJ2g7f2B
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_154033_465441_6FDEE88C 
X-CRM114-Status: GOOD (  15.19  )
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

The fwnode_for_each_child_node() loop requires manual intervention to
decrement the child refcount in case of an early return.

Add the missing calls to fwnode_handle_put(child) to avoid memory leaks
in the error paths.

Cc: stable@vger.kernel.org
Fixes: 679f8652064b ("leds: Add mt6360 driver")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
This bug was found while analyzing the code and I have no real hardware
to validate the fix beyond compilation and static analysis. But given
that the child node is only used to retrieve some properties within the
fwnode_for_each_child_node(), and it is not used outside the loop, the
fix is straightforward.

Nevertheless, any tests to catch regressions with real hardware are
always welcome.

The bug has been around since the driver was added.
---
 drivers/leds/flash/leds-mt6360.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/flash/leds-mt6360.c b/drivers/leds/flash/leds-mt6360.c
index 1b75b4d36834..4c74f1cf01f0 100644
--- a/drivers/leds/flash/leds-mt6360.c
+++ b/drivers/leds/flash/leds-mt6360.c
@@ -643,14 +643,17 @@ static int mt6360_init_isnk_properties(struct mt6360_led *led,
 
 			ret = fwnode_property_read_u32(child, "reg", &reg);
 			if (ret || reg > MT6360_LED_ISNK3 ||
-			    priv->leds_active & BIT(reg))
+			    priv->leds_active & BIT(reg)) {
+				fwnode_handle_put(child);
 				return -EINVAL;
+			}
 
 			ret = fwnode_property_read_u32(child, "color", &color);
 			if (ret) {
 				dev_err(priv->dev,
 					"led %d, no color specified\n",
 					led->led_no);
+				fwnode_handle_put(child);
 				return ret;
 			}
 

---
base-commit: d35b2284e966c0bef3e2182a5c5ea02177dd32e4
change-id: 20240610-leds-mt6360-memleak-78faf3e435b0

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


