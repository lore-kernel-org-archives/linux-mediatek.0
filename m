Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E009CC388F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 13:08:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22EC62177B
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 13:08:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r0pBS7jn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UZcMFek5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22EC62177B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nrRDJm69UeaDkdoQBgEvJPFhWk1BCyagWTzF5bpaiKI=; b=r0pBS7jnPmtXpcrXYaOL8qgGQ
	rxEfYVyOOpW8oSKjgFgsV6mdBWL2ArTJn0hELfv7uYTLqjPhdY9IJdBLp34Icn+xf26n4FoMPkMjn
	30uqLg2GQNszE4dEgS9XwpDsL0bLsCXHsMzuZU1B5w+B50oooXRL4XKxJC2JOo/sSHGx1ylz8sQ/s
	OdfZv4Igs3FbqT5VklmW4I5hRjMX3dJ00KDwYFNSg5DvqF/heewiXEHq0wiifz2UJaetLGyL3x8Zq
	CxKOiBMk15Ek9+FZ7PyGink5gHoduyeRXEV4P8rCUEH4WMyNtatml7kvz23W7JDKN5hnbWhbevhIe
	EK7kU7wdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVaKE-0000Ev-ME; Thu, 22 Oct 2020 13:08:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVaIJ-0007mi-BE; Thu, 22 Oct 2020 13:06:25 +0000
X-UUID: efdc47efa4b040658ba78a55fd3d317b-20201022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ARo+aZnxsWHz4UuONZ9dF73YwZqt8F6SqOJGyOAxrEk=; 
 b=UZcMFek5XJZ+r3ojUz/4l89RXia9hwKriunAsDyvDz+YAGaEQS6gqvxNDHNoZ6MCWSOv/cISh05ldLnoaoI9gIJYMtjSk9jNMCGK08Rajig06gO7HqGOd4OqK+7ttsa2kGnu6MzT9dXOWAoqtBbG7TXKp1tB22WtRauEPpscyGM=;
X-UUID: efdc47efa4b040658ba78a55fd3d317b-20201022
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 343299557; Thu, 22 Oct 2020 05:06:11 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 05:56:11 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 20:56:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Oct 2020 20:56:08 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH 11/12] clk: mediatek: Clean up the pll_en_bit from en_mask on
 MT8516
Date: Thu, 22 Oct 2020 20:56:04 +0800
Message-ID: <1603371365-30863-12-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603371365-30863-1-git-send-email-weiyi.lu@mediatek.com>
References: <1603371365-30863-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_090615_615992_8237DBCA 
X-CRM114-Status: GOOD (  12.40  )
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
Cc: Weiyi Lu <weiyi.lu@mediatek.com>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

remove pll_en_bit(bit0) from en_mask to make en_mask a pure en_mask
that only used for pll dividers.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/clk/mediatek/clk-mt8516.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8516.c b/drivers/clk/mediatek/clk-mt8516.c
index 9d4261e..ec215e5 100644
--- a/drivers/clk/mediatek/clk-mt8516.c
+++ b/drivers/clk/mediatek/clk-mt8516.c
@@ -770,17 +770,17 @@ static void __init mtk_infracfg_init(struct device_node *node)
 };
 
 static const struct mtk_pll_data plls[] = {
-	PLL(CLK_APMIXED_ARMPLL, "armpll", 0x0100, 0x0110, 0x00000001, 0,
+	PLL(CLK_APMIXED_ARMPLL, "armpll", 0x0100, 0x0110, 0, 0,
 		21, 0x0104, 24, 0, 0x0104, 0),
-	PLL(CLK_APMIXED_MAINPLL, "mainpll", 0x0120, 0x0130, 0x00000001,
+	PLL(CLK_APMIXED_MAINPLL, "mainpll", 0x0120, 0x0130, 0,
 		HAVE_RST_BAR, 21, 0x0124, 24, 0, 0x0124, 0),
-	PLL(CLK_APMIXED_UNIVPLL, "univpll", 0x0140, 0x0150, 0x30000001,
+	PLL(CLK_APMIXED_UNIVPLL, "univpll", 0x0140, 0x0150, 0x30000000,
 		HAVE_RST_BAR, 7, 0x0144, 24, 0, 0x0144, 0),
-	PLL_B(CLK_APMIXED_MMPLL, "mmpll", 0x0160, 0x0170, 0x00000001, 0,
+	PLL_B(CLK_APMIXED_MMPLL, "mmpll", 0x0160, 0x0170, 0, 0,
 		21, 0x0164, 24, 0, 0x0164, 0, mmpll_div_table),
-	PLL(CLK_APMIXED_APLL1, "apll1", 0x0180, 0x0190, 0x00000001, 0,
+	PLL(CLK_APMIXED_APLL1, "apll1", 0x0180, 0x0190, 0, 0,
 		31, 0x0180, 1, 0x0194, 0x0184, 0),
-	PLL(CLK_APMIXED_APLL2, "apll2", 0x01A0, 0x01B0, 0x00000001, 0,
+	PLL(CLK_APMIXED_APLL2, "apll2", 0x01A0, 0x01B0, 0, 0,
 		31, 0x01A0, 1, 0x01B4, 0x01A4, 0),
 };
 
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
