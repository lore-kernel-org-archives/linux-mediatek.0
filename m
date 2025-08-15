Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83D8CA0EE4
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Aug 2025 12:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lc0/t4Iv6hjqG5kcGiM2/0kFYGiYqDN1ZHyY/21Fkb0=; b=hfKaYfLQYzb3E3Sapa6uHumf90
	ZxLjQcKz6jcaLfqWsZ9id/VJVwxlVXfcLct1nHQ5s81ArA1tcBM4UkChLIXhO4OZdFVdF7nOGppjh
	tyMzVVrfyXSHQUtXBBQCtSrg1wum7JCUh1dNIhdHkb6zKmzEnPx/igo8TuUTm7JD0gDiBWxL6ohd1
	hMnS4a/rEg1dTbQUjrcpyG/YhXNhMa7JV2cIii3fAUytATyhu9Sw8w89zDnpRD23doJu6VKo9oFvd
	ZOHHAjNrQAziKJJyyZDuBew6Z/MpOojdvYdHRsMnTmRe/OfJmmeo/vt8r2IAesV29lvzpVj2Zk6sg
	vpxdAfTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umtSF-00000002SO4-2wSO;
	Fri, 15 Aug 2025 12:22:43 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqRC-00000001zuZ-1Zy4
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Aug 2025 09:09:27 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3b9d41bfa35so1462385f8f.0
        for <linux-mediatek@lists.infradead.org>; Fri, 15 Aug 2025 02:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248965; x=1755853765; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lc0/t4Iv6hjqG5kcGiM2/0kFYGiYqDN1ZHyY/21Fkb0=;
        b=eFCoCQlq3n+vI4AHMpTi7lVh4Zf6CPFxznjv6HCxRZmfcNm9sjk454tmXbNfYhnGts
         tX5JThxJ5NbyAetI5SnQPV8KG9BOACgSw/hwfjufMn+X6Adprsj+PpGLEefw6tcaCav7
         5rcphWAI7in21Rxx8RtUXVWeft1IT9JIRbzwdGonoKaZSKzrR7p7TqGLSlePKbaOK0Na
         mnRXcfzdmL12K+UcueJRXtLACWMcHye1XJtlZub5ZHSE/FItetDW7l0u4CzSrS96gwtu
         dJdZgdO5MV6dcnfPjelmnI1YnzsNgMBykGipPtwqjSVaTOw3X1k8boF8gSIG37VKqw/E
         K5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248965; x=1755853765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lc0/t4Iv6hjqG5kcGiM2/0kFYGiYqDN1ZHyY/21Fkb0=;
        b=m/kz7JtrJ9ETPG4vTabWBcTbtPtACYSuQh5M3V80Plz6LLdWq3lPEKce2itVllheeL
         KYtDFufY35hJ9F3xHhVV8l47zVDVFNgLCDnigqbjhzMnNtV7KbhFTXxuqBXWQNuBQMd5
         tptVpnm9faBlu3yXvNrk3PqiVk+4mg1ocSox9924rJyR6dyNaDCgHqGFbRdXWnQrt2cI
         ylCKrtivabcibaxn0c8Eei1eYPbKGz+XR0+ybQxbK4+6eTwROBwfCNQFKdSHoC/IobXK
         NicpBklTTz1WrJHr877fzjJhGUIJmXS6smCrcr0PU6vK2fdO5elvkNuw0ukmcaq1wITt
         NN0g==
X-Forwarded-Encrypted: i=1; AJvYcCULN4lk8ypYGW6yTqVXXOZVVvWwKKrsUJVL/SyJuBg/nO2Vx6rPc1N5ymjIQzSs9wIH5m8W1nCgelEL+1hc1w==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu7H1mRj8mZKBHI7lwxLO3L2PyyN11PSBOP8HxeLxSYWv/+NYV
	uGSN+GU826m9UPil3O8ualdf2blYhhxsR8Zse9PBqaKFUYurA7DcJAE3vpvcBB67HYw=
