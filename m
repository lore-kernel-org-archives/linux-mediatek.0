Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C278CD5BD5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2026 09:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NCpVC/B+fK7iJncp3doDyeYOwNSb+lqrnGIijdp/R+8=; b=kI4v6TwYKALUQXhO3s8xT4+Iu4
	HuzNlIyCFXIs7ads1cqgXvjGN8dyHkLh//1BscfBijOgxORlbtFfkrRIa/C2E8t6T8tEczX+lPheX
	qwGCYof4dQNjv57+a167WOBMjOR1R/jb+J6hcWqIws31u+VAGDTUy9P086Cgm89wF59f8eDH8YAnk
	/+wrLdXNu/l4e2wmrtKnU5i7EecoEv2eViUrkasqe7XafklX6ey+YqETI/6afcA0jHHp9qg7iCyVg
	c21YZUeNnii8G7EE2Njxej9jEsXIeaXg6olp3n8mwhiuqulR3eecRAFsb3V8Jq/ouqrG+YaARh0N7
	E6u0bJag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWh8-00000005Sv8-1JKi;
	Thu, 28 May 2026 09:06:26 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWh6-00000005SuK-0owF
	for linux-mediatek@lists.infradead.org;
	Thu, 28 May 2026 09:06:25 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso107321045e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 28 May 2026 02:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779959182; x=1780563982; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NCpVC/B+fK7iJncp3doDyeYOwNSb+lqrnGIijdp/R+8=;
        b=XxwgLsZ7oBKt9nFrnTPLcDYsSuoTZs493L4WWsP5fXdjXabfrhXRP+tOhqmSBxYswS
         KTAYPwhBoSgdCdYyGzGIHGk/5eEqYrcI0kmYSxhu8Oy6JhKcyrPq+dvaGzHRLsBy0qly
         mgrNYggMD9yFTz3oMt187vI7fJuVq3mrAWy2ngQZflIZng/6viC+2QygrCv0WHJeaPIg
         B/n78Cna9DWOHs7LiiK2f71YMjnoFGGlX+7Skcv7YptRMfywWYy+X92/aYC8rvOd4Foe
         RfKnAz6aeKMQUQcTPJKFOVNl0KU/AMfu1khW+j3RS6+19GpkF6oGJBsScBE32yBX2hy6
         EjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779959182; x=1780563982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCpVC/B+fK7iJncp3doDyeYOwNSb+lqrnGIijdp/R+8=;
        b=b5hBNJeef/xHgylH3nZEqzmgb8/tiAt8FahC7qxQg+QGlki5EiwdjODkcZu9scWdlq
         44+ZPreZlumE3V3SHKuF2FhifI+bapUFt1yQ00uIdc2Upy1hnXW4iAXZn2ZtsoOd2HXT
         UmsDk2mw/JyBTfqw+urb+TR7J5jhiQ+Yz08wWymt6mMwUdgUGYs7hEDuMAdx/x29IJjF
         oji38uNIcL6RaNwomd/I+85deqxESQgCGJqzA3lg2SyeqsXdnKO5BAauMwYoBq3AefXc
         J8CQewcXL/InmastOaMM/rqz+kJpaBiqH0OJjp4WmJOVUDeWHXplsy4yfH75GHKT7xhd
         Lfrw==
X-Forwarded-Encrypted: i=1; AFNElJ/S4zJY0gH2jnpwxtxJW1/PoM/KABLXig/rxzAPXcUV4qhx4AggcArgkdXeIGrc71fU23sH3x8XyUydwIsKFg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8NNXomT+SZOt3AYX9xyc2tRulE/6/gp5H7OSTUwRW7MSiWE/k
	HVe2LfdaDjpRSGQ8Iv/VTt5mD00IKqeCIm5qBoTT5aeEaM+uZjUdwThAeXwcviX7kuQ=
X-Gm-Gg: Acq92OFBGj6qTt4MC9pAqd8YY19cry7eecgr0Gb1Lx6mfDeYYT1dY0EW1v1mCw6wDvP
	YsY+Tvtft8yiBTq/lWgvsyb7x++Qxc1L/d4Rhsh05Y87JvCLrXldhwaOtrapfQQKHPD9XD0kEDS
	1/n6/AybmsKTMMaEBYzAizt9LSFXJpFpoCMVgWJV1xFnvBcCjcD7w4DpZCykEy5noi+iG1QUVz2
	4PEAMc693nTtahz22vn7TnTPtTW1xlRMPhlaC6rVjOEWt1F3gDDIdirU3MLAUDbspAEPxuMAZYc
	Ng0s+FmVBqOC4UxOQDiqVpglXBRjg1jPUOXU8zeLzwZ4Seh99+CvI5Lr1XTeKX+w0lM8sr9EHnh
	PovRH831BRs56iC0jVpbucJFXlM2ECgJDFn7+EniVqu6XZyuMpS5sId7ndnkVgoH74GeQhRE+Iu
	I6j5DoLe/qublCmTgTwUsxzJYOAb9CG1Hg847hhcWE5za0xGubx+14PL2raFho6zStngi/Tt1E2
	KDebdV/KRtevgr0ZHs58WqXkw==
