Return-Path: <SRS0=DQN7=ID=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73732C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 09:14:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0896964F53
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 09:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0896964F53
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KzSAqSs7pV8DRwULAPZPDYi5FKbaPGOYLsAToZ5/BWo=; b=m5o1wu9S6/yM96pm56wghu1Yc
	wOlUqeNUPnpkA63SsH3bX0jUKsolIHkK/9sxgsLjWBh2oJh0OltXz7zqDWwrqvVzMSUWAxINykjst
	1g4D/3/8zwehiBoyRJZXcc9GRR5y4QkYiOXzoKElLNB5w3ap4v/6E0Gx0NIeuGdvRhJFfmQzNm+AS
	ahjDZ+Hh1cratYb4fL3W+O/ssR6rZVc5zCR7XRvfJIvc2jyVJnCPM+dPAggvJJjwPgcC4V4WgbKux
	65bjraYGwETPbalmoW+jZTFhsIz7mWSKuNkNu46jcgss+zqmepyMl6u8b+3J5N24sBGsdG3pxY3Hs
	St0LyKE3g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lI6XX-00EC8c-Bx; Fri, 05 Mar 2021 09:14:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lI6Wa-00EBgM-LH; Fri, 05 Mar 2021 09:13:34 +0000
X-UUID: 74c76e0eaa4942338e9b36e8b640eca5-20210305
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=uX7bogEHhh5q3JE1MPiSDdYj3lOG02dGBZf/ltMxGjs=; 
 b=tScnbGJF3I+uxbmTxuWpypZB/fnFYq4g9k6M/w8cfmExGtkGM9st2w8str8OHGMJUHK+PTAStE7KtvTgzV1GCbzKHDiJzWU3q1itdqgxYAeKEHDTZI8082CG+dpbti6l0lNJ5JVxzufpRgCyONv6dRSDNrMtUSnz9TO/N93ujMs=;
X-UUID: 74c76e0eaa4942338e9b36e8b640eca5-20210305
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 674882253; Fri, 05 Mar 2021 01:13:24 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Mar 2021 01:03:21 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Mar 2021 17:03:20 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Mar 2021 17:03:19 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Ikjoon Jang <ikjn@chromium.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH 08/17] usb: xhci-mtk: remove unnecessary members of
 mu3h_sch_tt struct
Date: Fri, 5 Mar 2021 17:02:46 +0800
Message-ID: <1614934975-15188-8-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1614934975-15188-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1614934975-15188-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8D3399C5504CE205CBB46020280DB6C89625C7887814FA2A5F39063DFFC6EC392000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_091333_289756_1BA48521 
X-CRM114-Status: GOOD (  12.18  )
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

The members @usb_tt and @tt_port in mu3h_sch_tt struct
are not used after initialization, so can be removed

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk-sch.c | 7 +------
 drivers/usb/host/xhci-mtk.h     | 4 ----
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index cb597357f134..1e8af5973a5e 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -104,7 +104,6 @@ static struct mu3h_sch_tt *find_tt(struct usb_device *udev)
 {
 	struct usb_tt *utt = udev->tt;
 	struct mu3h_sch_tt *tt, **tt_index, **ptt;
-	unsigned int port;
 	bool allocated_index = false;
 
 	if (!utt)
@@ -126,10 +125,8 @@ static struct mu3h_sch_tt *find_tt(struct usb_device *udev)
 			utt->hcpriv = tt_index;
 			allocated_index = true;
 		}
-		port = udev->ttport - 1;
-		ptt = &tt_index[port];
+		ptt = &tt_index[udev->ttport - 1];
 	} else {
-		port = 0;
 		ptt = (struct mu3h_sch_tt **) &utt->hcpriv;
 	}
 
@@ -144,8 +141,6 @@ static struct mu3h_sch_tt *find_tt(struct usb_device *udev)
 			return ERR_PTR(-ENOMEM);
 		}
 		INIT_LIST_HEAD(&tt->ep_list);
-		tt->usb_tt = utt;
-		tt->tt_port = port;
 		*ptt = tt;
 	}
 
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index f42769c69249..f61e53b02706 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -23,15 +23,11 @@
  * @ss_bit_map: used to avoid start split microframes overlay
  * @fs_bus_bw: array to keep track of bandwidth already used for FS
  * @ep_list: Endpoints using this TT
- * @usb_tt: usb TT related
- * @tt_port: TT port number
  */
 struct mu3h_sch_tt {
 	DECLARE_BITMAP(ss_bit_map, XHCI_MTK_MAX_ESIT);
 	u32 fs_bus_bw[XHCI_MTK_MAX_ESIT];
 	struct list_head ep_list;
-	struct usb_tt *usb_tt;
-	int tt_port;
 };
 
 /**
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
