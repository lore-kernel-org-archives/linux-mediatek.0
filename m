Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DA4C61D97
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 16:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:Date:From:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LD2mVmTYVkgVFaby6r4EipeMY5amZrRMiimJ3O/2RrU=; b=tdL7bXDLfTcihDEKELpiCTuwc8
	dyybSJVn2Dn6E7Yxy5O7So8lvSLO7+bzYkYEHpjMp8jBZVRdXiQZnFdDDwSKWSTLND1+/zaonSYIk
	wSCL1CldkNyKNoM8nsw6AnO4mAA9FFKqzh0r2Pzsxc6koX7SfwDzB36g/PPiLYvqujqFjF3jd4Bpd
	x0fJ8kPxyp6mZb/6hL0lZ1qlVG9tEpfxcRM/7OLJ1AVE6BdI8Sk3H7thw7UZnI8wRskDSutZd5uHO
	q/DdcEPYTT0MLI4hVcIbp0Kg8YvwHSXBrxjU9V+mk9jdZM3BZsy7C/fhhyTkKmb1NeuB0q4BNUr3K
	HvQziGlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLROp-00Fccd-2U; Fri, 27 Jan 2023 16:16:23 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLROk-00FcYv-2b
	for linux-mediatek@lists.infradead.org; Fri, 27 Jan 2023 16:16:20 +0000
Received: by mail-wm1-x335.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso1025401wms.4
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Jan 2023 08:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=LD2mVmTYVkgVFaby6r4EipeMY5amZrRMiimJ3O/2RrU=;
        b=5seBXzzPgAeLvHuN9wPZVB6vmQFDHRfeQT+yEEifWtgG1OEyoAI8qCCWDB+eAYBjJt
         kw1UiK+Sko5zfe32q8ksuqAK3DJZg80mFqkRae2Y27vmECvHzrYBoS6wd/pXpT4PZGHj
         S7hTqxrketXSov7vmhY3DoTy6WRjkqO7XyxR/c4bApyUcyrN62VS4E89kY/Dfyczoqk0
         /Qml15BPIxlw70zpH802Gwn3j0DECyHP4sw80t/gxE+eq8uY9F9EswFBFPC/gnZAjSfD
         8rbXCSfltXoI25jlvp33H/24Dz+2OW2ryZtYk8iSEk8N96sXn4Se5JzSMYDf2o3UZxtV
         cDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LD2mVmTYVkgVFaby6r4EipeMY5amZrRMiimJ3O/2RrU=;
        b=1FuyIHq3+LVtc2Tk8sXRoW0zYC/j4/KutliPpcUnghwOSpb9iQdQD8plNB4kP+UY+4
         LkQrw4muV3u68GiFYsegCDQFCqhxqNek2M6IUpiZnUfjpTvKQyToB8Xz9PE2OtbJJaaP
         rSWnh9pqhK14OitjlZDgfbzrmGGaA46/Z8gQkauiZQ195zzolQzgS2lySlzUfLmBZkXZ
         qxxUmBjIQznBuu15EG2GAjnaXJYIkum1TwwLWk7r0BpO9bY+Apj6u1gYuS6X7nXM3EnG
         28UyL5MJqmxNAylE5BQDdTZfnuYOSXIFOVk7/c5NI54Ft/C+mKgE6hqXMmMfuO3vaG+b
         0s0g==
X-Gm-Message-State: AFqh2kpdqjCPH0HJ17bifNeSoI0Hb2QYshrCPh0NZF2Q+kKhIZOLGWVU
	LShJukZoFjqXt6KagUqGlNUFsQ==
X-Google-Smtp-Source: AMrXdXtOR4HuyLKvrKjT1o730urF+dKgb/mtCV6kH3TJ6KcijSkrbqDijR+KMDRiCxTlZwoNuU1aSQ==
X-Received: by 2002:a05:600c:d3:b0:3da:23a4:627e with SMTP id u19-20020a05600c00d300b003da23a4627emr38891278wmm.6.1674836176508;
        Fri, 27 Jan 2023 08:16:16 -0800 (PST)
