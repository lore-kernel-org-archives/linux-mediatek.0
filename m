Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 140B1C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 02:52:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBFF42311F
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 02:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBFF42311F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XV4b5Nnth2F8zKx1rCxnSgTWeJ5P8yrJ10bfB8e4bds=; b=Xvhhd2dnwEajjxlB7cAGny4hU
	hPOfq5ZwbV2avHP+B7PmGhS+f1anr30u7kycvNYbeP4w6Ibo7KCnsmmo0FGGZoDCEhH/FQr7lwTV/
	yrMrdd2FLPKybd+0PpblG7v2X+JIict5F+QuXmXauuq2uD7JzB0kOXfAqK8YqIfaun1MfLy8U5TfV
	zZLyQfCxiy4nzR9biBtNg8IYW23zhgcPornBNsx90M8ZuWNDiNCXItJlP6H3lDPKWA5rAEMlG/DWW
	34WWC6qd+HdmSXkM/s8YE/9VmxLFDsc9N1zQ5ro1Pj+zwRDemE6OxnmVAqYDPrWhu1uU7zlhFa40C
	gdJzc9Tpg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzWGy-0008KG-7H; Wed, 13 Jan 2021 02:52:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzWGY-000820-EA; Wed, 13 Jan 2021 02:52:13 +0000
X-UUID: 7d64990b87fc44c1981ccd2bd6bf9449-20210112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ZbTWW17Ihl/LRvtKvhDafH1r1s9BGYqP1PCvBNiAaRU=; 
 b=YROrCjBpo7lo+jZehda/UaXb7oVfSNrONxfYK92eo6jZly/B5NZ5ESgWifOpp0i12mD/QH5VHHWaAYjmMwZn5uNskkjqn/ZgKUVGaY9OeJoM6yR9tYg0DKpeZD3wC7HkwEqFWc+Kv+WfcXpAP0R/VdSrY7hwjLYyArxz0/4zZNM=;
X-UUID: 7d64990b87fc44c1981ccd2bd6bf9449-20210112
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 334676507; Tue, 12 Jan 2021 18:52:00 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Jan 2021 18:42:56 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Jan 2021 10:42:52 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 13 Jan 2021 10:42:51 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>
Subject: [PATCH RESEND v4 08/11] usb: gadget: bdc: use the BIT macro to define
 bit filed
Date: Wed, 13 Jan 2021 10:42:25 +0800
Message-ID: <1610505748-30616-8-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1610505748-30616-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1610505748-30616-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9BAF4B4E9CDC88F1AE75C0A39B74A95CBC78A28F46040677478A1F96D95385CC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_215210_744656_2745529B 
X-CRM114-Status: GOOD (  11.56  )
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
 Al Cooper <alcooperx@gmail.com>, linux-kernel@vger.kernel.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Prefer using the BIT macro to define bit fileds

