Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CED4C021A9
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Sep 2024 18:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3ce3O/r96MZeJG4p40zbk0pdIVvpWH2gPvLROw3NWM=; b=hTlN7mL402i6ZZnpmQ9lRjZcXM
	bWLzxpWk1D/kOsvW3w1yu/Yn4QuZcHpUugyP7b/blIaj41kaxhRSglx48UOhPPmZeIpFLkkmLxlu1
	BywMGgQgNDfU6US77wKFCsqCdzF0twrrVylIudmPPbZq1V4EOld8c7Q7gDGTdg+j2iujz7L7zdBBG
	8z7ocqaCwY/GcdvIHP3jrBTLT+VWQc9uudiO3magCRePRC9TepIprJvOuCDwlaI48ODgRF/Nt//fk
	vGO3BCPDHoHgB3KcmJOcw07qcz/daVcQzuPwibmuEqYtc1mCup/PDyMUNyh/hi7kgoEAf32ak0hO4
	fwUzti/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spXCa-0000000152h-2G8w;
	Sat, 14 Sep 2024 18:08:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spX9J-000000014UB-0xYi;
	Sat, 14 Sep 2024 18:05:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1726337131;
	bh=dq/7n5tvMY7OuKBFVI6eGVpyHXnigzcGlUpBjIjzYY4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y3BBf5hxlCuSDPu1+AluaS4tOepIRBZjK2FifiEKfkjMNWzP0wmlk6crkFtC+yOAw
	 rYrsXL5Erihlqpk3mkc1kGZP89AkiIk4PGZyiFRirJtQs1F3IjSxCQrhE2q8BV8LXc
	 0rgv0Io/oWa5pjK7FOkvKHAC6rc+whfkE83diX8P1YijeM836hX+i/69GkDeQNsSGS
	 WhfvyN97K42W977+U1sAnVW2E1bN2u4jNEhdZLFw4u9tdlgmU21JBqxcN+m9h1sLA5
	 WwnBvb753+J5qwaH3f39dfnkMELZhQbdZRDlzlsxZumEZ2ztYQGvuOG92Jw3bjxxw2
	 vIG4Amu2XStBA==
Received: from localhost (unknown [188.27.55.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C72A217E360A;
	Sat, 14 Sep 2024 20:05:31 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sat, 14 Sep 2024 21:04:55 +0300
Subject: [PATCH 2/4] soc: mediatek: pwrap: Switch to
 devm_clk_bulk_get_all_enabled()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240914-clk_bulk_ena_fix-v1-2-ce3537585c06@collabora.com>
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
X-CRM114-CacheID: sfid-20240914_110533_637441_B270EE7E 
X-CRM114-Status: GOOD (  13.93  )
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
 drivers/soc/mediatek/mtk-pmic-wrap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 9fdc0ef79202..0bcd85826375 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -2518,8 +2518,8 @@ static int pwrap_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = devm_clk_bulk_get_all_enable(wrp->dev, &clk);
-	if (ret)
+	ret = devm_clk_bulk_get_all_enabled(wrp->dev, &clk);
+	if (ret < 0)
 		return dev_err_probe(wrp->dev, ret,
 				     "failed to get clocks\n");
 

-- 
2.46.0


