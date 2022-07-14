Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEA4C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 06:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RUj1kIzzmPsIa28lCu2BDs6aWyS0xl20LJnJPfHPdRQ=; b=BuZsaAS4LZetobMwXcenJ1iT6A
	MG6hzkWOedCwRt6yQIhWqIM6ZdM34GTNS4PlmQU2PAtSp0RZJvJdfKbWhuMzUQ1ECB+UgiHZAJN7R
	A+z5PlRRFUjue4fAvB+QSApfcf2oOM9rwWJ9b6EaR5GA6iGb6+BE+PFyFQNZVLdNNQZZahR3ygeEy
	mCNOkwHdtjoZnhqiOYUw3fJOgSNOAC+qSrykfoskqaAKYkcPNgoGubpzAEz1/kpusNUjdIVJ+273/
	4BApsMBP4md5SEZO7Q5IWKm18uO0atbCiU/q3fH3CzfgiScmBBeA9/m8zdKzfDd2cfVY3jrcuKKO0
	1LH75gtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBrun-00BG5d-To; Thu, 14 Jul 2022 06:01:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBruG-00BFu0-N4; Thu, 14 Jul 2022 06:01:02 +0000
X-UUID: 336e4d04565b424391929d9510f3f5f8-20220713
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:66fc217b-d5fa-44be-bbee-f1d389de2ce3,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:0fe375d7-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 336e4d04565b424391929d9510f3f5f8-20220713
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <biao.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 631712054; Wed, 13 Jul 2022 23:00:54 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 14 Jul 2022 14:00:16 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 14 Jul 2022 14:00:16 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: David Miller <davem@davemloft.net>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Biao
 Huang <biao.huang@mediatek.com>, <netdev@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <macpaul.lin@mediatek.com>, Jisheng
 Zhang <jszhang@kernel.org>, Mohammad Athari Bin Ismail
	<mohammad.athari.ismail@intel.com>
Subject: [PATCH net v5 0/3] stmmac: dwmac-mediatek: fix clock issue
Date: Thu, 14 Jul 2022 14:00:11 +0800
Message-ID: <20220714060014.18958-1-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_230100_778331_57346AF2 
X-CRM114-Status: UNSURE (   7.69  )
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

changes in v5:
1. add reivewd-by as Matthias's comments.
2. fix "warning: unused variable 'ret' [-Wunused-variable]" as Jakub's comments

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
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 22 ++++-----
 .../ethernet/stmicro/stmmac/stmmac_platform.c |  8 ++-
 3 files changed, 39 insertions(+), 40 deletions(-)

-- 
2.25.1



