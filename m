Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2490EC79F82
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2026 17:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GoJVdgu3OR1hm3Ux9hMLG80GY2W7JeBpJE05sP2z1ao=; b=So/LT4eBNdm/xuG0el8G+d+nBM
	ATjK0wVx2N2rTAUlFHZi5syblEsG/EB7TY59+LgumaKvI32qaRR1y3YXvMWIBw3GTApNX6EwmZobV
	ZZsP7PZnv9KswQ8+daly6zk3bR+l3ApANUFfipQHTjafmVlqXz+pmITwLHOEV0PqGbB9Vh3KX5sDs
	gAX77S5ZUwCRpQbecAeFc91rm4FOz4sTkacn3CEdHJEadevnCd0DbbT0K+7JKyWZsaxyB8EUU0bvX
	QxpGQVhJTTk3Imqd11tQX13zfF9z9UQYR7PvHSs6CDWM/SefwzxhE7nsJfQIzVNoYKzjsqRghN6v6
	4dmCf6aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zrx-00000009rqE-0ErQ;
	Tue, 08 Sep 2026 17:44:29 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zru-00000009rnb-1mjR
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Sep 2026 17:44:28 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso3565976f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Sep 2026 10:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788889464; x=1789494264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GoJVdgu3OR1hm3Ux9hMLG80GY2W7JeBpJE05sP2z1ao=;
        b=N/b3PdeEt8Do7Fd/iFinhGzyOSXUeL6oyHQ8S0qVv/7hxBK5gxSWqaF+zxbPWKIJG3
         UeJe4kc/fDRLQ/REIc7gN3LvAet1N0YR0ukx8ArZTFczTPQlkLEqDHLexA63Wo04C2lT
         zeHAYcrkWos6vDekSPAE7LjXd0lkAQm/m8zAe2oC13/iodju1gA6pZT4qcYBVOPxTnFz
         mLS1ufEKqPd/ni829Yvtfih1q+3gabRPBnJ09MFs6meD4lRWHY+n0/ccjVYVDdipJ3cE
         l91ZlYH2RMfnwnMhtXayWyb+E1GRfRtSgnK7ChkzsxDFzQ3nxgH9zqM1iJjV74SHAF5P
         ebVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889464; x=1789494264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GoJVdgu3OR1hm3Ux9hMLG80GY2W7JeBpJE05sP2z1ao=;
        b=FdcubHeFBFl9yvfUQyDrnHwCcJgZB4Eg4Hho8jCQhE1bwiA99OPKweehgLm2GJZKsw
         4AMrJ8P9GSfQgzLJQNiA87wAWiSKTpBr+UnKD9UiCqh5Pxi9nJBqgZ/Ay9XqJoQ0RABZ
         RROTubhb70o1dIDN9+JhuB9+fbDtuU4RevM5/Pep4uech9TN4SyXuETlwv9Kl0+G1tXg
         rf7ynlLra3/gmPQQiD6u8AaGXqDhmscu2OV0gxRoVKSUdBDnFXYCShtv6730PUJYsbwJ
         D9EIxFq43/dliictHU8oO9X8+a7ufTtRxqShB7w7DtZwdDmRw+j87JI8F29nkW8c9zhC
         lxrA==
X-Gm-Message-State: AFuF++nhkMJ/wFHIWhlVZG5ZR696B6emZidLS0NSeSUtq0ePNFoAewIt
	zV6zFdDA7E1yPyPs77/J11BfFNY+5gD9pLjCTQNOy/kwRKhnKQPx5xC9mNEvvXFz
X-Gm-Gg: AYBFou3iaWzbTWm6PW4VP7L78XI9mCstVEYUFsV7qKRxPaaW9T07txqH4qo8EXS2PV+
	9tLsMZeb94gM94YAPwkXED3N2oLVUKIu9JgXIopcykOR+o1fd8wd4VGw9uuDTWgWFpe8A8ouxni
	oq5d7jfdF67v6rbXZUKkSPTmlTgYo2XYNNLjEhXzMQYfWzKCtkOVeTBSX1e8RL4EuvLBuAVxAQW
	art033m2cFXC6gNWyLhRk4elQRq+X6WG4knNvrY8mshE23HVQQT6PFHlMLFQffgBIOefsW5noaz
	9gRqujMbsISb0xdau0/kkjOSckmZEc7WdZ3W/N/8Xbl74UGurPXXAdkaF94on+SuXvt3voPVJfT
	v46CVve6TYMSpE2e8OP/o9t5VRgX0Eqm9ThCU34AMX2oeJ6ve6dxbdcoXZftzuk2kEFwYYQqQuP
	2oZ39Xq/zZXDrbDAgMTuUYrub5MdedjOd654W3LrAglMszWFGFsXnpR9GXng==
X-Received: by 2002:a05:600c:3b0e:b0:49c:fc6e:a3d5 with SMTP id 5b1f17b1804b1-49cfc6ea726mr268044365e9.20.1788889464237;
        Tue, 08 Sep 2026 10:44:24 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm487081105e9.15.2026.09.08.10.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:44:23 -0700 (PDT)
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
Subject: [PATCH v5 1/8] watchdog: mediatek: Add wdt/toprgu resets for mt6589
Date: Tue,  8 Sep 2026 19:38:28 +0200
Message-ID: <20260908174259.9009-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908174259.9009-1-l.scorcia@gmail.com>
References: <20260908174259.9009-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_104426_475131_A3846EF7 
X-CRM114-Status: GOOD (  13.22  )
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

According to Android sources, mt6589 has 12 reset bits in the
WDT_SWSYSRST register. Populate toprgu_sw_rst_num to allow toprgu resets
in device trees of the many compatible devices.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/watchdog/mtk_wdt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index d9c30e4c80e3..d609f0fa35e3 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -64,6 +64,7 @@
 #define DRV_NAME		"mtk-wdt"
 #define DRV_VERSION		"1.0"
 
+#define MT6589_TOPRGU_SW_RST_NUM	12
 #define MT7988_TOPRGU_SW_RST_NUM	24
 
 static bool nowayout = WATCHDOG_NOWAYOUT;
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


