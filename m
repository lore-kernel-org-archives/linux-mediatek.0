Return-Path: <SRS0=DQN7=ID=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CE2CC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 09:05:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC57164F52
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 09:05:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC57164F52
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LxqKPiE60JeLjk6A9kyLl4dyNMxoR4SC2Fc2FZ8DuBk=; b=qggG0PRxj1lLd4wbWELghWPDe
	MrtP08GN6fGiZ8UF/4J45dTyFon7cPepNH5p+g1s9gf8J66DjMbHlWCgun5Wi7bpzGilXBPOtr5TF
	v1KJW0eP/h7ldBPaKYjkJw+mEn0PWLKEbQWj7rcyObJE0+ykHg5NqW+S3kUY+Ws7zWbOrSAQ+t/Fj
	BQThZnPX7GYcEkhv3CP9SXDdBs4+w8YGlWthIsN9oJUWUBVhgwDkpTCYa/45PPjvsJF7XlwjKWcHm
	5GrSKeu1jixfTVff8xB/IWrLJupIc6Ml1nqL7k/3w78ah0/nn1ZGPWXfTCYIPlWVcIlq6KfRSuayr
	dPAWiB78A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lI6OJ-00E988-73; Fri, 05 Mar 2021 09:04:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lI6N0-00E8SN-OX; Fri, 05 Mar 2021 09:03:41 +0000
X-UUID: 247229cdc6104049bc7af3404322896e-20210305
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=XAbfxInO9WZWywPSca77qm+xs9IaDMqc461X1BUIIGc=; 
 b=Ig3TrxuEFHNM0oX4gPSB3+boXCmiHFQZsX+oVPbUJspY40e6kwV/xTu0F6v41WsKmEvd0B2kWm1lwXuFpuNDhuUL04KgcG4Yh8TWwoZeDe1/hkjHuobTmEJD1tneRZLJBVi1UK5iYJJeohobKoRH4H+3iBT6zt3RLtdiHfbhRrs=;
X-UUID: 247229cdc6104049bc7af3404322896e-20210305
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 15834713; Fri, 05 Mar 2021 01:03:27 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Mar 2021 01:03:26 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Mar 2021 17:03:24 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Mar 2021 17:03:23 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Ikjoon Jang <ikjn@chromium.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH 13/17] usb: xhci-mtk: add some schedule error number
Date: Fri, 5 Mar 2021 17:02:51 +0800
Message-ID: <1614934975-15188-13-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1614934975-15188-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1614934975-15188-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0D830F8F09A60B82A58BC7E99A37A9D0A888F6BAFB3ED3632F38FC2BE88F6B312000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_090339_400038_045F3DCB 
X-CRM114-Status: GOOD (  16.29  )
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

This is used to provide more information about which case
causes bandwidth schedule failure.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk-sch.c | 44 ++++++++++++++++++++++++++-------
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index d39545ade9a1..deb918490b71 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -25,6 +25,13 @@
  */
 #define TT_MICROFRAMES_MAX 9
 
+/* schedule error type */
+#define ESCH_SS_Y6		1001
+#define ESCH_SS_OVERLAP		1002
+#define ESCH_CS_OVERFLOW	1003
+#define ESCH_BW_OVERFLOW	1004
+#define ESCH_FIXME		1005
+
 /* mtk scheduler bitmasks */
 #define EP_BPKTS(p)	((p) & 0x7f)
 #define EP_BCSCOUNT(p)	(((p) & 0x7) << 8)
@@ -32,6 +39,24 @@
 #define EP_BOFFSET(p)	((p) & 0x3fff)
 #define EP_BREPEAT(p)	(((p) & 0x7fff) << 16)
 
