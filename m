Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F63AC25B75
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jun 2024 11:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vp9npdqLFP/lcQh3A2I1pzb9L/b0Qc1VzUDSRtwXlK8=; b=aRUCqLaHMIg1/F4J3o8vxI8Khf
	325QfBk3U9+trtOkMe4PHNcKNjvDgTvAIXhFlaz4WkwJq2fksPsAt7tpwSUVsFRZs+gC1ol55xZ0J
	UkpwlXY3QHiegqsUuI4Me4RmOxuWES6MD74L2vzqPfvAVWnGDv1ld2CnFAuZPpvtDDMqwEo9z81RZ
	MFmITFY5trgbcteDFcyxGi0RhB6eefhdS0sjP0Jb8vnw+GRC0XxbTPEHhNzI7kMeaa/TKLET1FB//
	sWb176E1Jiy585DmyO91DsQXs2L0RlXSrR4N/AkhB8L2yS8bwe/1NtpOk7D1ouIwgptfcoYq7uODg
	jeN4MOJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFBCN-00000009VvH-0HPI;
	Thu, 06 Jun 2024 11:22:27 +0000
Received: from mx1.t-argos.ru ([109.73.34.58])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFBCI-00000009Vtc-3RFI;
	Thu, 06 Jun 2024 11:22:24 +0000
Received: from mx1.t-argos.ru (localhost [127.0.0.1])
	by mx1.t-argos.ru (Postfix) with ESMTP id 8FD82100003;
	Thu,  6 Jun 2024 14:21:44 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-argos.ru; s=mail;
	t=1717672904; bh=Vp9npdqLFP/lcQh3A2I1pzb9L/b0Qc1VzUDSRtwXlK8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=I9EZ7Y/l/fjO6n/oAcRH/YOp5FUAKQyMzKWX+LTTJMsXGwxuQjYQ1qUGOWSZSTzes
	 l3iSthS/hc3gv8HsAJaN4tLLFfopdY/rRrzesP14Oj7hwuWp/OndPfqtTXq/Z5/ES7
	 2Ijx2Sz1wGJp5yE618CIyQgfrKSyw23egjnhzQ97nlQAXJqhLt8ecPIVJzH2Qol0xd
	 y67kxhwIS0h+TUm+R0BPb/CQVhKkXiQeMb8aoNodpOcwI1Te5JnrGap55OD73uBMiD
	 lE1J9ivBcvMqOThMDe4fR20stniW5V1Ka1i429sQyp0tEyPru7m49DOTjekWC2UHTV
	 MZDc/BRNO2NCg==
Received: from mx1.t-argos.ru.ru (ta-mail-02.ta.t-argos.ru [172.17.13.212])
	by mx1.t-argos.ru (Postfix) with ESMTP;
	Thu,  6 Jun 2024 14:20:24 +0300 (MSK)
Received: from localhost.localdomain (172.17.215.6) by ta-mail-02
 (172.17.13.212) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Jun 2024
 14:20:03 +0300
From: Aleksandr Mishin <amishin@t-argos.ru>
To: Weiyi Lu <weiyi.lu@mediatek.com>, <stable@vger.kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Aleksandr Mishin <amishin@t-argos.ru>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Sasha Levin <sashal@kernel.org>, AngeloGioacchino
 Del Regno <angelogioacchino.delregno@collabora.com>, Markus
 Schneider-Pargmann <msp@baylibre.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: [PATCH 5.10/5.15/6.1 v2] clk: mediatek: mt8183: Add memory allocation fail handling in clk_mt8183_top_init_early()
Date: Thu, 6 Jun 2024 14:19:49 +0300
Message-ID: <20240606111949.35502-1-amishin@t-argos.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240606103402.23912-1-amishin@t-argos.ru>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.215.6]
X-ClientProxiedBy: ta-mail-02.ta.t-argos.ru (172.17.13.212) To ta-mail-02
 (172.17.13.212)
X-KSMG-Rule-ID: 1
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185766 [Jun 06 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: amishin@t-argos.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 20 0.3.20 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f, {Tracking_from_domain_doesnt_match_to}, mx1.t-argos.ru.ru:7.1.1;t-argos.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/06/06 10:23:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2024/06/06 10:36:00 #25485870
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_042223_207435_0D43A242 
X-CRM114-Status: GOOD (  12.34  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

No upstream commit exists for this commit.

The issue was introduced with commit c93d059a8045 ("clk: mediatek: mt8183:
Register 13MHz clock earlier for clocksource")

In case of memory allocation fail in clk_mt8183_top_init_early()
'top_clk_data' will be set to NULL and later dereferenced without check.
Fix this bug by adding NULL-return check.

Upstream branch code has been significantly refactored and can't be
backported directly.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: c93d059a8045 ("clk: mediatek: mt8183: Register 13MHz clock earlier for clocksource")
Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
---
v1->v2: Add "Fixes:" tag, fix subject misspell

 drivers/clk/mediatek/clk-mt8183.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk-mt8183.c
index 78620244144e..8377a877d9e3 100644
--- a/drivers/clk/mediatek/clk-mt8183.c
+++ b/drivers/clk/mediatek/clk-mt8183.c
@@ -1185,6 +1185,11 @@ static void clk_mt8183_top_init_early(struct device_node *node)
 	int i;
 
 	top_clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
+	if (!top_clk_data) {
+		pr_err("%s(): could not register clock provider: %d\n",
+			__func__, -ENOMEM);
+		return;
+	}
 
 	for (i = 0; i < CLK_TOP_NR_CLK; i++)
 		top_clk_data->hws[i] = ERR_PTR(-EPROBE_DEFER);
-- 
2.30.2


