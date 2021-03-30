Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7187CC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 06:03:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4BE661928
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 06:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4BE661928
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=obU2T0TY0anu49HF2TyT1gKv0RAWRF+y7jbYn5IYPy0=; b=Kr9ymlvkLU1+5B1ZAIsM//xNw
	yAwKUeEjxZ8wXEJSeqt9qjfsJiIaATody8e5BGDrsU/krTCqnfMFis5bbNXFhFAOqnvZRYYvo2VL7
	rTpOeOpVMJ0A2qandTyzMY/MIj0zSUAudsPK62Sxv9DUiJgWobxGiA5JpfcpTGmoZ9RXp7Snv0LPk
	eQVISLThE2w8SapJUDfu5groa5WrZU2W8tfGzFaSHW85NFYQIZxJ8dusg17G+pNJ1e2F8fa14ixbR
	1+9jwHY2MAJD3G0Sm/iBp7sOC8bM7K4rJR8b4OwjxFFqR2BFCqN6xhiHl7uZcKpq9S86q0K1T0VPT
	J6sLb+kmg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR7T5-002oEu-Gy; Tue, 30 Mar 2021 06:03:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR7Sz-002oDE-QB
 for linux-mediatek@lists.infradead.org; Tue, 30 Mar 2021 06:03:08 +0000
X-UUID: 63abf630c28b46bea06f645997b81349-20210329
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=2ZuC0MzTeSbEzRwk/rCM6b9KkcreZCn9BPwNINaAX18=; 
 b=CNfOBB5W6nPNHpjYDcDmxLjXycXlByRUOgqvNXduox+T7The/KohCi34G/asREVULFySLfF5lf/BpzXfuBlW7wcAcg4EKLT7q1zJd3MK2tgJMf5U4OgFUMM/PaZwXpbfHRvdseUzgpALY4Ll4SHPGNq7i2lOd+qBVrW7OEaiFwE=;
X-UUID: 63abf630c28b46bea06f645997b81349-20210329
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 573630812; Mon, 29 Mar 2021 22:02:56 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Mar 2021 23:02:55 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Mar 2021 14:02:50 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 30 Mar 2021 14:02:49 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
CC: <linux-mediatek@lists.infradead.org>
Subject: [PATCH v3 3/4] usb: xhci-mtk: fix broken streams issue on 0.96 xHCI
Date: Tue, 30 Mar 2021 14:02:36 +0800
Message-ID: <1617084157-18652-3-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1617084157-18652-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1617084157-18652-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: CA07A751B66BC5448F48097BB53430BB9A42BDBEE14F14EF3D1581E626B6C64E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_070306_912888_31B802C8 
X-CRM114-Status: GOOD (  12.42  )
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

The MediaTek 0.96 xHCI controller on some platforms does not
support bulk stream even HCCPARAMS says supporting, due to MaxPSASize
is set a default value 1 by mistake, here use XHCI_BROKEN_STREAMS
quirk to fix it.

Fixes: 94a631d91ad3 ("usb: xhci-mtk: check hcc_params after adding primary hcd")
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2~3: no changes
---
 drivers/usb/host/xhci-mtk.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index c1bc40289833..4e3d53cc24f4 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -411,6 +411,13 @@ static void xhci_mtk_quirks(struct device *dev, struct xhci_hcd *xhci)
 	xhci->quirks |= XHCI_SPURIOUS_SUCCESS;
 	if (mtk->lpm_support)
 		xhci->quirks |= XHCI_LPM_SUPPORT;
+
+	/*
+	 * MTK xHCI 0.96: PSA is 1 by default even if doesn't support stream,
+	 * and it's 3 when support it.
+	 */
+	if (xhci->hci_version < 0x100 && HCC_MAX_PSA(xhci->hcc_params) == 4)
+		xhci->quirks |= XHCI_BROKEN_STREAMS;
 }
 
 /* called during probe() after chip reset completes */
@@ -572,7 +579,8 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 	if (ret)
 		goto put_usb3_hcd;
 
-	if (HCC_MAX_PSA(xhci->hcc_params) >= 4)
+	if (HCC_MAX_PSA(xhci->hcc_params) >= 4 &&
+	    !(xhci->quirks & XHCI_BROKEN_STREAMS))
 		xhci->shared_hcd->can_do_streams = 1;
 
 	ret = usb_add_hcd(xhci->shared_hcd, irq, IRQF_SHARED);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
