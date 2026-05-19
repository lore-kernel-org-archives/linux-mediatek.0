Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A479CD4851
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2026 09:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UU0lB9lovvpP6x7wtqdLnGVBs9ID+Cmv/S9aLUhDVOI=; b=llJ3GoNtbWgN3XfQidgsWrZWjM
	pH2es0gVesLMyQX8dM60rcto5j62EkdunwH5B53sNElI8YD4Qgqys4sGbgPMCvcpAeuK1602Oc+N5
	aYdpSTXjRepMYnmJ4rs+7Ns0YB3cahfXH9ps4fTOLPbapYfEam3AgqpsdiEdPS1q4fHgZqlS1xliA
	Xk+fIX91jdSQdUah/zIaaNFVZGviWahN5MDRkQ0fCbzOnHI+8gAD1oug5D8SJPjUWeqXqOSHrSzj3
	sziRNvhTrxqbhmGsuVadaL4K2BYavQ+o+50iiV/CJaG4zvBZDMmjHBppofj8kMiEECm9SM7iEMIkC
	yqQ6ySxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHDF-000000010ro-0uFZ;
	Tue, 19 May 2026 09:58:09 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHDC-000000010qe-3eGS
	for linux-mediatek@lists.infradead.org;
	Tue, 19 May 2026 09:58:08 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-453903ee4adso658416f8f.3
        for <linux-mediatek@lists.infradead.org>; Tue, 19 May 2026 02:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779184685; x=1779789485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UU0lB9lovvpP6x7wtqdLnGVBs9ID+Cmv/S9aLUhDVOI=;
        b=Hzfo8RTHtfXZSxHIuHYNx5SDn0UgK50CF0o3FCj6psl+Mpg/g1ZAsEKNzao3u2lNhn
         t8+uj94StLzqhAzQEdfw54PQHwNu+hCBm5kjQO/MUrYuWqQwwSdMQMbKH/W1bjVEBfUS
         V4m+pYbF88iSqsBk15MTgbIO+OLC6vsvRAAc1zgv2GkSIzraO56/xd//oG4IAD0+r15/
         d0Kz7jFOwM4cg4ENtj6jZ79F5gfWAlSRutaufjik9qSa4sLsJTu0ukOxitLu+TKKX1Fs
         3ZPoQoiljW4qFEmJhKQyR+4pCn2uY/I4CHMC3IRJxyDxIwpMWLKU9bVnBVOCkoKGbu1q
         VVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779184685; x=1779789485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UU0lB9lovvpP6x7wtqdLnGVBs9ID+Cmv/S9aLUhDVOI=;
        b=S0R3BeTA0EcB1hnqaCyTOj4HXn/IXwyXH/HTQQWoCFepnVHijVYYjQL26gcEIuOFyX
         FFnn9F9J0H+BiksBCSHyiQ8DeUvj99loVBPGWBCH5lAbmynMWwV169V7YC20zYuzpTWx
         x1UPkF0Fv3Vl4ZJgXphgS9ZSNjq0iCel53MJR2OV1JUydaP2dIZxjFh/SCMMWVeE2jVk
         ebJYkODJ4poYzfr9zdu47jkpXbzKwIGCpZKFbzdQpw6i8UiDhO11c6yttUF/NEtwMqxd
         VQZ4wfbGLNF/Ds5xNKGyDd0HVQaJPxujjHJIikzi7GcB60XgdsWqgVisw03wqiv6ti3s
         ZrLQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/GrGdLwKMsZrsy+LLlcGNuHIuLNto0HfKKOtL5SbKPvUgkZqWzWNgkhEW7lvCaXmdYLsuF+6rmER0j4fMzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpjGyhV1Zs/w1KuXkLxPtuz9TrK3bY0OzgsuklVtlExmYu+eHQ
	iez6OMUr0yDpZVp6cUE22EIfWusX/4WJ1CIo4/VZiJg04ji16xj7VKLHJHmiYX8fg2E=
X-Gm-Gg: Acq92OEi/9yAO/HRC+GqsT1nunXYQl7PFVqaqi2s0Wh7uNRdsqse6C059rw/WhNKY1z
	6bAlQ0naOytpkhgiLz0vW3U5VtWsxo7PAaLgSeAH8r1SObidXA1bWl0IgYdhHkNPadacFETiK1X
	tA5oY37dg9WPIEIEUYqZombKP8QbSIgBoqaiQ+DjIE9gc5Ri5xCr4keGYSxPvUQCjpMJ8uzcPEz
	/Zc10ZiqVL5BLQI2VR8eYaQMNPmPBiPVEwIqeD1idNW1XhtBeB5K3Y49OleFh4WUTz2WL+ELxZj
	n4PFwNHH5WcSduaF7ToRVJhyVpsl4sEzIjnEUtH9l4Fi4Wiu12nFM3DjGM2DHZ2WK5XCsBJxex/
	BVrB8W0DM9Gu29ZYH3u36AgnPWsl6Lp5VYgIpFQGJpQuGP1mQjmGnarMLSVJioFFFUUHrFvaBnx
	tM84pvtkQ57hzuFWAbH6DtGH4cvA7DWZ5s3JTC6VPtgy3sTa4jz5JkD+Z/iJVj++EC6kmB/1M1b
	zjTOEBssYkl3w0=
