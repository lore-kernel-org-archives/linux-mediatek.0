Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C285C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jul 2022 10:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rKN64A0HfqggG6cqO0crYzpz7R+YpQq3ZL4LHVHRCoE=; b=ObcxcM7/5fy5eVVvfOGOUV/lza
	A/tWheT+GPK+9V2r+lLp0MlDbDBepIB35H7I4zMWkMdeMQXOMgvgpnCBO02VrpdFfotOdFvjZJ/U9
	gGhjR9u37DBTkuzqgPKwM3+abfYf6st8mHxanp8eEEpaN9aZ9TFvNJ17eRN7cJxPVe5hISHDOz6Bq
	TPXeigMfv9JE1pkM6WLKh+deOxZzVudBZnM5pNdxjST3N4SEggMEFFPsJLj1iHXNM3GR5CbROydfF
	nh5o2uB3FJq81oMMSyRgl7BHZLk97Eef+WbAzl8nXaFpRI0d/DX5Pxk6mU/syBMJI4Aj/42plN9tp
	ULnCMuRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBZni-002lDE-UU; Wed, 13 Jul 2022 10:41:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBZnW-002l9m-Qz; Wed, 13 Jul 2022 10:40:52 +0000
X-UUID: b28c68ef8226481195648aada0b60c0e-20220713
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:cb65b83e-4764-49ea-8335-754f1a9cea6a,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:ebb1de32-b9e4-42b8-b28a-6364427c76bb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: b28c68ef8226481195648aada0b60c0e-20220713
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <biao.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 233170325; Wed, 13 Jul 2022 03:40:40 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 13 Jul 2022 18:10:04 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 13 Jul 2022 18:10:03 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: David Miller <davem@davemloft.net>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, "Eric
 Dumazet" <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Biao
 Huang" <biao.huang@mediatek.com>, <netdev@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <macpaul.lin@mediatek.com>, "Jisheng
 Zhang" <jszhang@kernel.org>, Mohammad Athari Bin Ismail
	<mohammad.athari.ismail@intel.com>
Subject: [PATCH net v4 0/3] stmmac: dwmac-mediatek: fix clock issue
Date: Wed, 13 Jul 2022 18:09:59 +0800
Message-ID: <20220713101002.10970-1-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_034050_895446_1CC45569 
X-CRM114-Status: UNSURE (   8.60  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

changes in v4:
1. improve commit message and test ko insertion/remove as Matthias's comments.
2. add patch "net: stmmac: fix pm runtime issue in stmmac_dvr_remove()" to
   fix vlan filter deletion issue.
3. add patch "net: stmmac: fix unbalanced ptp clock issue in suspend/resume flow"
   to fix unbalanced ptp clock issue in suspend/resume flow.

changes in v3:
1. delete mediatek_dwmac_exit() since there is no operation in it,
as Matthias's comments.

changes in v2:
1. clock configuration is still needed in probe,
and invoke mediatek_dwmac_clks_config() instead.
2. update commit message.

v1:
remove duplicated clock configuration in init/exit.

Biao Huang (3):
  stmmac: dwmac-mediatek: fix clock issue
  net: stmmac: fix pm runtime issue in stmmac_dvr_remove()
  net: stmmac: fix unbalanced ptp clock issue in suspend/resume flow

 .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 49 ++++++++-----------
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 21 ++++----
 .../ethernet/stmicro/stmmac/stmmac_platform.c |  8 ++-
 3 files changed, 39 insertions(+), 39 deletions(-)

-- 
2.25.1



