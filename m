Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE93BC43461
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 05:46:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65F562192A
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 05:46:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GBmqIe5x";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Idubs2+i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65F562192A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ld3mNwCpWOBekGv83IeGtTKpTWUCh+gVs3cklPqQ1P8=; b=GBmqIe5xPNh8j+omS/zZ+iRbz5
	AFfmF8S84w8Uk98g3w60HArqSQ6nnGbNPEjNo0wJqoslxFO+lhUcYyhdhpi8UMPtwcdtgE7J8YU0y
	GFYfIfcrFT6hFLLrbRRWvpsV6B/K+rEiVb3/msyK3qIeP8roWT9KRjP5vjii4wm7/eOu6/RoiI4ux
	0RV2Hf7p3Jm0TBwqt/F8uy48YKRVJPqef/PMnnWgKQl3S2+VqTTxeVnC9xRwngFLV6wa2m9T7PM2L
	IxNbAOXDNKrizdvVyN2/GFR98JE8w4U7dfLEdrcTQlKZkVj286qOpeuCkFDvnX8E+OLusqkvUfWFN
	MGbxsy/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHhJc-0008VR-Qq; Mon, 14 Sep 2020 05:46:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHhJX-0008Ue-HO; Mon, 14 Sep 2020 05:46:09 +0000
X-UUID: 8a309f8184244f4d9b70a657fa4ac1ad-20200913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=fBVLtMBuFfeBUBqP/RzEoxUtZXT2osAXTyH79wtLx08=; 
 b=Idubs2+ievcAYAZKvQ/JU5tzaCD0G58d5tKkiAY3mhv4xzcoKN3PiaHEk4uhTnzOXT4rS09CxAjSl+xqBoIlFUgEa+HHmZiBZI6a+QY1vlP5uDI1hBnqaPJCYp76PxVNTmnjHySIY5C4PQl3PwWP/dLTDqHBhb+6zEWV6Ox4leM=;
X-UUID: 8a309f8184244f4d9b70a657fa4ac1ad-20200913
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 636681320; Sun, 13 Sep 2020 21:45:00 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Sep 2020 22:40:55 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Sep 2020 13:40:52 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Sep 2020 13:40:52 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>
Subject: [PATCH] usb: gadget: bcm63xx_udc: fix up the error of undeclared
 usb_debug_root
Date: Mon, 14 Sep 2020 13:38:50 +0800
Message-ID: <1600061930-778-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: ECB9098F0EB5B81046F04177D76A33CE08016C522848931B0844B60C9FFF46062000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_014607_705212_FA47CE94 
X-CRM114-Status: GOOD (  12.84  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Cernekee <cernekee@gmail.com>, linux-kernel@vger.kernel.org,
 stable <stable@vger.kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-usb@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix up the build error caused by undeclared usb_debug_root

Cc: stable <stable@vger.kernel.org>
Fixes: a66ada4f241c("usb: gadget: bcm63xx_udc: create debugfs directory under usb root")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/gadget/udc/bcm63xx_udc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/udc/bcm63xx_udc.c b/drivers/usb/gadget/udc/bcm63xx_udc.c
index feaec00..9cd4a70 100644
--- a/drivers/usb/gadget/udc/bcm63xx_udc.c
+++ b/drivers/usb/gadget/udc/bcm63xx_udc.c
@@ -26,6 +26,7 @@
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/timer.h>
+#include <linux/usb.h>
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
 #include <linux/workqueue.h>
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