X-Received: by 2002:a05:6000:1845:b0:43d:1c21:ead5 with SMTP id ffacd0b85a97d-45e5c5872a3mr30035423f8f.22.1779184684713;
        Tue, 19 May 2026 02:58:04 -0700 (PDT)
Received: from localhost (p200300f65f47db0428dec7b135f55767.dip0.t-ipconnect.de. [2003:f6:5f47:db04:28de:c7b1:35f5:5767])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45d9ec3acf7sm44400530f8f.12.2026.05.19.02.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 02:58:04 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Woodrow Douglass <wdouglass@carnegierobotics.com>,
	linux-kernel@vger.kernel.org,
	Michael Hennerich <michael.hennerich@analog.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Saravanan Sekar <sravanhome@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Icenowy Zheng <icenowy@aosc.io>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/2] regulator: Rework i2c_device_id initialisation
Date: Tue, 19 May 2026 11:57:49 +0200
Message-ID: <cover.1779184320.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2970; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Gos+e5IcF0gXHd8gxum8vW5O4nWyBEBbd0FZbuQ0XlM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqDDQekvllmBxZKQLWzsOB538fNqIG2WEo4ny9u gulytDCJYGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCagw0HgAKCRCPgPtYfRL+ ThQvB/9tT3A52c0aHcU3l3dynYys6NWV6Z6/xuSs+KJk5FhmLL6kq+3aYuG9N+pnvBMmCMQxbRT aUlFW42wHl/e6NFLSYMFMQDbFMA0M5i608jV8TG+UsNR1kOOh9UN9/k8ComleuJgbUdTIYEGoWl 1TWi/Zl0OsZg7VIfzBEiB9Du9gxfOeo80ivQrmmwtAWGDj4jC3v2M8muna1FarFEVCJmWk8f6d3 w7H0fIcbEieibbyvU968Q+3Ygsk3IKoZvOxaqekPEd1O7YP1vyBKmRwDIMG6uSMnLy3XFRqxlPD nidhKe2WoP57lOAhbnGaprYxcMOqA+VS+FIOlI68nlOrX87v
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_025806_933413_9CB784CA 
X-CRM114-Status: GOOD (  12.61  )
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

Laurent pointed out one driver in my v1
(https://lore.kernel.org/linux-kernel/20260515103150.164887-2-u.kleine-koenig@baylibre.com)
that doesn't actually make use of its .driver_data. I found a second
while adapting the patch set. So this v2 consists of a first patch that
drops these driver data assigments and a second to convert to named
initializers which is mostly the patch sent before.

It might be too conservative, but I didn't apply Laurent's conditional
Reviewed-by tag as my change is a bit different than anticipated.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (2):
  regulator: Drop unused i2c driver data
  regulator: Use named initializers for arrays of i2c_device_data

 drivers/regulator/88pg86x.c            |  4 +--
 drivers/regulator/ad5398.c             |  4 +--
 drivers/regulator/da9121-regulator.c   | 20 +++++++--------
 drivers/regulator/da9210-regulator.c   |  4 +--
 drivers/regulator/da9211-regulator.c   | 18 +++++++-------
 drivers/regulator/fan53880.c           |  4 +--
 drivers/regulator/isl9305.c            |  4 +--
 drivers/regulator/lp3971.c             |  2 +-
 drivers/regulator/lp3972.c             |  2 +-
 drivers/regulator/lp872x.c             | 34 +++++++++++++-------------
 drivers/regulator/lp8755.c             |  4 +--
 drivers/regulator/ltc3589.c            |  6 ++---
 drivers/regulator/ltc3676.c            |  2 +-
 drivers/regulator/max1586.c            |  2 +-
 drivers/regulator/max20086-regulator.c |  8 +++---
 drivers/regulator/max20411-regulator.c |  2 +-
 drivers/regulator/max77503-regulator.c |  2 +-
 drivers/regulator/max77675-regulator.c |  2 +-
 drivers/regulator/max77826-regulator.c |  2 +-
 drivers/regulator/max77838-regulator.c |  2 +-
 drivers/regulator/max77857-regulator.c |  8 +++---
 drivers/regulator/max8649.c            |  2 +-
 drivers/regulator/max8893.c            |  2 +-
 drivers/regulator/max8952.c            |  2 +-
 drivers/regulator/mcp16502.c           |  2 +-
 drivers/regulator/mp5416.c             |  6 ++---
 drivers/regulator/mp8859.c             |  4 +--
 drivers/regulator/mp886x.c             |  6 ++---
 drivers/regulator/mpq7920.c            |  4 +--
 drivers/regulator/mt6311-regulator.c   |  4 +--
 drivers/regulator/pf530x-regulator.c   |  8 +++---
 drivers/regulator/pf8x00-regulator.c   |  8 +++---
 drivers/regulator/pv88060-regulator.c  |  4 +--
 drivers/regulator/pv88080-regulator.c  |  8 +++---
 drivers/regulator/pv88090-regulator.c  |  4 +--
 drivers/regulator/slg51000-regulator.c |  4 +--
 drivers/regulator/sy8106a-regulator.c  |  2 +-
 drivers/regulator/sy8824x.c            |  8 +++---
 drivers/regulator/sy8827n.c            |  4 +--
 drivers/regulator/tps6286x-regulator.c | 10 ++++----
 drivers/regulator/tps6287x-regulator.c | 10 ++++----
 41 files changed, 119 insertions(+), 119 deletions(-)


base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.47.3


