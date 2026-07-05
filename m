Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789BCC44500
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jul 2026 15:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W1sbIzpLoPVOsWAp5a91/2b+hubQz3OERKvp78vmABs=; b=JgKveI1pQqgryfKTzeeHp4AE3F
	Dakfm9sxplthU/ZknBY0jlGKpK1+F2BAz3CwN107iJ/CTu2yLyaGUXpSSVhpW5eR9AdvVn7FcFvnw
	QbxEgV3TIILo9xYUkWKjgXn/KcVDhLBU4Q7Shh2ExSygJfKyYTjZp069+G9lr5e36OKGViwnInYwJ
	wE8yQQvAk5QBJgs+BDSdd5CGlrnQBSgYxwwo1QpY/aLsBvd0A/RFuPId5XoCG46fokJF4D/5pRhx2
	ZakXV0cdRKhbwwPL+yFxN9fueGrtGNFfVp1DYZrzSIuYDgSeFj6KuaI5vfoxo9U0K2JNbrj0o1sJD
	dQxZ8+7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgOYL-00000009QmK-2wpi;
	Sun, 05 Jul 2026 15:14:42 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgOYF-00000009Qjl-2RAh
	for linux-mediatek@lists.infradead.org;
	Sun, 05 Jul 2026 15:14:39 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-493ba701891so16757185e9.3
        for <linux-mediatek@lists.infradead.org>; Sun, 05 Jul 2026 08:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783264474; x=1783869274; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W1sbIzpLoPVOsWAp5a91/2b+hubQz3OERKvp78vmABs=;
        b=QkAmfXp6Ejoq/shQ1qsKhM1MHivT/mJ5Yum6xlWdi6AL3fN+2q2ss1RhMpAszVadGQ
         52gBorbZQZx59vy38jtceT96bdxQhmrXcmgMwsrzen890jAyx0TnXT/KpOb8iwKxpoaw
         Y4NHf1af4a2yRLZIYAENucEoPCqxk11ilSnrVLtMnYrpjlMhJf34etKZ+MuEpl3W7KCB
         izGyzFq3Naic2EpV0pJfbKEI6kCq02gZ1X9yFIZvmU9AONDOlFNG7k+XaO+1I3KnN4jz
         3OWhfxiYA6Mb6xOhCRmAtwwK1y80NOROpC0V2yRR5O/kowOHi1SQYXK3pVlLLjilitFG
         t1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783264474; x=1783869274;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W1sbIzpLoPVOsWAp5a91/2b+hubQz3OERKvp78vmABs=;
        b=ZXFp5dMu4ISZStKtJb/4tAW+NsMcgIMffbD/rcbqzVN0r9lYgEz+VpJ3WpOZNllReI
         PDAe9dyLvHgG2nUVnRXKsEhze+UtSxjVwu2TLbfuEu7WQHERzffWqynxY28Pk8WhTcg+
         KPP6hXeAC0OtrPU0A8QuIMp/eyYtUugq5cundv7h1JMiV+8+hShgeYyyo0RwySCvlBH+
         18FLz+q7cQfHk9uK0p7mmtpWZWRE9b7NkkTjpawydY5yop+D7p+r6m8+xOAal9o7nMdL
         zBm4XsGDHj+O8xNBgmfS1uaV10o8kmfqcVUa6Td+7E9IIQnORwTLvk0k/SrUQm8kkeE4
         yO6Q==
X-Forwarded-Encrypted: i=1; AFNElJ/Rcm5rSkjcsLQkFggDt/kF6FlzX/7xjmSpoLJQ2lDUh1/0X9gzIjESOj98vkXOXpOmS7WjHzHkBPm0Fi6z/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYLFpjWdayl2DvONhp+U8/UnbcjCnpmml0ZVman+SbyHke7nW6
	J9trDkY7tiO4s0CQbi6EWnaDV4S7JL6U+O9rf53Chh8SQJ0tZ93k7skHTcPYpG1aixU=
