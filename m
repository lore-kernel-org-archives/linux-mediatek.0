Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AAFBC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 13:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GDLrX4I/AxCgvtNaZ6qql/mttl3fgvfc58+sB0E5wAg=; b=hUcUfwjFCocO8e
	6ssP14UiGu5Wl4PY+J31R+V2xRwjwoGU78Jvip1pEItn2n5fg/RpSyetRFhMXRM9bcAJ/xplyKy4k
	fNZrik3s4RP170RFLQiZdeFvJjzxVtqSgNi43yqsLM2kWf3lOfxSKjC9DXFKkbdvkg9b92MdiO/4y
	AypCuL9ShmRLy0KFnLoplvcNMKllAhWGdKIraZW8Cs3huykFuxUGrzOiA3XDYyqbvJsvEoMA/s52C
	mKDKSBLuNP1DjZshW0Oj4wjJzC7oHYE5bJIef2JaXDLoyVo8JLlkQCczqBnqfi8AyTpJZBylVqdEd
	/hddSqgjaNPDlsdUCNPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0kHu-003tzT-IZ; Mon, 13 Jun 2022 13:39:26 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0kGy-003tdI-5R; Mon, 13 Jun 2022 13:38:30 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5BF86660166D;
	Mon, 13 Jun 2022 14:38:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655127504;
	bh=TETKvO7yzhsJVee/QiNgQ4n1RUjV1Q6NM9vNQ/zTq6g=;
	h=From:To:Cc:Subject:Date:From;
	b=ISTT2qz2Uyfiiw/NGE69FIQJpUcFunEyQIjA0OPA0lQm6Y2JP2VYTXkZXjfLK6cRU
	 jA00XhL5XBc3E0JDjP6ionTLRksMHx8CewzRBrOrNiEJtKwuOuBdTDF58856O+6Mcc
	 857EqIUc0PM69AoGuYR+GqBpbRbGdUOZ/Q60jYnmvTgOF5rQ3582ba/Tb7QcZ51+qB
	 sEJQDFU7uMGxABrvDyIPJgO5YyygHQbRdFWbJbyUQSwBoGcnvpxbFK9YW6Eck6g+u6
	 a749PHjxH5RZohl9hFeuqJAuXMH91HqdVyKV0995iMMv8iP2sEMHTyUHzkzuZ9At8z
	 z7qx0gXheIO5w==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: daniel.lezcano@linaro.org
Cc: tglx@linutronix.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	konrad.dybcio@somainline.org,
	marijn.suijten@somainline.org,
	martin.botka@somainline.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	paul.bouchara@somainline.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v4 0/2] MediaTek SoC ARM/ARM64 System Timer
Date: Mon, 13 Jun 2022 15:38:17 +0200
Message-Id: <20220613133819.35318-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_063828_385401_68551597 
X-CRM114-Status: UNSURE (   8.97  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In an effort to give some love to the apparently forgotten MT6795 SoC,
I am upstreaming more components that are necessary to support platforms
powered by this one apart from a simple boot to serial console.

This series introduces support to start the System Timer for the CPU
cores found in various MediaTek SoCs including, but not limited to the
MT6795 Helio X10 - and will most probably unblock many developers for
the upstreaming of various platforms.

For a broad overview of why/what/when, please look at the description
of patch [2/2] in this series.

Tested on a MT6795 Sony Xperia M5 (codename "Holly") smartphone.

Changes in v4:
 - Changed statement in documentation, now saying:
   "MediaTek SoCs have different timers on different platforms"

Changes in v3:
 - Merged mtk_cpux_{enable,disable}_irq() as one mtk_cpux_set_irq() function
   as suggested by Matthias

Changes in v2:
 - Added back a lost line in commit 2/2 (sorry, commit didn't get amended...!)
 - Tested again for safety

AngeloGioacchino Del Regno (2):
  dt-bindings: timer: mediatek: Add CPUX System Timer and MT6795
    compatible
  clocksource/drivers/timer-mediatek: Implement CPUXGPT timers

 .../bindings/timer/mediatek,mtk-timer.txt     |   6 +-
 drivers/clocksource/timer-mediatek.c          | 114 ++++++++++++++++++
 2 files changed, 119 insertions(+), 1 deletion(-)

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
