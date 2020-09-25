Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4034CC4727E
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 06:31:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE522208B6
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 06:31:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="z64pL8co";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="uup1l7x1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE522208B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PvQ97r/y/OnXROhKUive5eOoLyj32oOo3UqLYyXKLt8=; b=z64pL8coksb0+hGQyZfXP350x
	ak6EGNaCMxC5wV41M0URVvl2dQCg2hk+zb+oxbKDFjAijC6vkupOnoAN9/3TkYdlLCAk9PdbP6sRd
	qeu5D+szB+LSFeHR7ZpYeC7AzF0m7qiI3IHAiTTH3DeMg4OUekqxk0Z6xywPf6YY4BfuIUs/hRbdA
	WcrRhqjtp/Wsnnj9mP1ZjPtw/HqVb0xua97cqUq5hH+jdwWSj5EmpDvAdux4Qo9p+P3aNwSiQFeui
	j6OrTLdlLfe3EMhSKEdkiUEDPXyI6mBdgzwmXujtwOYAuUih/bP8t+RtYOFNoetHHUSkPgCe+FYFQ
	aW22mpK5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLhGc-0007bf-Pp; Fri, 25 Sep 2020 06:31:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLhGN-0007PN-Hj; Fri, 25 Sep 2020 06:31:25 +0000
X-UUID: 9a7303eb21ba43a684480e0f54e8b66a-20200924
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=M9B+st9EHiLWNz6oa11lg4+mh5nozfsj2SPClhQffMk=; 
 b=uup1l7x1BVKpDXACegkY6QIUrdKmf4clAbaNp5ifTCholp5Vn48EAWDsJbMZwqimCasX+IM1AzcsQ9poOkj8TJ1qwFfax3EV8sdrWvZO8a2GBW/qwnJAFVd9r0DTxyqyT1FDgku3F3BHM4B1oP4HFKD+z6RdmnI6SqF5L7POYME=;
X-UUID: 9a7303eb21ba43a684480e0f54e8b66a-20200924
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1408902485; Thu, 24 Sep 2020 22:31:10 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Sep 2020 23:23:27 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Sep 2020 14:23:24 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Sep 2020 14:23:24 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>
Subject: [PATCH V3 RESEND 07/11] usb: gadget: bdc: avoid precedence issues
Date: Fri, 25 Sep 2020 14:20:28 +0800
Message-ID: <1601014832-29726-7-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1601014832-29726-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1601014832-29726-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: DBA42CFD313BE9F3C341867BCE3F1BEB4D06B6C3B352AA49DEBF0F0E6201FE382000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_023123_747219_5214DC20 
X-CRM114-Status: GOOD (  10.65  )
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

Add () around macro argument to avoid precedence issues

Cc: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
v3: add acked-by Florian

v2: add Cc Florian
---
 drivers/usb/gadget/udc/bdc/bdc.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc.h b/drivers/usb/gadget/udc/bdc/bdc.h
index 658abef..f8d5958 100644
--- a/drivers/usb/gadget/udc/bdc/bdc.h
+++ b/drivers/usb/gadget/udc/bdc/bdc.h
@@ -86,20 +86,20 @@
 #define BDC_EPSTS5	0x74
 #define BDC_EPSTS6	0x78
 #define BDC_EPSTS7	0x7c
-#define BDC_SRRBAL(n)	(0x200 + (n * 0x10))
-#define BDC_SRRBAH(n)	(0x204 + (n * 0x10))
-#define BDC_SRRINT(n)	(0x208 + (n * 0x10))
-#define BDC_INTCTLS(n)	(0x20c + (n * 0x10))
+#define BDC_SRRBAL(n)	(0x200 + ((n) * 0x10))
+#define BDC_SRRBAH(n)	(0x204 + ((n) * 0x10))
+#define BDC_SRRINT(n)	(0x208 + ((n) * 0x10))
+#define BDC_INTCTLS(n)	(0x20c + ((n) * 0x10))
 
 /* Extended capability regs */
 #define BDC_FSCNOC	0xcd4
 #define BDC_FSCNIC	0xce4
-#define NUM_NCS(p)	(p >> 28)
+#define NUM_NCS(p)	((p) >> 28)
 
 /* Register bit fields and Masks */
 /* BDC Configuration 0 */
 #define BDC_PGS(p)	(((p) & (0x7 << 8)) >> 8)
-#define BDC_SPB(p)	(p & 0x7)
+#define BDC_SPB(p)	((p) & 0x7)
 
 /* BDC Capability1 */
 #define BDC_P64		(1 << 0)
@@ -113,7 +113,7 @@
 #define BDC_CMD_DVC	0x1
 #define BDC_CMD_CWS		(0x1 << 5)
 #define BDC_CMD_CST(p)		(((p) & (0xf << 6))>>6)
-#define BDC_CMD_EPN(p)		((p & 0x1f) << 10)
+#define BDC_CMD_EPN(p)		(((p) & 0x1f) << 10)
 #define BDC_SUB_CMD_ADD		(0x1 << 17)
 #define BDC_SUB_CMD_FWK		(0x4 << 17)
 /* Reset sequence number */
@@ -163,7 +163,7 @@
 #define BDC_SPEED_HS	0x3
 #define BDC_SPEED_SS	0x4
 
-#define BDC_PST(p)	(p & 0xf)
+#define BDC_PST(p)	((p) & 0xf)
 #define BDC_PST_MASK	0xf
 
 /* USPPMS */
@@ -228,7 +228,7 @@
 /* status report defines */
 #define SR_XSF		0
 #define SR_USPC		4
-#define SR_BD_LEN(p)    (p & 0xffffff)
+#define SR_BD_LEN(p)    ((p) & 0xffffff)
 
 #define XSF_SUCC	0x1
 #define XSF_SHORT	0x3
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