Received: from [127.0.0.1] ([2a01:cb19:85c2:1100:7fe1:513:212f:568e])
        by smtp.gmail.com with ESMTPSA id e19-20020a05600c439300b003cfd4e6400csm4744566wmn.19.2023.01.27.08.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 08:16:16 -0800 (PST)
Subject: [PATCH v6 0/3] Add MT8195 HDMI phy support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIALX302MC/23MywrCMBAF0F+RrI3kMU0TV/6HiORVG+wDEi1I6b87uBFCV8O93DMrKTGnWMj5sJ
 Icl1TSPGFQxwPxvZ0ekaaAmQgmBDPc0D6M6T6+ngQXzpZIXbaT73EzvYcByz6V15w/v48Lx3P944VT
 RkEDaK680UxfnP0MyeV48vNIbsgXURGBRAM3wXfQMRN2iKyIRGI1k51QinHR7hCoCCBxwQseuWRtND ukqUiDpJOgAMB5aGqybdsXGnUs+14BAAA=
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Fri, 27 Jan 2023 17:11:33 +0100
Message-Id: <20220919-v6-0-2f641c422cb6@baylibre.com>
To: David Airlie <airlied@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jitao shi <jitao.shi@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, stuart.lee@mediatek.com, Guillaume Ranquet <granquet@baylibre.com>,
 mac.shen@mediatek.com, kernel test robot <lkp@intel.com>, devicetree@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.11.0-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_081618_371955_5F9B1A1A 
X-CRM114-Status: GOOD (  13.63  )
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

Add support for HDMI phy on MT8195.

This is based on top of next-20221128

To: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Kishon Vijay Abraham I <kishon@ti.com>
To: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: CK Hu <ck.hu@mediatek.com>
To: Jitao shi <jitao.shi@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mac.shen@mediatek.com
CC: stuart.lee@mediatek.com
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
Changes in v6:
- Adapt clock bit ratio when TMDS is over 340M
- Used sized integers for register read/writes
- Removed useless comments
- Shortened function names
- Link to v5: https://lore.kernel.org/r/20220919-v5-0-f346444bc459@baylibre.com

Changes in v5:
- Fix compilation errors on 32 bits platform with no support for __udivdi3.
    Compile tested on mips with gcc-12
- Link to v4: https://lore.kernel.org/r/20220919-v4-0-bdc21e1307e9@baylibre.com

Changes in v4:
- Dedicated series for HDMI phy support (without the drm/ related
  changes)
- Removed useless variable initializations in phy driver
- Link to v3: https://lore.kernel.org/r/20220919-v3-0-a803f2660127@baylibre.com

Changes in v3:
- phy: Grouped register and bit definition together to add clarity
- dt-bindings: Addressed comments
- Link to v2: https://lore.kernel.org/r/20220919-v2-0-8419dcf4f09d@baylibre.com

Changes in v2:
- Removed syscon requirement from the hdmi node
- Use as much as possible bit FIELD_PREP/FIELD_GET macros across all the
  patches
- Make cec optional dynamically instead of hardcoded with a flag
- Renamed hdmi variants to v1 (legacy) and v2 (mt8195) while waiting for
  a better name
- Rework hdmi v2 code to use a connector (same as v1)
- Remove "magic" 0x43 addr special handling in hdmi ddc code
- Link to v1: https://lore.kernel.org/r/20220919-v1-0-4844816c9808@baylibre.com

---
Guillaume Ranquet (3):
      dt-bindings: phy: mediatek: hdmi-phy: Add mt8195 compatible
      phy: phy-mtk-hdmi: Add generic phy configure callback
      phy: mediatek: add support for phy-mtk-hdmi-mt8195

 .../devicetree/bindings/phy/mediatek,hdmi-phy.yaml |   1 +
 drivers/phy/mediatek/Makefile                      |   1 +
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c         | 517 +++++++++++++++++++++
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h         | 111 +++++
 drivers/phy/mediatek/phy-mtk-hdmi.c                |  15 +
 drivers/phy/mediatek/phy-mtk-hdmi.h                |   3 +
 6 files changed, 648 insertions(+)
---
base-commit: e2f86c02fdc96ca29ced53221a3cbf50aa6f8b49
change-id: 20220919-hdmi_mtk

Best regards,
-- 
Guillaume Ranquet <granquet@baylibre.com>

