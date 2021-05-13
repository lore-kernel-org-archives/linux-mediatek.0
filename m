Return-Path: <SRS0=rIjB=KI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2DDAC433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 02:54:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E5DB61417
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 02:54:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E5DB61417
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ee
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9t3vbWdyXVtjFVotrM+9Zf8uBCn9b4rYsjJJAyw86mw=; b=B33YAMf/JCrA7VH0jkPgVYot6
	PhHaAjwhk8Q6xFKZ472HztXXQoox5HnuJCQ4l928WP7XZMZVTZqUSU8Tt8hbn30eQYU48Rl8dr3ci
	qbl8uYZRoLqCevkZ2Rl5BpQj0QQ0/urgYMp0MqonwB70hGz1P3515wp5NCNXcyB9wFy7aFm3bZhka
	d8DqzbYizGoAizo/k4jpkDveY6jySLLEEVVEk3lHsTM211Gs+BJn9YZoMOEMzlpW7WuJAkjqrONM2
	AjZbpMA+3WyRKsjoETbstgloxs5CjgAsb3uduGVekMtJFv/YWtrsrC+gUcN8ctFdrWg7XB7nzvUdt
	mPMpD2b5A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lh1U4-004ZJY-Oh; Thu, 13 May 2021 02:53:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh1U1-004ZJC-Ei
 for linux-mediatek@desiato.infradead.org; Thu, 13 May 2021 02:53:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=a3qdMWcNRGNozEIBsmkv707sxw6zvIStsCdHcdHgUNo=; b=3yTscVqSKZ9yCcceXtUgQZoGLR
 qBtNnx7hXGedo6p8uv2G0V6NWpLxcCDEQEppKjVAeY2Kl7aYOEsMdEOcJOIXhCAwuEXt+rGlqlu+2
 tZ+QwY/IGrxvWgc/b1aemCnU8ar/IYwIdRxOTg6H2ZnPk6D2pd7XAZKUZc/W/eKWyjMW81y1YNKAI
 ig6WloS9N/fEzNbqf3MNnCC8J2skkIZtWTqnD67mTyh+38+cbnK6cTuyiJf0rilzUawvZcPQiCmRE
 OEXRz8ggKDOmYTWZIcVzYiegr1UG2R8odLl7Dq6eCOTvmu9jEBM14AaoygLrIvgIrnuDzHEaumPPs
 PgjirfbA==;
Received: from eu-shark2.inbox.eu ([195.216.236.82])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh1Ty-00Ayhf-SC
 for linux-mediatek@lists.infradead.org; Thu, 13 May 2021 02:53:52 +0000
Received: from eu-shark2.inbox.eu (localhost [127.0.0.1])
 by eu-shark2-out.inbox.eu (Postfix) with ESMTP id E56C21E00735;
 Thu, 13 May 2021 05:53:48 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.ee; s=20150108;
 t=1620874428; bh=hf7fll+wR710tvsEbGpPR6mYFJy2OFrCdxVYUwh6qKc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=XLtSmJJW9daLWkBNJkCEg/rZ9UB6tAXEbwlVQs3edyVtp+GBWiLn7tH7qnIu6OT/w
 Ze+d73YpReZavcyEB02+HoIcYWmeq+Z1RGRmpmQDe9ufOx25mnx4BFlSujz9mfS30q
 KmRPqXt///5Q2k1hhfsVGypoUM6KnyuifasPBmo4=
Received: from localhost (localhost [127.0.0.1])
 by eu-shark2-in.inbox.eu (Postfix) with ESMTP id DBA6E1E00712;
 Thu, 13 May 2021 05:53:48 +0300 (EEST)
Received: from eu-shark2.inbox.eu ([127.0.0.1])
 by localhost (eu-shark2.inbox.eu [127.0.0.1]) (spamfilter, port 35)
 with ESMTP id eLQBTY2BkmTH; Thu, 13 May 2021 05:53:48 +0300 (EEST)
Received: from mail.inbox.eu (eu-pop1 [127.0.0.1])
 by eu-shark2-in.inbox.eu (Postfix) with ESMTP id 9F7321E0072C;
 Thu, 13 May 2021 05:53:48 +0300 (EEST)
Received: from localhost.localdomain (unknown [134.19.185.34])
 (Authenticated sender: arzamas-16@mail.ee)
 by mail.inbox.eu (Postfix) with ESMTPA id C28191BE011B;
 Thu, 13 May 2021 04:35:21 +0300 (EEST)
From: Boris Lysov <arzamas-16@mail.ee>
To: matthias.bgg@gmail.com,
	linux@roeck-us.net,
	robh+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 3/3] watchdog: mtk_wdt: add support for mt6577
Date: Thu, 13 May 2021 04:35:15 +0300
Message-Id: <20210513013515.31329-4-arzamas-16@mail.ee>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210513013515.31329-1-arzamas-16@mail.ee>
References: <20210513013515.31329-1-arzamas-16@mail.ee>
MIME-Version: 1.0
X-Virus-Scanned: OK
X-ESPOL: 885mlYlKBD+tlF+pRmXdARpV2ydIWeTj+e++1BlagBmJPCuYDTYAEE/3gR8FQALEog==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_195351_097082_5AEAAA3E 
X-CRM114-Status: UNSURE (   9.89  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch adds support for watchdog used by mt6577 and related SoCs such
as mt6575 and mt8317. These watchdogs are known for having shifted WDT_MODE
and SWSYSRST registers and using different SWSYSRST_KEY value.

Signed-off-by: Boris Lysov <arzamas-16@mail.ee>
---
 drivers/watchdog/mtk_wdt.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 0878fa33dffe..91d498b5d212 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -54,6 +54,10 @@
 #define MT2712_SWSYSRST_KEY_SHIFT	24		// unlock_key [31:24]
 #define MT2712_SWSYSRST_KEY		0x88
 
+#define MT6577_WDT_MODE_KEY_SHIFT	8		// unlock_key [15:8]
+#define MT6577_SWSYSRST_KEY_SHIFT	8		// unlock_key [15:8]
+#define MT6577_SWSYSRST_KEY		0x15
+
 #define MT6589_WDT_MODE_KEY_SHIFT	24		// unlock_key [31:24]
 #define MT6589_SWSYSRST_KEY_SHIFT	24		// unlock_key [31:24]
 #define MT6589_SWSYSRST_KEY		0x88
@@ -94,6 +98,13 @@ static const struct mtk_wdt_data mt2712_data = {
 	.wdt_swsys_rst_key =		MT2712_SWSYSRST_KEY,
 };
 
+static const struct mtk_wdt_data mt6577_data = {
+	.toprgu_sw_rst_num =		-1,
+	.wdt_mode_key_shift =		MT6577_WDT_MODE_KEY_SHIFT,
+	.wdt_swsys_rst_key_shift =	MT6577_SWSYSRST_KEY_SHIFT,
+	.wdt_swsys_rst_key =		MT6577_SWSYSRST_KEY,
+};
+
 static const struct mtk_wdt_data mt6589_data = {
 	.toprgu_sw_rst_num =		-1,
 	.wdt_mode_key_shift =		MT6589_WDT_MODE_KEY_SHIFT,
@@ -376,6 +387,7 @@ static int mtk_wdt_resume(struct device *dev)
 
 static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
+	{ .compatible = "mediatek,mt6577-wdt", .data = &mt6577_data },
 	{ .compatible = "mediatek,mt6589-wdt", .data = &mt6589_data },
 	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
 	{ .compatible = "mediatek,mt8192-wdt", .data = &mt8192_data },
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
