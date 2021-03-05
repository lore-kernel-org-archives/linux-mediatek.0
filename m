Return-Path: <SRS0=DQN7=ID=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40ED9C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 09:05:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA27264F44
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Mar 2021 09:05:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA27264F44
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Q4GN/5Sbm73rfgImcI0+BlHoTAI5AR49MFWA7hgLNfQ=; b=ZispfuwcV6oo4FvF+rlppDRpI
	a8do+KTvVKbJtWQe/VVcF+ZcIAvp8CwhN+e3aN9hHGnlmVCi67hYkmrvg3vV7JA9cxwK5g4y/HD/w
	qyA7aZF7WujBdoXcDSrJ4wLyRDyjBOlgeUV7rp50FdvGd4R2T2x4U8Oqbd/RAPMcKq1fYiIj5kFNr
	LwiE5UnMc0YJrIcAlf4tP1yiELAFX0vEbvBw/MrJ5G/3c2GeYVRtLnoXEuMewAj9VyD7LHt/qdzOb
	Rf4LTkeY4PT8MCQ4o8AsxKIsXgv22gxIyQFLftILvlm+hUWJzkp3tpLXzeMaLDfmXiRu7Pu3s/dWa
	+XYRi9D4g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lI6OG-00E96e-CV; Fri, 05 Mar 2021 09:04:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lI6N0-00E8SI-OX; Fri, 05 Mar 2021 09:03:41 +0000
X-UUID: 970f559287bf438eb5fc487db46a5e67-20210305
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Rp7KwQlGYZJ+s4a0uOxFKVt9Tfwt8BcPRqzhnq83Y24=; 
 b=R2sukWm2vdX8KTz9kOXj6oHSV162rm401Eo5b7yk7WPfGyv2/eFmlOzc6YPDdQAWDkGhBl/ARWbK679UsTZfEFDbnycacC0sN8znbY0RUeoytVVcffzvOs63qj4bF152IMdzoRyFhyuEeWU8ynRGpk3YEuJRDZp2khW+vwG0m3E=;
X-UUID: 970f559287bf438eb5fc487db46a5e67-20210305
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1201250178; Fri, 05 Mar 2021 01:03:27 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Mar 2021 01:03:26 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Mar 2021 17:03:24 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Mar 2021 17:03:24 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Ikjoon Jang <ikjn@chromium.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH 14/17] usb: xhci-mtk: remove declaration of xhci_mtk_setup()
Date: Fri, 5 Mar 2021 17:02:52 +0800
Message-ID: <1614934975-15188-14-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1614934975-15188-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1614934975-15188-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: E394FF94E19BE99EEFB4B02F7C35F7A23C8C9D95F848F399261E29230F48E3CA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210305_090339_343741_83650EED 
X-CRM114-Status: GOOD (  11.38  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Move xhci_driver_overrides struct variable after definition
of xhci_mtk_setup(), then we can remove it's declaration.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index fe010cc61f19..fb4e56f6a6c3 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -344,15 +344,6 @@ static void usb_wakeup_set(struct xhci_hcd_mtk *mtk, bool enable)
 		usb_wakeup_ip_sleep_set(mtk, enable);
 }
 
-static int xhci_mtk_setup(struct usb_hcd *hcd);
-static const struct xhci_driver_overrides xhci_mtk_overrides __initconst = {
-	.reset = xhci_mtk_setup,
-	.check_bandwidth = xhci_mtk_check_bandwidth,
-	.reset_bandwidth = xhci_mtk_reset_bandwidth,
-};
-
-static struct hc_driver __read_mostly xhci_mtk_hc_driver;
-
 static int xhci_mtk_ldos_enable(struct xhci_hcd_mtk *mtk)
 {
 	int ret;
@@ -424,6 +415,14 @@ static int xhci_mtk_setup(struct usb_hcd *hcd)
 	return ret;
 }
 
+static const struct xhci_driver_overrides xhci_mtk_overrides __initconst = {
+	.reset = xhci_mtk_setup,
+	.check_bandwidth = xhci_mtk_check_bandwidth,
+	.reset_bandwidth = xhci_mtk_reset_bandwidth,
+};
+
+static struct hc_driver __read_mostly xhci_mtk_hc_driver;
+
 static int xhci_mtk_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
