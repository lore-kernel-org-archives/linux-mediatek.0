Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C4CCA0EC4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 22:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9nIv7jNtZ9HHdC/Wdm1DbcmNwjbQSb5fGpRTic0aOvg=; b=J/tGPFjvMGoLHPAlmrWV72Nd+7
	rOo5SJpZzNiaiHsw91ks+5erV2vWiGMAdYCfLuZBeIq0xXg3s4GfYHeqdWD1uXzZNn9sHUFuky4o3
	FAgNiBZAnbcQvIqW15MXo/3CmWenRnZgg7cHzZNlqwJGA/DM75GTpBnQW2+BHNg25W/CkgaYpLsYw
	m4qaaTtDKQ8nJwliu+A4W5I3MTDTXewj1puCg3ryzGTttFy0XixJWrpF//wCYVkbdevSbyjC8eDAo
	6gdiiV1YR2zJlUYr6eKlvNHJbtnHfonPTE2+UJT20E54Y6JP7npnCijfSiEVSKc4u3yeMOrOAfBg9
	zVdFSumg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulacp-00000009Crc-12tc;
	Mon, 11 Aug 2025 22:04:15 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXcV-00000008qD1-1HX8;
	Mon, 11 Aug 2025 18:51:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9nIv7jNtZ9HHdC/Wdm1DbcmNwjbQSb5fGpRTic0aOvg=; b=jYNMzakz7+57fTNSZSibLZLiFi
	PlkJpCXOm+piH+krrRpD4Ql/Dh6glhdF9sB5vQnFcp1MFs8YHOmG4bxN3beW6MAX/S9O21bJW6Rbr
	NZrXnQpgQIbFq/qvw17PYTyjvxfqCXijU6h+zbSFItlaQ/YqXWbW7I3tdS3RnulDxBmrScdEaFyYT
	/PElUBici815VU4YTN0R3cWk/U+53zdTd7K5GB78r5f/ws8ZdFTRJRxzzOg22lHEAq81BOd4bbtWP
	cdkeTcF2JHJYh8OOwLbjoUKAV3YDTcc1dW1vQkqPUVqzrjHIxwmqbJHwjrrq45jNxCtigevzwZ00C
	jpkS5WJA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53164 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1ulXcL-0003ae-0h;
	Mon, 11 Aug 2025 19:51:33 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1ulXbc-008gqf-GJ; Mon, 11 Aug 2025 19:50:48 +0100
In-Reply-To: <aJo7kvoub5voHOUQ@shell.armlinux.org.uk>
References: <aJo7kvoub5voHOUQ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 2/9] net: stmmac: provide a set of simple PM ops
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1ulXbc-008gqf-GJ@rmk-PC.armlinux.org.uk>
Date: Mon, 11 Aug 2025 19:50:48 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_115143_345918_08B510B4 
X-CRM114-Status: UNSURE (   8.89  )
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

Several drivers will want to make use of simple PM operations, so
provide these from the core driver.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      | 2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index cda09cf5dcca..bf95f03dd33f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -374,6 +374,8 @@ enum stmmac_state {
 	STMMAC_SERVICE_SCHED,
 };
 
+extern const struct dev_pm_ops stmmac_simple_pm_ops;
+
 int stmmac_mdio_unregister(struct net_device *ndev);
 int stmmac_mdio_register(struct net_device *ndev);
 int stmmac_mdio_reset(struct mii_bus *mii);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 2da4f7bb2899..4a82045ea6eb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -8013,6 +8013,9 @@ int stmmac_resume(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(stmmac_resume);
 
+EXPORT_GPL_SIMPLE_DEV_PM_OPS(stmmac_simple_pm_ops, stmmac_suspend,
+			     stmmac_resume);
+
 #ifndef MODULE
 static int __init stmmac_cmdline_opt(char *str)
 {
-- 
2.30.2


