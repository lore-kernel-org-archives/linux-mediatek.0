Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5568C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 00:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tvJTDyvwrwZb1d7RM9P+uAws4uGt3Pojf/Qre45m9TI=; b=y9E17/r7J8QllU
	sswQkJ1Xq8LcjAjcTRYjFQ3O5IrFql9EcTWQGU2tVnG9VryXYv53KCixb34Wga6vzmRfJ80COAnT+
	us5+6w2O7liKh7Cq8CZ4Gw3bzzZJTzJiyc0wkdtMqFVTsEO2OBHABZEZaxrnX8LtVSVX93sn5J9Jc
	dgHYo6nivCAj7a7jytcxTBOUKa1zDyC2oynFL2LT2+TfJ1EaYtf4F0qNo8Gs0fGsuTNK5BIUyaiMO
	iwXyUZdkrUjzeWJI/BdqtmXZVlLjxUGGGv54CXOeShePrlcnGCp1sBAsM9y6djY4jfbtru6EPQeR6
	8DEqVk9jQ+qTRommpwYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6j2C-008ezf-2V; Mon, 10 Jan 2022 00:59:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6j1z-008ewE-7r; Mon, 10 Jan 2022 00:59:29 +0000
X-UUID: 2c49dcd022d24efb886776fa942a4d46-20220109
X-UUID: 2c49dcd022d24efb886776fa942a4d46-20220109
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2052161533; Sun, 09 Jan 2022 17:59:22 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 9 Jan 2022 16:59:20 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 10 Jan 2022 08:59:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 10 Jan 2022 08:59:18 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [v2 0/3] Integrate vppsys with mtk-mmsys in MT8195
Date: Mon, 10 Jan 2022 08:58:59 +0800
Message-ID: <20220110005902.27148-1-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220109_165927_306862_78A8B199 
X-CRM114-Status: UNSURE (   7.75  )
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

This patch series is based on 5.16-rc6.

change since v1:
- remove vppsys in clock document
- unregister clock when fail to add clock provider

Chun-Jie Chen (3):
  clk: mediatek: Add error handle when fail to register clock provider
  dt-bindings: ARM: Mediatek: Remove vppsys in MT8195 clock document
  clk: mediatek: Integrate vppsys with mtk-mmsys in MT8195

 .../arm/mediatek/mediatek,mt8195-clock.yaml   | 16 -------
 drivers/clk/mediatek/clk-mt8195-apmixedsys.c  |  5 ++-
 drivers/clk/mediatek/clk-mt8195-apusys_pll.c  |  5 ++-
 drivers/clk/mediatek/clk-mt8195-topckgen.c    |  5 ++-
 drivers/clk/mediatek/clk-mt8195-vdo0.c        |  5 ++-
 drivers/clk/mediatek/clk-mt8195-vdo1.c        |  5 ++-
 drivers/clk/mediatek/clk-mt8195-vpp0.c        | 42 ++++++++++++-------
 drivers/clk/mediatek/clk-mt8195-vpp1.c        | 42 ++++++++++++-------
 drivers/clk/mediatek/clk-mtk.c                | 14 ++++++-
 drivers/clk/mediatek/clk-mtk.h                |  1 +
 10 files changed, 89 insertions(+), 51 deletions(-)

--
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
