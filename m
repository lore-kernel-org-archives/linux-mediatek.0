Return-Path: <SRS0=SDo2=LO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E4CBC48BDF
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Jun 2021 13:50:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CC4760C3D
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Jun 2021 13:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CC4760C3D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jaGqizKcLiOwcVXT+YWIyAWZVkWT8/wimA0QM6c115M=; b=SH3RjUl5jNhaip
	u1nhxfWHmmvNQJKaG9wAg7QALof+hV6rgASn1Q3HgUAAM2YoGgZ7BcTCGAhxqHDAcZZQyZZXi6v2L
	qx6lPRWXrIDM6oDTHQRgHkjTElDw0x21Hd8pxSXPQW/Sw1HyIGvXEER4L7KHnQG/JqRouSouY8sM/
	G0mgVFkM/KXkGo+4ZWKBv7jMjIfqWgSvE1ckIb9Hv7o1ScSN6FBTJwiGtVxTdTx9tgdepEDwzTQjo
	82PcuAx2DPlmnS84282fHiBDJK1k1w48BkDAynjjbO6kmc9D5aIhIOmrAKHunqC23DOI2t4jKxjYG
	ajyDiN/ZBPI6Fyratm2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luxqU-0016vP-JA; Sun, 20 Jun 2021 13:50:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luxq5-0016nq-P3; Sun, 20 Jun 2021 13:50:19 +0000
X-UUID: dbd2136238fe4141a0361afc93a5bf29-20210620
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=jZhSTGGu7PJeSfgytZjLMqz9PMnPb0iDYhvbk3Hm+04=; 
 b=ONdthLItxy6kFEgNqlPZqXNI/Kb/Fv8tQMYp2sZ+jJ6thZUgITkUQRByCWJmqbpawa8bg+5dlgAwwrrPvdEGEN0myakAkaPiQsLag7C3t2DL6IBT1M/uo/xPelvnELg5t4HlCoXuUdesR1JKdpeLg5ABJLx+AR/fFz8pN6gSMis=;
X-UUID: dbd2136238fe4141a0361afc93a5bf29-20210620
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <christine.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1595701287; Sun, 20 Jun 2021 06:50:16 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Jun 2021 06:50:14 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Jun 2021 21:50:00 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 20 Jun 2021 21:49:59 +0800
From: Christine Zhu <Christine.Zhu@mediatek.com>
To: <linux@roeck-us.net>, <robh+dt@kernel.org>, <wim@linux-watchdog.org>,
 <matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <seiya.wang@mediatek.com>, <linux-watchdog@vger.kernel.org>,
 <rex-bc.chen@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <srv_heupstream@mediatek.com>, christine.zhu <Christine.Zhu@mediatek.com>
Subject: [v1,3/3] watchdog: mt8195: add wdt support
Date: Sun, 20 Jun 2021 21:49:54 +0800
Message-ID: <20210620134954.15233-4-Christine.Zhu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210620134954.15233-1-Christine.Zhu@mediatek.com>
References: <20210620134954.15233-1-Christine.Zhu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210620_065017_870873_B839DE6A 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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

From: "christine.zhu" <Christine.Zhu@mediatek.com>

add support for watchdog device found in MT8195 SoC

Change-Id: Ib2434cf2d47a2e14916056f08a4fc630569624ed
Signed-off-by: christine.zhu <Christine.Zhu@mediatek.com>
---
 drivers/watchdog/mtk_wdt.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 97ca993bd009..5e9e4db8d51a 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -12,6 +12,7 @@
 #include <dt-bindings/reset-controller/mt2712-resets.h>
 #include <dt-bindings/reset-controller/mt8183-resets.h>
 #include <dt-bindings/reset-controller/mt8192-resets.h>
+#include <dt-bindings/reset-controller/mt8195-resets.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -81,6 +82,10 @@ static const struct mtk_wdt_data mt8192_data = {
 	.toprgu_sw_rst_num = MT8192_TOPRGU_SW_RST_NUM,
 };
 
+static const struct mtk_wdt_data mt8195_data = {
+	.toprgu_sw_rst_num = MT8195_TOPRGU_SW_RST_NUM,
+};
+
 static int toprgu_reset_update(struct reset_controller_dev *rcdev,
 			       unsigned long id, bool assert)
 {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
