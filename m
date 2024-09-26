Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2959ECCF9E9
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 10:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/ndhDAXn+/QZ3zX6sIAynBcXozhIQ2+w1G+kxl6gbVk=; b=KjPFrwLMx1zXXJ
	c/EFFyeKNwgvuIkwdIvFvVSSDiZP3b1J58EH8F51eXZjxID+OHmu+TzatN4HgrEBbsia+0cwOWDdG
	GWm7oPDhOPsHT+adVGBG1CgcQKLwa5lsJrkXs4HOWmQmnCwHayPk17IfGp97lPbpBcnQTCoV7uZTG
	xLAyomfLr5xgr3vafz324R8VEN3NhSJpQ6WnAk2BI1Uw/IqIrGL1vlqScoT2hKSsAE8QR0m9CxYfZ
	EZytjWXB24iGPYmdLMr3Nq/ZYU0WKckvFxNjp6gOrUYgry+qyPMjeItciRXKXiIPTRe30IyfgSqrb
	PU1XmoWaul7UEoktkhXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stm1m-000000087PE-0AiL;
	Thu, 26 Sep 2024 10:47:18 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stlyV-000000086Vp-3KvR;
	Thu, 26 Sep 2024 10:43:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727347433;
	bh=4m2OXplHfxIq+GC25lbDBxaJd+vMADGPxeGrykpTKOA=;
	h=From:Subject:Date:To:Cc:From;
	b=iU7qsenh4tXIkR0yvVb6YKXedRnlnTbUI0l93efQBDcikiB7CU+XnPsQn5aN0mIne
	 ZumR272isg24Hrd+3QrUmbRYlq+dBNVeJTHI30rhqgJx1WYAgJ/w1Bum7NDwDY7g8F
	 eVEnXGH3mHr+QwALBhGp5d8buLX+QpffwjBw4D2Of+4lKJexNIoZM1d3yi0qn6g3ZR
	 Ckiuam8AQFSj8clRGD7veWgW396ClyunBLtaeHL8S8FVKUoXPAMN5EADD9mzuRMMUA
	 r95X38ncegP1jtOdWYM5xCBYuu0tASZ7ZHLXBFuVyU3ogRRJLQzhwy+7MT0jYIwNBS
	 VWkltm4qyvarg==
Received: from localhost (unknown [IPv6:2a01:e0a:d1a:1250:792b:136f:2a18:fd70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 00CAF17E11E2;
	Thu, 26 Sep 2024 12:43:52 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v2 0/4] Provide devm_clk_bulk_get_all_enabled() helper
Date: Thu, 26 Sep 2024 13:43:19 +0300
Message-Id: <20240926-clk_bulk_ena_fix-v2-0-9c767510fbb5@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMc69WYC/2WNywrCMBREf6XctZEkbZrqyv+QUvK4tcHaSKJBK
 fl3Y8GVm4EzMGdWiBgcRjhWKwRMLjq/FOC7CsyklgsSZwsDp7yhB8aJma+DfpbARQ2jexHWaiV
 lLTprRyize8BSb8pzX3hy8eHDe3tI7Nv+ZM2/LDFCicFa1FJ0wtD2ZPw8K+2D2ht/gz7n/AEjP
 KnRtAAAAA==
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jingoo Han <jingoohan1@gmail.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_034356_235029_B03C77FD 
X-CRM114-Status: GOOD (  13.56  )
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

Commit 265b07df758a ("clk: Provide managed helper to get and enable bulk
clocks") added devm_clk_bulk_get_all_enable() function, but missed to
return the number of clocks stored in the clk_bulk_data table referenced
by the clks argument.

That is required in case there is a need to iterate these clocks later,
therefore I couldn't see any use case of this parameter and should have
been simply removed from the function declaration.

The first patch in the series provides devm_clk_bulk_get_all_enabled()
variant, which is consistent with devm_clk_bulk_get_all() in terms of
the returned value:

 > 0 if one or more clocks have been stored
 = 0 if there are no clocks
 < 0 if an error occurred

Moreover, the naming is consistent with devm_clk_get_enabled(), i.e. use
the past form of 'enable'.

The next two patches switch existing users of devm_clk_get_enable() to
the new helper - there were only two, as of next-20240913.

The last patch drops the now obsolete devm_clk_bulk_get_all_enable()
helper.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v2:
- Dropped references to 'broken' API in commit descriptions, per Mani's
  suggestion
- Added R-b tags from Angelo and Mani
- Link to v1:
  https://lore.kernel.org/r/20240914-clk_bulk_ena_fix-v1-0-ce3537585c06@collabora.com

---
Cristian Ciocaltea (4):
      clk: Provide devm_clk_bulk_get_all_enabled() helper
      soc: mediatek: pwrap: Switch to devm_clk_bulk_get_all_enabled()
      PCI: exynos: Switch to devm_clk_bulk_get_all_enabled()
      clk: Drop obsolete devm_clk_bulk_get_all_enable() helper

 drivers/clk/clk-devres.c                | 30 ++++++++++++++++--------------
 drivers/pci/controller/dwc/pci-exynos.c |  2 +-
 drivers/soc/mediatek/mtk-pmic-wrap.c    |  4 ++--
 include/linux/clk.h                     | 12 +++++++-----
 4 files changed, 26 insertions(+), 22 deletions(-)
---
base-commit: 5acd9952f95fb4b7da6d09a3be39195a80845eb6
change-id: 20240912-clk_bulk_ena_fix-16ba77358ddf


