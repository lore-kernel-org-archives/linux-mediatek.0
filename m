Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B31CECAAA1
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Sep 2022 00:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IkyT/SH0Avq5x9pAHQMFR5EvWvl2e975Bdszn8X9P9s=; b=E6wKfVJhQJsyTrO6STBSDD5rC2
	k9XQmu7TUETn9ogIMTihHhGAXohsE4xzhS/U0PmjzjTudOMEd8n/JuSfUXIeaXpzOiG6Rnsnfxwj6
	k5AYyvNc5/CH8j0FjB1XheU5fcnzqAj+2wicbJIDTST8XMQgPl42nSMnaSd7AG4Y3ySxdkgIPMcAP
	qLWngEvD7l8QeRCvAElEeJmFFrpHfdAluOfxoWZXBInm2XN+FIKW6fMpVYe+f2f/Ierjed/pPKGr8
	MFEnyj54bGtKY32/OWZgFxlVENn9HAXAspeZl4au9eAamH1AuGXukGCDSKVwVAEGe2tRUUWsaCarF
	wOXVDO/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZLUm-000mKo-Bd; Sat, 17 Sep 2022 00:15:44 +0000
Received: from mail.base45.de ([80.241.60.77])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZLUK-000m6T-8r; Sat, 17 Sep 2022 00:15:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fe80.eu;
	s=20190804; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=IkyT/SH0Avq5x9pAHQMFR5EvWvl2e975Bdszn8X9P9s=; b=S54Kp3bJO79v4211GDHYBIU+zV
	jL4e6Kja0mIZtuKhYb1cRkkeMIonNJEhCBWwuJ0t0JZs2F/R1XvxH1q3vxwuDYPZJXNO084kWy0um
	AlWk/CNQgTbt5NlPEWtmEV0kpiIBsUxNmRfzfNNe4mWnwPpNFb2v07r1VCgrVrBI5j5U8JQtkCvrY
	7cH5FhJjm7IEosL5ErHj0P/THGgTtwjERmZDd4rs/MnMQOi4x1z8OYBMuIXh1xeYheF6Iai1xV2Gw
	bjGN5PsS5W4i/5dyVTBKZ2w3rImDsxJzkYVzgK3K27MND4jvM0/2HTtyr7LNMPrYUFhuTGIsbcjmk
	aSG5Fj2Q==;
Received: from p4fd2bf05.dip0.t-ipconnect.de ([79.210.191.5] helo=localhost.localdomain)
	by mail.base45.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <lynxis@fe80.eu>)
	id 1oZLNF-000nP7-FD; Sat, 17 Sep 2022 00:07:57 +0000
From: Alexander Couzens <lynxis@fe80.eu>
To: Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Alexander Couzens <lynxis@fe80.eu>,
	Landen Chao <landen.chao@mediatek.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 2/2] net: mt7531: ensure all MACs are powered down before reset
Date: Sat, 17 Sep 2022 02:07:34 +0200
Message-Id: <20220917000734.520253-3-lynxis@fe80.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220917000734.520253-1-lynxis@fe80.eu>
References: <20220917000734.520253-1-lynxis@fe80.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_171517_362289_2C2AB161 
X-CRM114-Status: UNSURE (   9.55  )
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
2.37.3


