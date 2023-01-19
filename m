Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB12C00A5A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 13:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ucNqQrBv58FmJgsbqN8x3M/G1cfrpq7tqtLwGp8Zts=; b=cFqQ9R5HSJDYUsHWhe15SuQ6z/
	EkxKQ+dBS0o2tEe3TBJr8HWMAeNGrojeTfPTk3U1N9jBF4x3gtiW8TTP1Ys4p0YC/KPcIhOKLU/Li
	QebQbNFrncsp6+WvdCs0TktiYJYrU40LM1hA3jDNYrLM+rCrK/wpugMcwxL8b04agFF4aksX+K1aG
	zXspCk/ZqC/vd4znyu9NnrvNabQXv6GySkHGxPgzufssXtFh3qc7k+px0W52/EA4gcrIuS/GhOU0F
	EnOhDZlVNrfIjTtg/RfrfhjNoz5kibVB/BJVNIvV8Iq2pdS5kmZl57w4tn7Io7UkyDgLxHIefdweu
	5VFpsjlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIUnR-0053Oh-3N; Thu, 19 Jan 2023 13:17:37 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIUe9-004zhj-8I; Thu, 19 Jan 2023 13:08:05 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 17FA41A00;
	Thu, 19 Jan 2023 14:07:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1674133679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8ucNqQrBv58FmJgsbqN8x3M/G1cfrpq7tqtLwGp8Zts=;
	b=BO/W7ryvR8JDotAf4gWdeS8Dhl59cGsFoi2/VnxatK00UV12d84+KVEVwGfDL8trZQBnc+
	49hLDoUSNcQCQtN4ZVeOAI0dyEb+tNHVH1L8GNuYlK+07FEsRD3IRwEQZ5B/adTcnrzazY
	HmDIqU/fUL97iMbwdSjzRRA0kOypKtd15rrc/7qZAdyJRUQumxYBxBGm6d53iZtp4z6V3n
	HwP+BjH8gf176YsJHMPazgLiq1kx4TNoXJTop86c7QkTOAueyZsuTW7tzMcpeJRYRRXmkH
	RV1t7L68Q23HalVppN3uKO0DLIapfih8QyyqhJ5svBPlhCLRnlxVS4vNivCqiQ==
From: Michael Walle <michael@walle.cc>
To: Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Wells Lu <wellslutw@gmail.com>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Tobias Waldekranz <tobias@waldekranz.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Michael Walle <michael@walle.cc>
Subject: [PATCH RESEND net-next 2/4] net: ngbe: Drop mdiobus_c45_regad()
Date: Thu, 19 Jan 2023 14:06:58 +0100
Message-Id: <20230119130700.440601-3-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230119130700.440601-1-michael@walle.cc>
References: <20230119130700.440601-1-michael@walle.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_050801_555001_461EE0B2 
X-CRM114-Status: GOOD (  11.31  )
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

With the new C45 MDIO access API, there is no encoding of the register
number anymore and thus the masking isn't necessary anymore. Remove it.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/net/ethernet/wangxun/ngbe/ngbe_mdio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/wangxun/ngbe/ngbe_mdio.c b/drivers/net/ethernet/wangxun/ngbe/ngbe_mdio.c
index ba33a57b42c2..c9ddbbc3fa4f 100644
--- a/drivers/net/ethernet/wangxun/ngbe/ngbe_mdio.c
+++ b/drivers/net/ethernet/wangxun/ngbe/ngbe_mdio.c
@@ -92,7 +92,7 @@ static int ngbe_phy_read_reg_mdi_c45(struct mii_bus *bus, int phy_addr, int devn
 
 	wr32(wx, NGBE_MDIO_CLAUSE_SELECT, 0x0);
 	/* setup and write the address cycle command */
-	command = NGBE_MSCA_RA(mdiobus_c45_regad(regnum)) |
+	command = NGBE_MSCA_RA(regnum) |
 		  NGBE_MSCA_PA(phy_addr) |
 		  NGBE_MSCA_DA(devnum);
 	wr32(wx, NGBE_MSCA, command);
@@ -121,7 +121,7 @@ static int ngbe_phy_write_reg_mdi_c45(struct mii_bus *bus, int phy_addr,
 
 	wr32(wx, NGBE_MDIO_CLAUSE_SELECT, 0x0);
 	/* setup and write the address cycle command */
-	command = NGBE_MSCA_RA(mdiobus_c45_regad(regnum)) |
+	command = NGBE_MSCA_RA(regnum) |
 		  NGBE_MSCA_PA(phy_addr) |
 		  NGBE_MSCA_DA(devnum);
 	wr32(wx, NGBE_MSCA, command);
-- 
2.30.2


