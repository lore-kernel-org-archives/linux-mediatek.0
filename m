Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BDCC43458
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 14:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2tQoFP/3mK7wnbIpYFRSkYpoksOckdle3t5G8xRcShM=; b=shlO7Mu+smQmVtl3RCJzs5O5cW
	vzGciUa2jOTcx0LbK+6E43SoAv0Fc6CqBadEMmNjQvWY/ViB3IlBG/8UtBMxzxv8ZwTvv3yVi+WUc
	y9rljKLoR+N4ywINWOwXMtp59bABGxI7YTKlMz4bLqHKbPwq57nFZVy0vUnXRL2PxHl2GzLLc/Wat
	kW8xCXZvFquwv6BtVmYZjx94Gujyb9HJVX/ETKD+8bTehlaSz4wNc1+dzKR+iBH+4uO0SzSS3kf3x
	kc1zkhi608qZfuPGZbt9ykDqsgGvE7bMS2D1GnaEabH0mGPrVsaGpMd5B8Pjxlk2TzFsc/6yb3s+A
	pABMz4Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weZ4F-0000000HF93-1NCQ;
	Tue, 30 Jun 2026 14:04:03 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weZ45-0000000HF6H-3VqP
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 14:03:56 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso55159475e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jun 2026 07:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782828232; x=1783433032; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2tQoFP/3mK7wnbIpYFRSkYpoksOckdle3t5G8xRcShM=;
        b=SNSkuQKlBmvlK1pMAuHg2vLDFzytjWL2QHdRikbMMgxvGBqeOARtgBiamiCGAmeupf
         vWcM2q/01g4Bn3pJjXIdy5KKJKPZuzJROOrQ6WxiDZft0SXzpIqBafwEgqPjignlhadt
         ctrRmVRBM7Fbfiw2z9A01JcEnVsDQnUZT0I3j+rgRg2heskGvJVOGpg1RNbHdA4v8s87
         ZXCCIzocsEKbLLUAmOe1gWl3xJrnS7WMR83cqsXKO6CjyagJiiBPNoDmabGSLe1Mgtrb
         F4YRMEYGQNcv0IUIzE/VTrOdORW2WMOcIk+b0/dO2isD0ME0ACrlbedFEwNZSexYZnNY
         1L+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782828232; x=1783433032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tQoFP/3mK7wnbIpYFRSkYpoksOckdle3t5G8xRcShM=;
        b=cr+Noj2i6k2DtDrbSXPvOl1oDMZWEtTvDu4MEAr1iWm4CSQ5U1a4DnqNTseGS7kEpq
         X1wrB0idRo94jsBZ56VNs6H6/X0i+LRc1qOpOKajSqDJTlWkpX/fTt4O4cE04rtK5bPb
         fzGXm78OboDTTjQ/jOpm4+Nflw/YSGR268rph8TFw2y7n70aLF4GYgaUkViwl3qZ8FPg
         ZIhklR2u1Hg7W/ZyY94YokY4gY5l/uSFeXm6zqfX37BIx9vjKnLxKgtmvNsEf9qxtxC3
         IsDNddEtMNAXAxAzHJwkR8dnTrdmnWn1V7nduFCwfm11EPOMWnZHrCsNsmZNoUA0Hsat
         U2nA==
X-Forwarded-Encrypted: i=1; AFNElJ+PGeVk0P3HbsgGenUwQPDD+0aBHkaN5Sl9ehXcUrsjqYMyhpt4pw6dFSRKwRzBBGvyt/sO7oo0QLAK7m+ReA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3nMX7Hd1j8mDEzkLdV3bIORHROMRnPTY9TgQa7krVviEAZZud
	/94nNPxE18eCiWK+pcwRjpbSqBjuiwUngExs2gbVnLWSwTeZKcGMP+/wwghSiEHtqSI=
X-Gm-Gg: AfdE7cmSgfmRPW/QUMdeeX93H2E2UANqJqNFPL9M5qJDebIF5kyrTZ7I2Gr641Ev07W
	OAg9qTPChaCE3ivF/N+cQF4Bq4rvu9qrkN+pe95T9hMs5GTTfj1bTo9gm9ESjAzyCKfxbJheJrM
	HTPHNvWUXFJaej0mKaON5oVYv83ejaYAlEhlnmeC2EBnB8p2MS3oJK7w5B6J4PqZO5Hp1ub+SRI
	KEB0een+SKhWeM1y6avp+xel/Mep9FcZlv4tdY62fh6JLJiAEQUKchcjyeiimRUGdL4+TxSRv1u
	0DHF1lzkt2h+TOgFw32bCwp5og8kadhMl50xlrKrbt1FHX4APtSdcstR4EYf49bdjSzE11G26aO
	gbLl6qGRM6wNV0xXTeXDgnE1rQ9R+or8r5CUCK/OPD42SW6sZcOEWbIVmm491I7295E6Vz4I9MC
	ni/rnDZNTj2n1rvAtnZ1Yd4iWjHqLAadhF1DLeWfknlK31Bxw1+sO0vb4XcxH9ngVo2eo7G131R
	C1r4SZLWNqHLbc=
X-Received: by 2002:a05:600c:8b34:b0:492:4668:27b5 with SMTP id 5b1f17b1804b1-493bda58201mr11176775e9.6.1782828231880;
        Tue, 30 Jun 2026 07:03:51 -0700 (PDT)
