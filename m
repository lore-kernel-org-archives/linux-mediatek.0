Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E04D4C4363D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 06:02:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75C3B21775
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 06:02:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fmDWubw8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QbuOOGq3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75C3B21775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FmWs4yc/LRex8fYRMCc9ZKOrQRR8QMn+FtfZ3YSx0Kg=; b=fmDWubw8VpQiIQLwG9X02slNp
	qJHBWnVPcxZMnZbu+uAWy/yc/fTPwrJVyW2gOGqzK/DScopluSdKwMgw69T9XAyNrYPwdIn/sH5K4
	QJ2X6+6MkEG1X1dQCaIoUDZ4eaAPeXZLN8Z91wXtuOD51Xjl248Bg2QwzoCgX+o0zLAdQoddiCeIy
	sf/EumVOuktKDpatK2TRCOMplE41nicGKY2JnwIiBiWI3bGphzj0YEfV8Jj8f4LAhsrtsJTaTtQty
	yBaOOY4o5wVMQ1dXQ+A4monjDAI1XW+OwicMeIgUMQ77N1+vFpMvKh+Hy5vrrNdAeGaxX2JAflYrF
	tbIz45Ljw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLgo5-0006GZ-Vo; Fri, 25 Sep 2020 06:02:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLgnl-000698-JA; Fri, 25 Sep 2020 06:01:52 +0000
X-UUID: 1204f70dc5834a97a28c5909ccdb5932-20200924
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=JenNTUfbhXoEYFQDN8/NJKf2HJtglZ8FecJH9t5V/ro=; 
 b=QbuOOGq3ESoizc3/kt+qxgm5/55myCgBMUZn/sxPIAsZZv2JNDCWiiqqUICSjsHwyx0sbRsvVZxZzKrSdK1BQUbAt3LJv6n2uNG8+YUi8QBvRIaqcmMWiwZZi52G0vQLjnqO4t8+HdKCYGS3QXqVeoH/VCgpFeYOd+ri7rkvzMQ=;
X-UUID: 1204f70dc5834a97a28c5909ccdb5932-20200924
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1071316633; Thu, 24 Sep 2020 22:01:27 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Sep 2020 23:01:25 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Sep 2020 14:01:22 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Sep 2020 14:01:22 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>
Subject: [PATCH 06/11] usb: gadget: bdc: add identifier name for function
 declaraion
Date: Fri, 25 Sep 2020 13:58:14 +0800
Message-ID: <1601013499-28920-6-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1601013499-28920-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1601013499-28920-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: D4DBE4CB9F13AE2C41D491F4742A83014238B897AFDAAFB2309BB70B813FC2FF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_020149_807364_211E2ADB 
X-CRM114-Status: GOOD (  12.55  )
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

This is used to avoid the warning of function arguments, e.g.
  WARNING:FUNCTION_ARGUMENTS: function definition argument 'u32'
  should also have an identifier name

Change-Id: Ia63d562247e18230fafe5cb2b6014f5f8daaaa7d
Cc: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/usb/gadget/udc/bdc/bdc.h     | 28 ++++++++++++++--------------
 drivers/usb/gadget/udc/bdc/bdc_cmd.h | 18 +++++++++---------
 drivers/usb/gadget/udc/bdc/bdc_dbg.h |  8 ++++----
 drivers/usb/gadget/udc/bdc/bdc_ep.h  |  8 ++++----
 4 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/usb/gadget/udc/bdc/bdc.h b/drivers/usb/gadget/udc/bdc/bdc.h
index c0ee735..658abef 100644
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
index a3a6dbd..533ad52 100644
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
index 859d588..acd8332 100644
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
index 5bbd73f..4d3affd 100644
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
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
