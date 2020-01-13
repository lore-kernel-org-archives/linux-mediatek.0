Return-Path: <SRS0=6pE3=3C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85EA1C33CA8
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2020 04:01:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BEFF2082E
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2020 04:01:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fKlOiCn0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="X3m4OSW+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BEFF2082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p37BXnZVwXoMrc+a4e3Uuz4KJ1qVx0w2oqkW2II33Cs=; b=fKlOiCn0nQvGN7
	fxwOOYMl7aNXAqRSa7w0Gt7I2+/97ZJrCtTvwySF0/sTOZm1e1m7M0ajsq3xyF6F5DTiTeCReMxKF
	4Hxsy2ayuGv61J5oirGf//ASi7wcPKoE26rJ8X4qUrLrmfGtsQIGwM5oRzhGxpTLBuP44Wz+5UlG0
	VTIFpfjdGusdBPqdwokTeDnD+6cDlB+QVdz+SjyR98HeA6nqGosKX7TFtukP3OVnnGSAnDo0tF9FA
	ud5Fn1f4Qz65v78K55yR8awynS24/tv0VuQIABuQKe5FzBx+ryF0kuCiS5GKFusCUNx91uN/Y7zbK
	R0vSNfnQnT8QHMFsbItg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqqv9-0001bM-AK; Mon, 13 Jan 2020 04:01:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqqv3-0001aI-BD; Mon, 13 Jan 2020 04:01:41 +0000
X-UUID: 397c2edfa6e3469b819101ca71117501-20200112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=GEn5TTMvrgKaWqCbybjZ0pxAsz0JFNP9RC57YNtlclc=; 
 b=X3m4OSW+4cHAptNvYyoqp1zWqZQdhwEdop3Q/rf/81Ngd6fbg8uXcHvoGEUw0i+Q/n9x4tMv89yjj3JtD0tidhjHcPJFHbcKJgyT3pxV8eoXBDSoQz9Kx1rKfk/8k1OEXF8WayyD6+wO0RZGxJoSoBXih3kASu2rBGDWs4YtY7Y=;
X-UUID: 397c2edfa6e3469b819101ca71117501-20200112
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <maoguang.meng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 357087675; Sun, 12 Jan 2020 20:01:31 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 12 Jan 2020 19:53:05 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 13 Jan 2020 11:51:06 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 13 Jan 2020 11:52:35 +0800
From: <maoguang.meng@mediatek.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>
Subject: [PATCH 1/1] media: platform: VIDEO_MEDIATEK_JPEG can also depend on
 MTK_IOMMU
Date: Mon, 13 Jan 2020 11:52:02 +0800
Message-ID: <20200113035202.7797-1-maoguang.meng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6669261D4D362FA0B90A9D2C43FB1733D5513E1AEFCDD470B21449EB489B41AA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200112_200137_396867_EA5C56D6 
X-CRM114-Status: UNSURE (   9.53  )
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
Cc: Xia Jiang <xia.jiang@mediatek.com>, devicetree@vger.kernel.org,
 Maoguang Meng <maoguang.meng@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Maoguang Meng <maoguang.meng@mediatek.com>

mediatek jpeg codec driver can depend on MTK_IOMMU or MTK_IOMMU_V1

Change-Id: I78979af924d4fd52a3641eff1463a10d6e1d465f
Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
---
 drivers/media/platform/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index e84f35d3a68e..85377c88e91a 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -200,7 +200,7 @@ config VIDEO_IMX_PXP
 
 config VIDEO_MEDIATEK_JPEG
 	tristate "Mediatek JPEG Codec driver"
-	depends on MTK_IOMMU_V1 || COMPILE_TEST
+	depends on MTK_IOMMU_V1 || MTK_IOMMU || COMPILE_TEST
 	depends on VIDEO_DEV && VIDEO_V4L2
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	select VIDEOBUF2_DMA_CONTIG
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
