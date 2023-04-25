Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B97C77B76
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 09:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vU6wfq3kMO/C39pPAHFIW3WITZNrGxeZCJhmPURxHOM=; b=L22Z1ablNeuMc/
	nh+gmaMqVkadd84PKaiOcwlqybrPSdDVXrNWI9w+OD8DcLToug41VHO5Y7L18qQulKUXjuhsmapEa
	vRvi9NOVPN7+Cee6VkwxHrfhDLzpt0/WCrkq771rQL5EyTTmDbDglQ2Xx14m7/TmuMaWQysW6V76D
	AAj14D4nGsssko2g92iMu5c0yf0yxPLCI7d6IXKHINZmtIzTEthwrgbKQVWgMjx8aOz49pYYkDqDL
	4lBwre1mfjhpiAJDRO8ebkJ+LeYgFMQpTvPiWpz5iLr8BIVzb5TreBZeEKoxfKS9aUMLrgcD3m5aG
	R6lCGmNjCqFH0vUe6Tpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prFEj-000gE9-0E;
	Tue, 25 Apr 2023 09:45:25 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prE40-000UXU-2F;
	Tue, 25 Apr 2023 08:30:18 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-94a34a0b9e2so785221466b.1;
        Tue, 25 Apr 2023 01:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682411416; x=1685003416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vU6wfq3kMO/C39pPAHFIW3WITZNrGxeZCJhmPURxHOM=;
        b=l4W4psed/okE2858F1jwOoceAvDESB+rcNaUOGKKXHvoskGS4Vq09ejJ7IrKBRQWmp
         3AXERUtGJdxtEFj7UUwW2lN1GeQ3IOrm5tYgRfYIhynei3DQKyvfAXdcnARB21aBQNyW
         W3nh4Swn8RZ733hf/ImtT058oskznYZyBXxZPO1wlwinYpSW34Buo7Zhofe3Ee2OTlX+
         zma9fGshWqVMvc7RkJtN5EFDIfV8B5VlVTbDfBH1gxpEErTWP/rfqp6RnUPPdjwzOvdg
         96ItPnBbH6hYTGj/MOSKC3nNyEWF2pxCVPmzhIz0AawoKvwkJ8Pyjj1PbtPhgDqMmUPz
         GyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682411416; x=1685003416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vU6wfq3kMO/C39pPAHFIW3WITZNrGxeZCJhmPURxHOM=;
        b=fJ7XZ4dly+zLrbsEuhm4HQoS6xTVlZtcjENsoanmzgFUKXg05toLJuGGTKHUZsIubd
         EkZHntNWc4FvaC4QVeSp+uSs+fJ8jJg4C6A+FDlsLD6LHCMXICWNyS5KTlN3XYo5U5ND
         dm8avTQYnZzHUa2vR7dGOxr1lFtvLibkAl/EZTUHs/jzxhc6xNaMeG7qwUTa0Ex/bkE0
         HvZeaue8AZ1mjwWHB9cBgxRj5m/qtdHT6vr0oNhZKnuo4mmkQaUNr3CoXmVJihwLzir6
         JJXIVpT2PBF7eWibo37ZsEOgOaYBtGO+GXoWiz6x/BzsLNKhwEqYgd+upq0Y1wXCBzxM
         gZTA==
X-Gm-Message-State: AAQBX9dilH9Ul6Vyb4Nu8ZI5NAW0O+uu+muK462KOMT93CEMa5idbytH
	5sGphngt4eXl089sVJaGFa4=
X-Google-Smtp-Source: AKy350YiPBnCzDeTIwXwi4ichttcyAj56QLJ67jdHFy60Xpi6RuJgqJG0Jre3BU+E4OypUf4zAG9Og==
X-Received: by 2002:a17:906:ecb7:b0:933:3a22:8513 with SMTP id qh23-20020a170906ecb700b009333a228513mr13189142ejb.53.1682411415866;
        Tue, 25 Apr 2023 01:30:15 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id mc2-20020a170906eb4200b0094ca077c985sm6439028ejb.213.2023.04.25.01.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 01:30:15 -0700 (PDT)
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
Subject: [PATCH net-next 10/24] net: dsa: mt7530: empty default case on mt7530_setup_port5()
Date: Tue, 25 Apr 2023 11:29:19 +0300
Message-Id: <20230425082933.84654-11-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230425082933.84654-1-arinc.unal@arinc9.com>
References: <20230425082933.84654-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_013016_739782_8B06DEC2 
X-CRM114-Status: GOOD (  11.86  )
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

There're two code paths for setting up port 5:

mt7530_setup()
-> mt7530_setup_port5()

mt753x_phylink_mac_config()
-> mt753x_mac_config()
   -> mt7530_mac_config()
      -> mt7530_setup_port5()

On the first code path, priv->p5_intf_sel is either set to
P5_INTF_SEL_PHY_P0 or P5_INTF_SEL_PHY_P4 when mt7530_setup_port5() is run.

On the second code path, priv->p5_intf_sel is set to P5_INTF_SEL_GMAC5 when
mt7530_setup_port5() is run.

Empty the default case which will never run but is needed nonetheless to
handle all the remaining enumeration values.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index aab9ebb54d7d..b3db68d6939a 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -933,9 +933,7 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
 		val &= ~MHWTRAP_P5_DIS;
 		break;
 	default:
-		dev_err(ds->dev, "Unsupported p5_intf_sel %d\n",
-			priv->p5_intf_sel);
-		goto unlock_exit;
+		break;
 	}
 
 	/* Setup RGMII settings */
@@ -965,7 +963,6 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
 	dev_dbg(ds->dev, "Setup P5, HWTRAP=0x%x, intf_sel=%s, phy-mode=%s\n",
 		val, p5_intf_modes(priv->p5_intf_sel), phy_modes(interface));
 
-unlock_exit:
 	mutex_unlock(&priv->reg_mutex);
 }
 
-- 
2.37.2


