Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82ED3C2BB3F
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Nov 2023 12:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A4UChF1BUauN6W28Ee+oXUFPu4N8R5M4US5PAgnczs4=; b=BzUQNdnY3htnHp
	JA+fkOjxYQCrX+SlzFkc/yzIl7icmzhpEdU7XrCiBlmf1zx+voLmUCyE6l1rkK2meoXbMleLVvCuz
	mdRDxbN+voOcuXOJ3SmPnxgtfHPhmlLZonNBZlAo60ntcXoWsbCFJktSXRxbBm62SOMmuG2rph1pI
	qpYfwkWq/qFyVsFc1292wNkQHRLxVZWks4uEmbCynf3Ml6wxhvZ28CK3AZZU0aYeIdZLuUEm0h2Zy
	yMPpJ8xGcjQlDY0s5C5OFkuj/QP4PoZO//ikaTS2ETdALXTUSRkF/8GKM6AT8gfkipjNb521/Rwi2
	NDuOp5T8s2pX/fWoiFfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4KVe-008Sdn-1m;
	Sat, 18 Nov 2023 12:33:14 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4KVV-008SYW-2v;
	Sat, 18 Nov 2023 12:33:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 17AF3E0005;
	Sat, 18 Nov 2023 12:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1700310784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A4UChF1BUauN6W28Ee+oXUFPu4N8R5M4US5PAgnczs4=;
	b=TA2qB8QuA710htbz4O+4ZVHGiqJRarLSXwaFP6VonUbPqFGxug1I3vIVoYnE0FFb+RQjeY
	yEGQu6us+mrL/TDiFHy6oxEhFjEh2F6eXa8RZ/80WzTYi7+uwpJFuAuiZxM0Oycgiyg7fj
	XUcI4Z8SUCUFgTgYTm5wDDxmnddh3/3HGIMFTbvZGqYHHxcDAx0LeiPX5VmzYBFTx72X+j
	u/7tC1ITqjyip38Vx7JT768QVGbJIib4n+umsDXE2gkVwcc0HZnQcFEatskE4l+Py04PPg
	rG5LdurPtA5EPLWrxMIQyo6D8YTLGOTKdET1tHTp98O3ymMoCEdgjdOd+HsJwQ==
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH net-next 02/15] net: dsa: mt7530: use p5_interface_select as data type for p5_intf_sel
Date: Sat, 18 Nov 2023 15:31:52 +0300
Message-Id: <20231118123205.266819-3-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231118123205.266819-1-arinc.unal@arinc9.com>
References: <20231118123205.266819-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231118_043306_095955_F8F70F7B 
X-CRM114-Status: GOOD (  12.13  )
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
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, erkin.bozoglu@xeront.com, mithat.guner@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use the p5_interface_select enumeration as the data type for the
p5_intf_sel field. This ensures p5_intf_sel can only take the values
defined in the p5_interface_select enumeration.

Remove the explicit assignment of 0 to P5_DISABLED as the first enum item
is automatically assigned 0.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 96d610f5bcf9..1b10b70c1508 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -683,7 +683,7 @@ struct mt7530_port {
 
 /* Port 5 interface select definitions */
 enum p5_interface_select {
-	P5_DISABLED = 0,
+	P5_DISABLED,
 	P5_INTF_SEL_PHY_P0,
 	P5_INTF_SEL_PHY_P4,
 	P5_INTF_SEL_GMAC5,
@@ -776,7 +776,7 @@ struct mt7530_priv {
 	bool			mcm;
 	phy_interface_t		p6_interface;
 	phy_interface_t		p5_interface;
-	unsigned int		p5_intf_sel;
+	enum p5_interface_select p5_intf_sel;
 	u8			mirror_rx;
 	u8			mirror_tx;
 	struct mt7530_port	ports[MT7530_NUM_PORTS];
-- 
2.40.1


