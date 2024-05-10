Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1FEC25B10
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 May 2024 08:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dnr78Drl0hwy8QosBN5FMiEeANWK1Ml2Xi29sDzFrpE=; b=aq4wJWJTnHfFRkFv/n4X5c5aLh
	yGYG4U1sGX9NXSsF5pXxRxK6g0W4hMgscb3IX2lWmbdHkhLOgJT2EXiFSuIbiBuX2enSEJxE3C/g1
	e1J85H+O6rxJLHZPWqgYlOreGzlUcK//dyQrDY0/NVrVd9EgFUgCUMV0C815Ayp3picwhDJKa9lMZ
	zxIPCVJsdi8eVO9QE3jtk3cCwNa1jGj4Y0+sjwXPDmtXKL32jKmJSWVpVIWNZoTz+nn5jIc8H/mQb
	nn5FZRAvvl6YvM8nqOzlzITIK/sZnDrPbCXyD3c1rz9kT6avCYoBiIrYhhvHQOIDtu5JCpLmtSWVD
	LJkjdagg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Ldo-00000004VKD-1LeC;
	Fri, 10 May 2024 08:30:08 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5LdP-00000004VBG-4AiS
	for linux-mediatek@lists.infradead.org;
	Fri, 10 May 2024 08:30:02 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-ddaf2f115f2so2707527276.3
        for <linux-mediatek@lists.infradead.org>; Fri, 10 May 2024 01:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715329776; x=1715934576; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dnr78Drl0hwy8QosBN5FMiEeANWK1Ml2Xi29sDzFrpE=;
        b=g4wIewXaq45bxU5f6OeoxEha1ACMN1rD0f6f5V2V9IgHqKXxr3HPNX5SMNwAUFt/cU
         KurMXhILeZGIqWGtUnUNH1eJnvB5c6WDmWEIbE+I1A7vRRllJFxyyZI6lQEVi/o6exWA
         +HYxxXrzt7PNpNXMU4+PeCK9KaXIEQPuLQi0XcLOx2KnoBXH0F+Ulk0k2AraefoZ9uQm
         IARKU0pj62QcYfHnWI/Bew1tTYoBvNXjivY/lZ2imibDZ9HEBvcnq+eYag97GOa98fkS
         VS16d/TZ07BWq5MKtEWhzzdDHIKgcdxi86FPcKi4EIoePioIBKxHWKR8/SP3mLWtKjNR
         J3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715329776; x=1715934576;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dnr78Drl0hwy8QosBN5FMiEeANWK1Ml2Xi29sDzFrpE=;
        b=jg/MGHPani9pGQmthhMC3wIyxOe32rhuIb77KiOmOFRv/ur9VCRVvMVo1VzNed7abN
         X1SiQCaVgbrgR3ofVoufQyzjxxKiNCuc375CXqqq0ahbcIXpncqYJVoZJK7hWnFvndwp
         EVOwZLU3hzpAo6999c5MEtyikKldb26RmTpAFj1thid9xTFzbnXKtEavomTlUFBkJ/YP
         2esNe5Jbzan6vqSQfOqrFK5KT+WfnR5SyI8Tl5rLZrHcnJhdPzahpMvWYfaRD7xN25lV
         H1YwGr0IW8vi4LF5rOJHbGvnHtzCW3R1+YclflWZ5GrOx5fux80mDTnACkFF+9ozb0Jo
         IrJw==
X-Forwarded-Encrypted: i=1; AJvYcCUHQNgfPygI0KhQ44/lVI4t9lQdFjMaZHcCTM/oKZO46jlxfGJc7OVdQ6HiFGMY3r/4XBXCn98LDmht8iY9elu8m7qnuQ7+BviDdymDt5b2n//a
X-Gm-Message-State: AOJu0YyO+U7UNxX0KjObSVMIGoD+O3dn+JUFI6yvqOxZulY3ARGC9Qrs
	14bC7ZlLop1lXp+PejwCql4zJvsGGfrX6H9i3nZZfqm5DfE9E5PYRMDUSMH7jWbLdMFJprSa7QM
	fQIFkZ5Stqg==
X-Google-Smtp-Source: AGHT+IEiknRtBHdrQ2HgiFa5pD74L/Ye3Nv3Q0grhoikyts9vAUMehW+Dt9fd3K3/ZrjmNUP76nhD8GAX7HaoA==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:6902:c09:b0:de5:5304:3206 with SMTP
 id 3f1490d57ef6-dee4f52d715mr180759276.11.1715329776091; Fri, 10 May 2024
 01:29:36 -0700 (PDT)
