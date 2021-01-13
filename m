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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE92C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 02:52:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA9C723120
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 02:52:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA9C723120
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tQuHh6h6kemDJB5Cfm7IndorasB7PKEy8rym0mCqVPA=; b=OFRliv5YbVGH5NPdtoT15LWEG
	9Ka042ccgtipX2kcn5qpKgBXRNFy1NwgpIsUMay8rxV1jHGtZd3dnDszWW3bhOFQT2M4ZiGaA9BqA
	j2rvGuYbYrb4tTn505f8+0F8k3ELwabwnJkcZ2S3X+yXaOIiGy4D0LlIxROg0F2uHHB6sJ/SOlbib
	Us0V9b8V9GVHOpldNMnLgQaykRaN6U5qIP5JcPkoF2Ta03kjObt0r4BEnQN+SR0RGVg3EMCnJvxMI
	wkuXm8lXYuIlV9VyUWbI6c9KVAnbNci3ma3S7jZjp7MmC9yv2fT8olZWn0Bpj1aaiYzxb43xPhXR1
	98ONkbuyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzWGl-0008EW-38; Wed, 13 Jan 2021 02:52:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzWGY-00081s-DP; Wed, 13 Jan 2021 02:52:11 +0000
X-UUID: 85d4c0a38f2d469aa61954a604ff7d79-20210112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=H+82HHmvcwYsz6NOiuJeUuQamOlBguNjjOpJQ/4tR7E=; 
 b=pAEAzBeSBqre8stq8++UA4Fm0ZeqL8IPYI3Xd846UIVNepSw59faXr+FcV//irjiR4ZQQtJdN0C5+UCq8NDjtb6AM8GYPLkcCv/tfaSvxpkxRXUijfcC6faMEUtppLtM65LYzEQiq7F47cfjVsH4pf8i2fWFMAGwXmq5yBjhmV0=;
X-UUID: 85d4c0a38f2d469aa61954a604ff7d79-20210112
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1687751166; Tue, 12 Jan 2021 18:52:00 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Jan 2021 18:42:55 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Jan 2021 10:42:50 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 13 Jan 2021 10:42:49 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>
Subject: [PATCH RESEND v4 06/11] usb: gadget: bdc: add identifier name for
 function declaraion
Date: Wed, 13 Jan 2021 10:42:23 +0800
Message-ID: <1610505748-30616-6-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1610505748-30616-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1610505748-30616-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 800F1379F4D96C635A547F98A4EF65C24491E16C1062665AA83C29A25FD284482000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_215210_719172_8BE7D392 
X-CRM114-Status: GOOD (  12.25  )
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

This is used to avoid the warning of function arguments, e.g.
  WARNING:FUNCTION_ARGUMENTS: function definition argument 'u32'
  should also have an identifier name

Cc: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
v4 resend: base on kernel 5.11-rc1
v4: no changes, but rebase on kernel 5.10-rc1
v3: add acked-by Florian
v2: add Cc Florian
---
 drivers/usb/gadget/udc/bdc/bdc.h     | 28 ++++++++++++++--------------
 drivers/usb/gadget/udc/bdc/bdc_cmd.h | 18 +++++++++---------
 drivers/usb/gadget/udc/bdc/bdc_dbg.h |  8 ++++----
 drivers/usb/gadget/udc/bdc/bdc_ep.h  |  8 ++++----
 4 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc.h b/drivers/usb/gadget/udc/bdc/bdc.h
index c0ee735bd887..658abeff59d4 100644
--- a/drivers/usb/gadget/udc/bdc/bdc.h
+++ b/drivers/usb/gadget/udc/bdc/bdc.h
@@ -466,24 +466,24 @@ static inline void bdc_writel(void __iomem *base, u32 offset, u32 value)
 }
 
 /* Buffer descriptor list operations */
-void bdc_notify_xfr(struct bdc *, u32);
-void bdc_softconn(struct bdc *);
-void bdc_softdisconn(struct bdc *);
-int bdc_run(struct bdc *);
-int bdc_stop(struct bdc *);
-int bdc_reset(struct bdc *);
-int bdc_udc_init(struct bdc *);
-void bdc_udc_exit(struct bdc *);
-int bdc_reinit(struct bdc *);
+void bdc_notify_xfr(struct bdc *bdc, u32 epnum);
+void bdc_softconn(struct bdc *bdc);
+void bdc_softdisconn(struct bdc *bdc);
+int bdc_run(struct bdc *bdc);
+int bdc_stop(struct bdc *bdc);
+int bdc_reset(struct bdc *bdc);
+int bdc_udc_init(struct bdc *bdc);
+void bdc_udc_exit(struct bdc *bdc);
+int bdc_reinit(struct bdc *bdc);
 
 /* Status report handlers */
 /* Upstream port status change sr */
