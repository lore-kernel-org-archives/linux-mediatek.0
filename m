Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DC1C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 11:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ae+7PNWPHlmmGDw6gY4bPSs27/URAf22o1jpBWoJ07I=; b=FL6DbzvPVS21I2
	3cHeoGe5CA0HtZsw6UK2ofpWg11RkTOFSeROZ5PYeZlXzgkLgE4FtLjMWs+1jQdkdEtGM+2+10R4g
	DOMRENqly7i7YUaE2GLYAHyD+H357S8HUIvNjw4+idqm3RynBgZVj4RwunoDQXHX0LyA5lKiJVmF7
	R6DJkLBQxKBpSKL5bknhrVImpDyiPUD84bK5SSdPjmw38imVmRmdHKY0DUm0hZ5n3qqV65QAoxm3q
	wbuFec5Dae32J+TCMg/mIx08hERNH1gXvd+jbjG087O+ffvqt9WTaZY4JC9dEhVg3cnjTBimO+Al3
	VUy38xhudono7j3BeKBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7FFE-00G0Js-7i; Tue, 11 Jan 2022 11:23:16 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7FEr-00G09h-MQ
 for linux-mediatek@lists.infradead.org; Tue, 11 Jan 2022 11:22:55 +0000
Received: by mail-pl1-x62d.google.com with SMTP id w7so16630310plp.13
 for <linux-mediatek@lists.infradead.org>; Tue, 11 Jan 2022 03:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EMXmZlFguOt5qjM8Mju3XqareZLrVjvBoxrDlqW40Jg=;
 b=UFLB81h0iX3ZqYtdi07F/FwaSLK2hfrLHRXrm+quboO7VeHcwM5jwLhqE6NRgJ68Mm
 oqkmGHi0Tdk3gJKKrvD93cjMflMetaaCsTxWcDVX6A7icNVuGxJ+RZwWL+V0cK9L5FMx
 Cpv4tzns3Z9SVuL6P+y5hNNuU7+/6YWG9fuUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EMXmZlFguOt5qjM8Mju3XqareZLrVjvBoxrDlqW40Jg=;
 b=32IPobi+/sCRa8hFuAexqRwkByYAupsSlTAiNwMJcXqouT/7XabQrKkaftQWHYfX9R
 HJ3YYsJFVpA1aP/EOrms7PN6S43l+DvBnQTfMo8vWr4K6nOdwXVuMJBR9bLBTgUmxJdX
 ja69P5dqcIftXmkZnYg0zhvWQpOEUu5j1ZQs1NAseCv7Eu8sWcBv/59HN163jw4EUCjs
 Aap10OjhWsDqDWkLzjXi808iKKGuH0YF0M3ccjuHKYavy4KxDEKPOxSSNwd7gXKh4hku
 aazFRwg7y+5fzLr74UDDsiICMiQHVlxx4ulsAbHY4bNg5Iku1ml5b50IR8KIer2t1+oS
 E1Pg==
X-Gm-Message-State: AOAM532FrDBiHNJBrhvksdvlguDiI5uRuQcDaH7snWWdIKGq8HGKkgm/
 92svlL6pFEOD3LQnosUy8l1MuQ==
X-Google-Smtp-Source: ABdhPJyGUCS1OeFe84DG12JyMqhdck1JEx4lgTsvVydKsQtX3NxZFt66NL+LGUYUbSR71Xtv63tKYA==
X-Received: by 2002:a17:902:7c05:b0:149:a3b4:934c with SMTP id
 x5-20020a1709027c0500b00149a3b4934cmr3888753pll.42.1641900171738; 
 Tue, 11 Jan 2022 03:22:51 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:e7ee:1824:8575:bc5c])
 by smtp.gmail.com with ESMTPSA id f9sm2053845pjh.18.2022.01.11.03.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 03:22:51 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Guodong Liu <guodong.liu@mediatek.com>
Subject: [PATCH 1/7] pinctrl: pinconf-generic: Print arguments for bias-pull-*
Date: Tue, 11 Jan 2022 19:22:38 +0800
Message-Id: <20220111112244.1483783-2-wenst@chromium.org>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
In-Reply-To: <20220111112244.1483783-1-wenst@chromium.org>
References: <20220111112244.1483783-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_032253_761525_5226F178 
X-CRM114-Status: GOOD (  10.57  )
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

The bias-pull-* properties, or PIN_CONFIG_BIAS_PULL_* pin config
parameters, accept optional arguments in ohms denoting the strength of
the pin bias.

Print these values out in debugfs as well.

Fixes: eec450713e5c ("pinctrl: pinconf-generic: Add flag to print arguments")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pinctrl/pinconf-generic.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index f8edcc88ac01..415d1df8f46a 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -30,10 +30,10 @@ static const struct pin_config_item conf_items[] = {
 	PCONFDUMP(PIN_CONFIG_BIAS_BUS_HOLD, "input bias bus hold", NULL, false),
 	PCONFDUMP(PIN_CONFIG_BIAS_DISABLE, "input bias disabled", NULL, false),
 	PCONFDUMP(PIN_CONFIG_BIAS_HIGH_IMPEDANCE, "input bias high impedance", NULL, false),
-	PCONFDUMP(PIN_CONFIG_BIAS_PULL_DOWN, "input bias pull down", NULL, false),
+	PCONFDUMP(PIN_CONFIG_BIAS_PULL_DOWN, "input bias pull down", "ohms", true),
 	PCONFDUMP(PIN_CONFIG_BIAS_PULL_PIN_DEFAULT,
-				"input bias pull to pin specific state", NULL, false),
-	PCONFDUMP(PIN_CONFIG_BIAS_PULL_UP, "input bias pull up", NULL, false),
+				"input bias pull to pin specific state", "ohms", true),
+	PCONFDUMP(PIN_CONFIG_BIAS_PULL_UP, "input bias pull up", "ohms", true),
 	PCONFDUMP(PIN_CONFIG_DRIVE_OPEN_DRAIN, "output drive open drain", NULL, false),
 	PCONFDUMP(PIN_CONFIG_DRIVE_OPEN_SOURCE, "output drive open source", NULL, false),
 	PCONFDUMP(PIN_CONFIG_DRIVE_PUSH_PULL, "output drive push pull", NULL, false),
-- 
2.34.1.575.g55b058a8bb-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
