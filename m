Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC4EC77B78
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Apr 2023 19:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m7X9orIx3eVcDuw9DZPfbGHih5LWoPzdH3TBa0T7yS8=; b=hSfrbQ+1np8J9rpbFEl1HzvW7I
	BdmNR1hLfkTvIP1za546mOzNbLFNzeKBQNP4omLbNxV4EvlkT0pJaA6c2tGG2AVKLHoQni8xz8eJd
	HK3gjj2qFFPPRxG90P1sIHImsEXc4pHnG69Q4Al0bImTwJzTCxVCeh7dvlPsp/Qn6NbnE8iWXro8u
	WhpaeoxdpJ3mpJq2Bh4Eg/w2aLJ+ZRm96BRx2fFTg50ERVz10POgq8UOk6cFJxajtMaPZgjbTtu2g
	c9dXqDqCBfqYFR2xKwDb2hXejGx7d3GsY49VbJ+u68rPuD7HRWPJ3E6Ong9Psb/M3cuLCNKn+1SzM
	ec3naz6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppDQB-006FaQ-2V;
	Wed, 19 Apr 2023 19:24:51 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppDQ8-006FZE-1H;
	Wed, 19 Apr 2023 19:24:49 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1ppDQ6-0003wa-0a;
	Wed, 19 Apr 2023 21:24:46 +0200
Date: Wed, 19 Apr 2023 20:24:41 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	John Crispin <john@phrozen.org>
Subject: [PATCH 0/2] Support PWM on MediaTek MT7981
Message-ID: <cover.1681932165.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_122448_436141_BA844A24 
X-CRM114-Status: UNSURE (   8.34  )
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

Add support for PWM on the MediaTek MT7981 to pwm-mediatek.c as well
as new mediatek,mt7981-pwm compatible string to the existing bindings.

Daniel Golle (2):
  dt-bindings: pwm: mediatek: Add mediatek,mt7981 compatible
  pwm: mediatek: Add support for MT7981

 .../bindings/pwm/mediatek,mt2712-pwm.yaml     |  1 +
 drivers/pwm/pwm-mediatek.c                    | 54 ++++++++++++++++---
 2 files changed, 47 insertions(+), 8 deletions(-)


base-commit: 67d5d9f013d6c3829383c08162939cabff14fccc
-- 
2.40.0


