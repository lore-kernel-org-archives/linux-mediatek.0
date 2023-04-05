Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCCBBC761AF
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 20:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cmc6uDj21KTxpfnQHdrxi7S8XMD1Ra3TJ9amtU9lpl8=; b=kwer+fPKj5M/8I
	UZMjAEeuoAlGn5XUMLCD0IeJXIXzMsNoIYHUDEM70Vfi9lhqs7Affexte/D4MZSJtvEpBO8Sh5EFg
	mEyhcrydrbvs5jL3yBYYmZ0OO+nwZGbuWboNyvp/5SbU8nMuq+n3DMqKnBwF9nIEEpQ3f4bo4Y/ps
	ns14fobVO7/1PMusXOHrZDGDSlJgI824ohJP5XNHyuRvsq21d4ZM2i3cWIvEDBvilVZge9o4UIzD1
	GaFnwOfwTEAAGz1jDUIeo+bOGuv7L2mHuVPhkvzM6dAKzaa9Nyfa+jWQvIzQu5XQ15p13EcMV2t4l
	ARRyFGpQ6dqTNSW53oYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk9uV-005dwi-0B;
	Wed, 05 Apr 2023 20:39:15 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk9uQ-005dto-0p;
	Wed, 05 Apr 2023 20:39:11 +0000
Received: by mail-wm1-x335.google.com with SMTP id i5-20020a05600c354500b003edd24054e0so24460853wmq.4;
        Wed, 05 Apr 2023 13:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680727146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cmc6uDj21KTxpfnQHdrxi7S8XMD1Ra3TJ9amtU9lpl8=;
        b=eyap6kJYmYkGorPxkfa1WonO/ucZQdyDc1JnlN/4h0NLtEQAAwn+W7hinXTqw7J77l
         AMMyBK9dqH8DSbRQU1IIPyGrxrSTd/We3KrJNwAMyzY5ZKhsM6k8AxmIqmpZURI6bibu
         9hTgmHbxypIO2z3zRM+vfYEHJ+5rzuwbsOApE7pHl4ug9uCjMs6xilXhjTAw2ljPGPyr
         rY6ff2bpjUDVMT0qORI1UvD4+J5MXDuG2qW+TiF+WulbeXlgShbsLREYId4M7bEIlMko
         Xo78Skl/pU/h1AJ0TT1A0//GtMLiXpmpGRC+SLHao32uG+1qRikh0QnJTd5nWAiCLWqd
         829g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680727146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cmc6uDj21KTxpfnQHdrxi7S8XMD1Ra3TJ9amtU9lpl8=;
        b=WoR5s3rAxXDvBBRlZpXHj9XgAccM3LBSjVBpq4Efq5LEapZKcnprISdgfmGK9qD+Lq
         bDlyjLkoU8v5TgI3RR1JLTlhA/RXRznqtmlyiw8Wzllyckdck7QMqOUIgBkuoNQiNVae
         QJNH4PmtmgfWllvZdtDOFKzaBazo0L8iNqRTl2yM6iCceo8K5lekPzeTj/RfUwcI/Cgu
         wXWPQaQpGxCdkCSQucPKZ63bjiPV7eJ+oMSEt+/R3g6jaJq1spG/jUz+C4xX5bMaxzkk
         GVmhJvXdheE4VFT7WXiTNVRFWEIUOALJp0z6wT3jkIfGoMzYVM65ovNggaVLSbAxhMd/
         KDxg==
X-Gm-Message-State: AAQBX9dsCPah+tJyuXqr/PMTtKnIlvNftOlpZoSCm+YZRI8XkYlerhzd
	crZ5rrSEToiYjy/0em1nv0E=
X-Google-Smtp-Source: AKy350a7EIGlBmOTKQnba5+3KX1Ovlm/9yd4X/S8HX4MOqgi9WGExqkdovm1ykfygXIYV5nfYFQKMg==
X-Received: by 2002:a1c:7714:0:b0:3ef:67fc:fef1 with SMTP id t20-20020a1c7714000000b003ef67fcfef1mr5933520wmi.26.1680727146266;
        Wed, 05 Apr 2023 13:39:06 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id p19-20020a05600c469300b003eda46d6792sm3259867wmo.32.2023.04.05.13.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 13:39:05 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
	Sean Wang <sean.wang@mediatek.com>,
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
Subject: [RFC PATCH net-next 01/12] net: dsa: mt7530: fix comments regarding port 5 and 6 for both switches
Date: Wed,  5 Apr 2023 23:38:48 +0300
Message-Id: <20230405203859.391267-2-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230405203859.391267-1-arinc.unal@arinc9.com>
References: <20230405203859.391267-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_133910_295139_BD748633 
X-CRM114-Status: GOOD (  13.24  )
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
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, netdev@vger.kernel.org, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
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


