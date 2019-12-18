Return-Path: <SRS0=QBl7=2I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C722C43603
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Dec 2019 08:41:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC3B121D7D
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Dec 2019 08:41:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oECsQCbm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="CCxXhGGA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC3B121D7D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tPg/6UeoI5tAWfWGne26fGnqksfcIZ6RufsEpR1flX4=; b=oECsQCbmSfgeVF
	+c2/JMzfHq/1ekeXFECXknsJMWJmhOnKx/jHBVf5vTuUqeQFu43KMKSAgER1lSEeLnLlxvq+j1FfH
	rZ3RKvhfaJgk5lWTb4MfA/uGIjM3kBUCYv0kvvxOKMO17jAIXouEd2vItK9yKSSYD/Cd4sQgMOO2c
	hGZxyK5eDmg0edxV3UA9qyz/NpmkOAf5T8E5hVniUWO5GJf2iEow9tL39eJt5ebeu01nhm0keZVKR
	ODY0EfaoYw/MXEWE5fhlWj1B1MDWpMKLWyEybDLsAKLD21d0mUmwwzV6bmDB1P2YrlwTpBhbIQPr9
	hm6Cdl3SaIehh8WF227w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihUtf-0004be-FW; Wed, 18 Dec 2019 08:41:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihUtE-0004Dh-6O; Wed, 18 Dec 2019 08:41:05 +0000
X-UUID: 6afe5ed5a93641a7937dd764ffa0e4bb-20191218
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=qhKN5WCrE6NondREBgkOsegHHegoC/CoETvPSlY37GI=; 
 b=CCxXhGGAGuM3uwJKst/0naiJFxMMErRmfPoDpSOfDvhPSBrBpA2cFjCaCXo8nPiQzQVHljAplOmm9crNhGzHDooCagQ1npOdBWfYEIQuYh3NKk0WdbBloavSbd7BjUpIHRQOwAQIhYLAgILLDKEiF6N+58LCFU3WyWTFqYhyN0Q=;
X-UUID: 6afe5ed5a93641a7937dd764ffa0e4bb-20191218
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2045388208; Wed, 18 Dec 2019 00:41:00 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 18 Dec 2019 00:31:20 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 18 Dec 2019 16:30:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 18 Dec 2019 16:30:30 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, Sascha Hauer
 <kernel@pengutronix.de>
Subject: [PATCH v10 09/12] soc: mediatek: Add extra sram control
Date: Wed, 18 Dec 2019 16:30:45 +0800
Message-ID: <1576657848-14711-10-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1576657848-14711-1-git-send-email-weiyi.lu@mediatek.com>
References: <1576657848-14711-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_004104_236464_75662197 
X-CRM114-Status: GOOD (  12.31  )
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
Cc: James Liao <jamesjj.liao@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Fan Chen <fan.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

For some power domains like vpu_core on MT8183 whose sram need to
do clock and internal isolation while power on/off sram.
We add a flag "sram_iso_ctrl" in scp_domain_data to judge if we
need to do the extra sram isolation control or not.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-scpsys.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index 9f06f17..e010fb3 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -56,6 +56,8 @@
 #define PWR_ON_BIT			BIT(2)
 #define PWR_ON_2ND_BIT			BIT(3)
 #define PWR_CLK_DIS_BIT			BIT(4)
+#define PWR_SRAM_CLKISO_BIT		BIT(5)
+#define PWR_SRAM_ISOINT_B_BIT		BIT(6)
 
 #define PWR_STATUS_CONN			BIT(1)
 #define PWR_STATUS_DISP			BIT(3)
@@ -86,6 +88,8 @@
  * @name: The domain name.
  * @sta_mask: The mask for power on/off status bit.
  * @ctl_offs: The offset for main power control register.
+ * @sram_iso_ctrl: The flag to judge if the power domain need to do
+ *                 the extra sram isolation control.
  * @sram_pdn_bits: The mask for sram power control bits.
  * @sram_pdn_ack_bits: The mask for sram power control acked bits.
  * @basic_clk_name: The basic clocks required by this power domain.
@@ -98,6 +102,7 @@ struct scp_domain_data {
 	const char *name;
 	u32 sta_mask;
 	int ctl_offs;
+	bool sram_iso_ctrl;
 	u32 sram_pdn_bits;
 	u32 sram_pdn_ack_bits;
 	const char *basic_clk_name[MAX_CLKS];
@@ -233,6 +238,14 @@ static int scpsys_sram_enable(struct scp_domain *scpd, void __iomem *ctl_addr)
 			return ret;
 	}
 
+	if (scpd->data->sram_iso_ctrl)	{
+		val = readl(ctl_addr) | PWR_SRAM_ISOINT_B_BIT;
+		writel(val, ctl_addr);
+		udelay(1);
+		val &= ~PWR_SRAM_CLKISO_BIT;
+		writel(val, ctl_addr);
+	}
+
 	return 0;
 }
 
@@ -242,8 +255,15 @@ static int scpsys_sram_disable(struct scp_domain *scpd, void __iomem *ctl_addr)
 	u32 pdn_ack = scpd->data->sram_pdn_ack_bits;
 	int tmp;
 
-	val = readl(ctl_addr);
-	val |= scpd->data->sram_pdn_bits;
+	if (scpd->data->sram_iso_ctrl)	{
+		val = readl(ctl_addr) | PWR_SRAM_CLKISO_BIT;
+		writel(val, ctl_addr);
+		val &= ~PWR_SRAM_ISOINT_B_BIT;
+		writel(val, ctl_addr);
+		udelay(1);
+	}
+
+	val = readl(ctl_addr) | scpd->data->sram_pdn_bits;
 	writel(val, ctl_addr);
 
 	/* Either wait until SRAM_PDN_ACK all 1 or 0 */
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
