Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B414CC25B08
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Aug 2022 21:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XVdSO+LLShiZFjjo6gZ2NwG/b06thMWpGK03N4kUpYI=; b=dNYcilCPF5S0cUVTNfNmNwMzj4
	/q7HOgCCrupAIvDkPYpC+IP/2JidWlylECgmr54ToY0MK92g2LgUi5c6lZfz42FB7s7CtTwyC+xnc
	1oZrEMhJDytOON6dzPrMB82BDcrR3mir0FCAhpD+neLJ8+1BV2qUrwQfl/bMSR2sAZjX6bNKuP70u
	iqEKcyBdtPJA7pTjsBrmPnlwcLqzPOWAfXWVvsGbjPiNgS03G2UvqxqQZyTrSt4Hc826DPLeXdBuG
	sw2kp+i8MCe8vuNrn0O2ojs1WDOQYu9tXfCViKFxbxwBD2bbEwBxEiyMqvtLoEu+0Y1FNVQm2Dha5
	G76g9yNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPWA9-00CXPE-49; Sat, 20 Aug 2022 21:37:49 +0000
Received: from mail.base45.de ([2001:67c:2050:320::77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPWA6-00CXMt-1i
	for linux-mediatek@lists.infradead.org; Sat, 20 Aug 2022 21:37:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fe80.eu;
	s=20190804; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=XVdSO+LLShiZFjjo6gZ2NwG/b06thMWpGK03N4kUpYI=; b=Hap6V3GTUX/nYHEuKAdPEgZF+w
	8wxrlcyg4lbdUdppjfeFjMzxuwp0gMRSsqEj6HOMk9KatCPy8CmWX4XaY3ad4ZU08D8USOSQKHLhA
	m3C65MyshDrOWy5U7e53VSUmI8cllbXF5c/x3tGCUDXLqljiQ8659ZUUmsj6vrXXB1ZuH2fRFpEBX
	zcQBRDZWOIufmjJvNXYdHs30prcGE+NLCyzEC4kWGVroaa4wu1xszRyPu1BQiWR0+hYW1ScEfMCGl
	6HRJ8+iJ5Vh9PKUEyuAdOXx25/AmIzSoMCYrlForGc2Jx9zGTsu7s/1xJWKppFFcWd/xoWETlulhz
	T3Q1NjuA==;
Received: from [2a02:2454:9869:1a:9eb6:54ff:0:fa5] (helo=cerator.lan)
	by mail.base45.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <lynxis@fe80.eu>)
	id 1oPW9q-00G1Te-QT; Sat, 20 Aug 2022 21:37:30 +0000
From: Alexander Couzens <lynxis@fe80.eu>
To: Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Daniel Golle <daniel@makrotopia.org>,
	netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Couzens <lynxis@fe80.eu>
Subject: [PATCH 2/2] net: mt7531: ensure all MACs are powered down before reset
Date: Sat, 20 Aug 2022 23:37:07 +0200
Message-Id: <20220820213707.46138-2-lynxis@fe80.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220820213707.46138-1-lynxis@fe80.eu>
References: <20220820213707.46138-1-lynxis@fe80.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220820_143746_436320_D559C27E 
X-CRM114-Status: UNSURE (   8.03  )
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

The datasheet [1] explicit describes it as requirement for a reset.

[1] MT7531 Reference Manual for Development Board rev 1.0, page 735

Signed-off-by: Alexander Couzens <lynxis@fe80.eu>
---
 drivers/net/dsa/mt7530.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 95a57aeb466e..409d5c3d76ea 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2329,6 +2329,10 @@ mt7531_setup(struct dsa_switch *ds)
 		return -ENODEV;
 	}
 
+	/* all MACs must be forced link-down before sw reset */
+	for (i = 0; i < MT7530_NUM_PORTS; i++)
+		mt7530_write(priv, MT7530_PMCR_P(i), MT7531_FORCE_LNK);
+
 	/* Reset the switch through internal reset */
 	mt7530_write(priv, MT7530_SYS_CTRL,
 		     SYS_CTRL_PHY_RST | SYS_CTRL_SW_RST |
-- 
2.35.1


