Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8098C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 11:33:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72EF9204EA
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 11:33:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QBwj6QzZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bqCPn1ey"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72EF9204EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Mn0m185sc6ovbmeHpCCd/9Crn82ozHxe60Y0ZPJar5I=; b=QBwj6QzZfNWoGIFcN7VseLIyw
	Q5JUB0fCJP1Gdlx89CVJt5Ty28Z74TD3P/OLE00X2WjWXt0FF3oF2Ph3sAmeSwb6nepPLdmpCj5vu
	YJKL1pcVPKEKu3yMCPobFaWkPkrOhnAOpZ5JniLjXIgtExYB8jNsOexsBIJiFSIVccaj60w6yuMy9
	QUiBexipmIjIs90vgksaGjEbruA9qTd6G3YzLqmO2TabuOcuUbLz8TKtk/fXPQSwpE2opy3k5nadN
	ZyE9teUTSTn0EKoOn1uB5t212uZGzjYMNljfL2enX852xXihamHLtHqQJcwF12+3GBXwZQ4epZ3Bj
	fD5FuwtjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8ioc-0004oh-7c; Thu, 20 Aug 2020 11:33:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8ioL-0004e8-BT; Thu, 20 Aug 2020 11:32:50 +0000
X-UUID: aee282a0405440109e3a65e94b325e81-20200820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=1ZM5s5BYzq7pphBdN+ofbtbj4e0WXbm2jK+xsz7OBvs=; 
 b=bqCPn1ey2hnqTWw2evsSis6PY6fr6SbktX5EWHDf7N/Dy3da0tSBhigikXOlIroce7al9kCMqGCeoK1vRX3NlY9hC9VPtwnM09tkb76tAV92vi0zcB3nIW6y4RVRFFP6MV+4vuaNG4BYrXgrzWkd+nQATCtpOjMSr5RmZwophRM=;
X-UUID: aee282a0405440109e3a65e94b325e81-20200820
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 887026310; Thu, 20 Aug 2020 03:32:40 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 04:32:25 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 19:32:23 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Aug 2020 19:32:20 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH v2 02/11] usb: gadget: bdc: remove bdc_ep_set_halt()
 declaration
Date: Thu, 20 Aug 2020 19:30:37 +0800
Message-ID: <1597923046-12535-2-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1597923046-12535-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1597923046-12535-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 993446BD67BC065C383253FCC3998DD75C623113F854E26AD8DA7CFDA7CEDF122000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_073249_578763_0579ABB1 
X-CRM114-Status: GOOD (  11.23  )
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
 Al Cooper <alcooperx@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-usb@vger.kernel.org, Minas Harutyunyan <hminas@synopsys.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Colin Ian King <colin.king@canonical.com>, Nathan
 Chancellor <natechancellor@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

No definition for bdc_ep_set_halt(), so remove it.

Cc: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
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