X-Gm-Gg: AfdE7cl4wlUOY/BnCuy9cKA/VHpbOs3tWXlOlhzJSfapyB4JwkPlPEF+Q2rcDYuLmv7
	O7AXzsEIr4EWCcOl39a9tu82OQB76qviLH9HUwa6NMefuK1WFvUS466o35KR3Aov2VFTe3uCdHa
	DAB4AedGtGhtw1zWm9bacBlU/T0lhrJLHHu6KEZdyJWnXJcbrCzvYkz6cIv0AXLjg2td34S7LBa
	qZhFdDBJ94N/c01xYVymi8glkClbYbl5vjvYVr0y8xNxikFm23l4ioClygGBAw5g2DFPgrySzP8
	T882gRu3a8DbcfyN6Ph/9BUb+E11cT1ZhrrV1hDr1vJUO2uPHRHhhXeNG8kmuNXkfpS79ONMrXm
	PpgSXR/R9K+fX2RtJD9DYRqkWrBwgvNLG77B6RrkRt4/aZXE8CPU/t3mzZWs4Ht2WZfSQo9Ul3L
	NyDfKnr0BzFV5QU4P6mA==
X-Received: by 2002:a05:600c:8b61:b0:492:7084:32af with SMTP id 5b1f17b1804b1-493d11f4b80mr87345205e9.23.1783264473096;
        Sun, 05 Jul 2026 08:14:33 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493c63b6f8csm262180195e9.11.2026.07.05.08.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 08:14:32 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Michael Walle <mwalle@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Hammer Hsieh <hammerh0314@gmail.com>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Alexey Charkov <alchark@gmail.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Michal Simek <michal.simek@amd.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	imx@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v1 0/5] pwm: Unify arrays of various *_device_id
Date: Sun,  5 Jul 2026 17:14:12 +0200
Message-ID: <cover.1783263835.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3597; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=/ARYZ3nMFNE4qw1dHISvtgGeE92jI229vSRxfVl732s=; b=owEBbAGT/pANAwAKAY+A+1h9Ev5OAcsmYgBqSnTF02HXaqUpIDE1Mt23JzG4uWfnR2u11awWU 3umjMoAUj+JATIEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakp0xQAKCRCPgPtYfRL+ TnxCB/i0tqSm4WRb5bStOYawCPIjfRWQcr4xSi/+9osjT9WCMkOFcdJIALH3OTjRDssO1bo27Lf HlxVL0NC+cyu2/kdQnTKxCwlN4Mr+K0ubzHhjQG0p5hKoo0E+ymyawDtJ372H29L5zSSYeZCvIo x4WE6N9MvkYqMFbIYzoBUakF9cYdVbu6ohyBqtXYSqr1ZwGjdHd4MWHija/sPCTtV/LrwSg4fhc gQCbrGPW2Y9VKehuNTAzHv2wje5Cu3eNO+c3uV15dBMdPgO9DfEp3EXIwH2ZR09Uaz5HwWXbYK9 FN+Z8CfZYziZ0D7HLlPGgse2ncweWpObjQ6pQzued8YQFKE=
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_081435_702753_FA833010 
X-CRM114-Status: GOOD (  12.14  )
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

Hello,

this series is part of a preparation for changing .driver_data (and
similarily named members) of *_device_id to an anonymous union.
See e.g.
https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
for the idea behind it. I also grabbed the opportunity to unify the
coding style for all these arrays while going through these.

The patch series is based on pwm/for-next + "pwm: pxa: Depend on OF and
simplify accordingly" [1].

Best regards
Uwe

[1] https://lore.kernel.org/linux-pwm/20260705083910.3502207-2-u.kleine-koenig@baylibre.com

