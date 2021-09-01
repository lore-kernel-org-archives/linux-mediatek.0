Return-Path: <SRS0=BCEy=NX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA922C432BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 22:26:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63C7960F6C
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 22:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 63C7960F6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=98nF6RuwvmrvkQYZ3mH5UG35M9z530aZCY/2B3lMnPE=; b=ybBwacFsWFk1GR
	nJ62s2pFdMcCjJe8HswWXUn2J8W/BzNDc5BUSnsqUmj8tGCqYOufuyReEvonio/YgPtG+mrAYlKnD
	Vk006BBAlFL3kmX8pkCNDQdBbiXA8vXlYVd9ziOAsa5yP781QybqDRJtszrP8kBG3LWHPYi5+8+du
	6GA/dVyzx2DFvV9bC+NNc2qrWBEkvMwL1jnxoUmXV6s+Q2DGGOnDR6pqKN9/rtMeFujf/kh3t+lx7
	+hlngt8iAuHFadt1CvzKPiTLLLW1CCZlFS50d6ZT41Ty5acHwmN0z9eTIb578bbBmgmNWARLCbt0N
	qJcIlqpC2gfa71NRCZOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLYgC-007gTw-Gw; Wed, 01 Sep 2021 22:26:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLYfj-007gOW-V1; Wed, 01 Sep 2021 22:25:36 +0000
X-UUID: 4e7db1120cee4e04b0be2780c8fb28ff-20210901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=fet4Uy5iIMtl5w9/6xVb4u8ctmV6zbsJ5Yu7yBNEO0o=; 
 b=N25GjG0lwO+HAZ9guKxvB/26KlJmYy+TVpt2XIJuGnbF17K4+RS6QInK46ZQEwSCw8N/XJcF09L/6/g0OOB46Oea3QReheA6enTWGT9Z7B3/OPT595y+6kwrRQFKJN/xvwG9ngstsE6cdmk2y1OSzvrhXTPushn3W6FpJlYgRaQ=;
X-UUID: 4e7db1120cee4e04b0be2780c8fb28ff-20210901
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 598864066; Wed, 01 Sep 2021 15:25:29 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Sep 2021 15:25:28 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Sep 2021 06:25:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 2 Sep 2021 06:25:26 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Wendell Lin <wendell.lin@mediatek.com>, Hanks Chen
 <hanks.chen@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>, Miles Chen
 <miles.chen@mediatek.com>
Subject: [PATCH v3 0/4] clk: mediatek: modularize COMMON_CLK_MT6779
Date: Thu, 2 Sep 2021 06:25:23 +0800
Message-ID: <20210901222526.31065-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_152532_050480_8DF43756 
X-CRM114-Status: GOOD (  11.71  )
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

This patch set makes COMMON_CLK_MEDIATEK and COMMON_CLK_MT6779*
be able to built as kernel modules. Necessary symbols are exported
in this patch.

In previous discussion [1], Stephen commented that there must
be a user before exporting a symbol:

"
Is the mediatek driver compilable as a module? Last time I checked it
wasn't a module. I want an upstream modular driver that uses the symbol.
Otherwise we're exporting symbols when it doesn't need to be.
"

[1] https://lore.kernel.org/patchwork/patch/1278089/

---

Change since v1:
use module_platform_driver() instead of builtin_platform_driver()

Change since v2:
squash "bool to tristate" change


Miles Chen (3):
  clk: composite: export clk_register_composite
  clk: mediatek: support COMMON_CLK_MEDIATEK module build
  clk: mediatek: support COMMON_CLK_MT6779 module build

 drivers/clk/clk-composite.c            |  1 +
 drivers/clk/mediatek/Kconfig           | 20 ++++++++++----------
 drivers/clk/mediatek/clk-apmixed.c     |  3 +++
 drivers/clk/mediatek/clk-cpumux.c      |  3 +++
 drivers/clk/mediatek/clk-gate.c        |  8 ++++++++
 drivers/clk/mediatek/clk-mt6779-aud.c  |  4 +++-
 drivers/clk/mediatek/clk-mt6779-cam.c  |  4 +++-
 drivers/clk/mediatek/clk-mt6779-img.c  |  4 +++-
 drivers/clk/mediatek/clk-mt6779-ipe.c  |  4 +++-
 drivers/clk/mediatek/clk-mt6779-mfg.c  |  4 +++-
 drivers/clk/mediatek/clk-mt6779-mm.c   |  4 +++-
 drivers/clk/mediatek/clk-mt6779-vdec.c |  4 +++-
 drivers/clk/mediatek/clk-mt6779-venc.c |  4 +++-
 drivers/clk/mediatek/clk-mt6779.c      |  2 ++
 drivers/clk/mediatek/clk-mtk.c         |  8 ++++++++
 drivers/clk/mediatek/clk-mux.c         |  4 ++++
 drivers/clk/mediatek/clk-pll.c         |  4 ++++
 drivers/clk/mediatek/reset.c           |  2 ++
 18 files changed, 69 insertions(+), 18 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
