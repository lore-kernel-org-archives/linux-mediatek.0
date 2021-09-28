Return-Path: <SRS0=GLpI=OS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEC57C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Sep 2021 08:47:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94B1361058
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Sep 2021 08:47:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 94B1361058
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5vk0z2upnLkVplU8Xz/vA3MdiyNtCWQHGzuRubJvXk8=; b=4qEa5thozN6T42
	BgyfiVJIfP47oKhZ5+SuUWx39sw5s8Jz5SxFlE88XCHSdlZB7E+e83y0XRuEYEihR2Q+AvwREz5yW
	j2otJF7f29Y0l9IUBQm55BHdOmbsgetdYWodTG/gNp1SHUBTcTm/AeYhkRcEgsxJCHTc9JoR/aMvu
	SZId0wLqr0bEfMRHVpwpFO8pzSG0dJuwP00xOAmVQJiKYUHZdCWvELEo5Za1Qb5SAVTdxxxa7MLEh
	Ncs3zsa8aH4lm2EruxDbPfEyWa4uGnj8EqyHiP8NhLRJJLSzNaF7G3+IQ9QFTmlByATdVrWRjm3Ks
	61oBZjdJATCoaMz3fJRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV8lK-006K5S-VS; Tue, 28 Sep 2021 08:46:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV8lG-006K3d-Da; Tue, 28 Sep 2021 08:46:52 +0000
X-UUID: dfe28a5ad1cf411989a3eaea33165015-20210928
X-UUID: dfe28a5ad1cf411989a3eaea33165015-20210928
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 228877366; Tue, 28 Sep 2021 01:46:48 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Sep 2021 01:36:46 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 28 Sep 2021 16:36:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 28 Sep 2021 16:36:45 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Leon Yu <leoyu@nvidia.com>, "David S . Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Russell King <linux@armlinux.org.uk>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <stable@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
CC: Miles Chen <miles.chen@mediatek.com>, Bear Wang <bear.wang@mediatek.com>, 
 Pablo Sun <pablo.sun@mediatek.com>, Fabien Parent <fparent@baylibre.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH] net: stmmac: don't attach interface until resume finishes
Date: Tue, 28 Sep 2021 16:36:20 +0800
Message-ID: <20210928083620.29090-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <YVLJGT7JAVc7rnBx@kroah.com>
References: <YVLJGT7JAVc7rnBx@kroah.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_014650_513888_51D87B0B 
X-CRM114-Status: GOOD (  12.25  )
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

From: Leon Yu <leoyu@nvidia.com>

commit 31096c3e8b1163c6e966bf4d1f36d8b699008f84 upstream.

Commit 14b41a2959fb ("net: stmmac: Delete txtimer in suspend()") was the
first attempt to fix a race between mod_timer() and setup_timer()
during stmmac_resume(). However the issue still exists as the commit
only addressed half of the issue.

Same race can still happen as stmmac_resume() re-attaches interface
way too early - even before hardware is fully initialized.  Worse,
doing so allows network traffic to restart and stmmac_tx_timer_arm()
being called in the middle of stmmac_resume(), which re-init tx timers
in stmmac_init_coalesce().  timer_list will be corrupted and system
crashes as a result of race between mod_timer() and setup_timer().

  systemd--1995    2.... 552950018us : stmmac_suspend: 4994
  ksoftirq-9       0..s2 553123133us : stmmac_tx_timer_arm: 2276
  systemd--1995    0.... 553127896us : stmmac_resume: 5101
  systemd--320     7...2 553132752us : stmmac_tx_timer_arm: 2276
  (sd-exec-1999    5...2 553135204us : stmmac_tx_timer_arm: 2276
  ---------------------------------
  pc : run_timer_softirq+0x468/0x5e0
  lr : run_timer_softirq+0x570/0x5e0
  Call trace:
   run_timer_softirq+0x468/0x5e0
   __do_softirq+0x124/0x398
   irq_exit+0xd8/0xe0
   __handle_domain_irq+0x6c/0xc0
   gic_handle_irq+0x60/0xb0
   el1_irq+0xb8/0x180
   arch_cpu_idle+0x38/0x230
   default_idle_call+0x24/0x3c
   do_idle+0x1e0/0x2b8
   cpu_startup_entry+0x28/0x48
   secondary_start_kernel+0x1b4/0x208

Fix this by deferring netif_device_attach() to the end of
stmmac_resume().

Signed-off-by: Leon Yu <leoyu@nvidia.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 10d28be73f45..56d227b31dbd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4853,8 +4853,6 @@ int stmmac_resume(struct device *dev)
 			stmmac_mdio_reset(priv->mii);
 	}
 
-	netif_device_attach(ndev);
-
 	mutex_lock(&priv->lock);
 
 	stmmac_reset_queues_param(priv);
@@ -4878,6 +4876,8 @@ int stmmac_resume(struct device *dev)
 
 	phylink_mac_change(priv->phylink, true);
 
+	netif_device_attach(ndev);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(stmmac_resume);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
