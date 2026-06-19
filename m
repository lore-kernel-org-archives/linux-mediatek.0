Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16BECD4F26
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2026 17:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VnBSc8UYlXwx9BnTwj6cOSisJHoWSOkPM10OKpYNjmo=; b=l6qECLeC/x/IYy9+/Nh54sxwDZ
	xwc91CpAZ6mrWD5GvQoaN6yHi2RapaJAOGfvLPgGDm4NWCeLLZrNLcpuJgrkf0cqNQLoWp356G4xX
	VU7IfvvUncXLIQ6EusnwxK6iuvt4z5q0QASstjilm2hZ+1KxRxpNF96j0kuHtg77cZay1/Rgph+Hn
	+d66tC6tY/i2JQ831+DhZDjNtkDkOjIOEI+WqRhR7eXQEefiaUHoMzvUW+RTOrEeXdFYknhipdWs6
	Vd1ECa5Dtc3dv/VuVrIegUa6J8WuLLe99iDEjjnKoYpARLQd6g0+vVHjGO5xGKfq4nOinZLpcTMFw
	YauGc1TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wacqJ-00000002oic-0DAU;
	Fri, 19 Jun 2026 17:17:23 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wacqG-00000002ohe-1Bvr
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Jun 2026 17:17:21 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-464192ab2e1so1428340f8f.0
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Jun 2026 10:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781889438; x=1782494238; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VnBSc8UYlXwx9BnTwj6cOSisJHoWSOkPM10OKpYNjmo=;
        b=OVQFFTeRUrL7cAdnU4vC4JhneDtky7BDWc/ROTh+EZmWcUgKki/TnhXeVb1Xf2mnIE
         UzVaz5rxm6T/uaMQB/C5aIQOiXxuoSrymfpkjw+pjAe/QdEkGSXnALBfnylh2P3TQ+lh
         wZqJn9xUtGuyuStrKQydKatijo5Mk+8kct0Psso3KjCJxUsQn6bykKvimj+RI/4zSE5X
         6XZBJH1USyk7WgfGETtWJ+T4LgmowyJSdURu7VrUoPXQcZWTqJlWZ2i/25XmWT9nVYYb
         3qwYq7iVQmOnnCpzey6sw+1chTHSIt94JY17zUQklOx2g3UFAVVMDUOMtlLFz4cqTg4o
         +7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781889438; x=1782494238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnBSc8UYlXwx9BnTwj6cOSisJHoWSOkPM10OKpYNjmo=;
        b=rW0hxqg/gnC9BdC4gKCOHHhNUUDz3q4b4cf/7eIHB9Dut8m6xjcPUeeWzOSOGKaIMZ
         n32DjeDNhmANaQWba3CXpudcL6/wgDxRUtV37Bi489ZyU9l8seEB8qVuDxMltBlfA97c
         kLWOIm4UkAtFVROtCVJnLaz7INyDLrkEfaw25q//drUvs4V1pwxVMDCaCbhsN50zMrJA
         Uy/xHqw/V3YehJrbdmQW/0WgMfzy/QhwZ5NCf9ftTqdRfS9b25cUkpMZXfneBHkYWkU6
         AJOJZXNXfKfJagvtrU0kM4AKRQ5txfEAOEMzQ4Lj9OVOhtORjC9CeXQQ9NEF8JHh9FP9
         YusA==
X-Forwarded-Encrypted: i=1; AFNElJ/TWqzpbcPASRk7eXcicL5+aZ4tw4Ms9rZuMjtzvoXvpVEDM6prS4EL/c7LQXn+BOyOz5sn/OGbGV4lBYQeTA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVgEtVTdD0bsC+id/ivN9kkJ22r6pWacWN1qw9HHe2Dshyq82H
	zEy1DTbLj8NdaxlzOL37BZadMNRWv4VBV1KrG1xflGScGTIQ3S9Xw18gStHDxJR86zc=
