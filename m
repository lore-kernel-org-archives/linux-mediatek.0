Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79E8C4451C
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 10:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0cwBADZ+M6LWlMFTgIEAl7+KkE8RhKrW3GGwqzI7cnM=; b=UM2WigrAdkpgujJVRQMOr/FtSM
	DZYaOz2dZWUA6e+G7RVr7GlxVnczqv3Ks42A63ty2nfyyV8eQd+WFqGBI6hTQa9PVmnWAnKdr2oCs
	WJ2fKa+hcQX2AzGLCdW6Py7YmhZBVIKkEGw7BXrAousPriamf0dKtIYvb8H/avrIkdl/FSa1xlxFz
	C6aWRGGaxXWmRsxcYsyYwweUtf4+VeJhAIB/VeFwjZl0ygZkwydrk4VA2bUVimjWEQy8X/zZ9f+CH
	PdGlzuuMNNAlmSJ37VDNpSgliuUlDaggazCOLwGwOKtI/U3FrQvktxg4rMtHQbJzyJtbrLfZ5WvA8
	X8G83gzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7g6-000000097ok-3BIR;
	Tue, 21 Jul 2026 10:26:22 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7g4-000000097nu-2V7L
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 10:26:21 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2ceaf8a1265so110054315ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 03:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629579; x=1785234379; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0cwBADZ+M6LWlMFTgIEAl7+KkE8RhKrW3GGwqzI7cnM=;
        b=d9lRAgwez66yNl/Z4aTSDT93pxrbP6iCSOkDCWRZpdGNxTrEZEIjXzJLMI+rm3SSV4
         cU0agykiiiBUVuosZigixCGqGZW5mRXI/iib+5V4F1S0Tz8jEqx2rmPWGVEu/k9GhE/0
         bsc+KJ6UPqwKS/bTJ3WgUM0kMcH5/22SoYFp8TL+tj+lQLDc0EfJEL/dup3jE+vqjxNL
         3Fj6xS1N6tY4Xz1e6E6xR6eIKO3MjMtMv3J7ZJ9aIG4Ai5UBv6UgnGl5GbHjGlnfcUC/
         eyl+qiKQG7/M0TvsncOrfXoSDe4ybQI8mez7o7uQCMEwdmNFk/0TZamhSlxzXzyyWz9z
         QsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629579; x=1785234379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0cwBADZ+M6LWlMFTgIEAl7+KkE8RhKrW3GGwqzI7cnM=;
        b=hTgWbaS5jia3AAykzMlrW7rdjMQKLPBVrHNSMTqyOy3gcNBOgR65bYufX6MvQljW87
         V/CkFtePLaKNHi2rAynGmRMA4k9RJcg1CzG3ZdDOT22+/Zve+5btISNG9L3QhCqQELKb
         s1y4wlSGkF9+/0cZV5uMaF1aOLDvJBtSe+Zn7GJwyXbP4dv3HDEqUz7p3w6VtajN51pR
         GtpnS3dICzcBOq5HkgVareZoNCwvcdoGYiW2MaPpwU3BZmxjY7NXUNqMv6YdvKgddovv
         UI1foIj3rODSZ6ZP54F3C0tfnH0yddddt9guwg7c9VBEkbaRIt320r5DOZ8xdA8kvzp8
         lvEQ==
X-Forwarded-Encrypted: i=1; AHgh+RpwGD2s1Dexfc/7hMUj6PBw/5tN/x0vdilWvoco/fVwsBI7nSJC/sYFMIHXgOffzdaIW0sZ8XjHkaZhZbchoQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyG8n88z7xxAKyFTPEFDuhw0sQTzLdc1r1AbnpKVZbcetYIOGTL
	5C85taneBGzBqUWpx3gFaKDqjeamUEPfMOMpFilTI6hGImUGh7ZQ9LOO
X-Gm-Gg: AR+sD13/WCYmN9wSuTbT/sxzISzyXYT7Uf69UPzkB4e4PBAtvv/dki+5FO1YWJ+wqvk
	vfNunpqqCN2mipDxbiIDetkdIdl4+PwFmTpW7489YB/tu/pEkZTLvw4ELVk6M55feCGTHEpGGsS
	cMJ06qDEEf32/dOZNWsigmNnNKupEPXNCLEf667QLEwfca7EohVm0EAW24Sw/jS7PaV7XZB3Gl9
	XPPww/65tOzIb/5ZxqxS+0vhkbrvlK3itVX0v//twwqV4xqPkK0lmfUi0Bnb68SzWqFXPPCBh9u
	lMHQB/bZJC+M43sE2Vu/sw4uJ7QphI02Jki9qzAydEjqYd/3CaN0lB4yFE8Dyxh1YhQZ4RWGVmZ
	02I8BMoxqJrRKkuQyhm3SyNhQ3XOq7mMo3RtDMWhlqwS60oC3zc3B7NbsI/e7n2YmGeVzHxLS0g
	LWIwHj59+bbv/szcMzs9kIEAV4ztBlRwQw6rMa
X-Received: by 2002:a17:903:1210:b0:2c9:d298:6c06 with SMTP id d9443c01a7336-2cf34a0a6c0mr183821275ad.25.1784629579348;
        Tue, 21 Jul 2026 03:26:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:26:19 -0700 (PDT)
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
Subject: [PATCH v4 00/29] ASoC: codecs: Use guard() for mutex & spin locks - part 2
Date: Tue, 21 Jul 2026 17:25:31 +0700
Message-ID: <20260721102600.523199-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_032620_634884_C523263F 
X-CRM114-Status: GOOD (  10.36  )
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

Compile-tested only.

Changes in v4:
 - Included 2 additional codec drivers for cleanup.
 - Simplify regcache error handling in resume for both rt712 and rt721.
 - Remove goto labels to streamline error paths and prepare for guard 
   cleanup.

Changes in v3:
 - Rebased onto the latest broonie/for-next.

Changes in v2: 
 - Add Reviewed-by tags from Charles and Herve.
 - Address Herve's review comments.

Link v3: 
https://lore.kernel.org/all/20260709045902.498848-1-phucduc.bui@gmail.com/
Link v2: 
https://lore.kernel.org/all/20260708141734.578926-1-phucduc.bui@gmail.com/
Link v1 : 
https://lore.kernel.org/all/20260630063449.503996-1-phucduc.bui@gmail.com/


Best regards,
Phuc

bui duc phuc (29):
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
  ASoC: codecs: rt712-sdca-sdw: Simplify regcache error handling in
    resume
  ASoC: codecs: rt712: Use guard() for mutex locks
  ASoC: codecs: rt721-sdca-sdw: Simplify regcache error handling in
    resume
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
 sound/soc/codecs/rt711-sdca-sdw.c     |  29 ++---
 sound/soc/codecs/rt711-sdca.c         |   5 +-
 sound/soc/codecs/rt711-sdw.c          |  24 ++--
 sound/soc/codecs/rt711.c              |  50 ++++----
 sound/soc/codecs/rt712-sdca-sdw.c     |  50 ++++----
 sound/soc/codecs/rt712-sdca.c         |   5 +-
 sound/soc/codecs/rt721-sdca-sdw.c     |  49 ++++----
 sound/soc/codecs/rt721-sdca.c         |   5 +-
 sound/soc/codecs/rt722-sdca-sdw.c     |  29 ++---
 sound/soc/codecs/rt722-sdca.c         |   4 +-
 36 files changed, 587 insertions(+), 753 deletions(-)

-- 
2.43.0


