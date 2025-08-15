Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE783CA0ED1
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Aug 2025 12:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AxPihWEE9okM75l8p7+ohG5rL5D7+pdcAJ7iXomcZQ8=; b=wTzBtFprXtYxS3OraCmmNroMgU
	ECUzt31dBcCZb7u+gieAUvvWgTDqBKzxW5sCQ9Uu43/kSxVoFKciUnsMEjxuwMiEUBfYoR9xt8rMu
	Kta5qNBLI3ZmYqadsDbhME0GpmtxkAAa27n65Zp9V81oquSuVe5FGxy862E/ta1dJF+KOyT6W6FrN
	tXk5OrkPTSSmAEoQl3h8mU916jxnzfIz3P1QeeUHffgtNmFY+nXo7JJblrTz1du3eagshjhQUAE2l
	VGzmZSZ1UBqPaP4++JXnEIkgHFpVnxnqw/yD/TpDfR6xD/aVJNoUg8ghedmlxXITwKa3Xp1/ortpy
	tqAQaLaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umtPh-00000002SBI-2eGD;
	Fri, 15 Aug 2025 12:20:05 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqRA-00000001ztD-2vHE
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Aug 2025 09:09:25 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3b9e414252dso907171f8f.3
        for <linux-mediatek@lists.infradead.org>; Fri, 15 Aug 2025 02:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248963; x=1755853763; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AxPihWEE9okM75l8p7+ohG5rL5D7+pdcAJ7iXomcZQ8=;
        b=DhAKVBl2X0oKEj0MhuhTw6Rq8cnI50yKu6wmarANHBqV1mfVInOC1qi+X6y3+xs5U7
         L42oTZwiX8nr3hkbzz38rGGsOVKTFXR30g55pXLAtKhkQSNEuXjg2/FusZLSJtMyPbc+
         6SqcKGqOArFYVetAVrvgIRWi2MH3/zMhN2Ppl8YCSNcuyJE3X/3I92zesoW7H0uy82fK
         MmgTjdrkLAke0T3ufCAXrmeuFECIWyyziixIk8J/05CyLr3tiBn7+L/OY0i8WHtKTjVj
         ECfdJxFYJ48lxlknp0XUlOlxdaCuLdwQOaPprx96wUeQRRKR9kB/Zrj/7jWzRuSk02vg
         W4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248963; x=1755853763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AxPihWEE9okM75l8p7+ohG5rL5D7+pdcAJ7iXomcZQ8=;
        b=dsKND84JHGLTqExr1Yo9QM2469zkyvBQmOeOEdwcUHsWObb2USAF8myF0vF5KDYbv7
         DxvImkls9JYcTiwR+qFZlWJVH2ehqYuOisvEFxWautcejWb4IlNBKaitwEWkCThQph15
         x/sCr6mly/yXHbcb/smsnem0pRSBCA6Krxt3F5SjohPTFGrW7YrClAGGNA7Q+Dh+7x+a
         5NSBv4PsHKTRJWi1yIOR1L36KLeNdcpylXBoXamKlw2cQZCp72Qhw7lGqygjItK5Drus
         hVdCJaTrQVoEk5mBeMvHbeqtcg/UWtz1AluHTxjmt1jYnzs40odBnI9wngkZDWIxDzEF
         aMwg==
X-Forwarded-Encrypted: i=1; AJvYcCVZaHfVxvOuBjfLMdoalEzyExCeed0fNTKcTd3bHG0TPMRpDXFrmmMoHu9xAcu2jOr6x7yIEMgRSSKu15rI3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwX/K2SBZlaroFxmUlbUbbNTD6PpkeHXpw5NIKuuUSJxof5Worh
	7R1AnUeSwGtf3+BsattBfVNPz2x6OIEZBZTloTPLsfeCCculbbRqwp/E5sFH/hT/3nM=
