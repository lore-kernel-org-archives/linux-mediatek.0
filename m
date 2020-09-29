Return-Path: <SRS0=Ekst=DG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08702C4727D
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 13:47:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8461C207C4
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 13:47:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sj08zDLc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="uT1abKxl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8461C207C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sujT6BpbW6biiPQ9TRMTJWruvdSRK+unRS16dhgO9Ts=; b=Sj08zDLcFqDtg96Y7arHLtkJd
	g5Kc6mwB8YRkwbxtxgNkLX+iExlcvaouyzUZvILwB3X9VOZXVd1bfHhQNYwywPNYB+TTL7p81unua
	M2DLQ+yIVFLPyiAsYu27auOfXgy3koOfRVqbPOSQEN2mdneuLzce3yBwPwlz6HxzlWNjm/xQEM5g0
	MEILjpffNVpHrlGvt53aHvFdydE2OYUHjrWo4bJqqADYbpLlbMZVMIeVW2CBDI8kEYijfpBHRFNPd
	YzxNweQxzNxmtBImY3KupFkmkwvu8s/Duymwb+HWKGjhxjQE+RRQ1IBITLeb17rf3uFXFe4WvNYCn
	KZfRJ+BCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNFyo-000641-By; Tue, 29 Sep 2020 13:47:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNFy8-0005ne-H8; Tue, 29 Sep 2020 13:47:04 +0000
X-UUID: 685d4fe541da4ea1b4ede3b50e97cdb3-20200929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=AC/DXYeU36EHPrXDYOJrO+0efcpwt/5OaRcV8VbmYaY=; 
 b=uT1abKxlLs2Q7ZtYLMxjgVdqlydgrtbxMBRhfXILQ2vWIzDQXbSLtk8Rese/wBPrU319x8yrdmMwkI4eI8eoBLGNVvyL10NWOHAFq68kJoDNq55ZJobho0VqXx0d3tFcO1MukNa3IUM/2ph4P/mvhCulqA5dlnK7Mf/PYT1H3os=;
X-UUID: 685d4fe541da4ea1b4ede3b50e97cdb3-20200929
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1309745482; Tue, 29 Sep 2020 05:46:56 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Sep 2020 06:46:54 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Sep 2020 21:46:51 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Sep 2020 21:46:50 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: <p.zabel@pengutronix.de>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: [v5,2/3] reset-controller: ti: introduce a new reset handler
Date: Tue, 29 Sep 2020 21:46:41 +0800
Message-ID: <20200929134642.26561-3-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200929134642.26561-1-crystal.guo@mediatek.com>
References: <20200929134642.26561-1-crystal.guo@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_094700_785972_C07F31CC 
X-CRM114-Status: GOOD (  16.26  )
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
Cc: devicetree@vger.kernel.org, yong.liang@mediatek.com,
 stanley.chu@mediatek.com, srv_heupstream@mediatek.com, seiya.wang@mediatek.com,
 linux-kernel@vger.kernel.org, fan.chen@mediatek.com,
 Crystal Guo <crystal.guo@mediatek.com>, linux-mediatek@lists.infradead.org,
 yingjoe.chen@mediatek.com, s-anna@ti.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Introduce ti_syscon_reset() to integrate assert and deassert together.
If some modules need do serialized assert and deassert operations
to reset itself, reset_control_reset can be called for convenience.

Such as reset-qcom-aoss.c, it integrates assert and deassert together
by 'reset' method. MTK Socs also need this method to perform reset.

Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
---
 drivers/reset/reset-ti-syscon.c | 40 ++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/reset-ti-syscon.c b/drivers/reset/reset-ti-syscon.c
index a2635c21db7f..5d1f8306cd4f 100644
--- a/drivers/reset/reset-ti-syscon.c
+++ b/drivers/reset/reset-ti-syscon.c
@@ -15,15 +15,22 @@
  * GNU General Public License for more details.
  */
 
+#include <linux/delay.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset-controller.h>
 
 #include <dt-bindings/reset/ti-syscon.h>
 
+struct mediatek_reset_data {
+	unsigned char *reset_bits;
+	unsigned int reset_duration_us;
+};
+
 /**
  * struct ti_syscon_reset_control - reset control structure
  * @assert_offset: reset assert control register offset from syscon base
@@ -56,6 +63,7 @@ struct ti_syscon_reset_data {
 	struct regmap *regmap;
 	struct ti_syscon_reset_control *controls;
 	unsigned int nr_controls;
+	const struct mediatek_reset_data *reset_data;
 };
 
 #define to_ti_syscon_reset_data(rcdev)	\
@@ -158,9 +166,29 @@ static int ti_syscon_reset_status(struct reset_controller_dev *rcdev,
 		!(control->flags & STATUS_SET);
 }
 
+static int ti_syscon_reset(struct reset_controller_dev *rcdev,
+				  unsigned long id)
+{
+	struct ti_syscon_reset_data *data = to_ti_syscon_reset_data(rcdev);
+	int ret;
+
+	if (data->reset_data) {
+		ret = ti_syscon_reset_assert(rcdev, id);
+		if (ret)
+			return ret;
+		usleep_range(data->reset_data->reset_duration_us,
+			data->reset_data->reset_duration_us * 2);
+
+		return ti_syscon_reset_deassert(rcdev, id);
+	} else {
+		return -ENOTSUPP;
+	}
+}
+
 static const struct reset_control_ops ti_syscon_reset_ops = {
 	.assert		= ti_syscon_reset_assert,
 	.deassert	= ti_syscon_reset_deassert,
+	.reset		= ti_syscon_reset,
 	.status		= ti_syscon_reset_status,
 };
 
@@ -182,7 +210,11 @@ static int ti_syscon_reset_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	list = of_get_property(np, "ti,reset-bits", &size);
+	data->reset_data = of_device_get_match_data(&pdev->dev);
+	if (data->reset_data)
+		list = of_get_property(np, data->reset_data->reset_bits, &size);
+	else
+		list = of_get_property(np, "ti,reset-bits", &size);
 	if (!list || (size / sizeof(*list)) % 7 != 0) {
 		dev_err(dev, "invalid DT reset description\n");
 		return -EINVAL;
@@ -217,8 +249,14 @@ static int ti_syscon_reset_probe(struct platform_device *pdev)
 	return devm_reset_controller_register(dev, &data->rcdev);
 }
 
+static const struct mediatek_reset_data mtk_reset_data = {
+	.reset_bits = "mediatek,reset-bits",
+	.reset_duration_us = 10,
+};
+
 static const struct of_device_id ti_syscon_reset_of_match[] = {
 	{ .compatible = "ti,syscon-reset", },
+	{ .compatible = "mediatek,syscon-reset", .data = &mtk_reset_data},
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, ti_syscon_reset_of_match);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
