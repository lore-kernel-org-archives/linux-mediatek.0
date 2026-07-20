Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC60C4451B
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2026 06:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G/H3laF11WeRlQ2NHJchQO+2MbI7YG6ixP9fYh5lWUc=; b=ziJfJw2o5yakArdniUbl/z0Kum
	rTpyhqjwkQzzgE3mUgWNdFPs1a1rOJxl7d0tBKhX+MQr7JivKD6NVuLtinaZpKCDI48Py5YSQUA94
	eNi5WFnV9IK0X+ooUPT7SIjmbxixQatv/JCXo9NFVRCq7j6l95/GCk/dRy3hNwWWRWPDuvcUs+O7v
	tlNd3Kq75F77Ru+tDGiPJG00p+88IhT/nSwnCdpaIiK/OPkILa6PYVfzPxWwOCzVwNnDmt6FRpau0
	Bd8BZaN9/lhkELNZ5wccMmDKlqe6Marx1N9amH7nE5+S2YDnkaHlDeyYQfgqg5sSLmCDBsoM+PJf5
	siPFv+oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhQE-00000005wCx-1xV1;
	Mon, 20 Jul 2026 06:24:14 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhQA-00000005wBD-3fh0
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Jul 2026 06:24:12 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-47f64ca1c2dso385575f8f.2
        for <linux-mediatek@lists.infradead.org>; Sun, 19 Jul 2026 23:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784528649; x=1785133449; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G/H3laF11WeRlQ2NHJchQO+2MbI7YG6ixP9fYh5lWUc=;
        b=fLO9Bn+noAyLjAmYcC4qdOXxspBID98RP6Jsnc6RMHQBmNIpybs1Nkkb1WqYgpyOQ/
         IB+ezSDhjtve+1OiASIxgDElmHDfDZpwZd/tbH3x2xi5qzNJrrAeQBe/2BMt6idmWpsw
         kycIIb6nfbpGrTmdpHDAi95MmjkApLBNPEbFNKYfho4y3XU1Ag1odEd3Wug/3H7P8Q5F
         sDdASCZLqni7oO8t/uKhskyeJTVOlUe9JjRUgveX6kJXoblZhDgnFJEr/n0IdCA/uGo5
         fB8yRpkaoJCHKuMWiOiWhnp5uPqxU24p+tmSOjzGotDW1bMQSrFPEGJZEueVLwJYVhlH
         FJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784528649; x=1785133449;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G/H3laF11WeRlQ2NHJchQO+2MbI7YG6ixP9fYh5lWUc=;
        b=W4Tm/Y4BGvwsW/ECYyigjz2ylrIx7NCAMpc3fApTB0AsoFAAt3SJO4XuoRWgbzw123
         Dm5Hc7p033qz9A0zOxY1kv7xcNynVxVj5GzNe/yq2oZbrhR1besMpDJnbzOmkxHK5E6H
         0b57gbaEiCFYmVBXTk/si0iSjy6hufCSMRJHOMWk7K+VRvIQDXx2A5ITWTL6An1KW0ZW
         aiPmfJKHpFyb3OaF1SkNsY2OA+k+ZZvJSN6XhhCVnRTP7wL2GCUweuxl/TplPsc27qHL
         90SzFc+IaMwCckzW0C81LOsOKvxJnxZlsym7hveEi3Thx8Q3VJHg9CRmgFmO8qY29Vxw
         bQBA==
X-Forwarded-Encrypted: i=1; AHgh+Ro23CwtD/qRzATvTLg4qP1tbb/KCw5kTOjjGp3Io0JJn8oLi021svBGU1iOJ+H7hcvgRqlUXOVsNOlOhNXsIg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6bHpnHEoCqKN+I3PaHr/LY2PQxuRd0Oq9EKyl9uDeUq+QtMmc
	PAUTCMsTdfK9RGpY9oo1QFmbevwZf7evK6ddwydFWh1dFwHrQlcDpFrWtDE9WX/Iimg=
X-Gm-Gg: AfdE7cm3+RlHYwTOCvjtKu4ncgsKjasAK+VM2dNKTJX2r6xNKw7G27e6H6ehj+Jl1pD
	MArqM8jNM7/sTBTXzRA8/AMr/pJWntGJqdRhaD/ARE2aYlVP4eY4iPJppeF/Ci6s5ktWodeWmMH
	oZX+uHqtimyk6VkONAOAyXFYKzAfBr43NYp0bqQuJ/FgL2tNToLIWehwJm3MGlgTiqLpL0MOjc9
	+8aMJ2bkMFhTvivpGCGbDIO2kLhh5ZcSKvHu735Pypr1GkwycqlqvsELaCzayFmZ3VAq76eHntU
	UE1gqkzEHUWHfye7wUlnMil2gJ9w1owRHc4tVkq06QZ9f+vYaU86vrh0KgUZUjfevcshdw82wF5
	TLn+GsC8njRbgsysLEyEmbafZrIQzj5CQUOsOSGyZhtPkafWrrjbrEOC7TK2nhMjSH48IfFJ0Dw
	cjxmqmJf8f8xzN9Ht8dFkJ7iyEBU6I
X-Received: by 2002:a05:600c:6a08:b0:493:bcba:46a4 with SMTP id 5b1f17b1804b1-4954a404528mr88685635e9.20.1784528648411;
        Sun, 19 Jul 2026 23:24:08 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4954a2e83ddsm243760905e9.10.2026.07.19.23.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 23:24:07 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	Aaron Ma <aaron.ma@canonical.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Hasun Park <hasunpark@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	James Ogletree <jogletre@opensource.cirrus.com>,
	Fred Treven <fred.treven@cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Mac Chiang <mac.chiang@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	patches@opensource.cirrus.com,
	Lars-Peter Clausen <lars@metafoo.de>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	=?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
	linux-arm-msm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev
