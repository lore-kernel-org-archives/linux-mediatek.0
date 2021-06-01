Return-Path: <SRS0=auVy=K3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E2EC4708F
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jun 2021 07:11:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 119F661370
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jun 2021 07:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 119F661370
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3qb5Tj6EzmfMrBOrDc4kdqNb9GUWWonwdx+hvPVxLbI=; b=1GJYt8mxB65dF6
	gg7IshCnPIojJyUssNyPanF4QwbqqCQtALGBXSpX9holzV7wyUxeDfPrLjAQuSqCH2MhQwK/QbYyl
	NenbIT154il7NcV1xcIZ9nt5eD2OWT9LqCO+XJLtpsuzjdEW+xq/8J2TmV8IKOfKpD6UcR/AQYPG1
	DlsDZ8/pojQENnxDwPSecnb8ElXN7czly+CzbjRVaLfOdxdDhIGxLyvYtaIBefGDoY0KzFmuE+HlG
	lq/2t53eJOzafes8wbDUUG/a9I6QkWx4VYLQQf1ZEF9TioKfkcPEtBRyQkG3NOVuDJzV+UyqauH+L
	JvGfJBcN+4YIYY9vYG2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnyYa-00F4bx-Hb; Tue, 01 Jun 2021 07:11:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnyYV-00F4Zs-VW; Tue, 01 Jun 2021 07:11:19 +0000
X-UUID: 616bfd749c7b46e6a49d0bf9b4e5011b-20210601
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=71kqP0+ycpI87S8e6G3wx+gzPtDleMQQtF+BpdiHiJc=; 
 b=OXh1UHLEnfzDztkML+isBRsYdzS56Sdlxu0FHuXvAO1pn6UnSxKYgBBxTvkuCEVDqZonXebt0j4VWogN5XySthN41jf1qXSh1Fo0osEAqtA+Tls39Y7s8u+sy/Pi8yw9KJpPTB01avSAlFsS8xKq9qyFDv8syBHE5RG4he0C2d4=;
X-UUID: 616bfd749c7b46e6a49d0bf9b4e5011b-20210601
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <seiya.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1082625112; Tue, 01 Jun 2021 00:11:10 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Jun 2021 00:11:09 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Jun 2021 15:11:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 1 Jun 2021 15:11:07 +0800
From: Seiya Wang <seiya.wang@mediatek.com>
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Viresh Kumar
 <viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: Seiya Wang <seiya.wang@mediatek.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <srv_heupstream@mediatek.com>
Subject: [RESEND 1/2] clk: mediatek: remove deprecated CLK_INFRA_CA57SEL for
 MT8173 SoC
Date: Tue, 1 Jun 2021 15:10:41 +0800
Message-ID: <20210601071042.31349-1-seiya.wang@mediatek.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_001117_756960_6AE912DF 
X-CRM114-Status: GOOD (  10.68  )
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

Remove CLK_INFRA_CA57SEL for MT8173 since it's no longer used.

Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
---
 include/dt-bindings/clock/mt8173-clk.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/dt-bindings/clock/mt8173-clk.h b/include/dt-bindings/clock/mt8173-clk.h
index 3acebe937bfc..3d00c98b9654 100644
--- a/include/dt-bindings/clock/mt8173-clk.h
+++ b/include/dt-bindings/clock/mt8173-clk.h
@@ -186,7 +186,6 @@
 #define CLK_INFRA_PMICWRAP		11
 #define CLK_INFRA_CLK_13M		12
 #define CLK_INFRA_CA53SEL               13
-#define CLK_INFRA_CA57SEL               14 /* Deprecated. Don't use it. */
 #define CLK_INFRA_CA72SEL               14
 #define CLK_INFRA_NR_CLK                15
 
-- 
2.14.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
