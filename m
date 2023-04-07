Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25BBC77B6C
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 13:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+AqGSZF4EpWmaEiD6n9MEgNnwi2D/MewQMHt7iSnW7E=; b=TnkgZ0B2aQ55gt
	frhgi3XLOJUQl0Jqet7mxKN10ci4qN4kvlhewsT6r5efO+5x3NhFT9DvFZaUG2kRP7U79LTSeI1la
	LtMWuZ6YxlS5xUaj8doS9+RhlR1P3LXOihulQoJYGhS6p1zHMogbS77dDSTR4SouCDhgmP4TA+/1u
	ydU8JzENYs/n0mlXVvlzuw2Ba9bEAuWPA0TJ83f/etcwQq9ghKvqpXOUMEEqiSEHB2ku6Acrs4Xoe
	EhXp3cC4LKD5AYBkRAci0bklOrVUZiN6Tmk/SazmEZSJn4srafycsWq6J3gudVwKjd4htSW4HMR19
	EWyTYpGweFp9xUk2wzyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmR1-00ANqJ-1U;
	Fri, 07 Apr 2023 13:47:23 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmQl-00ANNC-2b;
	Fri, 07 Apr 2023 13:47:10 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-54bfa5e698eso130496997b3.13;
        Fri, 07 Apr 2023 06:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680875227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+AqGSZF4EpWmaEiD6n9MEgNnwi2D/MewQMHt7iSnW7E=;
        b=VX1EimEtMOkTO34wFtMJvKbArCSU19G6a8AO8Tz072/+hogV/MxTYryk/0IIRbEJyU
         c4bkZ8NytwXSMR7PMxJEw6GJlvohD3aFZs7GqodN3O5MGOKROvE9YpzYW+rKcsBsUgt1
         oAdVR1mwmTFw/NMwT+fl0T1EBA8E+5IiPDfipqm3T5P4W4tpncM9vsZezV/+v35OmUQ8
         Avf9RkcO57XAkmtvLnc1ZFK26tJr3pYpf8GWWArjfDRj/CZdztOdxsQ5P2h8MIutoq8I
         mlwKkL8DAkSFPQMLMHqicpotaJr+W+LeLkWV4i/HthJe1+/NtHjqnckEm1KFGHHHbun1
         3Ydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680875227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+AqGSZF4EpWmaEiD6n9MEgNnwi2D/MewQMHt7iSnW7E=;
        b=mLmEvIRlmBfOz7A0+iaEP23i8X8XTylFbGSMbWQ9Q1ALZihGepFYPsLlJbOLf8utQ2
         sJkNhS1hOeG4dJ426bPRTLBwstbPi7opRU0zR89301Cq9u2rO970TGgqA4S5ZgZQ17ve
         42kZ5a+zXQrRmX9GLt2y3YdKqh6HW+2AHcwf08Gf1icWqfLWd9wxHT0IjuSiH17KlqE/
         xlcRQzOz2ZRnIfrtXDinM7Od4E7dXuE/1Cfn7EovrAqbKtusPbEx8MooIgcEJob+prSA
         KKo1/SR74rPvXb+kcGAXK9mx9rLPGJ9rxhULSTG3Qgmp8CVWbwTDg0Xc2DVahEk/3pNP
         yOog==
X-Gm-Message-State: AAQBX9cQp9L+PMweZ8qaktnJmLszmG4hjj2VpXCTUQiq+S605+3bw3qC
	4s0pLguUOxKcqW5h/b5FkSU=
X-Google-Smtp-Source: AKy350bd4rVgZF/D5/SVxr84kIeTaWh4xVjOO6pj5hSbNZF7BBMQQiqrS+1ZBAKqayajatlpTyx9jg==
X-Received: by 2002:a81:7055:0:b0:54c:3ab:dd3e with SMTP id l82-20020a817055000000b0054c03abdd3emr2076162ywc.13.1680875227214;
        Fri, 07 Apr 2023 06:47:07 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id 139-20020a810e91000000b00545a0818473sm1034317ywo.3.2023.04.07.06.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 06:47:06 -0700 (PDT)
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
Subject: [RFC PATCH v2 net-next 07/14] net: dsa: mt7530: call port 6 setup from mt7530_mac_config()
Date: Fri,  7 Apr 2023 16:46:19 +0300
Message-Id: <20230407134626.47928-8-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230407134626.47928-1-arinc.unal@arinc9.com>
References: <20230407134626.47928-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_064707_865645_65EEBF81 
X-CRM114-Status: GOOD (  16.31  )
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
Cc: netdev@vger.kernel.org, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
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
index fc5428baa905..c636a888d194 100644
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
 static bool mt7531_dual_sgmii_supported(struct mt7530_priv *priv)
 {
 	u32 val;
@@ -2583,12 +2589,15 @@ mt7530_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
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