X-Gm-Gg: ASbGncuiCPpmVL4ckW+tfOGmOzIRQdJRuNqi1WmH3et8Gy5Qb1SSVb/2KoAV7uOyFPV
	JPqRtKiiW9RNKqfiePFZiAPD6TvPsnr57I2EoBcmWK5QMrg32zk3qDiQVnhPaJ0BrhhUtKlXLUU
	IfJMAsyekX+76nQ9cNvT1ilOz21CrfEcfc2svY6pn4ehy9JrKbie1TYp58wxDGmzfiSPw+p0BEA
	Plsqr4NJVTfsQ1H9DdzGS/9c1DsgZ5bmCvDfzLyW0K+Hlf8qiYVPgdw/j5OWL5rsfxY9ovuALm0
	i5+PGN2iChIhKQH9IiPF/PsTpklPbQEBlMHfP+p/1SlBhksieKuaiMgqhkHP8czXbF9ngAVcaqa
	UeBHyPPPVTwC10yzgkg==
X-Google-Smtp-Source: AGHT+IH+JR178EPgAqIUUl1evmTTr1x2K4MvNmipyWtFLoqUSeH9zZZUWgL1QLgHWs1/dDUsekziEw==
X-Received: by 2002:a05:6000:4383:b0:3b8:dabe:bd8b with SMTP id ffacd0b85a97d-3bb68a185bdmr1038820f8f.27.1755248964740;
        Fri, 15 Aug 2025 02:09:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9a67sm1205210f8f.35.2025.08.15.02.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 02:09:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Aug 2025 11:09:07 +0200
Subject: [PATCH v5 05/15] pinctrl: mediatek: moore: replace struct
 function_desc with struct pinfunction
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-pinctrl-gpio-pinfuncs-v5-5-955de9fd91db@linaro.org>
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
In-Reply-To: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Chen-Yu Tsai <wenst@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7850;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9BKGEvZq/gbYunbAXK1ZCTf6DpFoadfRkbzoE0vKzXo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvk3Pz4bZWLjCq9OyRjq8qSpMxa5kXSom7+Nn
 9lVVbxSSICJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ75NwAKCRARpy6gFHHX
 cgEEEADAOXrKLcmzOeYsONGvgBthO2HBAzQ+lHZSBTn2F4QfTiqTjYSCWNaboTo5PtgNThVrvQh
 q03BXKYFwL/7IMjsYlfsEvqd1EOZoAIZ4Jl4C+aPyR+gR+R6PiEP11HwNQqR1YYfYeebhhwZFnV
 PGUV3D1w79KrlhgzsufjmSW+c+YQ5WJZDMLqeF2ZEIexXPNTd4PX1GEQ/BItpda3fLlt9jdHGIn
 w/jhWZRzo0GJ7s96NhRyV935oS+cUacE8lQc4dU+mr3QHDktqexVN8WK9jUWelV84TnQ+urZSSU
 /G3E3j4GoUHaVtTJ/PdG2S+zWzrkeG++Qb/2lj7zaGKCEB9cftBmPP0atTegNaETtXqvMOvMkuo
 6SyVCsGKxrPp6ee1wWtdEE7ferKv3Dn+lsozfP6rY0I66SoAdKGwsTNH4lFNo7FbZW/eal1TAE4
 U1YWk3ZKnzLVI9f9dr4gebddux/zek7590VjrED7EbsHk08bxR5uKGYwzqpP7UcnMM4oTCpaD/+
 +woGV9bb+PXmDDOzculdAJhPzGNlUSmRO9yqDjCbL3dcWPPjEO6TdXmZWI/0vg8dZ7OBAzI+1Ej
 9QoidEbK+PWSuHQ1Oqt+9XFZODd2wRU2JiJ+s/PxtwTBjJdnr+XNmcem/7B6LbT5baypfHI3KPX
 MeYcfhyRNgbpsow==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_020926_411167_E7F4EE5D 
