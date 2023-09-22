Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A191E7D0B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Sep 2023 05:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ED86tK2Vq5XtLhncWzK58V3rGjhhsqFD9oGClRJ2Dh4=; b=G/+9g8v/2w+njb
	pmrZLs4ljzeCcTtC9KUAaoABVmqhTBEZVJIOLy1BXCIKxy5ILLm2mcqwS/LfHDDJoe8aZN37u2mxw
	K70W5JJ/1jmw2nS8dChxkLjivDTCfpHwHLvjWDD6mZXa3Q6jBslVbgLNkbIKZdzmfCjmexdeXYUlJ
	ZCW7ito8mt2Pf1fNe4rtwPUcK7zdK5q/m+/ZTcDhoSxdJtwhhjGY0FSHW7XEdm8RSMs+nAfWsEMkV
	DmjYuV5tTT3a0X3q1jZocgosdSAw3dEQDKlNa0DmrwqDT68DWcYzBS5jts94zwsBhKKAw3DARD5CM
	MjqycuuhV1wlr1pfBBRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjZ3q-007xd8-0B;
	Fri, 22 Sep 2023 05:50:42 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjZ3g-007xXb-1Q;
	Fri, 22 Sep 2023 05:50:33 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout3.routing.net (Postfix) with ESMTP id 7FED06054A;
	Fri, 22 Sep 2023 05:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1695361825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ED86tK2Vq5XtLhncWzK58V3rGjhhsqFD9oGClRJ2Dh4=;
	b=PL76FSDw0gaIlL/uJGUDHHikS5oxLaHQL7QHNsmEVb+rm5Kggsq0ktcU0LSQSHIvuL8xN8
	gb54hh3sd7nJHtaNdWWi1ecR6c+09KosP+k4tkMnhOxa4z9VsLd7nD+5gpXZxv+ubuMANP
	+/+RX6U42D1H4PMsM/xvKZKJsNdWXAg=
Received: from frank-G5.. (fttx-pool-217.61.149.125.bambit.de [217.61.149.125])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 6847B4021D;
	Fri, 22 Sep 2023 05:50:24 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v3 0/4] add LVTS support for mt7988
Date: Fri, 22 Sep 2023 07:50:16 +0200
Message-Id: <20230922055020.6436-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mail-ID: 3c8c9fa6-0274-4355-a868-cc9d80e6d39d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_225032_642607_E80155DB 
X-CRM114-Status: UNSURE (   8.84  )
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
 drivers/thermal/mediatek/lvts_thermal.c       | 89 +++++++++++++++----
 .../thermal/mediatek,lvts-thermal.h           |  9 ++
 3 files changed, 82 insertions(+), 17 deletions(-)

-- 
2.34.1


