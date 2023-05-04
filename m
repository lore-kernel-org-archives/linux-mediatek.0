Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27D0C7EE25
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 May 2023 00:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/WVVe9XAhGGApmtEugaNh5y/RoxP1ozT4m0GPXJ77nw=; b=z6f3YG/olRpO7zD0K6aSH6bobe
	Lv+Wl6HVh8kXbCAYazgsAzLnR6djvVx4BmXaKHEEUxQoxiZNsGOZS6LnT8p4ysJ1S+1hRtVJH2N+O
	wmDwgEcpx1jCB5MF8ocIyrm5A5N19lVJDLE6AKTN6T9DB4jc/lpfaoKMU3odVXb/IpQkY58tgEXEa
	NrwX9dbxH3DaBjf9lSWau8oRK7L2OI42u5WS47ndynzlXPgoKoCW65FZIpqljB93nOjVh0XHveq3s
	beu+ToZ5FgkXqKjWe3dhCzEHx7OvQrS01qfhIbv25XHLu7ipN/+Rt1MhsqllrVO9S3KVtv9spWLbE
	Y/VRp9TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puN9k-006CiM-1e;
	Thu, 04 May 2023 00:49:12 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puN9e-006Cei-3A;
	Thu, 04 May 2023 00:49:08 +0000
Received: from notapiano.myfiosgateway.com (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6AF1866029DE;
	Thu,  4 May 2023 01:48:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1683161340;
	bh=fb9qzuGOPKwdGOlOltLWR82xaBQN6heDuW2S3Fru+/U=;
	h=From:To:Cc:Subject:Date:From;
	b=UKGB6Kw3vKZDXwfQqPEvvC3UVMVo3BMhPuyYlP6olq/3B2Db2zOjpns1Chy6Pewtb
	 +80HIQei65zowdbNqRbIJgeQvEw4uWmcp9I47y0x3HN3+dPxB4Bqo/a7QIObzDf+dy
	 E4jYD7NnzwCEfar9Ijacx5y57G78loqTdS01qCuhUEKgOnAKnLYjyNVVKKZGSOandk
	 dyvs4Sy6qXAKKNCow4PJoAAn8Tb+3XLi9KD7M0/RIf+FJxxBsSm8layenuR15l9jXX
	 92lucnOuUYLtlFGAAjRJll3l1ymikA2lkJrJ4UZTSqSoLyICp7Lx8XYOZEKTXipRZG
	 9EVyauRRKEodw==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: kernel@collabora.com,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Balsam CHIHI <bchihi@baylibre.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Alexandre Bailon <abailon@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Amit Kucheria <amitk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 0/6] thermal/drivers/mediatek/lvts_thermal: Fixes to the interrupt handling
Date: Wed,  3 May 2023 20:48:46 -0400
Message-Id: <20230504004852.627049-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_174907_201150_BB8EBBBB 
X-CRM114-Status: UNSURE (   8.43  )
X-CRM114-Notice: Please train this message.
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


Fixes in the interrupt handling of the LVTS thermal driver noticed while
testing it on the Spherion Chromebook (mt8192-asurada-spherion) with the
MT8192 support series [1].

These are standalone fixes and don't depend on anything else.

While version 1 fixed the interrupt storms that were happening, after
doing some more testing I realized that interrupts still weren't
correctly working when crossing thermal trip points, so I've added a
couple more commits to get that fixed on version 2.

[1] https://lore.kernel.org/all/20230307163413.143334-1-bchihi@baylibre.com/

Thanks,
Nícolas

Changes in v2:
- Added commits 3, 5, 6 to get working interrupts when crossing thermal
  trip points
- Updated commit 4 with interrupt flags for the offset

Nícolas F. R. A. Prado (6):
  thermal/drivers/mediatek/lvts_thermal: Handle IRQ on all controllers
  thermal/drivers/mediatek/lvts_thermal: Honor sensors in immediate mode
  thermal/drivers/mediatek/lvts_thermal: Use offset threshold for IRQ
  thermal/drivers/mediatek/lvts_thermal: Disable undesired interrupts
  thermal/drivers/mediatek/lvts_thermal: Don't leave threshold zeroed
  thermal/drivers/mediatek/lvts_thermal: Manage threshold between
    sensors

 drivers/thermal/mediatek/lvts_thermal.c | 142 ++++++++++++++++++------
 1 file changed, 110 insertions(+), 32 deletions(-)

-- 
2.40.1


