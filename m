Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A94C4451B
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2026 16:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Upsuqa7VWRcDlZ5pIPK+Qqnf3tlxThPfy/sKdzeNaMI=; b=FYqB8F1uearsrPG2SbwXwWdQJ3
	Nu0kspuqtkRwH/TidoBYnfgJWP+T9Yp6ggH8lsCFp9AnIieFiznIt2Ijm99/sk1zfpHzlH0gzSfXV
	PHZ89i7Ogu7+llfgfesp8rRs8DBdDZ4g1xN9hv+TS2HAh3QFc+L7RI4X+hn50HyZ9HJhPiYTjz0w3
	XUDwjttaacLuPm26gDYHBf7OSiA11FLS2n6/mMrphK8gTjzbd2Za44vtft+nh8YQ0neYrC2tOrP/O
	s3+MPNrj7x1zEC0kgEleK5v/ZMOYSiiMjeHYDawiDTQlB05K1Hx1QEfD/5eHSx+V65RX2QxLAKc84
	ACEmFhPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkldK-00000002lAT-0SLF;
	Fri, 17 Jul 2026 16:41:54 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkldG-00000002l94-3njC
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Jul 2026 16:41:52 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c1670dad7a8so637017566b.3
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Jul 2026 09:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784306509; x=1784911309; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Upsuqa7VWRcDlZ5pIPK+Qqnf3tlxThPfy/sKdzeNaMI=;
        b=PUa6vw593YGIevMoBagennzTFJJ1ngNLTJp9J91C871+V+SrZnzoT7zdSwfX5P1sFx
         u8j04ro+YOHt4bNMYhWi2UOxi1ghTiyL7WWrZPq4jhEaXq9iLJZAEhbPtSjjIesf96xa
         F5qesRqxJOPtkogReUZ+JO3RJqhdYNCLvOfYt2NMi6FloL+Nsilvi9rzkNLzaZYAcXVo
         xi5rFD2Kwiw7DUDtzjAwEZndr/5ksxifYFzcjTt/1zV+AQvw+yo6m0qA15Sj8LZL3dq8
         trX2HvH9hIYWl6VNDoQ9mnD0FlGNx+seoyAfyDNl/VZRIQuZnvlp9HjFrj/bPAICkgS2
         zlJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784306509; x=1784911309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Upsuqa7VWRcDlZ5pIPK+Qqnf3tlxThPfy/sKdzeNaMI=;
        b=Xa70l1iqJM5A80No7hituAwxWCgMjQR7hBwXiYH7vqVAFh+5J4DMwEnp3Do2mqWNVV
         jOyNF7Q+VgH0vGo1r7odY+KyAXzlzB7ctFGrBT0EXndjiddxGUNQug6UDjZznxhxt4GY
         h6BLEYi0NrmhAxJ/Zc63Fdl1usVwc+kPbefduXfVPxipiQY16xcZIC2edmWsumt4PPnk
         5HRHO2SWBRA1pWGqA7sWBJLxNPGmyKkfmkvem+avMSeXy4WV/m6OjzjSPjnb5dNPcnTd
         bLRB0g3ABAjZZnWk4wTjCQcsdlB+L9KwnNKRjje1OqSHbI0h+fxhVFjDPoi1AbwfGxP9
         7sDA==
X-Gm-Message-State: AOJu0YzuGb5pPDA5Vd8w4vynxvVwbExxqIN+G9Ba/q2vvXX6R9xpXHC7
	vYFQgBbb1IvA2TIkjkK6XycsyqIoe1diDMrTN3M4Gzo0MEd2+VIjXMQM+eBz/NDK
X-Gm-Gg: AfdE7cmNnA2Ftxgr98E1y0EIueL9R4SHjfAxVU0BAB+vuxf68NVnygSzO0grfUnJKpE
	5V+DggQrIyEo2Cis9nXxSPm/9Hg2JaRYmPqD4/QU/aXZZVXlea544spjocf1ZwleWyJLMGjLSQQ
	tdbqOg5vfXxtSxwnM3fddtOx/czGsVsVXiukyvdGtyW2nKCR0XvmwjFF8p9V88IC5vav/SoGi3y
	hDBfxZ0IriLTej5cfk+0dCKoLE74aJr4aQSus6ZMDECDUQZZSXlvT1wkZTgQyq//U+yQLt4JewS
	z9CGL/iWy6xszirbOGl1xxW1jQ8R8OGhQQtpFtdgOobBQFQzQjbJvd6YoKVJgLcRl387RhmwY4R
	QqzAAA0Elx/bzTIwGY4Z0C0bBBwuYzUDubpkX5wa2GVPt9d4Cyqjro0SUJtjJgvGqFjUe0+xfaA
	==
X-Received: by 2002:a17:907:7a89:b0:c16:1df9:6eda with SMTP id a640c23a62f3a-c16b48d373emr163696066b.49.1784306508409;
        Fri, 17 Jul 2026 09:41:48 -0700 (PDT)
Received: from luca-vm.. ([109.52.116.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705912972sm105880366b.14.2026.07.17.09.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:41:48 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/7] Properly describe mt8167 watchdog and mmsys resets
Date: Fri, 17 Jul 2026 18:39:11 +0200
Message-ID: <20260717163959.714561-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_094150_958816_16772431 
X-CRM114-Status: GOOD (  14.98  )
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

Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
which in turn falls back on mt6589-wdt. However according to the data
sheet mt8167 has 15 sw resets instead of 12, and the reset bits are
different from mt6589.

In the first two patches we improve the description of the resets for
mt6589 with values obtained from Android sources.

Then we introduce a dedicated mediatek,mt8167-wdt compatible for the
watchdog driver that describes correctly this SoC's resets. Also while
we're touching the bindings reset header, we add constants for the MMSYS
resets.

In the 6th patch we add a node for the mt8167 watchdog referring to the
new compatible in the SoC dtsi.

In the last patch, we define the mmsys reset table for the SoC. According
to the datasheet, there are 28 mmsys reset bits divided across two
adjacent registers.

Changes in v2:
- Sashiko pointed out correctly a missing entry in the mmsys reset table
  in the last patch.

Initial version: [1]

[1] https://lore.kernel.org/linux-mediatek/20260717151134.678839-1-l.scorcia@gmail.com/

Luca Leonardo Scorcia (7):
  dt-bindings: reset: Add MT6589 toprgu reset IDs
  watchdog: mediatek: Add wdt/toprgu resets for MT6589
  dt-bindings: watchdog: Add compatible for MediaTek mt8167
  dt-bindings: reset: Add reset controller constants for mt8167
  watchdog: mediatek: Add support for mt8167 TOPRGU/WDT
  arm64: dts: mt8167: Properly describe the SoC watchdog
  soc: mediatek: mtk-mmsys: Add resets for mt8167

 .../bindings/watchdog/mediatek,mtk-wdt.yaml   |  1 +
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      |  7 +++
 drivers/soc/mediatek/mt8167-mmsys.h           | 41 ++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c              |  3 ++
 drivers/watchdog/mtk_wdt.c                    | 13 ++++-
 .../reset/mediatek,mt6589-resets.h            | 24 +++++++++
 .../reset/mediatek,mt8167-resets.h            | 53 +++++++++++++++++++
 7 files changed, 141 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/reset/mediatek,mt6589-resets.h
 create mode 100644 include/dt-bindings/reset/mediatek,mt8167-resets.h

-- 
2.43.0


