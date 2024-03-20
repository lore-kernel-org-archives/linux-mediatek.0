Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7747FCD11DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Mar 2024 08:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d7GTj/kIABthDHSP/Huy6Bqu/GDPuMpdkZz1ssNiWKc=; b=R0RIjAX2wmx/cDJ4kohNI5XDWe
	4QjIDvnctRSXftxetWaDhkQSTjMVGivUV7fBNOn3+3HYk8t8dWeSY5rMtEVzVdtSQIpVrduORAKv6
	plNy74gi1oRJv4KsP66+N+PwJ/OE3HTnyZ9p9z3ABphZA7/0sFtA2jlNqXgUboY/oOe8LstwAegSU
	ln7raZIR9cbDrPsKdHARExK+T9Yv2zKa/nxX0AHgpIIdSh5ObleirTjGEEISyCxtBR/8pYoTLVSA3
	fU7M9OZtxgbuiEAtRPENULpBBcNO+hsmgOzWgBZg1cYVkC5GOcMLXlEztGQ7RlWQDZYlOK7BGJrye
	6JKwD16A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmrmK-0000000GKbs-0dBK;
	Wed, 20 Mar 2024 08:58:32 +0000
Received: from ssh248.corpemail.net ([210.51.61.248])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmrm7-0000000GKKq-0fhv;
	Wed, 20 Mar 2024 08:58:20 +0000
Received: from ssh248.corpemail.net
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id RDA00141;
        Wed, 20 Mar 2024 16:57:41 +0800
Received: from localhost.localdomain (10.94.17.92) by
 jtjnmail201610.home.langchao.com (10.100.2.10) with Microsoft SMTP Server id
 15.1.2507.35; Wed, 20 Mar 2024 16:57:42 +0800
From: Bo Liu <liubo03@inspur.com>
To: <support.opensource@diasemi.com>, <lgirdwood@gmail.com>,
	<broonie@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <jagan@amarulasolutions.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Bo Liu <liubo03@inspur.com>
Subject: [PATCH v1 00/13] regulator: convert to use maple tree register cache
Date: Wed, 20 Mar 2024 04:57:27 -0400
Message-ID: <20240320085740.4604-1-liubo03@inspur.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.94.17.92]
tUid: 20243201657418796298d1f8af4ba8d88157147d862f2
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_015819_525213_13B266E5 
X-CRM114-Status: UNSURE (   6.05  )
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

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache.

Bo Liu (13):
  regulator: da9121: convert to use maple tree register cache
  regulator: da9211: convert to use maple tree register cache
  regulator: isl9305: convert to use maple tree register cache
  regulator: max8973: convert to use maple tree register cache
  regulator: mt6311: convert to use maple tree register cache
  regulator: pca9450: convert to use maple tree register cache
  regulator: pf8x00: convert to use maple tree register cache
  regulator: pfuze100: convert to use maple tree register cache
  regulator: rtmv20: convert to use maple tree register cache
  regulator: rtq6752: convert to use maple tree register cache
  regulator: tps51632: convert to use maple tree register cache
  regulator: tps62360: convert to use maple tree register cache
  regulator: rpi-panel-attiny: convert to use maple tree register cache

 drivers/regulator/da9121-regulator.c           | 4 ++--
 drivers/regulator/da9211-regulator.c           | 2 +-
 drivers/regulator/isl9305.c                    | 2 +-
 drivers/regulator/max8973-regulator.c          | 2 +-
 drivers/regulator/mt6311-regulator.c           | 2 +-
 drivers/regulator/pca9450-regulator.c          | 2 +-
 drivers/regulator/pf8x00-regulator.c           | 2 +-
 drivers/regulator/pfuze100-regulator.c         | 2 +-
 drivers/regulator/rpi-panel-attiny-regulator.c | 2 +-
 drivers/regulator/rtmv20-regulator.c           | 2 +-
 drivers/regulator/rtq6752-regulator.c          | 2 +-
 drivers/regulator/tps51632-regulator.c         | 2 +-
 drivers/regulator/tps62360-regulator.c         | 2 +-
 13 files changed, 14 insertions(+), 14 deletions(-)

-- 
2.18.2


