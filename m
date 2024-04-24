Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68065C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Apr 2024 07:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zl0sYd+valIIqLNedoYvnicwykqmWgTtyjDljuZmiec=; b=GABveiAd3KCRAcqixwnbfIbZf3
	b9oPfZ0ywXktBYSVLeDZdyOUzQptd0ZyYOaDe2/5gUl6RdoL4wozRsckvhdCdrGFVgD9Uog+ZPuZy
	/OOKezuz5sT5jJR8PauljYDcFgxmo4IubcRU+9MiLJxPrbS57MxQLfw141yqO42efN1ETiI7X7JHr
	aL0VMWuFBqMgjW2Tr/7/2MOjhfSi5j226QCOoPtsMyCrz1nbYcQLG0qMFuu7mrfrQCc3CiroFn3u8
	7bP/zG+avoAiiguC+ty64utRspI2D/hpRZZHTipLR/EZyKchiD2e2qj7n3jC2MJ6AMYElBtPiA5MO
	d1Q1uU5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzXHM-000000038cN-2DAF;
	Wed, 24 Apr 2024 07:42:56 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzXHI-000000038Zj-3Xsx
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Apr 2024 07:42:54 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6156b93c768so122436777b3.1
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Apr 2024 00:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713944571; x=1714549371; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Zl0sYd+valIIqLNedoYvnicwykqmWgTtyjDljuZmiec=;
        b=gEQ7NAVFDnd3CvCtLBp0k3q0OL43lOd3JInFRSbaFKIFRxXxZu74f+6Y9aaOfOfdHh
         q9pXCPgU6XGuN6dYJ9EENDK4RQJ32Sw2CwVwC0O2vWsN1qEHP/5MABd/bbKcioy1mtYB
         dum41xkbnuyUGABTJlvwjF0OxHRJAiHFnAyP4zm3voPUrTXwUZoXRdrFQ5Yr7e9COyE2
         92W1dzS4wiYEB7uRt16HEGKtNMYRYlU8YTXjxHlPUWj5zgAicBeKH35ka3PmEIHriP0+
         Ggn2OdtqnuCSDomISV8HgKg8Fr7ot2i/kp9svdt3YWMMs3BTEoEfli2/VO7CATwWPnrF
         vZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713944571; x=1714549371;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zl0sYd+valIIqLNedoYvnicwykqmWgTtyjDljuZmiec=;
        b=W2pRVVdV/sObbhjv27NjOTTm/hVRQpNbgdDVupl59KIyL5OdWzunNy67xpnMIUd764
         IyL1C00kk5od2V3LgYkAlcK2Zau2RH+OJZdKkaBoTy6jOWzFmx35g6t9Wsh7NNPXUUIt
         k8y2biz6+e8DhOfLWYaJASOmqUvkL6hr3Npw/wtSksMuqGw/CZ5T9tvMq5oumJucEcxy
         YBuWV0/BmrCaUz1bD/fzG8u3hVFbt0qnHDEcZ4YNKQ0iZj6wpipxe30AjGFfWJmqTLTJ
         MGr59KGD9K0g4U7xUae1frp9xTPlGgo5RdKsTW3qKPe1Gmel3EVuBVPQdvRtNehSEWtQ
         YLBw==
X-Forwarded-Encrypted: i=1; AJvYcCVDi/HdoEoeKMzKBZA0l/DTwsfL+yySzyEnmKfm3J7PmXZR6fBDHMrceIrhLUmASnkbbLauSVHMiDhNq4iokcAtDzjAYNMM8gdAkBlCcQrg7Efq
X-Gm-Message-State: AOJu0Yxbe6tN5Om6OUVj31mjLXm2Wlo7/y4jBXcCwLSjLa8szRWMkfVT
	UaF1U8rAdt7EN+EIu4c7yKNjmcwN3B7TcjKmyw5xs48hE3qJDprBKQqU5hDqGiRUuvBRxlCwFWg
	gnZPsfsOuug==
X-Google-Smtp-Source: AGHT+IHAgakRN1GMcYnGCFXgcp0S6jDEiv/2+gY/KRM4h43j6n7j458O2RZcU7HXGWBkkYoEbxUyhX44RKGCPA==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:6902:154f:b0:de5:1f88:ae4e with SMTP
 id r15-20020a056902154f00b00de51f88ae4emr651015ybu.2.1713944570760; Wed, 24
 Apr 2024 00:42:50 -0700 (PDT)
Date: Wed, 24 Apr 2024 07:42:41 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240424074242.519895-1-joychakr@google.com>
Subject: [PATCH v2 0/1] nvmem: Handle actual amount of data read/written by suppliers
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
X-CRM114-CacheID: sfid-20240424_004253_032814_ED780896 
X-CRM114-Status: GOOD (  13.05  )
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
 drivers/nvmem/sunxi_sid.c           | 15 +++---
 drivers/nvmem/u-boot-env.c          |  6 +--
 drivers/nvmem/uniphier-efuse.c      |  6 +--
 drivers/nvmem/vf610-ocotp.c         |  7 +--
 drivers/nvmem/zynqmp_nvmem.c        | 13 ++---
 include/linux/nvmem-provider.h      |  4 +-
 40 files changed, 253 insertions(+), 231 deletions(-)

-- 
2.44.0.769.g3c40516874-goog


