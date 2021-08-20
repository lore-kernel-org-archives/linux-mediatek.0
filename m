Return-Path: <SRS0=yE1p=NL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20016C4320E
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 11:18:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8B9261040
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 11:18:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8B9261040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h/y0tSgQMd3/3MBH9uv+EeiGVdfZ7SEwL2GWQmVXGYw=; b=CEKRDFEe6misDG
	rOWheOMeuf8tbvx5yLGbTaUVXQ9KsyD1miyS+yDJPPhE3Xo079Vswq70l51XZH+decmkNCpY/jZCK
	DTd680DqDVvxZU0uwcptefU3YmpeOqKMoRrn1W9FCJ+ZhSlODfqIb3TaOTEjmZjPpZRiEYuTKgHeR
	KCiTAIYby2FSuAk3TPhjZdtvZJfcBNSTN1mmb45xztJ2dWwAt+6jPrIga9hazzH2u2131rInjPnXD
	IYK17HqC/Hstt5u7v/AbMvk/SYvc6QO+KMrZLGhlMm/ydtmZni6l5OkVZd9MKRHKD2lj7BB9vxGgO
	0epZGQmHz10tlpJHdcEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH2X7-00AmOC-2B; Fri, 20 Aug 2021 11:17:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH2WA-00Alsn-Ra; Fri, 20 Aug 2021 11:17:02 +0000
X-UUID: e3e1365e6a9047c8ac956ed257198fa2-20210820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=jANfMgIyskrX7AyAEGZcVwbCuHB5VJXJTaTrACTB3sY=; 
 b=Xr+lDKPIj9ZUSZtGYmCOiO7azZsJh/gZiKgQzVQAOJCShf5tbuxT0dC2KOySAWcV9xl2K4kHH2eFYEzQr6Iv6uOhBoBXIDVl9RlfGDotOuakyAMdHZC0+qNWDPbrPhqiR8kBOKxRVVOMgo4x0HUWnBvtMNUlYH8/HedJg0dzgu4=;
X-UUID: e3e1365e6a9047c8ac956ed257198fa2-20210820
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 409797885; Fri, 20 Aug 2021 04:16:55 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Aug 2021 04:16:52 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Aug 2021 19:16:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 20 Aug 2021 19:16:51 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [v2 03/24] clk: mediatek: Fix corner case of tuner_en_reg
Date: Fri, 20 Aug 2021 19:14:43 +0800
Message-ID: <20210820111504.350-4-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210820111504.350-1-chun-jie.chen@mediatek.com>
References: <20210820111504.350-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_041658_968017_F11A9E02 
X-CRM114-Status: GOOD (  13.51  )
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

On MT8195, tuner_en_reg is moved to register offest 0x0.
If we only judge by tuner_en_reg, it may lead to wrong address.
Add tuner_en_bit to the check condition. And it has been confirmed,
on all the MediaTek SoCs, bit0 of offset 0x0 is always occupied by
clock square control.

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index 7fb001a4e7d8..99ada6e06697 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -332,7 +332,7 @@ static struct clk *mtk_clk_register_pll(const struct mtk_pll_data *data,
 		pll->pcw_chg_addr = pll->base_addr + REG_CON1;
 	if (data->tuner_reg)
 		pll->tuner_addr = base + data->tuner_reg;
-	if (data->tuner_en_reg)
+	if (data->tuner_en_reg || data->tuner_en_bit)
 		pll->tuner_en_addr = base + data->tuner_en_reg;
 	if (data->en_reg)
 		pll->en_addr = base + data->en_reg;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
