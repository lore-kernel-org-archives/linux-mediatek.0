Return-Path: <SRS0=DQN7=ID=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38F79C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 09:15:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3DC164F53
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 09:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3DC164F53
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8bNPPQl+UjePuL3z4sRe7nVP34XQJv3Jl2LGVb0Kebs=; b=YBgnOfMUDIMDKW36wFXYGrt4f
	5wi6h+NBjsLPC9FT4inYHowT8tfTdKSYCcTukE+rvTQtHrCHPzcrd5cm7T0sB8tGeDEL4ZA8tK84I
	Q+uMTA+xiDYDahjAAdEoDSaX3BNCPXgJMjm3AzSKV3JaJduFWc/9fmDhobxYuGr+jCQSe/9E2ujGe
	CVf796iazzRt32aOeGo0Uvku0para6Sl3S1pPSK1NhHdsaiYomjsyYjZfoPbz0ad5zDAMOgfLCe6Y
	x1D1DcMAcIP5C80GNVG0qWv4AQ9H9Qr5yn5a8Ta6KAVzyFcF7VgTw/6QNsU0SxKJ/xIblnXiViBmx
	xrdgrvJKQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lI6Xs-00ECP4-60; Fri, 05 Mar 2021 09:14:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lI6Wd-00EBgM-UP; Fri, 05 Mar 2021 09:13:38 +0000
X-UUID: c4338604485949048a6b12d431c216ed-20210305
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=4v1ZbxDHTq9swsdYQT85tC38Zg1OuMdlNMexREEsUjo=; 
 b=jR3A7Xogs9LIrsLLXAchl4AEVDKILTeN6m2CP3HY90DOayogbgRNeCDvzkhvCma6QwVT5+idp9tIwPMewoQhfFmaRxLJ7PPHxd4Dg30/tG0FIRGMZERdR4U2CYyfhq2B6sIQLbI8bQ7PTdxYSnXsLWlnTauQ0/3+uHGZLUq2W3k=;
X-UUID: c4338604485949048a6b12d431c216ed-20210305
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1003347094; Fri, 05 Mar 2021 01:13:30 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Mar 2021 01:03:28 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Mar 2021 17:03:27 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Mar 2021 17:03:26 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Ikjoon Jang <ikjn@chromium.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH 17/17] usb: xhci-mtk: print debug info of endpoint interval
Date: Fri, 5 Mar 2021 17:02:55 +0800
Message-ID: <1614934975-15188-17-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1614934975-15188-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1614934975-15188-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_091336_450223_1CC38243 
X-CRM114-Status: GOOD (  12.04  )
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

Print bInterval and convert it into the time expressed in
us or ms unit, this is the key info when allocate bandwidth
failed.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk-sch.c | 37 ++++++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index 4f6b86131820..03da55bc7f9b 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -25,6 +25,8 @@
  */
 #define TT_MICROFRAMES_MAX 9
 
+#define DBG_BUF_EN	64
+
 /* schedule error type */
 #define ESCH_SS_Y6		1001
 #define ESCH_SS_OVERLAP		1002
@@ -62,6 +64,31 @@ static int is_fs_or_ls(enum usb_device_speed speed)
 	return speed == USB_SPEED_FULL || speed == USB_SPEED_LOW;
 }
 
+static const char *
+decode_ep(struct usb_host_endpoint *ep, enum usb_device_speed speed)
+{
+	static char buf[DBG_BUF_EN];
+	struct usb_endpoint_descriptor *epd = &ep->desc;
+	unsigned int interval;
+	const char *unit;
+
+	interval = usb_decode_interval(epd, speed);
+	if (interval % 1000) {
+		unit = "us";
+	} else {
+		unit = "ms";
+		interval /= 1000;
+	}
+
+	snprintf(buf, DBG_BUF_EN, "%s ep%d%s %s, mpkt:%d, interval:%d/%d%s\n",
+		 usb_speed_string(speed), usb_endpoint_num(epd),
+		 usb_endpoint_dir_in(epd) ? "in" : "out",
+		 usb_ep_type_string(usb_endpoint_type(epd)),
+		 usb_endpoint_maxp(epd), epd->bInterval, interval, unit);
+
+	return buf;
+}
+
 static u32 get_bw_boundary(enum usb_device_speed speed)
 {
 	u32 boundary;
@@ -711,10 +738,7 @@ static int add_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 	ep_index = xhci_get_endpoint_index(&ep->desc);
 	ep_ctx = xhci_get_ep_ctx(xhci, virt_dev->in_ctx, ep_index);
 
-	xhci_dbg(xhci, "%s() type:%d, speed:%d, mpkt:%d, dir:%d, ep:%p\n",
-		__func__, usb_endpoint_type(&ep->desc), udev->speed,
-		usb_endpoint_maxp(&ep->desc),
-		usb_endpoint_dir_in(&ep->desc), ep);
+	xhci_dbg(xhci, "%s %s\n", __func__, decode_ep(ep, udev->speed));
 
 	if (!need_bw_sch(ep, udev->speed, !!virt_dev->tt_info)) {
 		/*
@@ -750,10 +774,7 @@ static void drop_ep_quirk(struct usb_hcd *hcd, struct usb_device *udev,
 
 	virt_dev = xhci->devs[udev->slot_id];
 
-	xhci_dbg(xhci, "%s() type:%d, speed:%d, mpks:%d, dir:%d, ep:%p\n",
-		__func__, usb_endpoint_type(&ep->desc), udev->speed,
-		usb_endpoint_maxp(&ep->desc),
-		usb_endpoint_dir_in(&ep->desc), ep);
+	xhci_dbg(xhci, "%s %s\n", __func__, decode_ep(ep, udev->speed));
 
 	if (!need_bw_sch(ep, udev->speed, !!virt_dev->tt_info))
 		return;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
