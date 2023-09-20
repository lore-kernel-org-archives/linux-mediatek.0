Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98BDC04AB8
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Sep 2023 17:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pQwUghND64z4zbqjWnqIEtEy0NxbaqCMpc241OsTuik=; b=cVk1sZJQ4QxbOX
	N9ZKYJSCPEKI6Cu0PN04mKEZ8nQ+dllRtF42+rMZJ7Hiqx2sqKy0GQbCezlpUxjg+q5dyRJ1YmxSJ
	PhPNXgMK3JwmgtLEovFOJpuB6jChoZAgcDAG7NSBS0wzAhS99n+aX/8llxVIyoWmeliAUQVR0+dS4
	/oLecvtRYpZ9XX5mXVjFcXuKpqmsnpzvh0CciQcPOPHS8CGt41QUmvT7Gi9e+gR56LOMsvm1cwyJJ
	pj/W0wkD4K7wjbX+i2LoCI8OyhBWooj3qrIJTk6Xjgx2dJw6B1uMOcq5JBwut28j4Zyml0u0uQsQT
	IRohMVnsmSPEMzISqktA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qj1LB-003mDl-1q;
	Wed, 20 Sep 2023 17:50:21 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qj1L4-003m9S-1j;
	Wed, 20 Sep 2023 17:50:17 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout4.routing.net (Postfix) with ESMTP id 433E5100822;
	Wed, 20 Sep 2023 17:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1695232208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pQwUghND64z4zbqjWnqIEtEy0NxbaqCMpc241OsTuik=;
	b=VYXBfEmu1ygEHqH3fhaXBfVCODUYWXYlUAm2s5VwSkIrzBy1EVL0JUvfqGJCB2KqfVgm90
	j7aoOGoBCqoUcGxrxQiePAkOoAYenfUM452VGRZs9dsyJHhh9l8n0R+yPBFIvCJUuYEnsc
	Px1nUcQ039VWGuINGHwlnAiBOV6wiho=
Received: from frank-G5.. (fttx-pool-217.61.152.105.bambit.de [217.61.152.105])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 3BC671006BE;
	Wed, 20 Sep 2023 17:50:07 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/4] add LVTS support for mt7988
Date: Wed, 20 Sep 2023 19:49:57 +0200
Message-Id: <20230920175001.47563-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mail-ID: 52ab3123-c9b5-44d2-9154-ab57bf928408
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_105014_786388_9BBFC35E 
X-CRM114-Status: UNSURE (   8.99  )
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
Cc: devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Amit Kucheria <amitk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

This series makes allows soc specific temperature coefficients
and adds support for mt7988 which has a different one.

Frank Wunderlich (4):
  dt-bindings: thermal: mediatek: add mt7988 lvts compatible
  dt-bindings: thermal: mediatek: Add LVTS thermal sensors for mt7988
  thermal/drivers/mediatek/lvts_thermal: make coeff configurable
  thermal/drivers/mediatek/lvts_thermal: add mt7988 support

 .../thermal/mediatek,lvts-thermal.yaml        |  1 +
 drivers/thermal/mediatek/lvts_thermal.c       | 97 +++++++++++++++----
 .../thermal/mediatek,lvts-thermal.h           |  9 ++
 3 files changed, 90 insertions(+), 17 deletions(-)

-- 
2.34.1


