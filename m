Return-Path: <SRS0=qDs2=CS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A978FC43461
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 07:45:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BE1A20659
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 07:45:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JdRfOAbX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="pb3C821k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BE1A20659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QQ8w0ZTOJQDaBufuIVU5bx8OPxAh902zajEu8vioCP0=; b=JdRfOAbXms+i92yHBI1idn6G6
	7KxZeGKj/oMvEB5kazq/1sWMiddIWDFViw8YzkT60TmS7tReDKgUSEa+1B0ssCWVCvI3KRnPdJ8BZ
	aW8c6efx6U8Qkp7hIUdKJFupGYehfqch/Jq4Ge97Ge5JHAun6X9JJoJ0Pm3EdSKU1JzLWVOB3Tuca
	IJtO3GoWG63WhmCjXqMkWqwX5JQ1UgtwpRPtxWlyw/bf1Nb24MsfsqpbT9FnKM8HXHHuubwdqGxFz
	QoqEhkPRrvnfI6R+rqhWUwEGCf7n7bOgyeEJxC90993xERBuOff6rvDlC+22WE4+cm7G1BLkqCHar
	JFCX+m2Uw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFunS-0006Pf-9l; Wed, 09 Sep 2020 07:45:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFun9-0006Eo-SB; Wed, 09 Sep 2020 07:45:21 +0000
X-UUID: 8822b9830ccb4169a39646385a3a5fd8-20200908
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=UU4g24a8gBnKtYu4tzeO/9s0b7IrNvX3qtQVd8/MiV4=; 
 b=pb3C821k14yZI1N8hWvgy6/00XTGprrhtPch8U6st/qWOCbbjcltyghmng1cw3evdVxTjoc75aJggsv2zmEvYpGJBe5tKj6hu9ZISMZQNsS9JS35BhT0ZGbIXdJ9ouGDHAaEtLH43AAVRw/po+bxSh4UMQNBVRf2MSIXcvW0Ub4=;
X-UUID: 8822b9830ccb4169a39646385a3a5fd8-20200908
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 27532719; Tue, 08 Sep 2020 23:45:15 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Sep 2020 00:35:20 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Sep 2020 15:35:17 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Sep 2020 15:35:16 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH v3 09/11] usb: gadget: bdc: fix checkpatch.pl tab warning
Date: Wed, 9 Sep 2020 15:33:00 +0800
Message-ID: <1599636782-7654-9-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1599636782-7654-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1599636782-7654-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2AA1BD8FC07D38044651672ED39F80B5D8FADBE1F94501DD414C70C1A821AA682000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_034520_079924_F8080997 
X-CRM114-Status: GOOD (  14.14  )
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
Cc: Peter Chen <peter.chen@nxp.com>, Sasi Kumar <sasi.kumar@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Al Cooper <alcooperx@gmail.com>, linux-kernel@vger.kernel.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Colin Ian King <colin.king@canonical.com>,
 Nathan Chancellor <natechancellor@gmail.com>, Bin Liu <b-liu@ti.com>,
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