X-Gm-Gg: AfdE7clEJQ1E9x7l5OWXsIpv5TTdTKoh5ZfaPHe3QOnIMBK/QPCGlCMx+2n9TzvyKfQ
	OQdL12WtC7G107kvbvPgnsq+MAWySOgO0nwrtIgqKitK9+IarFHasFpD4mRHPpJR9ZnJ7pRHrW1
	Iwi4JoSj/Xbjo0Ta7eK76TJBBeX+9pzbymgAqn7KNhYvskr6Yc8V3oNxWIyxGQTEAGhdo7GOqxU
	s30BN5xP9jgjAXr130ah9yY7erQ6832iMYKZVDs6aVy2k7mDUdflvcsGMroPbwXJViqIJkyCr61
	ype//9bDRjGDg/SElArFQz+R0q+nl6Yms+ci0bVFnzddJHEUussjDqIkf9JEXt0CKZuVHI9sd9x
	rrY1eNIOcFnJxA1VYW1dBdhRqjwYjxGXWJmRnxN+yQfHxVfve6xqoIPaDy975JBk26zrn1SPsXl
	abwaeoE/mR0PLTGhvzW0ZzUukJ0UV8SaC6XCIkYjMczpiQ1Fqd17PMSzMPcIdoYmiHOopdmdR2c
	N2TZat2K8lPEA==
X-Received: by 2002:a05:6000:41ea:b0:464:5df5:332a with SMTP id ffacd0b85a97d-465026e230fmr8366571f8f.34.1781889438448;
        Fri, 19 Jun 2026 10:17:18 -0700 (PDT)
Received: from localhost (p200300f65f47db04359fc0e70763236f.dip0.t-ipconnect.de. [2003:f6:5f47:db04:359f:c0e7:763:236f])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-466643f563dsm518522f8f.3.2026.06.19.10.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 10:17:17 -0700 (PDT)
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
	Saravanan Sekar <sravanhome@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Icenowy Zheng <icenowy@aosc.io>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 0/2] regulator: Rework i2c_device_id initialisation
Date: Fri, 19 Jun 2026 19:17:07 +0200
Message-ID: <cover.1781888370.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2725; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=9Hxww+IYRkWzBq6UrtXK6wGC7HxfepSCgDoSx52js3g=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqNXmTefNhPuD/6XHRpNixylKSBFFFhgvNycV1p WE8x7Ep/KeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCajV5kwAKCRCPgPtYfRL+ TuY7CACa1dxhd74TZtB/tZZHX6K2Lrx4mDNhsE4A0FooXFTdJt6q4pgQLbhwwQJhPo6OCebFBVO b3XlS8KMLn1rN2ZHBQtEdTK20n/jUOMfnozbwaRhcUMxKP3FIBDbNhuM0feMAltDwlkxrrkrTIV O8sNtfMkYR61W+t1XV7w1CH8A2losLj9lNWsCTt/AJuVcegfjOGUC+LuO8IzdOd37fCqSpjjZ8D /+2UAhNJ4pLGIQ3Rel/RAXLGmOa5NSsL8QFDxzXwW45NhHvUyVzP0z6nEmxPmWikKNAJllHLRGp 1FeDu+7sWxtbiO41mp2kEJAYM/PS1MUfuUt2M4FfSVDCPWnA
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_101720_352502_525D5761 
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

Hello,

v2 is available at https://lore.kernel.org/lkml/cover.1779184320.git.u.kleine-koenig@baylibre.com .

The only change is that I rebased to next-20260619 and dropped the
adaptions to the of_regulator_match arrays that Laurent pointed out to
not belong into this patch set.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (2):
  regulator: Drop unused i2c driver data
  regulator: Use named initializers for arrays of i2c_device_data

 drivers/regulator/88pg86x.c            |  4 ++--
 drivers/regulator/ad5398.c             |  4 ++--
 drivers/regulator/da9121-regulator.c   | 20 ++++++++++----------
 drivers/regulator/da9210-regulator.c   |  4 ++--
 drivers/regulator/da9211-regulator.c   | 18 +++++++++---------
 drivers/regulator/fan53880.c           |  4 ++--
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
 drivers/regulator/slg51000-regulator.c |  4 ++--
 drivers/regulator/sy8106a-regulator.c  |  2 +-
 drivers/regulator/sy8824x.c            |  8 ++++----
 drivers/regulator/sy8827n.c            |  4 ++--
 drivers/regulator/tps6286x-regulator.c | 10 +++++-----
 drivers/regulator/tps6287x-regulator.c | 10 +++++-----
 41 files changed, 104 insertions(+), 104 deletions(-)


base-commit: 3ce97bd3c4f18608335e709c24d6a40e7036cab8
-- 
2.47.3


