Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D25B9C432BE
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 08:51:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A064D60F5E
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 08:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A064D60F5E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xSYB4KnUtCCQOGXZ/1KqrEsuV0LQEfpttaCjq03eniU=; b=zkt3ZS7UJdUv47
	YASjGkeFJG7w4qEa91YOd9x//C3TsIIzIHrNis9ijBXc4mEpvsq+Al7NbNwjs86YBJeINYHqojP+N
	4pqL7cYe02DxB3axSS6Wc/1yhzkexfF7RjB+HjWU02CPLEDUa11cQDqb8dmruUqko1clffso4rikW
	LajrOH5lB10rkz6O7RyvolZYJRS8svkvgWvYHT0gSE2hI6cwGSwb9uJrEu+sWMKnn1hZvqLYC16gj
	F4xnsD1t6JDiHSBGvX2vuqz/j5jJR/wDWRXrBnd7NNw6wWjGgQROIhwFA6vjo6iYh5IClmHquiaa4
	x7Sgy0pz//K+kGNOmrRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9OEl-007iam-7W; Fri, 30 Jul 2021 08:51:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9OEA-007iQy-0B; Fri, 30 Jul 2021 08:50:48 +0000
X-UUID: cfb681b786104aeb90c20f463e19fe4c-20210730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=tqHbB5+gPhNm+QCWwxSyynCd/FFaHN2k5soTg82IqaM=; 
 b=HGTar9LshNR3AUuEsK1duO63Pg1AUQs5nNf/8VE/kyaUakt0gS7oIAzr8xfb0bhjrjlvGlgaZhF68F5cQrG7XoIAEYvH4YGut+DwXPwLsKG4S8/36JLqHanshX0zGp4ITWf8U7kOttF0iszbylrqHxwAjpKytWOhvU1i9f7P7mw=;
X-UUID: cfb681b786104aeb90c20f463e19fe4c-20210730
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 502244257; Fri, 30 Jul 2021 01:50:44 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Jul 2021 01:50:43 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Jul 2021 16:50:42 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 30 Jul 2021 16:50:41 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>,
 <stable@vger.kernel.org>
Subject: [PATCH 07/11] usb: xhci-mtk: fix issue of out-of-bounds array access
Date: Fri, 30 Jul 2021 16:49:58 +0800
Message-ID: <1627635002-24521-7-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1627635002-24521-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1627635002-24521-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_015046_085687_97AA1B4C 
X-CRM114-Status: GOOD (  14.41  )
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

Bus bandwidth array access is based on esit, increase one
will cause out-of-bounds issue; for example, when esit is
XHCI_MTK_MAX_ESIT, will overstep boundary.

Fixes: 7c986fbc16ae ("usb: xhci-mtk: get the microframe boundary for ESIT")
Cc: <stable@vger.kernel.org>
Reported-by: Stan Lu <stan.lu@mediatek.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk-sch.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index cffcaf4dfa9f..0bb1a6295d64 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -575,10 +575,12 @@ static u32 get_esit_boundary(struct mu3h_sch_ep_info *sch_ep)
 	u32 boundary = sch_ep->esit;
 
 	if (sch_ep->sch_tt) { /* LS/FS with TT */
-		/* tune for CS */
-		if (sch_ep->ep_type != ISOC_OUT_EP)
-			boundary++;
-		else if (boundary > 1) /* normally esit >= 8 for FS/LS */
+		/*
+		 * tune for CS, normally esit >= 8 for FS/LS,
+		 * not add one for other types to avoid access array
+		 * out of boundary
+		 */
+		if (sch_ep->ep_type == ISOC_OUT_EP && boundary > 1)
 			boundary--;
 	}
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
