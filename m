Return-Path: <SRS0=Uf5e=NV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8966C432BE
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 16:00:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8170160F5B
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 16:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8170160F5B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gorani.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qL4gmlOvqktxL/UX1+vvbh5jJpJl4CZScCNvwoV8NBQ=; b=pNvKagKe2SIQfz
	bNDqoEn8WXRq6pxi/uhAO9Ejx8ZWSVH50xuFrrmkx3qiiIx2thwXrBi8O8Vvj7Jt6FrOl8eRF1kHn
	nziW9cIat96QuChXoXJbbUqQdUp7X8Ez1kqyjDHbEJibZiVIlMRTWH+CoD6duTXeSdJQcZZRw6Fl9
	Vy5XEN3pHEItxRBDEJMBKkNNDUpcigx5p0EbhOJDaGtRYAumbsM0KnFDWLBpxpdsZTXDf9QFUdz1T
	Lk+CAtygctu4fe00iBVtRt/3GJMwNQe2J7ccqrHJC86Y71tzWILSqp0m5bBaEWF/h7w8bR1SdWx1F
	t6To4aVkzW/DhIS2MbeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKjhY-00HZV6-Si; Mon, 30 Aug 2021 16:00:00 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050::465:103])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKjhH-00HZQB-GP; Mon, 30 Aug 2021 15:59:47 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [80.241.60.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4Gyw4Y5kDJzQk9P;
 Mon, 30 Aug 2021 17:59:41 +0200 (CEST)
Received: from spamfilter01.heinlein-hosting.de
 (spamfilter01.heinlein-hosting.de [80.241.56.115])
 by smtp202.mailbox.org (Postfix) with ESMTP id F3A63269;
 Mon, 30 Aug 2021 17:59:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gorani.run; s=MBO0001; 
 t=1630339180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0KOqLxkiU+/8SIHhRrGil0tG6FLiytivUw+Y1vwHD7E=;
 b=Gx0oCk8l4/W2f09nVNR9rXnw9orFN5ykWxLr4+r/VuC3gsYxFVW0dZMn0cTPWdlFm/ylZr
 smZzyl21ueq2poPRv+pSoEEgSNO3Fqyy3tR4Rzcxd9MJF06qVCLWM6c/6JcgawNKbG+WDw
 vQApaMaIw69dICXeU2lhXkWS4Ho6UlcXd0/oklcIULUWyHguvUWAOPIya/tjbN6o8phfG9
 C2N+IpXA7Vkgp8ebXemZDSoJYVyIyim0INMu31C0xZKqcJMT/BSxbvrc0JQcVRuXlAHS03
 MhnExy6izNbHxGCLW9Eq7dEQbNL/ZHAucb3Zpmr0kYxPMe070dGgyVqCsJgrFg==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp202.mailbox.org ([80.241.60.245])
 by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de
 [80.241.56.115]) (amavisd-new, port 10030)
 with ESMTP id FmJvOHpQ8Wcw; Mon, 30 Aug 2021 17:59:39 +0200 (CEST)
Received: from ms-v3.lan (unknown [211.58.59.88])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp202.mailbox.org (Postfix) with ESMTPSA id 794D926A;
 Mon, 30 Aug 2021 17:59:35 +0200 (CEST)
From: Sungbo Eo <mans0n@gorani.run>
To: linux-mediatek@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Bin Liu <b-liu@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Sungbo Eo <mans0n@gorani.run>
Subject: [PATCH v4 2/2] usb: musb: mediatek: Expose role-switch control to
 userspace
Date: Tue, 31 Aug 2021 00:59:03 +0900
Message-Id: <20210830155903.13907-3-mans0n@gorani.run>
In-Reply-To: <20210830155903.13907-1-mans0n@gorani.run>
References: <20210822041333.5264-1-mans0n@gorani.run>
 <20210830155903.13907-1-mans0n@gorani.run>
MIME-Version: 1.0
X-Rspamd-Queue-Id: F3A63269
X-Rspamd-UID: bb2745
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_085943_735081_D015678A 
X-CRM114-Status: UNSURE (   8.41  )
X-CRM114-Notice: Please train this message.
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

The allow_userspace_control flag enables manual role-switch from userspace.
Turn this feature on like several other USB DRD controller drivers.

Signed-off-by: Sungbo Eo <mans0n@gorani.run>
Tested-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/usb/musb/mediatek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/musb/mediatek.c b/drivers/usb/musb/mediatek.c
index 6b92d037d8fc..f5d97eb84cb5 100644
--- a/drivers/usb/musb/mediatek.c
+++ b/drivers/usb/musb/mediatek.c
@@ -185,6 +185,7 @@ static int mtk_otg_switch_init(struct mtk_glue *glue)
 
 	role_sx_desc.set = musb_usb_role_sx_set;
 	role_sx_desc.get = musb_usb_role_sx_get;
+	role_sx_desc.allow_userspace_control = true;
 	role_sx_desc.fwnode = dev_fwnode(glue->dev);
 	role_sx_desc.driver_data = glue;
 	glue->role_sw = usb_role_switch_register(glue->dev, &role_sx_desc);
-- 
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
