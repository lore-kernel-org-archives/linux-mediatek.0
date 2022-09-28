Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A96C6FA90
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 15:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TKyELhwl5dAsyQQQ7VSZO+R/LVQw/gX9SUYBwHneOuI=; b=Wq+0Jw1yNwR1NUFDuTrB7TJx9Y
	51FO2kcgPXgf4h2YytGnw0Tl8oEhIWsbTc8gPcpfkbPbtRGJRNQVmj9QYPFhrufysC6r8hK07fy3n
	u7DLMYDqLOm+QPdv4tWA09ccQAFDMTSPyGSXbCExmyQAEBHrKXulsEnA8rpsPKqCL+7FRTbygy5xv
	uyk4GVtoVnvy81Ofb4+4Cl2lBdqukV876ZYo4psV/fGam/mKPV7gH+ufb1Bz89Eb+G5tes+V83NZz
	nnnnuk2ZOTO6t1NIQBr7GNwpDLi4NdEe5ga6FnsLt12EMyF6rvLtpFIZzSL4fBnfhFDB5DRZ/5/VC
	9VziF8KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odZSM-00H10y-87; Wed, 28 Sep 2022 15:58:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odZPZ-00GzO1-8c; Wed, 28 Sep 2022 15:55:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D1FDD61F0D;
	Wed, 28 Sep 2022 15:55:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1A3AC433C1;
	Wed, 28 Sep 2022 15:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664380547;
	bh=AsSGtp1hkzL8NIS4nEw2a0/D7oTq6NL/9e+KpV8EKDU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=snJXPE22Q+fZfmdwH4NHVDl7njmUHnNXM2B7nQfKj+VFJqDIAtYYbJb23aY+eiKdN
	 iIFRY0YgU5Ew78HtggwgHTTleUlLTRtbJNU7rBvgNciioeGXQRfPlR0k33nlwJjlUE
	 GdNQGbDbFNKZjswPp26HRuyVcV+Rhhvhq2FZ3y9D+chLbtTu8278VzAgE2qNMOI2p3
	 Ewznlh4iFH1dGWHYXtLKng+3d2deAWB/14nFDC/xB5G6gk++bwFCqbv1ZFZrjcRN2r
	 yUaAcMYBshpUrkwaF4iM07/ifllXNeb+OBst5cBwtNdWgK0ZO+6f6hTD6dk6zMyMWV
	 Ko4p3fBaC92bw==
From: matthias.bgg@kernel.org
To: roger.lu@mediatek.com,
	jia-wei.chang@mediatek.com
Cc: nfraprado@collabora.com,
	khilman@baylibre.com,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 8/8] soc: mtk-svs: mt8192: fix bank data
Date: Wed, 28 Sep 2022 17:55:19 +0200
Message-Id: <20220928155519.31977-9-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928155519.31977-1-matthias.bgg@kernel.org>
References: <20220928155519.31977-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_085549_377449_A36417BB 
X-CRM114-Status: GOOD (  12.37  )
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

From: Matthias Brugger <matthias.bgg@gmail.com>

Values vmax and dvt_fixed are not changed at runtime, set them as needed
in the svs_banks struct.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

---

 drivers/soc/mediatek/mt8192-svs.h     | 4 ++--
 drivers/soc/mediatek/mtk-svs-mt8192.c | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/mediatek/mt8192-svs.h b/drivers/soc/mediatek/mt8192-svs.h
index 6571ebcb2c0f..bf8c6030428f 100644
--- a/drivers/soc/mediatek/mt8192-svs.h
+++ b/drivers/soc/mediatek/mt8192-svs.h
@@ -16,7 +16,7 @@ static struct svs_bank svs_mt8192_banks[] = {
 		.turn_freq_base		= 688000000,
 		.volt_step		= 6250,
 		.volt_base		= 400000,
-		.vmax			= 0x60,
+		.vmax			= 0x61,
 		.vmin			= 0x1a,
 		.age_config		= 0x555555,
 		.dc_config		= 0x1,
@@ -41,7 +41,7 @@ static struct svs_bank svs_mt8192_banks[] = {
 		.turn_freq_base		= 688000000,
 		.volt_step		= 6250,
 		.volt_base		= 400000,
-		.vmax			= 0x60,
+		.vmax			= 0x66,
 		.vmin			= 0x1a,
 		.age_config		= 0x555555,
 		.dc_config		= 0x1,
diff --git a/drivers/soc/mediatek/mtk-svs-mt8192.c b/drivers/soc/mediatek/mtk-svs-mt8192.c
index 838a94834741..183acf2829f0 100644
--- a/drivers/soc/mediatek/mtk-svs-mt8192.c
+++ b/drivers/soc/mediatek/mtk-svs-mt8192.c
@@ -40,8 +40,6 @@ bool svs_mt8192_efuse_parsing(struct svs_platform *svsp)
 			svsb->dcbdet = (svsp->efuse[17] >> 16) & GENMASK(7, 0);
 			svsb->dcmdet = (svsp->efuse[17] >> 24) & GENMASK(7, 0);
 		}
-
-		svsb->vmax += svsb->dvt_fixed;
 	}
 
 	ret = svs_thermal_efuse_get_data(svsp);
-- 
2.37.3


