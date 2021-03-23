Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C3A3C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 11:35:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 008BD619B1
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 11:35:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 008BD619B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eTHs/dc0awfkc0z3NUoVqysM3GwftHB4eUHoLD+bHTc=; b=KnhhpI+w24iU+0Io+UuM2E2sB
	o1w6XQRdsxv4t+hi8jkTllhht7juRmOtjTFH8luHvqUbhJIy6MrEVzFjE7QpUP7HRrnob1oZoI9s3
	JX7S+htkbhtBT+gMMakeq3YXCY+MGpEurG04NJhnXYOZyDF2oaQRGUBSS1ZlJWvikHcoVHDXGWrna
	8vGoEv+ZEJBK7IDM/Fm6aTGi6G7Pz+Ltidv2tjLLy8QbHTpuMXpDBx4bd9GXVOidXIGUCIzUnr6n7
	+LLtCfExhsSKAUHIcQaU6p1X69qdydIYT1BoLNQG66Y2Lu08oiKrjfafFpN9uCbG0Q7quzk4cpnV7
	gSrqGMOkQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOfJN-00Eifs-3t; Tue, 23 Mar 2021 11:35:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOfIi-00EiXm-0w; Tue, 23 Mar 2021 11:34:22 +0000
X-UUID: bc67ec36ae3c405e8d533df3c46bc544-20210323
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=GtLlEQtFVYUJ6SnCVkNxU4lDx19Jh6fSbFyIZAPS6/Y=; 
 b=QudIqlr01C/gg+42Q29aqh1aKYDqG4hP4JjU5Ne3CAQYQ0TsxaeaocVdj8z7F2R/3XRF1RcD5Ho+kTqr0IFLcjLY57vRIxorJvOGpMxE1PFsoUJy6vqAMdBEY/BF057Y826yLZuTi9rblTWOLXlkjR0uuGyAnmbU0Q2+P0KcwHU=;
X-UUID: bc67ec36ae3c405e8d533df3c46bc544-20210323
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <andrew-sh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 949321265; Tue, 23 Mar 2021 03:34:11 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Mar 2021 04:34:10 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Mar 2021 19:34:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 23 Mar 2021 19:34:08 +0800
From: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, "Rob
 Herring" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Viresh Kumar <viresh.kumar@linaro.org>, Nishanth Menon <nm@ti.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>
CC: <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
Subject: [PATCH V8 7/8] devfreq: mediatek: cci devfreq register opp
 notification for SVS support
Date: Tue, 23 Mar 2021 19:34:00 +0800
Message-ID: <1616499241-4906-8-git-send-email-andrew-sh.cheng@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1616499241-4906-1-git-send-email-andrew-sh.cheng@mediatek.com>
References: <1616499241-4906-1-git-send-email-andrew-sh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_113420_531823_588C59D3 
X-CRM114-Status: GOOD (  16.10  )
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

From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>

SVS will change the voltage of opp item.
CCI devfreq need to react to change frequency.

Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
---
 drivers/devfreq/mt8183-cci-devfreq.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/devfreq/mt8183-cci-devfreq.c b/drivers/devfreq/mt8183-cci-devfreq.c
index 018543db7bae..6942a48f3f4f 100644
--- a/drivers/devfreq/mt8183-cci-devfreq.c
+++ b/drivers/devfreq/mt8183-cci-devfreq.c
@@ -21,6 +21,7 @@ struct cci_devfreq {
 	struct clk *cci_clk;
 	int old_vproc;
 	unsigned long old_freq;
+	struct notifier_block opp_nb;
 };
 
 static int mtk_cci_set_voltage(struct cci_devfreq *cci_df, int vproc)
@@ -89,6 +90,26 @@ static int mtk_cci_devfreq_target(struct device *dev, unsigned long *freq,
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
@@ -98,12 +119,15 @@ static int mtk_cci_devfreq_probe(struct platform_device *pdev)
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
@@ -152,6 +176,9 @@ static int mtk_cci_devfreq_probe(struct platform_device *pdev)
 		goto err_opp;
 	}
 
+	opp_nb->notifier_call = ccidevfreq_opp_notifier;
+	dev_pm_opp_register_notifier(cci_dev, opp_nb);
+
 	return 0;
 
 err_opp:
-- 
2.12.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