X-Received: by 2002:a05:600c:35c8:b0:490:44eb:c1e7 with SMTP id 5b1f17b1804b1-49044ebc2d5mr480016505e9.30.1779959181935;
        Thu, 28 May 2026 02:06:21 -0700 (PDT)
Received: from localhost (p200300f65f47db04e95e43453a0d1648.dip0.t-ipconnect.de. [2003:f6:5f47:db04:e95e:4345:3a0d:1648])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49091d57c0dsm45855525e9.0.2026.05.28.02.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 02:06:21 -0700 (PDT)
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
	James Ogletree <jogletre@opensource.cirrus.com>,
	Fred Treven <fred.treven@cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Hasun Park <hasunpark@gmail.com>,
	Li Qiang <liqiang01@kylinos.cn>,
	Kees Cook <kees@kernel.org>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Mac Chiang <mac.chiang@intel.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
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
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	=?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
	linux-arm-msm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev
Subject: [PATCH v1 0/4] ASoC: Use named initializers for platform_device_id arrays
Date: Thu, 28 May 2026 11:05:59 +0200
Message-ID: <cover.1779958164.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2760; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=pePpbntnwnsj7EYGTYln0S0Z1fUMMahUgMDQxO5w1uU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqGAV3A/XGhyTdPC2Sbsk19+exJrBTv8hN9EsT0 GAAjGOFfiyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahgFdwAKCRCPgPtYfRL+ Tgg8B/9D5gNT6QFkJSSGOnZq876EyBKdLt05krj7I+eM9aYvKsGkdCLHcG7QZHsH64DDJCElr0r rkkvYPqCAgT0nB7gOzo9U0qtyp69Vifs5eRYtlUzz+MYNPrOw1HZyPhMUokS9DH1Pp+kkk1fj3S pf2IkbuFyVhLCrKlKWuXJYjCf8Go8i/nKubc2wg6igcHvdnyTzxT+83dJT/P31ERPelDR9wXr3g NwuRB3IaDbFvfetwIRZGEvJ38cIqOwdZWALeex3CzgiNZyJVzlnyX0/cb63x8sz08tUXTRpK9XZ iQM3C8HjSEsS1U3+EfHXzpVCPMgXHp9ra49eC3vLgqNt/Qh1
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_020624_264491_F6E91C28 
X-CRM114-Status: GOOD (  12.05  )
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

this series targets to use named initializers for platform_device_id
arrays. In general these are better readable for humans and more robust
to changes in the respective struct definition.

This robustness is needed as I want to do

	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
	--- a/include/linux/mod_devicetable.h
	+++ b/include/linux/mod_devicetable.h
	@@ -610,4 +610,7 @@ struct dmi_system_id {
	 struct platform_device_id {
		char name[PLATFORM_NAME_SIZE];
	-	kernel_ulong_t driver_data;
	+	union {
	+		kernel_ulong_t driver_data;
	+		const void *driver_data_ptr;
	+	};
	 };

which allows dropping several casts and eases porting CHERI to mainline
linux. When adapting e.g. sound/soc/amd/acp/acp-legacy-mach.c to that
and make use of driver_data_ptr, the added const makes it obvious that
acp_asoc_probe() modifies the structs linked in the id_table resulting
in issues if more than one device is probed using the same platform id.
sound/soc/amd/acp/acp-sof-mach.c has the same issue.

If you consider the last patch mostly churn, just drop it.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (4):
  ASoC: codecs: mt6357: Drop unused assignment of platform_device_id
    driver data
  ASoC: renesas: fsi: Simplify driver_data handling
  ASoC: Use named initializers for platform_device_id arrays
  ASOC: Unify code style for platform_device_id arrays

 sound/soc/amd/acp/acp-sdw-legacy-mach.c |  4 ++--
 sound/soc/amd/acp/acp-sdw-sof-mach.c    |  4 ++--
 sound/soc/amd/acp/acp-sof-mach.c        | 14 +++++++-------
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
 sound/soc/intel/boards/sof_sdw.c        |  4 ++--
 sound/soc/renesas/fsi.c                 |  8 +++-----
 22 files changed, 51 insertions(+), 79 deletions(-)


base-commit: e7d700e14934e68f86338c5610cf2ae76798b663
-- 
2.47.3


