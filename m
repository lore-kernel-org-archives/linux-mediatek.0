Return-Path: <SRS0=it3p=NO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 871D7C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 12:54:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50847613A8
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 12:54:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 50847613A8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=43SxUNiFDr5NVKXsEMob1k4Zvh0pHRdeJJ6uWembJ3s=; b=bM08Gziiq1nHzY
	fy5WDRDLQUEP7GxKFYH0RXb+9XyQ5ZP1dXYCWJmkfTKlAhZ2Fr3mmO2uzOU8T1H9fDGw7R0+BgnvE
	RFD1sPKlnP1Q0f3hjnk/JKKNjqB01iXkOuevI6h7aXcjieugYYynW2UOsbbJ8hIcJpDCZKiQdUVlD
	sWjMfHxgV1Uga4pOyzFzswCS4fwUgH14agGTfqImctWVYo4f0YMbWL91JotvFfq22XcYCd8S+jLbe
	DsRDYOvKiNlkLytYigZRL4VEHskPnNg/Jlv4wwaTQnDfu4TL1+gBJBQagbVp9ei1BujLU0cl1iINi
	UCw4y5281oMmQBOGam2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI9TD-00Gr7D-KO; Mon, 23 Aug 2021 12:54:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI9T8-00Gr4Q-1b
 for linux-mediatek@lists.infradead.org; Mon, 23 Aug 2021 12:54:27 +0000
X-UUID: f69d5a094ddc401fba917330a6caec7b-20210823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=oEUgnS9mnRnKJfa6LopmzijfldwbPx+Y5+GUtnw+T4I=; 
 b=ehmPyMiNF6CBeSD//1rOJqKVW/UUwu9Wyxxm9vHPiFfUI9ElkbVukDvk7toxTdT8vGojIhGe6NIr2hH64o3//Wp8H06lANC7iAnB3z6UUXt/8NUM89btRdSg3FJREq7sp/u9hkB7QrFATgPSIlgD7cxZMOzfJscnpayQ3OcdpKo=;
X-UUID: f69d5a094ddc401fba917330a6caec7b-20210823
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1822518614; Mon, 23 Aug 2021 05:54:23 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 Aug 2021 05:54:21 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 23 Aug 2021 20:54:07 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 23 Aug 2021 20:54:07 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Ikjoon Jang <ikjn@chromium.org>
CC: Yaqii wu <yaqii.wu@mediatek.com>, <srv_wsdupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>
Subject: [RFC PATCH 6/6] usb: xhci-mtk: Add support drop extra CS
Date: Mon, 23 Aug 2021 20:53:56 +0800
Message-ID: <1629723236-10768-6-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1629723236-10768-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1629723236-10768-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_055426_147131_A812FBB5 
X-CRM114-Status: GOOD (  15.01  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Support option to drop extra CS for FS isoc/intr whith TT.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk-sch.c | 17 ++++++++++-------
 drivers/usb/host/xhci-mtk.c     |  1 +
 drivers/usb/host/xhci-mtk.h     |  2 ++
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index 134f4789bd89..e5e9d930981f 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -280,6 +280,7 @@ create_sch_ep(struct xhci_hcd_mtk *mtk, struct usb_device *udev,
 	sch_ep->sch_tt = tt;
 	sch_ep->ep = ep;
 	sch_ep->speed = udev->speed;
+	sch_ep->no_extra_cs = mtk->no_extra_cs;
 	INIT_LIST_HEAD(&sch_ep->endpoint);
 	INIT_LIST_HEAD(&sch_ep->tt_endpoint);
 	INIT_HLIST_NODE(&sch_ep->hentry);
@@ -512,14 +513,16 @@ static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
 		if (last_cs > 7)
 			return -ESCH_CS_OVERFLOW;
 
-		if (sch_ep->ep_type == ISOC_IN_EP)
-			extra_cs_count = (last_cs == 7) ? 1 : 2;
-		else /*  ep_type : INTR IN / INTR OUT */
-			extra_cs_count = 1;
+		if (!sch_ep->no_extra_cs) {
+			if (sch_ep->ep_type == ISOC_IN_EP)
+				extra_cs_count = (last_cs == 7) ? 1 : 2;
+			else /*  ep_type : INTR IN / INTR OUT */
+				extra_cs_count = 1;
 
-		cs_count += extra_cs_count;
-		if (cs_count > 7)
-			cs_count = 7; /* HW limit */
+			cs_count += extra_cs_count;
+			if (cs_count > 7)
+				cs_count = 7; /* HW limit */
+		}
 
 		sch_ep->cs_count = cs_count;
 		/* one for ss, the other for idle */
diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index d66b6a8b59ba..da559d1db813 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -442,6 +442,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 
 	mtk->lpm_support = of_property_read_bool(node, "usb3-lpm-capable");
 	mtk->u2_lpm_disable = of_property_read_bool(node, "usb2-lpm-disable");
+	mtk->no_extra_cs = of_property_read_bool(node, "mediatek,no-extra-cs");
 	/* optional property, ignore the error if it does not exist */
 	of_property_read_u32(node, "mediatek,u3p-dis-msk",
 			     &mtk->u3p_dis_msk);
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index 7cc0123eada0..bd8f7f7160f6 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -98,6 +98,7 @@ struct mu3h_sch_ep_info {
 	struct usb_host_endpoint *ep;
 	enum usb_device_speed speed;
 	bool allocated;
+	bool no_extra_cs;
 	/*
 	 * mtk xHCI scheduling information put into reserved DWs
 	 * in ep context
@@ -155,6 +156,7 @@ struct xhci_hcd_mtk {
 	unsigned int has_ippc:1;
 	unsigned int lpm_support:1;
 	unsigned int u2_lpm_disable:1;
+	unsigned int no_extra_cs:1;
 	/* usb remote wakeup */
 	unsigned int uwk_en:1;
 	struct regmap *uwk;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
