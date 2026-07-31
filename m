Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7811C54F54
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2026 06:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q+Ji5J8LTGbxypsqRCu69yH+HVZ9BprDmcay4dgGIBI=; b=ULnrUh+mRuuxpE+lk75U7gqYLq
	5milTHfiLE3JqHkfWJ4TivgjCpwL7q+PnhyDjkci6Ex0Xo8tiFZtDFmnIX4DTR2TQpRMHPB2F1CXX
	1ORxmZ53RHMTL3kITSrJCn8qKYqV2v+OCeZWeElWW2EbboB/SxRarRitxb5gSGRZy1ikOlwdg/zt3
	SKJ2Q+tbv1cF7kgeBP6XEG3NWgHklSxEhDG1jw4Sj0n40463Ci69FZ/GDYd9VdYGCoi6U7s+dqLF6
	IykQXRYXKXj4mHxwtLUr0zT92qQskfKdemhkCW7uvBh5n51/CTOV4ZByQI10jvHKdIcQuDphf5FnQ
	It56S92Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpgy7-0000000Btrf-0YaH;
	Fri, 31 Jul 2026 06:43:43 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpgy5-0000000Btr4-38Hs
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Jul 2026 06:43:42 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-472326ca506so407059f8f.2
        for <linux-mediatek@lists.infradead.org>; Thu, 30 Jul 2026 23:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785480220; x=1786085020; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q+Ji5J8LTGbxypsqRCu69yH+HVZ9BprDmcay4dgGIBI=;
        b=ja/NcVk1Bm5FBfxRsV6Tw2TN1Wxr64FLx/rmTGz1j1htyFv4U9f/KmLuDzk6ds6/k9
         qmB2FH4L4UxG6zgDplltO49cSzXrkQ8y480mBVzTwABUG5HYzWc6gIdcoHYpZ9jOnv1e
         0cT6ulkIzvDG52me3kAiJxCzBRoTFTWKN1/rapr+KSwMRnceUyj26JoH9n4X4Wkmz4Ts
         V7TFj80I5/7yb7Nm9w+cZrEKcXYyJcWYfFLaN7DnLXBZj3yiUhKHDaeg2zL5zVelnaTX
         09YbQrB6GT36GPb9Dt99ul/llU0WT6goDZaj8U4cuWlEI49pxV3gn3dG7lMsRP9MO+gm
         IPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785480220; x=1786085020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q+Ji5J8LTGbxypsqRCu69yH+HVZ9BprDmcay4dgGIBI=;
        b=jhvwaffLzP9l31tta39jnGl3+yjhw15h68Gf004F/bql/ibGA5ZOeuJbRCorWEDmpY
         MtKKOsDyGMRfFT3GMjwyHucveN+GQVL5Xva9z7HCK8+HkwFmw4H2Zqd47bm5VEM1K3p8
         eQjSdY4vnIGs6LSfCO77eD3XFIY9yVxJLiWL8fiND0BOxgNhmRCNI3NEBP9WBzywQM2V
         uS1nXlo9ZHhBOOkR7hV+tGGdQHK3qcqJrnX5ZX3LfC7MeCvhZBl3s3DRK5euPQFvwj8S
         ZrBiioskovq1LJKTF7l8ltbJhZmcFHiEl3iIotjAOtNpW8wWax6c+0/cznV0ZGONl0K5
         PVUg==
X-Forwarded-Encrypted: i=1; AHgh+RqkHti2L1U60UpBMDkN2RmhZj7Of26XKXEULFaTnyHkqoFloTdOfStiui6C3wIWPhk1gCB6MxjAl0ZCgLs+Wg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0/wi1TCKp5hQJzfu2ZHkaNKOoGS1i5cqskuXjyIV199/QyctJ
	u+hmhDq2MvyyjkDYNzTfAq1Oey0tazr71rzM+gMVUu77XEPcp8Yarlc1
