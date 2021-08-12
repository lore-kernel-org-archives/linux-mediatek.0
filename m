Return-Path: <SRS0=QG8e=ND=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA23C4320A
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 09:08:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8D3C60E9B
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 09:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8D3C60E9B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vXWja7+Uc72A07G5BVeIDW0Z9d+ZkP48cZilwNJ7mwI=; b=Hn5IGiYqIcnsuv
	Gx73tummX9IVvY8vjdc2rer5qZzGfDVVfuepv2bAZrIfyLnH+0lnBVXtz6cTFy0z1CYmIupEubFS0
	UI/kSopwQZWOV4NafP6K4bqImHA4BK5DCX44wWkUoI2yURBVOLMkcBm5SctVrI36UjGWGN3XZL/EW
	ZAzSAIaT8JvPkyMZlgY+qN1msrKAlSbuzZFaomiJSHDOIh+NAp92HvK8/9AUY/uau0i+Fv8G2Sw9+
	aq80zsek/HlyvlLsfYD58JniYVEBPCWUaDukkEmN5DJWY5BjUC3QLzWY2/n3WlPifVCD4EYBCKvoB
	u0FwdC/Zk5kTR4NkslLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE6h9-009JL3-6i; Thu, 12 Aug 2021 09:08:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE6dR-009HgY-2P; Thu, 12 Aug 2021 09:04:24 +0000
X-UUID: b2d0f23446e540e5a86736d8e317c72f-20210812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=CAKuqojQES7wkQcUWAfzRxWMye5pEPVtAYT8EURQBaQ=; 
 b=pzKoE/imtGDAWQlR+YaIsbdB45ly/4YemX6rHCzNgDPjavuWjNKOKW5Q9he1mSWWg85Oc/rEzvCX9rKyDNg5B6ACLFWM1sjrRxY8Fy+4lE8w475yEVJov5w+CbLHeVJi0lzurr1GA4q6XoI031slbKsNPogQ43DC46j2/s2bSJ4=;
X-UUID: b2d0f23446e540e5a86736d8e317c72f-20210812
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <dawei.chien@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 946703092; Thu, 12 Aug 2021 02:04:19 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 02:00:25 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
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
Subject: [V11,PATCH 14/19] interconnect: mediatek: add initial bandwidth
Date: Thu, 12 Aug 2021 16:58:41 +0800
Message-ID: <20210812085846.2628-15-dawei.chien@mediatek.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210812085846.2628-1-dawei.chien@mediatek.com>
References: <20210812085846.2628-1-dawei.chien@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_020421_166151_76A5085C 
X-CRM114-Status: GOOD (  11.09  )
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

support get_bw function for suitable initial bandwidth

Signed-off-by: Dawei Chien <dawei.chien@mediatek.com>
---
 drivers/interconnect/mediatek/mtk-emi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/interconnect/mediatek/mtk-emi.c b/drivers/interconnect/mediatek/mtk-emi.c
index 379dab77ebfd..80e2707698be 100644
--- a/drivers/interconnect/mediatek/mtk-emi.c
+++ b/drivers/interconnect/mediatek/mtk-emi.c
@@ -271,6 +271,14 @@ static int emi_icc_set(struct icc_node *src, struct icc_node *dst)
 	return ret;
 }
 
+static int emi_icc_get_bw(struct icc_node *node, u32 *avg, u32 *peak)
+{
+	*avg = 0;
+	*peak = 0;
+
+	return 0;
+}
+
 static int emi_icc_remove(struct platform_device *pdev);
 static int emi_icc_probe(struct platform_device *pdev)
 {
@@ -308,6 +316,7 @@ static int emi_icc_probe(struct platform_device *pdev)
 	provider->set = emi_icc_set;
 	provider->aggregate = emi_icc_aggregate;
 	provider->xlate = of_icc_xlate_onecell;
+	provider->get_bw = emi_icc_get_bw;
 	INIT_LIST_HEAD(&provider->nodes);
 	provider->data = data;
 
-- 
2.14.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
