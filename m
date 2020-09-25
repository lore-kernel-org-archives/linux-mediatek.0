Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C40E3C4727E
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 06:02:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 735B420936
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 06:02:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2DloYj4h";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="L8bzEk4n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 735B420936
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CC6k/nAReytJm93uMDz9Re9tWtoiUUphblZWR67OYrA=; b=2DloYj4hShIdzh1ssrL0PXEwU
	RawMTAmozyrqJOOldgVI3zQRRzdWI0xZczNLMOEytj+ILeKYxTk+eJ61kFaE4OOmviLSNNsp3gerE
	9/RfPl9DGYY1WeBVJyvel0zicvcasHWs87STI6u1ttYXUbgxhw08XpoNqDC4T3ug3YUuLbCKC8qw7
	jQx4EsJ/ECcAXoA/J4988TBU1lRt+0oRV9JUrWka8sPwY27ME+ovT/Pw083+AaaamSItzmXt5Sj4I
	F1BkMT8RTT9QvCx5q1zHlYnRMh3p+P9dxLw82dcwM36YZnu5f3gJRn/whr9Y5MkSunOzC9POeqz3Y
	1hFIXThRg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLgoB-0006I5-DH; Fri, 25 Sep 2020 06:02:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLgnp-000698-4n; Fri, 25 Sep 2020 06:01:54 +0000
X-UUID: 8be6d745ba4145a0864a6abb10b7190b-20200924
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=CVty1io5XFRd6B908K6UaU6Yp52fbiwvzI57mN8EJhU=; 
 b=L8bzEk4nrlRw9uj4QqDB7fOmvgiyi+Is/Y1yrxDWNCUqqztToq6Mf2VOVKjTnSlyK/ggjB01vJ80y9QaDKaN6ULN/pL0fFCpVq0M9MnIdrhhNejpJW+tS1sqJO0N6Z21Y65la1gTtLgEJphYs3mpbzlRGpOtFukEOcNrsWmGUUU=;
X-UUID: 8be6d745ba4145a0864a6abb10b7190b-20200924
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 715990340; Thu, 24 Sep 2020 22:01:31 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Sep 2020 23:01:28 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Sep 2020 14:01:26 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Sep 2020 14:01:25 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>
Subject: [PATCH 09/11] usb: gadget: bdc: fix checkpatch.pl tab warning
Date: Fri, 25 Sep 2020 13:58:17 +0800
Message-ID: <1601013499-28920-9-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1601013499-28920-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1601013499-28920-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 517A33FA7F714865E568706B912D8304B50CE7276976D79D10E7BC57666AF1262000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_020153_450777_B9225153 
X-CRM114-Status: GOOD (  14.36  )
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

WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements
WARNING:TABSTOP: Statements should start on a tabstop

Change-Id: Iec66c7e29babc2835e0137d298093b396aa2759d
Cc: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/usb/gadget/udc/bdc/bdc_cmd.c | 2 +-
 drivers/usb/gadget/udc/bdc/bdc_ep.c  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc_cmd.c b/drivers/usb/gadget/udc/bdc/bdc_cmd.c
index 44c2a5e..995f79c 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_cmd.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_cmd.c
@@ -163,7 +163,7 @@ int bdc_config_ep(struct bdc *bdc, struct bdc_ep *ep)
 					usb_endpoint_xfer_isoc(desc)) {
 			param2 |= si;
 			if (usb_endpoint_xfer_isoc(desc) && comp_desc)
-					mul = comp_desc->bmAttributes;
+				mul = comp_desc->bmAttributes;
 
 		}
 		param2 |= mul << EPM_SHIFT;
diff --git a/drivers/usb/gadget/udc/bdc/bdc_ep.c b/drivers/usb/gadget/udc/bdc/bdc_ep.c
index 3fb36c8..d227d26 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_ep.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_ep.c
@@ -275,7 +275,7 @@ static inline int find_end_bdi(struct bdc_ep *ep, int next_hwd_bdi)
 	end_bdi = next_hwd_bdi - 1;
 	if (end_bdi < 0)
 		end_bdi = ep->bd_list.max_bdi - 1;
-	 else if ((end_bdi % (ep->bd_list.num_bds_table-1)) == 0)
+	else if ((end_bdi % (ep->bd_list.num_bds_table-1)) == 0)
 		end_bdi--;
 
 	return end_bdi;
@@ -795,7 +795,7 @@ static int ep_dequeue(struct bdc_ep *ep, struct bdc_req *req)
 			start_pending = true;
 			end_pending = true;
 		} else if (end_bdi >= curr_hw_dqpi || end_bdi <= eqp_bdi) {
-				end_pending = true;
+			end_pending = true;
 		}
 	} else {
 		if (start_bdi >= curr_hw_dqpi) {
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