+static char *sch_error_string(int err_num)
+{
+	switch (err_num) {
+	case ESCH_SS_Y6:
+		return "Can't schedule Start-Split in Y6";
+	case ESCH_SS_OVERLAP:
+		return "Can't find a suitable Start-Split location";
+	case ESCH_CS_OVERFLOW:
+		return "The last Complete-Split is greater than 7";
+	case ESCH_BW_OVERFLOW:
+		return "Bandwidth exceeds the maximum limit";
+	case ESCH_FIXME:
+		return "FIXME, to be resolved";
+	default:
+		return "Unknown";
+	}
+}
+
 static int is_fs_or_ls(enum usb_device_speed speed)
 {
 	return speed == USB_SPEED_FULL || speed == USB_SPEED_LOW;
@@ -412,7 +437,7 @@ static int check_fs_bus_bw(struct mu3h_sch_ep_info *sch_ep, int offset)
 		for (j = 0; j < sch_ep->cs_count; j++) {
 			tmp = tt->fs_bus_bw[base + j] + sch_ep->bw_cost_per_microframe;
 			if (tmp > FS_PAYLOAD_MAX)
-				return -ERANGE;
+				return -ESCH_BW_OVERFLOW;
 		}
 	}
 
@@ -437,11 +462,11 @@ static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
 		 * must never schedule Start-Split in Y6
 		 */
 		if (!(start_ss == 7 || last_ss < 6))
-			return -ERANGE;
+			return -ESCH_SS_Y6;
 
 		for (i = 0; i < sch_ep->cs_count; i++)
 			if (test_bit(offset + i, tt->ss_bit_map))
-				return -ERANGE;
+				return -ESCH_SS_OVERLAP;
 
 	} else {
 		u32 cs_count = DIV_ROUND_UP(sch_ep->maxpkt, FS_PAYLOAD_MAX);
@@ -451,14 +476,14 @@ static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
 		 * must never schedule Start-Split in Y6
 		 */
 		if (start_ss == 6)
-			return -ERANGE;
+			return -ESCH_SS_Y6;
 
 		/* one uframe for ss + one uframe for idle */
 		start_cs = (start_ss + 2) % 8;
 		last_cs = start_cs + cs_count - 1;
 
 		if (last_cs > 7)
-			return -ERANGE;
+			return -ESCH_CS_OVERFLOW;
 
 		if (sch_ep->ep_type == ISOC_IN_EP)
 			extra_cs_count = (last_cs == 7) ? 1 : 2;
@@ -470,7 +495,7 @@ static int check_sch_tt(struct mu3h_sch_ep_info *sch_ep, u32 offset)
 			cs_count = 7; /* HW limit */
 
 		if (test_bit(offset, tt->ss_bit_map))
-			return -ERANGE;
+			return -ESCH_SS_OVERLAP;
 
 		sch_ep->cs_count = cs_count;
 		/* one for ss, the other for idle */
@@ -562,7 +587,7 @@ static int check_sch_bw(struct mu3h_sch_bw_info *sch_bw,
 	u32 esit_boundary;
 	u32 min_num_budget;
 	u32 min_cs_count;
-	int ret;
+	int ret = 0;
 
 	/*
 	 * Search through all possible schedule microframes.
@@ -597,7 +622,7 @@ static int check_sch_bw(struct mu3h_sch_bw_info *sch_bw,
 	bw_boundary = get_bw_boundary(sch_ep->speed);
 	/* check bandwidth */
 	if (min_bw > bw_boundary)
-		return -ERANGE;
+		return ret ? ret : -ESCH_BW_OVERFLOW;
 
 	sch_ep->offset = min_index;
 	sch_ep->cs_count = min_cs_count;
@@ -765,7 +790,8 @@ int xhci_mtk_check_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
 
 		ret = check_sch_bw(sch_bw, sch_ep);
 		if (ret) {
-			xhci_err(xhci, "Not enough bandwidth!\n");
+			xhci_err(xhci, "Not enough bandwidth! (%s)\n",
+				 sch_error_string(-ret));
 			return -ENOSPC;
 		}
 	}
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
