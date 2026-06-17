Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268F8CD98F2
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 02:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5adCbZjNc85uY/9brOf3vfwrOByakFrcAqPyeusAfU=; b=MI9o4Euvu0/Bz1P7wqZWIeNtER
	tBNyq7GAVTHSkFb/CCWROPbbmY96LOu9TRzlrOfmgYojEMPotZt5mH1MbfnwJaiEiEZVc2CJxxCCx
	i8jdkYwY881MdYlvb/qkAJ52EiWMowgbfQeFyk3xvC3peXziPcM8fSvYO3gD+ByUiifaCRGg5RkFl
	4n6GHxNRbYiYxFEOAGE69jt8WbgQEWfMyaZD2PwNtnC9vxTgZhCujcn4Z1jazR0WoXWUqnqdDWNjy
	cAhbOk1F+8dJnEZtMShyn8qVV8U7tL0r0pPHwqFYRQ/3zHzbbEhAK0TZdbxyYiel6FLWXH5u21opg
	+M4ubOpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZfsN-0000000GUCx-2kQ4;
	Wed, 17 Jun 2026 02:19:35 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZfsK-0000000GU94-2xAi
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 02:19:34 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-915aa0a9293so50393285a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Jun 2026 19:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781662771; x=1782267571; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5adCbZjNc85uY/9brOf3vfwrOByakFrcAqPyeusAfU=;
        b=nl4f9WpMH9fsvi2fpd7tW2EubitNm6MQNCfqjeWTtYCHaJdEl9mN+OmnjP1opM/u32
         HSnVHCsKeBJjdQd3PdR10JcCabzRQSQ/Kve52QTbI4KAs3jD6sLcFfXX/PEQH+wVjD4X
         3bI/3mUgdOh37CghOJ5uFf2eYHbYHh73deQAw/TBWTmZsZHhEXGexCrlvcMl145rgJcW
         X1JPGTJday7S+i0dsfvNEDoWt7WFu4fwGHv6SGx1SIw8imCxRC3gtl85HzaGUbBgxb4d
         QrhknbNjmWrgkCOyxozeZ34tpdjZ4reERnX/jTSCF+SFUFXxAfHc9GUbYikYjGYIdtQ/
         /OFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781662771; x=1782267571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d5adCbZjNc85uY/9brOf3vfwrOByakFrcAqPyeusAfU=;
        b=WegGZbL3Z1i22Ore4ean/iKj248kI5Oau8qZQC0RSjsphyDY2DjKd9HmeGK/9x77Ic
         FJJ623iJYzheslOAFn67Tm+f0s0F2TCgAr5+NzWsaDUoixdtYY3/A3lCchRaHWvSXPCs
         amaKIvgIkEgWnAgyeG4dvGqZQpJA82esmC01pKcZrLvZs+Ch4aQiINspa2dRDFzx+4bq
         neQATWIf48adVR+YrVmQRHurWme5QHrEyzV5wmTsd8QCtY2j5oxiU27Y9BJRcpBIE+az
         l8u9EDaZoF3CCiGFGQNCgPAg/jUxD8bJTFxU6Kjb6JReQucfCgC9gjiYml62YLzk5ijM
         VS5g==
X-Forwarded-Encrypted: i=1; AFNElJ+Vly1Jld7onCTOabMj62J6ig3czv73dJyBGhTiQkfRe2HS/WsSwgHtRdMFs3KRIYjuRa3sAzzk67ixQJ/NuA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyBSmcnuR0/X6b9WvDp2NHrrhXc5C7tTXxPMHZxRGjr4uZ/tXRL
	WSd4rjdxzJe1b83W9nPrNGDlmo0tWrTfnpvdIUvc1yiGZkyNAscwU+Mc
