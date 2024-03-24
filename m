Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF6AC54E58
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Mar 2024 23:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VgCUQNzvEsF9n3wsiDoj8RkLgWQl2iWhWQaq3bpk8Zk=; b=srv/1Xjrrha60UruCx9BIkJirt
	9fXzOZ3YSqV2hrh9VYt7v6MMMBWCvTGGiQN/xvcEw8Sij/HFJ456R+o3yBapqR4XpbXHlZh1X1CqF
	cBDZy5AKsqZItqx9rbAJ7+0VoIGgxh+sgwMQD4UlvSjIpALG5Xd+zyBGeNP8bj7llaux5RwLv25kz
	/3Wwd5Z9Ozf05d5Rhu40cEgUKXMTnV9ZLyVGIVKbh5ZcBff/XEHpxph1/OkVKdj4VUgR57IzrTdAP
	su7ajb7JrnX4yWIhio8UiCPUiER9+h2wf4Gf4xdKxdXwY8ax3kxndTSK+9Lg4c4Y+zX034pRL5i1a
	i3pIydlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roXVa-0000000DwKq-1GgG;
	Sun, 24 Mar 2024 23:44:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roXVN-0000000DwGI-2AC0;
	Sun, 24 Mar 2024 23:44:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C325D60F3E;
	Sun, 24 Mar 2024 23:43:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B78AFC433C7;
	Sun, 24 Mar 2024 23:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711323836;
	bh=epx3Knk9RNJ4Vo/NPzLzQAq4psMUnGkQ7mnl0Vhi1Sc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hKlrWTLmEscDOfPpWVywVvVIZU2bGAYt34gz+mDRWZPTettUsCAAwMDgCjaaITnM3
	 iqcTmCmliLdmI3PusAQ7bqM7g7XqmHwLv/a+XzcjtSfGea8IcDvuNX+ti4lb9hrbVB
	 UO4PmfHtjqREQW6y3ypUVBSGrt0+grqHT/8zNNOMREmKc1kW31jCqYDIxuAbNh6Oaf
	 MNRCfAQY3KvvSo7MRDeCDWR4OZitjXG36MqmTjw1SAOa0DFg38tWGLSyVzhSO2MkDF
	 PPN2rlE7Iwe4PFQKIVps7g9Q425T0zBz0b5/VSwc9MwnGUggw0QtlEk8DMRjmESyKG
	 fueQjfBW1/SBQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Rosin <peda@axentia.se>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.10 214/238] rtc: mt6397: select IRQ_DOMAIN instead of depending on it
Date: Sun, 24 Mar 2024 19:40:02 -0400
Message-ID: <20240324234027.1354210-215-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240324234027.1354210-1-sashal@kernel.org>
References: <20240324234027.1354210-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240324_164357_638616_627E8DDB 
X-CRM114-Status: GOOD (  12.98  )
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

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit 544c42f798e1651dcb04fb0395219bf0f1c2607e ]

IRQ_DOMAIN is a hidden (not user visible) symbol. Users cannot set
it directly thru "make *config", so drivers should select it instead
of depending on it if they need it.
Relying on it being set for a dependency is risky.

Consistently using "select" or "depends on" can also help reduce
Kconfig circular dependency issues.

Therefore, change the use of "depends on" for IRQ_DOMAIN to
"select" for RTC_DRV_MT6397.

Fixes: 04d3ba70a3c9 ("rtc: mt6397: add IRQ domain dependency")
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Eddie Huang <eddie.huang@mediatek.com>
Cc: Sean Wang <sean.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Peter Rosin <peda@axentia.se>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Link: https://lore.kernel.org/r/20240213050258.6167-1-rdunlap@infradead.org
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/rtc/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 54cf5ec8f4019..8ddd334e049e1 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1833,7 +1833,8 @@ config RTC_DRV_MT2712
 
 config RTC_DRV_MT6397
 	tristate "MediaTek PMIC based RTC"
-	depends on MFD_MT6397 || (COMPILE_TEST && IRQ_DOMAIN)
+	depends on MFD_MT6397 || COMPILE_TEST
+	select IRQ_DOMAIN
 	help
 	  This selects the MediaTek(R) RTC driver. RTC is part of MediaTek
 	  MT6397 PMIC. You should enable MT6397 PMIC MFD before select
-- 
2.43.0


