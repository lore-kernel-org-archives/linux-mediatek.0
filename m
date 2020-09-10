Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3509C43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 17:30:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 466D321582
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 17:30:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rnXVYVFY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 466D321582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q/mFUmsIHjETjBYLkIQXduhqlapiulUCZm9tuFQjulQ=; b=rnXVYVFYekG2rVKaTS1s8Y8xc
	102/n5+Aj9Gy8HGwYLFOBNytdzf7eUD3TSf35UiWxBZdpRcsxcLq36pi0dotNhDpidmwVlYLm+sa6
	wQr8xhiT5utZ2sSyt+0J6Q7CKPZAcbGDjnVoRw1qSsktpAgqwHkk7tH0iiheKPvzsX3BOAo8aWLOw
	zTAKvlS/LMWtG7nSIhjxRI/sG/7PyZQmlgQRFZgNtfw5fVX1c1NJd/n+rPhFLq6mGoS3bSF1zY9qk
	yooKT0XZ0gJPCiy79gsMhPnAj1sygp9XdP7Pjf5hJrFg20OLC/qprS5ZfHyPjGQdxZzDjhLmMHWqg
	GpnbWxhww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGQOo-000508-DI; Thu, 10 Sep 2020 17:30:18 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGQNK-0004CZ-At; Thu, 10 Sep 2020 17:28:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id EAFBD29BB1A
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 07/12] soc: mediatek: pm-domains: Add extra sram control
Date: Thu, 10 Sep 2020 19:28:21 +0200
Message-Id: <20200910172826.3074357-8-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200910172826.3074357-1-enric.balletbo@collabora.com>
References: <20200910172826.3074357-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_132846_488570_3E6DEE1C 
X-CRM114-Status: GOOD (  11.98  )
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

 drivers/soc/mediatek/mtk-pm-domains.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index 3aa430a60602..0802eccc3a0b 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -21,6 +21,7 @@
 
 #define MTK_SCPD_ACTIVE_WAKEUP		BIT(0)
 #define MTK_SCPD_FWAIT_SRAM		BIT(1)
+#define MTK_SCPD_SRAM_ISO		BIT(2)
 #define MTK_SCPD_CAPS(_scpd, _x)	((_scpd)->data->caps & (_x))
 
 #define SPM_VDE_PWR_CON			0x0210
@@ -42,6 +43,8 @@
 #define PWR_ON_BIT			BIT(2)
 #define PWR_ON_2ND_BIT			BIT(3)
 #define PWR_CLK_DIS_BIT			BIT(4)
+#define PWR_SRAM_CLKISO_BIT		BIT(5)
+#define PWR_SRAM_ISOINT_B_BIT		BIT(6)
 
 #define PWR_STATUS_DISP			BIT(3)
 #define PWR_STATUS_MFG			BIT(4)
@@ -162,6 +165,14 @@ static int scpsys_sram_enable(struct scpsys_domain *pd, void __iomem *ctl_addr)
 	if (ret < 0)
 		return ret;
 
+	if (MTK_SCPD_CAPS(pd, MTK_SCPD_SRAM_ISO))	{
+		val = readl(ctl_addr) | PWR_SRAM_ISOINT_B_BIT;
+		writel(val, ctl_addr);
+		udelay(1);
+		val &= ~PWR_SRAM_CLKISO_BIT;
+		writel(val, ctl_addr);
+	}
+
 	return 0;
 }
 
@@ -171,8 +182,15 @@ static int scpsys_sram_disable(struct scpsys_domain *pd, void __iomem *ctl_addr)
 	u32 val;
 	int tmp;
 
-	val = readl(ctl_addr);
-	val |= pd->data->sram_pdn_bits;
+	if (MTK_SCPD_CAPS(pd, MTK_SCPD_SRAM_ISO))	{
+		val = readl(ctl_addr) | PWR_SRAM_CLKISO_BIT;
+		writel(val, ctl_addr);
+		val &= ~PWR_SRAM_ISOINT_B_BIT;
+		writel(val, ctl_addr);
+		udelay(1);
+	}
+
+	val = readl(ctl_addr) | pd->data->sram_pdn_bits;
 	writel(val, ctl_addr);
 
 	/* Either wait until SRAM_PDN_ACK all 1 or 0 */
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
