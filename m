Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E55C48285
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 15:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oaAyNT2LWuFmORU3jThIy6uLADgUN/k7yjJggw9r8Ec=; b=1WXvwkxWKjutDtDrZxYzsFTlgg
	xybVBTOHz6c5C/6jWsmIYoYJtbIpPYXEV2KNHcTeHhFJoF0P7K6dqOc9ssfUi2F4t5ue9YpRPOC6R
	V5hu9LaCppwuOLYdL/Iy5lV8FQ8y4s2m5DJP7bTf/5QxMMDa8yGrkQEa1Ys9zS/Ua1ZE2u3qo3HyA
	1XcDE81pOzw20E2yw+FHquDaS5TkDKiE9p6bNBOWqYqodzOPMJZKtwQ8oVKz43hntLVFbS9SAHzjw
	bZdq9i6Dw1nE5yBCADOONXWOm/3ks4qHDHZgWhDM9X3Q6YRox//GeadnyFxkLmtHs5j9ZAsIftVJI
	73/6iZpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUpvQ-0000000H8yZ-2HYQ;
	Tue, 30 Jan 2024 15:21:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUpv0-0000000H8jM-0x6W;
	Tue, 30 Jan 2024 15:21:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 714CC60DE8;
	Tue, 30 Jan 2024 15:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2752C32785;
	Tue, 30 Jan 2024 15:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706628056;
	bh=BWFAhmyDn0dXC/zsLj0S9ZBcFvRqLWZWxXogBiUuX9g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PImc+K2xGIY3JI7K1VzqFSMwNhNDTd+mmgZRG5Dtu3FjvAy4u9y6Yhkrci4/zmRuF
	 ofdhV+HG8+vNoCc94jYlN8SpfDUHdpqceg++Rip6HvePausq1+tGU8L1RU0hK2tA0h
	 YXTZzoKtgt+9U9g5N68kVACh2ebgMieF/8AIZ6bL+KAGdre5S5BObNNLge0AhO7j9h
	 p2A652nHe7YTytfYdKQmlWzf1F8ScQD9GjtyCoRNNb9fepcDW3RIHOUMFTxAIpX698
	 luZcFgVGmw9KdJTovbZqwU6eV3JsyGFHN1Hnw0yVncKcM7N12ZVHRQWdi2AC2UL44F
	 QWp6bYHabvSIw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D147EC48285;
	Tue, 30 Jan 2024 15:20:56 +0000 (UTC)
From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= via B4 Relay
 <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Tue, 30 Jan 2024 18:20:53 +0300
Subject: [PATCH net-next v2 7/7] net: dsa: mt7530: do not clear
 config->supported_interfaces
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240130-for-netnext-mt7530-improvements-2-v2-7-ba06f5dd9eb0@arinc9.com>
References: <20240130-for-netnext-mt7530-improvements-2-v2-0-ba06f5dd9eb0@arinc9.com>
In-Reply-To: <20240130-for-netnext-mt7530-improvements-2-v2-0-ba06f5dd9eb0@arinc9.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706628055; l=1237;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=70kaAwqHDH0P1Gv6EzSD7mSiNMADYZJtk+fSkbKHmfQ=;
 b=TVVtN8mEHO79+KmnGvUmpew6seoWm0EKReP4aGo60q2n8tH+h0uxilLoOtvKujMITR2Roclq1
 7txFrBKy1ZXC/IkCurmACM0cfdaxQ/GD9jjN++kpstZGGdCu3GugObA
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt with auth_id=115
X-Original-From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_072058_392915_94D073F0 
X-CRM114-Status: GOOD (  10.68  )
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

There's no need to clear the config->supported_interfaces bitmap before
reporting the supported interfaces as all bits in the bitmap will already
be initialized to zero when the phylink_config structure is allocated. The
"config" pointer points to &dp->phylink_config, and "dp" is allocated by
dsa_port_touch() with kzalloc(), so all its fields are filled with zeroes.

There's no code that would change the bitmap beforehand. Remove it.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
 drivers/net/dsa/mt7530.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 638cd3f2a495..c6b40ca277f5 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2573,8 +2573,6 @@ static void mt7531_mac_port_get_caps(struct dsa_switch *ds, int port,
 static void mt7988_mac_port_get_caps(struct dsa_switch *ds, int port,
 				     struct phylink_config *config)
 {
-	phy_interface_zero(config->supported_interfaces);
-
 	switch (port) {
 	/* Ports which are connected to switch PHYs. There is no MII pinout. */
 	case 0 ... 3:

-- 
2.40.1


