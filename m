Return-Path: <SRS0=PvK4=BS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4555FC433E0
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Aug 2020 12:50:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 123BC206E2
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Aug 2020 12:50:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Iv3s1dOf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="PE0cKnHy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 123BC206E2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d/sRpDonyCKfuEezMIwiCscXV+DeazyN7DPxJKNiVKw=; b=Iv3s1dOftLenVpznuJRtneUGIF
	7kO1Fxx/bbWOaLlxJu5QjEmXYxUo1zeczqMxNlzPSHJXKGOe5xYXUpCtZl9d8YSD0bGx4QZLFlJpg
	N/7vu7m43lvMqamgp0McXu4Wpphby6alkvAXdoXdhv7tVi/Ze36qxfJEfT3Ulkaf2me4Mju1WUqW0
	o2gx1I2tnIZiHU4zl4YBCW4kVHFmtabucAjHLST1m70vrNiPTh9ZGsGOgTysp8Z5Xkl07BaC8/JcE
	XTk0prhoC0ltKK6dK5biX6h7Q9VKtVj6CzhMHejOrwxg2rF8lDAGF5b08mHF0mYAuMxOoxAwz/YYK
	UDpFiXbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k4OIw-0007Oj-TH; Sat, 08 Aug 2020 12:50:30 +0000
Received: from mxwww.masterlogin.de ([95.129.51.220])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k4OIs-0007Nw-6f; Sat, 08 Aug 2020 12:50:27 +0000
Received: from mxout1.routing.net (unknown [192.168.10.81])
 by forward.mxwww.masterlogin.de (Postfix) with ESMTPS id A7D9596281;
 Sat,  8 Aug 2020 12:50:19 +0000 (UTC)
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
 by mxout1.routing.net (Postfix) with ESMTP id 725683FEAF;
 Sat,  8 Aug 2020 12:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1596891019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Wj2UayRDflcnw5kUmZA37cOx3/QYiW/w9iZEs90Vdzw=;
 b=PE0cKnHyhUjOHIKjyvMjunDc16plM449cKob0oqnP5TFPVjNbqPmHxAN3F+kLXiGV8uZnf
 W0I5cMu7yoZkdufBKMuprfRu+s89EWgUenGcDqVljGo5+oPZqFrEm5w8MK/LP9dvZRk44S
 RoLgsP5qDSGitsksqA0Nl9vipEs29/M=
Received: from localhost.localdomain (fttx-pool-217.61.152.39.bambit.de
 [217.61.152.39])
 by mxbox4.masterlogin.de (Postfix) with ESMTPSA id D25358018E;
 Sat,  8 Aug 2020 12:50:18 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH] usb: xhci-mtk: Fix typo
Date: Sat,  8 Aug 2020 14:49:06 +0200
Message-Id: <20200808124906.89976-1-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200808_085026_728654_B4B60086 
X-CRM114-Status: GOOD (  13.51  )
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
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

fix this small typo u3_ports_disabed => u3_ports_disabled

Fixes: 55ba6e9e25a6 (usb: xhci-mtk: support option to disable usb3 ports)
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/usb/host/xhci-mtk.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 4311d4c9b68d..8f321f39ab96 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -77,7 +77,7 @@ static int xhci_mtk_host_enable(struct xhci_hcd_mtk *mtk)
 {
 	struct mu3c_ippc_regs __iomem *ippc = mtk->ippc_regs;
 	u32 value, check_val;
-	int u3_ports_disabed = 0;
+	int u3_ports_disabled = 0;
 	int ret;
 	int i;
 
@@ -92,7 +92,7 @@ static int xhci_mtk_host_enable(struct xhci_hcd_mtk *mtk)
 	/* power on and enable u3 ports except skipped ones */
 	for (i = 0; i < mtk->num_u3_ports; i++) {
 		if ((0x1 << i) & mtk->u3p_dis_msk) {
-			u3_ports_disabed++;
+			u3_ports_disabled++;
 			continue;
 		}
 
@@ -117,7 +117,7 @@ static int xhci_mtk_host_enable(struct xhci_hcd_mtk *mtk)
 	check_val = STS1_SYSPLL_STABLE | STS1_REF_RST |
 			STS1_SYS125_RST | STS1_XHCI_RST;
 
-	if (mtk->num_u3_ports > u3_ports_disabed)
+	if (mtk->num_u3_ports > u3_ports_disabled)
 		check_val |= STS1_U3_MAC_RST;
 
 	ret = readl_poll_timeout(&ippc->ip_pw_sts1, value,
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
