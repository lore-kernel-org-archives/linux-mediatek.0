Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9510BC433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 08:30:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 141C42076C
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 08:30:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MlKEddgG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="eieQ+3RH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 141C42076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IOgJDN/E2zbnxML0sL2SVC/Q2igpNYDnPUp/+GW4+Eg=; b=MlKEddgGMCRdVDNUShn+uk1OSy
	4SCAaVYmLxNF/+5QuIstxmolSzSeDmWMRR97Ot5fyxhMA3Zr3jLgaywJq7E2QU4Dv1O2lUVVB17GE
	ljNRed47fwisNhSvYbRkCc9+ary49+Neg1IBmA5WwDbpRxdVTq/u/FQWzFF31K5eK7d/j05DUFfe7
	COuYElHWSoOZnfQHavGDWyNbU4E7DzGPHKENkG0qdtIFReL5hujNnJbE3WUgN+JjmOBwC+lMWWItJ
	Zq5Irc4br6/NTwkgLSZPmCchhAbSl2R1Xhrk7m2GBLiUnUSyNhF3nxdeNI7uwI9uUwAisIcfHg/05
	OcqzFRig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGHyS-000448-6v; Thu, 10 Sep 2020 08:30:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGHyQ-00042R-3X; Thu, 10 Sep 2020 08:30:31 +0000
X-UUID: 1e1a1279a0eb41d6afaaf8442dae44bd-20200910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=n+pceR4RMgmAMEAt4bZLKvLzwP+bC0iCUPc31NQ9+9s=; 
 b=eieQ+3RHKFVXMCqhVGxjClJDEUY+G4tQGPO1UEkAvhuG+flLR13RnzQmGtxzrFyJe/Jg1LZtwXxNgm4y3K7dSltDYxdrWoyzafrqw8s1De9vFplm3F425ZN3p8pC56iCkTK0WMEm2uiyShAJkkqNu5+JYusc6mZRmpZFvGYw+K8=;
X-UUID: 1e1a1279a0eb41d6afaaf8442dae44bd-20200910
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1705177483; Thu, 10 Sep 2020 00:24:03 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Sep 2020 01:24:01 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Sep 2020 16:23:58 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Sep 2020 16:23:56 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH RESEND v3 01/11] usb: early: convert to
 readl_poll_timeout_atomic()
Date: Thu, 10 Sep 2020 16:21:42 +0800
Message-ID: <1599726112-4439-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3CEDF1C9E1989338AB07B01DC590B9649CEE54B7EB8B0190A82F837BF91D34932000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_043030_275135_4B242461 
X-CRM114-Status: GOOD (  15.18  )
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
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Saurav Girepunje <saurav.girepunje@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Daniel
 Thompson <daniel.thompson@linaro.org>, Mathias Nyman <mathias.nyman@intel.com>,
 Jann Horn <jannh@google.com>, Ben
 Dooks <ben.dooks@codethink.co.uk>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>, Sumit Garg <sumit.garg@linaro.org>,
 Chuhong Yuan <hslester96@gmail.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Felipe Balbi <balbi@kernel.org>,
 Mathias Nyman <mathias.nyman@linux.intel.com>, Jason Yan <yanaijie@huawei.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use readl_poll_timeout_atomic() to simplify code

Cc: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2~v3: no changes
---
 drivers/usb/early/xhci-dbc.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
index c050776..be4ecba 100644
--- a/drivers/usb/early/xhci-dbc.c
+++ b/drivers/usb/early/xhci-dbc.c
@@ -14,6 +14,7 @@
 #include <linux/pci_ids.h>
 #include <linux/memblock.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <asm/pci-direct.h>
 #include <asm/fixmap.h>
 #include <linux/bcd.h>
@@ -135,16 +136,9 @@ static int handshake(void __iomem *ptr, u32 mask, u32 done, int wait, int delay)
 {
 	u32 result;
 
-	do {
-		result = readl(ptr);
-		result &= mask;
-		if (result == done)
-			return 0;
-		udelay(delay);
-		wait -= delay;
-	} while (wait > 0);
-
-	return -ETIMEDOUT;
+	return readl_poll_timeout_atomic(ptr, result,
+					 ((result & mask) == done),
+					 delay, wait);
 }
 
 static void __init xdbc_bios_handoff(void)
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
