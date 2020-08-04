Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD630C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 03:43:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C472420792
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 03:43:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N/C7mFzU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WPRdI8m2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C472420792
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hqR6l9GZDFSbk+4UzZWf/L9Ya2DUvUP5SWo/5m++tVI=; b=N/C7mFzUh2HMPpYYOUb1aiyGH
	qsipatAh9JyUHwOslAOFS9YGe/pXmO8DFEUce9v4AUblycOIvQM4J8MEhO23xP8+0R1GIv330hR4O
	Mcet6NBrvoaDM4GW3Si1EVgYR0/L9DkP3LI77A0KK+CAYb86M79zoR3VirT8rkR+jBNVoHTf1kPMh
	Vq030Wr/E8Dtzr+L/JVogJhDwS7WI36ON0S1ttgEstG/MNmiANN112JyEt+bs4wk2lJamQyuL+uVg
	tg3BOHoWSiDy0c3YPd6EAZQ5cTuEllFjWlUhS+HQRShutk9mNkXTOkhI44e/ukT5zZlxFUAWhySte
	/UQNZkDRA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2nrP-0006Zr-9j; Tue, 04 Aug 2020 03:43:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2nqw-0006AW-N0; Tue, 04 Aug 2020 03:43:04 +0000
X-UUID: 984a5fbeebac406b8fd05999c5cc5dd7-20200803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=rYpLFAoqPGKTArw7ixSsCj9ANtpW/oxOXty5Oluqnk4=; 
 b=WPRdI8m2gO+dSRiQybpqqm/x1An2I+yGLiBzTDtOlKPuq38BF+nvojEY9B6WvVQpPAQMVVEtglGKbH8UynnEQbaJTRae7E2KwoakBlo0CrrOXdx8in4yY3KLvIUhUDrmkPiRarppdVlHzJDhxMg4G424fr+XKOQRL6Ry1PZzsPc=;
X-UUID: 984a5fbeebac406b8fd05999c5cc5dd7-20200803
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1387122277; Mon, 03 Aug 2020 19:42:51 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 20:42:10 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Aug 2020 11:42:12 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 4 Aug 2020 11:42:10 +0800
From: Xia Jiang <xia.jiang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>
Subject: [PATCH v11 25/28] media: platform: Rename jpeg dec file name
Date: Tue, 4 Aug 2020 11:40:59 +0800
Message-ID: <20200804034102.22983-26-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200804034102.22983-1-xia.jiang@mediatek.com>
References: <20200804034102.22983-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_234302_937338_67E3A516 
X-CRM114-Status: GOOD (  15.09  )
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
Cc: maoguang.meng@mediatek.com, devicetree@vger.kernel.org,
 mojahsu@chromium.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 senozhatsky@chromium.org, drinkcat@chromium.org,
 linux-mediatek@lists.infradead.org, Xia Jiang <xia.jiang@mediatek.com>,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Rename the files which are for decode feature. This is preparing
path since the jpeg enc patch will be added later.

Reviewed-by: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
---
v11: no changes
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
index 47d570f32e3f..5e57aed2e90f 100644
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
index 68abcfd7494d..afbbfd5d02bc 100644
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
index 7b0687f8f4b6..1cc37dbfc8e7 100644
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
