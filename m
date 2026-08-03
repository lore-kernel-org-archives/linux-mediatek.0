Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDABAC55179
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 14:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wn8DGKA5kSavmCRKRx9MyxFXC5hjjcK6hiv7Zc2G8KI=; b=oUWFr9oV8/2PA1V5vCZFJlViGK
	I8x+I9+fV0CD8MV+fwpguzWMc5i0fBqUo1CjPd4tP/aQMH9tqexaRsRzf55N4CIlB8SdVBAVk30vX
	tEITrCpbcJiZ2EgiJNTbGMUvx1V4puRx8QzTQFALkRuSUof2eYo4BqtKA3ZRIQj/vJTZMZLEewKEo
	8vg9WJuP3/G50zR2vM3PWZNFBA1nN0fAlptA7buFauLFnsoGjPrr9fFRvnP7pmp8AWqFsqXxL9TUl
	yxROKOlp44FZmQxWk6hlUikEoD9jT6CrSNvlmHDUG77rQJ4j14bASUfMtOJcH7g93g3e0s/Psbhai
	fZfrzKSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUP-0000000HK8x-3FRY;
	Mon, 03 Aug 2026 14:18:01 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUN-0000000HK5c-2nY3
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Aug 2026 14:18:01 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-381b831d535so3844251a91.0
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 07:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766678; x=1786371478; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wn8DGKA5kSavmCRKRx9MyxFXC5hjjcK6hiv7Zc2G8KI=;
        b=BGjfK8w5mYc6WdBVh9HWo5+oPwzjSBaQBQBx3ITxFdquP4DqYpSOooU4hrD8izitAk
         Ach1dQGxLNvuMEgnG8V5Ds9kKf8Nw88dchqN6d8S77TmzJBKJcWsRqU0h4/vq/EBYQpc
         BrGAsi1Tmfu31mdbRaDlOcmoaauMv02cbdQ+m6VBSpKLkbUf53eX0zYSleWeVriCuUYE
         UbjD0Z7EV8mgJmRbn9ywZGOISjcvUTZn6bb4lDYv+hV4ZO0KSSB61AJ30NyHjGwAT+Tu
         KOYvG8pL6UPoSqop3GkwTheWuhsc79y2CPAfOGoS8O9X9gWlaYNjSJkb7XDoDtz9Qzw3
         9gVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766678; x=1786371478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wn8DGKA5kSavmCRKRx9MyxFXC5hjjcK6hiv7Zc2G8KI=;
        b=NmPXh0lHcoiX1c6VR7aioiYve/BUl1QtTTn0pLik1Lv02MfyUr55H9FBu5Pbr208My
         Oq+6cLe6WQg4RoZ36YTlkcUC3c/AM3GWsZu72wxDLmGlZvI9mM79Acf5x1U4Uapu5HjH
         2cF8jhd+kqIjFQEJp9E0ktA6Poc967upIaqoMTt8Zbl1mVAJa+E4qnQC0/9GInfmk+Jh
         csPBGC8JPt63YmJ1ENiaoU4ZDFfmrjJs/pdT6xZiXfVOl69e8XwOKd4nxeHprYuPjjTa
         2xMg6897ZSbukPao0x356YbrihV6GESnD5mKdOxoLn1+iMUF+F2yBfJRDUaQQYGY80yQ
         ALKw==
X-Forwarded-Encrypted: i=1; AHgh+RpOUUxRwyQ2LfzlwQlmxV2JT2DQZv3fZQ27/NjArXUi0SNlMP1XYQhLps/62a/llCC4ZMRsY1wugAW3Q41M1Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNc13ELpEFcVbz6NAYW+QiwuVqXb3xtxU9jFbJD/p6zCut+J/N
	1w53gLWbNDZxT5P7Dfx2UFbyy5ah4xBFFO+jVyLptacjDeLJUZ+js85K
X-Gm-Gg: AR+sD10gJVSECBaOyBNyWBl10weRYXKJhixGeflKi/uoROdVnB/5RwXnH9gJD2EXeId
	mkB/liDAGnKd1J3YgChbUt+oHBUmRKlKgjGGvNfviAh++t9mQEMqGkHvZiYaOnAUJ8hfz65Fz9h
	FYAuSdcdtKSxV+eaYelIrS/Q+mSu391yOOcErSFb9BG0fe53OrCcZ1SkWxBxyK3znNXlb8NYPVq
	LO8GcjFwd5NgWrjlrsdIM8mAYTccV6UXYYaTcaKj8kDB6yEKQ93D697Si/HWeXq1VDz4eDPrP9r
	i/JLeJY94/6JcHc+GfZUmlplyIFj7qAFiBJh6LkQYK1tZtCM7PkCzXjZjsN7XqtC/ehIJaZZ937
	fvmez5AbykETXj5royfoOc2WzetXD+fNhF2lgVtiyNf0gCjoiw/xemxxXhGz+gUIwkc1Dg1O3e7
	UmBiUK1Jg48W0qzWrwcFUUEAnc4aMpQORrAE5tcmmUTQ9GexYf8yZXZzvHrbyh4u1Y/bqIYN8vw
	Vbw9oD82c9pGbF0Aqqp8eDUbV6oGxdh
