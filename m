Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFF0C021A8
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Sep 2024 18:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LcIY0+9Um8+xwR2uy5PkSR9MhJF3iZRwezaDMhatg9Y=; b=Jdf8S985oYJAFjJtEvLODrL3OL
	Db7gG7j1nvoxDvaJaYvdF6JA1VOm9DTJTU9RvH6MWH5Nthz6oHkZ/S1zomEi11wa47Y77YhxFdmJF
	mkzjIV7k0JJ51+Ep7Soo+1FelC0H6qBqFyhmOG1Pd6DxLEYxQIjBD5YFUmbYM0mR/Nvn4y99itI0Y
	7X/etcOrnPMJT5pn/0vKL3xqF4BSOUC6sg2LgRvd32OBRaHVPgh4m7gy4NZhJEgyrJQmOf4dqIXm1
	D+iBYLgUUU02LG84J2yLkPl1WsP03d7mkXTAEmx95x/Qo4bdhHauoT0ybpYjmB3HNz+V+jCOtaeGW
	UaPgtBJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spXDd-0000000158d-1VRr;
	Sat, 14 Sep 2024 18:10:01 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spX9L-000000014Uh-0ASN;
	Sat, 14 Sep 2024 18:05:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1726337132;
	bh=3muyT9X92PcA9kU13x/WqK9DhbUrh5gBlt2HSvkCVgs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RbAqrqcmtU/7FKhKxF1SNp32+Av4HgrUsjsOkQFJUl9t4sUymWbNzmAv+eiQX7lNZ
	 BcZ473sYUReWgjDUKFmPb1IYwXAabmFOSuGplcz/QBqZNCMFpwKaFsBZnV84fP074L
	 OXujDH2OfFAsbuykYA8nlkL+6PQBeGiDfKk1EHJ42bHVv+uLpAFgN/OBI7HVeyTMmM
	 lbOx2AsSaZ5ZUVlIfh39bMVS+o+TWZK6kSKZACfxjet2uCM/pbbMC7SEW62dVM1D5t
	 61VxPVxuOzM0BFoBxJFlg1ZFJpaXwzLk4RrxB5XXhdm21jd59XQzVFZl4yQDWILkqT
	 KJEkiyGsqVo7w==
Received: from localhost (unknown [188.27.55.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9E6B617E360C;
	Sat, 14 Sep 2024 20:05:32 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sat, 14 Sep 2024 21:04:56 +0300
Subject: [PATCH 3/4] PCI: exynos: Switch to devm_clk_bulk_get_all_enabled()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240914-clk_bulk_ena_fix-v1-3-ce3537585c06@collabora.com>
References: <20240914-clk_bulk_ena_fix-v1-0-ce3537585c06@collabora.com>
In-Reply-To: <20240914-clk_bulk_ena_fix-v1-0-ce3537585c06@collabora.com>
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
X-CRM114-CacheID: sfid-20240914_110535_275153_5E9D5A6A 
X-CRM114-Status: GOOD (  13.71  )
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

The helper devm_clk_bulk_get_all_enable() is partially broken and will
be dropped since it missed to return the number of clocks stored in the
clk_bulk_data table referenced by the clks argument.

Use the newly introduced devm_clk_bulk_get_all_enabled() variant
instead, which is consistent with devm_clk_bulk_get_all() in terms of
the returned value:

 > 0 if one or more clocks have been stored
 = 0 if there are no clocks
 < 0 if an error occurred

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/pci/controller/dwc/pci-exynos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index fa45da28a218..056cebd4e0ba 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -300,7 +300,7 @@ static int exynos_pcie_probe(struct platform_device *pdev)
 	if (IS_ERR(ep->elbi_base))
 		return PTR_ERR(ep->elbi_base);
 
-	ret = devm_clk_bulk_get_all_enable(dev, &ep->clks);
+	ret = devm_clk_bulk_get_all_enabled(dev, &ep->clks);
 	if (ret < 0)
 		return ret;
 

-- 
2.46.0


