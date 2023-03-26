Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6935C74A5B
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Mar 2023 14:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hlqMgsbtMdGDwnYgR2vesfxbv2C04RSOqe9u/KU4Ors=; b=2DJwqpLWCSw2yI
	lzC7O/Z0PvwrzZ7BCjPK3D+K/4xn+qq5NiLaiRvtB5tMiHDGzl+mwZM2W76U2aLqIQtLAEOACwDmc
	eMMmrdfe4TLrPJ0P1JVcQdNLippc5m9F8LX4kWIROf1mQGohjZ/apruiBKgTejn4DerlVl2sCcR49
	VoZ8qFABHyQgEviyCTpkAkhkCx4xDeah5cn5M1Y4iWigc0bky2DIQw1FvGi8PIPdDXn/C891I4rr7
	wEBlMM/DtgGnOC2L5VTkS8RcEaKi9upbU14zBZ9ZxIQ0ezQn64dqgnXcmbbmHA7b5Zic6ngySG/pa
	6Gd3scFw1NAibo9jvkww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgR33-008VVr-2h;
	Sun, 26 Mar 2023 14:08:41 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgR2u-008VTO-2E;
	Sun, 26 Mar 2023 14:08:34 +0000
Received: by mail-qv1-xf35.google.com with SMTP id q88so5013317qvq.13;
        Sun, 26 Mar 2023 07:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679839711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hlqMgsbtMdGDwnYgR2vesfxbv2C04RSOqe9u/KU4Ors=;
        b=KHOvRSfqQyWTy9ScGQJ8IWC0p7ihFilYWFRWGp1cuRjLBuNtSqMAa18k5ewbyq7Per
         F9Zk2ka0l6LdpkLmJi/Jpob3ws2xH4WfNayNory3VwV5s01MDbRtJD+d/ca8hTYcOUbk
         rYzAWbueY94VBEaN34s2DeUNNiWKowsy1r7nY0nG2FdjSAFre1PQjh9aTMXfw8NMxG6Y
         WGm/cKKdHhn0iG8Nsy8zyybIr/PS6FCBCq+fHQv87wIZFGhkjaqAjqoyqUUJcfFystzZ
         ADKkLHoTDOIc3nWfngO1AOjGoSQtIM/JOyjzymCi0bR4wnPBYnx+Y03BkBl4M1Ky0IE5
         epbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679839711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hlqMgsbtMdGDwnYgR2vesfxbv2C04RSOqe9u/KU4Ors=;
        b=szqOVh6K9tAfUV1lbZOcLXQPDmeWvY9hgIFHSc02+OePeekkQvigOKQuoEixmthrj9
         0AnO0H8sRUlf7xKusHzXqVLjMz94kenJ+q80v4ef3FRaya6bDeVw5nkgprjI6Egr/pWe
         TcSYVPob6GAj7lXjFHfeatTo0wPNvJr5oGgrkFWoUNGrxw2PzXQo4ZJCWkACQlkyCg1c
         v06VwOKET5w2RwdqwsM+ntSGqhYG3JxpvaDboDuePfflkkbCMd/tl/VA0BvlHMWU0v+r
         f/rEGvb0L/myKdl1jujrEDPd63qcOAHu91FqTLlpMqclhEvip9Y/aogMXziJ4jRrHT5V
         0t/w==
X-Gm-Message-State: AAQBX9eHIa3hsDsZI9By0uNPisMzDqZtDqASDlgnUnfpGJcnZz2JwKW5
	xM3VI3VmTQpnfLzBJpOfBLk=
X-Google-Smtp-Source: AKy350bQt+rT9tKjyp+jcmLOuyVtQ8y49KPu+aHAFnNI18NCKk4Cu4hKAl6gcnlq2J65UPddcNsBWw==
X-Received: by 2002:a05:6214:258a:b0:56f:c138:2844 with SMTP id fq10-20020a056214258a00b0056fc1382844mr16074703qvb.37.1679839711363;
        Sun, 26 Mar 2023 07:08:31 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id j5-20020a0ce6a5000000b005dd8b93458esm2212220qvn.38.2023.03.26.07.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 07:08:31 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	=?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
