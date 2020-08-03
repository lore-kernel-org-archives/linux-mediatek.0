Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A1AFC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 06:27:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAB9E206D4
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 06:27:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MZ6wMQLH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="e1yeVrtc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAB9E206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lWTuewWw1gyGTB9sKaEcsuY273Kc3Ip0J4k5aYElRXE=; b=MZ6wMQLHJwtLSGK8QNL0HTFAS
	PwE+76tYkR1mJnK7agQ4eamH5LFdSa3Lee3NWqXmu6nUdBm80YyFS/Fi0ck++ia4asq3BvErDnZok
	WLWJvfpROfcMd6c/usS2MNjVp0ZHacF48KMcpGOa4ly0WiMuOuK2w+uVNyPa9eN6Yerj+SrPRQLKP
	UhehAbr7oUw58iS1idHcetmky1dqi2V4Z2z8d8VRtXD17s/Na6RYa3oKzqA9OSrx/1tPO759fYvx6
	eVMTegYomvdbPdOcFQ5yaACbbCHBZijpJpr9kpWx/eZfUUDWp9L1bBvktPVFbSlexrtK2zCsRz+Ed
	KvSR6HzCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2TwP-0000dW-Nd; Mon, 03 Aug 2020 06:27:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2TwM-0000by-PD; Mon, 03 Aug 2020 06:27:19 +0000
X-UUID: c47b7fb6274045c1ba01f83033b32628-20200802
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=fKJAJQVfxmdAr8Fx0IAfMXtGgSuSubjw5SgTjtIYFEc=; 
 b=e1yeVrtcOVvjTgTLTcXp0p0KP6uQqyFoHvMg5beo0YAFijG3dB7JpTgdH0ni0PBPHptE/n3rTvHZnjS70qbcSJaDVeHq6Kr8fDzBJX0LN8W1ZniyIwxvBDzFvpUX9Lz+B9U4ciWWbb3XP5TmtaARFqEnKqDvEBfsZYxVN0x9PnY=;
X-UUID: c47b7fb6274045c1ba01f83033b32628-20200802
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 15916487; Sun, 02 Aug 2020 22:27:10 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 2 Aug 2020 23:17:13 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 14:17:11 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 3 Aug 2020 14:17:12 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: <p.zabel@pengutronix.de>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: [v2,5/6] reset-controller: ti: Introduce force-update method
Date: Mon, 3 Aug 2020 14:15:10 +0800
Message-ID: <20200803061511.29555-6-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200803061511.29555-1-crystal.guo@mediatek.com>
References: <20200803061511.29555-1-crystal.guo@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_022718_989179_07FE23D1 
X-CRM114-Status: GOOD (  13.01  )
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

Introduce force-update method for assert and deassert interface,
which force the write operation in case the read already happens
to return the correct value.

Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
---
 drivers/reset/reset-ti-syscon.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-ti-syscon.c b/drivers/reset/reset-ti-syscon.c
index 1c74bcb9a6c3..f4baf78afd14 100644
--- a/drivers/reset/reset-ti-syscon.c
+++ b/drivers/reset/reset-ti-syscon.c
@@ -57,6 +57,7 @@ struct ti_syscon_reset_data {
 	struct ti_syscon_reset_control *controls;
 	unsigned int nr_controls;
 	bool assert_deassert_together;
+	bool update_force;
 };
 
 #define to_ti_syscon_reset_data(rcdev)	\
@@ -90,7 +91,10 @@ static int ti_syscon_reset_assert(struct reset_controller_dev *rcdev,
 	mask = BIT(control->assert_bit);
 	value = (control->flags & ASSERT_SET) ? mask : 0x0;
 
-	return regmap_update_bits(data->regmap, control->assert_offset, mask, value);
+	if (data->update_force)
+		return regmap_write_bits(data->regmap, control->assert_offset, mask, value);
+	else
+		return regmap_update_bits(data->regmap, control->assert_offset, mask, value);
 }
 
 /**
@@ -121,7 +125,10 @@ static int ti_syscon_reset_deassert(struct reset_controller_dev *rcdev,
 	mask = BIT(control->deassert_bit);
 	value = (control->flags & DEASSERT_SET) ? mask : 0x0;
 
-	return regmap_update_bits(data->regmap, control->deassert_offset, mask, value);
+	if (data->update_force)
+		return regmap_write_bits(data->regmap, control->deassert_offset, mask, value);
+	else
+		return regmap_update_bits(data->regmap, control->deassert_offset, mask, value);
 }
 
 /**
@@ -223,6 +230,10 @@ static int ti_syscon_reset_probe(struct platform_device *pdev)
 		data->assert_deassert_together = true;
 	else
 		data->assert_deassert_together = false;
+	if (of_property_read_bool(np, "update-force"))
+		data->update_force = true;
+	else
+		data->update_force = false;
 
 	data->rcdev.ops = &ti_syscon_reset_ops;
 	data->rcdev.owner = THIS_MODULE;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
