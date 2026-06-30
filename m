Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451B3C43638
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 06:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=syBpKBFGjGejGwg1BjAhn4n5QdMB5B8yOZv838BwUKA=; b=Bsy4fVjUYSvRGVjQWn+WnvrS7b
	BBiUMy9onXRgO3b9CCwMQX7hhVzR6V/jjv2vOiLFCJUCPrGwdOlsA3MuJWEvQ+XA1P8TuU9Tfiq0L
	1EMXO9X/3xWQJjbb/A8YJuIIlRAW7h3K7GBWl9FfqPgTsl181UN0alcC+hpean9gv2e6q15PfQKDM
	UbqCJMznbKhy/VcUcQ3+oz/7JWR4LvPsWFWQM2xBSGY9t761sqLhyMIx/Sr6DEMp9zV80xMmGkg8P
	By0EbT5ZQ2RjNuzhIA3975REpE3/5Qjxj51iP55wpjtLGSHg5hHsn7KKCPiJcYJs/kwtrDLfhXao1
	xCzF39tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS3q-0000000FxdP-3CPg;
	Tue, 30 Jun 2026 06:35:10 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS3n-0000000FxaN-2CuD
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 06:35:09 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8454160043aso3418493b3a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2026 23:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801306; x=1783406106; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=syBpKBFGjGejGwg1BjAhn4n5QdMB5B8yOZv838BwUKA=;
        b=fkUud+b6nla82mxvRV99da7vHiix4FWxRmtgtICooKKUUV35bohvy99ZyoxfLRr/Ok
         Ka54VW5aBfI0ck6bTjztkQ1d4Y7qjKj10RVplMq5Nqd0m+MP05EhGUqHAk2zpHsyHSEo
         gwLnoUgZ5z3ycJkCUllXFiWZyjSKrAT7ZfWqghgeud3XuQRK+sMZCoTSSZ2p102OdnUq
         /e8mntX+OJd81WiB2f3vPlYVLNeq+oB0QJddv2+/rdgzYOII8kD4FF7ctEYVavF2f25L
         8/7u2fkNsmRpdMOVXbJ56hnBMW6a3Hnqgblocx7uDEJJEJ+mDSjfzP58RIJUXK6LflVg
         LTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801306; x=1783406106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syBpKBFGjGejGwg1BjAhn4n5QdMB5B8yOZv838BwUKA=;
        b=eAkyojKIITqB+riziAc01SxRKsn/MzJF9em+mDrRpL5ZatFkLj3OaDuxys2r3n+VIv
         lNcGYUG3HYFqnKuV59o7x2yXHzQDcHCJlwH2eSvnb7Qbk8cKr0bYxGbDBLrhHW/DS3jh
         lBS3BTpYRQcMC8aQH8uYSsWOR+85HfzwhKmspIlEOqME6D6kzMw+P3NYgqbMmGY21jL6
         O1Ndb23cfLQDxsMY+xmkD5shGLHuELiOccgn0jA0q5ACOmHft5+Qz0fJsLbbtvQFuRLB
         toF2TBjL5qvIWO/Y0/OU0ggfLhBqsn+bvsYMDmVSOcDJjm/hLWp/ePY7Gk/2v+4uzVeN
         wuTw==
X-Forwarded-Encrypted: i=1; AHgh+Rpbqw/2doVTrctyE+3j01aB/P+x2uWNX8NX1UHhUziqwTs5D8U2K5ulYszVvErhRdRzhvv7iBeiqDQn/LsewQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyANIHNOB/a+S+p/gMpfc994dNcmMdXW3Z3WdxFHUwlCWvp2Vow
	PhFBGbaKNWuHCYq0ft0K9L3pCswhw0eY6AYjCdNhC3BJL9AydT9eEFbV
X-Gm-Gg: AfdE7cmLYo+YyGCov1W+B/o1OSeDaLAVaFmHxTENaBUJqKzRvkTV94tywH/PjIcF5p2
	Y4XdvQkfmdoJs1RvbiyWn/pUh447dqhHW1Gyes+T1Avf3a/k7FWd5k1FGvkt4pnhWF8eeY/eTrC
	IyKDsP1OyIMY9F7IjVsadXqwLvtFDFtO70EuED0npeVLe85JxDXCg1dtl4Q8kqdCoJLwgrYWxE7
	QigU9hF3vw8UWYLvbz3fCaEXM+nDcqp673Sj6aT2UfQiLWSghJ1VVbvXR4sXEkppSMrE+xXiEHT
	B2DhZXluEBmSA6qQrlM8W03Ghg2D9ITcaFV0+0cKdmMYSdzFPmIilYSyZBaIFlDgqt8l478k+2h
	OZ4l9q2F2ldFKpbl2cEFT/QxIwpfGSyGImc8vPQT6XThelk9RuN17byUC60oVQrhYfhSArAe2Jf
	usbmFmNX59/jQJsA+mjcK0DVWkX4vPqhwCM4s6lZISuBCiOr9rs9cRX1EkDA==
X-Received: by 2002:a05:6a00:b481:b0:845:e44c:2e5 with SMTP id d2e1a72fcca58-8479f109b70mr1989863b3a.22.1782801306377;
        Mon, 29 Jun 2026 23:35:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:35:06 -0700 (PDT)
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
Subject: [PATCH 00/27] ASoC: codecs: Use guard() for mutex & spin locks
Date: Tue, 30 Jun 2026 13:34:22 +0700
Message-ID: <20260630063449.503996-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_233507_584430_721DDDDD 
X-CRM114-Status: GOOD (  10.56  )
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
 sound/soc/codecs/da7219.c             |  55 +++------
 sound/soc/codecs/es8316.c             |  31 +++--
 sound/soc/codecs/es8326.c             |  30 +++--
 sound/soc/codecs/es9356.c             |  29 ++---
 sound/soc/codecs/fs210x.c             |  87 +++++---------
 sound/soc/codecs/hdac_hdmi.c          | 117 +++++++++----------
 sound/soc/codecs/hdmi-codec.c         |  15 +--
 sound/soc/codecs/idt821034.c          | 121 ++++++++-----------
 sound/soc/codecs/lpass-macro-common.c |  12 +-
 sound/soc/codecs/madera.c             |  32 ++----
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
 36 files changed, 557 insertions(+), 707 deletions(-)

-- 
2.43.0