Subject: [PATCH net 1/7] net: dsa: mt7530: fix comments regarding port 5 and 6 for both switches
Date: Sun, 26 Mar 2023 17:08:12 +0300
Message-Id: <20230326140818.246575-2-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230326140818.246575-1-arinc.unal@arinc9.com>
References: <20230326140818.246575-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_070832_731621_6ADF717F 
X-CRM114-Status: GOOD (  12.72  )
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
Cc: Landen Chao <landen.chao@mediatek.com>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, Russell King <rmk+kernel@armlinux.org.uk>, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

There's no logic to numerically order the CPU ports. State the port number
and its being a CPU port instead.

Remove the irrelevant PHY muxing information from
mt7530_mac_port_get_caps(). Explain the supported MII modes instead.

Remove the out of place PHY muxing information from
mt753x_phylink_mac_config(). The function is for both the MT7530 and MT7531
switches but there's no phy muxing on MT7531.

Fixes: ca366d6c889b ("net: dsa: mt7530: Convert to PHYLINK API")
Fixes: 38f790a80560 ("net: dsa: mt7530: Add support for port 5")
Fixes: 88bdef8be9f6 ("net: dsa: mt7530: Extend device data ready for adding a new hardware")
Fixes: c288575f7810 ("net: dsa: mt7530: Add the support of MT7531 switch")
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 02410ac439b7..62a4b899a961 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2454,7 +2454,7 @@ static void mt7530_mac_port_get_caps(struct dsa_switch *ds, int port,
 			  config->supported_interfaces);
 		break;
 
-	case 5: /* 2nd cpu port with phy of port 0 or 4 / external phy */
+	case 5: /* Port 5, a CPU port, supports rgmii, mii, and gmii. */
 		phy_interface_set_rgmii(config->supported_interfaces);
 		__set_bit(PHY_INTERFACE_MODE_MII,
 			  config->supported_interfaces);
@@ -2462,7 +2462,7 @@ static void mt7530_mac_port_get_caps(struct dsa_switch *ds, int port,
 			  config->supported_interfaces);
 		break;
 
-	case 6: /* 1st cpu port */
+	case 6: /* Port 6, a CPU port, supports rgmii and trgmii. */
 		__set_bit(PHY_INTERFACE_MODE_RGMII,
 			  config->supported_interfaces);
 		__set_bit(PHY_INTERFACE_MODE_TRGMII,
@@ -2487,14 +2487,14 @@ static void mt7531_mac_port_get_caps(struct dsa_switch *ds, int port,
 			  config->supported_interfaces);
 		break;
 
-	case 5: /* 2nd cpu port supports either rgmii or sgmii/8023z */
+	case 5: /* Port 5, a CPU port, supports rgmii and sgmii/802.3z. */
 		if (mt7531_is_rgmii_port(priv, port)) {
 			phy_interface_set_rgmii(config->supported_interfaces);
 			break;
 		}
 		fallthrough;
 
-	case 6: /* 1st cpu port supports sgmii/8023z only */
+	case 6: /* Port 6, a CPU port, supports sgmii/802.3z only. */
 		__set_bit(PHY_INTERFACE_MODE_SGMII,
 			  config->supported_interfaces);
 		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
@@ -2772,7 +2772,7 @@ mt753x_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 		if (state->interface != PHY_INTERFACE_MODE_GMII)
 			goto unsupported;
 		break;
-	case 5: /* 2nd cpu port with phy of port 0 or 4 / external phy */
+	case 5: /* Port 5, a CPU port. */
 		if (priv->p5_interface == state->interface)
 			break;
 
@@ -2782,7 +2782,7 @@ mt753x_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 		if (priv->p5_intf_sel != P5_DISABLED)
 			priv->p5_interface = state->interface;
 		break;
-	case 6: /* 1st cpu port */
+	case 6: /* Port 6, a CPU port. */
 		if (priv->p6_interface == state->interface)
 			break;
 
-- 
2.37.2


