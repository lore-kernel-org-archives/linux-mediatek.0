Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02619C77B7E
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 18:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P5W2InnJUP/UeKBwKYOBuhVJVSTGLUNK+LLVoQR0plI=; b=LWQMa8ZPj6u739AHDAd6koz+/A
	FxIzeITmsHAsskrjMHfbxIGVfdzlErN6CDHnq3T4PGYuV/fsKORgj6HOJAkbglPYMBhuzYtLnFVue
	hHRc4PI6hezuP1Noj2uK4sHfxe+Lun4+vXZdmMBBhH2qi9qJjtP1Q8cY0B0yt130KTjeVh+d01YxR
	tTjw2DmS6wsrXBOqDYpeh7C3R3mtpRNF7njd+moQjzJMeqok58s41CRdJdV9jBmQQb4/MRoSeUpPP
	TZfLnl8CYQcHEPtKJY0lkvn/4s26sdD54Uf2RaDSyTaK+WLX/BkQuw3SPkvhJy0bbg2ll1rFm22++
	Zdu1/yWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3hAJ-00BLqr-0E;
	Mon, 29 May 2023 18:00:19 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3g0b-00BAPZ-1o
	for linux-mediatek@lists.infradead.org;
	Mon, 29 May 2023 16:46:15 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-973e7c35eddso297400166b.0
        for <linux-mediatek@lists.infradead.org>; Mon, 29 May 2023 09:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685378770; x=1687970770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P5W2InnJUP/UeKBwKYOBuhVJVSTGLUNK+LLVoQR0plI=;
        b=1h1XpexRNcq/GARqspAA3SgX1lx9vLDK6+EnwpwTtJFPeMV7/8eQfB5/0Duo1jdbM0
         zCmWVEoFh5y1cmnTFFbEb4XR5dTGF9oL8BTrYLjgNZEZ0zsbpFe5aC5sTu2n9ZSG0Cjz
         NbmrjT73sF7cjE7sPH0pjCZavpTaTgfx3faWFv17/JCyXnOthchgA39p1Lu8QDrxIPdm
         SzWueJlsMVOzzCnzQGNawipPcmqEU4jI6gt87OB5OFNlN9Etq4IJ/lBqNNnGrOrBAPzn
         1byM6y1ing7jmIqFnZJj7IdKvBwZwxuUOoX8+ABU4l9zz725vX5Zyb/A1A06ABO6CshY
         RYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685378770; x=1687970770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P5W2InnJUP/UeKBwKYOBuhVJVSTGLUNK+LLVoQR0plI=;
        b=hIspIk0TvywzaVyTWf/hoLr3L+GXz5O513G4z3AewP4cW+LEbtxBTPPdgMAXLwHz6B
         rWY3P3lJ4CQ25e9MUFY6Jofz/Lo4l1rO3Lk2wi3IdOVN3/ogqTwF7/H7JVUsHOudzL5o
         V9/rzUEyrtMCU/hdRAkQGky6Wz1G5Q1augyUBm7vGqXFausdP862GJj4m4JunoY93SAL
         MelThkgSVWHZtJAvjE8ZsWbeZF4krx/SetGFJug22xlyhnZLnu8G1OuBj5honVVuJWSi
         ntASfUiNCTv+iWM6iVCKtb/HURmwaAkySn4X5MAZq7c+1LawgZIB7SiSgrajvLGOHEZX
         5kRQ==
X-Gm-Message-State: AC+VfDwZnsH1ia4k9WRj0++lk3YM27Zbv6i3MRSe9pGj2/BCkJDrgbTb
	V/1NClmMCkJVeK0RIXBW/IF7HA==
X-Google-Smtp-Source: ACHHUZ5vN5ot2rMmDtaN9KdYMd2D30A8+m+MQ+eA0mtBsXo6xsAq+L7HqMIPyTkeUEcph2YC4AUhgg==
X-Received: by 2002:a17:907:846:b0:96a:4ea0:a1ea with SMTP id ww6-20020a170907084600b0096a4ea0a1eamr10330693ejb.44.1685378769781;
        Mon, 29 May 2023 09:46:09 -0700 (PDT)
Received: from ph18.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id f4-20020aa7d844000000b0050d89daaa70sm3248578eds.2.2023.05.29.09.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 09:46:09 -0700 (PDT)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: daniel.lezcano@linaro.org,
	angelogioacchino.delregno@collabora.com,
	rafael@kernel.org,
	amitk@kernel.org,
	rui.zhang@intel.com,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	rdunlap@infradead.org,
	ye.xingchen@zte.com.cn,
	p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	wenst@chromium.org,
	james.lo@mediatek.com,
	rex-bc.chen@mediatek.com,
	nfraprado@collabora.com,
	abailon@baylibre.com,
	amergnat@baylibre.com,
	khilman@baylibre.com
Subject: [PATCH v3 0/5] Add LVTS support for mt8192
Date: Mon, 29 May 2023 18:46:00 +0200
Message-ID: <20230529164605.3552619-1-bero@baylibre.com>
X-Mailer: git-send-email 2.41.0.rc2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_094613_594901_E4EB6274 
X-CRM114-Status: GOOD (  10.34  )
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

From: Balsam CHIHI <bchihi@baylibre.com>

Add full LVTS support (MCU thermal domain + AP thermal domain) to MediaTek MT8192 SoC.
Also, add Suspend and Resume support to LVTS Driver (all SoCs),
and update the documentation that describes the Calibration Data Offsets.

Changelog:
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
 drivers/thermal/mediatek/lvts_thermal.c       | 160 +++++-
 .../thermal/mediatek,lvts-thermal.h           |  19 +
 3 files changed, 631 insertions(+), 2 deletions(-)

base-commit: 6a3d37b4d885129561e1cef361216f00472f7d2e
-- 
2.41.0.rc2


