Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24190C7EE2E
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 15:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P5W2InnJUP/UeKBwKYOBuhVJVSTGLUNK+LLVoQR0plI=; b=SNCPo3GRcl6mQtFAs6UHHrMLeZ
	miLY7IZhZAGCg3Wbc/mqyXAaKAD4Fkwzdxdg03P/6yx8FIJrFi0frTEMpkvNYGf5D3Hku8tFmbY39
	XtilMotsNyzU+6uTYoJfcWNWrRNJMNEl1cMALffI+0Tbx2VbeKlW5/rj8j6NEbnavPb9D+1BXi8yZ
	Vaf4hzpdtekKn0jTkb1Q8lhnjvTHVQkv2ffm/NAxFHHL+ceC6qimveVD+qrwveETjy/T8jKqXP/kW
	3On7U4wg1/7bGfIPqSiOY7sr3qDWw467ZrZFTzjoccBBaB2m0qLJ4ohQMjJ4/1xlZE4u8C3eSCX7l
	Cs0tuNiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3euP-00AwzE-2l;
	Mon, 29 May 2023 15:35:45 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3euK-00AwuY-11
	for linux-mediatek@lists.infradead.org;
	Mon, 29 May 2023 15:35:44 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-30adc51b65cso2891401f8f.0
        for <linux-mediatek@lists.infradead.org>; Mon, 29 May 2023 08:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685374534; x=1687966534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P5W2InnJUP/UeKBwKYOBuhVJVSTGLUNK+LLVoQR0plI=;
        b=2Efh/A+7Ot1ySLPh0HhuRd0fb/e85j22M6yPB6MrBkBETBIncWTMWHl7iQeWdhvm8z
         E/KCBLl0OHFf/DQRXmcRF7gLBTARTeAdGxsi9U68igMF/0KEQydwFh7+XWRe8V3j0cgo
         rFB47LLcAORkYZVzAT3kkKsUoolrCNpG7G0BHyBm3FbDo60e4eTekw44cLnZrxSYP+eg
         nqY5AHN7hnHmKBF4dXFbZ4heyzlAXdwew3P3y6ufXQmpML8OcCXLhjbhrmXC/qf+YUqe
         9b4fMiQ3AzICvSlmkVdJMDthPn9TNuDTZ6ygctqBTZV1PUj1WYhENlAiflEl2w7e6xrQ
         tmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685374534; x=1687966534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P5W2InnJUP/UeKBwKYOBuhVJVSTGLUNK+LLVoQR0plI=;
        b=Zh/FLeJzxWUU27ughqgPBfFWdWze9OjXQBvJxP7l84d54RJSlytIYqVSb7LOMg1g7p
         UNBMBwuchHE7qiHvz2rq5JTdD4Df5FThXbIas8O/LMK7v76o4ZlbOTm7QseF7j4YKzvg
         Gitqu+TmuRSI7MsJtBy2SkQsgEricIQDhpm03GDw+/7mfvyI1ybXxttVDqPHEUlMPX2D
         MuDulstf+aYgdqfDXL1/71+sn/aLL648vmt9Zbki2vSN0ASC10JcnWQ+Ij7eeKKX53N4
         BvqaWraDu9KbnUwJ0iQgDr2q0gBYFBdqnG4/3uY2qn2WVcvMuP51d1PwN4y/yx+aLzVO
         Tt4w==
X-Gm-Message-State: AC+VfDxbKzh6eShbHohdQZ564UBQrOaBxV6WO5AdRqqquJle62O4qU/e
	JaNx+MnKBhpMv4XFgyhUMOgXfw==
X-Google-Smtp-Source: ACHHUZ6Gh08w/RoJi45yAq2DuH7Uxj3S/ix6965ss0uiu0zUF7ysxLa6FUS6BJZzcfzOeCVWN9YUHg==
X-Received: by 2002:a05:6000:120f:b0:306:36b5:8ada with SMTP id e15-20020a056000120f00b0030636b58adamr9515336wrx.29.1685374534530;
        Mon, 29 May 2023 08:35:34 -0700 (PDT)
Received: from ph18.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id j27-20020a5d453b000000b003095a329e90sm269781wra.97.2023.05.29.08.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 08:35:34 -0700 (PDT)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: daniel.lezcano@linaro.org,
	angelogioacchino.delregno@collabora.com,
	rafael@kernel.org,
	amitk@kernel.org,
	rui.zhang@intel.com,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	krzystof.kozlowski+dt@linaro.org,
	rdunlap@infradead.org,
	ye.xingchen@zte.com.cn,
	p.zabel@pangutronix.de
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
Subject: [PATCH v3 0/5] 
Date: Mon, 29 May 2023 17:35:27 +0200
Message-ID: <20230529153532.3541327-1-bero@baylibre.com>
X-Mailer: git-send-email 2.41.0.rc2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_083540_376330_6E607425 
X-CRM114-Status: UNSURE (   9.88  )
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


