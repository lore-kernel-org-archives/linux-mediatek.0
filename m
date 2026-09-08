Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FF3C79F82
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2026 09:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eIZ+kUaFwJKaLRLpyngmxMQG27w+758uZsHUvhX4A7o=; b=lOOd4QOmgLbYodkC/RbidFLiXP
	HRiPnEoFTUQw8kWpjfWEyvsZPJuUj2XrmsSvgeZHendFHF3b3+X6yawyf/QW8N7yQRB12nGtV+rJ3
	BS9UIvlz2c66kKdLyaNiMqQkNoW0CrlLZVSlo7FniPh3n//ABJu0MMhAXZWyssGdZivxnhvn8ks3y
	XfGhZ/1taSZ+PAbIWnGF3ge7Yz1RxXaEiOcARtFv1B6KcsBBxvvM96Zse3yoorZVZXZk5/9KnMrwB
	uZCevmBL05habJRnMSpvc06bfvhOf5ZrJzXviNvMZARaoJEIeF/M8DEu8mxROnh7Qj2Ou5tXheavf
	+rT4XF1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rlE-00000008V7B-27Aq;
	Tue, 08 Sep 2026 09:05:00 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rlC-00000008V5w-1VZl
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Sep 2026 09:04:59 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4858303de5dso5400072f8f.2
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Sep 2026 02:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788858296; x=1789463096; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eIZ+kUaFwJKaLRLpyngmxMQG27w+758uZsHUvhX4A7o=;
        b=KkzF63N2fNoOi55ymDrHIg3ur7SCroT0/GKk0c9az5L3IA1qUds6PdwVct9WyBuW81
         QjEAdnGc3SyUsluEAaJ+W/iypnkGyBF1ZgSjP2EBz2AmXluRd8/n5riSOxPJcIkNqhyY
         MBUU/rTEdIWH8wM5E4xwPa6cvY+pQx0m/OProSIVkTTXrXYpLr5odQhYCwdINgbmvQJc
         FGtBd6QXU6085zJpj+NPniI3sLRcUryCibLZ20wq1KZ17ad0KnfKORFppH4JuUeyKht/
         DyC06NpaYdll2k4YPeF501OOPCOo/TehD/5s+7egtjRDvzOPR0145yMUbD9g8pm3JM+o
         nhKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858296; x=1789463096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eIZ+kUaFwJKaLRLpyngmxMQG27w+758uZsHUvhX4A7o=;
        b=CkxIWaSt9QEnb4iodMma77VqFfxJ2S+eJn+SgJ7x7rWExBb5BuCe7YzSUqYUw62GOY
         7gNt1dlhUsXRKW+zjROA7xV77TtQ1GLgwAPjOq2Jpt5hu4oAgumM+c9zrKHygryCvCxb
         9kYRFNCCku2thtK81XofBQynEP495qwWenxsIV3BdmkhLdL/bWfdJeO+CNY8CMWsRIwO
         p3Z6Lt75uL846hkjHkrSeaSZnbZfZ1khY6zJ7PtnZ8NTodYQ+P4t8lY0wMfEizsnv0Cl
         cVrZabU45MHwpywB6hh0g2Tim7HRhZDbHAeVZEo1w9nhK/njWyIurIUL9qHOzNm42e0u
         2FzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrStAsDdvFnYNZoN3ggF+9jFacqt1/4G8Q92yi6trgWL/hfaUBdAdlAA8cy8zNsueeiM1Z0YA2HhMM7K+xRQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lYT8rBwgIpse/ocEqsH0uCtJK1VE+ZZq24qLLl/h2xBQivNjES
	8MMmR8A09YO7Xos+UDyDZn/UjehEyDuaCbJo0kHF3M9PsFH7lpNBKd3Y
X-Gm-Gg: AYBFou1a+il+P/3hwF498oxeGJhATqGPNDD/VAlaN237DPX6EwCQkmvFNMUoONt6ove
	gL1x16Vq+VHaqQmTA0uVjeRh+QDM/lsCn8p5p8RD0ruMw3ofmUevIOILq/mQ+TxVcssEVU6XJsj
	wOP0AfnBuyX3niNI+Wy5Dv5dtRTqc319xiwRuxB3Em0GJV4QJgj4c6RihOLOcogX6kqeFqpuPje
	1sRn8GHh+5cKBmoncLJx1MZ5cusNNKpboD2DJUydkuWje366pQt3bHSPiacTpIPQMkteNzpELJ8
	w7/LSj6ZqSZ2oEhs1z+djPK+A/HFPrgI+90wlavfEZWk/X51ci/bHE9b5Ff6LF8JV//cNZvXx5T
	vOj0szsy7KvhCEa0KpZAyYs7d49amD4W5dGbfjiMV/RR1teDQg2a2Kxcewevu9PiAXjlyAoCFUy
	MoYbLGsyhQ0yhWBiuGJifvLNp1whZAi2corlzmtwUwPv7xmk8X5lquaSfmINKdReWAOaLYcNZNY
	TvJSBMKoljAusgw2c5EDF55DBO4L+3picJIRl3OEbqZ4H3faSxh
X-Received: by 2002:a05:6000:2602:b0:485:8c16:a33b with SMTP id ffacd0b85a97d-4858c16a5b3mr26273747f8f.48.1788858295822;
        Tue, 08 Sep 2026 02:04:55 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485881353e8sm34767945f8f.1.2026.09.08.02.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:04:55 -0700 (PDT)
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
	Rosen Penev <rosenp@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v6 0/5] ASoC: Add support for Airoha AN7581
Date: Tue,  8 Sep 2026 11:04:42 +0200
Message-ID: <20260908090448.3332-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_020458_408899_71F950A7 
X-CRM114-Status: GOOD (  16.99  )
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

Changes v6:
- Fix PCM probe allocation logic
- Split driver patch to dedicated PCM/ETDM patch and machine driver
Changes v5:
- Address comments from bot
- Better handle concurrent irq status bit
- Protect enable etdm
- Add Review tag for documentation patch
- Address formal comments from Cezary
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

Christian Marangi (5):
  ASoC: dt-bindings: Add Airoha AN7581 AFE Sound card
  ASoC: dt-bindings: Add Airoha AN7581 AFE with WM8960 Codec schema
  ASoC: mediatek: common: permit to provide dedicated regmap for irq
  ASoC: airoha: Add AFE driver for Airoha AN7581
  ASoC: airoha: Add machine driver for Airoha AN7581

 .../bindings/sound/airoha,an7581-afe.yaml     |  41 ++
 .../bindings/sound/airoha,an7581-wm8960.yaml  |  71 +++
 MAINTAINERS                                   |   8 +
 sound/soc/mediatek/Kconfig                    |  27 +-
 sound/soc/mediatek/Makefile                   |   1 +
 sound/soc/mediatek/an7581/Makefile            |   9 +
 sound/soc/mediatek/an7581/an7581-afe-common.h |  49 ++
 sound/soc/mediatek/an7581/an7581-afe-pcm.c    | 515 ++++++++++++++++++
 sound/soc/mediatek/an7581/an7581-dai-etdm.c   | 433 +++++++++++++++
 sound/soc/mediatek/an7581/an7581-reg.h        | 114 ++++
 sound/soc/mediatek/an7581/an7581-wm8960.c     | 161 ++++++
 sound/soc/mediatek/common/mtk-afe-fe-dai.c    |  14 +-
 sound/soc/mediatek/common/mtk-base-afe.h      |   2 +
 13 files changed, 1439 insertions(+), 6 deletions(-)
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


