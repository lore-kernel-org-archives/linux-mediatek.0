Return-Path: <SRS0=oVGr=EB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 850E9C4363A
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 18:01:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 138A3222C8
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 18:01:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AFTVemCr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 138A3222C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vwtGlnfjddIx+3ZeJQagvEtSfVTWZ15Ce+4w/hwwqCM=; b=AFTVemCrR2BAotY7O43b1qEJS
	6RW+zfF66VtBTvzp8x2sG5jYYpgtIBiT/hYP8AEVFNctnzneA6DZpXbxlZJwiHzdjsD/FNWqa/+ub
	CxgxMxqYSvgjhRRuN7eb4F/dVy3goEViZUCHs0CU9vXMJ3IroSwiCC62qwCL8ULzU9nY8r0cKHOAT
	ptLfRsHvlP8zhoH7UFZVxscz9HjZMBDApKVeyi4s5bIXSLW6wTJYZShdrBSIWGUcXOzDsuuzuxSjD
	NcUTtBUnMl8i0ZyLxi5AGCK3r+THaRGsXVO04bNcGnU7okzgSXDnTITgNgrxRk66IJ6rENj51rqR7
	H8H2PHqXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX6nf-00020T-DT; Mon, 26 Oct 2020 18:00:55 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX6ia-0007vc-PO; Mon, 26 Oct 2020 17:55:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 48AD91F44FC9
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/16] soc: mediatek: pm-domains: Add extra sram control
Date: Mon, 26 Oct 2020 18:55:16 +0100
Message-Id: <20201026175526.2915399-8-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201026175526.2915399-1-enric.balletbo@collabora.com>
References: <20201026175526.2915399-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_135540_990252_EE6EFAA6 
X-CRM114-Status: GOOD (  15.23  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: drinkcat@chromium.org, weiyi.lu@mediatek.com, fparent@baylibre.com,
 Matthias Brugger <mbrugger@suse.com>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Matthias Brugger <mbrugger@suse.com>

For some power domains like vpu_core on MT8183 whose sram need to do clock
and internal isolation while power on/off sram. We add a cap
"MTK_SCPD_SRAM_ISO" to judge if we need to do the extra sram isolation
control or not.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
Signed-off-by: Matthias Brugger <mbrugger@suse.com>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

Changes in v3: None
Changes in v2:
- Nit, split readl(ctl_addr) | pd->data->sram_pdn_bits in two lines.
- Use regmap API

 drivers/soc/mediatek/mtk-pm-domains.c | 25 +++++++++++++++++++++++--
 drivers/soc/mediatek/mtk-pm-domains.h |  1 +
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index 006eb7571d32..82f6d937ed93 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -24,6 +24,8 @@
 #define PWR_ON_BIT			BIT(2)
 #define PWR_ON_2ND_BIT			BIT(3)
 #define PWR_CLK_DIS_BIT			BIT(4)
+#define PWR_SRAM_CLKISO_BIT		BIT(5)
+#define PWR_SRAM_ISOINT_B_BIT		BIT(6)
 
 struct scpsys_domain {
 	struct generic_pm_domain genpd;
@@ -65,12 +67,24 @@ static int scpsys_sram_enable(struct scpsys_domain *pd)
 	u32 pdn_ack = pd->data->sram_pdn_ack_bits;
 	struct scpsys *scpsys = pd->scpsys;
 	unsigned int tmp;
+	int ret;
 
 	regmap_update_bits(scpsys->base, pd->data->ctl_offs, pd->data->sram_pdn_bits, 0);
 
 	/* Either wait until SRAM_PDN_ACK all 1 or 0 */
-	return regmap_read_poll_timeout(scpsys->base, pd->data->ctl_offs, tmp,
-					(tmp & pdn_ack) == 0, MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+	ret = regmap_read_poll_timeout(scpsys->base, pd->data->ctl_offs, tmp,
+				       (tmp & pdn_ack) == 0, MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+	if (ret < 0)
+		return ret;
+
+	if (MTK_SCPD_CAPS(pd, MTK_SCPD_SRAM_ISO)) {
+		regmap_update_bits(scpsys->base, pd->data->ctl_offs, PWR_SRAM_ISOINT_B_BIT,
+				   PWR_SRAM_ISOINT_B_BIT);
+		udelay(1);
+		regmap_update_bits(scpsys->base, pd->data->ctl_offs, PWR_SRAM_CLKISO_BIT, 0);
+	}
+
+	return 0;
 }
 
 static int scpsys_sram_disable(struct scpsys_domain *pd)
@@ -79,6 +93,13 @@ static int scpsys_sram_disable(struct scpsys_domain *pd)
 	struct scpsys *scpsys = pd->scpsys;
 	unsigned int tmp;
 
+	if (MTK_SCPD_CAPS(pd, MTK_SCPD_SRAM_ISO)) {
+		regmap_update_bits(scpsys->base, pd->data->ctl_offs, PWR_SRAM_CLKISO_BIT,
+				   PWR_SRAM_CLKISO_BIT);
+		udelay(1);
+		regmap_update_bits(scpsys->base, pd->data->ctl_offs, PWR_SRAM_ISOINT_B_BIT, 0);
+	}
+
 	regmap_update_bits(scpsys->base, pd->data->ctl_offs, pd->data->sram_pdn_bits,
 			   pd->data->sram_pdn_bits);
 
diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
index 7b1abcfc4ba3..4152b96c1b29 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.h
+++ b/drivers/soc/mediatek/mtk-pm-domains.h
@@ -5,6 +5,7 @@
 
 #define MTK_SCPD_ACTIVE_WAKEUP		BIT(0)
 #define MTK_SCPD_FWAIT_SRAM		BIT(1)
+#define MTK_SCPD_SRAM_ISO		BIT(2)
 #define MTK_SCPD_CAPS(_scpd, _x)	((_scpd)->data->caps & (_x))
 
 #define SPM_VDE_PWR_CON			0x0210
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
