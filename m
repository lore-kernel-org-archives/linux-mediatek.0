Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71642C77B70
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 13:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cmc6uDj21KTxpfnQHdrxi7S8XMD1Ra3TJ9amtU9lpl8=; b=4LTdmodKzLHgyn
	OS3fPNKvEQjfvwZh7obu+uWX6nXOqGG3yKRENW5Cm61LUM3Y97Kxm+RgC5TlWXDMvx44GPOLkNQx9
	SZ5xI9W2L71n89aRa6rfm9zSMI3HlaPENYzOEZa6H2PcqbQ+a0Ts0c9QWzghbQR3+EPtHBv1sWpLx
	H66pzgYcbY/4puFyw9v9zj1E5trq9CJjaa+6CgpbQrSTStf+A2CCTD46Kzj5cpQ+0B51kPoao3hKv
	0NXHAUZNRjYa64AsRIjXhE2BV3NlSOzgXx5BTqc52FrOktL0PciJO5rzDtnGcOijZtn+CGNZ2E8VM
	Ov/UPFNcJNSv+eaCeUtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmQP-00ANL4-0u;
	Fri, 07 Apr 2023 13:46:45 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmQL-00ANHT-0S;
	Fri, 07 Apr 2023 13:46:42 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-54184571389so796870707b3.4;
        Fri, 07 Apr 2023 06:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680875200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cmc6uDj21KTxpfnQHdrxi7S8XMD1Ra3TJ9amtU9lpl8=;
        b=hF1TWDzIxiuMZgpm32X8C0WIN6cWULhfYL7uroZwTcImEqqBfdZtHnjv4AJTLVk8iW
         jv+iO7qu2ntN6s2VjCq5LKYOtTT8inK7fel6Rvit/p6/8vkIaM5ZWV1CUCpFvdFXOd9l
         vZQDKB4S7Qof/JZq4IjRlhqUoTS/DAkxODdmKXGvEBv/4hJAYfrYvklCcuPDuyMa+1ZO
         2tI509BOwyARz35vsuzWrMtg4qj8J7V90nIhZLhBGNMG9rlmeuwcGqX9sUW9/zIAQxiO
         BaybGMG2ShzQV5jrgzvYqVWzX6K9pn789/x78Geyz1dkg+QFaQ29WSeDXGy1z0Gxu64d
         MPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680875200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cmc6uDj21KTxpfnQHdrxi7S8XMD1Ra3TJ9amtU9lpl8=;
        b=U3/8zrA3LeSwKMgZAQsbUebHrDKknv9c7l+sociWGKunXhCbvmTa++rJUio6D6WAeq
         NrKBNy2/s7jGORzt2/ck+0Jo/rNpXeUgRm9da39QNGgZ9LpCJQ1BbxN9iJxt5aRMHYSr
         1kNt5fc7JLl0QnFrYOOjqdtWl8K/EHn+eBFAzBBzX7/fyNgTZIE77Je7163pvgnY2COJ
         aB0SlC7LRFc2e7rpXrC3r1Kh8Tquq/T8dGLYNUSkrLehm315yxD8P1y7iEf+fQ7+Y8TU
         CivbS/Gd6jkzJcS2oIk3Odipee2cn+CRsWaTH9j9Q00JhDa/YDxqWorr+5FSlb9H87oV
         glgA==
X-Gm-Message-State: AAQBX9dt3pJsBV4fFIMkU6fNOZf8PWSBlPWAcSJYePmFl59t6RBZKh5b
	3HYVUKuTkiHTddOu5FGL0FQ=
X-Google-Smtp-Source: AKy350ZFzcKKiizE3mygY5mbwu+iWhc2CY53VYCHnVhZoKnh3UBoK4RDgHLYO8R639CYYDemrvqkdA==
X-Received: by 2002:a81:6906:0:b0:54e:d7f3:2be0 with SMTP id e6-20020a816906000000b0054ed7f32be0mr373767ywc.12.1680875199904;
        Fri, 07 Apr 2023 06:46:39 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id 139-20020a810e91000000b00545a0818473sm1034317ywo.3.2023.04.07.06.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 06:46:39 -0700 (PDT)
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
Subject: [RFC PATCH v2 net-next 01/14] net: dsa: mt7530: fix comments regarding port 5 and 6 for both switches
Date: Fri,  7 Apr 2023 16:46:13 +0300
Message-Id: <20230407134626.47928-2-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230407134626.47928-1-arinc.unal@arinc9.com>
References: <20230407134626.47928-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_064641_189413_797808F6 
X-CRM114-Status: GOOD (  13.25  )
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

There's no logic to numerically order the CPU ports. State the port number
and its being a CPU port instead.

Remove the irrelevant PHY muxing information from
mt7530_mac_port_get_caps(). Explain the supported MII modes instead.

Remove the out of place PHY muxing information from
mt753x_phylink_mac_config(). The function is for both the MT7530 and MT7531
switches but there's no phy muxing on MT7531.

These comments were gradually introduced with the commits below.
ca366d6c889b ("net: dsa: mt7530: Convert to PHYLINK API")
38f790a80560 ("net: dsa: mt7530: Add support for port 5")
88bdef8be9f6 ("net: dsa: mt7530: Extend device data ready for adding a new
hardware")
c288575f7810 ("net: dsa: mt7530: Add the support of MT7531 switch")

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index e4bb5037d352..31ef70f0cd12 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2506,7 +2506,7 @@ static void mt7530_mac_port_get_caps(struct dsa_switch *ds, int port,
 			  config->supported_interfaces);
 		break;
 
-	case 5: /* 2nd cpu port with phy of port 0 or 4 / external phy */
+	case 5: /* Port 5, a CPU port, supports rgmii, mii, and gmii. */
 		phy_interface_set_rgmii(config->supported_interfaces);
 		__set_bit(PHY_INTERFACE_MODE_MII,
 			  config->supported_interfaces);
@@ -2514,7 +2514,7 @@ static void mt7530_mac_port_get_caps(struct dsa_switch *ds, int port,
 			  config->supported_interfaces);
 		break;
 
-	case 6: /* 1st cpu port */
+	case 6: /* Port 6, a CPU port, supports rgmii and trgmii. */
 		__set_bit(PHY_INTERFACE_MODE_RGMII,
 			  config->supported_interfaces);
 		__set_bit(PHY_INTERFACE_MODE_TRGMII,
@@ -2539,14 +2539,14 @@ static void mt7531_mac_port_get_caps(struct dsa_switch *ds, int port,
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
@@ -2738,7 +2738,7 @@ mt753x_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 		    state->interface != PHY_INTERFACE_MODE_INTERNAL)
 			goto unsupported;
 		break;
-	case 5: /* 2nd cpu port with phy of port 0 or 4 / external phy */
+	case 5: /* Port 5, a CPU port. */
 		if (priv->p5_interface == state->interface)
 			break;
 
@@ -2748,7 +2748,7 @@ mt753x_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 		if (priv->p5_intf_sel != P5_DISABLED)
 			priv->p5_interface = state->interface;
 		break;
-	case 6: /* 1st cpu port */
+	case 6: /* Port 6, a CPU port. */
 		if (priv->p6_interface == state->interface)
 			break;
 
-- 
2.37.2


