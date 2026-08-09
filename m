Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B11BC5AE5D
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2026 16:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQl5PVCGH7sIQlsUqjynV5DnMRSCC9HSJ3vmRORytzI=; b=k0/zkCpbtpARvn2VLem+ZO2Ur8
	EtntYiBvp2YTBUZmfsXEwpixjXKTQc3QoH7jWy8JoOZk8vuAak9Bc00CIt05/ru8PsWmFslea9sa2
	1/eR/33F52AnHnrNnvrILVWJc5QiHtadYfqtWvuVFwBA496Qij+J+2oJJEipfNINa0n1qmbPYzE6F
	tdCF4LteHqWkkj1ncCi9PxtjvZTiuzV8cvDL/jDXeiWMwpZFCg1pzb84NbHnV/waq1BsT03IKed9A
	Xj4mTI1wXw+rpIjU4ee6B/Qu4PY4D7m0I72Atk1mlbYV0XLweUP71fbrS2GXjzvZgSda2/CyZ6k7h
	9RxZcXFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt63N-0000000ATFU-3Xp0;
	Sun, 09 Aug 2026 16:07:13 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt63J-0000000ATAB-1Dhw
	for linux-mediatek@lists.infradead.org;
	Sun, 09 Aug 2026 16:07:10 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso9963145e9.3
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Aug 2026 09:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786291627; x=1786896427; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YQl5PVCGH7sIQlsUqjynV5DnMRSCC9HSJ3vmRORytzI=;
        b=Dgy3wc7iVFt5ufhvkVWfPpw2/Io+VXi2mpELwXjRI8/Xhdo2jz0douq7KK/WxI59Xp
         2glR1FUN+RjeNcdy4hBFOyfMQJ6oEP/swlTL9kVPJ19X6NCnpZvVwjpCeD0Yleix2lsT
         i5uFXT28Qi1M30Xu/EtNaDmvjllmfsU1C+vYdUiN/wcGxqNTEtb2/BpA/PdNECJZGO8h
         G54Y9eDheN5UiGsPgqIWf/OZcyOM3zcJQduHDHrfxUGXn1KG/FWXe5Uv0v0DHgYVd3RY
         0E+P2WnRAutuw4hEYVlvY3wyKwNfb+RwysBnC0WIWdijz9uusOjRdm9bY8IUirUvhXt2
         1QAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786291627; x=1786896427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YQl5PVCGH7sIQlsUqjynV5DnMRSCC9HSJ3vmRORytzI=;
        b=dg3wkeCNe7+azaejyAR7MYhl/Na8AzXhix5WJ7UqeCIgV+MeBoEl8Nei7xeRpTpcDn
         uSY0pSz6I5oE3faRjg1dahOwa5BgTnGZTEmibybB/Po14C7o92hYsw/8ALW8f1ihsy2E
         vTuaLn72TnR4+6kfU9POwTKBXw1yxu50bcMQwC5uyuIRqew5azwtkMpCSZaDbdxrarS1
         9DnqVLTN1UaBxZxv+085Rd5F1iXut0x9OX7qb0osHnDT3+DQEn1qBc53fzSioz6Png6F
         Lo/4D82xjaunrF9aOrGvR2Kmu9T8SwspRsUT/wP5kPkuMOt0fIYVEkyD3W/JEtJUs+zY
         oqyA==
X-Gm-Message-State: AOJu0Yy0ufNn/uPpBt7VOpKAf5FTWluzb9LXlBcEXzNrsq7j/gz+6GFG
	K9VlY7LvowdYo4sC3HydJ3DiHxmR2DqKn6DwrxfVzL3+MsG96R+oB2Y1srGJ5edoNrWk9Q==
X-Gm-Gg: AR+sD13QQRpX58COUxWTXT3QzXj3b6Fflxel640sVHK0kxH3wdzaEvxMkA4ziShKR7f
	EI5AGkDx61raHTolrmxsYesrTrULzHt6HFYyQE7ey1MqnCC1KRWzTeCHSWfpLFvtgi8ZOnYNcN6
	DUbP2jQKvhOmejc5UCGg/DchXNMC8xIpXpgMcqXf2HvrzAhD7GogckiqMOzTXBUIBW8SQG82WQx
	Hg0UMH0K2I4OdC97viusQClgRYhO2GA2+VU/u1wjLHQcgfn0XJQ+5oDBhLUp30WwSQnZaY+And6
	OGHrN1/yBI7t9iSu9+YflSJeS8GIKW15X9lBPQY0yMuG2UqAD+yEes9JQfXYihRmHXQ4eQ932+C
	kMYNoF0ZLmSuOw4j1+IH5eeOOK8Dzx7zGPl8+VDZF1GcHMvISEf7+UX3jMkRVAhofwUnGIBpab4
	4RkinYb2eHjDlgkGX86Wf/St8ZsbWyyuKF+MmmPi5qmXa7kSwZh2X0dg==
X-Received: by 2002:a05:600c:3b88:b0:499:52ab:a50c with SMTP id 5b1f17b1804b1-4996194e24bmr211098485e9.1.1786291627278;
        Sun, 09 Aug 2026 09:07:07 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm209832495e9.4.2026.08.09.09.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 09:07:06 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/8] watchdog: mediatek: Add wdt/toprgu resets for MT6589
Date: Sun,  9 Aug 2026 18:03:26 +0200
Message-ID: <20260809160643.33991-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809160643.33991-1-l.scorcia@gmail.com>
References: <20260809160643.33991-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_090709_336563_29208307 
X-CRM114-Status: GOOD (  12.70  )
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

According to Android sources, MT6589 has 12 reset bits in the
WDT_SWSYSRST register. Populate toprgu_sw_rst_num to allow toprgu resets
in device trees of the many compatible devices.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/watchdog/mtk_wdt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 91d110646e16..e61f6ae74327 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -10,6 +10,7 @@
  */
 
 #include <dt-bindings/reset/mt2712-resets.h>
+#include <dt-bindings/reset/mediatek,mt6589-resets.h>
 #include <dt-bindings/reset/mediatek,mt6735-wdt.h>
 #include <dt-bindings/reset/mediatek,mt6795-resets.h>
 #include <dt-bindings/reset/mt7986-resets.h>
@@ -88,6 +89,10 @@ static const struct mtk_wdt_data mt2712_data = {
 	.toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
 };
 
+static const struct mtk_wdt_data mt6589_data = {
+	.toprgu_sw_rst_num = MT6589_TOPRGU_SW_RST_NUM,
+};
+
 static const struct mtk_wdt_data mt6735_data = {
 	.toprgu_sw_rst_num = MT6735_TOPRGU_RST_NUM,
 };
@@ -493,7 +498,7 @@ static int mtk_wdt_resume(struct device *dev)
 
 static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
-	{ .compatible = "mediatek,mt6589-wdt" },
+	{ .compatible = "mediatek,mt6589-wdt", .data = &mt6589_data },
 	{ .compatible = "mediatek,mt6735-wdt", .data = &mt6735_data },
 	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
-- 
2.43.0


