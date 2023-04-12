Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528AAC77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 15:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ONT4p0rDW0G8k9WoMnUfvbf9Fn7bs8SjHR0Mp0VJIY0=; b=oKeeChn25PSs6/18mHxUq3NOfz
	OocoFBYVdu6Hvk73VUnZbc8qf/akROQ7pJQhQ/NQPHLwyp1hXvuauapKu1OVNYnLuv1QTkAYoZzb7
	5VCpNmyF4viqoePlxmMhLUanqk1nYvhGMra1Q5IxCtrQt92v+AYQLUYcBAxqscLj64ZhQf7djbH7g
	ERQ0Ttd4ehX+cRp0R3sgcnj9HI3LG6Lf2peSRhIztwppOe9XHQXDkiu+yAFJgChTrfXZaFO/9EeHN
	hfo0dvM8XJqSjbxjvJII8jTgjHG8ruIgiC/qQQr7Nr/NvrHOqhEmz1yJic35trMf7AqCvSt5fsVI3
	/eYwxfFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmcTR-003eIn-1k;
	Wed, 12 Apr 2023 15:33:29 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmcTH-003eAM-2H;
	Wed, 12 Apr 2023 15:33:21 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6E50B66031FC;
	Wed, 12 Apr 2023 16:33:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681313597;
	bh=ecJH2EtX3R5DZMYZKjQw1ZtBrs//AYhOJV8hfuaZ1iU=;
	h=From:To:Cc:Subject:Date:From;
	b=I4d1ZOWZuIT/oAmJVJMEP6w3ieVTTFsTZqe193tCIt14+gHejTpmZcBSVrEJg39PH
	 HKrNrkh79KFVkhTqGeiynDL9J+dGsIsgAXNn6f0UlQcz2X6mYViVA0o961ZIOVi12R
	 lnUCcB6EA9Jn/AavzH34cyw17ifZBJKzB5BpSNGJ4klGme3jVU6xZqwR0eyHmemTgm
	 m5kzhNozbvlEsdE90v+MxNnBBNJ893il1yRwuQwPMd0laV1n6stseHbm88I+KAvYBg
	 AUk9PvBkQpARW85FwVRc1U0lIyDjk8LrfaNHGT8pL7FBZg0KKI5CDoqBSqStGIaVMu
	 wuVM1BUoVijsw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: pavel@ucw.cz
Cc: lee@kernel.org,
	sean.wang@mediatek.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 0/7] Add support for MT6331 and MT6332 LEDs
Date: Wed, 12 Apr 2023 17:33:03 +0200
Message-Id: <20230412153310.241046-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_083319_873329_C6A4233B 
X-CRM114-Status: GOOD (  12.31  )
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

Changes in v2:
 - Rebase over next-20230412

NOTE: Since v1 of this series was sent in Semptember 2022 and got
ignored for *7 months* with no feedback, I'm retrying the upstreaming
of this same series.
There are no changes, if not just a simple rebase and another test
run on the same hardware.


MT6323 is not the only PMIC that has a LEDs controller IP and it was
found that the others do have a compatible register layout, except
for some register offsets.
The logic contained in this driver can be totally reused for other
PMICs as well, so I can't see any reason to keep this specific to
the MT6323 part.

This series brings meaningful platform data to this driver, giving
it flexibility and adding support for LED controllers found in the
MT6331 and MT6332 PMICs.

Tested on MT6795 Sony Xperia M5 smartphone.

AngeloGioacchino Del Regno (7):
  dt-bindings: leds: leds-mt6323: Document mt6331 compatible
  dt-bindings: leds: leds-mt6323: Document mt6332 compatible
  leds: leds-mt6323: Specify registers and specs in platform data
  leds: leds-mt6323: Open code and drop MT6323_CAL_HW_DUTY macro
  leds: leds-mt6323: Drop MT6323_ prefix from macros and defines
  leds: leds-mt6323: Add support for MT6331 leds
  leds: leds-mt6323: Add support for WLEDs and MT6332

 .../devicetree/bindings/leds/leds-mt6323.txt  |   5 +-
 drivers/leds/leds-mt6323.c                    | 444 ++++++++++++++----
 2 files changed, 350 insertions(+), 99 deletions(-)

-- 
2.40.0


