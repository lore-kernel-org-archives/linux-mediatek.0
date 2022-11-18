Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EEB4C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 11:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:Date:From:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W5utuasYQCY2PHwGIWNvE6GgspjSjL4TUNPHSyHes/I=; b=ApZL9wM96bl+gYVwgwudKTHFJJ
	1Tg8obH+lD+5xYqYcppzjp4WKsdBEwQ84GZls+gZHRjJwHejmhGABTqG7sWakSm7Y/RNZxmvMEsT+
	QLaA/a+aJzP6cC1TtVLt38T2b3gU8T1EAAf14e1i56XaJyJa+csRONDThpuvK2peV81unGX735Zha
	0WxpkTSitRTqFvhH6TSkm+rGIeJuD18rL7KJDsb35qJkdSzNenbZxyye4qIes4Cc//XUxlpI8Iqw9
	Jrw/wZ/bi6yekipODCOj1+0N3ONPAGTb7bC47ccH8w2Q8T2/Up8xhVsubqZt+CsajBFAjC1SFgMbn
	Z1eeHxCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovzAy-003XKy-Sh; Fri, 18 Nov 2022 11:04:52 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovzAr-003XHA-9g
	for linux-mediatek@lists.infradead.org; Fri, 18 Nov 2022 11:04:52 +0000
Received: by mail-wm1-x335.google.com with SMTP id 84-20020a1c0257000000b003cfe48519a6so1012814wmc.0
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Nov 2022 03:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=W5utuasYQCY2PHwGIWNvE6GgspjSjL4TUNPHSyHes/I=;
        b=rSp9wAeTTAd+4EW6fNzgLlHHLU+EUHjuaCW7QbiIc2imX1FEIYxAES8RXClaTTvszF
         W8YsZh4otqH2pIO/hYL8a9lO0CzpX76WgvRaP99NHKhQPMvWn26pyWvD3xYNoNfDbUqL
         BtVrBxGY06h/2Yywyu7E8uHCdbLTDMkhLrMfhId2OnRzAcnS8g7Ryw0TpXqxWAWKSUrE
         +lcxoiJKVtwx8on9X8mrNfx0dheTs1cYexAJ991Y24BajwzMQkfXuH8zT6MmW+zSrG44
         /1MM9wk07INizSU6dquUIgv1gCP0YliHX2OABjs34fgun6+YPuQXbL9GXvuboPXqRqJB
         1bbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W5utuasYQCY2PHwGIWNvE6GgspjSjL4TUNPHSyHes/I=;
        b=mVqCg2RgV3DC5ya+Hl+20nXVGiWu8gY1BtvvJFNaXQSM2LmixQndukH6EWFMswI/4U
         9HnwXcmNfB81SLnG+AeqpBauBGir6x3lfDovhKMSgFbII8nif/wFk3iUj96kXTkbe6sN
         QR1/oH3qzy4EOKkblQkepCaR7WY0TEWh3SHrUOCnTHL1eZOFmHiUzV9VE1Z+NIM6FNJV
         3gzxCWfuGsHNctfBa8YkW4Ygj2nRuK8Aw2y38hH81WPFTBd/D3cmu1fQKiR8lkfXX2xu
         xyx283X2ruhwb2Ys7CXXMdJL6UBIV2VDhyMlaeHUxIDR4p8vaGeX6MA3Ig9uY1eJGZIE
         RG9A==
X-Gm-Message-State: ANoB5pnn0/oGtnU86+DhSZwPieFep2UF09PVcCYo1suuhv3Qlq7dM+a/
	Wqg3cRqtNqcxYdHEd34bahcfXw==
X-Google-Smtp-Source: AA0mqf7vxiK6P3WffMyqgJ/8O3L40bk6P5sB2XrwVhiaTgxXC7+NTxtdHsFvSQzKB4yODDsSh9V93g==
X-Received: by 2002:a05:600c:2241:b0:3cf:9ced:dce4 with SMTP id a1-20020a05600c224100b003cf9ceddce4mr4440637wmm.120.1668769482928;
        Fri, 18 Nov 2022 03:04:42 -0800 (PST)
Received: from [127.0.1.1] (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.googlemail.com with ESMTPSA id i14-20020adff30e000000b002368a6deaf8sm3316948wro.57.2022.11.18.03.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 03:04:42 -0800 (PST)
Subject: [PATCH v7 0/4] thermal: mediatek: Add support for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIALpmd2MC/4WNQQqDMBREryJ/3ZSoJLFd9R6liyR+zYcYJVFBxLv30wt0NbwZZuaEgpmwwLM6Ie
 NOhebEYG4V+GDTiIJ6Zmhk09Sy7sS2CGqVFGvAPNkoXKY0smn7ttN9a6TSA3Db2YIc2uQD99MWI5uB
 yjrn4/e2a5b3/+FdCyl8Z9xjMEop6V7OHpFcxrufJ/hc1/UFFjuc5sYAAAA=
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Date: Fri, 18 Nov 2022 12:04:26 +0100
Message-Id: <20221018-up-i350-thermal-bringup-v7-0-ebf08ff2eddb@baylibre.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Amit Kucheria <amitk@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Zhang Rui <rui.zhang@intel.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fabien Parent <fparent@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Markus Schneider-Pargmann <msp@baylibre.com>, linux-pm@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Michael Kao <michael.kao@mediatek.com>, linux-kernel@vger.kernel.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Amjad Ouled-Ameur <aouledameur@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1668769481; l=1063;
 i=aouledameur@baylibre.com; s=20220920; h=from:subject:message-id;
 bh=pMaGIEwsrzpZmq4GokUNu2T3+sSq40Jxnt5PukxJb8M=;
 b=q8wORfumvupXVJQ0eIbhIXe7py+37KKcDffQKokfWVSbm5S8yMAD9qYJilKiWAIgwU25Mw2RsN52
 5oNC9SGcABiEPep3Vj6BgcRGwlaB+KYwjBL+tHIyQHhDJ5OZEqfc
X-Developer-Key: i=aouledameur@baylibre.com; a=ed25519;
 pk=HgYWawSL4qLGPx+RzJ+Cuu+V8Pi/KQnDDm1wjWPMOFE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_030445_587936_3DBB5038 
X-CRM114-Status: UNSURE (   7.25  )
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

This patchset adds thermal support for MT8365 SoC which contains three
thermal sensors.

Changes in v7:
- Fix devm_thermal_of_zone_register() error checks.
- Link to v6: https://lore.kernel.org/r/20221018-up-i350-thermal-bringup-
v6-0-c87b9f75550b@baylibre.com

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
---
Amjad Ouled-Ameur (1):
      thermal: mediatek: add another get_temp ops for thermal sensors

Fabien Parent (2):
      dt-bindings: thermal: mediatek: add binding documentation for MT8365 SoC
      thermal: mediatek: add support for MT8365 SoC

Markus Schneider-Pargmann (1):
      thermal: mediatek: control buffer enablement tweaks

 .../bindings/thermal/mediatek-thermal.txt          |   1 +
 drivers/thermal/mtk_thermal.c                      | 192 +++++++++++++++++----
 2 files changed, 161 insertions(+), 32 deletions(-)
---
base-commit: 9d2bc364f67793cdd115f3ab92a18eaf85fee66f
change-id: 20221018-up-i350-thermal-bringup-ad386d37056f

Best regards,
-- 
Amjad Ouled-Ameur <aouledameur@baylibre.com>

