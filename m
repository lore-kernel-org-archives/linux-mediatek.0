Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A95ECF9C5B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 10:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C4sF4IUbIrYhn4mk5WPop91h9zhjBNiVFGYFeOOEcHw=; b=RcC3mw/iavjYN/8sGM8QEKB1Yo
	f6DC4tUD33YUlqWP1AdF9O+1Elxgxk5uaEufiD9I5yjI+mE1+B6yyVztwcZpzuaP4ywFXyN9Lxiuy
	Jj0gYbbw/zz+1mgpNbgmWTuakIhq/M2e51GsyS6grh2iDmB9sqvVAQakV2dNRd2sSPMjnfhQZbn2y
	ru78nrGjtDSirqEVNLmLD/ViH8bgqCEr8RP/Pb/ucdFItbyl8NKG64lK8SXxnkDxijWoHYLNOfAWM
	sCuil0DOWm+ipfQjJrSvRofLPrsHy9Gx/sHFtArTciVw0UgnHEfefjmIKHf3vZwwlpcpNZG/FGw9O
	8vskAwIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssfsl-0000000Gu8Y-0ZLb;
	Mon, 23 Sep 2024 10:01:27 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssfrb-0000000Gttd-09uX;
	Mon, 23 Sep 2024 10:00:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727085613;
	bh=snK43mCmJ4Ga5wLxzmBewItLUFUZkQuI8ynxqK/sO9Q=;
	h=From:To:Cc:Subject:Date:From;
	b=Zs9LwxE3N/eT4wW0nlGHI2aBTWIeWrFvW3ZIskTTWwkUGn0RjE86IokAOGuqq0v7x
	 VHGCWti1VchT5tMyjGGB4nvn13zzpG2P8NjbZ2cMVA1LUFq45N5pW1qww3ZfcP+7oz
	 vsG3nE0MwxCnTL85/o23QXeEtKu8TAl1r6EvRGpXk9Isa8xvhKkrQDNzWcr2K8EjLb
	 KBH4TX+WdpEdFzKMSOV8caahCNp6hSzM6RtAbjxK6Pt7PVqFP6w0RQzSEL/jM+LvPv
	 EvKXwOAkDxdquA+L5jGvaOLjUUPyI6Ze1oFo2ONg48BFlxMnMQDTLopTLuO7UTZqnJ
	 VidUgMDIvCfqw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8900A17E10AC;
	Mon, 23 Sep 2024 12:00:12 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lee@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	eddie.huang@mediatek.com,
	sean.wang@mediatek.com,
	alexandre.belloni@bootlin.com,
	sen.chu@mediatek.com,
	macpaul.lin@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v1 0/3] rtc: mt6359: Cleanup and support start-year property
Date: Mon, 23 Sep 2024 12:00:07 +0200
Message-ID: <20240923100010.97470-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_030015_278447_27004253 
X-CRM114-Status: GOOD (  10.92  )
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

This series adds support for the start-year property and removes the
custom handling of the RTC_MIN_YEAR_OFFSET (which is, effectively, doing
the exact same).

The start_secs timestamp was set to match the previous one from the
custom behavior so that there is no time drift on any device after
applying this.

While at it, a cleanup to use the Day-of-Week HW register instead of
manually calculating tm_wday was also performed.

For the bindings commit, this series goes on top of the MT6397 schema
conversion from Macpaul Lin [1].

This series was tested on a MT8195 Cherry Tomato Chromebook.

[1]: https://lore.kernel.org/all/20240918064955.6518-1-macpaul.lin@mediatek.com/

AngeloGioacchino Del Regno (3):
  dt-bindings: mfd: mediatek: mt6397: Add start-year property to RTC
  rtc: mt6359: Add RTC hardware range and add support for start-year
  rtc: mt6359: Use RTC_TC_DOW hardware register for wday

 .../bindings/mfd/mediatek,mt6397.yaml         |  2 ++
 drivers/rtc/rtc-mt6397.c                      | 29 +++++++------------
 2 files changed, 12 insertions(+), 19 deletions(-)

-- 
2.46.0


