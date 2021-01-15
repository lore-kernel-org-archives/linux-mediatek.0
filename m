Return-Path: <SRS0=P2Ib=GS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB06C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jan 2021 11:30:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 522D9221F7
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jan 2021 11:30:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 522D9221F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MiHr45NT13lNxN5nz7i41Ap1ygIEzVjr7WsUxK9jhM4=; b=OOZY9KLz5ZPEZoqH46Q/1zIOR
	adtWQyKioUUGHvQ/IpzHgI1pEB0FnZ1gTIPIjS0d9Jmnc23Tr44EP8zacD68G2yswhLOL/FRjyyBp
	R5JYHI0PpE9kJKfWnDO84E2RY/xNnQbC3mF3wj98Al6cwMSEsqN6gp1lF54cngMc8TWhkp9BNtrDk
	G9NnDTyq37K6ta/chm/L3+jjT2O+TSbc1nURQZmfkEj6cyd7R0zCrGh/zx0wFnXrTkpETTOYwhYB6
	DvUH/j868MPWEafvLK9ugk5O+p8BtHiiuULW0BkCKEsNdpG2BqT6K90U8vNb5k01ItjjRelq+s3V0
	m+K4XyxHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0NIz-0000wW-3j; Fri, 15 Jan 2021 11:30:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0NIw-0000vY-8B; Fri, 15 Jan 2021 11:30:11 +0000
X-UUID: f6d652e1f11145c6abd14f40e8b3df09-20210115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ZfZ9YF7i7nVSXXeOG5CUXJJKKTogeOUOslSb2X+OjK4=; 
 b=Ge+x+dCDz7x+mlGhnP/AuU+2UeoDFMpQ6Mu9fUmXZ/PRNqKe5HRpf2GYSRpVnGT+BsfO5EVcTO37NhwDfvJjc43jKsXl43EV9/YYq+MxpyeKDtQLUSEVnMzut8L0xe2g3ZYS0bPrUcRT6LV0/n2+8FIBcKjWiilFWmCfdnHpAk0=;
X-UUID: f6d652e1f11145c6abd14f40e8b3df09-20210115
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1241614646; Fri, 15 Jan 2021 03:30:08 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 15 Jan 2021 03:23:38 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 15 Jan 2021 19:23:36 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 15 Jan 2021 19:23:35 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: <p.zabel@pengutronix.de>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>, 
 <crystal.guo@mediatek.com>
Subject: [v7,2/2] reset-controller: ti: introduce an integrated reset handler
Date: Fri, 15 Jan 2021 19:23:31 +0800
Message-ID: <20210115112331.27434-3-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210115112331.27434-1-crystal.guo@mediatek.com>
References: <20210115112331.27434-1-crystal.guo@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5E853876C392C9C9401EA3500EE0D371DA375EFC9FD4FBEBB67153AC2FA3F1082000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_063010_452616_7ADA53F6 
X-CRM114-Status: GOOD (  13.93  )
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
Cc: devicetree@vger.kernel.org, s-anna@ti.com, srv_heupstream@mediatek.com,
 seiya.wang@mediatek.com, linux-kernel@vger.kernel.org, fan.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, Yidi.Lin@mediatek.com,
 Yingjoe.Chen@mediatek.com, stanley.chu@mediatek.com, ikjn@chromium.org,
 linux-arm-kernel@lists.infradead.org
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
 drivers/reset/reset-ti-syscon.c | 39 +++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/reset/reset-ti-syscon.c b/drivers/reset/reset-ti-syscon.c
index 218370faf37b..a30cb17362a4 100644
--- a/drivers/reset/reset-ti-syscon.c
+++ b/drivers/reset/reset-ti-syscon.c
@@ -15,15 +15,24 @@
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
 
+#define MTK_SYSCON_RESET_FLAG	BIT(0)
+#define MT_RESET_DURATION	10
+
+struct mediatek_reset_data {
+	unsigned int flag;
+};
+
 /**
  * struct ti_syscon_reset_control - reset control structure
  * @assert_offset: reset assert control register offset from syscon base
@@ -56,6 +65,7 @@ struct ti_syscon_reset_data {
 	struct regmap *regmap;
 	struct ti_syscon_reset_control *controls;
 	unsigned int nr_controls;
+	const struct mediatek_reset_data *reset_data;
 };
 
 #define to_ti_syscon_reset_data(rcdev)	\
@@ -158,9 +168,32 @@ static int ti_syscon_reset_status(struct reset_controller_dev *rcdev,
 		!(control->flags & STATUS_SET);
 }
 
+static int mtk_syscon_reset(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	int ret;
+
+	ret = ti_syscon_reset_assert(rcdev, id);
+	if (ret)
+		return ret;
+	usleep_range(MT_RESET_DURATION, MT_RESET_DURATION * 2);
+
+	return ti_syscon_reset_deassert(rcdev, id);
+}
+
+static int ti_syscon_reset(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct ti_syscon_reset_data *data = to_ti_syscon_reset_data(rcdev);
+
+	if (data->reset_data && data->reset_data->flag & MTK_SYSCON_RESET_FLAG)
+		return mtk_syscon_reset(rcdev, id);
+	else
+		return -ENOTSUPP;
+}
+
 static const struct reset_control_ops ti_syscon_reset_ops = {
 	.assert		= ti_syscon_reset_assert,
 	.deassert	= ti_syscon_reset_deassert,
+	.reset		= ti_syscon_reset,
 	.status		= ti_syscon_reset_status,
 };
 
@@ -182,6 +215,7 @@ static int ti_syscon_reset_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
+	data->reset_data = of_device_get_match_data(&pdev->dev);
 	list = of_get_property(np, "ti,reset-bits", &size);
 	if (!list || (size / sizeof(*list)) % 7 != 0) {
 		dev_err(dev, "invalid DT reset description\n");
@@ -217,8 +251,13 @@ static int ti_syscon_reset_probe(struct platform_device *pdev)
 	return devm_reset_controller_register(dev, &data->rcdev);
 }
 
+static const struct mediatek_reset_data mtk_reset_data = {
+	.flag = MTK_SYSCON_RESET_FLAG,
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