Subject: [PATCH v2 0/6] ASoC: Use named initializers for platform_device_id arrays
Date: Mon, 20 Jul 2026 08:23:44 +0200
Message-ID: <cover.1784528081.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3614; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=4tB+67YMPAYA+Fp7hKThmFDs4EE5gnppfw4oTodipEM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqXb7wZqEDAgS99aNcA7ppupT1jNl9C2tgs/w94 zfkKA6R2EeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCal2+8AAKCRCPgPtYfRL+ TkJUCACIvjuWjtW0zv6qwyWNZ4eR11ChZWhjx4507jdswfBcqPRWzrztk9x5ZcJAFrtD89Hy1O3 dIQROoiGwIt6/ZT0XrIIuG6ch21Ra870AZs5MZLjQlFKaIK8Ax0Vlhfjs3HuLGrkGESBlhEcUJ7 bb0eoRYQIqpt1vO10ZxC/wn0B3HhG+8aRkBuumyMvo2JoZ2uUuIdxEM38BlZbb61zBzcB/V2Pnp 55oCYIi6Fq8nNZpLZM9cPX7FOwbZDzmX7kNiAY9S+Ewa2h/SCetXD2vMA0WFQcRZ5DGh3zqawwa 3wR1GjDeaQaO5rHw1kluRx9mB4APLagFmV3CpMXKfxK28zan
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_232410_944010_227CFDAB 
X-CRM114-Status: GOOD (  14.26  )
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

Hello,

the objective of this series is still to prepare making struct
platform_device_id::driver_data an anonymous union. See
https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
for the details about that.

If you consider the last patch mostly churn, just drop it.

v1 of this series can be found at
https://lore.kernel.org/linux-sound/cover.1779958164.git.u.kleine-koenig@baylibre.com.

Changes since then:

 - Rebase to current next
 - Some grammar improvements in the commit log for patch #1
 - Split the changes to sound/soc/amd/acp in separate changes.
 - The 2nd patch used to be "ASoC: renesas: fsi: Simplify driver_data
   handling" which removed fsi_id_table[0].driver_data, but with commit
   38d3273075d6 ("ASoC: renesas: fsi: remove platform data style
   support") that needed to change.
 - The last patch now touches a few more files. (I didn't check if these
   are new offenders or if I failed to catch them in v1.) I didn't add
   Cezary Rojewski's ack because of that.

If splitting off the amd/acp changes was requested because they go in
via a separate tree: That's possible, in fact each file is touched only
once, so the patches can be reordered freely and applied via different
trees if needed.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (6):
  ASoC: codecs: mt6357: Drop unused assignment of platform_device_id
    driver data
  ASoC: renesas: fsi: Drop platform probing metadata
  ASoC: amd: acp: Use named initializers for platform_device_id arrays
  ASoC: amd: acp: Unify code style for platform_device_id array
  ASoC: Use named initializers for platform_device_id arrays
  ASOC: Unify code style for platform_device_id arrays

 sound/soc/amd/acp/acp-sdw-legacy-mach.c |  4 ++--
 sound/soc/amd/acp/acp-sdw-sof-mach.c    |  4 ++--
 sound/soc/amd/acp/acp-sof-mach.c        | 14 +++++++-------
 sound/soc/au1x/db1200.c                 |  2 +-
 sound/soc/codecs/adau7118-hw.c          |  2 +-
 sound/soc/codecs/bt-sco.c               | 10 +++-------
 sound/soc/codecs/cs40l50-codec.c        |  4 ++--
 sound/soc/codecs/cs42l43.c              |  4 ++--
 sound/soc/codecs/mt6357.c               |  4 ++--
 sound/soc/codecs/wcd934x.c              |  6 ++----
 sound/soc/fsl/imx-pcm-rpmsg.c           |  6 +++---
 sound/soc/intel/avs/boards/da7219.c     |  6 ++----
 sound/soc/intel/avs/boards/dmic.c       |  6 ++----
 sound/soc/intel/avs/boards/es8336.c     |  6 ++----
 sound/soc/intel/avs/boards/hdaudio.c    |  6 ++----
 sound/soc/intel/avs/boards/i2s_test.c   |  6 ++----
 sound/soc/intel/avs/boards/max98357a.c  |  6 ++----
 sound/soc/intel/avs/boards/max98373.c   |  6 ++----
 sound/soc/intel/avs/boards/max98927.c   |  6 ++----
 sound/soc/intel/avs/boards/nau8825.c    |  6 ++----
 sound/soc/intel/avs/boards/pcm3168a.c   |  6 ++----
 sound/soc/intel/avs/boards/probe.c      |  2 +-
 sound/soc/intel/avs/boards/rt274.c      |  2 +-
 sound/soc/intel/avs/boards/rt286.c      |  2 +-
 sound/soc/intel/avs/boards/rt298.c      |  2 +-
 sound/soc/intel/avs/boards/rt5514.c     |  2 +-
 sound/soc/intel/avs/boards/rt5640.c     |  2 +-
 sound/soc/intel/avs/boards/rt5663.c     |  2 +-
 sound/soc/intel/avs/boards/rt5682.c     |  2 +-
 sound/soc/intel/avs/boards/ssm4567.c    |  2 +-
 sound/soc/intel/boards/sof_sdw.c        |  4 ++--
 sound/soc/renesas/fsi.c                 |  4 ++--
 sound/soc/samsung/i2s.c                 |  2 +-
 33 files changed, 61 insertions(+), 87 deletions(-)


base-commit: 0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
-- 
2.55.0.11.g153666a7d9bb


