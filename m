Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52CA606A335
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 18:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1UMOOH0K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=fJP11knfFTych7gxv27ORi0+MRq0AXKYglL5rvoVToA=; b=1UMOOH0K0S/xDKFQbbRo14nia/
	nddABGmlWNoRzhaL4HGd6dIavCBGIaj8ga0sVLoo6lgGlWQj7xI/3vOKVthAuivmuzbavlhlT4mVY
	wd/pJo00mli44yJnsQrczgcDDriS9H9tEtsypHP1cHwMjX31HleUOppxZuvGixTkRKUwce7ejSnbG
	4vrVTCBVe0R7TgtnQBMFu9etQn2NUCwGpGDYSoNN7KDKs5gp5KjfgfQwNpAeNV0XBUGuLUUiW4NWD
	EqPrEaFNAJUBSfg/F7KD/SKtimNTfd0JK7Pe+o7v7ZI/8I5knwlAYGFSAfjeu5vNB8N5iSckeG4IN
	KjYzc2Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZvg-0000000AtSy-41iJ;
	Thu, 12 Nov 2026 18:53:48 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZvd-0000000AtRy-2fxT;
	Thu, 12 Nov 2026 18:53:47 +0000
Received: from [2a04:4540:1403:f2fc:83ce:6656:246:c906] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xRZvU-002XVt-1n;
	Thu, 12 Nov 2026 19:53:36 +0100
From: John Crispin <john@phrozen.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	lei.dong@airoha.com,
	Linqi.zhang@airoha.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Rajeev.kumar@airoha.com,
	upstream@airoha.com,
	Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2] clk: en7523: do not sleep in the EN7581 PCIe clock disable
Date: Thu, 12 Nov 2026 19:53:29 +0100
Message-Id: <20261112185329.1314427-1-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_105345_728104_05EF9EED 
X-CRM114-Status: GOOD (  10.49  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

en7581_pci_disable() is the .disable callback of the PCIe clock gate.
The clock core calls .disable with the enable spinlock held and
interrupts off, but the callback sleeps with usleep_range(). Every boot
where no consumer holds the clock reports "BUG: scheduling while atomic"
from clk_disable_unused(), and so does the unwind of a PCIe probe that
finds no link.

Drop the sleep. Commit 90d4e466c9ea ("PCI: mediatek-gen3: Move reset
delay in mtk_pcie_en7581_power_up()") already moved the wait of the
enable side into the PCIe driver, and nothing depends on a wait after
the disable.

Fixes: 66bc47326ce2 ("clk: en7523: Add EN7581 support")
Signed-off-by: John Crispin <john@phrozen.org>
---
Changes in v2:
- Drop "clk: en7523: add a reset operation". i2c-mt7621 now asserts
  and deasserts the reset line instead (Philipp).
- Link to v1: https://lore.kernel.org/r/20261111085650.632025-1-john@phrozen.org

 drivers/clk/clk-en7523.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 24fdec2e6198..8f63482cbb7b 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -689,7 +689,6 @@ static void en7581_pci_disable(struct clk_hw *hw)
 	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
 	val = readl(np_base + REG_PCI_CONTROL);
 	writel(val & ~mask, np_base + REG_PCI_CONTROL);
-	usleep_range(1000, 2000);
 }
 
 static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,

base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.34.1


