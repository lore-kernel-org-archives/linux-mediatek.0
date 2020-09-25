Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C97C4727E
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 06:24:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45CF522211
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 06:24:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yD9EereX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="D8wxmJwZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45CF522211
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QQ8w0ZTOJQDaBufuIVU5bx8OPxAh902zajEu8vioCP0=; b=yD9EereXURnWSXUsthrZx3q1O
	HvbmGslT2VKrwoUOKxkshXCc0uvzlIPzbTA1WQMmDJjz3JYqd4j3FlA3aDkfORMblU6goCRHqDX8Z
	0nnc2Xi0KXzAVND3DClpBfo5mYdIHV0P4L9JPxLxru3nPv65+KgrQTsas/mR6lZlkOBz/qj3y6XPc
	F0TacRypy4b4x8tG5cj52q4nnVZcpb7O2I85gjo8afTmHqglkRRPO0JmgvDB6aKLOjObjzjt0ntsq
	Nx9fjFL0H5cUcW+mMbHLxNWC81UcZCXgxSWeLNOOkVMb5s1s6A9ujhWe7dP14VNp3BlLTprTjyXpV
	d5vjbM5Sw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLh95-0004tv-Vn; Fri, 25 Sep 2020 06:23:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLh8p-0004mp-6e; Fri, 25 Sep 2020 06:23:36 +0000
X-UUID: 1324cffc063e4a198e7055fad8767639-20200924
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=UU4g24a8gBnKtYu4tzeO/9s0b7IrNvX3qtQVd8/MiV4=; 
 b=D8wxmJwZz41g4oFhnyAnatrMNjJQx/VxvXG1z8gpQ4UYwwPHhdDADqu/VHEGOAXypl1dg2ljjAZxSDLYktGDcaiEkdECsVWg/sSXH52C7IahfIdOrbrCTgm0SdJig+oeme4B+Sz3d72uvnajHQezRgxUQgXQFH6xHWpoJsUwN/k=;
X-UUID: 1324cffc063e4a198e7055fad8767639-20200924
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1555699831; Thu, 24 Sep 2020 22:23:31 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Sep 2020 23:23:29 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Sep 2020 14:23:27 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Sep 2020 14:23:27 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>
Subject: [PATCH V3 RESEND 09/11] usb: gadget: bdc: fix checkpatch.pl tab
 warning
Date: Fri, 25 Sep 2020 14:20:30 +0800
Message-ID: <1601014832-29726-9-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1601014832-29726-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1601014832-29726-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 41975726BED17876357187712F8CE7B6AD2866473D2AE8FBC2E7B8AE6CFA39462000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_022335_395706_024B7ABF 
X-CRM114-Status: GOOD (  14.18  )
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

Cc: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
v3: add acked-by Florian

v2: add Cc Florian
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
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
