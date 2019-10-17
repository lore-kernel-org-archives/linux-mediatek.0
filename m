Return-Path: <SRS0=0H6n=YK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C83FA3732
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2019 08:42:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B2D521835
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2019 08:42:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vt19rk9v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B2D521835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4DzU8O0wRs4yHiBJzEGOiFj7sSueaWwUaBd+lE5qHwU=; b=Vt19rk9vxFxCea
	cZ+QlCq0qtTbn8E1LwbrDmvz+CHA27oS3Vt0uozeKwsN54Yv8IP9NZbyhEiRhVpTESIh5pdSIp/hG
	8piP7ihZS0szVD3MC7wiSQucDYE3e3ptTyCehX7PzAcX9jDZAS4zwcnS7y81WfdoY3+T5df97AtDj
	xsKElP7tM5BUSQWMcHR/r6Yu870vFb0eNOM3ht7GiMemGiiK2Ys/LqmB1+zCd+1oVLvvEYSjsxpv8
	DIy4DmZj96n0r2KpRwBi9g9u+GgCWEt35IsPjmjBfRamDNojgtxg5cCjZuJH9LO2pnY9T3kCwMLdQ
	teGcgn2FkXOhHExTBJiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iL1MW-0001ae-KE; Thu, 17 Oct 2019 08:42:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iL1Lp-00012j-8M; Thu, 17 Oct 2019 08:41:43 +0000
X-UUID: ceda2c84315b49c695b4887cf965db64-20191017
X-UUID: ceda2c84315b49c695b4887cf965db64-20191017
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2032805709; Thu, 17 Oct 2019 00:41:29 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 17 Oct 2019 01:41:14 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 17 Oct 2019 16:41:12 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 17 Oct 2019 16:41:12 +0800
From: Xia Jiang <xia.jiang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>
Subject: [PATCH v4 3/5] media: platform: Rename jpeg dec file name
Date: Thu, 17 Oct 2019 16:40:34 +0800
Message-ID: <20191017084033.28299-4-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191017084033.28299-1-xia.jiang@mediatek.com>
References: <20191017084033.28299-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191017_014141_320092_5623194E 
X-CRM114-Status: UNSURE (   8.54  )
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
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Rename the files which are for decode feature. This is preparing
path since the jpeg enc patch will be added later.

Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
---
v4: no changes

v3: no changes

v2: no changes
---
 drivers/media/platform/mtk-jpeg/Makefile                      | 2 +-
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c               | 4 ++--
 .../platform/mtk-jpeg/{mtk_jpeg_hw.c => mtk_jpeg_dec_hw.c}    | 2 +-
 .../platform/mtk-jpeg/{mtk_jpeg_hw.h => mtk_jpeg_dec_hw.h}    | 2 +-
 .../mtk-jpeg/{mtk_jpeg_parse.c => mtk_jpeg_dec_parse.c}       | 2 +-
 .../mtk-jpeg/{mtk_jpeg_parse.h => mtk_jpeg_dec_parse.h}       | 2 +-
 .../platform/mtk-jpeg/{mtk_jpeg_reg.h => mtk_jpeg_dec_reg.h}  | 0
 7 files changed, 7 insertions(+), 7 deletions(-)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_hw.c => mtk_jpeg_dec_hw.c} (99%)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_hw.h => mtk_jpeg_dec_hw.h} (98%)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_parse.c => mtk_jpeg_dec_parse.c} (98%)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_parse.h => mtk_jpeg_dec_parse.h} (92%)
 rename drivers/media/platform/mtk-jpeg/{mtk_jpeg_reg.h => mtk_jpeg_dec_reg.h} (100%)

diff --git a/drivers/media/platform/mtk-jpeg/Makefile b/drivers/media/platform/mtk-jpeg/Makefile
index 92a4fc046bfe..48516dcf96e6 100644
--- a/drivers/media/platform/mtk-jpeg/Makefile
+++ b/drivers/media/platform/mtk-jpeg/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
-mtk_jpeg-objs := mtk_jpeg_core.o mtk_jpeg_hw.o mtk_jpeg_parse.o
+mtk_jpeg-objs := mtk_jpeg_core.o mtk_jpeg_dec_hw.o mtk_jpeg_dec_parse.o
 obj-$(CONFIG_VIDEO_MEDIATEK_JPEG) += mtk_jpeg.o
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index ee802fc3bcdf..5f0990fce8ef 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -23,9 +23,9 @@
 #include <media/videobuf2-dma-contig.h>
 #include <soc/mediatek/smi.h>
 
-#include "mtk_jpeg_hw.h"
+#include "mtk_jpeg_dec_hw.h"
 #include "mtk_jpeg_core.h"
-#include "mtk_jpeg_parse.h"
+#include "mtk_jpeg_dec_parse.h"
 
 static struct mtk_jpeg_fmt mtk_jpeg_formats[] = {
 	{
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
similarity index 99%
rename from drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.c
rename to drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
index ddf0dfa78e20..922dbe421fae 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
@@ -9,7 +9,7 @@
 #include <linux/kernel.h>
 #include <media/videobuf2-core.h>
 
-#include "mtk_jpeg_hw.h"
+#include "mtk_jpeg_dec_hw.h"
 
 #define MTK_JPEG_DUNUM_MASK(val)	(((val) - 1) & 0x3)
 
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h
similarity index 98%
rename from drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.h
rename to drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h
index 9c6584eaad99..a37be1a48415 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_hw.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h
@@ -11,7 +11,7 @@
 #include <media/videobuf2-core.h>
 
 #include "mtk_jpeg_core.h"
-#include "mtk_jpeg_reg.h"
+#include "mtk_jpeg_dec_reg.h"
 
 enum {
 	MTK_JPEG_DEC_RESULT_EOF_DONE		= 0,
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_parse.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_parse.c
similarity index 98%
rename from drivers/media/platform/mtk-jpeg/mtk_jpeg_parse.c
rename to drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_parse.c
index f862d38f3af7..b95c45791c29 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_parse.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_parse.c
@@ -8,7 +8,7 @@
 #include <linux/kernel.h>
 #include <linux/videodev2.h>
 
-#include "mtk_jpeg_parse.h"
+#include "mtk_jpeg_dec_parse.h"
 
 #define TEM	0x01
 #define SOF0	0xc0
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_parse.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_parse.h
similarity index 92%
rename from drivers/media/platform/mtk-jpeg/mtk_jpeg_parse.h
rename to drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_parse.h
index 0a48eeabaff2..2918f15811f8 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_parse.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_parse.h
@@ -8,7 +8,7 @@
 #ifndef _MTK_JPEG_PARSE_H
 #define _MTK_JPEG_PARSE_H
 
-#include "mtk_jpeg_hw.h"
+#include "mtk_jpeg_dec_hw.h"
 
 bool mtk_jpeg_parse(struct mtk_jpeg_dec_param *param, u8 *src_addr_va,
 		    u32 src_size);
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_reg.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_reg.h
similarity index 100%
rename from drivers/media/platform/mtk-jpeg/mtk_jpeg_reg.h
rename to drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_reg.h
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
