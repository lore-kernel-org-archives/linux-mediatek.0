Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33222C4332F
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Dec 2022 07:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qW/27kubUFpaxaOf02qg0YXS4Zdvi6+3F6Dpzx62HS8=; b=rKmUln/ih5v7OX69HuEwnA2HlT
	RXLfzFifU4rxkw7misweu9D3yq7OlIwdbzTZoClKDzfka62NwLrAiWYV7c00SjYbV/UllplUnW6ri
	8UVNIRfmsRG9B9w+zTaZMc83bW4b6r7Jp4TmbARQr8eNL35M/gO418NHqlsq/DVzIDOvgMJZfAus1
	YENvkwvbYeTpunri0cjCVqTyCHEgSMdfQTxLadPncfkat2Ig+mzgApRAwZxpxtwtj7GrBfZeLb6wX
	Jf7X8E4Zzqw6kBz0L1nMWofBtph8hP3+vC+3OjNSTNbCBkpif03LLLkJp/jCdXNlNlPnd3QL7zulF
	6vrB664A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8z1p-00G175-1L; Sat, 24 Dec 2022 07:33:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8tLy-00DM8O-VP; Sat, 24 Dec 2022 01:29:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2BA1861BFB;
	Sat, 24 Dec 2022 01:29:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 527D0C433D2;
	Sat, 24 Dec 2022 01:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671845373;
	bh=lBhMjyqba6UmeXmmASfMf0Dt/Mc49zYeOYUelEyqc90=;
	h=From:To:Cc:Subject:Date:From;
	b=chI0cn0u4ZB/wLLNd65HOT7mwJDIvVbUS5YrjCk13mBXTEFWNJkmNiKnXU8enmpTp
	 8K4GmwxZVFqjka93ggC7DlaOnTT/M9zj0g9DJaFR1DTuGLwA1Z+kLnlOxH4YtHSKvw
	 xMYtLUN+tGJIjpUojYp2EGcR6SRf34Tf9fJuXvbMTCP+/ku0ZiAJPKSspNIad46y0C
	 q5OsEoUcYCxHKWy6pNzs6ANW0qpYHvHUWbZK0xTE431x5bFfTbkJuNPNY2YlfP6U4a
	 uxc8f0BGJ/RI+HgiB/xYM8JTfthqpWAS/67Nbtjo5WNpr3Es0/CfSNz8WXYdCvGaLZ
	 DOT6PaqpQ324Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	brgl@bgdev.pl,
	matthias.bgg@gmail.com,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.1 01/26] gpiolib: of: add a quirk for legacy names in Mediatek mt2701-cs42448
Date: Fri, 23 Dec 2022 20:29:05 -0500
Message-Id: <20221224012930.392358-1-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_172935_122494_5C2F9FA2 
X-CRM114-Status: GOOD (  14.37  )
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

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

[ Upstream commit 326c3753a6358ffab607749ea0aa95d1d0ad79b0 ]

The driver is using non-standard "i2s1-in-sel-gpio1" and
"i2s1-in-sel-gpio2" names to describe its gpios. In preparation to
converting to the standard naming (i2s1-in-sel-gpios) and switching the
driver to gpiod API add a quirk to gpiolib to keep compatibility with
existing DTSes.

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpio/gpiolib-of.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 0e4e1291604d..cef4f6634125 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -488,6 +488,38 @@ static struct gpio_desc *of_find_usb_gpio(struct device_node *np,
 	return of_get_named_gpiod_flags(np, con_id, idx, of_flags);
 }
 
+static struct gpio_desc *of_find_mt2701_gpio(struct device_node *np,
+					     const char *con_id,
+					     unsigned int idx,
+					     enum of_gpio_flags *of_flags)
+{
+	struct gpio_desc *desc;
+	const char *legacy_id;
+
+	if (!IS_ENABLED(CONFIG_SND_SOC_MT2701_CS42448))
+		return ERR_PTR(-ENOENT);
+
+	if (!of_device_is_compatible(np, "mediatek,mt2701-cs42448-machine"))
+		return ERR_PTR(-ENOENT);
+
+	if (!con_id || strcmp(con_id, "i2s1-in-sel"))
+		return ERR_PTR(-ENOENT);
+
+	if (idx == 0)
+		legacy_id = "i2s1-in-sel-gpio1";
+	else if (idx == 1)
+		legacy_id = "i2s1-in-sel-gpio2";
+	else
+		return ERR_PTR(-ENOENT);
+
+	desc = of_get_named_gpiod_flags(np, legacy_id, 0, of_flags);
+	if (!gpiod_not_found(desc))
+		pr_info("%s is using legacy gpio name '%s' instead of '%s-gpios'\n",
+			of_node_full_name(np), legacy_id, con_id);
+
+	return desc;
+}
+
 typedef struct gpio_desc *(*of_find_gpio_quirk)(struct device_node *np,
 						const char *con_id,
 						unsigned int idx,
@@ -498,6 +530,7 @@ static const of_find_gpio_quirk of_find_gpio_quirks[] = {
 	of_find_regulator_gpio,
 	of_find_arizona_gpio,
 	of_find_usb_gpio,
+	of_find_mt2701_gpio,
 	NULL
 };
 
-- 
2.35.1