X-Gm-Gg: AR+sD10/g8FWRi0DnwwXI8sCSXimDAZcED3jmQGfCi+cBtOnVCgO4MZZbf8OLGgRl3l
	RuId4vGq9evawVGnn4Q87BImCbiuw2R4r0adPKrOlR9Cg9UflzFAl9VIVGK2F/KNJeHMBWjeEne
	/fnm4NHGlhdBeLDAI7ATkRTpwPWPCTotE6A4PGa0+LBnP4XvpOqjnQ/Mu7ekBu/3YNT3bwpli3S
	kXR4dg1lMQsFoqz4HfU4DM40/nOZM10EDnvTMNAgxuxe7jdsVSyb+KBcwNE/P7R55mlqWWikM4R
	f3FpX+jOHxaf+/muUv5lqpVFoksnh53GwWHE6ntxY4zO7zKlmmOrzVkNYUPrfKdskR0hJXYT5J4
	ipOhob6IdH1Lhav6qdNkyn6VEQfS4Q6u/Ym/2U0lhwctDwPMa7btwmxppPobJP93DGxKRGvg1QO
	/M1lLnjnSdf/SF+tk/ZUQ7iw0KwENMOFWUTE/wFb1zKpEh6V3dh4nVx/BWwzVshhrkCJCDR7C2C
	kSN0w+a7SxP0Fu/lT19ltncJzI3aLspK0uJKPzzpbVSfF2Mj2ovFA==
X-Received: by 2002:a05:6000:2309:b0:47f:9404:5185 with SMTP id ffacd0b85a97d-47fd2ac976cmr2008837f8f.24.1785480219703;
        Thu, 30 Jul 2026 23:43:39 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-11-254-126.retail.telecomitalia.it. [87.11.254.126])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47fd41cfdc6sm1372488f8f.8.2026.07.30.23.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 23:43:38 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Rosen Penev <rosenp@gmail.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 0/4] ASoC: Add support for Airoha AN7581
Date: Fri, 31 Jul 2026 08:43:20 +0200
Message-ID: <20260731064326.2284228-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_234341_821896_521EAB9E 
X-CRM114-Status: GOOD (  15.77  )
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

Add all the patch and documentation to support Airoha AN7581
sound driver.

The card follows similar implementation with Mediatek with
the codec present on i2c but with a simplified implementation
register wise and additional frequency supported.

Changes v4:
- Improve Documentation YAML
- Move IRQ regmap to mtk_base_afe_irq
- Use mutex for user tracking in ETDM
- Register IRQ after memif allocation
- Address suggestion from bot
Changes v3:
- Major fix to the ETDM code
- Add duplex support
- Improve Kconfig setup
- Rework and improve YAML schema
Changes v2:
- Fix wrong edit in MAINTAINERS file

Christian Marangi (4):
  ASoC: dt-bindings: Add Airoha AN7581 AFE Sound card
  ASoC: dt-bindings: Add Airoha AN7581 AFE with WM8960 Codec schema
  ASoC: mediatek: common: permit to provide dedicated regmap for irq
  ASoC: airoha: Add AFE and machine driver for Airoha AN7581

 .../bindings/sound/airoha,an7581-afe.yaml     |  41 ++
 .../bindings/sound/airoha,an7581-wm8960.yaml  |  71 +++
 MAINTAINERS                                   |   8 +
 sound/soc/mediatek/Kconfig                    |  27 +-
 sound/soc/mediatek/Makefile                   |   1 +
 sound/soc/mediatek/an7581/Makefile            |   9 +
 sound/soc/mediatek/an7581/an7581-afe-common.h |  50 ++
 sound/soc/mediatek/an7581/an7581-afe-pcm.c    | 529 ++++++++++++++++++
 sound/soc/mediatek/an7581/an7581-dai-etdm.c   | 458 +++++++++++++++
 sound/soc/mediatek/an7581/an7581-reg.h        | 114 ++++
 sound/soc/mediatek/an7581/an7581-wm8960.c     | 161 ++++++
 sound/soc/mediatek/common/mtk-afe-fe-dai.c    |  14 +-
 sound/soc/mediatek/common/mtk-base-afe.h      |   2 +
 13 files changed, 1479 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
 create mode 100644 sound/soc/mediatek/an7581/Makefile
 create mode 100644 sound/soc/mediatek/an7581/an7581-afe-common.h
 create mode 100644 sound/soc/mediatek/an7581/an7581-afe-pcm.c
 create mode 100644 sound/soc/mediatek/an7581/an7581-dai-etdm.c
 create mode 100644 sound/soc/mediatek/an7581/an7581-reg.h
 create mode 100644 sound/soc/mediatek/an7581/an7581-wm8960.c

-- 
2.53.0


