Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4A8C4828E
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Feb 2024 09:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0bf+AzYuidmGAXrJ/KcZhj2m3QTVE8Zz7jwmn1XMMro=; b=yiYVVpeT9IsaWfz4Fgzss/vSEk
	3nTa9J3sT6fToY7A3+woENyoC7YATNGejXFYV+sV1uABP/Ab5RfgpLsPsMatuKah37YyeKOaoMpnB
	IwHv6WQSz9X/dT6hKemCazDz314Qs34WXCaG5hBmyzaEC03i7VW5AOyjrSV6m1jtUR64uxT8sTiYT
	HiLQxxewWl7HCCoTHoAObMiISlrau/x1P6sufxaeY31zmJy4sXQIbim2FHElcbVSNo+GdfrEuTGH1
	eGiQlbMN3Ms+DjSUAqet1gEGDISdgK61xsiOgUigXGcY/8KXPn4uHOBnc067A8diZpMSnrmpAPKDi
	MTEVYqDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVpi1-0000000Auat-0J15;
	Fri, 02 Feb 2024 09:19:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVphu-0000000AuWV-2oww;
	Fri, 02 Feb 2024 09:19:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1312F623F4;
	Fri,  2 Feb 2024 09:19:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0733DC43142;
	Fri,  2 Feb 2024 09:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706865573;
	bh=EDH94Q0fIzWZXO02/75AuI4ovyw/xgjFBUiWt170Fhw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JQ8DzsSoXrZ4Lu8j9qD6TNpDEOTIhF+Tn8uCdvnD84m1zm0dg9lcBjCtPyPJ7PCaT
	 0Hdt3Q4L32rouOz0Ty7pfep19IeQBjRC5oY5aCszCSkYhFTlSTPKk1V2Wr7FLRMTtM
	 qYzuDe+UJY9w4LVn797Qj+cU1COpWkvRHVxvIb8w7cI0LApsyXgdgcAoGLSFGhTphg
	 RikOWTsGtPwxAvUUO5k79nQaOIZzqkAUe+odiXuZ2QhMPZNShNaiSSz37+3tiUgs9R
	 PtYkKh99zxXNFlbcRkPEP951R6yN0eL3UzWYYC5D4wqELShisMj3dc7MXEVqc+OfA6
	 RkgvIahXeEaWQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1BEC48294;
	Fri,  2 Feb 2024 09:19:32 +0000 (UTC)
From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= via B4 Relay
 <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Fri, 02 Feb 2024 12:19:12 +0300
Subject: [PATCH net-next v3 6/7] net: dsa: mt7530: correct port
 capabilities of MT7988
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240202-for-netnext-mt7530-improvements-2-v3-6-63d5adae99ca@arinc9.com>
References: <20240202-for-netnext-mt7530-improvements-2-v3-0-63d5adae99ca@arinc9.com>
In-Reply-To: <20240202-for-netnext-mt7530-improvements-2-v3-0-63d5adae99ca@arinc9.com>
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: mithat.guner@xeront.com, erkin.bozoglu@xeront.com, 
 Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706865569; l=1134;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=C+eRNzRMDtIba7vQLCEXXq4gYtY07Q6DrrKE/vhW8K8=;
 b=lNLVoRsMxDJZyiW6dmWXjSwLM7Gjg30vtnnsuEDfzBR2RLoRy8mx3yKz0TAFr0rzRug4RBdz7
 WydiIk7K0/ODghokoz9QPeZrSgr2vxqcF/DAd88ZwytJRfuxJtcLfcO
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt with auth_id=115
X-Original-From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_011934_841567_A9AD3BFC 
X-CRM114-Status: GOOD (  12.83  )
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
Reply-To: arinc.unal@arinc9.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

On the switch on the MT7988 SoC, as shown in Block Diagram 8.1.1.3 on page
125 of "MT7988A Wi-Fi 7 Generation Router Platform: Datasheet (Open
Version) v0.1", there are only 4 PHYs. That's port 0 to 3. Set the case for
ports which connect to switch PHYs to '0 ... 3'.

Port 4 and 5 are not used at all in this design.

Link: https://wiki.banana-pi.org/Banana_Pi_BPI-R4#Documents [1]
Acked-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index e1fdef5766fb..4ca7ba94788e 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2577,7 +2577,7 @@ static void mt7988_mac_port_get_caps(struct dsa_switch *ds, int port,
 
 	switch (port) {
 	/* Ports which are connected to switch PHYs. There is no MII pinout. */
-	case 0 ... 4:
+	case 0 ... 3:
 		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
 			  config->supported_interfaces);
 		break;

-- 
2.40.1


