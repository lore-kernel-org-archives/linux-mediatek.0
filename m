Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD713C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 12:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6tu61aQY976wFqewmM03Lbqf3QeMwmJItjqmZZJcNnY=; b=Sg/ibzC+bJqbm6
	+bwFqndhYTKgKEu6GQMVT+Jv/k/jPEa2q8Ga12PPemjRg24omTiuLE6qZiYVgH2gzBezxHcGstXS3
	E1Lr0UrwcEeEQRRmQJ7OJf7cljpyR9x7D/0bX1/n1wh3BE/W96fXPvEXgA18n8fMWqF/OM9rmeh2G
	AN3q/VLmReDBfhIYGHaZRxbCjeb90KX3cHhLn0F1a6V1LVQx65i0InOiPUS05b2UeWjTeZeVGSgH2
	N/+Rufe57sxnmi+SKrAzGRG8mf06bEJlydbDEn2S+4l3BB0E6dTsa4IIkTAYEqmk2oSiS8Y+ozIGP
	YbHUOlzJSnBp+yEC2mzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np7s3-00BmLV-Ad; Thu, 12 May 2022 12:24:43 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np7s0-00BmIZ-1L
 for linux-mediatek@lists.infradead.org; Thu, 12 May 2022 12:24:41 +0000
Received: by mail-wr1-x42a.google.com with SMTP id v12so6989872wrv.10
 for <linux-mediatek@lists.infradead.org>; Thu, 12 May 2022 05:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/lkyfO2eAyTO3jx8KpN3l3Wbz2mTyqVdQD6u1bCXCsQ=;
 b=Fxvh74tV2njRBPP78K23MxdwqjHULXYFWnSf6xQsbi5pM7q2AtYojGBYVz/QIL5DGU
 rv/kHeURnBo13AaMfUsttjlguumUENusFh1V1nMJhp+lvj8AAzVceFvKqFuXvpdbHO+x
 BlvD5R/jpzd9vHgFJ4EJu/ifI/g1JHK8HRoPsVWJMaWlF53JVdJ8BOC4sB+pVLnFQGJv
 UzP9go5HKI/6DrG8D1Cey1zJZQLSZmJ7gSj8fgB19Yuteq6Esh1NVsjjSlBmprT6+ikV
 JOErLUxSKJaGLDPs4J5w/r4oMF/x1C/1pwe7SbL4vrO4kTpHurF/c+3lDUMCYy5OyDUu
 MPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/lkyfO2eAyTO3jx8KpN3l3Wbz2mTyqVdQD6u1bCXCsQ=;
 b=Q7hySA6U5xloU/8G5I6MY6ZbPXczmPC/zLUSYDKzNK4ARUwEkGc4zrJeVg9qSc8yYv
 eDNxf9CPN4rucXa6LqFkSCar16GuinH7yl2rmugJWohE6bOyd/g51TK0uMv22MgfigPD
 rfyhGAnIDry7LuzoKt5vFTGFCp4PUtG0V3Oe+TtDUwqrewa0kZxpMzQEGE5rndQaCwWb
 9AGJEXPVGxZyWcuhyOnWpB9OtCqMcptTNlHe3OWUbi8DQXqgZbZlz1WwMU9NO4BT2qdP
 2gCX/1b5gjA3/zca/i4GugljKTMRf/1affOyankuR7XUqEsizhlhDAUmUDbffyKmIzYB
 fhbg==
X-Gm-Message-State: AOAM531PSpb64YEb3DFip4caS7VV91rlGUwnQyD2pT9kVu4ivDWwxqx9
 efVxur+1HbsxqH+MHqv8MYDcOg==
X-Google-Smtp-Source: ABdhPJzMm2OQQzDiULeaT4lb3iEjW4dZqK9nGzhntfMsYp93Vmy9+FzVEXAEerefJ8s4rk5fbca+JA==
X-Received: by 2002:adf:fc47:0:b0:20a:d494:3ee5 with SMTP id
 e7-20020adffc47000000b0020ad4943ee5mr27258155wrs.696.1652358277329; 
 Thu, 12 May 2022 05:24:37 -0700 (PDT)
