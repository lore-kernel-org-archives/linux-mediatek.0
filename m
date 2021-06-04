Return-Path: <SRS0=7C4w=K6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C373EC07E94
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Jun 2021 10:30:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AFB46140C
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Jun 2021 10:30:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AFB46140C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G6oURtR4awF4S1EQdxQSUzmi3kfF2UrRwzLU0VySwbo=; b=ON4A1nULD4Bujb
	nhWl5mWuu/JdQXY2VnQoEEACkWFyOv7v/91q9Mt1cB1e25FTaiQhT9/JWn+LJEwJTD+vVvwg8X74r
	mUOX2ZEhguz9Xzo17QhF2jECer7L/8MDy9rS/hJSSLDK4HS6E/SFAuXV/RGXuZRDfL9saxiR1pSLZ
	I0FhEPv4dg0wO95i0B2D52/B/dn9GBFnkwqHpJgOZub796SkCJxnHkAKA6Dmq5rZNanMfXHClR6jq
	8yyopYlG4eGGkYeiS1zEKafUYLNQGuC9S9BGad2iopYqQhajXRxNrNskVh48SbcOtHq9XO15XwFMF
	aXVdOr7A8XHYNS/rutOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp75L-00Cxz7-54; Fri, 04 Jun 2021 10:29:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp6oa-00CrLg-Tx; Fri, 04 Jun 2021 10:12:36 +0000
X-UUID: f4be108ec5e84e8f9bdc4d7e8df53b6e-20210604
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=BNZHzIhTMGVVZcknpreU5fdi1027gCGQFKobgx6aDjY=; 
 b=BSixPjm82NSl7Tn7M7sZ2YIPuRDcS39S2n5Gih0zeI/dwrNui8WIx1SHjrjCDo6BZhC6v4coXXVIIFDLlzYR5BrZ0GbugrZhWO8ITY4PFX5R5DuIJGuW6dqDoxkiQ5ydJQqVUbNcu8oaEqrFOBesqq546JoOQ2fBJVsSpERe2O4=;
X-UUID: f4be108ec5e84e8f9bdc4d7e8df53b6e-20210604
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <dawei.chien@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2004076977; Fri, 04 Jun 2021 03:12:25 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Jun 2021 03:02:23 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Jun 2021 18:02:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 4 Jun 2021 18:02:22 +0800
From: Dawei Chien <dawei.chien@mediatek.com>
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>
CC: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat
 <drinkcat@google.com>, <devicetree@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 Fan Chen <fan.chen@mediatek.com>, Arvin Wang <arvin.wang@mediatek.com>,
 "James Liao" <jamesjj.liao@mediatek.com>, Henry Chen
 <henryc.chen@mediatek.com>
Subject: [PATCH V10 02/12] soc: mediatek: add header for mediatek SIP interface
Date: Fri, 4 Jun 2021 18:02:08 +0800
Message-ID: <20210604100218.13613-3-dawei.chien@mediatek.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210604100218.13613-1-dawei.chien@mediatek.com>
References: <20210604100218.13613-1-dawei.chien@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_031233_041337_D3D4DAF4 
X-CRM114-Status: GOOD (  11.88  )
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

From: Henry Chen <henryc.chen@mediatek.com>

Add a header to collect SIPs and add one SIP call to initialize power
management hardware for the SIP interface defined to access the SPM
handling vcore voltage and ddr rate changes on mt8183 (and most likely
later socs).

Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
Signed-off-by: Arvin Wang <arvin.wang@mediatek.com>
---
 include/linux/soc/mediatek/mtk_sip_svc.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/soc/mediatek/mtk_sip_svc.h b/include/linux/soc/mediatek/mtk_sip_svc.h
index 082398e0cfb1..079bbcb361ba 100644
--- a/include/linux/soc/mediatek/mtk_sip_svc.h
+++ b/include/linux/soc/mediatek/mtk_sip_svc.h
@@ -22,4 +22,8 @@
 	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, MTK_SIP_SMC_CONVENTION, \
 			   ARM_SMCCC_OWNER_SIP, fn_id)
 
+/* VCOREFS */
+#define MTK_SIP_VCOREFS_CONTROL \
+	MTK_SIP_SMC_CMD(0x506)
+
 #endif
-- 
2.14.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
