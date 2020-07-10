Return-Path: <SRS0=M7U7=AV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ACE0C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 02:41:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E981C20663
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 02:41:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YX5c+e6o";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LQHj5xzR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E981C20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a+UfHIGyE5pXgilBHhmqK0KuiCV0WwA+VHmsvcEiiOc=; b=YX5c+e6oe2CviHUoXEYzdFGqm
	5i4GuN4okVuYqT8cJSnIXHgwaI54WLPFmjwY/8zH3inH9d1biTNLzv6DF/WLw4GzLNPjS8lNq8qRq
	Xa8Nz4o3cNZEPP3qaTB0KVlvjhCvuXyv4hG1wxlHV0RYDpMckDPocKm/Qo3kKOJV1HxOHb2RKynlY
	POvC/wDOS3hdzTEVTMALgbFplbj5e3kS6QXshD5SSF9MKHAmr1s5gDtl2ZtGfQRbZhguWyjEjU1lO
	UGKr7kRodETBdnkOj4Swhpbm4aTpPbKuU9k2YqRAlb2e+5djOcQ+N8pvmrGzzjJsgwZDEdq57agW3
	X3RVVQ5Xg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtiyn-0005jJ-EM; Fri, 10 Jul 2020 02:41:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtiyk-0005hh-73; Fri, 10 Jul 2020 02:41:35 +0000
X-UUID: fe4e3b8d4b8c4d1c8130401f236390d2-20200709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=PZwBkaefgjvUhsIgn/PVNF0GxFVrwyd890w3oPBDTiI=; 
 b=LQHj5xzRKEbhKcWo2BUDNXCaVxwCS2VsEeTJ0GCbWX/VYcSxCAgHyoGDzC/Gd637qoWoXgd05WM1+8gCoKPC3RAtg1IfOlA0s3tXB4iX5mfY66GB60xm8vw8XKgeDm/JkUcBYGYFFxtaIUQu79BqHNJnSPkLniTbKi3k76r6JeI=;
X-UUID: fe4e3b8d4b8c4d1c8130401f236390d2-20200709
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <andrew-sh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 510602195; Thu, 09 Jul 2020 18:41:27 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jul 2020 19:31:35 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Jul 2020 10:31:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 10 Jul 2020 10:31:34 +0800
From: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, "Rob
 Herring" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Viresh Kumar <viresh.kumar@linaro.org>, Nishanth Menon <nm@ti.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>
Subject: [PATCH v7 7/8] devfreq: mediatek: cci devfreq register opp
 notification for SVS support
Date: Fri, 10 Jul 2020 10:31:23 +0800
Message-ID: <1594348284-14199-8-git-send-email-andrew-sh.cheng@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1594348284-14199-1-git-send-email-andrew-sh.cheng@mediatek.com>
References: <1594348284-14199-1-git-send-email-andrew-sh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_224134_477623_9BEECE80 
X-CRM114-Status: GOOD (  17.03  )
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

From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>

SVS will change the voltage of opp item.
CCI devfreq need to react to change frequency.

Change-Id: I9d2ea9bd4be85970333eac92ab6fc330766e88da
Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
---
 drivers/devfreq/mt8183-cci-devfreq.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/devfreq/mt8183-cci-devfreq.c b/drivers/devfreq/mt8183-cci-devfreq.c
index 62d02464a34b..9ccc49ba0b9a 100644
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
