Return-Path: <SRS0=QG8e=ND=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F12C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 09:21:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1510603E7
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 09:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1510603E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Fhs+j6l1at4SyJ//lefAMrfG5ovo2In3d7AU+dqFF8=; b=qNdaGYfjJMqrmI
	yyMbJpAWKhI5OPZ18/WzUheUo9DEb/5RkQt/iEOJckS6DY+S10OINIyJGaARfbNK0M5pLcqeYpfRE
	fMeETraCfTiFWrN+8lbbmGTKoF3QPsC4NKVvbjJGZbo69CJynTFPP8laSaohyU/hwBRSE2tGap0+s
	d05/mTEG3dzBO+f74lzlQpxYCVY4HpO2Cj50b4c2F5FUSc56FgiwreBjdNjWawXqSPXFrlmaBg+1R
	Q1jyX+3yKtdgH5tMuEc0wWWULoQh29jGtJpPttIcLwzqVMm9xTfR1Q52O9V3282N+tQzcrNua+FBn
	cn7CyHeZpQ3yHsiZSm4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE6tg-009OkG-6a; Thu, 12 Aug 2021 09:21:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE6jQ-009KLT-2o; Thu, 12 Aug 2021 09:10:35 +0000
X-UUID: 8207cd9f533f4734abe1a2aab957e503-20210812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=AbdnemaSpipUwUASkGLGfSuNSpF0P4AIiHKr+Xsp55Q=; 
 b=ID5lHbQObSDw1Z6J+kG530w2sLdQbTfowk5SeHuYD/TAwdM3pjI/NYUBT+I40zOSXfJ+c3kaTkgoQ+Vv33lpx3HwpKO6NzDlqxEvW1VlvF2y5CVsB8zhCs7DUT4JS2S8QGa4ktOvHoUL/tfJSSJ/ytSkvHV3FNz/29+YA7vAog8=;
X-UUID: 8207cd9f533f4734abe1a2aab957e503-20210812
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <dawei.chien@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 823736899; Thu, 12 Aug 2021 02:10:25 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 02:00:25 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 17:00:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 12 Aug 2021 17:00:23 +0800
From: Dawei Chien <dawei.chien@mediatek.com>
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>
CC: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat
 <drinkcat@google.com>, <devicetree@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 Fan Chen <fan.chen@mediatek.com>, Arvin Wang <arvin.wang@mediatek.com>,
 "James Liao" <jamesjj.liao@mediatek.com>, Dawei Chien
 <dawei.chien@mediatek.com>
Subject: [V11,PATCH 15/19] regulator: mediatek: add support for mt8195
Date: Thu, 12 Aug 2021 16:58:42 +0800
Message-ID: <20210812085846.2628-16-dawei.chien@mediatek.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210812085846.2628-1-dawei.chien@mediatek.com>
References: <20210812085846.2628-1-dawei.chien@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_021032_170555_C6688BF9 
X-CRM114-Status: GOOD (  11.98  )
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

add platform data on mt8195

Signed-off-by: Dawei Chien <dawei.chien@mediatek.com>
---
 drivers/regulator/mtk-dvfsrc-regulator.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/regulator/mtk-dvfsrc-regulator.c b/drivers/regulator/mtk-dvfsrc-regulator.c
index d3d876198d6e..1bd6e67b1de5 100644
--- a/drivers/regulator/mtk-dvfsrc-regulator.c
+++ b/drivers/regulator/mtk-dvfsrc-regulator.c
@@ -140,6 +140,25 @@ static const struct dvfsrc_regulator_init_data regulator_mt6873_data = {
 	.regulator_info = &mt6873_regulators[0],
 };
 
+static const unsigned int mt8195_voltages[] = {
+	550000,
+	600000,
+	650000,
+	750000,
+};
+
+static struct dvfsrc_regulator mt8195_regulators[] = {
+	MT_DVFSRC_REGULAR("dvfsrc-vcore", VCORE,
+			  mt8195_voltages),
+	MT_DVFSRC_REGULAR("dvfsrc-vscp", VSCP,
+			  mt8195_voltages),
+};
+
+static const struct dvfsrc_regulator_init_data regulator_mt8195_data = {
+	.size = ARRAY_SIZE(mt8195_regulators),
+	.regulator_info = &mt8195_regulators[0],
+};
+
 static const struct of_device_id mtk_dvfsrc_regulator_match[] = {
 	{
 		.compatible = "mediatek,mt8183-dvfsrc",
@@ -150,6 +169,10 @@ static const struct of_device_id mtk_dvfsrc_regulator_match[] = {
 	}, {
 		.compatible = "mediatek,mt6873-dvfsrc",
 		.data = &regulator_mt6873_data,
+	}, {
+		.compatible = "mediatek,mt8195-dvfsrc",
+		.data = &regulator_mt8195_data,
+	}, {
 	}, {
 		/* sentinel */
 	},
-- 
2.14.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
