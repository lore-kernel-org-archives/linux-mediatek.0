Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131A8C369B7
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 09:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hg1NYIg/4Cp0y5bNhAKciX8PEp+xLYeFC0blmyCsPuE=; b=tankpJvJmiH5uFvaSAXd3BME8M
	LgEjxt3xxsL1q8M7WEEGSptonu0YK8BG3tzMQX4Ht7wfCz+xvlmH08czUyMXphfakDQjSWbzYjxUb
	eV4lmy8N8hDo8qFg+MTV2KCcRwcCsJeZ1OJuJ5nA0rXCXqTkSPsqyDt8xJloZvIVbMA9b/9+8540I
	wd62eS0kiGMoDzRkDtLJowaFrEDBWP/HF0MhXAR8cpbZnP0pG3Sl6RjyoNooqZ38k61CYRIrSWToY
	PXDKgiMkR9Qv/dVFPflPz0HBaZ0s0P2+vlv0JQ0xb1jLi1vCszVLw7QOPZ+WJ84OUmcZL/jO5hekO
	Dt/y8k4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stOTg-00000004dPj-08Jo;
	Wed, 25 Sep 2024 09:38:32 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stOTP-00000004dK9-0NUM
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Sep 2024 09:38:16 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-71971d20a95so4492390b3a.3
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Sep 2024 02:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727257094; x=1727861894; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hg1NYIg/4Cp0y5bNhAKciX8PEp+xLYeFC0blmyCsPuE=;
        b=fQQaRWxdm5+a+JSeiTDWKFqeUxoz3cFnX9YVHHc2ThQWB3lxTMEwFcLyK4+S+sWtY0
         Cn3WD5iaAOWlek+iBfsktaaZc0A6Uhwep7fk8S3/N1IDw5RqNJwID8KLaLxf39wgtK0u
         VLWUM4QnbdwXAo3dJZgNiVejr5hW1IGw+lh/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727257094; x=1727861894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hg1NYIg/4Cp0y5bNhAKciX8PEp+xLYeFC0blmyCsPuE=;
        b=b0ACavWQdGBGZ/7/4l2CurxmMVi7/8tYXMMshcvU2kRRdP1C+rn1rFv3lAnJiUM421
         b3kIz51AcQWiNU+ugo1jXGvgERrcZvS71kM+odONasf81lsrKA1jOdg76bKQZMmU17zT
         Bj0Be5sV8588R7OfyyqQjK26NRYJqYMIZfL8g3Ymy9Ovhb4fmKUtAB3hS1c2sEXZgUF5
         1ImOe9T5ZkbTJxlh/dKy3a43pk2z44zymWxzH20wjA7DhzMiQGD2pv5ApBkoE6aSMKWA
         pDd2TP+m2qaI0VbSChuPjECbBhBJunKVGEYijbE6oC0qWmoDw0afN3Rsyswrju+LBIiB
         YdsA==
X-Forwarded-Encrypted: i=1; AJvYcCWV+u9mVIBsENgjvodJbatcUz4lukrOJ+42Tm47V0tqcFfn41gNQ6zEK8wmafFBWqYY0nFqWdDbnUBkfk13nA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAW5PJEdlN1Llp5cdq+M/usxRygfORUpoA1K2Ngs6N2/t2SRs8
	nhw2Is1dnkyfC609pWlIXQVMh93OBBKum4h3OlfVNEKkKCYACoZzALNUkSPTSg==
X-Google-Smtp-Source: AGHT+IGy6BLTQ2yk8nK1BnDwn8ihRKFUDhdNkl6yPPDueqyuBMklhO/bVczNjLCMAQ+n1ABozov4dA==
X-Received: by 2002:a05:6a00:3e1b:b0:70d:2583:7227 with SMTP id d2e1a72fcca58-71b0aaa263amr3187086b3a.6.1727257093845;
        Wed, 25 Sep 2024 02:38:13 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2480:2c96:2b64:cdcb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71afc8347fesm2432789b3a.35.2024.09.25.02.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 02:38:13 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v8 0/3] Add of_regulator_get_optional() and Fix MTK Power Domain Driver
Date: Wed, 25 Sep 2024 17:38:03 +0800
Message-ID: <20240925093807.1026949-1-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_023815_182239_46DEA2D5 
X-CRM114-Status: GOOD (  14.78  )
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

Hi folks,

This series is split off from my "DT hardware prober" series [1].

Changes since v7:
- Added stub versions for of_regulator_get_optional() for !CONFIG_OF
  and !CONFIG_REGULATOR
- Added new patches for devres version and converting MTK pmdomain
  driver

At ELCE, Sebastian told me about his recent work on adding regulator
supply support to the Rockchip power domain driver [2], how the MediaTek
driver has been using the existing devm_regulator_get() API and
reassigning different device nodes to the device doing the lookup, and
how the new of_regulator_get_optional() is the proper fit for this.

Patch 1 adds a new of_regulator_get_optional() function to look up
regulator supplies using device tree nodes.

Patch 2 adds a devres version of the aforementioned function at
Sebastian's request for the two power domain drivers.

Patch 3 converts the MediaTek power domain driver to use function.


Each of the latter two patches depend on the previous one at build time.
Mark, would it be possible for you to put the two regulator patches
on an immutable branch / tag? Otherwise we could have Ulf ack the
pmdomain patch and merge it through your tree. Sebastian was fine
with converting the rockchip pmdomain some time later.

Thanks
ChenYu


[1] https://lore.kernel.org/all/20240911072751.365361-1-wenst@chromium.org/
[2] https://lore.kernel.org/all/20240919091834.83572-1-sebastian.reichel@collabora.com/

Chen-Yu Tsai (3):
  regulator: Add of_regulator_get_optional() for pure DT regulator
    lookup
  regulator: Add devres version of of_regulator_get_optional()
  pmdomain: mediatek: Use OF-specific regulator API to get power domain
    supply

 drivers/pmdomain/mediatek/mtk-pm-domains.c | 12 +----
 drivers/regulator/core.c                   |  4 +-
 drivers/regulator/devres.c                 | 39 +++++++++++++++++
 drivers/regulator/internal.h               | 18 +++++---
 drivers/regulator/of_regulator.c           | 51 +++++++++++++++++++---
 include/linux/regulator/consumer.h         | 37 ++++++++++++++++
 6 files changed, 136 insertions(+), 25 deletions(-)


base-commit: 2b7275670032a98cba266bd1b8905f755b3e650f
-- 
2.46.0.792.g87dc391469-goog