-void bdc_sr_uspc(struct bdc *, struct bdc_sr *);
+void bdc_sr_uspc(struct bdc *bdc, struct bdc_sr *sreport);
 /* transfer sr */
-void bdc_sr_xsf(struct bdc *, struct bdc_sr *);
+void bdc_sr_xsf(struct bdc *bdc, struct bdc_sr *sreport);
 /* EP0 XSF handlers */
-void bdc_xsf_ep0_setup_recv(struct bdc *, struct bdc_sr *);
-void bdc_xsf_ep0_data_start(struct bdc *, struct bdc_sr *);
-void bdc_xsf_ep0_status_start(struct bdc *, struct bdc_sr *);
+void bdc_xsf_ep0_setup_recv(struct bdc *bdc, struct bdc_sr *sreport);
+void bdc_xsf_ep0_data_start(struct bdc *bdc, struct bdc_sr *sreport);
+void bdc_xsf_ep0_status_start(struct bdc *bdc, struct bdc_sr *sreport);
 
 #endif /* __LINUX_BDC_H__ */
diff --git a/drivers/usb/gadget/udc/bdc/bdc_cmd.h b/drivers/usb/gadget/udc/bdc/bdc_cmd.h
index a3a6dbd0022c..533ad52fa6d0 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_cmd.h
+++ b/drivers/usb/gadget/udc/bdc/bdc_cmd.h
@@ -10,14 +10,14 @@
 #define __LINUX_BDC_CMD_H__
 
 /* Command operations */
-int bdc_address_device(struct bdc *, u32);
-int bdc_config_ep(struct bdc *, struct bdc_ep *);
-int bdc_dconfig_ep(struct bdc *, struct bdc_ep *);
-int bdc_stop_ep(struct bdc *, int);
-int bdc_ep_set_stall(struct bdc *, int);
-int bdc_ep_clear_stall(struct bdc *, int);
-int bdc_ep_bla(struct bdc *, struct bdc_ep *, dma_addr_t);
-int bdc_function_wake(struct bdc*, u8);
-int bdc_function_wake_fh(struct bdc*, u8);
+int bdc_address_device(struct bdc *bdc, u32 add);
+int bdc_config_ep(struct bdc *bdc, struct bdc_ep *ep);
+int bdc_dconfig_ep(struct bdc *bdc, struct bdc_ep *ep);
+int bdc_stop_ep(struct bdc *bdc, int epnum);
+int bdc_ep_set_stall(struct bdc *bdc, int epnum);
+int bdc_ep_clear_stall(struct bdc *bdc, int epnum);
+int bdc_ep_bla(struct bdc *bdc, struct bdc_ep *ep, dma_addr_t dma_addr);
+int bdc_function_wake(struct bdc *bdc, u8 intf);
+int bdc_function_wake_fh(struct bdc *bdc, u8 intf);
 
 #endif /* __LINUX_BDC_CMD_H__ */
diff --git a/drivers/usb/gadget/udc/bdc/bdc_dbg.h b/drivers/usb/gadget/udc/bdc/bdc_dbg.h
index 859d588e209d..acd8332f8584 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_dbg.h
+++ b/drivers/usb/gadget/udc/bdc/bdc_dbg.h
@@ -12,10 +12,10 @@
 #include "bdc.h"
 
 #ifdef CONFIG_USB_GADGET_VERBOSE
-void bdc_dbg_bd_list(struct bdc *, struct bdc_ep*);
-void bdc_dbg_srr(struct bdc *, u32);
-void bdc_dbg_regs(struct bdc *);
-void bdc_dump_epsts(struct bdc *);
+void bdc_dbg_bd_list(struct bdc *bdc, struct bdc_ep *ep);
+void bdc_dbg_srr(struct bdc *bdc, u32 srr_num);
+void bdc_dbg_regs(struct bdc *bdc);
+void bdc_dump_epsts(struct bdc *bdc);
 #else
 static inline void bdc_dbg_regs(struct bdc *bdc)
 { }
diff --git a/drivers/usb/gadget/udc/bdc/bdc_ep.h b/drivers/usb/gadget/udc/bdc/bdc_ep.h
index 5bbd73f99c6f..4d3affd07a65 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_ep.h
+++ b/drivers/usb/gadget/udc/bdc/bdc_ep.h
@@ -9,9 +9,9 @@
 #ifndef __LINUX_BDC_EP_H__
 #define __LINUX_BDC_EP_H__
 
-int bdc_init_ep(struct bdc *);
-int bdc_ep_disable(struct bdc_ep *);
-int bdc_ep_enable(struct bdc_ep *);
-void bdc_free_ep(struct bdc *);
+int bdc_init_ep(struct bdc *bdc);
+int bdc_ep_disable(struct bdc_ep *ep);
+int bdc_ep_enable(struct bdc_ep *ep);
+void bdc_free_ep(struct bdc *bdc);
 
 #endif /* __LINUX_BDC_EP_H__ */
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