Cc: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
v4 resend: base on kernel 5.11-rc1
v4: no changes, but rebase on kernel 5.10-rc1
v3: add acked-by Florian
v2: add Cc Florian
---
 drivers/usb/gadget/udc/bdc/bdc.h | 84 ++++++++++++++++----------------
 1 file changed, 42 insertions(+), 42 deletions(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc.h b/drivers/usb/gadget/udc/bdc/bdc.h
index f8d595804258..8d00b1239f21 100644
--- a/drivers/usb/gadget/udc/bdc/bdc.h
+++ b/drivers/usb/gadget/udc/bdc/bdc.h
@@ -102,7 +102,7 @@
 #define BDC_SPB(p)	((p) & 0x7)
 
 /* BDC Capability1 */
-#define BDC_P64		(1 << 0)
+#define BDC_P64		BIT(0)
 
 /* BDC Command register */
 #define BDC_CMD_FH	0xe
@@ -111,7 +111,7 @@
 #define BDC_CMD_BLA	0x3
 #define BDC_CMD_EPC	0x2
 #define BDC_CMD_DVC	0x1
-#define BDC_CMD_CWS		(0x1 << 5)
+#define BDC_CMD_CWS		BIT(5)
 #define BDC_CMD_CST(p)		(((p) & (0xf << 6))>>6)
 #define BDC_CMD_EPN(p)		(((p) & 0x1f) << 10)
 #define BDC_SUB_CMD_ADD		(0x1 << 17)
@@ -124,7 +124,7 @@
 #define BDC_SUB_CMD_EP_STP	(0x2 << 17)
 #define BDC_SUB_CMD_EP_STL	(0x4 << 17)
 #define BDC_SUB_CMD_EP_RST	(0x1 << 17)
-#define BDC_CMD_SRD		(1 << 27)
+#define BDC_CMD_SRD		BIT(27)
 
 /* CMD completion status */
 #define BDC_CMDS_SUCC	0x1
@@ -141,19 +141,19 @@
 #define EPM_SHIFT	4
 
 /* BDC USPSC */
-#define BDC_VBC		(1 << 31)
-#define BDC_PRC		(1 << 30)
-#define BDC_PCE		(1 << 29)
-#define BDC_CFC		(1 << 28)
-#define BDC_PCC		(1 << 27)
-#define BDC_PSC		(1 << 26)
-#define BDC_VBS		(1 << 25)
-#define BDC_PRS		(1 << 24)
-#define BDC_PCS		(1 << 23)
+#define BDC_VBC		BIT(31)
+#define BDC_PRC		BIT(30)
+#define BDC_PCE		BIT(29)
+#define BDC_CFC		BIT(28)
+#define BDC_PCC		BIT(27)
+#define BDC_PSC		BIT(26)
+#define BDC_VBS		BIT(25)
+#define BDC_PRS		BIT(24)
+#define BDC_PCS		BIT(23)
 #define BDC_PSP(p)	(((p) & (0x7 << 20))>>20)
-#define BDC_SCN		(1 << 8)
-#define BDC_SDC		(1 << 7)
-#define BDC_SWS		(1 << 4)
+#define BDC_SCN		BIT(8)
+#define BDC_SDC		BIT(7)
+#define BDC_SWS		BIT(4)
 
 #define BDC_USPSC_RW	(BDC_SCN|BDC_SDC|BDC_SWS|0xf)
 #define BDC_PSP(p)	(((p) & (0x7 << 20))>>20)
@@ -167,17 +167,17 @@
 #define BDC_PST_MASK	0xf
 
 /* USPPMS */
-#define BDC_U2E		(0x1 << 31)
-#define BDC_U1E		(0x1 << 30)
-#define BDC_U2A		(0x1 << 29)
-#define BDC_PORT_W1S	(0x1 << 17)
+#define BDC_U2E		BIT(31)
+#define BDC_U1E		BIT(30)
+#define BDC_U2A		BIT(29)
+#define BDC_PORT_W1S	BIT(17)
 #define BDC_U1T(p)	((p) & 0xff)
 #define BDC_U2T(p)	(((p) & 0xff) << 8)
 #define BDC_U1T_MASK	0xff
 
 /* USBPM2 */
 /* Hardware LPM Enable */
-#define BDC_HLE		(1 << 16)
+#define BDC_HLE		BIT(16)
 
 /* BDC Status and Control */
 #define BDC_COP_RST	(1 << 29)
@@ -186,11 +186,11 @@
 
 #define BDC_COP_MASK (BDC_COP_RST|BDC_COP_RUN|BDC_COP_STP)
 
-#define BDC_COS		(1 << 28)
+#define BDC_COS		BIT(28)
 #define BDC_CSTS(p)	(((p) & (0x7 << 20)) >> 20)
-#define BDC_MASK_MCW	(1 << 7)
-#define BDC_GIE		(1 << 1)
-#define BDC_GIP		(1 << 0)
+#define BDC_MASK_MCW	BIT(7)
+#define BDC_GIE		BIT(1)
+#define BDC_GIP		BIT(0)
 
 #define BDC_HLT	1
 #define BDC_NOR	2
@@ -201,19 +201,19 @@
 #define BD_CHAIN	0xf
 
 #define BD_TFS_SHIFT	4
-#define BD_SOT		(1 << 26)
-#define BD_EOT		(1 << 27)
-#define BD_ISP		(1 << 29)
-#define BD_IOC		(1 << 30)
-#define BD_SBF		(1 << 31)
+#define BD_SOT		BIT(26)
+#define BD_EOT		BIT(27)
+#define BD_ISP		BIT(29)
+#define BD_IOC		BIT(30)
+#define BD_SBF		BIT(31)
 
 #define BD_INTR_TARGET(p)	(((p) & 0x1f) << 27)
 
-#define BDC_SRR_RWS		(1 << 4)
-#define BDC_SRR_RST		(1 << 3)
-#define BDC_SRR_ISR		(1 << 2)
-#define BDC_SRR_IE		(1 << 1)
-#define BDC_SRR_IP		(1 << 0)
+#define BDC_SRR_RWS		BIT(4)
+#define BDC_SRR_RST		BIT(3)
+#define BDC_SRR_ISR		BIT(2)
+#define BDC_SRR_IE		BIT(1)
+#define BDC_SRR_IP		BIT(0)
 #define BDC_SRR_EPI(p)	(((p) & (0xff << 24)) >> 24)
 #define BDC_SRR_DPI(p) (((p) & (0xff << 16)) >> 16)
 #define BDC_SRR_DPI_MASK	0x00ff0000
@@ -221,7 +221,7 @@
 #define MARK_CHAIN_BD	(BD_CHAIN|BD_EOT|BD_SOT)
 
 /* Control transfer BD specific fields */
-#define BD_DIR_IN		(1 << 25)
+#define BD_DIR_IN		BIT(25)
 
 #define BDC_PTC_MASK	0xf0000000
 
@@ -241,13 +241,13 @@
 
 /* Transfer BD fields */
 #define BD_LEN(p) ((p) & 0x1ffff)
-#define BD_LTF		(1 << 25)
+#define BD_LTF		BIT(25)
 #define BD_TYPE_DS	0x1
 #define BD_TYPE_SS	0x2
 
-#define BDC_EP_ENABLED     (1 << 0)
-#define BDC_EP_STALL       (1 << 1)
-#define BDC_EP_STOP        (1 << 2)
+#define BDC_EP_ENABLED     BIT(0)
+#define BDC_EP_STALL       BIT(1)
+#define BDC_EP_STOP        BIT(2)
 
 /* One BD can transfer max 65536 bytes */
 #define BD_MAX_BUFF_SIZE	(1 << 16)
@@ -266,9 +266,9 @@
 /* FUNCTION WAKE DEV NOTIFICATION interval, USB3 spec table 8.13 */
 #define BDC_TNOTIFY 2500 /*in ms*/
 /* Devstatus bitfields */
-#define REMOTE_WAKEUP_ISSUED	(1 << 16)
-#define DEVICE_SUSPENDED	(1 << 17)
-#define FUNC_WAKE_ISSUED	(1 << 18)
+#define REMOTE_WAKEUP_ISSUED	BIT(16)
+#define DEVICE_SUSPENDED	BIT(17)
+#define FUNC_WAKE_ISSUED	BIT(18)
 #define REMOTE_WAKE_ENABLE	(1 << USB_DEVICE_REMOTE_WAKEUP)
 
 /* On disconnect, preserve these bits and clear rest */
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
