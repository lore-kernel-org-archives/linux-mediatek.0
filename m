Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF96C43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 14:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V4RGIQqrYA1Sqn81LNW+Ovu1/RvEI1nZ8BUW4X6wylc=; b=HKF2qgBEhcSjoXJhGAlH/hNix5
	vUAwQaQgS9OztDjd4/c6YAZ1N1ySwF9xwFkMD1xI6/QE/RWpnSQSN5zAB1sAuR2/pACa83NjTPqYH
	Z4T6dx76Awgebz2gdG/int4K5HU4BllcmpSs7d8LCDX/JhSPcmLtB5Eq7UubnPfv0TLmLCz+WeGYn
	0AC4X3iubNWlUlSSEqglcL7q+STNuDib6dl/qjnGJeSAHm10jGbDvg2SlCrYXCdk0FfwRs4H9HO0k
	gPYZozjpMKcGA9k2SHaCCAXHVjzfGOeM1ZuN/nzgo/oGb1x26NoZYLqjeW6FfV2Xz6BWhX7o7qCQ6
	QAU6+hQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT7A-0000000HG5j-1W3i;
	Wed, 08 Jul 2026 14:19:04 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT77-0000000HG4h-1gtO
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 14:19:03 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso9345395ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 07:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520340; x=1784125140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V4RGIQqrYA1Sqn81LNW+Ovu1/RvEI1nZ8BUW4X6wylc=;
        b=CQIYV7GfHOFfpHsdd2SLFV3X2yBuDzLsvMY8g1QBSazjT7kD95hIM/1AfW4tmP7Gea
         LggPTtDRMZ50sd7Ob3LKDlN+X6bMMJaC485YBgXYyqmEmIc5Hl3zcOwTu3IgsJV/U/JA
         PKYM59e9UzfXr5bCXVi6knBRxpQKhKIEc7Id/T93NQQuJOTpztlF0SgyZMwGvrSqZcX6
         0i1onOAwZDUUfpdKSGh1PCYV4ZmWVAODD9AIz8xN+limLxVnjBI0EqbPGGeZZoHzj6f8
         dsYbR6l17ES0xSUuUZtBJlEy0Jm7tTVVeKszNSbfuhNjL2vos694NN3G+9NlhZitG40g
         tSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520340; x=1784125140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V4RGIQqrYA1Sqn81LNW+Ovu1/RvEI1nZ8BUW4X6wylc=;
        b=Y1/DShTCoy9+HVWcK2LPCm+dZO9F7OE+vTwThhZt1bgBQuHjAktXL084xlN2nylgPz
         +itx4og7zeQBXJUFXgY5Q/uHlb19g56Dp4OTwgs3eIy5ta+Ibs0gN930iOMJh5A4emsA
         0O5o6ocA8G12eoIQNi5sGDPv3fuJUpQUDGHMC0vM2XNa36KKiL0YVBqTBPeoFIYj7fI0
         TuyrmrMrvgMVWz5hWEG5u9NA8VbRIIeNIlqNyEAoF88YZEHhdg0UzXrkoWMoZ48c6kvt
         fIo3hG2U0KhVJo34YU2dUzeTwB3ljvQsRaO7pzG8yQpCW72XG+qDbsO0IAP1xeaksXrA
         f21g==
X-Forwarded-Encrypted: i=1; AHgh+RqH7WCR1/RnbxcDVabh9ZBdbbKRg2lT+m4rx5pxI0kfBPwBzc0wSOCQCtunVpgXwZ5RdCx3+ooB1/+T7QHefg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+6zDcX0qMG/NiTItQanUdQy8AjVrBXrk6xcFQYD+4hBF11t0v
	wcaR2nc1uRndbXeSG/KtbGSyYpy+t6xeh17ZoN0MzN2cwt7UQXlXoiR3zSqUiQ==
X-Gm-Gg: AfdE7ckQuCOWUh7JJC+65663Jp2FoiPWr4WkqPxrgZ9SHzTbUQU8csgs18O//F0bGBW
	fpds8QPIZF/oH1cBC+wkysPAaSy9QkSfJPX0MHeW0Icj5dz2NExks12esSyZNqpRJ18Avpwapoy
	CcuXWqR/WxdXMW7P8vt9fj4YqN0prqrVx6F8iHrhejlVcSwaTQvxULkc5tWsRqlbCydsoel90Co
	26a6T3g9tQjgftfapuFfDSg/lr8BOw5Je4qrKM8Eb5g1pQvCqeQQnij7cYY3ROeRvdtovRA0J8I
	seOrddedFoWLvPXD4Je06xgNyH11eg+4x9X/sSxOnZj/90ZAkYw/2PL47L5smVk8wmQYQVbd9sY
	BwTFq5JVWmYjaiGge53lw1//f6gGudG4Swq9WztWoFiqMp31w2TqM8CeBz86LS+hoL93OVGTu1q
	jhWTn2QY3ht2RZqZ71AVI2aFBZ0iEFnItzBd0sYsgwkVQwTa0=
X-Received: by 2002:a17:903:17c6:b0:2cc:7e4a:bcc5 with SMTP id d9443c01a7336-2ccea480bdfmr31916225ad.32.1783520339948;
        Wed, 08 Jul 2026 07:18:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:18:59 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 00/27] ASoC: codecs: Use guard() for mutex & spin locks - part 2