Date: Fri, 10 May 2024 08:29:28 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510082929.3792559-1-joychakr@google.com>
Subject: [PATCH v3 0/1] nvmem: Handle actual amount of data read/written by suppliers
From: Joy Chakraborty <joychakr@google.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vincent Shih <vincent.sunplus@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rafal Milecki <rafal@milecki.pl>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	manugautam@google.com, Joy Chakraborty <joychakr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_012959_715897_167509BC 
X-CRM114-Status: GOOD (  13.10  )
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

This Patch series stems from discussions in patchset,
"[PATCH v2] nvmem: rmem: Fix return value of rmem_read()"
(https://lore.kernel.org/all/20240206042408.224138-1-joychakr@google.com/).
Where we come across the fact that currently the nvmem suppliers do not
actually let the core know how much data has been actually read or written.
Instead they are expected to return 0 for success and the core assumes that
the amount of data written is equal to what the core has requested.

On addition this patchset will also add some guards and checks based on the
count of data returned by the nvmem supplier.
---
V3 Changes : Fix return value of reg_read in sunxi_sid.c driver
---
V2 Changes : Rebase on for-next.
---
V1 Changes : Change read/write callback prototype to ssize_t and
supplier changes to accomodate the same with core checks and bounds.
---

Joy Chakraborty (1):
  nvmem: Change return type of reg read/write to ssize_t

 drivers/nvmem/apple-efuses.c        |  7 +--
 drivers/nvmem/bcm-ocotp.c           | 12 ++---
 drivers/nvmem/brcm_nvram.c          | 10 ++--
 drivers/nvmem/core.c                | 83 +++++++++++++----------------
 drivers/nvmem/imx-iim.c             |  6 +--
 drivers/nvmem/imx-ocotp-ele.c       |  4 +-
 drivers/nvmem/imx-ocotp-scu.c       | 12 ++---
 drivers/nvmem/imx-ocotp.c           | 10 ++--
 drivers/nvmem/jz4780-efuse.c        |  7 +--
 drivers/nvmem/lan9662-otpc.c        | 12 ++---
 drivers/nvmem/layerscape-sfp.c      | 11 ++--
 drivers/nvmem/lpc18xx_eeprom.c      | 14 ++---
 drivers/nvmem/lpc18xx_otp.c         |  6 +--
 drivers/nvmem/meson-efuse.c         | 22 +++++---
 drivers/nvmem/meson-mx-efuse.c      |  6 +--
 drivers/nvmem/microchip-otpc.c      |  6 +--
 drivers/nvmem/mtk-efuse.c           |  6 +--
 drivers/nvmem/mxs-ocotp.c           |  7 +--
 drivers/nvmem/nintendo-otp.c        |  6 +--
 drivers/nvmem/qcom-spmi-sdam.c      | 12 ++---
 drivers/nvmem/qfprom.c              | 14 ++---
 drivers/nvmem/qoriq-efuse.c         |  6 +--
 drivers/nvmem/rave-sp-eeprom.c      | 18 +++----
 drivers/nvmem/rmem.c                |  4 +-
 drivers/nvmem/rockchip-efuse.c      | 19 +++----
 drivers/nvmem/rockchip-otp.c        | 19 +++----
 drivers/nvmem/sc27xx-efuse.c        |  3 +-
 drivers/nvmem/sec-qfprom.c          |  4 +-
 drivers/nvmem/snvs_lpgpr.c          | 17 +++---
 drivers/nvmem/sprd-efuse.c          |  8 +--
 drivers/nvmem/stm32-bsec-optee-ta.c | 12 ++---
 drivers/nvmem/stm32-bsec-optee-ta.h | 20 +++----
 drivers/nvmem/stm32-romem.c         | 26 ++++-----
 drivers/nvmem/sunplus-ocotp.c       |  4 +-
 drivers/nvmem/sunxi_sid.c           | 18 ++++---
 drivers/nvmem/u-boot-env.c          |  6 +--
 drivers/nvmem/uniphier-efuse.c      |  6 +--
 drivers/nvmem/vf610-ocotp.c         |  7 +--
 drivers/nvmem/zynqmp_nvmem.c        | 13 ++---
 include/linux/nvmem-provider.h      |  4 +-
 40 files changed, 255 insertions(+), 232 deletions(-)

-- 
2.45.0.118.g7fe29c98d7-goog