Received: from localhost (p200300f65f47db042a9b551def0a6b94.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2a9b:551d:ef0a:6b94])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493b8cd2a3esm78215815e9.4.2026.06.30.07.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:03:50 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Woodrow Douglass <wdouglass@carnegierobotics.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Saravanan Sekar <sravanhome@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Icenowy Zheng <icenowy@aosc.io>,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 0/3] regulator: Rework i2c_device_id initialisation
Date: Tue, 30 Jun 2026 16:01:06 +0200
Message-ID: <cover.1782827697.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3273; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=83a/MkmrHfjorOirVbbU46DfC5PP/+YNhl2WVzEkxQ0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqQ8wjXh28OkIBNlK6ESzk2ZoTzd35sqKX8watZ MSYmkn2SfOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakPMIwAKCRCPgPtYfRL+ ToTTCACDMq56H2QnBMfIjJOf2V1bMX/QO2ByPArT7OXAoncqtKRUaoMDJK1mqI7rZHtX/9TVDkR sJ35SMm8o//R2DLkrZlc7xpH+bZi18AMQUXuwz8q+vApGRZ89XY7T8fCjSuGvhkoIX+W/ji6n2f 2LNs9hBn0ZRmNzZleHoI0k7m/yxzw+s/9xNbg3dDMgcu4Gf+XNWGYjXeVTvxPGMJGqqxC4vgVmS IvTOvkQ4tjL69LLf+KbRcgFUj672h3H/Z0x3mPH7uQmjHnhFsqPifW4VYKvpFEbnRJjXOJN3WHM CZX67q/+j9SASP6N2/yB3rTltWrEg+cdUg5WFyzHBiYV5gyX
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_070354_027152_088CB60D 
X-CRM114-Status: GOOD (  10.60  )
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

changes since v2
(https://lore.kernel.org/lkml/cover.1781888370.git.u.kleine-koenig@baylibre.com):

 - rebase to next/master
   This fixes a merge conflict and also shifts a bit which drivers are
   adapted in the different patches
 - patch #3 is new

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (3):
  regulator: Drop unused i2c driver data
  regulator: Use named initializers for arrays of i2c_device_data
  regulator: Improve style of i2c_device_id arrays

 drivers/regulator/88pg86x.c            |  4 ++--
 drivers/regulator/act8865-regulator.c  |  2 +-
 drivers/regulator/ad5398.c             |  4 ++--
 drivers/regulator/adp5055-regulator.c  |  4 ++--
 drivers/regulator/aw37503-regulator.c  |  4 ++--
 drivers/regulator/da9121-regulator.c   | 20 ++++++++++----------
 drivers/regulator/da9210-regulator.c   |  4 ++--
 drivers/regulator/da9211-regulator.c   | 18 +++++++++---------
 drivers/regulator/fan53880.c           |  4 ++--
 drivers/regulator/isl6271a-regulator.c |  2 +-
 drivers/regulator/isl9305.c            |  4 ++--
 drivers/regulator/lp3971.c             |  2 +-
 drivers/regulator/lp3972.c             |  2 +-
 drivers/regulator/lp872x.c             |  4 ++--
 drivers/regulator/lp8755.c             |  4 ++--
 drivers/regulator/ltc3589.c            |  6 +++---
 drivers/regulator/ltc3676.c            |  2 +-
 drivers/regulator/max1586.c            |  2 +-
 drivers/regulator/max20086-regulator.c |  8 ++++----
 drivers/regulator/max20411-regulator.c |  2 +-
 drivers/regulator/max77503-regulator.c |  2 +-
 drivers/regulator/max77675-regulator.c |  2 +-
 drivers/regulator/max77826-regulator.c |  2 +-
 drivers/regulator/max77838-regulator.c |  2 +-
 drivers/regulator/max77857-regulator.c |  8 ++++----
 drivers/regulator/max8649.c            |  2 +-
 drivers/regulator/max8893.c            |  2 +-
 drivers/regulator/max8952.c            |  2 +-
 drivers/regulator/max8973-regulator.c  |  6 +++---
 drivers/regulator/mcp16502.c           |  2 +-
 drivers/regulator/mp5416.c             |  6 +++---
 drivers/regulator/mp8859.c             |  4 ++--
 drivers/regulator/mp886x.c             |  6 +++---
 drivers/regulator/mpq7920.c            |  4 ++--
 drivers/regulator/mt6311-regulator.c   |  4 ++--
 drivers/regulator/pf530x-regulator.c   |  8 ++++----
 drivers/regulator/pf8x00-regulator.c   |  8 ++++----
 drivers/regulator/pv88060-regulator.c  |  4 ++--
 drivers/regulator/pv88080-regulator.c  |  8 ++++----
 drivers/regulator/pv88090-regulator.c  |  4 ++--
 drivers/regulator/sgm3804-regulator.c  |  2 +-
 drivers/regulator/slg51000-regulator.c |  4 ++--
 drivers/regulator/sy8106a-regulator.c  |  2 +-
 drivers/regulator/sy8824x.c            |  8 ++++----
 drivers/regulator/sy8827n.c            |  4 ++--
 drivers/regulator/tps51632-regulator.c |  4 ++--
 drivers/regulator/tps62360-regulator.c | 10 +++++-----
 drivers/regulator/tps6286x-regulator.c | 10 +++++-----
 drivers/regulator/tps6287x-regulator.c | 10 +++++-----
 drivers/regulator/tps65023-regulator.c |  6 +++---
 drivers/regulator/tps65132-regulator.c |  4 ++--
 51 files changed, 126 insertions(+), 126 deletions(-)


base-commit: 7de6ae9e12207ec146f2f3f1e58d1a99317e88bc
-- 
2.47.3


