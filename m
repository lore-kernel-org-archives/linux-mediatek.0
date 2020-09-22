Return-Path: <SRS0=fRkw=C7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC54C4363D
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 16:42:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65C2B205CB
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 16:42:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lLLxbF9o";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHH5oKhl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65C2B205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EGacgJ6tLqeEI+VvI1qscmHlRl7fytgUtVBpWhNje04=; b=lLLxbF9oZEaaSgpBnB6208Ze3f
	O9Vgbyscej1oC8NvC31bt0ZOZsUD99LW4eoS8XtD+whrfIn1ylmDWJ3GD3EUPZcYp5VTHGKRS8/+w
	qCKT4yp3bKMb+JWlDuhQ+2K4/DL/xjpQMkCmGGy/CW3pkPH5xycAeQc1kVGaNin5NJeLnuqZqTP2/
	uApZTpX1DAsRS8rSR4W4rdhfXJ9PWsT6LDUxFjzZ/FooJbGZqsoEB9YaEbv9gitzfanw8hnWYKlMf
	jWCHzDbzNP+YfNuvuQMLzOtiHviuwL+xduH//TDq63SuKAWm5CEC1oBHyL3+7eI6EDbBR5mFVxbXm
	yegBplBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKlNO-0004t2-9O; Tue, 22 Sep 2020 16:42:46 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKlNL-0004sQ-7N; Tue, 22 Sep 2020 16:42:44 +0000
Received: by mail-pf1-x444.google.com with SMTP id k13so12458266pfg.1;
 Tue, 22 Sep 2020 09:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/fereSFqQtjNeg8le7K5lDKrvGxQoj/bAVfQwm0po3c=;
 b=dHH5oKhlEoh4J5N9ZkuGH1q+o9Mv03A8VbhRlhG1M7oRzS54iA5dhkOFP4CW6JYsRD
 Oy38Xwl0kFZq3/tbc9PqdocHb5kCa9JyK1zav5+xu9QMmvf/DempF6dL1o7r43aMPhRd
 LL/GrwJsndWrXr1o/6w1GPQ4muBJzMGj7aJfB2JAujOZGdeeufeYODJj1KJgxFG7UpyZ
 Vey43XDNPRXShaR0aK4kWsNhpUbhbnM+LwrSLl/5c14D9O41p53VZd7O9OTvpxfqCprT
 iauy957xP5c1bbv03/Lp6uOaYqOC3CQfSnx1xODwSfgeVM++6+6DoeXNVRltxTsBDJRy
 ieoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/fereSFqQtjNeg8le7K5lDKrvGxQoj/bAVfQwm0po3c=;
 b=K8PlgDm/2/k7RDbD9xnWZoLUtWFxa+Sg001RXtGKdb5kNJBleQn2jR9l2ln44GzS69
 hAd76v+mcEDMTB4ck52Au/DiZZNP05W9oo+YC98NG0GiEz/gFnhSHGSsKWPzrJjOHvqS
 Tdb2QIQBHLKT+sIsu1pLxB6EOMV05TTkEMprEdMRFm86WWVapdMc8HIX2muvjdkcYkD2
 fm9/v5TCnsBKo95jYUFMsBIxvamX/h05gUvk7th/j0b2hr+IESH72JdrIr2rhQ6EJpdp
 skmXjYrQV7DfbnyzTuc+0jH0+z/x+hGhR1lNHJHumKhVYtlt/8hK6yzu8QmLBgbERJwh
 r6mA==
X-Gm-Message-State: AOAM530/FQ27HclKqvc01cX16ak+Py5V+K4qTVZ6P5lQkmNJU6eiFCH/
 UkkptopE4pLBBmgtJnAi6+M=
X-Google-Smtp-Source: ABdhPJzNUr1KXDsOg1ICr+4Gd0VWK+0LvoxG3I/dDawxGVcR3vfhTqOAt1Vr61Xae1xYBfgt+J+cdQ==
X-Received: by 2002:a17:902:b117:b029:d1:e5e7:bdf5 with SMTP id
 q23-20020a170902b117b02900d1e5e7bdf5mr5221747plr.85.1600792960666; 
 Tue, 22 Sep 2020 09:42:40 -0700 (PDT)
Received: from guoguo-omen.lan ([156.96.148.94])
 by smtp.gmail.com with ESMTPSA id gj6sm2869768pjb.10.2020.09.22.09.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 09:42:40 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-gpio@vger.kernel.org
