Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398D6CDB474
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 19:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5T8pyCBsKAygZpdsiydX+RlsNqoe0a3HYugW6rTPXAk=; b=Yu2BtU8dGwdFIMAZrFdOxPyRnY
	8cpjyhjyGpYSJaCangFMbcFOyyZeT2kldUc4B6QG2VK68d+NyG7wNWwQJM/0sXt6pDR4zbDLrdV0A
	+Du3IZmfozhaLQbnwcLipjAZktKc8TLOGFN/aVtZ0mMlM9bRuNbko2AI47aZRrbQy1i+4mMnWBgiX
	BkjDhavgYmltLMjqcApytMfilyyNGhYZ4Hx2Sg9IH3TWdETrBX1StCfYcGYPGjCl/i7s1GFuew0cA
	o/pF7sHcAmV/h3+cxta3GCFWF7UVZoxCgSC+8j4gOuLdSscd3XRT43HkA+/T+5vNCDW09AsMe0kt6
	iMVUUEhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qspOG-00D2tF-0W;
	Tue, 17 Oct 2023 19:06:04 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qspO5-00D2l4-1m
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Oct 2023 19:05:56 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-53dd3f169d8so10233180a12.3
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Oct 2023 12:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697569547; x=1698174347; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5T8pyCBsKAygZpdsiydX+RlsNqoe0a3HYugW6rTPXAk=;
        b=EGPbgbR2lAMSaW8Y0IXNhnYf85YDijNvS3JMXILpd/odv4pNQzctaO0xfrnczdPwtL
         jBIBWjVP80ivsNSvOgRt++tjZ1p6IoDE2v5cqjxiBNuGzmSzM13ExHnezMCuYZ7Rsh2Q
         EFtd51KT2zaZTzXADWTI2614rMz+vvPkV2UpOzlFWq0fgi9ribULGLP4+tCb6wUcCeJY
         JiJlV4XsGHOGZwtRerWXM2ZIKEUaqy/+x95i7tzrKvOUuKKWYFF/j23kZcUZkafrXesK
         bJTTlRI4cXyhBx42bCibsGJh0vHdJU6RYYLiEnGktIQXAXp1rOG6IDGmfQKUOolTAhyQ
         MY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697569547; x=1698174347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5T8pyCBsKAygZpdsiydX+RlsNqoe0a3HYugW6rTPXAk=;
        b=SoUGi0xZDLTiHlittvTEWDVfRbxpBixI0ypMZK4/Leh40qNb1VP5Ye9rtOKdp8KsDD
         D/mPCaTMZTD29/m2aNSxRdZz0ZIjyJv93wfxRfoEjdegkpvJtvQmFYH2I8aVhT6+gYEC
         rGlR3J9Vi4J7OpZd2K0tHPXYgMEeIeBje+zHbESfWzeGxxdDVzTEuJ0txZmphymGEZ6u
         NaWkgsOpOahRlEmzoOsej5bHY1B6IS2KbWJMD/3+ZihCg5TyuBhJm8WsWYaUu7rCyZ2g
         mqi49uBVEUvhqmcgMEO1tVo8wq+tiwrgmyYh/vwALvvDybKizoAb7mZnmnUIXEoZmQPV
         1QtQ==
X-Gm-Message-State: AOJu0YwZ2HiM946MOIdNr4KuZgLnfSYbHG4UZnIes8RzU37GTCgnUAmr
	R+m+WBPgwdyxBxeHmkFmRvdv8g==
X-Google-Smtp-Source: AGHT+IHIS2pmlJT58sIePf55BkdjnJMp56dc57XPsYb/UA7y89bQ2UAlMws2Jd/KFo1tOI+tOPXEwQ==
X-Received: by 2002:a50:ab55:0:b0:52e:1d58:a6ff with SMTP id t21-20020a50ab55000000b0052e1d58a6ffmr2012654edc.35.1697569546785;
        Tue, 17 Oct 2023 12:05:46 -0700 (PDT)
