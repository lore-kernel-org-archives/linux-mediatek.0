Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7746FC54E58
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Mar 2024 22:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nlDWJdQycQkd27AXi7BJ6f+M3ZHXeiSce97p9DkUOiY=; b=aCUfhFQ2KfvWp8jCRrC1REyyah
	YbRG29jWm1c37GHPG1sFv7En0QU2EG4y5FJ1oJ+bS3Ws/qCqduAJfdWkjwX8r+CF/jAOa5Se7fN5E
	afiAxDsElD0AkfAR3gWdHBp0aljTGPwsY0X7c8UOX3ffwm7kDqvprTD09ZCtaIdYHIgKE+OWn1b5X
	NavQjH30MvCqDFHsHaIQnPmPEP7MUtfZh5QTrG4HvY6mAK3P+K0uAxpTXDD5vu35MbpRV8e2TQluN
	U3QEBV6/WrfPF+XiXLAOrfl1iva9URo4Pxhd4UX4jmnU43ChkjIP5DsGbAsuQxKhr14sHLx1OvRi1
	nMk+skaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roWmz-0000000DiVH-1RuY;
	Sun, 24 Mar 2024 22:58:05 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roWmt-0000000DiQ1-1aYe;
	Sun, 24 Mar 2024 22:58:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C38E4CE0AD8;
	Sun, 24 Mar 2024 22:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F080C433C7;
	Sun, 24 Mar 2024 22:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711321070;
	bh=auK8R9Pko+8qzyQY9/nghXInMkBIXsa2OBgChzHHXdM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j5EiQQ8GwKbok3hH+PEt6h+naJ9md59vvthaC7XO2XP39UqMQgN47xe56GLgNX0V5
	 fByjIV2hTpBZOYlrNmf52Cn6Q1ZTo6eSTtax4zIGPUPhREwUIWFERALn4G/V5OlzPR
	 M8Dn6P7PoyOit0wUkZpXxGldfyxBOTN0NJnZciIv5jUZlQynyl3GfU8ELdBV443ZBL
	 0J40AKmYdjTBbv9cYmuzef2g91Q9035YFBHbUm7oq8G5bOrdPhIzdjsiVgA8zbPWAN
	 mk1+yZoBMKOjjLG63FN+NTXsG64TdIeyq3x8XMlk1UIYq5tBsJz4KGW6wYHKS62ddr
	 bbvUO0FC35uKg==
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
Subject: [PATCH 6.7 633/713] rtc: mt6397: select IRQ_DOMAIN instead of depending on it
Date: Sun, 24 Mar 2024 18:45:59 -0400
Message-ID: <20240324224720.1345309-634-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240324224720.1345309-1-sashal@kernel.org>
References: <20240324224720.1345309-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240324_155759_679370_64E6DDDA 
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
index 3814e0845e772..b1e1d277d4593 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1832,7 +1832,8 @@ config RTC_DRV_MT2712
 
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


