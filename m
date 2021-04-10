Return-Path: <SRS0=+aVJ=JH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF32C43460
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 09:14:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFE3B61165
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 09:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFE3B61165
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o9vondI2pOgoOXc8NPv8ZBNqMP3XREyUZCXiwaLjcdk=; b=oFtYsaZ9ajHFm0Daf6JuGmAK1
	uM8Rl+BL0EGk7HZi4Mzl4prt9t1ylqMmVxl6dgdE6vtiCccILUC1DDZkkMQYEYnqDbzpeSgx0m9Fk
	nCqC9sHxVw2Nz88NLtSYUUuxXhuMW9bfiOg0vBMBC4IYcXf64er16cz1MLKUCPqyzqJOyynrrqgHo
	EnCOG3v17CscS0+93Cuddy773LUQCsHKNI7Y9n4nSZ/KWvqAfVqWpcg5xiuIyL8FbyFaq2/b4ex5h
	yg8dcqWinKhgHDU01KXNDIuG2DLo5Affyp+Ny52tLfXuS2Lti6UYCY8xGn0079NAJCnl3gE5rnRcj
	omv2Giudg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lV9gW-002V4u-Bv; Sat, 10 Apr 2021 09:13:46 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV9fd-002Uli-GT; Sat, 10 Apr 2021 09:12:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=M9Vz0FOnN+z40LckUu62C3P73ZLSQdl6aie3PsXNQ/A=; b=ta1GB6pTmHkZ2bFDTxJ3E+jat2
 eZae5rV+TsvNaC+M5UM66nM4uP7Mg/Th8foM4DkLq1fsINQmcmh98cRQhKsk5lm9rmZ0VtTXlzFOb
 p1JVI8qRua/wzcXctVVMeYmZD/hKaPQiMnCLDEW1EABlGhknjBd8OQ5En75VAjZiIoML5sI10b4nR
 RjUACKT4fESSrCKbzkIcyZX1ULSjVCSeXQDU8viE3awVEqzO5okAmLqYJh0ZQJ/hmMUTxXYb8A3qz
 giOKUNkjlfMNKFe8QxH16A/O8MB7ZbbggDrxlkMuV4WBzQTDNvSAursopgv5RMfzO3KoeN7mr13e6
 mX+QKhaw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV9fa-0050IL-Kw; Sat, 10 Apr 2021 09:12:47 +0000
X-UUID: d2e321c8a219491c873f232751d982eb-20210410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=M9Vz0FOnN+z40LckUu62C3P73ZLSQdl6aie3PsXNQ/A=; 
 b=DH5r24jqWVTE7gyceEivhXXPQxeecx88eiFSG3+x6eq/QSMBpuRzuvc5cuuRISQHzxSum+P7E1lKQH+O00Y2+qSTeouAXVlIfeFFTjPriGDlILXDjeu0E7WVk+FpEyO7VDB5plrXnpOjLxZ6C5L/BJCs+rm604ostXqLEEuDbYI=;
X-UUID: d2e321c8a219491c873f232751d982eb-20210410
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1181329245; Sat, 10 Apr 2021 02:12:45 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Apr 2021 02:12:44 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Apr 2021 17:12:42 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 10 Apr 2021 17:12:41 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
CC: Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 <yong.wu@mediatek.com>, <youlin.pei@mediatek.com>, Nicolas Boichat
 <drinkcat@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 <anan.sun@mediatek.com>, <chao.hao@mediatek.com>,
 <ming-fan.chen@mediatek.com>, <yi.kuo@mediatek.com>, <eizan@chromium.org>,
 <acourbot@chromium.org>, Xia Jiang <xia.jiang@mediatek.com>
Subject: [PATCH v5 05/16] media: mtk-jpeg: Use pm_runtime_resume_and_get for
 PM get_sync
Date: Sat, 10 Apr 2021 17:11:17 +0800
Message-ID: <20210410091128.31823-6-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210410091128.31823-1-yong.wu@mediatek.com>
References: <20210410091128.31823-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210410_021246_709707_A3CBF577 
X-CRM114-Status: GOOD (  12.35  )
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

pm_runtime_get_sync will increment pm usage counter even it failed.
This patch use pm_runtime_resume_and_get instead of pm_runtime_get
to keep usage counter balanced.

CC: Xia Jiang <xia.jiang@mediatek.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index 88a23bce569d..a89c7b206eef 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -920,7 +920,7 @@ static void mtk_jpeg_enc_device_run(void *priv)
 	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
 
-	ret = pm_runtime_get_sync(jpeg->dev);
+	ret = pm_runtime_resume_and_get(jpeg->dev);
 	if (ret < 0)
 		goto enc_end;
 
@@ -973,7 +973,7 @@ static void mtk_jpeg_dec_device_run(void *priv)
 		return;
 	}
 
-	ret = pm_runtime_get_sync(jpeg->dev);
+	ret = pm_runtime_resume_and_get(jpeg->dev);
 	if (ret < 0)
 		goto dec_end;
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
