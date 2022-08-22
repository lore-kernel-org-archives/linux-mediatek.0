Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F331FC3F6B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Aug 2022 15:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+v4yKbwJErYTuQ2Ufma5DTI3KicddoMcYUAjV+10QH4=; b=WZggj2Ss7fFzg+XvqdYW5iVsiq
	txQJhko0NtKEMaJkthVNTBpIOPhi1KkDumOsHUJBgtnNWpoA/+djZZPhM9xQn1G9mOSDvZdFShrER
	NJ21V8iOtnic2Hrvds+UZVUBnPtNNTv8RWx/unJQTjTEY6RY96XK0LIX/CEd9YiuT70j523Mku6qa
	1O9gLpa1r6c94t0I80uqTOFla9Pig2eOgatDcPou4P7G0E/y6NsRSdqivqgzzAJ3ZRXHKP2DP239z
	V4qPC4nfqSw1ejwOd1AolV+tbTsk14txOhpancP9vWFT8Xod9FVWbxyePHkwDfI7Zg5ImnLR4LhMA
	QZQqioaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ9L0-00CBHP-7w; Mon, 22 Aug 2022 15:27:38 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ9Kt-00CB7K-D8
	for linux-mediatek@lists.infradead.org; Mon, 22 Aug 2022 15:27:34 +0000
Received: by mail-wr1-x434.google.com with SMTP id a4so13697264wrq.1
        for <linux-mediatek@lists.infradead.org>; Mon, 22 Aug 2022 08:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=+v4yKbwJErYTuQ2Ufma5DTI3KicddoMcYUAjV+10QH4=;
        b=jOVa5k+VR0xECB0FvAPknlvOs70kbJwGA0M6vShkkwU/M+ofySHJMBFDImFvCfRy43
         +porc14Ri8mjhpMzvx7NhnAN900R01op2vihQ+M0GZGwamuFkLPbvmcL4f9AoWBVy3+G
         CvVfDCVWKrZTo5LXpnv2tC7Ov19YCStZu2DVm2gw+nTI3ChqsiAoho+n80ZJQN1Kul43
         QXTkjqiQ3O7Czm8qdTQfkKBLy8TI71V5QoDWAe7k9EZrttHfOY6eoQwTY1TipUQ/Wexi
         p6+3SMepTaVRgUqL7NNfzAiF4LcN7QSGHsEqX/4QS8LOE/VGxdo/x6mdLeDb+KOZnmva
         dQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=+v4yKbwJErYTuQ2Ufma5DTI3KicddoMcYUAjV+10QH4=;
        b=I47LzySnYdXyfkbb9lueIE/zY4Ddt5njrL7NFzHozTf/7xrA92hEptu5qs524jO4bA
         /BU6Ux9snHLRWYI2iMx9+1XEOW/RFxGhKNlmkKDMWFnILLGH+dm69fzuKtulwcRe5ETC
         M23nYgMp+eYlrMq71DrchDnNNY3yoAHb5quXQTrZzfDFOkdfWjPNlAbl3uwdVpesb1i+
         FSPhaPN3mwFDFY+aKKcROGjx0xx/djivo0BizRUe9nRYnsQwfUYYTnasaOWKeO7sTUyu
         JrXmGUQKEbQapX0DyFqVn7/PqEghBaw6EUa8zVNCHR4QKljRePcfLo3o+47DGWNScXU0
         Al4A==
X-Gm-Message-State: ACgBeo0qjJg465dSld1WTC45/Tw23BaPiErnLASBfm1ZwUrA19L47+tK
	16GFurCmIqpOW0a78NQi75kKbw==
X-Google-Smtp-Source: AA6agR7oEwBwW1qpYTRjGd7zeB5BXy6D1qbA9ArFwSTnG12IGsnupD9b4ZC3CKX2TbWM1fY8P9y06g==
X-Received: by 2002:a05:6000:1a8b:b0:222:cac3:769a with SMTP id f11-20020a0560001a8b00b00222cac3769amr10524573wry.120.1661182048866;
        Mon, 22 Aug 2022 08:27:28 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4090:a245:8020:2658:1f7c:362:3e99])
        by smtp.gmail.com with ESMTPSA id u18-20020adfdb92000000b0021eaf4138aesm14492011wri.108.2022.08.22.08.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 08:27:28 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Fabien Parent <parent.f@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v4 0/4] clk: mediatek: Add mt8365 support
Date: Mon, 22 Aug 2022 17:26:48 +0200
Message-Id: <20220822152652.3499972-1-msp@baylibre.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_082731_471822_0A59922D 
X-CRM114-Status: GOOD (  10.59  )
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

Hi,

This series adds a clock driver for the mt8365 SoC.

Thanks for the feedback so far.

Best,
Markus

Based on https://lore.kernel.org/linux-mediatek/20220813083249.45427-1-y.oudjana@protonmail.com/

Changes in v4:
- Rebased onto v6.0-rc1
- Fixed some minor things documented in the patches.

Earlier versions:
v2 - https://lore.kernel.org/linux-mediatek/20220530214434.1012889-1-fparent@baylibre.com/
v3 - https://lore.kernel.org/linux-mediatek/20220811084433.2598575-1-msp@baylibre.com/

Fabien Parent (2):
  dt-bindings: clock: mediatek: add bindings for MT8365 SoC
  clk: mediatek: add driver for MT8365 SoC

Markus Schneider-Pargmann (2):
  clk: mediatek: Provide mtk_devm_alloc_clk_data
  clk: mediatek: Export required common code symbols

 .../bindings/clock/mediatek,mt8365-clock.yaml |   42 +
 .../clock/mediatek,mt8365-sys-clock.yaml      |   47 +
 drivers/clk/mediatek/Kconfig                  |   50 +
 drivers/clk/mediatek/Makefile                 |    7 +
 drivers/clk/mediatek/clk-mt8365-apu.c         |   55 +
 drivers/clk/mediatek/clk-mt8365-cam.c         |   57 +
 drivers/clk/mediatek/clk-mt8365-mfg.c         |   63 +
 drivers/clk/mediatek/clk-mt8365-mm.c          |  112 ++
 drivers/clk/mediatek/clk-mt8365-vdec.c        |   63 +
 drivers/clk/mediatek/clk-mt8365-venc.c        |   52 +
 drivers/clk/mediatek/clk-mt8365.c             | 1155 +++++++++++++++++
 drivers/clk/mediatek/clk-mtk.c                |   37 +-
 drivers/clk/mediatek/clk-mtk.h                |    2 +
 .../dt-bindings/clock/mediatek,mt8365-clk.h   |  373 ++++++
 14 files changed, 2110 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8365-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8365-sys-clock.yaml
 create mode 100644 drivers/clk/mediatek/clk-mt8365-apu.c
 create mode 100644 drivers/clk/mediatek/clk-mt8365-cam.c
 create mode 100644 drivers/clk/mediatek/clk-mt8365-mfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt8365-mm.c
 create mode 100644 drivers/clk/mediatek/clk-mt8365-vdec.c
 create mode 100644 drivers/clk/mediatek/clk-mt8365-venc.c
 create mode 100644 drivers/clk/mediatek/clk-mt8365.c
 create mode 100644 include/dt-bindings/clock/mediatek,mt8365-clk.h

-- 
2.37.2


