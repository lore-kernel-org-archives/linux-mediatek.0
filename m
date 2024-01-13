Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23661C4706C
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jan 2024 10:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LSKWVbeKaEgi3v3uISobEzTpPXktyePmA/wEfRZmpHA=; b=g61WilDjJbvPPscp8ETrys+xq0
	V0puSrqHqlcgEyGN4WcQsObPinsvB8yOKrl4v5kAWTw3mN/To4NTGC/Ph2ys9uro/wE3mNhI7NVsD
	sdu1To9QzTaR8bJZW0lyGrhCXgiMNwStxEXoZq/JbbDe/0V+RxaexB5UyDUJG5oE/8LF8xhk//1Cp
	2RbdArEghbKOkZRDyjE5LqhnUEfluUVX9GqAwgDgPWbQmpgQRks+osdUgP2r57gJDglbfnj8igAv2
	r27af8j+TVR5BC0/PB68d1FRLFw9UoKaiNbBX00RGDmepeVTPM6PJHC7/JUlVSMBDtLungYix1Fci
	LDDx1izw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rObDi-004tO3-0I;
	Sat, 13 Jan 2024 10:26:30 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rObDZ-004tJ1-1h;
	Sat, 13 Jan 2024 10:26:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32F126000C;
	Sat, 13 Jan 2024 10:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1705141580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LSKWVbeKaEgi3v3uISobEzTpPXktyePmA/wEfRZmpHA=;
	b=CRr8yp6eLY7+tpctHtfEmkzozpPnFgS0GiaeeorivUlms4KlUduGV4Xhc1knp8MbCtiGi1
	EdoZ7NLQEwqOPg9CnVL51dA/yNiQaWdjdz1spX9P2/jnOTleHFOER6gUlQC7g6fR5wpqUb
	mICbcAFd64mqDxplvUmPY4j6MOhfIruv1DqqRH78p0YMZ9VuW5L9ag04vdN+SGYpRUTGoV
	lgQ4WeJbqOni4XsR9Oa43YxwiBWIXIyIh1ZlrjPV9FPIH8RXcjMb+mOzQK11T15U3TZE5p
	7+A9u/XwjqXpS5ik/BEetXExzS2AH1Tuhb36Q3fKjOBSLvwY2meY50TSkL8dMw==
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
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mithat.guner@xeront.com,
	erkin.bozoglu@xeront.com,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [RFC PATCH net-next 8/8] net: dsa: mt7530: do not clear config->supported_interfaces
Date: Sat, 13 Jan 2024 13:25:29 +0300
Message-Id: <20240113102529.80371-9-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240113102529.80371-1-arinc.unal@arinc9.com>
References: <20240113102529.80371-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240113_022621_696656_5717C312 
X-CRM114-Status: GOOD (  10.37  )
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

There's no need to clear the config->supported_interfaces bitmap before
reporting the supported interfaces as all bits in the bitmap will already
be initialized to zero when the phylink_config structure is allocated.
There's no code that would change the bitmap beforehand. Remove it.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index e7e7e89d8eca..361a9cda48eb 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2558,8 +2558,6 @@ static void mt7531_mac_port_get_caps(struct dsa_switch *ds, int port,
 static void mt7988_mac_port_get_caps(struct dsa_switch *ds, int port,
 				     struct phylink_config *config)
 {
-	phy_interface_zero(config->supported_interfaces);
-
 	switch (port) {
 	/* Internal PHY */
 	case 0 ... 3:
-- 
2.40.1