Date: Wed,  8 Jul 2026 21:17:07 +0700
Message-ID: <20260708141734.578926-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_071901_477114_1CABD88B 
X-CRM114-Status: GOOD (  11.47  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series converts mutex and spinlock handling in ASoC codec drivers
to use the guard() and scoped_guard() helpers.

This is part 2 of a larger 78-patch conversion series. Part 1 (24
patches) has already been posted, while this series contains the next
27 patches to keep the review manageable.

https://lore.kernel.org/all/20260617103235.449609-1-phucduc.bui@gmail.com/

The changes are purely refactoring and have no functional impact.
Compile-tested only.

Changes in v2: 
 - Add Reviewed-by tags from Charles and Herve.
 - Address Herve's review comments.

Link v1 : 
https://lore.kernel.org/all/20260630063449.503996-1-phucduc.bui@gmail.com/

Best regards,
Phuc

bui duc phuc (27):
  ASoC: codecs: da7213: Use guard() for mutex locks
  ASoC: codecs: da7219: Use guard() for mutex locks
  ASoC: codecs: es8316: Use guard() for mutex locks
  ASoC: codecs: es8326: Use guard() for mutex locks
  ASoC: codecs: es9356: Use guard() for mutex locks
  ASoC: codecs: fs210x: Use guard() for mutex locks
  ASoC: codecs: hdac_hdmi: Use guard() for mutex locks
  ASoC: codecs: hdmi-codec: Use guard() for mutex locks
  ASoC: codecs: idt821034: Use guard() for mutex locks
  ASoC: codecs: lpass-macro: Use guard() for mutex locks
  ASoC: codecs: madera: Use guard() for mutex locks
  ASoC: codecs: max98095: Use guard() for mutex locks
  ASoC: codecs: mt6359-accdet: Use guard() for mutex locks
  ASoC: codecs: pcm512x: Use guard() for mutex locks
  ASoC: codecs: pcm6240: Use guard() for mutex locks
  ASoC: codecs: peb2466: Use guard() for mutex locks
  ASoC: codecs: rt5514-spi: Use guard() for mutex locks
  ASoC: codecs: rt5645: Use guard() for mutex locks
  ASoC: codecs: rt5665: Use guard() for mutex locks
  ASoC: codecs: rt5668: Use guard() for mutex locks
  ASoC: codecs: rt5677: Use guard() for mutex locks
  ASoC: codecs: rt5682: Use guard() for mutex locks
  ASoC: codecs: rt700: Use guard() for mutex locks
  ASoC: codecs: rt711: Use guard() for mutex locks
  ASoC: codecs: rt712: Use guard() for mutex locks
  ASoC: codecs: rt721: Use guard() for mutex locks
  ASoC: codecs: rt722: Use guard() for mutex locks

 sound/soc/codecs/da7213.c             |  37 ++----
 sound/soc/codecs/da7219.c             |  62 +++-------
 sound/soc/codecs/es8316.c             |  31 +++--
 sound/soc/codecs/es8326.c             |  30 +++--
 sound/soc/codecs/es9356.c             |  29 ++---
 sound/soc/codecs/fs210x.c             |  89 +++++---------
 sound/soc/codecs/hdac_hdmi.c          | 117 +++++++++----------
 sound/soc/codecs/hdmi-codec.c         |  15 +--
 sound/soc/codecs/idt821034.c          | 144 +++++++++--------------
 sound/soc/codecs/lpass-macro-common.c |  12 +-
 sound/soc/codecs/madera.c             |  39 +++----
 sound/soc/codecs/max98095.c           |  35 +++---
 sound/soc/codecs/mt6359-accdet.c      |  13 +--
 sound/soc/codecs/pcm512x.c            |  19 +--
 sound/soc/codecs/pcm6240.c            |  25 ++--
 sound/soc/codecs/peb2466.c            |  16 +--
 sound/soc/codecs/rt5514-spi.c         |  21 ++--
 sound/soc/codecs/rt5645.c             | 160 +++++++++++++-------------
 sound/soc/codecs/rt5665.c             |  15 ++-
 sound/soc/codecs/rt5668.c             |  10 +-
 sound/soc/codecs/rt5677-spi.c         |  36 +++---
 sound/soc/codecs/rt5677.c             |  75 ++++++------
 sound/soc/codecs/rt5682-sdw.c         |  24 ++--
 sound/soc/codecs/rt5682.c             |   5 +-
 sound/soc/codecs/rt5682s.c            |  17 +--
 sound/soc/codecs/rt700-sdw.c          |  14 +--
 sound/soc/codecs/rt711-sdca-sdw.c     |  30 ++---
 sound/soc/codecs/rt711-sdca.c         |   8 +-
 sound/soc/codecs/rt711-sdw.c          |  24 ++--
 sound/soc/codecs/rt711.c              |  46 ++++----
 sound/soc/codecs/rt712-sdca-sdw.c     |  30 ++---
 sound/soc/codecs/rt712-sdca.c         |   8 +-
 sound/soc/codecs/rt721-sdca-sdw.c     |  29 ++---
 sound/soc/codecs/rt721-sdca.c         |   5 +-
 sound/soc/codecs/rt722-sdca-sdw.c     |  29 ++---
 sound/soc/codecs/rt722-sdca.c         |   4 +-
 36 files changed, 569 insertions(+), 734 deletions(-)

-- 
2.43.0