Received: from xps-9300.baylibre
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 z22-20020a7bc156000000b003942a244f30sm3047819wmi.9.2022.05.12.05.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 05:24:36 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: robh+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de
Subject: [PATCH v6 0/7] Add LVTS architecture thermal
Date: Thu, 12 May 2022 14:24:26 +0200
Message-Id: <20220512122433.1399802-1-abailon@baylibre.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_052440_118330_810B4CC8 
X-CRM114-Status: GOOD (  15.29  )
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
Cc: devicetree@vger.kernel.org, daniel.lezcano@linaro.org, rafael@kernel.org,
 khilman@baylibre.com, linux-pm@vger.kernel.org, amitk@kernel.org,
 linux-kernel@vger.kernel.org, michael.kao@mediatek.com,
 ethan.chang@mediatek.com, linux-mediatek@lists.infradead.org,
 Alexandre Bailon <abailon@baylibre.com>, rui.zhang@intel.com,
 ben.tseng@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch move thermal files related to Mediatek to the mediatek folder.
And introduce the new architecture LVTS (low pressure thermal sensor) driver to report
the highest temperature in the SoC and record the highest temperature sensor,
each sensor as a hot zone.
The LVTS body is divided into two parts, the LVTS controller and the LVTS device.
The LVTS controller can connect up to 4 LVTS devices, and each LVTS device
can connect up to 7 TSMCUs.

The architecture will be the first to be used on mt6873 and mt8192.

Change in v6:
        - Remove temperature aggregation (it will be added in another series)
        - Update the way to read the temperature (read one sensor instead of all)
        - Add support of mt8195
Change in v5:
        - Use 'git mv' for the relocated file.

Change in v4:
        - Rebase to kernel-v5.13-rc1
        - Resend

Change in v3:
        - [2/3]
          - change the expression in the lvts_temp_to_raw to dev_s64.

Change in v2:
        - Rebase to kernel-5.11-rc1.
        - [2/3]
          - sort headers
          - remove initial value 0 of msr_raw in the lvts_temp_to_raw.
          - disconstruct the api of lvts_read_tc_msr_raw.
          - add the initial value max_temp = 0 and compare e.q.
            in the lvts_read_all_tc_temperature.
          - add the return with invalid number in the lvts_init.

This patch depends on [1].

[1]https://patchwork.kernel.org/project/linux-mediatek/patch/20210524122053.17155-7-chun-jie.chen@mediatek.com/

Alexandre Bailon (2):
  dt-bindings: thermal: Add binding document for mt8195 thermal
    controller
  arm64: dts: mediatek: Add efuse node to mt8195

Michael Kao (4):
  thermal: mediatek: Relocate driver to mediatek folder
  dt-bindings: thermal: Add binding document for mt6873 thermal
    controller
  thermal: mediatek: Add LVTS drivers for SoC theraml zones
  thermal: mediatek: Add thermal zone settings for mt8195

Tinghan Shen (1):
  arm64: dts: mt8195: Add thermal zone

 .../thermal/mediatek-thermal-lvts.yaml        |   85 +
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  121 ++
 drivers/thermal/Kconfig                       |   14 +-
 drivers/thermal/Makefile                      |    2 +-
 drivers/thermal/mediatek/Kconfig              |   33 +
 drivers/thermal/mediatek/Makefile             |    2 +
 .../{mtk_thermal.c => mediatek/soc_temp.c}    |    2 +-
 drivers/thermal/mediatek/soc_temp_lvts.c      | 1458 +++++++++++++++++
 drivers/thermal/mediatek/soc_temp_lvts.h      |  312 ++++
 9 files changed, 2017 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml
 create mode 100644 drivers/thermal/mediatek/Kconfig
 create mode 100644 drivers/thermal/mediatek/Makefile
 rename drivers/thermal/{mtk_thermal.c => mediatek/soc_temp.c} (99%)
 create mode 100644 drivers/thermal/mediatek/soc_temp_lvts.c
 create mode 100644 drivers/thermal/mediatek/soc_temp_lvts.h

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