X-Received: by 2002:a17:90b:590d:b0:368:af5c:5925 with SMTP id 98e67ed59e1d1-38fbc4d0204mr9749689a91.23.1785766678572;
        Mon, 03 Aug 2026 07:17:58 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:17:58 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Kees Cook <kees@kernel.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Sam Shih <sam.shih@mediatek.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	netdev@vger.kernel.org (open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:\b|_)ptp(?:\b|_)),
	stable@vger.kernel.org
Subject: [PATCH 07/32] clk: mediatek: mt6735: Add missing MODULE_DEVICE_TABLE()
Date: Mon,  3 Aug 2026 23:16:34 +0900
Message-ID: <20260803141659.559129-8-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071759_957316_DB5CBF95 
X-CRM114-Status: GOOD (  12.26  )
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

Add MODULE_DEVICE_TABLE() to the MT6735 clock drivers (imgsys, mfgcfg,
vdecsys, vencsys) to export the Device Tree matching tables.
This is required so that the clock drivers can be automatically loaded
when built as modules.

Fixes: 0bd9b1211f74 ("clk: mediatek: Add drivers for MT6735 syscon clock and reset controllers")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt6735-imgsys.c  | 1 +
 drivers/clk/mediatek/clk-mt6735-mfgcfg.c  | 1 +
 drivers/clk/mediatek/clk-mt6735-vdecsys.c | 1 +
 drivers/clk/mediatek/clk-mt6735-vencsys.c | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt6735-imgsys.c b/drivers/clk/mediatek/clk-mt6735-imgsys.c
index c564f8f72432..813241d526cf 100644
--- a/drivers/clk/mediatek/clk-mt6735-imgsys.c
+++ b/drivers/clk/mediatek/clk-mt6735-imgsys.c
@@ -41,6 +41,7 @@ static const struct of_device_id of_match_mt6735_imgsys[] = {
 	{ .compatible = "mediatek,mt6735-imgsys", .data = &imgsys_clks },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_mt6735_imgsys);
 
 static struct platform_driver clk_mt6735_imgsys = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt6735-mfgcfg.c b/drivers/clk/mediatek/clk-mt6735-mfgcfg.c
index 1f5aedddf209..8a18ee244a4d 100644
--- a/drivers/clk/mediatek/clk-mt6735-mfgcfg.c
+++ b/drivers/clk/mediatek/clk-mt6735-mfgcfg.c
@@ -45,6 +45,7 @@ static const struct of_device_id of_match_mt6735_mfgcfg[] = {
 	{ .compatible = "mediatek,mt6735-mfgcfg", .data = &mfgcfg_clks },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_mt6735_mfgcfg);
 
 static struct platform_driver clk_mt6735_mfgcfg = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt6735-vdecsys.c b/drivers/clk/mediatek/clk-mt6735-vdecsys.c
index 8817085fc1db..d53ebf92e878 100644
--- a/drivers/clk/mediatek/clk-mt6735-vdecsys.c
+++ b/drivers/clk/mediatek/clk-mt6735-vdecsys.c
@@ -63,6 +63,7 @@ static const struct of_device_id of_match_mt6735_vdecsys[] = {
 	{ .compatible = "mediatek,mt6735-vdecsys", .data = &vdecsys_clks },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_mt6735_vdecsys);
 
 static struct platform_driver clk_mt6735_vdecsys = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt6735-vencsys.c b/drivers/clk/mediatek/clk-mt6735-vencsys.c
index 8dec7f98492a..64ba9da9fd42 100644
--- a/drivers/clk/mediatek/clk-mt6735-vencsys.c
+++ b/drivers/clk/mediatek/clk-mt6735-vencsys.c
@@ -37,6 +37,7 @@ static const struct of_device_id of_match_mt6735_vencsys[] = {
 	{ .compatible = "mediatek,mt6735-vencsys", .data = &vencsys_clks },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_mt6735_vencsys);
 
 static struct platform_driver clk_mt6735_vencsys = {
 	.probe = mtk_clk_simple_probe,
-- 
2.55.0


