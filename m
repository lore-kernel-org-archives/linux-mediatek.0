Return-Path: <SRS0=Z3i2=IG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19321C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 03:03:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8B8365146
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 03:03:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8B8365146
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7mdadqFZBpfj0dxI70eegG1ahckFI0zd/GWwGPUEY64=; b=LfAkpMShiZhKGywhsb24V3Xpj
	dSRe363njaaMcSyVZEBYCL8Ov8nS6G4fFtJ1xSYATHAiMaZwSpaSWZR17ksYR7pWILGvH1TshRmri
	9PGrbfjKQA7OozGVQk7eof2DtCbyoNv8VvUYzTi1oG6Y/PnLF8Zg7unZeZZaLbAKe5Z6s6T326SN6
	bwB8ZhM+o+2mUeoX8LTS0gWxoDnTpaOOQma+ZMhBqB5/rjeIdDZ7tNt5m1z7VcsysOrrEzaOviYSR
	e0PufJnip0MYsx1muk+3h2gyXCyX0dZj5yJyBlMrp5iFHERlMOHKBaGHIetFMMUPV1qrTclAXXJ2D
	RrktfFvhg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ6B6-00EhYq-CM; Mon, 08 Mar 2021 03:03:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ6AJ-00Eh6q-78; Mon, 08 Mar 2021 03:02:44 +0000
X-UUID: c62a2fd4f0294d0c9c836bd9b29e2128-20210307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=d9R8Efg4iJqz4kgZuDQDYimU1zPprd22BKAFZBgVnoI=; 
 b=ecPCIgF93rFETJvgWjaRnYPamUPngjbKlptu45bsTlzHOcjI+UwBe4wctNtSjwEMJoq9oCnDRoKYF7aFP7loAmFXCo5VFPeJHQ2pswKq++RtoulGZWELqIv7b5OhhDlN+1nDAeODGPzG0++D+ugj9VGQogYVFtA0C5FqcOxA8GQ=;
X-UUID: c62a2fd4f0294d0c9c836bd9b29e2128-20210307
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1840732449; Sun, 07 Mar 2021 19:02:24 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Mar 2021 18:52:28 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Mar 2021 10:52:26 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 8 Mar 2021 10:52:25 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Ikjoon Jang <ikjn@chromium.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Eddie Hung <eddie.hung@mediatek.com>, Sergei Shtylyov
 <sergei.shtylyov@gmail.com>, Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v2 14/18] usb: xhci-mtk: remove declaration of xhci_mtk_setup()
Date: Mon, 8 Mar 2021 10:52:03 +0800
Message-ID: <cf627d611a5c59508371cc3360cb402b70825fd8.1615170625.git.chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <d287899e6beb2fc1bfb8900c75a872f628ecde55.1615170625.git.chunfeng.yun@mediatek.com>
References: <d287899e6beb2fc1bfb8900c75a872f628ecde55.1615170625.git.chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 89E7019BE4ACF905877E49FAC4A17713BC1049D70FA75A9EABC88D50890E6BE12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_030241_041147_A6B632FA 
X-CRM114-Status: GOOD (  12.53  )
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
v2: no changes
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
