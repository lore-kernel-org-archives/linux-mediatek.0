Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A43CCF9E5
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Oct 2025 12:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J+oIT4ZSlvcfRBxWrhMbinuOO7yYO/gbdfjRoPL1coY=; b=OkD7mOltou2LVZ
	XYYVlWSg81k2NPdY8uMRA5J1TJd3ujZl+QiS0gNiQr6o8QQgWuwwTStm/5go2+NQvxym3qNYgp3CG
	aYc/oNBMcjiiuhRvQZIv9EmtHtcKnoagCkr6RVU+LQmanpOktAuIAU91+I2RDqeYRzq8Re+U2g8v2
	3xjptLvbfGvyq9MjJwDkKH/TEtdJCaFD/Y4+aXYW0OH5DZBUYt8d81+D4ulKO2VrSRjyL/UxOhdoC
	UZIc1TqhYN9lNhuRUcNJeZT7Fs/ywWA1doD876RQSm8BCOinshPoBT2++fg4zhNCKFY+wTjCnW6ao
	gRpBeGPP+so+lJrB8hfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCzlW-0000000CJMs-0ild;
	Sun, 26 Oct 2025 12:22:30 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCzlC-0000000CJ8J-0x9J;
	Sun, 26 Oct 2025 12:22:13 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout4.routing.net (Postfix) with ESMTP id AF8551009AF;
	Sun, 26 Oct 2025 12:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1761481324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=J+oIT4ZSlvcfRBxWrhMbinuOO7yYO/gbdfjRoPL1coY=;
	b=Id9AfSYAhE7BUezRgygKn+cTdeMOS9iccD0ng4R2WApmSTYJzCCbI8sBEueLCgAiyhfc/u
	dYrXxb+B+75Ubd5pw4LPbgDBLXKAasM6sWSf8sJ48OLHS1xU5gBUxbuuhuY+S8rOE3To8t
	GqlEZnhmeVB57YcfTr0Vj+DtPs1pZOA=
Received: from frank-u24.. (fttx-pool-217.61.154.70.bambit.de [217.61.154.70])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 60B4D1226BC;
	Sun, 26 Oct 2025 12:22:04 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v1 0/5] Add MT7987 Thermal support
Date: Sun, 26 Oct 2025 13:21:29 +0100
Message-ID: <20251026122143.71100-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_052210_511046_6F09C900 
X-CRM114-Status: UNSURE (   6.94  )
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
Cc: devicetree@vger.kernel.org, Mason Chang <mason-cw.chang@mediatek.com>, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Balsam CHIHI <bchihi@baylibre.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

This series adds Thermal support for MT7987.

Frank Wunderlich (5):
  dt-bindings: thermal: mediatek: make interrupt only required for
    current SoCs
  dt-bindings: thermal: mediatek: Add LVTS thermal controller definition
    for MT7987
  thermal/drivers/mediatek/lvts_thermal: Add no-irq-mode for mt7987
  thermal/drivers/mediatek/lvts_thermal: Add SoC based golden Temp
  thermal/drivers/mediatek/lvts_thermal: Add mt7987 support

 .../thermal/mediatek,lvts-thermal.yaml        |  18 +++-
 drivers/thermal/mediatek/lvts_thermal.c       | 102 ++++++++++++++++--
 .../thermal/mediatek,lvts-thermal.h           |   3 +
 3 files changed, 111 insertions(+), 12 deletions(-)

-- 
2.43.0


