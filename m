Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3431C5AC80
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2026 16:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5y+pF9Ye8xkl7BWvjPqf+44InrvFLLZAoR3RziMb21c=; b=wbM7o4Q2NMF4dNj3yMyViwx07V
	ERcPq9wkWlbTm7Q7rxEvQJ+J8A4V80sK9cq4bTeS+Slys0FfrM6OR0hKqkF18kGqAlHRvT0iEiG4B
	9KUzgMy9btrMJLm71f+EDkI3XWz6VnoorDCKw5m9cqn6P4vl+kyOAlFb6S95l9OIXHw95cEuSng31
	WlmNMucuSLsSL2cuQ+CCDO0r2MSPxM3uo8eH8P9h30vJ1kyxlP00zj+RCls4u8Y5M+JCHrjH4/Z9M
	d7O1skJtQRmg2RKjORfdLouHb+j8GlEGNbDmNGDxOwuwAzdgKMRhKdcH2AnKQ6oNTPMrq5uhQY0HS
	DAOY2vZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt63V-0000000ATPt-2u7Z;
	Sun, 09 Aug 2026 16:07:21 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt63S-0000000ATK0-3R5p
	for linux-mediatek@lists.infradead.org;
	Sun, 09 Aug 2026 16:07:19 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso25029025e9.0
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Aug 2026 09:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786291637; x=1786896437; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5y+pF9Ye8xkl7BWvjPqf+44InrvFLLZAoR3RziMb21c=;
        b=ow52XxpvltpKmgD/HeBLj0Tvvg19o1/TaGs/YpX26q+HErmcanc09CBFZYOl/K0hQW
         QD1r5rVeXZ5prsUufPE4HG+kpjo7Z38eG5DO9fbeejCdZ+D4AAp7aBiaKMtjXMjBgOqo
         S18Z937c5IN74JYQD4l1GipZuBb3DaqVvAt2dgZ79x4pux+/aDEov+zrEkoeq4e1sQbO
         5QqEfvg06cCwjpRmsnEWLJezhjqLE1TIhRubUSjBhuzUDFa05iLkS46KjL7O7CpISt5o
         LJVl62IVKYI5Ni95wCnppWpQd7mPSHB4V68NdoYgUZvT/2sVvSS+eIXgzdJPsCQ/VbCR
         Q0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786291637; x=1786896437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5y+pF9Ye8xkl7BWvjPqf+44InrvFLLZAoR3RziMb21c=;
        b=czxiofFG2Iz+b7WSXyhEOB5nT7MoWGOUagk8IvLjeYA0r906kKjxTgko4pca6OngsM
         u/a9PEbLEJiAHd8KE2E7mEi0QM4JnhxUJn9FZTU1La/b2tCerXWzYH6lkU53cEura0Sb
         0YUjZKlSzRMj//X7vngaAu0qbl/1zX8ScYWoxY8uo470bOiROTFGSyra5VQyX4CGzE+V
         wtl0THCFRlhY1Cm2tAGGQCNDqewS1LgcRWW+HS1TfQ+gIii3wWv9ZY+AeoIrZvoKjVqo
         Lc9hWt7qFr3S67O+gpt4Iz3Y2YJlHWhH9frzfKhfn7C5YrQZjMIKwqTAQlLviFIDVMwM
         imxQ==
X-Gm-Message-State: AOJu0Yz2Z4W8B6NhuOMUjD9XxpMPi4axTk7zQ5euly6K3kBF5pKq6Gqu
	vrV3Q6+ryAYtU7Zy2VYTj0aWH4RVfCfxxtlSfp7Ad98FaKHRaUsnFJrADwliWBwiC7K3lQ==
X-Gm-Gg: AR+sD10wKTdxjApfvwpgCkNg6rE847BcYKDtfK1g2ZQVl0VUFTXo8UTyeEZcA/znXj2
	OW3dwESqG0B26wXOWorQLO6D73tb5eDQFeYI6ItCVJOCq+BEmvUISyBj9xDK0pua63dWmXSRV9F
	fb+FJ+eMPj0PTuYlY+omuJP0VSKTeegw6WLJxQD9i3iAhCoVAo9hgVTVcHPRdIJb32xynSD4L/y
	hSQZhDQqKEtIS6BRDfciiPrTYU9wOzmPFbcn87cYOuqykewbeyv5dNl3/619PiLvjlM+kaeV4Ba
	NPf2zyBpKIVDqRr7q8768lDXtTlAb61MD4BkN+42z1raskmCyOAAmNP3wCMbKhElHBU2OxzGuH+
	8uB3qeaTSZncv0nHFmgVeuasGne0EHdOl281j4ioWoPYuWPQ4lREDGx+w/wEB2hbyyn/27YbM/4
	RmRm5vVNIuAHhX8itmOS8cLWyOxD8QFKTE/kTmZYPXPoxrFhva9vx4QA==
X-Received: by 2002:a05:600c:c87:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-49962472d69mr121132385e9.6.1786291636950;
        Sun, 09 Aug 2026 09:07:16 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm209832495e9.4.2026.08.09.09.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 09:07:16 -0700 (PDT)
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
Subject: [PATCH v3 6/8] watchdog: mediatek: Add support for mt8167 TOPRGU/WDT
Date: Sun,  9 Aug 2026 18:03:30 +0200
Message-ID: <20260809160643.33991-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809160643.33991-1-l.scorcia@gmail.com>
References: <20260809160643.33991-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_090718_884249_F7EE0E05 
X-CRM114-Status: GOOD (  11.51  )
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

Add support for the Top Reset Generation Unit/Watchdog Timer found on
mt8167.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/watchdog/mtk_wdt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index e61f6ae74327..10a3d4b5ee30 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -13,6 +13,7 @@
 #include <dt-bindings/reset/mediatek,mt6589-resets.h>
 #include <dt-bindings/reset/mediatek,mt6735-wdt.h>
 #include <dt-bindings/reset/mediatek,mt6795-resets.h>
+#include <dt-bindings/reset/mediatek,mt8167-resets.h>
 #include <dt-bindings/reset/mt7986-resets.h>
 #include <dt-bindings/reset/mt8183-resets.h>
 #include <dt-bindings/reset/mt8186-resets.h>
@@ -110,6 +111,10 @@ static const struct mtk_wdt_data mt7988_data = {
 	.has_swsysrst_en = true,
 };
 
+static const struct mtk_wdt_data mt8167_data = {
+	.toprgu_sw_rst_num = MT8167_TOPRGU_SW_RST_NUM,
+};
+
 static const struct mtk_wdt_data mt8183_data = {
 	.toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
 };
@@ -503,6 +508,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
 	{ .compatible = "mediatek,mt7988-wdt", .data = &mt7988_data },
+	{ .compatible = "mediatek,mt8167-wdt", .data = &mt8167_data },
 	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
 	{ .compatible = "mediatek,mt8186-wdt", .data = &mt8186_data },
 	{ .compatible = "mediatek,mt8188-wdt", .data = &mt8188_data },
-- 
2.43.0


