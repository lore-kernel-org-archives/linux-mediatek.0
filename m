Return-Path: <SRS0=vtlS=EI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 429BAC388F9
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2020 07:29:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E12772223C
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2020 07:29:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R43p+X4s";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nu+upCVj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E12772223C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dcq90Uj38ABZ1aiOjTncu1Mhzej4JHzs3+mX21PGw9Q=; b=R43p+X4s2QVzUcPHVVxVirtwe
	t4lirHTi4+iwJ0VGaWHUqubLbZ05uGeRNN6Y8bpMDSnV0zt3HKGSb94gdB9aLy/vjm1uTprJUd0as
	8THNWQr0oPJJr5QTAfULrqQDHzU7febDhDZUYcY7q7MrY4sGFZScVGvJYPokDstY0HRJpmhstmv6u
	75gio0RdqNnTMfkq87/wGR5wcmGQrQuS2QcAN1RXbRGdn91U/kQ9LbNWk5ORSCiNMk0mS/01lQ+lN
	kVVYsnl7YZACpNPWxtP+pQQRGa5rm6bng/Q+PuDdsQpszWvHksKNrBnQi/pINjxaYbC5E6kyDLw/y
	DBwycckGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZUHI-0006xa-Hn; Mon, 02 Nov 2020 07:29:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZUH9-0006vT-2j; Mon, 02 Nov 2020 07:29:12 +0000
X-UUID: 3768573719884031af51396bdc5b3a52-20201101
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=EwMAk6C90zx3ggLjTVwBgHjheE+if1MCBTaw2ieul20=; 
 b=nu+upCVjds1Cak5WzFXnaNZZ4SGOkexCPn0TFEszSMJ+Aq7MwHH27WfjLbdy07NKhmo4oNvwFjL+r4SqAeO9JdW8yGrmzAYQ24VtLgQ7W4QrLxKC7VBQj+Tr4DSe2Gds3VqhwFkacmRADwD48fC/UId0/RncII+ins3G0XTzFx4=;
X-UUID: 3768573719884031af51396bdc5b3a52-20201101
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 122083116; Sun, 01 Nov 2020 23:29:05 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 1 Nov 2020 23:19:02 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 2 Nov 2020 15:19:01 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 2 Nov 2020 15:19:01 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Mathias
 Nyman" <mathias.nyman@intel.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] usb: host: XHCI: xhci-mtk.c: support mediatek,
 keep-clock-on
Date: Mon, 2 Nov 2020 15:18:49 +0800
Message-ID: <1604301530-31546-2-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1604301530-31546-1-git-send-email-macpaul.lin@mediatek.com>
References: <1604301530-31546-1-git-send-email-macpaul.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_022911_374773_282C3B49 
X-CRM114-Status: GOOD (  16.27  )
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
Cc: Macpaul Lin <macpaul@gmail.com>, Eddie Hung <eddie.hung@mediatek.com>,
 Ainge Hsu <ainge.hsu@mediatek.com>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some platform dose not support turn off clock when system suspending.
We add an option "mediatek,keep-clock-on" for distinquish these platforms.
When "mediatek,keep-clock-on" has been set, xhci-mtk driver will skip
turning clock on and off during system suspend and resume.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 drivers/usb/host/xhci-mtk.c |    9 +++++++--
 drivers/usb/host/xhci-mtk.h |    1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 4311d4c..c6c2804 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -464,6 +464,9 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 	of_property_read_u32(node, "mediatek,u3p-dis-msk",
 			     &mtk->u3p_dis_msk);
 
+	/* keep clock on when suspending on some platform */
+	mtk->keep_clk_on = of_property_read_bool(node, "mediatek,keep-clock-on");
+
 	ret = usb_wakeup_of_property_parse(mtk, node);
 	if (ret) {
 		dev_err(dev, "failed to parse uwk property\n");
@@ -624,7 +627,8 @@ static int __maybe_unused xhci_mtk_suspend(struct device *dev)
 	del_timer_sync(&xhci->shared_hcd->rh_timer);
 
 	xhci_mtk_host_disable(mtk);
-	xhci_mtk_clks_disable(mtk);
+	if (!mtk->keep_clk_on)
+		xhci_mtk_clks_disable(mtk);
 	usb_wakeup_set(mtk, true);
 	return 0;
 }
@@ -636,7 +640,8 @@ static int __maybe_unused xhci_mtk_resume(struct device *dev)
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
 
 	usb_wakeup_set(mtk, false);
-	xhci_mtk_clks_enable(mtk);
+	if (!mtk->keep_clk_on)
+		xhci_mtk_clks_enable(mtk);
 	xhci_mtk_host_enable(mtk);
 
 	xhci_dbg(xhci, "%s: restart port polling\n", __func__);
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index a93cfe8..37639c5 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -152,6 +152,7 @@ struct xhci_hcd_mtk {
 	struct regmap *uwk;
 	u32 uwk_reg_base;
 	u32 uwk_vers;
+	bool keep_clk_on;
 };
 
 static inline struct xhci_hcd_mtk *hcd_to_mtk(struct usb_hcd *hcd)
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
