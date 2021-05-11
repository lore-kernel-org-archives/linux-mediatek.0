Return-Path: <SRS0=qC7P=KG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4025BC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 10:21:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9D1B61400
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 10:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9D1B61400
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ezy8k7BYDteZtjBrKoxk8mOFuvpor5t+E6a0rNle7UU=; b=dJ8xludUt5vd3rqSOWqHBIB7aT
	0QUSxhdwaTPQsVUkJ5F4r+43cMdWIXKSNk0X7IiG/De5j6nMEObVu0/955NdZUubze+PLT/3Fn31f
	E1M525YlFIrJ4EakRhZw/T9AhylE/wRmC8Anb6j/98qna8YXLG8Ukse7RsWDIXM4LSTy1a5rftPiR
	6WY2kx1sXagr+fw1WHp+GcUIRZqT/OgyJZgSLOIAYaDhXznE4hmvnfbJiIBxTwS0FL3YpBauClKuf
	n6xfrzBzhMCLi57gKScxkbonv9idv44XtHQCseCvroYqYyED3AFXkjVE9vznMKSfzcwxaT12MjeyR
	FYi7zs7g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgPWE-00GtkN-NG; Tue, 11 May 2021 10:21:38 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgJEZ-00GCMo-W4; Tue, 11 May 2021 03:39:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=H5fKaZhEu0VDGMo0n7tvh8MHJjbXXtqzNPrLukHR5vg=; b=vzMRhOxvhmakSqBBnLzvCgFU1E
 tUyHJrkOi4VhyHa1KUWj0aqfZoQh/yT5luKKO6PevS/omCP8BqAyTPZRgokEPK+WoEqEw+ri2a4zA
 Z5iyMdumC5DRcG8G0KWIsDuBekR1WDgJ+g+/vA6fmPzDe8y5qfii8P5CxwYTdQdGluZv8bf6Rr95Y
 DGxiU1BKqUAUPolDMKUrD3mqyeavYoaSgS4LinfHczG8ee5lIO1dfyhHjpm5/hUDtXwGLgqE0JUrm
 pc4AM3ZZXU08ZA0tRmQr+oRXaAr864m36E868qtdtDW0eOgcettcW2kb/naQHWk93sL3nHWkWqW3Q
 DP9UDkKQ==;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgJEX-009HY3-7b; Tue, 11 May 2021 03:38:58 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FfNqz62BMz1BLBh;
 Tue, 11 May 2021 11:36:15 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Tue, 11 May 2021 11:38:47 +0800
From: Zou Wei <zou_wei@huawei.com>
To: <matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Zou Wei
 <zou_wei@huawei.com>
Subject: [PATCH -next] soc: mediatek: add missing MODULE_DEVICE_TABLE
Date: Tue, 11 May 2021 11:55:50 +0800
Message-ID: <1620705350-104687-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_203857_457163_04600D45 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_203857_457163_04600D45 
X-CRM114-Status: UNSURE (   4.69  )
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

This patch adds missing MODULE_DEVICE_TABLE definition which generates
correct modalias for automatic loading of this driver when it is built
as an external module.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 drivers/soc/mediatek/mtk-devapc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
index f1cea04..7c65ad3 100644
--- a/drivers/soc/mediatek/mtk-devapc.c
+++ b/drivers/soc/mediatek/mtk-devapc.c
@@ -234,6 +234,7 @@ static const struct of_device_id mtk_devapc_dt_match[] = {
 	}, {
 	},
 };
+MODULE_DEVICE_TABLE(of, mtk_devapc_dt_match);
 
 static int mtk_devapc_probe(struct platform_device *pdev)
 {
-- 
2.6.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
