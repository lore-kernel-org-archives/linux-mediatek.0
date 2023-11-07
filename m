Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED62BC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Nov 2023 15:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q9C0O1fHLMhMrPIX9ZHFbv65e3WJBykSAqF8GaVeHCI=; b=MY9gUVXjqqSxTtOOORvyS+wDt4
	VOgMI4HCCH0au344NwOqeNGy53SNN7/RH3Bg1qw7TE7h5zneAEDi8j7hfQ6Zio20jZhkIF7Rbzq+M
	29c1A2TEmyQotUEHRB15e6EEhQi6pUcGHS08Gl3sWHmon8vmkKSVy6D75aGynp/04aWlBD8LICJfq
	XnL6XlGhbuq4YJAnxh62Kr7R5OwuTnCptCCjaFgM1cOHF9WEuJRvJlrU+83BO8UMbNScxau0oZl9G
	bcd7NA9txtCE1p11IUB8i9dSsdF/lKmnJguCkmCiNnM+Cl5FzW/dOv0J6IMZEaAAOc0LPbOk1+EPw
	vJrYuqsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0OKe-001tYm-00;
	Tue, 07 Nov 2023 15:49:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0OKa-001tXG-2g;
	Tue, 07 Nov 2023 15:49:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5B67961255;
	Tue,  7 Nov 2023 15:49:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC42FC433C7;
	Tue,  7 Nov 2023 15:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699372172;
	bh=wQ1PQM7f/JCvzuyybW/BE93r8Z0xUqIiIBrvLO+vPEM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f8TmrTSZtf6pcmxeRiV70QUW6c5JcFs2HQgOnOAOqo25TTtho7qxV4jSByKiAWeuq
	 lNAcoAQ+Lb+98rlIgdYa62bl5hl9ef327xMAYFy3CHBru5hxtOGFRvd713Ws17onfk
	 A4KOuMzy63jTE30EueW/vZgA72jHLeQA9HHN0C/6k7GwDRHLztpEOlkNpcJjb/Wq3c
	 2V1u+g/NQPGQsbce9LHizFN+5kimavvGAHZEzFSAsTAP7KNVW5iRoIlYTrol1y6TYV
	 TxuADtwBbeULL+ESf43w34qUXEDZrm/OeN2jHbvoVcBu1qpBGFbCU/RoFsaLcm/J/o
	 u9AK+z9uEuKbQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	brgl@bgdev.pl,
	matthias.bgg@gmail.com,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.5 17/34] gpiolib: of: Add quirk for mt2701-cs42448 ASoC sound
Date: Tue,  7 Nov 2023 10:47:57 -0500
Message-ID: <20231107154846.3766119-17-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107154846.3766119-1-sashal@kernel.org>
References: <20231107154846.3766119-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.10
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_074932_920073_BC1CC686 
X-CRM114-Status: GOOD (  10.42  )
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

From: Linus Walleij <linus.walleij@linaro.org>

[ Upstream commit 9e189e80dcb68528dea9e061d9704993f98cb84f ]

These gpio names are due to old DT bindings not following the
"-gpio"/"-gpios" conventions. Handle it using a quirk so the
driver can just look up the GPIOs.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Link: https://lore.kernel.org/r/20231006-descriptors-asoc-mediatek-v1-1-07fe79f337f5@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpio/gpiolib-of.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 1436cdb5fa268..219bf8a82d8f9 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -496,6 +496,10 @@ static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
 #if IS_ENABLED(CONFIG_SND_SOC_CS42L56)
 		{ "reset",	"cirrus,gpio-nreset",	"cirrus,cs42l56" },
 #endif
+#if IS_ENABLED(CONFIG_SND_SOC_MT2701_CS42448)
+		{ "i2s1-in-sel-gpio1",	NULL,	"mediatek,mt2701-cs42448-machine" },
+		{ "i2s1-in-sel-gpio2",	NULL,	"mediatek,mt2701-cs42448-machine" },
+#endif
 #if IS_ENABLED(CONFIG_SND_SOC_TLV320AIC3X)
 		{ "reset",	"gpio-reset",	"ti,tlv320aic3x" },
 		{ "reset",	"gpio-reset",	"ti,tlv320aic33" },
-- 
2.42.0


