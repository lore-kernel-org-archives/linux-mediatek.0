Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91529C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 08:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BiiV58nU4rcN8bdraPGg645D1WoAdToltdDT10Y4MlA=; b=qsh5jKoo7K6Agal1FWnPcnnPP5
	oa9MkB++Pnh6nEe2aDjYRBKW80S11olGLGFLcfvy25r9h6gfei5RrCApg9anA1h4yHfSOrEkzmMmD
	15xJhOAMYJ4j12QhFYVyx8/+4up9E6VeYDdhbGP3/wSjS07UQGsAZAi9NRZKPGz4gAZKvqF7ul50T
	gMx7BtoNJWoaxIwN6yoHLMEOuVoHHUOW1SmsqaoIDIUbl9zcrzwNtZABJf/vhYRpseqTtY5qsq727
	oVuC0ywFKnwWIDs86MmntjNenijP2QOxBTKDNHLTOjsmOSxXyW7emrLd2TtzvnvFiF4Zg7ld7rtYO
	XcG+r+yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFtJ4-006jBm-TB; Mon, 25 Jul 2022 08:19:14 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFtJ1-006j6i-1q
	for linux-mediatek@lists.infradead.org; Mon, 25 Jul 2022 08:19:13 +0000
Received: by mail-wr1-x42e.google.com with SMTP id k11so14389071wrx.5
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Jul 2022 01:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BiiV58nU4rcN8bdraPGg645D1WoAdToltdDT10Y4MlA=;
        b=yxSj25Jac0tBpewedcx75I0V8AXibC32IcqyFe5LWXT2XFcLbjj/VCWyt1YjR+Ambn
         4trkkyYubCldCHZgCtjTWcN2hj9fO7UMhw8fH8KAkBC4EXnr20asStmofrcxbG95hZi9
         qrO/nduVf/pBba+PHSS1PVku10Q76Uo+Kohv+5TLKZsUquUpAtxqbMrmGDrgj+EaNSYP
         yR7ajhLMqkZBaEOWHCrqI5IiwMyWymdNT6HPRgdBpQiGBa922y8hgDm7jBg77DKD5TKs
         A97TM4WFRhZA0PLJPPURZEK/s1GKD0xThMUIRIs1FfX0yvnF/i3tLcQEPtxuRQ/egi1G
         dysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BiiV58nU4rcN8bdraPGg645D1WoAdToltdDT10Y4MlA=;
        b=xT9Y3mGNkuudpqGWsbm1GCSQ70Z96D70haooCMuJHdu65T+BjdhEtEh/eE1i/XjaXd
         +0Ti72ZoPWDv21GTt8QQEzQsFVWr59Pv52Zflk46ajnGi8IUAHRJrThosG+cp1479d6L
         AVvX2A+ydURKNH/2dkHp85teU4Xq6Fw1uA1kgeZmfKgycpJX/qI03xD69cc8XHqC66zS
         DFh9ytDTv719tKwhvtCCuBVaEPKd9KWaO0SesNLa3QgCNkmnglOG9E+4utXuzASQhY3K
         9woBzeN9iooR/2/t96nMDDWd+fBmJjzBFsIo+zfPc8lwUrBgqdTtBUEbh/UkcmnhcR3x
         4d/A==
X-Gm-Message-State: AJIora8TgZfE/nGoOZgzl2dj38dEf2gdHPRT/tSAAeIJItmihYF1cWi1
	MQwK7zOnnsQIyw8UrlhG7ljMVQ==
X-Google-Smtp-Source: AGRyM1s09Hj0Ovo8gO4XIgJh8/tiWDq5AfIXHuQX7HAQyK6OBlWljcZEzkfM801KP4JxiVQI7Qx9/A==
X-Received: by 2002:a05:6000:1acb:b0:21d:ad71:3585 with SMTP id i11-20020a0560001acb00b0021dad713585mr6633475wry.156.1658737147630;
        Mon, 25 Jul 2022 01:19:07 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4090:a243:806e:25e7:daa:8208:ceb])
        by smtp.gmail.com with ESMTPSA id x3-20020a05600c420300b003a3200bc788sm16695264wmh.33.2022.07.25.01.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 01:19:07 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Weiyi Lu <weiyi.lu@mediatek.com>
Cc: Fabien Parent <parent.f@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v2 0/4] soc: mediatek: MT8365 power support
Date: Mon, 25 Jul 2022 10:18:49 +0200
Message-Id: <20220725081853.1636444-1-msp@baylibre.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_011911_275293_9163A2CD 
X-CRM114-Status: GOOD (  10.55  )
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

this series contains patches related to the support of mt8365 power domains. I
took over the series from Fabien.

Best,
Markus

Changes in v2:
- Updated error handling path for scpsys_power_on()
- Minor updates described in each patch

Previous versions:
v1 - https://lore.kernel.org/linux-mediatek/20220530204214.913251-1-fparent@baylibre.com/

Alexandre Bailon (2):
  soc: mediatek: Add support of WAY_EN operations
  soc: mediatek: add support of MTK_SCPD_STRICT_BUSP cap

Fabien Parent (2):
  dt-bindings: power: Add MT8365 power domains
  soc: mediatek: pm-domains: Add support for MT8365

 .../power/mediatek,power-controller.yaml      |   2 +
 drivers/soc/mediatek/mt8365-pm-domains.h      | 147 ++++++++++++++++++
 drivers/soc/mediatek/mtk-pm-domains.c         |  98 +++++++++---
 drivers/soc/mediatek/mtk-pm-domains.h         |  29 ++--
 include/dt-bindings/power/mt8365-power.h      |  19 +++
 5 files changed, 267 insertions(+), 28 deletions(-)
 create mode 100644 drivers/soc/mediatek/mt8365-pm-domains.h
 create mode 100644 include/dt-bindings/power/mt8365-power.h

-- 
2.36.1