X-Gm-Gg: Acq92OF924s+qnaI2pEaYtIy11qlJAqYpehIK3caSuISd8XF/+fclop4mxaf4BtTR4N
	S17htHkHN6Ycr7FeKBCJ62lUQRZfRcRuc7DdNF6GmDos9mW2FVTylPmJ9yPHNqcjY0v1OohugUG
	G24UXdhNo5A4BwUbAlQPgxoXM/D82/NC7aqnxf9I8SW3uTIKlv/Qd0+Mx3SdL9h/pkK28ILgido
	rs5Pb0imETUzurMZeHz7/PUcXp/lDkS5r9I6DCmj3m0XecIyY1oSI9LCClVgybVKHhV3jHygIjK
	ymP2RmVRbRZIPjT3qAPEcWEhGd/FOUQJnxyB+3PpNeiEHO31YRX8LtV3P/AEOQ57k74r7GCA9gC
	q5azy/aRoaYLuuD7ye7esMe9fusph28gEQDvHWQ/JEOgP+aJ+7C1fOupQYFvq6MA0Y44yBWFgcy
	e0aYU8RY1kDSmWvAq/szq1hRiGkipJFtGmaGHrXrBuAY1n0zHIT5bgVnT6BKgUiHteYJAbfsBAK
	/pkf7aOzpZbyswgxzgVKOR+xKsgJS4v
X-Received: by 2002:a05:620a:1a0e:b0:916:5f5:de22 with SMTP id af79cd13be357-91dcabb0438mr183153085a.12.1781662771344;
        Tue, 16 Jun 2026 19:19:31 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a006e35sm1657646285a.28.2026.06.16.19.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 19:19:30 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Heiko Stuebner <heiko@sntech.de>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/9] media: hevc: add bounded tile-count helpers
Date: Tue, 16 Jun 2026 22:19:00 -0400
Message-ID: <20260617021906.2746743-4-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617021906.2746743-1-michael.bommarito@gmail.com>
References: <20260617021906.2746743-1-michael.bommarito@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_191932_819960_D8BC4862 
X-CRM114-Status: GOOD (  13.20  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The stateless HEVC decoders compute the number of tile columns and rows
from num_tile_columns_minus1 / num_tile_rows_minus1 and clamp it to the
column_width_minus1[] / row_height_minus1[] capacity before using it as a
loop bound. Add shared helpers in a new <media/v4l2-hevc.h> so the rkvdec
and hantro drivers do not each open-code the min_t() clamp.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 include/media/v4l2-hevc.h | 41 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 include/media/v4l2-hevc.h

diff --git a/include/media/v4l2-hevc.h b/include/media/v4l2-hevc.h
new file mode 100644
index 0000000000000..973c96be16be4
--- /dev/null
+++ b/include/media/v4l2-hevc.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Helper functions for HEVC stateless codecs.
+ */
+
+#ifndef _MEDIA_V4L2_HEVC_H
+#define _MEDIA_V4L2_HEVC_H
+
+#include <linux/minmax.h>
+#include <media/v4l2-ctrls.h>
+
+/**
+ * v4l2_hevc_pps_num_tile_columns - number of HEVC tile columns, bounded
+ * @pps: the V4L2 HEVC PPS control
+ *
+ * Return the number of tile columns (num_tile_columns_minus1 + 1) clamped to
+ * the capacity of column_width_minus1[]. The control validation already
+ * rejects out-of-range counts; this keeps the consuming drivers bounded too.
+ */
+static inline unsigned int
+v4l2_hevc_pps_num_tile_columns(const struct v4l2_ctrl_hevc_pps *pps)
+{
+	return min_t(unsigned int, pps->num_tile_columns_minus1 + 1,
+		     ARRAY_SIZE(pps->column_width_minus1));
+}
+
+/**
+ * v4l2_hevc_pps_num_tile_rows - number of HEVC tile rows, bounded
+ * @pps: the V4L2 HEVC PPS control
+ *
+ * Return the number of tile rows (num_tile_rows_minus1 + 1) clamped to the
+ * capacity of row_height_minus1[].
+ */
+static inline unsigned int
+v4l2_hevc_pps_num_tile_rows(const struct v4l2_ctrl_hevc_pps *pps)
+{
+	return min_t(unsigned int, pps->num_tile_rows_minus1 + 1,
+		     ARRAY_SIZE(pps->row_height_minus1));
+}
+
+#endif /* _MEDIA_V4L2_HEVC_H */
-- 
2.53.0


