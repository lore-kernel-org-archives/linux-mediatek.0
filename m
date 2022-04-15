Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C53C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 16:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p836I2rb+PA0oCXqLiJ3WtzSQS9IylSdCpZUwkH37MU=; b=pEiSByajEvW9CB
	lDPuBO5LzdaLv5WtpWsm9BbOXekyBSMbhdxTDGQafAK9ftdh/mfDkAL5P4m/t7xhRQMt6L/krtLf7
	Kh7EThqrxtDGt21Qm15AVnZGNOpVEVW0pNnpT378g2mp4oL0w3LsAis+3spoVzy3N0gehpqjoq/hk
	l0G2lTCZF7BKKHSTnPbWryBOay3+Y+SJSnQB1g7hdYbgzRc0zIzvrFB9xywPgbbCr0jqOTye5KGJA
	dYRrKsy71ps3SakdOwNDwBjRpeKyIXlQ1kfihxGRa9VghZ1FvXt55mS7KUyFjbiMA4taZ/nNeY/0v
	eO/7B3QY1rBKXdQAukMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfOVg-00AoO8-EL; Fri, 15 Apr 2022 16:09:24 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfO0L-00AbPp-TL
 for linux-mediatek@lists.infradead.org; Fri, 15 Apr 2022 15:37:03 +0000
Received: by mail-wr1-x42b.google.com with SMTP id q3so10419580wrj.7
 for <linux-mediatek@lists.infradead.org>; Fri, 15 Apr 2022 08:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xf7zHgQF0LLYfyyhuEnZersihES6pOQgkISOqNV5ZRE=;
 b=xivuA2t3IqjLqIoQ9DSn1tMrItfP5C3kkoXLWvVqH9w2x08/1vOWwiFUeLyckHqQK7
 vANKxFbdrzik52hMtA8dmDDfP8zN7cEsf9psBAV4fFw2IJW5Kvi4WRQ2n/bblCJuagqX
 Fx2zCKxwYqijw8U0R9G7lFq7pqV1zofoFDnhFiXRcsiY7ce9odvnfWaF+Xl/pC+ND3BI
 94009nqeRJk3aFoGdIfdNXKhsJVSntrjRHiXylMsry0pwSVWdSSy1imAEcESzwkERfWP
 /NTB7H2oOoKDjiZnSwpJOA1R4z6V80qfUkxCKmYlepQLh57UdDOVMVKPzzPnAfsys7fJ
 kb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xf7zHgQF0LLYfyyhuEnZersihES6pOQgkISOqNV5ZRE=;
 b=xTpM/03e38pmEcX9yjwB9qbrIBYCY5DF1azqkk8nlDcCKIK4s02lmQD1lBsLqRp8R0
 TLbNfJWlcspmchfSm1MUfVG9jamKlDhyW0tR39M0gtBx+REZU8qb9kqdwRuF58sIOWmC
 gqRjdiVMGynGzTI+u7375ww3Whx1JEqu/73ozog/gc5wMdvRU7+lDLsVyZBScFtXGbcC
 33Xe4StGwKph/s+FWcgcUidJ9G2owKVGK0xwwhp1jHdK3md/kbT9aZASrQAKstDz0G7R
 DKGaT4iUvoiXJS4uJcM+fadYi6Vign6HVuX2YDHOaXb9NLmnD+OowsvFdYqSvesD9lXT
 gwuQ==
X-Gm-Message-State: AOAM531uSLUHPkhl+uJBr6Sko+YHQ1EIT4Lq8toJfZQbuv2TlNyeFyWq
 I0xuFelyBSLTuMFCRbhsvuatYKVEJXEGdA==
X-Google-Smtp-Source: ABdhPJxQk5vHua4beVYxWbc+1z+j8NCqUCbLO9KGJcNxCFujTtigBhehGKkQbFGNgxlKqJVhVZebFA==
X-Received: by 2002:a05:6000:1684:b0:209:7fda:e3a with SMTP id
 y4-20020a056000168400b002097fda0e3amr5705338wrd.709.1650037020002; 
 Fri, 15 Apr 2022 08:37:00 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id
 c24-20020a7bc018000000b0038a18068cf5sm8459292wmb.15.2022.04.15.08.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 08:36:59 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] mfd: mt6397-core: add resources for PMIC keys for MT6359
Date: Fri, 15 Apr 2022 17:36:25 +0200
Message-Id: <20220415153629.1817202-4-fparent@baylibre.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220415153629.1817202-1-fparent@baylibre.com>
References: <20220415153629.1817202-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_083701_979966_AF770A11 
X-CRM114-Status: GOOD (  11.89  )
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

Add the MFD resources in order to be able to probe and use the keyboard
driver for the MT6359 PMIC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/mfd/mt6397-core.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index bddb40054b9e..1a368ad08f58 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -54,6 +54,13 @@ static const struct resource mt6358_keys_resources[] = {
 	DEFINE_RES_IRQ_NAMED(MT6358_IRQ_HOMEKEY_R, "homekey_r"),
 };
 
+static const struct resource mt6359_keys_resources[] = {
+	DEFINE_RES_IRQ_NAMED(MT6359_IRQ_PWRKEY, "powerkey"),
+	DEFINE_RES_IRQ_NAMED(MT6359_IRQ_HOMEKEY, "homekey"),
+	DEFINE_RES_IRQ_NAMED(MT6359_IRQ_PWRKEY_R, "powerkey_r"),
+	DEFINE_RES_IRQ_NAMED(MT6359_IRQ_HOMEKEY_R, "homekey_r"),
+};
+
 static const struct resource mt6323_keys_resources[] = {
 	DEFINE_RES_IRQ_NAMED(MT6323_IRQ_STATUS_PWRKEY, "powerkey"),
 	DEFINE_RES_IRQ_NAMED(MT6323_IRQ_STATUS_FCHRKEY, "homekey"),
@@ -122,6 +129,12 @@ static const struct mfd_cell mt6359_devs[] = {
 		.of_compatible = "mediatek,mt6358-rtc",
 	},
 	{ .name = "mt6359-sound", },
+	{
+		.name = "mtk-pmic-keys",
+		.num_resources = ARRAY_SIZE(mt6359_keys_resources),
+		.resources = mt6359_keys_resources,
+		.of_compatible = "mediatek,mt6359-keys"
+	},
 };
 
 static const struct mfd_cell mt6397_devs[] = {
-- 
2.35.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
