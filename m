Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C91C25B75
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jun 2024 11:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vVnZyr+Byd5IfmgdNdhgTlifSMH3+cJybEmR3qMbFvM=; b=btEYJwOZo9BQgh3alNc8pzmMTF
	ja7xjm0I5/Jll80UrdarPLqZDnEHGcsMenC589onKiM3C6YArCU3VawqF1QbToWzBeUK74foUVtzR
	oFvqWSE8H4GPdj3RMrYKG32luFBlVikmFmjy0D7eS7bUhSe9Y21so8ZEYXVQLjLk3hiea6vUxRpNZ
	T/tS+AXmaTDM74iNagD+rX07CdGs8R2iSyH4FY8aLjCJcVbrPaW7vdhjGIwiop5mJjqCII2njGCuh
	LUzZIobx+dZXDD8ccBplghp1l8s27myJ+MV75++PgTVPUNHFDWx7doGrD+Dipkx2HnucZkJfbWw2q
	5qH10nOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFB2f-00000009UNf-3BOg;
	Thu, 06 Jun 2024 11:12:25 +0000
Received: from mx1.t-argos.ru ([109.73.34.58])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFB2b-00000009ULS-1dm9;
	Thu, 06 Jun 2024 11:12:23 +0000
Received: from mx1.t-argos.ru (localhost [127.0.0.1])
	by mx1.t-argos.ru (Postfix) with ESMTP id 25990100003;
	Thu,  6 Jun 2024 14:11:43 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-argos.ru; s=mail;
	t=1717672303; bh=vVnZyr+Byd5IfmgdNdhgTlifSMH3+cJybEmR3qMbFvM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=a74KY71hgI+3T00Tg8UGiiq6XsAW2C7aRMPQe/Jz2QqMquL8glRnElIe9XXpYu418
	 hf6G3bFaNnv77YZxubbWhCcNbDE5E08Nvyha6yDPyasrBIW3nh3nMrc9z4m7G62E0n
	 IOgCxnhTma+plhiq4Mw9+wfQvn2JbpEEnQDh6QDpKdQcpCz7ORfVKfBgl8mF6dyWbV
	 wY4TYuTFQHVSaskRHKjVbygOWck7Fk3aYyTOS4ConnUgVlK4X2MaaogczHE/G6+s6H
	 gK32mQrUDQhIWLX0Qf+Ct5XWN+98XIpkVryf4lFtAFUs1Wbk1H4kw4Vrcacnwfq3vk
	 gTe9ST+JxB1fw==
Received: from mx1.t-argos.ru.ru (ta-mail-02.ta.t-argos.ru [172.17.13.212])
	by mx1.t-argos.ru (Postfix) with ESMTP;
	Thu,  6 Jun 2024 14:10:23 +0300 (MSK)
Received: from localhost.localdomain (172.17.215.6) by ta-mail-02
 (172.17.13.212) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Jun 2024
 14:10:03 +0300
From: Aleksandr Mishin <amishin@t-argos.ru>
To: Weiyi Lu <weiyi.lu@mediatek.com>, <stable@vger.kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Aleksandr Mishin <amishin@t-argos.ru>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Sasha Levin <sashal@kernel.org>, AngeloGioacchino
 Del Regno <angelogioacchino.delregno@collabora.com>, Markus
 Schneider-Pargmann <msp@baylibre.com>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <lvc-project@linuxtesting.org>
Subject: [PATCH 5.10/5.15/6.1] clk: mediatek: Add memory allocation fail handling in clk_mt2712_top_init_early()
Date: Thu, 6 Jun 2024 14:09:55 +0300
Message-ID: <20240606110955.35313-1-amishin@t-argos.ru>
X-Mailer: git-send-email 2.30.2
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
X-KSMG-AntiSpam-Info: LuaCore: 20 0.3.20 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;mx1.t-argos.ru.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;t-argos.ru:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/06/06 10:23:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2024/06/06 06:58:00 #25471362
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_041221_785818_816F111B 
X-CRM114-Status: GOOD (  12.33  )
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

The issue was introduced with commit e2f744a82d72 ("clk: mediatek:
Add MT2712 clock support")

In case of memory allocation fail in clk_mt2712_top_init_early()
'top_clk_data' will be set to NULL and later dereferenced without check.
Fix this bug by adding NULL-return check.

Upstream branch code has been significantly refactored and can't be
backported directly.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
---
 drivers/clk/mediatek/clk-mt2712.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt2712.c b/drivers/clk/mediatek/clk-mt2712.c
index a0f0c9ed48d1..1830bae661dc 100644
--- a/drivers/clk/mediatek/clk-mt2712.c
+++ b/drivers/clk/mediatek/clk-mt2712.c
@@ -1277,6 +1277,11 @@ static void clk_mt2712_top_init_early(struct device_node *node)
 
 	if (!top_clk_data) {
 		top_clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
+		if (!top_clk_data) {
+			pr_err("%s(): could not register clock provider: %d\n",
+				__func__, -ENOMEM);
+			return;
+		}
 
 		for (i = 0; i < CLK_TOP_NR_CLK; i++)
 			top_clk_data->hws[i] = ERR_PTR(-EPROBE_DEFER);
-- 
2.30.2


