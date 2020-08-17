Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22323C433EA
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 03:05:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3D02206C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 03:05:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nskpzuL0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tLpeoFsT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3D02206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=REGmAzWGrW3NsQQQ3Vm1w4EASI3Wpj69y7igGbNxL5s=; b=nskpzuL0OhB2Uyuvpd5HMWVeo
	Ng/djYnCAMgEY4ZVmqqSKOZepn+MQlYoQyAREkFumzMH/aXo8iviwpPLzUkcOM5tb++pSLCgELljr
	xPID64vMMTeeiXPF+oJ4LUWdQW0E50bYJkYoWmYJ9WJ/n2oD1JtHCwRK4WIlY8Nuo+3Gf3mkxTwzP
	AyXAEj0BfUuibxa33FflOuUXTfn5hHimiGp9v/+N2Pju7djbbn/CC4VOv3sNO2AESswLiLPVx2nqW
	Lh+1VzSoz/aIX/aEpnoU475MTnRxrX6gos2wVlJRQm9hapAAmF8ibo7TLLx0etjUb08ojWkDldbmn
	XsxJFPPuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7VSh-00071M-Vw; Mon, 17 Aug 2020 03:05:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7VSa-0006xQ-Sg; Mon, 17 Aug 2020 03:05:22 +0000
X-UUID: 209563c33575475485b9c7442c04f246-20200816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=keeKoJIRKUWFE6P/EASXouOcJ/N4TDpUj5yGA3TaFgs=; 
 b=tLpeoFsTmQwnpu2GfyAWhJKhAJhbkTCsjJQ3tObYWvl5MFNxssvF2wfrG1bYp1I1m/XBRJiBNrw/5l4Q6vi0IQFK6l9akBw2JqVDiHZul7MLzSQTpELfFiAmiFCGvdvwDzrN07SUJsFLVH++K3qEdsQfYMfMdczgf9jMNsi7Zb8=;
X-UUID: 209563c33575475485b9c7442c04f246-20200816
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 15973332; Sun, 16 Aug 2020 19:05:19 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 16 Aug 2020 20:05:17 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Aug 2020 11:05:09 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 17 Aug 2020 11:05:09 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: <p.zabel@pengutronix.de>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: [v4,3/4] reset-controller: ti: introduce a new reset handler
Date: Mon, 17 Aug 2020 11:03:23 +0800
Message-ID: <20200817030324.5690-4-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200817030324.5690-1-crystal.guo@mediatek.com>
References: <20200817030324.5690-1-crystal.guo@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200816_230521_080838_601E9D5B 
X-CRM114-Status: GOOD (  14.37  )
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
 linux-kernel@vger.kernel.org, afd@ti.com, fan.chen@mediatek.com,
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
 drivers/reset/reset-ti-syscon.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-ti-syscon.c b/drivers/reset/reset-ti-syscon.c
index a2635c21db7f..08289342f9af 100644
--- a/drivers/reset/reset-ti-syscon.c
+++ b/drivers/reset/reset-ti-syscon.c
@@ -15,6 +15,7 @@
  * GNU General Public License for more details.
  */
 
+#include <linux/delay.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -56,6 +57,7 @@ struct ti_syscon_reset_data {
 	struct regmap *regmap;
 	struct ti_syscon_reset_control *controls;
 	unsigned int nr_controls;
+	unsigned int reset_duration_us;
 };
 
 #define to_ti_syscon_reset_data(rcdev)	\
@@ -89,7 +91,7 @@ static int ti_syscon_reset_assert(struct reset_controller_dev *rcdev,
 	mask = BIT(control->assert_bit);
 	value = (control->flags & ASSERT_SET) ? mask : 0x0;
 
-	return regmap_update_bits(data->regmap, control->assert_offset, mask, value);
+	return regmap_write_bits(data->regmap, control->assert_offset, mask, value);
 }
 
 /**
@@ -120,7 +122,7 @@ static int ti_syscon_reset_deassert(struct reset_controller_dev *rcdev,
 	mask = BIT(control->deassert_bit);
 	value = (control->flags & DEASSERT_SET) ? mask : 0x0;
 
-	return regmap_update_bits(data->regmap, control->deassert_offset, mask, value);
+	return regmap_write_bits(data->regmap, control->deassert_offset, mask, value);
 }
 
 /**
@@ -158,9 +160,26 @@ static int ti_syscon_reset_status(struct reset_controller_dev *rcdev,
 		!(control->flags & STATUS_SET);
 }
 
+static int ti_syscon_reset(struct reset_controller_dev *rcdev,
+				  unsigned long id)
+{
+	struct ti_syscon_reset_data *data = to_ti_syscon_reset_data(rcdev);
+	int ret;
+
+	ret = ti_syscon_reset_assert(rcdev, id);
+	if (ret)
+		return ret;
+
+	if (data->reset_duration_us)
+		usleep_range(data->reset_duration_us, data->reset_duration_us * 2);
+
+	return ti_syscon_reset_deassert(rcdev, id);
+}
+
 static const struct reset_control_ops ti_syscon_reset_ops = {
 	.assert		= ti_syscon_reset_assert,
 	.deassert	= ti_syscon_reset_deassert,
+	.reset		= ti_syscon_reset,
 	.status		= ti_syscon_reset_status,
 };
 
@@ -204,6 +223,9 @@ static int ti_syscon_reset_probe(struct platform_device *pdev)
 		controls[i].flags = be32_to_cpup(list++);
 	}
 
+	of_property_read_u32(pdev->dev.of_node,	"reset-duration-us",
+				&data->reset_duration_us);
+
 	data->rcdev.ops = &ti_syscon_reset_ops;
 	data->rcdev.owner = THIS_MODULE;
 	data->rcdev.of_node = np;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
