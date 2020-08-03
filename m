Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D37CC433E3
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 06:19:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C5502067D
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 06:19:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H4z7VH/x";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="PBtAdG3O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C5502067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mjj/JhdbC+m62EIiVHJ/ulZNrDYdvoJga/zDbqbhnl0=; b=H4z7VH/xST+4pKwqdBhTJcaIV
	fLVVtiOaaGcfut5rgGQk9JGlMEJ+KCfAaQ59KnVk5WHaD1s3bOE6UycWTcCy3rTv+EY+ZGAFCm0cK
	s5PQYPEFIQqYJhAD04oGyQHFkSg8HcgZjLUQb3zw6Lt+DLuRhiCJ35n3uN9ManXbmKP4FB2eiJjZM
	EQ9CaT/XpvQgR+wVn5aK+rLiRnOuc0G2q/bsTRTMlsJFz6SLG+FWvPIl9QcDWVOy7h+bExUDNXwiu
	LeWhrmGwYCYgMCuKZ25gwfIyT8uTHeHKBiLz/22t9Wo/xFyS2W/Tpaaz17vnnrtnSGCt2L5x42X3s
	xuNlh43sw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2ToU-0007O5-Pj; Mon, 03 Aug 2020 06:19:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2ToQ-0007Lb-Ew; Mon, 03 Aug 2020 06:19:07 +0000
X-UUID: 604dd1c01b184b03b576a9947172370d-20200802
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=rjZDdVmKwlvCS5P7LK/+wokqw80LDUbVpUuPU9b4MXE=; 
 b=PBtAdG3OUhO0EKZ7QrfIBhYI1/TLJsb9KssUm7goxz1UVCpaXByX3XFksd41P28Bi205YjopxJfsmf15zIZ4q9eML9GBXZnzAYbzHRjzUXm6H32Qvbonka5fEQOGejOF43afzUgeoBWYZ5TMAJ8Rg/k5Wnq+IO3BV5FptWnaHEM=;
X-UUID: 604dd1c01b184b03b576a9947172370d-20200802
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 798646128; Sun, 02 Aug 2020 22:18:57 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 2 Aug 2020 23:17:11 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 14:17:10 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 3 Aug 2020 14:17:10 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: <p.zabel@pengutronix.de>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: [v2,4/6] reset-controller: ti: introduce a new reset handler
Date: Mon, 3 Aug 2020 14:15:09 +0800
Message-ID: <20200803061511.29555-5-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200803061511.29555-1-crystal.guo@mediatek.com>
References: <20200803061511.29555-1-crystal.guo@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_021906_637523_98E6C4CC 
X-CRM114-Status: GOOD (  13.76  )
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
Cc: Crystal Guo <crystal.guo@mediatek.com>, yong.liang@mediatek.com,
 srv_heupstream@mediatek.com, seiya.wang@mediatek.com,
 linux-kernel@vger.kernel.org, fan.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, yingjoe.chen@mediatek.com,
 stanley.chu@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add ti_syscon_reset() to integrate assert and deassert together.
If some modules need do serialized assert and deassert operations
to reset itself, reset_control_reset can be called for convenience.

Change-Id: I9046992b115a46f3594de57fa89c6a2de9957d49
---
 drivers/reset/reset-ti-syscon.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/reset/reset-ti-syscon.c b/drivers/reset/reset-ti-syscon.c
index a2635c21db7f..1c74bcb9a6c3 100644
--- a/drivers/reset/reset-ti-syscon.c
+++ b/drivers/reset/reset-ti-syscon.c
@@ -56,6 +56,7 @@ struct ti_syscon_reset_data {
 	struct regmap *regmap;
 	struct ti_syscon_reset_control *controls;
 	unsigned int nr_controls;
+	bool assert_deassert_together;
 };
 
 #define to_ti_syscon_reset_data(rcdev)	\
@@ -158,10 +159,24 @@ static int ti_syscon_reset_status(struct reset_controller_dev *rcdev,
 		!(control->flags & STATUS_SET);
 }
 
+static int ti_syscon_reset(struct reset_controller_dev *rcdev,
+			  unsigned long id)
+{
+	struct ti_syscon_reset_data *data = to_ti_syscon_reset_data(rcdev);
+
+	if (data->assert_deassert_together) {
+		ti_syscon_reset_assert(rcdev, id);
+		return ti_syscon_reset_deassert(rcdev, id);
+	} else {
+		return -ENOTSUPP;
+	}
+}
+
 static const struct reset_control_ops ti_syscon_reset_ops = {
 	.assert		= ti_syscon_reset_assert,
 	.deassert	= ti_syscon_reset_deassert,
 	.status		= ti_syscon_reset_status,
+	.reset		= ti_syscon_reset,
 };
 
 static int ti_syscon_reset_probe(struct platform_device *pdev)
@@ -204,6 +219,11 @@ static int ti_syscon_reset_probe(struct platform_device *pdev)
 		controls[i].flags = be32_to_cpup(list++);
 	}
 
+	if (of_property_read_bool(np, "assert-deassert-together"))
+		data->assert_deassert_together = true;
+	else
+		data->assert_deassert_together = false;
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
