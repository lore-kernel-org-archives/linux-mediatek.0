Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B003C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jan 2024 12:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/nhSNer/yVL2skacLugz8NMKxcIl7PuX2VC9t+mugzE=; b=iFs9w1w08+A2Nza4mWr9I+xHte
	O6ONFG4m/uIvefjZi6EeEFiQPWx0Dvyb5YHLycQDaGScxCzD29Bus7J4W1e2Dy5YE4Be4kiJXfrhJ
	ovdvSwdx62o3bKh3Tll1N3jHjXA/fXYwvrnWmCTx5DCuIr/Gdy7aJdw/LtMgcgJUNybabi+IG+fME
	YHJVHzwkX3ukhHSP4O4LQhxGiPUbcg/pzlusRNZXT2WJYbIVtknJ75JWr7BgSHbr0eEi9nyLR20ch
	J1LSlmXe1uXU7Ja3qrVR+UD6HQdXYS1OoCBSDMfDLzxankOnb+79qbtmsPEY/LF2IMIupyeZbzaWg
	noIPzvoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMoR4-004zk2-1d;
	Mon, 08 Jan 2024 12:08:54 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMoR1-004zia-0I
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Jan 2024 12:08:52 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6d9af1f52bcso402518b3a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 08 Jan 2024 04:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1704715726; x=1705320526; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/nhSNer/yVL2skacLugz8NMKxcIl7PuX2VC9t+mugzE=;
        b=rmn4Wsi147mv+Vw6S8v0Ovtr/7X80MI8Mc+iE0ejIJtvySsdMUJS2q0mfQT2zfdXrD
         FohFPlp/HpGa/S+jli5VCUbF9rP36YcPTLaE+bMx8T8WRD2IuWEgQJkAcBeBSrxTCPnS
         mXHNqTdrfwSExag4hLMmxW6JbIR1TXJc9K9ofDovyLJ1rilUFaTAxHNIMK0NK/eBh+cz
         BQ+x0DrBVDDS2H+3CgPPLd0Z8TmAKw5Vun04Xdm7fWrfMCUxYyMg67a6+DcwLlDrltZl
         vYF4NnDllwGLsd22oFl/pN4uxaeCrUjR/oZAgDEAiX1qasFZelycf1Az/pIcRlwmgEBC
         pluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704715726; x=1705320526;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/nhSNer/yVL2skacLugz8NMKxcIl7PuX2VC9t+mugzE=;
        b=JM4pcuu7y+o7u5pROGgpDGf9YzIGtWaa97KwHr9IDTJwTDj9+LgynmdBTMfK4Xy41j
         si3h+ZAiAjeJDzGoUbTKbCM3wbuMICDpy0gxFGhQkAyhAT76TE9IJdaQf+x06Fywk/ri
         Ik0up2F/LuoQKD/7DN7VlJl06uFRKxrwpx9E6q/i6uzqTCPZ0RnrwfuYs2H0nFWaGVCQ
         rqo8WA5LpJx5eRRFlekR8962JsgE+8Xfw1HQqpOXN7gMoTRnJ+Nfc/Jb4WlkjZrzTitM
         G6NcBESP7I3+3r7BkpWaauDTKgZesqxmp/GdTVgx3OaoxbZeF0OOgLf9b/1YAnVI5k26
         ctbg==
X-Gm-Message-State: AOJu0YxYOoopLF3R6lSILELtAp52bZlPraZMID3uffaa/ARrXdNopeQs
	w0oUYqUifr020P0vFwtliBp17S8BXrHIsg==
X-Google-Smtp-Source: AGHT+IGoSAHza6f/gGxUz5CpIyLUVbg/lQJL20KAwRWxJsjEjnYmktGVhaUdgtsbKhHhbOmGjmZD1g==
X-Received: by 2002:aa7:9215:0:b0:6d9:bb52:9977 with SMTP id 21-20020aa79215000000b006d9bb529977mr1033162pfo.11.1704715726415;
        Mon, 08 Jan 2024 04:08:46 -0800 (PST)
Received: from chromeos.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id fb13-20020a056a002d8d00b006d9aa6592d0sm5822588pfb.82.2024.01.08.04.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 04:08:45 -0800 (PST)
From: Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>
To: broonie@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org,
	Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>
Subject: [PATCH] spi: spi-mt65xx: Support sleep pin control
Date: Mon,  8 Jan 2024 20:08:02 +0800
Message-Id: <20240108120802.7601-1-zhouruihai@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_040851_329856_2080195B 
X-CRM114-Status: UNSURE (   9.19  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Supports configuring sleep pin control during system suspend to prevent
potential power leakage and additional power consumption.

Signed-off-by: Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>
---
 drivers/spi/spi-mt65xx.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 8d5d170d49cc..8d4633b353ee 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/gpio/consumer.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/platform_data/spi-mt65xx.h>
 #include <linux/pm_runtime.h>
@@ -1316,6 +1317,8 @@ static int mtk_spi_suspend(struct device *dev)
 		clk_disable_unprepare(mdata->spi_hclk);
 	}
 
+	pinctrl_pm_select_sleep_state(dev);
+
 	return 0;
 }
 
@@ -1325,6 +1328,8 @@ static int mtk_spi_resume(struct device *dev)
 	struct spi_controller *host = dev_get_drvdata(dev);
 	struct mtk_spi *mdata = spi_controller_get_devdata(host);
 
+	pinctrl_pm_select_default_state(dev);
+
 	if (!pm_runtime_suspended(dev)) {
 		ret = clk_prepare_enable(mdata->spi_clk);
 		if (ret < 0) {
-- 
2.17.1


