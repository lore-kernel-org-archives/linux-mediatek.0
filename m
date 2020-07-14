Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A225C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 09:01:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C95F02145D
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 09:01:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HqJi6sYC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WxhM0PJM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C95F02145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=akScF6kFj4ysL0X6Hvrsi2ji53kd1tV3twhdCqaaKsU=; b=HqJi6sYCZ0Gx8sgs/AwycqS+5
	+TELSGJxxn70NKgxlhzCAzqP6Oa+tWxM8PAkApgMb12QPihGBcnB9SJZFifMzqfNM2ok0uJVQq/iH
	WORQ1m7paPZnFNM8q1/LU8B2uutVIXwgfwItIdy1VBIHyLl+gmPWu6cyeRio2X1wpPD18ytV8dObb
	T1yoMG8hweTbheF2xG6A54Er7ED34DVg04F0CvTdEyKr46QPeIOLLK3/P4xmIsM4TlS12efMPxuJc
	bXV5wJHfVtUi+JoKx3LzPnD1ejgfuOBvUvcSh4sJn9ClRnMFzCVBofeKI/GZUZnPaWSE1otOPKlWu
	OWWjkqXYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvGo3-00009E-NJ; Tue, 14 Jul 2020 09:00:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvGns-0008Ui-OW; Tue, 14 Jul 2020 09:00:46 +0000
X-UUID: a8e0ab0be04f49e2bc3506edd4e4d3fc-20200714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=7ze8MUqRCqW8NAFyPQx+TiTtPZUYUkBO979o7vg+Kok=; 
 b=WxhM0PJM8r5yEmzZQTcAECnTzqfIYKOPvt2/NvdsvgroEMpYjWli+385jQhqIo3ng0OCe1Aq1+KoMxmNDMgUJE6HQvvU6y0iMljKWxsmbPAym7EEpGEX9RHfjCeYqLLnHlFsebOEQ9GNhp3jDJojjdSVFfAVfE4h4+GrxIlSYsQ=;
X-UUID: a8e0ab0be04f49e2bc3506edd4e4d3fc-20200714
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 844851235; Tue, 14 Jul 2020 01:00:42 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 01:50:44 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 16:50:41 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Jul 2020 16:50:40 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 9/9] usb: gadget: bdc: prefer pointer dereference to pointer
 type
Date: Tue, 14 Jul 2020 16:48:54 +0800
Message-ID: <1594716535-24699-9-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1594716535-24699-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1594716535-24699-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: C2E4303C8A8616C9F37FBD7111587A0843CFAC8B0C6422BCC7485C4D614E0B692000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_050045_009711_B1F7AF6B 
X-CRM114-Status: GOOD (  11.66  )
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Prefer kzalloc(sizeof(*bd_table)...) over
kzalloc(sizeof(struct bd_table)

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/gadget/udc/bdc/bdc_ep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc_ep.c b/drivers/usb/gadget/udc/bdc/bdc_ep.c
index eea66d5..d1ace77 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_ep.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_ep.c
@@ -147,7 +147,7 @@ static int ep_bd_list_alloc(struct bdc_ep *ep)
 	/* Allocate memory for each table */
 	for (index = 0; index < num_tabs; index++) {
 		/* Allocate memory for bd_table structure */
-		bd_table = kzalloc(sizeof(struct bd_table), GFP_ATOMIC);
+		bd_table = kzalloc(sizeof(*bd_table), GFP_ATOMIC);
 		if (!bd_table)
 			goto fail;
 
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
