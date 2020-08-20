Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D0DDC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 11:43:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F422B2054F
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 11:43:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yzLk3v+0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="CeK7o28j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F422B2054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Yzarcl//hbKEFqCakmNVOWVRoOtdZVa4kBGBnIA1+Gw=; b=yzLk3v+0u+lO17YgK9iRKqKXU
	vu/STdH6fS3qIORamGKTO7ac+ktrXngv49j7ZzbjjDPaUQNBPTCAPZeCoMEx1WrQW8h8hO6kvbhkB
	woifOQwg+AMHcDwS4eEb6m0ALC5G1rrlw7wkyGcm8umrVB3CzTS1hkK4V81s0nYFk06PPp7uTLZ+e
	pgLAyc5dSGPk+9mtinssH/BgZQUUSq6owgjah9YN3jx4yt6Sf1Rt5Q4OJeECm94ei5G5p120qBX3E
	vIxYSu1h/BN9kwd05eJAaYTrcB3GNsvLgGS8YK0OwzmSAw/X9S9oYc4XEkbtImGkIFA3HWYloFX4N
	ctePlbaRQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8iy7-0007D1-Hb; Thu, 20 Aug 2020 11:42:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8ixv-000770-0v; Thu, 20 Aug 2020 11:42:45 +0000
X-UUID: 8121878829c847e6bb2b1463fa4d11a4-20200820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=75cV0UNvaSFcEM+ct8jXkWIGJbUbdQ/lh05MDRsBTN0=; 
 b=CeK7o28j+Nojv09K6KNwe0jfpmA4Ji6nHujofLv3/9GP0kKkaCFVg2CMx9RTut2Gf/QlMLN6HKGFpVs3+7+jpVclsJja3L7eT/TEDJKB/sW2C3Br3cjBggwnqHeYvGJlw+AfEERorseQLA3BzSY3kf1WlBwory8zuKElpKxUlAA=;
X-UUID: 8121878829c847e6bb2b1463fa4d11a4-20200820
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1808465017; Thu, 20 Aug 2020 03:42:36 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 04:32:34 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 19:32:28 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Aug 2020 19:32:27 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH v2 07/11] usb: gadget: bdc: avoid precedence issues
Date: Thu, 20 Aug 2020 19:30:42 +0800
Message-ID: <1597923046-12535-7-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1597923046-12535-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1597923046-12535-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8AD06DDE1DD208043ADBFE70C9BAA1AC6B260E30948CDF1CCDA65F835038900B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_074243_265435_BEBA8892 
X-CRM114-Status: GOOD (  11.38  )
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

Add () around macro argument to avoid precedence issues

Cc: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
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
