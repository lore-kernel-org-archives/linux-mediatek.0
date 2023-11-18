Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E181DC5ACB3
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Nov 2023 13:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h1wtPYbuvCrxzK3zVYcy+dqMNAt++iVN9XJT5RdrMlU=; b=LoigT2OmwQ3H6w
	esD7WUzcwDb+hEWs5wwFOKWTml7POuEKG+DtVoKRuaowds1Cc1re4NkPD6X2DjxnA96QmKPIzYUSX
	2x/UpFaYY0bzzinWY9FiC7wBlAJGR2oNjDWYtjUpPz5Qpdk7XsXEg3L7vlpBig0rUBz9jLksjUC0X
	PcCFXY2AiQAEkjhXJD/OYVXeKcwq0Je9RTgZi4QLjRlW5qgrNvX5Dd63TDH9ibfZjvyyEpN+mki7y
	wnUqsWyvtEpEZvfP0KT5KWazFEmZB2q8xwWcZ2BSi2IaFHCHdy50OEUSdIinhrkfafFMk3y1wG3Wz
	YXfEpbyq2vIwlLSNnhoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4LA2-008Wvd-1v;
	Sat, 18 Nov 2023 13:14:58 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4L9z-008Wrw-0N;
	Sat, 18 Nov 2023 13:14:56 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 308CF20002;
	Sat, 18 Nov 2023 13:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1700313293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h1wtPYbuvCrxzK3zVYcy+dqMNAt++iVN9XJT5RdrMlU=;
	b=huj0uA40EXpEj+N00n8DwlkjzblQ5eqh2gaex0fcBiOFYukZHxlO0s1TA72cAdJUn0vwQS
	LA22YLgypbPSsoJvecdpGX99+sYre9Bvs71sT2F6U0qO/qjE2fu3mSj5ryE6DzAjpasRrT
	1DdzjOLP0qnbbiYjgMgDgbgI2eMHmglslDiD0la2xmw9+6Ci5+SO4C8bfTc1bAZgWhDnN0
	pnMNuNgKJutl30lPWa/QyCTSCDv0jUH+XMvxFK0G7cTkq3O2qe7h73rzy7FV0BU62wWORW
	uCvYETEfp9Oj4l/B1ZdJa5PXuJdxzVm74M8X5cXVWnizKYxwcf6gmzBwiWx6jw==
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
Subject: [PATCH net-next 14/15] net: dsa: mt7530: correct port capabilities of MT7988
Date: Sat, 18 Nov 2023 16:13:16 +0300
Message-Id: <20231118131317.295591-4-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231118123205.266819-1-arinc.unal@arinc9.com>
References: <20231118123205.266819-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231118_051455_299756_3B648A40 
X-CRM114-Status: GOOD (  11.97  )
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

On the switch on the MT7988 SoC, there are only 4 PHYs. That's port 0 to 3.
Set the internal phy cases to '0 ... 3'.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index f36f240231b5..ca42005ff3a9 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2562,7 +2562,7 @@ static void mt7988_mac_port_get_caps(struct dsa_switch *ds, int port,
 
 	switch (port) {
 	/* Internal PHY */
-	case 0 ... 4:
+	case 0 ... 3:
 		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
 			  config->supported_interfaces);
 		break;
-- 
2.40.1


