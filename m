Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344F2C021A9
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Sep 2024 18:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eAUZv2QoouB85vCiNfiFMAI5Jy82rBUr1o1TPjbIeic=; b=1hUG1I3KU/dRrj
	Uv0z/L65BKl3HdXtF8BEqnjnQmq1rNqa0hPXu2ecf90Su5b+RsjFy441qttVxmIwA6Msvz1SH0u+n
	6VGkBHxBE5UHAfFoeMbhkkXAK/U54Bf0VuY9rZ3DLZvbM5TWbC6rR+gshc2VifjJBHtty7Mv5SWIF
	b+jgcVX2owsrplrIJNjUabQAb27/FQMCeWp8PQbt6xjnYhYv6EPqoSO5s2oL/3PA1ne0I+lbcNENF
	UwkfofFKWGJFEYr0m+Ok1F19m1leKzHgBRDeD+mQSVSNkr49u8iR1NODHa4dgvIw3KnyrxZPpdbZI
	LLixw6vNqsz7T6Jc+kqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spXBY-000000014w6-3TUg;
	Sat, 14 Sep 2024 18:07:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spX9I-000000014U4-49il;
	Sat, 14 Sep 2024 18:05:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1726337130;
	bh=kQivVsyi2YlK67afNcK79cSiM+Ffg1dHW0BzqsTjx8k=;
	h=From:Subject:Date:To:Cc:From;
	b=QaAZ5WQafNNj1cfv14YvHb8U/KAgVqINKInYWQekhy4GTqUbK4pwB1jY7MAkSzVUE
	 tV8INcZ1lcZiQ6uPywKWEHNq9nrvQ2rWoyGxiGAoeu0aekEN+Q44eHb8XjzsGf3dio
	 I7Vyb43JJ3q7sZOBWuCuZbDcuOL6qHpcnh26F81Be2go39kXPPy9Av5R5hOmrDn9Te
	 X9BhzP6x8OECuL6Oyjs28wXuhQkDy4EadY74y0MmYxQHXfLLsGnJqdea9TKek1tz76
	 ptNGyVco4XVmfSDqaG7hgsJI4YFJv0kJDVuxROzza2TKH5SuNxggoR4JzBss+fpMHB
	 SLTK+5SLoKRjQ==
Received: from localhost (unknown [188.27.55.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4810617E3606;
	Sat, 14 Sep 2024 20:05:30 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH 0/4] Provide devm_clk_bulk_get_all_enabled() helper
Date: Sat, 14 Sep 2024 21:04:53 +0300
Message-Id: <20240914-clk_bulk_ena_fix-v1-0-ce3537585c06@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEXQ5WYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDS0Mj3eSc7PikUiCRmpcYn5ZZoWtolpRobm5sapGSkqYE1FZQlAoUBhs
 ZHVtbCwBEpezdYgAAAA==
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
X-CRM114-CacheID: sfid-20240914_110533_212400_C967704A 
X-CRM114-Status: GOOD (  12.48  )
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