Subject: [PATCH] pinctrl: mediatek: mt7622: add antsel pins/groups
Date: Wed, 23 Sep 2020 00:41:57 +0800
Message-Id: <20200922164159.120920-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_124243_307672_56B5E2D9 
X-CRM114-Status: GOOD (  13.39  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Chuanhong Guo <gch981213@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

These pins are named ANTSEL[0~29] in datasheet and are used by wmac for
various functions.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt7622.c | 103 ++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7622.c b/drivers/pinctrl/mediatek/pinctrl-mt7622.c
index ce4a8a0cc19cb..38c5e166fd0f6 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7622.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7622.c
@@ -263,6 +263,68 @@ static const struct mtk_pin_desc mt7622_pins[] = {
  * hardware probably has multiple combinations of these pinouts.
  */
 
+/* ANTSEL */
+static int mt7622_antsel0_pins[] = { 91, };
+static int mt7622_antsel0_funcs[] = { 5, };
+static int mt7622_antsel1_pins[] = { 92, };
+static int mt7622_antsel1_funcs[] = { 5, };
+static int mt7622_antsel2_pins[] = { 93, };
+static int mt7622_antsel2_funcs[] = { 5, };
+static int mt7622_antsel3_pins[] = { 94, };
+static int mt7622_antsel3_funcs[] = { 5, };
+static int mt7622_antsel4_pins[] = { 95, };
+static int mt7622_antsel4_funcs[] = { 5, };
+static int mt7622_antsel5_pins[] = { 96, };
+static int mt7622_antsel5_funcs[] = { 5, };
+static int mt7622_antsel6_pins[] = { 97, };
+static int mt7622_antsel6_funcs[] = { 5, };
+static int mt7622_antsel7_pins[] = { 98, };
+static int mt7622_antsel7_funcs[] = { 5, };
+static int mt7622_antsel8_pins[] = { 99, };
+static int mt7622_antsel8_funcs[] = { 5, };
+static int mt7622_antsel9_pins[] = { 100, };
+static int mt7622_antsel9_funcs[] = { 5, };
+static int mt7622_antsel10_pins[] = { 101, };
+static int mt7622_antsel10_funcs[] = { 5, };
+static int mt7622_antsel11_pins[] = { 102, };
+static int mt7622_antsel11_funcs[] = { 5, };
+static int mt7622_antsel12_pins[] = { 73, };
+static int mt7622_antsel12_funcs[] = { 5, };
+static int mt7622_antsel13_pins[] = { 74, };
+static int mt7622_antsel13_funcs[] = { 5, };
+static int mt7622_antsel14_pins[] = { 75, };
+static int mt7622_antsel14_funcs[] = { 5, };
+static int mt7622_antsel15_pins[] = { 76, };
+static int mt7622_antsel15_funcs[] = { 5, };
+static int mt7622_antsel16_pins[] = { 77, };
+static int mt7622_antsel16_funcs[] = { 5, };
+static int mt7622_antsel17_pins[] = { 22, };
+static int mt7622_antsel17_funcs[] = { 5, };
+static int mt7622_antsel18_pins[] = { 79, };
+static int mt7622_antsel18_funcs[] = { 5, };
+static int mt7622_antsel19_pins[] = { 80, };
+static int mt7622_antsel19_funcs[] = { 5, };
+static int mt7622_antsel20_pins[] = { 81, };
+static int mt7622_antsel20_funcs[] = { 5, };
+static int mt7622_antsel21_pins[] = { 82, };
+static int mt7622_antsel21_funcs[] = { 5, };
+static int mt7622_antsel22_pins[] = { 14, };
+static int mt7622_antsel22_funcs[] = { 5, };
+static int mt7622_antsel23_pins[] = { 15, };
+static int mt7622_antsel23_funcs[] = { 5, };
+static int mt7622_antsel24_pins[] = { 16, };
+static int mt7622_antsel24_funcs[] = { 5, };
+static int mt7622_antsel25_pins[] = { 17, };
+static int mt7622_antsel25_funcs[] = { 5, };
+static int mt7622_antsel26_pins[] = { 18, };
+static int mt7622_antsel26_funcs[] = { 5, };
+static int mt7622_antsel27_pins[] = { 19, };
+static int mt7622_antsel27_funcs[] = { 5, };
+static int mt7622_antsel28_pins[] = { 20, };
+static int mt7622_antsel28_funcs[] = { 5, };
+static int mt7622_antsel29_pins[] = { 21, };
+static int mt7622_antsel29_funcs[] = { 5, };
+
 /* EMMC */
 static int mt7622_emmc_pins[] = { 40, 41, 42, 43, 44, 45, 47, 48, 49, 50, };
 static int mt7622_emmc_funcs[] = { 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, };
@@ -543,6 +605,36 @@ static int mt7622_wled_pins[] = { 85, };
 static int mt7622_wled_funcs[] = { 0, };
 
 static const struct group_desc mt7622_groups[] = {
+	PINCTRL_PIN_GROUP("antsel0", mt7622_antsel0),
+	PINCTRL_PIN_GROUP("antsel1", mt7622_antsel1),
+	PINCTRL_PIN_GROUP("antsel2", mt7622_antsel2),
+	PINCTRL_PIN_GROUP("antsel3", mt7622_antsel3),
+	PINCTRL_PIN_GROUP("antsel4", mt7622_antsel4),
+	PINCTRL_PIN_GROUP("antsel5", mt7622_antsel5),
+	PINCTRL_PIN_GROUP("antsel6", mt7622_antsel6),
+	PINCTRL_PIN_GROUP("antsel7", mt7622_antsel7),
+	PINCTRL_PIN_GROUP("antsel8", mt7622_antsel8),
+	PINCTRL_PIN_GROUP("antsel9", mt7622_antsel9),
+	PINCTRL_PIN_GROUP("antsel10", mt7622_antsel10),
+	PINCTRL_PIN_GROUP("antsel11", mt7622_antsel11),
+	PINCTRL_PIN_GROUP("antsel12", mt7622_antsel12),
+	PINCTRL_PIN_GROUP("antsel13", mt7622_antsel13),
+	PINCTRL_PIN_GROUP("antsel14", mt7622_antsel14),
+	PINCTRL_PIN_GROUP("antsel15", mt7622_antsel15),
+	PINCTRL_PIN_GROUP("antsel16", mt7622_antsel16),
+	PINCTRL_PIN_GROUP("antsel17", mt7622_antsel17),
+	PINCTRL_PIN_GROUP("antsel18", mt7622_antsel18),
+	PINCTRL_PIN_GROUP("antsel19", mt7622_antsel19),
+	PINCTRL_PIN_GROUP("antsel20", mt7622_antsel20),
+	PINCTRL_PIN_GROUP("antsel21", mt7622_antsel21),
+	PINCTRL_PIN_GROUP("antsel22", mt7622_antsel22),
+	PINCTRL_PIN_GROUP("antsel23", mt7622_antsel23),
+	PINCTRL_PIN_GROUP("antsel24", mt7622_antsel24),
+	PINCTRL_PIN_GROUP("antsel25", mt7622_antsel25),
+	PINCTRL_PIN_GROUP("antsel26", mt7622_antsel26),
+	PINCTRL_PIN_GROUP("antsel27", mt7622_antsel27),
+	PINCTRL_PIN_GROUP("antsel28", mt7622_antsel28),
+	PINCTRL_PIN_GROUP("antsel29", mt7622_antsel29),
 	PINCTRL_PIN_GROUP("emmc", mt7622_emmc),
 	PINCTRL_PIN_GROUP("emmc_rst", mt7622_emmc_rst),
 	PINCTRL_PIN_GROUP("ephy_leds", mt7622_ephy_leds),
@@ -663,6 +755,16 @@ static const struct group_desc mt7622_groups[] = {
 /* Joint those groups owning the same capability in user point of view which
  * allows that people tend to use through the device tree.
  */
+static const char *mt7622_antsel_groups[] = { "antsel0", "antsel1", "antsel2",
+					      "antsel3", "antsel4", "antsel5",
+					      "antsel6", "antsel7", "antsel8",
+					      "antsel9", "antsel10", "antsel11",
+					      "antsel12", "antsel13", "antsel14",
+					      "antsel15", "antsel16", "antsel17",
+					      "antsel18", "antsel19", "antsel20",
+					      "antsel21", "antsel22", "antsel23",
+					      "antsel24", "antsel25", "antsel26",
+					      "antsel27", "antsel28", "antsel29",};
 static const char *mt7622_emmc_groups[] = { "emmc", "emmc_rst", };
 static const char *mt7622_ethernet_groups[] = { "esw", "esw_p0_p1",
 						"esw_p2_p3_p4", "mdc_mdio",
@@ -732,6 +834,7 @@ static const char *mt7622_uart_groups[] = { "uart0_0_tx_rx",
 static const char *mt7622_wdt_groups[] = { "watchdog", };
 
 static const struct function_desc mt7622_functions[] = {
+	{"antsel", mt7622_antsel_groups, ARRAY_SIZE(mt7622_antsel_groups)},
 	{"emmc", mt7622_emmc_groups, ARRAY_SIZE(mt7622_emmc_groups)},
 	{"eth",	mt7622_ethernet_groups, ARRAY_SIZE(mt7622_ethernet_groups)},
 	{"i2c", mt7622_i2c_groups, ARRAY_SIZE(mt7622_i2c_groups)},
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