X-Gm-Gg: ASbGncts1KA8MKFQTCPvJBUGjVoehSbayqjDOHgIrsrnd68DrDm0yBzVF3dmMVdvNl7
	NfSWSSuSR9uivgPie1+PwnqydioudX/ayRbvc5tBXZGtIquDgg8EYN5sO2GpA9V2czLX4YKwSkW
	tQJze+Dpoi1+J9WJPmr+zOPMQOIGEUKb4c86TN7ySt8W0m46kn5Fg4Dtm8OhGaq8RkP96mjoVTk
	gR27ErdQ26fST1RXAHj5pRJcnYjnisCuDtRQrtpv14ciLLdvIYfjDYpsI6BmxZt16mVxdTETl3d
	sm5WpW2qtJ8k2zLeo/xXyLa30kzzkgW1i5Olnv4tcL5wqcR0bshsrkgXRlNGcHCjiqgP7PtQ/oj
	zih4afIWBxKmY3x1Z6Q==
X-Google-Smtp-Source: AGHT+IGUAXDLykutIpMPqR2CWw0jGljeultUDjNsFBqLcnpk3VzMMU1IX8ETkYGEQbzDEFH8gkziRw==
X-Received: by 2002:a05:6000:18ac:b0:3b7:fbe3:66bb with SMTP id ffacd0b85a97d-3bb694ae9cdmr917909f8f.50.1755248963081;
        Fri, 15 Aug 2025 02:09:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9a67sm1205210f8f.35.2025.08.15.02.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 02:09:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Aug 2025 11:09:06 +0200
Subject: [PATCH v5 04/15] pinctrl: mediatek: mt7988: use
 PINCTRL_PIN_FUNCTION()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-pinctrl-gpio-pinfuncs-v5-4-955de9fd91db@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2921;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=79i9CgDBpTwy0KAMS4vozziB177zSWYhoWrySFXqKM4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvk3DYcWcJpYjc33UdaGFLmDUkrwfiB7Cee3H
 F0qycSGYn2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ75NwAKCRARpy6gFHHX
 co6kEACQTpYK55/OPgc7yEK07WFy41u732QgiT+adm0VgMyxXTaDg3lfMIGivUSairqhrEA9JW+
 09eDY5n36AeV+A12kqPw8HD35KZbHbtTuoMuHMk8P+d8gMiFVuEMv3adO2lTScoCulcZlBDOtv0
 CE5E0kuD2RYWyiaDmsg4aMFCmrfKpA9uME09G9HtIMoR8quMRxZlpfvhLiOzU9tzn295FegYp+z
 eivL1my4FBTBszxeaQACTxWk9EcZm02fWxThXV78fuTHu5KcO9JBMiBhjp0IU1IMHsAuCU6KjjA
 PbZPnhp8foSt884XPFcFoF8Im2Pb3mFU7ej/3rozL+EoeYzM0mpAHCgurzi069Z/BCt61kpOM4v
 DLmQtREGwtgi1VHfLgTDVr+I2+6lyeAdtS70adO8lUvhssi+8nePshV7zWw/cE+sq86eQdx7ppk
 T4tfE5W0K8ZxeEEl+X3tM/O/wsnyN9fRU5QqfwC2Rr/nC3+sEjeazf3tjn3xBN/pDul6IJpRo2W
 5Ser3RMdQd1a1WxD3wSOdrJdQWXgvjC3+ZEUGE8kQg8lh71EdKNPagZZ4a5H9cDHZfe4o8ZlFjl
 v4E2HQ2i4+hiRfpZlEG24sQIZhSOFo9nfY9riA6rOJSMosbGFdQfJHPUtUCSC2EazYpbBXD/YJv
 Xoc8bWRKcVnJQ2w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_020924_753241_B45C8F9A 
X-CRM114-Status: GOOD (  10.47  )
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

We have a dedicated initializer macro for defining pin functions for
mediatek drivers so use it here.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-mt7988.c | 42 ++++++++++++-------------------
 1 file changed, 16 insertions(+), 26 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7988.c b/drivers/pinctrl/mediatek/pinctrl-mt7988.c
