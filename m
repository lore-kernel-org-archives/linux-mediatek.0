Return-Path: <SRS0=i2Ig=7C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28896C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 03:52:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFC2B204EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 03:52:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fbd6Bz8h";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QQtZzt6M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFC2B204EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pI7pyTYS5FwdF7rYr9qocYObPi+NvtlyXw9X4w6eLIo=; b=fbd6Bz8hhuZmhH
	EvcJB7+oI8Xp+mfmdbqDTk+OTS21CmNsYBGy89XncG5Kyhu3o3JrJIpOCOaSd0c8WXLLvX//TAEwl
	qRxH8wwij4+9hCWBIR62BWwQwsMJt5T0EOj85+K7jLlhKE0HwWtPYw8PvnSWf1KGlTsy10JXLiiqr
	O7AYJo5F+tK6Yh7+ktQgNV+DnI0Yjm+SN+nT8qHqkRq7/1ZA9ZgBPm+jayMvF1YMo4YXJa110ESyP
	9Wres7L/vwTkVJkLnecMtXgXxKFA2R/lMgqboHkJsc3X33ihCiltKxYf9j1mahMJGTcytVY+ugHO1
	GJ87ctY3nTNY6MRqHv6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbFly-0007Dc-A6; Wed, 20 May 2020 03:52:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbFlv-0007BO-1C; Wed, 20 May 2020 03:52:00 +0000
X-UUID: 418de52126ef401ca239b91f52a7c430-20200519
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=R6JEdcDnArnUkHDdGSE+ox37fVi8S9PPwN9cXFcnjLM=; 
 b=QQtZzt6MtWnUhEtRgJYkevMkTrDhaeOBb7e41OedlD4LaKgI4AvJYcughFL2eclFLSE4FnU40EY0n+ZFbUeXxqJhYjGFEGcBaI5SECNaUYKB5rsNXcM2yCKPE3HJHCnY9aNqyUO10XbjEBkPeXndZrjiEaRIuJUb0HU6AmPIcD4=;
X-UUID: 418de52126ef401ca239b91f52a7c430-20200519
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <andrew-sh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2096889539; Tue, 19 May 2020 19:51:55 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 19 May 2020 20:43:36 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 May 2020 11:43:35 +0800
Received: from mtkslt209.mediatek.inc (10.21.15.96) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 20 May 2020 11:43:35 +0800
From: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, "Rob
 Herring" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 Viresh Kumar <viresh.kumar@linaro.org>, Nishanth Menon <nm@ti.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>
Subject: [PATCH 12/12] devfreq: mediatek: cci devfreq register opp
 notification for SVS support
Date: Wed, 20 May 2020 11:43:07 +0800
Message-ID: <20200520034307.20435-13-andrew-sh.cheng@mediatek.com>
X-Mailer: git-send-email 2.12.5
In-Reply-To: <20200520034307.20435-1-andrew-sh.cheng@mediatek.com>
References: <20200520034307.20435-1-andrew-sh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_205159_086590_B5E9235B 
X-CRM114-Status: GOOD (  12.50  )
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
Cc: devicetree@vger.kernel.org,
 "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>, srv_heupstream@mediatek.com,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SVS will change the voltage of opp item.
CCI devfreq need to react to change frequency.

Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
---
 drivers/devfreq/mt8183-cci-devfreq.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/devfreq/mt8183-cci-devfreq.c b/drivers/devfreq/mt8183-cci-devfreq.c
index cd7929a83bf8..3e03c1cac1a1 100644
--- a/drivers/devfreq/mt8183-cci-devfreq.c
+++ b/drivers/devfreq/mt8183-cci-devfreq.c
@@ -23,6 +23,7 @@ struct cci_devfreq {
 	struct clk *cci_clk;
 	int old_vproc;
 	unsigned long old_freq;
+	struct notifier_block opp_nb;
 };
 
 static int mtk_cci_set_voltage(struct cci_devfreq *cci_df, int vproc)
@@ -91,6 +92,26 @@ static int mtk_cci_devfreq_target(struct device *dev, unsigned long *freq,
 	return 0;
 }
 
+static int ccidevfreq_opp_notifier(struct notifier_block *nb,
+				   unsigned long event, void *data)
+{
+	struct dev_pm_opp *opp = data;
+	struct cci_devfreq *cci_df = container_of(nb, struct cci_devfreq,
+						  opp_nb);
+	unsigned long	freq, volt;
+
+	if (event == OPP_EVENT_ADJUST_VOLTAGE) {
+		freq = dev_pm_opp_get_freq(opp);
+		/* current opp item is changed */
+		if (freq == cci_df->old_freq) {
+			volt = dev_pm_opp_get_voltage(opp);
+			mtk_cci_set_voltage(cci_df, volt);
+		}
+	}
+
+	return 0;
+}
+
 static struct devfreq_dev_profile cci_devfreq_profile = {
 	.target = mtk_cci_devfreq_target,
 };
@@ -100,12 +121,15 @@ static int mtk_cci_devfreq_probe(struct platform_device *pdev)
 	struct device *cci_dev = &pdev->dev;
 	struct cci_devfreq *cci_df;
 	struct devfreq_passive_data *passive_data;
+	struct notifier_block *opp_nb;
 	int ret;
 
 	cci_df = devm_kzalloc(cci_dev, sizeof(*cci_df), GFP_KERNEL);
 	if (!cci_df)
 		return -ENOMEM;
 
+	opp_nb = &cci_df->opp_nb;
+
 	cci_df->cci_clk = devm_clk_get(cci_dev, "cci_clock");
 	ret = PTR_ERR_OR_ZERO(cci_df->cci_clk);
 	if (ret) {
@@ -153,6 +177,9 @@ static int mtk_cci_devfreq_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	opp_nb->notifier_call = ccidevfreq_opp_notifier;
+	dev_pm_opp_register_notifier(cci_dev, opp_nb);
+
 	return 0;
 }
 
-- 
2.12.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
