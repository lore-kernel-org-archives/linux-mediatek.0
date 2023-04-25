Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF0BC77B61
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 08:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qYvT8p6k4QzjjyECcMuC9v3ADC+KmlXGNmZgRR/65Uw=; b=BaL2qo+Dn0iToW
	jIAnctLXQKqu5GWc2qMyO6CtpYfwyJvVWt/rKY+dMpqzFpCqalBYufxOe6xfjxUzl5n+XTWlnlvMk
	Gths/ABw/FRFRHWcZ/cafuPQu+9LX1RxCxuVLy0O/NV6DG+8ixuF+7HqV8j/6T1YrXbRTbgXhp6x9
	sDWJo14SOXfPeMAyo1k3K7ZqPvSEbGacSEEF+2GQD0IWkoYIDIvkoDbkWrHJ5peg1BX+OFQQzB0mV
	lmKUlH7Xb0/YOeTX300uvbJfrrb42D3zxNa/1UB35wkm+W+jNEaLl8K99aO2ULA0/cTEjiKSnaM0z
	zlLYIBoPjb+hdTlZ7PYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prE4Q-000V5I-1v;
	Tue, 25 Apr 2023 08:30:42 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prE46-000Ukd-0G;
	Tue, 25 Apr 2023 08:30:23 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-94ef0a8546fso856403066b.1;
        Tue, 25 Apr 2023 01:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682411418; x=1685003418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYvT8p6k4QzjjyECcMuC9v3ADC+KmlXGNmZgRR/65Uw=;
        b=UFAWV+1nlYwHQzmvVoN+/ZGHkk8Ew6bnLA4u2VQgfyZAcCJBju7Y+Fnro9dB2ZJtL0
         C/alKxlYDz+fVsz2Ihz4l80W0RV4ghlklTO7m0U8xCQt3BL19sExvBSbXszlA0fF6KUk
         1eITtM+juvDNuYId73jffkWAARmjB9pviSHpLvr0G3+bvGzduU7EIE32owSg70FaHljV
         wWYUuWlVANCESpYjAgJirzkcRVCU0+Wvx1QVDp7nZ1Pi0nATIdzczuM2KNxXe/rTEbfl
         P/9HAYz0wiH6MA/4MS7xf+biFw8kB9lzoyu7P1N1r3+3b+uBVZAXKHytk6mRS/8QVtFP
         xxbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682411418; x=1685003418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYvT8p6k4QzjjyECcMuC9v3ADC+KmlXGNmZgRR/65Uw=;
        b=POE6p8UexgSDMPDwjq+5WL/GLFQg2bzYtfX80Oy48LSEgoKna81KlDBVxkJZmj6gFa
         ty+8nm8S7u0ME+AVhPScHsj0xU8VUk4Ovsxfqf3iX8RYl6P6KQ8ctD5EfHxfBBMu3DYl
         6fX/C0MqSgsLgHErGmw8zAcGzw6oZz8K+vogwSCjTX4hEKc6e/TeC7KPplXbc1MrZCDa
         ihIELaq1M46fcm3NPsHt4dJ1QE0jkFx/XbDj9GzW+b1tf6/D11A9nDEWCm72ISwqfyqD
         VIZFkWZEWfpBnVlhLOcmj2xBbUcgKeWTuEnDtOT0V11wLs3MCirwnmSm+nbHPDWsJgVV
         pzDQ==
X-Gm-Message-State: AAQBX9epLIxJ59h/MdaXvMlKOL6KjvKNiaUPjgrTvP+3vzSVH4cJbbtZ
	0+94NB8MqFz9p+bHaoktLIE=
X-Google-Smtp-Source: AKy350bujQz7yBAk7lju8dfbrKLpTH57gUasXDGEw8almcL4eBYWv7XfFoi97n3oFAUp43HpRDReTw==
X-Received: by 2002:a17:906:d8ac:b0:94f:37af:d21b with SMTP id qc12-20020a170906d8ac00b0094f37afd21bmr12578329ejb.74.1682411418239;
        Tue, 25 Apr 2023 01:30:18 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id mc2-20020a170906eb4200b0094ca077c985sm6439028ejb.213.2023.04.25.01.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 01:30:17 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
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
Subject: [PATCH net-next 11/24] net: dsa: mt7530: call port 6 setup from mt7530_mac_config()
Date: Tue, 25 Apr 2023 11:29:20 +0300
Message-Id: <20230425082933.84654-12-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230425082933.84654-1-arinc.unal@arinc9.com>
References: <20230425082933.84654-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_013022_159704_B4D3ABAA 
X-CRM114-Status: GOOD (  16.70  )
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
Cc: netdev@vger.kernel.org, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

mt7530_pad_clk_setup() is called if port 6 is enabled. It used to do more
things than setting up port 6. That part was moved to more appropriate
locations, mt7530_setup() and mt7530_pll_setup().

Now that all it does is set up port 6, rename it to mt7530_setup_port6(),
and move it to a more appropriate location, under mt7530_mac_config().

Leave an empty mt7530_pad_clk_setup() to satisfy the pad_setup function
pointer.

This is the call path for setting up the ports before:

mt753x_phylink_mac_config()
-> mt753x_mac_config()
   -> mt7530_mac_config()
      -> mt7530_setup_port5()
-> mt753x_pad_setup()
   -> mt7530_pad_clk_setup()

This is after:

mt753x_phylink_mac_config()
-> mt753x_mac_config()
   -> mt7530_mac_config()
      -> mt7530_setup_port5()
      -> mt7530_setup_port6()

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index b3db68d6939a..6815d2579f37 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -401,7 +401,7 @@ static void mt7530_pll_setup(struct mt7530_priv *priv)
 
 /* Setup port 6 interface mode and TRGMII TX circuit */
 static int
-mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
+mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 {
 	struct mt7530_priv *priv = ds->priv;
 	u32 ncpo1, ssc_delta, trgint, xtal;
@@ -473,6 +473,12 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
 	return 0;
 }
 
+static int
+mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
+{
+	return 0;
+}
+
 static int
 mt7531_pad_setup(struct dsa_switch *ds, phy_interface_t interface)
 {
@@ -2570,12 +2576,15 @@ mt7530_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 		  phy_interface_t interface)
 {
 	struct mt7530_priv *priv = ds->priv;
+	int ret;
 
-	/* Only need to setup port5. */
-	if (port != 5)
-		return 0;
-
-	mt7530_setup_port5(priv->ds, interface);
+	if (port == 5) {
+		mt7530_setup_port5(priv->ds, interface);
+	} else if (port == 6) {
+		ret = mt7530_setup_port6(priv->ds, interface);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
-- 
2.37.2


