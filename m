Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8CB8ECE585
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 18:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g5O1hSP9ShQ3GpoHpKJEsEgUvB/OL86E7+XNgv67eC0=; b=rCyBdK89TxBih7tfDAJi/yGVjA
	P4jc3IPvxDRIln8M6Bcl5Y8Sk0WWcyHq4C+kq9BISORFB7mctHZZ28tGJQQkQ52qr67WPNwq3aphO
	Glf51bq3KztxiHfF1keJvp4gqy6VFzRwMM/rlw0H6t1nEv0GHm2srMdLGAcvMzaLaqxnqrdYN2FwB
	upg9ksiCqy1RGyx8mCdGrHjFXeyXYW43zFTnjf/lIVp1+6syq7Y3im0hUMFHMDSb4HXxJX7D2DfKO
	k17zECxDeJ+UUrM8PBh7hSxjlu6UtjUVoIevSnyGkEgkC4oEk4TFtwCP0CvnMDMCTXXGbAjWHfEbz
	gejEA7kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snjJG-00000002zpA-212t;
	Mon, 09 Sep 2024 18:40:22 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snjHE-00000002zLy-3Jdc;
	Mon, 09 Sep 2024 18:38:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1725907095;
	bh=V9HT+WFFbtvEODO7OkoAPU0v0W0Jmx2Vc+VBObPr39M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=A+pCizIEC6YstPQ3l+iqEHe024H211npMNG0BUJmMNDTe4frB3G1Bigc/1YiYXY8w
	 FyuznWXFONgb823F7NQzNTWLbulMhp14dWpwrZSHrWeYap6B2pZmKsPOR9I0KFkjI8
	 xoZmbHVW3itf5hqCx4TWVR4SA3k1cc6rDkQhym1Lpl2UMvdKTzi2/bktktZZ9hb09F
	 AL10duXmNzRKHTNUz0AhfoA7AbDpVeU31luw5LhzeBfszoIG5WWpPEX0BT/8qVCzlF
	 pODNtPSNigKoWIMdhLyihKTbpIP+f+M8i8jq8G354FlNCiOv/ej7HdET4e6ifYEL2j
	 1sOgI0iE6th5w==
Received: from [192.168.1.95] (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AB12017E35FD;
	Mon,  9 Sep 2024 20:38:13 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Mon, 09 Sep 2024 14:37:32 -0400
Subject: [PATCH RFC 1/3] pinctrl: mediatek: paris: Expose more
 configurations to GPIO set_config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240909-kselftest-gpio-set-get-config-v1-1-16a065afc3c1@collabora.com>
References: <20240909-kselftest-gpio-set-get-config-v1-0-16a065afc3c1@collabora.com>
In-Reply-To: <20240909-kselftest-gpio-set-get-config-v1-0-16a065afc3c1@collabora.com>
To: Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bamvor Jian Zhang <bamv2005@gmail.com>, Shuah Khan <shuah@kernel.org>
Cc: kernel@collabora.com, linux-mediatek@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 kernelci@lists.linux.dev, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_113817_005634_AEAE4314 
X-CRM114-Status: GOOD (  14.07  )
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

Currently the set_config callback in the gpio_chip registered by the
pinctrl_paris driver only supports PIN_CONFIG_INPUT_DEBOUNCE, despite
many other configurations already being implemented and available
through the pinctrl API for configuration of pins by the Devicetree and
other drivers.

Expose all configurations currently implemented through the GPIO API so
they can also be set from userspace, which is particularly useful to
allow testing them from userspace.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index e12316c42698..668f8055a544 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -255,10 +255,9 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
 	return err;
 }
 
-static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
+static int mtk_pinconf_set(struct mtk_pinctrl *hw, unsigned int pin,
 			   enum pin_config_param param, u32 arg)
 {
-	struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
 	const struct mtk_pin_desc *desc;
 	int err = -ENOTSUPP;
 	u32 reg;
@@ -795,7 +794,7 @@ static int mtk_pconf_group_set(struct pinctrl_dev *pctldev, unsigned group,
 	int i, ret;
 
 	for (i = 0; i < num_configs; i++) {
-		ret = mtk_pinconf_set(pctldev, grp->pin,
+		ret = mtk_pinconf_set(hw, grp->pin,
 				      pinconf_to_config_param(configs[i]),
 				      pinconf_to_config_argument(configs[i]));
 		if (ret < 0)
@@ -937,18 +936,19 @@ static int mtk_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 {
 	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
 	const struct mtk_pin_desc *desc;
-	u32 debounce;
+	enum pin_config_param param = pinconf_to_config_param(config);
+	u32 arg = pinconf_to_config_argument(config);
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[offset];
 
-	if (!hw->eint ||
-	    pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE ||
-	    desc->eint.eint_n == EINT_NA)
-		return -ENOTSUPP;
+	if (param == PIN_CONFIG_INPUT_DEBOUNCE) {
+		if (!hw->eint || desc->eint.eint_n == EINT_NA)
+			return -ENOTSUPP;
 
-	debounce = pinconf_to_config_argument(config);
+		return mtk_eint_set_debounce(hw->eint, desc->eint.eint_n, arg);
+	}
 
-	return mtk_eint_set_debounce(hw->eint, desc->eint.eint_n, debounce);
+	return mtk_pinconf_set(hw, offset, param, arg);
 }
 
 static int mtk_build_gpiochip(struct mtk_pinctrl *hw)

-- 
2.46.0


