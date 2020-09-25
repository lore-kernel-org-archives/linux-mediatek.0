Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53217C4727F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 06:23:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7FD922211
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 06:23:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ChQbox4I";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="szK1Sv9Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7FD922211
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dRYy38j1Cqrku+gCRtRSSV6ZaKEBqQ9luVG2p38ZBmg=; b=ChQbox4IR6GCDyT/seImS/V1m
	rg8xP/RWArezJcN4REUOvgd3lZxXfauxDFOOyDQmNW6zVzFb+OMmezNOn946CqtmDGbvkU+Qil0NU
	kEEJeGjjk7pDG11xCsymIPbcnHzLMOdQot4CB0dYuLBwCQb0kIrBIAeQxefJHm5P8+/aUMDiQam89
	SABBHHn/ZLmCAYZrJnUrAgoE/3UynZ6zEF7VPmftZPJhFTxhnlpwPuP+ONQ4nscLHGEQprAj/D+cI
	KCtz4Qxb9K6r0U0po6F7Y52yOoFEXKAaNNXmusJN95H3D+7098MVhJZPXI60Ya0sJFe0XaNGrn4yG
	2epzOC7WA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLh8j-0004lf-MH; Fri, 25 Sep 2020 06:23:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLh8g-0004kZ-9P; Fri, 25 Sep 2020 06:23:27 +0000
X-UUID: c40430585dc942b68372c163c2ac74bf-20200924
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Q0p4czr84XYZ0qBgAfFPrawGlMUYs3mqiKwpRcor5wM=; 
 b=szK1Sv9YO7apm8ZQ33cc+58YEuDuWltHBifDdIi6wszfcfbgq/kKjc+woUnLnr0jwZbPnPX43ZtILlL4EkyhFsla2UV56EB+Ri0BAT4xIeXi4en35XUNFts5WcobgyYb2elrF5pmRaQRNOdnCN6SXRYbAzK6MjxfHVayByjaums=;
X-UUID: c40430585dc942b68372c163c2ac74bf-20200924
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 419134407; Thu, 24 Sep 2020 22:23:23 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Sep 2020 23:23:20 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Sep 2020 14:23:17 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Sep 2020 14:23:18 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>
Subject: [PATCH V3 RESEND 02/11] usb: gadget: bdc: remove bdc_ep_set_halt()
 declaration
Date: Fri, 25 Sep 2020 14:20:23 +0800
Message-ID: <1601014832-29726-2-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1601014832-29726-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1601014832-29726-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: C846D79B859D62840C4B78692E850076B64CB80AD808ECE0C848FE0EFDF578552000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_022326_525369_63AE8827 
X-CRM114-Status: GOOD (  10.82  )
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
 Al Cooper <alcooperx@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Chunfeng
 Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
 Sasi Kumar <sasi.kumar@broadcom.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Colin Ian King <colin.king@canonical.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

No definition for bdc_ep_set_halt(), so remove it.

Cc: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
v3: add acked-by Florian

v2: add Cc Florian
---
 drivers/usb/gadget/udc/bdc/bdc_cmd.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc_cmd.h b/drivers/usb/gadget/udc/bdc/bdc_cmd.h
index 373e674..a3a6dbd 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_cmd.h
+++ b/drivers/usb/gadget/udc/bdc/bdc_cmd.h
@@ -16,7 +16,6 @@
 int bdc_stop_ep(struct bdc *, int);
 int bdc_ep_set_stall(struct bdc *, int);
 int bdc_ep_clear_stall(struct bdc *, int);
-int bdc_ep_set_halt(struct bdc_ep *, u32 , int);
 int bdc_ep_bla(struct bdc *, struct bdc_ep *, dma_addr_t);
 int bdc_function_wake(struct bdc*, u8);
 int bdc_function_wake_fh(struct bdc*, u8);
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