index 68b4097792b88356babe4368db7d0f60194e7309..55c8674d8d66f12d2f2246c215056d4e51296a9b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7988.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7988.c
@@ -1465,32 +1465,22 @@ static const char * const mt7988_usb_groups[] = {
 };
 
 static const struct function_desc mt7988_functions[] = {
-	{ { "audio", mt7988_audio_groups, ARRAY_SIZE(mt7988_audio_groups) },
-	  NULL },
-	{ { "jtag", mt7988_jtag_groups, ARRAY_SIZE(mt7988_jtag_groups) },
-	  NULL },
-	{ { "int_usxgmii", mt7988_int_usxgmii_groups,
-	    ARRAY_SIZE(mt7988_int_usxgmii_groups) },
-	  NULL },
-	{ { "pwm", mt7988_pwm_groups, ARRAY_SIZE(mt7988_pwm_groups) }, NULL },
-	{ { "dfd", mt7988_dfd_groups, ARRAY_SIZE(mt7988_dfd_groups) }, NULL },
-	{ { "i2c", mt7988_i2c_groups, ARRAY_SIZE(mt7988_i2c_groups) }, NULL },
-	{ { "eth", mt7988_ethernet_groups, ARRAY_SIZE(mt7988_ethernet_groups) },
-	  NULL },
-	{ { "pcie", mt7988_pcie_groups, ARRAY_SIZE(mt7988_pcie_groups) },
-	  NULL },
-	{ { "pmic", mt7988_pmic_groups, ARRAY_SIZE(mt7988_pmic_groups) },
-	  NULL },
-	{ { "watchdog", mt7988_wdt_groups, ARRAY_SIZE(mt7988_wdt_groups) },
-	  NULL },
-	{ { "spi", mt7988_spi_groups, ARRAY_SIZE(mt7988_spi_groups) }, NULL },
-	{ { "flash", mt7988_flash_groups, ARRAY_SIZE(mt7988_flash_groups) },
-	  NULL },
-	{ { "uart", mt7988_uart_groups, ARRAY_SIZE(mt7988_uart_groups) },
-	  NULL },
-	{ { "udi", mt7988_udi_groups, ARRAY_SIZE(mt7988_udi_groups) }, NULL },
-	{ { "usb", mt7988_usb_groups, ARRAY_SIZE(mt7988_usb_groups) }, NULL },
-	{ { "led", mt7988_led_groups, ARRAY_SIZE(mt7988_led_groups) }, NULL },
+	PINCTRL_PIN_FUNCTION("audio", mt7988_audio),
+	PINCTRL_PIN_FUNCTION("jtag", mt7988_jtag),
+	PINCTRL_PIN_FUNCTION("int_usxgmii", mt7988_int_usxgmii),
+	PINCTRL_PIN_FUNCTION("pwm", mt7988_pwm),
+	PINCTRL_PIN_FUNCTION("dfd", mt7988_dfd),
+	PINCTRL_PIN_FUNCTION("i2c", mt7988_i2c),
+	PINCTRL_PIN_FUNCTION("eth", mt7988_ethernet),
+	PINCTRL_PIN_FUNCTION("pcie", mt7988_pcie),
+	PINCTRL_PIN_FUNCTION("pmic", mt7988_pmic),
+	PINCTRL_PIN_FUNCTION("watchdog", mt7988_wdt),
+	PINCTRL_PIN_FUNCTION("spi", mt7988_spi),
+	PINCTRL_PIN_FUNCTION("flash", mt7988_flash),
+	PINCTRL_PIN_FUNCTION("uart", mt7988_uart),
+	PINCTRL_PIN_FUNCTION("udi", mt7988_udi),
+	PINCTRL_PIN_FUNCTION("usb", mt7988_usb),
+	PINCTRL_PIN_FUNCTION("led", mt7988_led),
 };
 
 static const struct mtk_eint_hw mt7988_eint_hw = {

-- 
2.48.1


