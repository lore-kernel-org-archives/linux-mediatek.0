Return-Path: <SRS0=Fc+n=ES=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C555BC55ABD
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 08:08:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45B0520709
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 08:08:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m8qTOe4l";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UF7LJNa4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45B0520709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C2LkoCA6Gt4J7pn4ZHs/bWm/05cbziOlEkWvI2Oez+w=; b=m8qTOe4lB4KQx559TLsuesNht
	CkP4FNwgPBhIZFX74WR6BGIXmWm3gnmXSDkfr2ta8v1DjiZLePttIRRht8hUqmfflRZMIbFKTDCHV
	BlhaypW1Zj69eTSaVjDBQMcxtKWZ+9VV3qL4/ilulEQRcQKn9buogtNQEelmDrE66HMG1PYftivvA
	FuQkJHujKNnYWTE2+phLLySeWk8sAseaDt8RxuE4BHg62WLJ0oUCGE466F2EENEz3DIHzrWbIXfg/
	ERY+nTFAsSZQPV6I2+RejtsBYTnPxZ7wKHP4FFV8G1dAQW1T6GE4iM4XUxfImYjT+eOnTwbkfHlZE
	jG72CRJWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kd7ej-0000wX-4x; Thu, 12 Nov 2020 08:08:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kd7eS-0000r6-A4; Thu, 12 Nov 2020 08:08:17 +0000
X-UUID: 916a66396782479494b7c4de6c34f33e-20201111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=pfL2ISYGe4j8jb28uanG3ThBCCEJdjtEPBh+IAPx1bU=; 
 b=UF7LJNa4X7puE/3EJDfD4WzAG+YJI79Ur6VuxaCV/SaW4ySxFRV1jO+bD/e8LosEoNNg5mSSQ08rjvg1tGOUk+dsyBpwCqwqaHmoEtLkBPjXJoOLjgM+tUa2Er6Z/wLaOdLsjJ47sY2MnJaKtdricFTSq0Zds7Uxy5fXOiCroZ4=;
X-UUID: 916a66396782479494b7c4de6c34f33e-20201111
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 192503509; Wed, 11 Nov 2020 23:59:40 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Nov 2020 23:59:46 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Nov 2020 15:59:43 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 12 Nov 2020 15:59:42 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH v4 07/11] usb: gadget: bdc: avoid precedence issues
Date: Thu, 12 Nov 2020 15:59:30 +0800
Message-ID: <1605167974-28502-7-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1605167974-28502-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1605167974-28502-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 95F7774C3FDDE88B504CA253E1ACD6A8E13B961122FA043DC203E6F10895C8DD2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_030816_644446_677930CB 
X-CRM114-Status: GOOD (  10.67  )
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
Cc: linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Al Cooper <alcooperx@gmail.com>, linux-kernel@vger.kernel.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
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
v4: no changes, but rebase on kernel 5.10-rc1
v3: add acked-by Florian
v2: add Cc Florian
---
 drivers/usb/gadget/udc/bdc/bdc.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc.h b/drivers/usb/gadget/udc/bdc/bdc.h
index 658abeff59d4..f8d595804258 100644
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
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