Received: from ryzen9.fritz.box ([2a01:2a8:8f03:b001:fe65:a70:2777:ab31])
        by smtp.gmail.com with ESMTPSA id bq14-20020a056402214e00b00537963f692esm1637990edb.0.2023.10.17.12.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 12:05:46 -0700 (PDT)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: daniel.lezcano@linaro.org,
	angelogioacchino.delregno@collabora.com,
	rafael@kernel.org,
	amitk@kernel.org,
	rui.zhang@intel.com,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	dunlap@infradead.org,
	e.xingchen@zte.com.cn,
	p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	wenst@chromium.org,
	ames.lo@mediatek.com,
	rex-bc.chen@mediatek.com,
	nfraprado@collabora.com,
	abailon@baylibre.com,
	amergnat@baylibre.com,
	khilman@baylibre.com
Subject: [PATCH v5 0/5] Add LVTS support for mt8192
Date: Tue, 17 Oct 2023 21:05:40 +0200
Message-ID: <20231017190545.157282-1-bero@baylibre.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_120553_587388_096EA214 
X-CRM114-Status: GOOD (  10.75  )
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

Add full LVTS support (MCU thermal domain + AP thermal domain) to MediaTek MT8192 SoC.
Also, add Suspend and Resume support to LVTS Driver (all SoCs),
and update the documentation that describes the Calibration Data Offsets.

v5 changes are a lot smaller than originally assumed -- commit
185673ca71d3f7e9c7d62ee5084348e084352e56 fixed the issue I
was originally planning to work around in this patchset,
so what remains for v5 is noirq and cosmetics.

Changelog:
   v5 :
        - Suspend/Resume in noirq stage
	- Reorder chipset specific functions
        - Rebased :
            base-commit: 4d5ab2376ec576af173e5eac3887ed0b51bd8566

   v4 :
        - Shrink the lvts_ap thermal sensor I/O range to 0xc00 to make
          room for SVS support, pointed out by
          AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

    v3 :
        - Rebased :
            base-commit: 6a3d37b4d885129561e1cef361216f00472f7d2e
        - Fix issues in v2 pointed out by Nícolas F. R. A. Prado <nfraprado@collabora.com>:
          Use filtered mode to make sure threshold interrupts are triggered,
          protocol documentation, cosmetics
        - I (bero@baylibre.com) will be taking care of this patchset
          from now on, since Balsam has left BayLibre. Thanks for
          getting it almost ready, Balsam!

    v2 :
        - Based on top of thermal/linux-next :
            base-commit: 7ac82227ee046f8234471de4c12a40b8c2d3ddcc
        - Squash "add thermal zones and thermal nodes" and
            "add temperature mitigation threshold" commits together to form
            "arm64: dts: mediatek: mt8192: Add thermal nodes and thermal zones" commit.
        - Add Suspend and Resume support to LVTS Driver.
        - Update Calibration Data documentation.
        - Fix calibration data offsets for mt8192
            (Thanks to "Chen-Yu Tsai" and "Nícolas F. R. A. Prado").
        https://lore.kernel.org/all/20230425133052.199767-1-bchihi@baylibre.com/
        Tested-by: Chen-Yu Tsai <wenst@chromium.org>

    v1 :
        - The initial series "Add LVTS support for mt8192" :
            "https://lore.kernel.org/all/20230307163413.143334-1-bchihi@baylibre.com/".

Balsam CHIHI (5):
  dt-bindings: thermal: mediatek: Add LVTS thermal controller definition
    for mt8192
  thermal/drivers/mediatek/lvts_thermal: Add suspend and resume
  thermal/drivers/mediatek/lvts_thermal: Add mt8192 support
  arm64: dts: mediatek: mt8192: Add thermal nodes and thermal zones
  thermal/drivers/mediatek/lvts_thermal: Update calibration data
    documentation

 arch/arm64/boot/dts/mediatek/mt8192.dtsi      | 454 ++++++++++++++++++
 drivers/thermal/mediatek/lvts_thermal.c       | 163 ++++++-
 .../thermal/mediatek,lvts-thermal.h           |  19 +
 3 files changed, 634 insertions(+), 2 deletions(-)

-- 
2.42.0