Uwe Kleine-König (The Capable Hub) (5):
  pwm: pca9685: Drop unused assignment of acpi_device_id driver data
  pwm: Use named initializers for arrays of acpi_device_id
  pwm: Unify coding style of acpi_device_id arrays
  pwm: Unify coding style of of_device_id arrays
  pwm: lpss-pci: Unify coding style of pci_device_id array

 drivers/pwm/pwm-apple.c           |  2 +-
 drivers/pwm/pwm-argon-fan-hat.c   |  2 +-
 drivers/pwm/pwm-atmel-hlcdc.c     | 15 ++++++---------
 drivers/pwm/pwm-atmel-tcb.c       |  6 +++---
 drivers/pwm/pwm-atmel.c           |  3 +--
 drivers/pwm/pwm-bcm-iproc.c       |  2 +-
 drivers/pwm/pwm-bcm-kona.c        |  2 +-
 drivers/pwm/pwm-bcm2835.c         |  2 +-
 drivers/pwm/pwm-berlin.c          |  2 +-
 drivers/pwm/pwm-brcmstb.c         |  2 +-
 drivers/pwm/pwm-clk.c             |  2 +-
 drivers/pwm/pwm-clps711x.c        |  2 +-
 drivers/pwm/pwm-cros-ec.c         |  2 +-
 drivers/pwm/pwm-hibvt.c           |  2 +-
 drivers/pwm/pwm-imx-tpm.c         |  2 +-
 drivers/pwm/pwm-imx1.c            |  2 +-
 drivers/pwm/pwm-imx27.c           |  2 +-
 drivers/pwm/pwm-ipq.c             |  4 ++--
 drivers/pwm/pwm-jz4740.c          |  2 +-
 drivers/pwm/pwm-loongson.c        |  2 +-
 drivers/pwm/pwm-lp3943.c          |  2 +-
 drivers/pwm/pwm-lpc18xx-sct.c     |  2 +-
 drivers/pwm/pwm-lpc32xx.c         |  2 +-
 drivers/pwm/pwm-lpss-pci.c        |  2 +-
 drivers/pwm/pwm-lpss-platform.c   | 10 +++++-----
 drivers/pwm/pwm-mediatek.c        |  2 +-
 drivers/pwm/pwm-meson.c           |  9 ++++-----
 drivers/pwm/pwm-mtk-disp.c        |  8 ++++----
 drivers/pwm/pwm-mxs.c             |  2 +-
 drivers/pwm/pwm-omap-dmtimer.c    |  4 ++--
 drivers/pwm/pwm-pca9685.c         |  6 +++---
 drivers/pwm/pwm-pxa.c             |  8 ++++----
 drivers/pwm/pwm-raspberrypi-poe.c |  2 +-
 drivers/pwm/pwm-rcar.c            |  4 ++--
 drivers/pwm/pwm-renesas-tpu.c     | 10 +++++-----
 drivers/pwm/pwm-rockchip.c        |  8 ++++----
 drivers/pwm/pwm-rzg2l-gpt.c       |  2 +-
 drivers/pwm/pwm-samsung.c         |  2 +-
 drivers/pwm/pwm-sifive.c          |  2 +-
 drivers/pwm/pwm-sl28cpld.c        |  2 +-
 drivers/pwm/pwm-sophgo-sg2042.c   |  7 +++----
 drivers/pwm/pwm-sprd.c            |  4 ++--
 drivers/pwm/pwm-sti.c             |  2 +-
 drivers/pwm/pwm-stm32-lp.c        |  4 ++--
 drivers/pwm/pwm-stm32.c           |  6 +++---
 drivers/pwm/pwm-sun4i.c           |  2 +-
 drivers/pwm/pwm-sunplus.c         |  4 ++--
 drivers/pwm/pwm-tiecap.c          |  6 +++---
 drivers/pwm/pwm-tiehrpwm.c        |  2 +-
 drivers/pwm/pwm-twl-led.c         |  2 +-
 drivers/pwm/pwm-twl.c             |  2 +-
 drivers/pwm/pwm-visconti.c        |  2 +-
 drivers/pwm/pwm-vt8500.c          |  2 +-
 drivers/pwm/pwm-xilinx.c          |  4 ++--
 54 files changed, 96 insertions(+), 102 deletions(-)


base-commit: 1a4920940ebfd8d907858abd8f8dd09b13752946
prerequisite-patch-id: b423a9d049b4520ef37b40635c95004363ecf692
-- 
2.55.0.11.g153666a7d9bb


