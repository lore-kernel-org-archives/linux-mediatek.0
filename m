Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F326DD3C909
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Oct 2024 11:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6qaXYxNWNFrDFi8HVD4BlyhasKu575jRPHqbQh0v0lk=; b=SksKVYr6evAVOB
	xEyxUX2T+5uZzIaO8vtnNcDC4AHpWYNSaZ4X9QnZFXdTJ6gjE575UAx9Gj6NUKtE0qjQWh05z9Fei
	AXbrzznBdAKbCSZwb+D0Q3t/LdM2nFeNHgFu8I4egpjMkcPQ+C+q8CIOtsSzD+wsPAfZGMA4HM6Zf
	3+FGuUPlUcN9QzClkqFvZZ7M6pjWVJf0dG1ftdoph44EftktQdTxxUyoqB79zDIcTvE+bO5Qhjq9L
	TKpfJn8aXjtuxJk2MM7nu1DloHuxUFiaENFiTnpeCroMmGw8WZDONZyf0UlZuhOERKtPPdWORIae7
	cKFxh0x50/ZBDfviVeog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t27UK-00000003CQ6-3QqL;
	Sat, 19 Oct 2024 11:19:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t27RO-00000003BUh-1XBX;
	Sat, 19 Oct 2024 11:16:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729336571;
	bh=zy6eBkC6mTD47sGFuSu/kE6O5nq6hr0S/KoQYOZztNY=;
	h=From:Subject:Date:To:Cc:From;
	b=CMniy5LPAE6Nbv0OawIzhTrrk1jWeUuKok05gfHqs0dlVLRnXnvjL7ULDSbVN85a2
	 xHY748AECrXlSiAVNigckaZ65BnGbRWKrseZk8niPdtXa5fn2m7mpZLZGvta8V0pDN
	 JCASHZ4p/D2QQYE6amkBGYjnH2NQqBNSt3g05P/jbmUg2rI7Iq5B+4caCZlSaCQLbt
	 crQ3TZ8Sk7XWlcxWy7bWniVXeOjXaavy6/dyqHa0Jxvipz23Cm4HdqTguHu1EjnGqS
	 4aFK+STqx4Z1GF4HQM5yVePXAm0D9l+sCTuQefSSxWC8GOuuCw5+gmHx+f6HH/OgdF
	 rhRJ4jgiIyXXg==
Received: from localhost (unknown [188.24.146.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9058217E1574;
	Sat, 19 Oct 2024 13:16:11 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v4 0/4] Provide devm_clk_bulk_get_all_enabled() helper
Date: Sat, 19 Oct 2024 14:15:59 +0300
Message-Id: <20241019-clk_bulk_ena_fix-v4-0-57f108f64e70@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO+UE2cC/23NSwrCMBQF0K2UjI3k03zqyH2IlCRNbbA2kmhQS
 vduWlBEO3lwL9zzRhBtcDaCXTGCYJOLzg85lJsCmE4NJwtdkzMgiJSowgSa/lzrez52UHXrHhB
 zrYSgTDZNC/LsGmyuF/JwzLlz8ebDc/mQ8Ny+sfIfSxgiaCxlVDDJDOJ74/teaR/U1vgLmMFEv
 hDCVxCSkcoILhhGrdZsDaEfBCMsVxCaESas1FqSkiPzi0zT9AI46PHGPgEAAA==
X-Change-ID: 20240912-clk_bulk_ena_fix-16ba77358ddf
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
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241019_041614_608785_7608FFB1 
X-CRM114-Status: GOOD (  13.78  )
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
Changes in v4:
- Dropped usage of gotos in the new helper implementation to further
  minimize the diff (Stephen)
- Link to v3: https://lore.kernel.org/r/20241018-clk_bulk_ena_fix-v3-0-57e8bb82460c@collabora.com

Changes in v3:
- Made devm_clk_bulk_get_all_enable() use the new helper, as suggested
  by Stephen to improve diff readability
- Rebased series onto next-20241017
- Link to v2: https://lore.kernel.org/r/20240926-clk_bulk_ena_fix-v2-0-9c767510fbb5@collabora.com

Changes in v2:
- Dropped references to 'broken' API in commit descriptions, per Mani's
  suggestion
- Added R-b tags from Angelo and Mani
- Link to v1: https://lore.kernel.org/r/20240914-clk_bulk_ena_fix-v1-0-ce3537585c06@collabora.com

---
Cristian Ciocaltea (4):
      clk: Provide devm_clk_bulk_get_all_enabled() helper
      soc: mediatek: pwrap: Switch to devm_clk_bulk_get_all_enabled()
      PCI: exynos: Switch to devm_clk_bulk_get_all_enabled()
      clk: Drop obsolete devm_clk_bulk_get_all_enable() helper

 drivers/clk/clk-devres.c                | 23 ++++++++++++-----------
 drivers/pci/controller/dwc/pci-exynos.c |  2 +-
 drivers/soc/mediatek/mtk-pmic-wrap.c    |  4 ++--
 include/linux/clk.h                     | 12 +++++++-----
 4 files changed, 22 insertions(+), 19 deletions(-)
---
base-commit: f2493655d2d3d5c6958ed996b043c821c23ae8d3
change-id: 20240912-clk_bulk_ena_fix-16ba77358ddf


