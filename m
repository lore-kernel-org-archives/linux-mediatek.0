Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3772C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 08:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0SodUlaSuF6UgjcppiPefQyCKzNhd6ShSwoY105PiNM=; b=SrPBbjXKhkCqzp
	E6kKvZcyX0JtHPo5MxOhH8BY2U/C2mlfpk9jFYTGJoCj95daZor3LVeBB2xi0pzaQQceiIM+akGjF
	VVH2utzXl2qSUCApnjP9bPAyO3sCm20fwSp+pMCJhk/Va5EHGLQlMIpdZ93TLAYyAVpkV0DMeuYcm
	E4kC5ciIjkAgXDkTK8e7IgeTO3WhNJVKYAclJXboXq213ou6EwqbLTRXepWV2xGKMoFVfhesbneTL
	PPXx4rQUmpmEvwDJQ5fY8+RtKeNAejWOFdhDrWuVro9CPLu7Co8/orZLjw+h5kBZi5LcM7Ai4j2SH
	ZgS/y3NllIEcGKxhG6lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7CSB-00FISd-P9; Tue, 11 Jan 2022 08:24:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7CRx-00FIOt-V2; Tue, 11 Jan 2022 08:24:17 +0000
X-UUID: feebf9b9aea940aa8e26a957cc0baa72-20220111
X-UUID: feebf9b9aea940aa8e26a957cc0baa72-20220111
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1519035974; Tue, 11 Jan 2022 01:24:11 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 Jan 2022 00:21:44 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 11 Jan 2022 16:21:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 11 Jan 2022 16:21:30 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>, Zhang Rui
 <rui.zhang@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Miles Chen <miles.chen@mediatek.com>, <linux-pm@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/1] thermal: mtk_thermal: fix kernel-doc warnings
Date: Tue, 11 Jan 2022 16:21:27 +0800
Message-ID: <20220111082129.13459-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_002414_027756_0DB3937F 
X-CRM114-Status: GOOD (  10.54  )
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

Fix kernel-doc warnings:
drivers/thermal/mtk_thermal.c:562: warning: expecting prototype for raw_to_mcelsius(). Prototype was for raw_to_mcelsius_v1() instead

Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/thermal/mtk_thermal.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index ede94eadddda..0df369edfb7a 100644
--- a/drivers/thermal/mtk_thermal.c
+++ b/drivers/thermal/mtk_thermal.c
@@ -550,7 +550,7 @@ static const struct mtk_thermal_data mt8183_thermal_data = {
 };
 
 /**
- * raw_to_mcelsius - convert a raw ADC value to mcelsius
+ * raw_to_mcelsius_v1 - convert a raw ADC value to mcelsius v1
  * @mt:	The thermal controller
  * @sensno:	sensor number
  * @raw:	raw ADC value
@@ -573,6 +573,15 @@ static int raw_to_mcelsius_v1(struct mtk_thermal *mt, int sensno, s32 raw)
 	return mt->degc_cali * 500 - tmp;
 }
 
+/**
+ * raw_to_mcelsius_v2 - convert a raw ADC value to mcelsius v2
+ * @mt:	The thermal controller
+ * @sensno:	sensor number
+ * @raw:	raw ADC value
+ *
+ * This converts the raw ADC value to mcelsius using the SoC specific
+ * calibration constants
+ */
 static int raw_to_mcelsius_v2(struct mtk_thermal *mt, int sensno, s32 raw)
 {
 	s32 format_1;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
