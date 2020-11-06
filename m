Return-Path: <SRS0=NSCp=EM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F08D8C5517A
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 09:46:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 342A320825
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 09:46:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bCOI+MFb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YHdNex5N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 342A320825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=adYjAWZYzjkPSd3sGKuVJWXpP3KptN/ANJa3dZna1yI=; b=bCOI+MFbWacvl/kGaHWhOQunB
	LLiNhNHcf/zMhs/68YpDfsmeuNBEk+H2AQdSFCCq6ThHUqCVODv/xlgGy5Dcy7pXAp4ym3gbaZhTX
	/CU/nNihB4rDbWHwRuPHSXpbFdhwo2Ag1VHV6xWBBto9wW/36p/QJkTM3FxCzSa2xwwQTQLggA8Ci
	U8P1//CubscSD38TMtJS2o2wpNO+LFqbcQRISmywC0HteE/0pOCOF3cQwCiynMkMEqNHKoyQmm/SB
	j+DOK+W94mthG/u6zGy7Nz2AoQxr2l2hDcYPvUieUxOAmoP2IDzHqhwmwiBvkZwXs4GPRbIb6artj
	7QdOodHnw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kayKE-0005fp-9R; Fri, 06 Nov 2020 09:46:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kayKB-0005eQ-65; Fri, 06 Nov 2020 09:46:28 +0000
X-UUID: 748b3209b36340c8ac32750e33c09118-20201106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=JLMjlxdQ+Z3IqZg0YF6HxtlU5irzOHZAHkWTRRiog7Q=; 
 b=YHdNex5N2VwSYDbAOCqRkSrms/ghyWcNqmkW352plOb3MZ7GWzDZ1UbHHB+X0nBiPoiaWVGNG2/8WCpNDNMrZASqz667MLRM+uOuky1Pg6T5DG1gJRCbpqmqzPYSQnHLhDwsYj0nAQiN07h+3BL77gXnqZbS7HyF+oZ9Rld+C+U=;
X-UUID: 748b3209b36340c8ac32750e33c09118-20201106
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1915446009; Fri, 06 Nov 2020 01:46:24 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 Nov 2020 01:46:22 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 Nov 2020 17:46:20 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 6 Nov 2020 17:46:20 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>
Subject: [PATCH v2 2/2] usb: host: XHCI: xhci-mtk.c: support mediatek,
 str-clock-on
Date: Fri, 6 Nov 2020 17:46:05 +0800
Message-ID: <1604655965-22418-2-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1604655965-22418-1-git-send-email-macpaul.lin@mediatek.com>
References: <1604301530-31546-1-git-send-email-macpaul.lin@mediatek.com>
 <1604655965-22418-1-git-send-email-macpaul.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_044627_421852_693FFACD 
X-CRM114-Status: GOOD (  16.56  )
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
Cc: linux-usb@vger.kernel.org,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Eddie Hung <eddie.hung@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Macpaul Lin <macpaul@gmail.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Ainge Hsu <ainge.hsu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some platform dose not support turn off clock when system suspending.
We add an option "mediatek,str-clock-on" for distinquish these platforms.
When "mediatek,str-clock-on" has been set, xhci-mtk driver will skip
turning clock on and off during system suspend and resume.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
Changes for v2:
  - Replace "mediatek,keep-clock-on" to "mediatek,str-clock-on" which implies
    this option related to STR functions.

 drivers/usb/host/xhci-mtk.c |    9 +++++++--
 drivers/usb/host/xhci-mtk.h |    1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 4311d4c..77b0d7a 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -464,6 +464,9 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 	of_property_read_u32(node, "mediatek,u3p-dis-msk",
 			     &mtk->u3p_dis_msk);
 
+	/* STR: keep clock on when suspending on some platform */
+	mtk->str_clk_on = of_property_read_bool(node, "mediatek,str-clock-on");
+
 	ret = usb_wakeup_of_property_parse(mtk, node);
 	if (ret) {
 		dev_err(dev, "failed to parse uwk property\n");
@@ -624,7 +627,8 @@ static int __maybe_unused xhci_mtk_suspend(struct device *dev)
 	del_timer_sync(&xhci->shared_hcd->rh_timer);
 
 	xhci_mtk_host_disable(mtk);
-	xhci_mtk_clks_disable(mtk);
+	if (!mtk->str_clk_on)
+		xhci_mtk_clks_disable(mtk);
 	usb_wakeup_set(mtk, true);
 	return 0;
 }
@@ -636,7 +640,8 @@ static int __maybe_unused xhci_mtk_resume(struct device *dev)
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 
 	usb_wakeup_set(mtk, false);
-	xhci_mtk_clks_enable(mtk);
+	if (!mtk->str_clk_on)
+		xhci_mtk_clks_enable(mtk);
 	xhci_mtk_host_enable(mtk);
 
 	xhci_dbg(xhci, "%s: restart port polling\n", __func__);
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index a93cfe8..4039b025 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -152,6 +152,7 @@ struct xhci_hcd_mtk {
 	struct regmap *uwk;
 	u32 uwk_reg_base;
 	u32 uwk_vers;
+	bool str_clk_on;
 };
 
 static inline struct xhci_hcd_mtk *hcd_to_mtk(struct usb_hcd *hcd)
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
