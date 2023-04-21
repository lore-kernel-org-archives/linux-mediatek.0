Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB531C7618E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 14:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dGp4Tpz0L6Hnx+AZWBjvMZvm9IQMQXkz0B/FgdPBTn4=; b=NFSulbclqbBYPN
	2z9JkecxtLl7aLm92eziaxyRQHWMYPkbe/VI6hiwiYjSUQrXup9jrFBQ4N2mrBbeNuvlR/kYsOQUk
	mJ24H2LVPrqU5/ZEx90t4q9ULfQQf4t7EAikg9rdI/EGmB0/G2lHXSpMhIF+F/fhs1msafFe2Cuap
	fz84rzpEHOEr4KFtJFQ4Ss0yIsWcPF14Jd+31SfhyBMrpfZAMOaiaMab4FGYMqKlDB0LEMhOHhCGc
	w2yMzfF3P5b4riXRLmR6/6JXyZeuqAHX1r/0YkqiB/eoPxP9+PPmKoclyra9LXJGUwzwnB5NWlOsw
	rwYARxPsJY3P4S9xyWQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppru7-00B8Ks-2I;
	Fri, 21 Apr 2023 14:38:27 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pprt1-00B7VG-0c;
	Fri, 21 Apr 2023 14:37:20 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5069097bac7so2999240a12.0;
        Fri, 21 Apr 2023 07:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682087837; x=1684679837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGp4Tpz0L6Hnx+AZWBjvMZvm9IQMQXkz0B/FgdPBTn4=;
        b=DKxnRcq+RzWJO70d64SCwn8dKlPjog49hc1bI/lDUd7zvlQYM1FDq/Uo0qUyQmhe6C
         XP29nVBG8TX2btLkfSZkKnuIZZD4/9USpgryKZHyukz1kwwLgkmrARL/z9tECfFyHF+C
         +L5anr9HLc5WuXgyatHdVLa7hvHrnr0L+MPIiofw/C25wuOmG2+0/ugEZuWQh7jdA8S1
         DmqqAbadrq7BjVR3QyNXQiUHSw2pUsqQVFcj80FHg0Nh0QJwGfYGpGt8gCZJRPp1+F2m
         MztENz1X7w+8PIij286h4jj6YK7bG2T+D+RK3MZnbe2PcIauAxTTGMitEGzmGusGfDxN
         DRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682087837; x=1684679837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dGp4Tpz0L6Hnx+AZWBjvMZvm9IQMQXkz0B/FgdPBTn4=;
        b=Azq8YrZRCYjyi5RIq8wP1UGf4YjgjGCgjklDGPsx4bqtB+KD1aT5EE/A33d1i6oDeT
         C8vuVPlRepZwUnwfWjHKwulxXje89MgXyojfCB3LtagU+f51/Y/VyfgiMmO9Vg6JcY+p
         gQou3tplHE9nqtfn0m2bdOR0aW6ozVfey3QFBrjXzxVg6JMx08IAtsGkuoPy1c7Hk/xO
         TmH5YERMgL2fefVPzldGl9SE3co0ototsdlAIWojnAmyPqCVtgNSJeyZdAxShBwLVwGY
         kPA6jyroXuRIWOKH4n8uCh3gdIJ8ptWRMqH37VrCskfnwSrQ06ZuEVPSb9qsgzOZuV4w
         BtoQ==
X-Gm-Message-State: AAQBX9csLe8YVdiNWbXLdPH0ZnlqbkzpTcEvoyYGU3akAyIh/VQS/mGZ
	OSIdpOUb2Yrw5eqPr+bojfY=
X-Google-Smtp-Source: AKy350ZyJxzUXfFeHkyBC3lf1xyUpQmcxh9PNWSCXHCnxZOLSjFWKs9A4jyqL5PVYZjHgRPrZllv2g==
X-Received: by 2002:a17:907:2090:b0:94a:5ecb:6ea7 with SMTP id pv16-20020a170907209000b0094a5ecb6ea7mr2424974ejb.43.1682087836909;
        Fri, 21 Apr 2023 07:37:16 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id q27-20020a170906361b00b0094e1026bc66sm2168244ejb.140.2023.04.21.07.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 07:37:16 -0700 (PDT)
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
Subject: [RFC PATCH net-next 10/22] net: dsa: mt7530: call port 6 setup from mt7530_mac_config()
Date: Fri, 21 Apr 2023 17:36:36 +0300
Message-Id: <20230421143648.87889-11-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230421143648.87889-1-arinc.unal@arinc9.com>
References: <20230421143648.87889-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_073719_229353_B3ECD954 
X-CRM114-Status: GOOD (  16.47  )
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
index be143da94add..58eff6568d4c 100644
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
@@ -2576,12 +2582,15 @@ mt7530_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
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


