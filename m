Return-Path: <SRS0=Sq/6=FO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD0E6C4167B
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 05:41:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E4C623D4D
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 05:41:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E4C623D4D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7ie7BDUUVaP3QEUWG9UxrAo9MadyZIJZmoH9DbK5Mog=; b=Aldg5Zytmb084qhObKuV/xlx9m
	jgpxt+O51EYDDBHLnb/tIqwQMVD7uUEMLWO45RZY/JN4dur+BYlBux+Tv8TIYjR4iPqaB2OzJp6Z5
	hRMxMOXz4rR/8bHFz2EC9cZy04HVFzSNwcGtgnY76q0hVW5CSsP0736Kky8ppVyAdsDaEO3exyjKB
	uEnZFHPI2zGm9FWS4bjGzhkU8qf1qmStVutJNunB+603OZzeYWlbJm1FcNKFIoDFR09+NSdfdAnxw
	5aFzvIGtB+5SSztdmUmJhi59lMP7E6hRg6nr15PLJDvHZe9+4Xkv9ptr/OpM+bBn3skkoYxl1yb0C
	3V5+xrlQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knEhx-0006Fj-1Z; Thu, 10 Dec 2020 05:41:41 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knEht-0006EE-N3
 for linux-mediatek@lists.infradead.org; Thu, 10 Dec 2020 05:41:39 +0000
Received: by mail-pf1-x44a.google.com with SMTP id t8so2814832pfl.17
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Dec 2020 21:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=9quLWJEm+rPvZAGQXcN5gOWEhxtotZRuaHXyV7zIGTY=;
 b=XwleTwVI+9B1jHssMZnSKNKiN15cvKrAwjY55YjpspYNEBIVxBM8XUEMIb4fMhVM4+
 4hDHcCXML2YInFBu1CbhuseIIDxPkQE1QZYVLH8vH/ko8JxzkF7Lfn7/t1viQhw2pJy8
 nLECRbUz+WDonYzm/grwNNvA2a+z+tyazVbAKp9UHBrw/ZuQCSLMtz2fCcDDT0h1zOoM
 pBo6yOFxmQDp3TeBXNaPOE1HvkIow4I0OKSONq7fQ4li1ps0meT8pK74OCBtRbjHVYUT
 rgiorFxnNRyubCKv+ipiRbO8Q3XmlawYZNXXz1wnBwos6M3IQ6QWvQuuCWmQN5u1/Kwj
 ZKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=9quLWJEm+rPvZAGQXcN5gOWEhxtotZRuaHXyV7zIGTY=;
 b=BxcxoKXsFvITOTd5zRfPgPleH63v16RwxnPyD0zOv3rw4p8D2LN2GP5JD+I8NUwCQd
 w4hMVsx7shqN6YavYKrstxgjV4tDFhR43J6d7yu1waAeaEKB8awlZTyr3QsVgVxHj+60
 HyoRXA2CtprZ/ylBKwYDGCOyVBgBoZu+bOTw4U5vVpQp5i6OF+PrLfFQZey6oJW836ro
 7rS5m26Ub1QJ2vFLsR04mAGi2igJ1qatC9jigOpuP9hMbPzMPaibg/Zk7XI2dn8Cye3g
 pRCKjKC7PTPFVphloKjoly1OHJlL+DFO0XtS4TRUq62vIGrwUh3VypDYhKc8dr/F288H
 hkag==
X-Gm-Message-State: AOAM532FJfnLwhJlEEY9ZTiZ7awF4DAHil0iTnMpTJbk7s1me9ejJSr0
 PZI9lTCCsSfkqFF81+FdUF3dUNjX9c8G
X-Google-Smtp-Source: ABdhPJz6L6x6bm6k7FONoJ2bdSKbOIfOGHcWhhpnDLyuHCx3UBkzC91bCPbNWUXMoMwPnamDKbYrlHRGavac
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a17:902:a986:b029:db:cb2b:8bdb with SMTP
 id bh6-20020a170902a986b02900dbcb2b8bdbmr5016734plb.40.1607578893170; Wed, 09
 Dec 2020 21:41:33 -0800 (PST)
Date: Thu, 10 Dec 2020 13:41:09 +0800
Message-Id: <20201210054109.587795-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
Subject: [PATCH] remoteproc/mediatek: change MT8192 CFG register base
From: Tzung-Bi Shih <tzungbi@google.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_004137_841597_5C2BB458 
X-CRM114-Status: UNSURE (   7.94  )
X-CRM114-Notice: Please train this message.
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
Cc: matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 linux-remoteproc@vger.kernel.org, tzungbi@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The correct MT8192 CFG register base is 0x20000 off.  Changes the
registers accordingly.

Fixes: fd0b6c1ff85a ("remoteproc/mediatek: Add support for mt8192 SCP")
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/remoteproc/mtk_common.h | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index b3397d327786..fb022ff93dc1 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -32,22 +32,22 @@
 #define MT8183_SCP_CACHESIZE_8KB	BIT(8)
 #define MT8183_SCP_CACHE_CON_WAYEN	BIT(10)
 
-#define MT8192_L2TCM_SRAM_PD_0		0x210C0
-#define MT8192_L2TCM_SRAM_PD_1		0x210C4
-#define MT8192_L2TCM_SRAM_PD_2		0x210C8
-#define MT8192_L1TCM_SRAM_PDN		0x2102C
-#define MT8192_CPU0_SRAM_PD		0x21080
-
-#define MT8192_SCP2APMCU_IPC_SET	0x24080
-#define MT8192_SCP2APMCU_IPC_CLR	0x24084
+#define MT8192_L2TCM_SRAM_PD_0		0x10C0
+#define MT8192_L2TCM_SRAM_PD_1		0x10C4
+#define MT8192_L2TCM_SRAM_PD_2		0x10C8
+#define MT8192_L1TCM_SRAM_PDN		0x102C
+#define MT8192_CPU0_SRAM_PD		0x1080
+
+#define MT8192_SCP2APMCU_IPC_SET	0x4080
+#define MT8192_SCP2APMCU_IPC_CLR	0x4084
 #define MT8192_SCP_IPC_INT_BIT		BIT(0)
-#define MT8192_SCP2SPM_IPC_CLR		0x24094
-#define MT8192_GIPC_IN_SET		0x24098
+#define MT8192_SCP2SPM_IPC_CLR		0x4094
+#define MT8192_GIPC_IN_SET		0x4098
 #define MT8192_HOST_IPC_INT_BIT		BIT(0)
 
-#define MT8192_CORE0_SW_RSTN_CLR	0x30000
-#define MT8192_CORE0_SW_RSTN_SET	0x30004
-#define MT8192_CORE0_WDT_CFG		0x30034
+#define MT8192_CORE0_SW_RSTN_CLR	0x10000
+#define MT8192_CORE0_SW_RSTN_SET	0x10004
+#define MT8192_CORE0_WDT_CFG		0x10034
 
 #define SCP_FW_VER_LEN			32
 #define SCP_SHARE_BUFFER_SIZE		288
-- 
2.29.2.576.ga3fc446d84-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