X-CRM114-Status: GOOD (  16.90  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct function_desc is a wrapper around struct pinfunction with an
additional void *data pointer. This driver doesn't use the data pointer.
We're also working towards reducing the usage of struct function_desc in
pinctrl drivers - they should only be created by pinmux core and
accessed by drivers using pinmux_generic_get_function(). Replace the
struct function_desc objects in this driver with smaller struct
pinfunction instances.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-moore.c         | 6 ++----
 drivers/pinctrl/mediatek/pinctrl-moore.h         | 7 ++-----
 drivers/pinctrl/mediatek/pinctrl-mt7622.c        | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7623.c        | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7629.c        | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7981.c        | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7986.c        | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mt7988.c        | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h | 2 +-
 9 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 6e4f6c07a509326a8a7e88b2dc32635b22e7b965..982b9887521d036538f67e9919de444693c458c0 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -622,11 +622,9 @@ static int mtk_build_functions(struct mtk_pinctrl *hw)
 	int i, err;
 
 	for (i = 0; i < hw->soc->nfuncs ; i++) {
-		const struct function_desc *function = hw->soc->funcs + i;
-		const struct pinfunction *func = &function->func;
+		const struct pinfunction *func = hw->soc->funcs + i;
 
-		err = pinmux_generic_add_pinfunction(hw->pctrl, func,
-						     function->data);
+		err = pinmux_generic_add_pinfunction(hw->pctrl, func, NULL);
 		if (err < 0) {
 			dev_err(hw->dev, "Failed to register function %s\n",
 				func->name);
diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.h b/drivers/pinctrl/mediatek/pinctrl-moore.h
index 229d19561e229c77714e5fccb3d4fb68eacc77fd..fe1f087cacd0446e40628cb4fa35a135496ca848 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.h
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.h
@@ -43,11 +43,8 @@
 		.data = id##_funcs,							\
 	}
 
-#define PINCTRL_PIN_FUNCTION(_name_, id)							\
-	{											\
-		.func = PINCTRL_PINFUNCTION(_name_, id##_groups, ARRAY_SIZE(id##_groups)),	\
-		.data = NULL,									\
-	}
+#define PINCTRL_PIN_FUNCTION(_name_, id)						\
+	PINCTRL_PINFUNCTION(_name_, id##_groups, ARRAY_SIZE(id##_groups))
 
 int mtk_moore_pinctrl_probe(struct platform_device *pdev,
 			    const struct mtk_pin_soc *soc);
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7622.c b/drivers/pinctrl/mediatek/pinctrl-mt7622.c
index 2dc1019910662a2a52e81f277a10a32bd83b33d4..d5777889448aab86e82fa6821fdea0d30a5a7246 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7622.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7622.c
@@ -822,7 +822,7 @@ static const char *mt7622_uart_groups[] = { "uart0_0_tx_rx",
 					    "uart4_2_rts_cts",};
 static const char *mt7622_wdt_groups[] = { "watchdog", };
 
-static const struct function_desc mt7622_functions[] = {
+static const struct pinfunction mt7622_functions[] = {
 	PINCTRL_PIN_FUNCTION("antsel", mt7622_antsel),
 	PINCTRL_PIN_FUNCTION("emmc", mt7622_emmc),
 	PINCTRL_PIN_FUNCTION("eth", mt7622_ethernet),
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7623.c b/drivers/pinctrl/mediatek/pinctrl-mt7623.c
index 3e59eada2825277b3d7500cb1f2cf740242a4a8b..69c06c2c0e21e4ce785f65539254eb070bff9a0d 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7623.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7623.c
@@ -1340,7 +1340,7 @@ static const char *mt7623_uart_groups[] = { "uart0_0_txd_rxd",
 					    "uart3_rts_cts", };
 static const char *mt7623_wdt_groups[] = { "watchdog_0", "watchdog_1", };
 
-static const struct function_desc mt7623_functions[] = {
+static const struct pinfunction mt7623_functions[] = {
 	PINCTRL_PIN_FUNCTION("audck", mt7623_aud_clk),
 	PINCTRL_PIN_FUNCTION("disp", mt7623_disp_pwm),
 	PINCTRL_PIN_FUNCTION("eth", mt7623_ethernet),
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7629.c b/drivers/pinctrl/mediatek/pinctrl-mt7629.c
index 98142e8c98011d17339da74f61d6f917372dfcd5..cc0694881ac9dc536db0e46eefe5eb7359735a60 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7629.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7629.c
@@ -384,7 +384,7 @@ static const char *mt7629_wdt_groups[] = { "watchdog", };
 static const char *mt7629_wifi_groups[] = { "wf0_5g", "wf0_2g", };
 static const char *mt7629_flash_groups[] = { "snfi", "spi_nor" };
 
-static const struct function_desc mt7629_functions[] = {
+static const struct pinfunction mt7629_functions[] = {
 	PINCTRL_PIN_FUNCTION("eth", mt7629_ethernet),
 	PINCTRL_PIN_FUNCTION("i2c", mt7629_i2c),
 	PINCTRL_PIN_FUNCTION("led", mt7629_led),
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7981.c b/drivers/pinctrl/mediatek/pinctrl-mt7981.c
index 83092be5b614cc164590fe5ec2b756fe6579b263..6216c2e057f6499b32741b6bd3a4854878c061c9 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7981.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7981.c
@@ -977,7 +977,7 @@ static const char *mt7981_ethernet_groups[] = { "smi_mdc_mdio", "gbe_ext_mdc_mdi
 	"wf0_mode1", "wf0_mode3", "mt7531_int", };
 static const char *mt7981_ant_groups[] = { "ant_sel", };
 
-static const struct function_desc mt7981_functions[] = {
+static const struct pinfunction mt7981_functions[] = {
 	PINCTRL_PIN_FUNCTION("wa_aice", mt7981_wa_aice),
 	PINCTRL_PIN_FUNCTION("dfd", mt7981_dfd),
 	PINCTRL_PIN_FUNCTION("jtag", mt7981_jtag),
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7986.c b/drivers/pinctrl/mediatek/pinctrl-mt7986.c
index 5816b5fdb7ca918486f57a890f73543b3198c728..2a762ade9c35505505c932b6fea75fa0cf77d961 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7986.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7986.c
@@ -878,7 +878,7 @@ static const char *mt7986_uart_groups[] = {
 static const char *mt7986_wdt_groups[] = { "watchdog", };
 static const char *mt7986_wf_groups[] = { "wf_2g", "wf_5g", "wf_dbdc", };
 
-static const struct function_desc mt7986_functions[] = {
+static const struct pinfunction mt7986_functions[] = {
 	PINCTRL_PIN_FUNCTION("audio", mt7986_audio),
 	PINCTRL_PIN_FUNCTION("emmc", mt7986_emmc),
 	PINCTRL_PIN_FUNCTION("eth", mt7986_ethernet),
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7988.c b/drivers/pinctrl/mediatek/pinctrl-mt7988.c
index 55c8674d8d66f12d2f2246c215056d4e51296a9b..9569e8c0cec15fb6a4a8e359d6483fa163487b0c 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7988.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7988.c
@@ -1464,7 +1464,7 @@ static const char * const mt7988_usb_groups[] = {
 	"drv_vbus_p1",
 };
 
-static const struct function_desc mt7988_functions[] = {
+static const struct pinfunction mt7988_functions[] = {
 	PINCTRL_PIN_FUNCTION("audio", mt7988_audio),
 	PINCTRL_PIN_FUNCTION("jtag", mt7988_jtag),
 	PINCTRL_PIN_FUNCTION("int_usxgmii", mt7988_int_usxgmii),
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
index 36d2898037dd041ebc7e06526ebc085eb42f2828..fa7c0ed49346486ba32ec615aa2b3483217f5077 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
@@ -238,7 +238,7 @@ struct mtk_pin_soc {
 	unsigned int			npins;
 	const struct group_desc		*grps;
 	unsigned int			ngrps;
-	const struct function_desc	*funcs;
+	const struct pinfunction	*funcs;
 	unsigned int			nfuncs;
 	const struct mtk_eint_regs	*eint_regs;
 	const struct mtk_eint_hw	*eint_hw;

-- 
2.48.1


