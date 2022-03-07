Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A85C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 12:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PLpEfbr/jNhR840sMgFAyYd9mxy9IS7ldIhn9zaLp6s=; b=OQbVi69tTGCHC4
	GhMcC8bZat5+oQ7a5rHD8UDrzcJMWWXyvT8XcpC7ea56BgwYQeIC5hvS5I8yCzTaXVCVecs0MYi08
	tnksIkOo7qcigE+4mvcog8N9vcjIMcHriNzFlbSdMx3J6JMv/dRDKO7nir6GlgnlZ3Owu9MjAXpOA
	tS45IX4xmtjD6Wmda6mBGp7luh6KI7nC0dNm8mnXc5Er9rELeAEUEnEkutiXSYUpayFNldIJWMzV1
	0C0Adp2qxlBF9gty1kbD+WL5Inosh81x9fr0u0gVieDaukLiQXvAK0ywHsy4PJJgKzGdSWb3nkIty
	4MjtVosn2QlLppi3lYEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRChY-0004pI-0p; Mon, 07 Mar 2022 12:43:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRCX2-0000zm-9P; Mon, 07 Mar 2022 12:32:12 +0000
X-UUID: 39e64019ac8a45108e31626d1234b761-20220307
X-UUID: 39e64019ac8a45108e31626d1234b761-20220307
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jia-wei.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1962515528; Mon, 07 Mar 2022 05:32:00 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Mar 2022 04:26:27 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 7 Mar 2022 20:26:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 7 Mar 2022 20:26:25 +0800
From: Tim Chang <jia-wei.chang@mediatek.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "Liam Girdwood" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 "Jia-Wei Chang" <jia-wei.chang@mediatek.com>
CC: <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <fan.chen@mediatek.com>,
 <louis.yu@mediatek.com>, <roger.lu@mediatek.com>,
 <Allen-yy.Lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>,
 Jia-Wei Chang <jia-wei.chang@mediatek.corp-partner.google.com>
Subject: [PATCH 3/3] devfreq: mediatek: add platform data to support mt8186
Date: Mon, 7 Mar 2022 20:25:13 +0800
Message-ID: <20220307122513.11822-4-jia-wei.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220307122513.11822-1-jia-wei.chang@mediatek.com>
References: <20220307122513.11822-1-jia-wei.chang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_043208_399489_138B968E 
X-CRM114-Status: GOOD (  10.86  )
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

add specific platform data to support mt8186.

Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.corp-partner.google.com>
---
 drivers/devfreq/mtk-cci-devfreq.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/devfreq/mtk-cci-devfreq.c b/drivers/devfreq/mtk-cci-devfreq.c
index 986f34689f5c..ade09794b404 100644
--- a/drivers/devfreq/mtk-cci-devfreq.c
+++ b/drivers/devfreq/mtk-cci-devfreq.c
@@ -439,8 +439,18 @@ static const struct mtk_ccifreq_platform_data mtk_platform_data = {
 	.need_voltage_tracking = false,
 };
 
+static const struct mtk_ccifreq_platform_data mt8186_platform_data = {
+	.min_volt_shift = 100000,
+	.max_volt_shift = 250000,
+	.proc_max_volt = 1118750,
+	.sram_min_volt = 850000,
+	.sram_max_volt = 1118750,
+	.need_voltage_tracking = true,
+};
+
 static const struct of_device_id mtk_ccifreq_machines[] = {
 	{ .compatible = "mediatek,mt8183-cci", .data = &mtk_platform_data },
+	{ .compatible = "mediatek,mt8186-cci", .data = &mt8186_platform_data },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, mtk_ccifreq_machines);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
