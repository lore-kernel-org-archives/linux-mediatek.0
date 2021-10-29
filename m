Return-Path: <SRS0=A00R=PR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED57C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 15:40:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D46761165
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 15:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D46761165
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EBrcfMG3zB1lB+Hf1H6gnTuOrBrXjaiYnf3ZZtPxtGw=; b=PWL6r/CZyS9zrP
	piWdSUNX+s2yt00nz7AMxBTEc7fxNb5WmQoZnsAwjKo4rIZ6xDAcqI+Amrt6MVoqDIUz1OU6tinyb
	FGzh+hPAag7tr1VzPBlqcdgMtPqib16gAQu64iAhXgfs7rAZd9jv3zw2qOtlrvPKrzU5bhYMk1xq6
	+aKIn1nYZTydRc2GEOw3fyg+ILM0JfRDhjKtV3gFDCurgqhYyL+xqQBP650khmWnAoLOWsUhpemYz
	W+4wK73v0ZkBbkrTOaStaNXh874tNd9UhN3OTN0ZKycvzK84sGao97pkENfS2JMnGwNvcPGVgVmS4
	lzYniwlvpsoYmGF74aMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgTzL-00BNGn-Ii; Fri, 29 Oct 2021 15:40:15 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgTz9-00BNEU-2b; Fri, 29 Oct 2021 15:40:04 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id 2626E1F45A44
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: Will Deacon <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 "kernelci . org bot" <bot@kernelci.org>,
 Guillaume Tucker <guillaume.tucker@collabora.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>
Subject: [PATCH v2] arm64: defconfig: enable regulator to fix mt8173 regression
Date: Fri, 29 Oct 2021 18:39:47 +0300
Message-Id: <20211029153947.225416-1-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_084003_272243_09861D08 
X-CRM114-Status: UNSURE (   9.28  )
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

A regression was introduced on some mediatek boards starting with
v5.15-rc1 in commit 109fd20601e2 ("arm64: dts: mediatek: mt8173:
Add domain supply for mfg_async") which effectively changed the
regulator from the always-on dummy to DA9211 without explicitely
enabling it, causing failures caught by KernelCI on Hana
Chromebooks [1] for previously used dummies like:

mtk-power-controller 10006000.syscon:power-controller: supply domain not found, using dummy regulator
mtu3 11271000.usb: supply vbus not found, using dummy regulator
xhci-mtk 11270000.usb: supply vbus not found, using dummy regulator

There might be another bug linking these power domains in the
mediatek PM driver, but that is a separate issue wich needs
addressing, for now just fix the obvious regression due to the
new regulator requirement.

[1] https://github.com/kernelci/kernelci-project/issues/66
Fixes: 109fd20601e2 ("arm64: dts: mediatek: mt8173: Add domain supply for mfg_async")
Reported-by: "kernelci.org bot" <bot@kernelci.org>
Cc: Guillaume Tucker <guillaume.tucker@collabora.com>
Suggested-by: Enric Balletbo Serra <eballetbo@gmail.com>
Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
---

Changes in v2:
  * Added Fixes tag
  * Slight rewording of commit msg to improve clarity

---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 545197bc0501..fb82971ff654 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -615,6 +615,7 @@ CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_AXP20X=y
 CONFIG_REGULATOR_BD718XX=y
 CONFIG_REGULATOR_BD9571MWV=y
+CONFIG_REGULATOR_DA9211=y
 CONFIG_REGULATOR_FAN53555=y
 CONFIG_REGULATOR_GPIO=y
 CONFIG_REGULATOR_HI6421V530=y
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
