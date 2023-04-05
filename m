Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A676C76188
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 20:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E0IMeO1O4SBYZQwg5+XaETPP4flNHm2gc4lWDzFifZI=; b=b1DYE3qK5fvgHT
	2bInU93dkzB2prw13gElr25l8Res04N+0E7RjB25iCjMhCoZreLr/jm93p3ddHcEmh4T+20Nh+ig9
	CUKjXdEUb7dp9mgPAN3RYFBiRTRMj4BiX4C/eVrv/OVVtWDK5XWHEwlg2B+uOuJLMpTs1i0tVx+tE
	eqSmx+NTSq+1doxZmGYCSw3KBaE/UqnB7i5ZZmMtStkzGGZ+uc8+soBshHELyDx1Rp4SN9AvoPvsM
	s1hwkroWm4NcItca7F1VsV8Hi+C0eBxlZ8VA54ix22hwIxWM364hOjLTv8e3RWnVOk8pnyJFu0aKu
	ixLVOk+CKpYlJKcGFspQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk9ue-005e4n-2e;
	Wed, 05 Apr 2023 20:39:24 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk9uX-005dwD-0x;
	Wed, 05 Apr 2023 20:39:18 +0000
Received: by mail-wm1-x332.google.com with SMTP id v20-20020a05600c471400b003ed8826253aso2756967wmo.0;
        Wed, 05 Apr 2023 13:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680727153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0IMeO1O4SBYZQwg5+XaETPP4flNHm2gc4lWDzFifZI=;
        b=mi7PrvZmmvLEO+3MKptjpM80IcUEqSCRCtCJIny9XFduJeLpEnTUAXzOk8cEf6CcPO
         Xl2gw36OSSAUO8EhYEticwUjDS8haigdxksMlOZzUzmyDZmpfs+OekQlqeOAI0oQFWLx
         MjbQB7cxX2F1nKtmLFZRB3mx4bdKVzCrIYwIfuYP+nciACktK8ciENNRAqydQwwTpgm3
         v+4fkqOv0Ge2UXnMvxQjtTmR6vk6bMC6SMiA7Y+cc4cq4UicGEeVkeSs/6V2OFtExoF7
         bznc1ooFPRdTUBXsUnsFyTHh429aJmgPbnOAzOVNqejlTO47eqx+Xv1wtl58/CZPFU51
         7gxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680727153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E0IMeO1O4SBYZQwg5+XaETPP4flNHm2gc4lWDzFifZI=;
        b=O4bUDmKBsduJZ0uNczjEqSeYZ01sR6zHKcpWzvwu+FWx43WdR4UcciSsOq5fFKDuOw
         5MsHDKQEwueLBXeNBrhTEKdsXkdIW2ukmqaoKnSBq+gmyeNEAo6u/5SgAjiqmoGuGg13
         x44ovNz5UIiUQBFDZbZkuW73P9az2WmIYaP3liGb0obKcghq6603be0gLsnQoSDQ71Pw
         7wX53t2Kt8IY/GxCFwf0I5+4aFDYM23lg5qoTGoiSXxQRCjoBiZYAGl3ffktvuWe5pYn
         js9uRiE+QyLe1T1191capFMsFQlhMYFdwCtgLTn1tbSjbHI8veIyOmCAKKSYG534bSQv
         U3QA==
X-Gm-Message-State: AAQBX9emIGNp8Ca7y1qVBtivuYARNBjUgQexhw+wwRwUwc16gWRZo4sB
	qPdCafVyLbDi20nV70m0t5w=
X-Google-Smtp-Source: AKy350Z5iIa4fumSDUmJ7ok3oTLcRfGGebEHh0loZFWOHE06MqRBazTetiRRs+kMSZS76dSAraf2RA==
X-Received: by 2002:a05:600c:b51:b0:3ed:2a91:3bc9 with SMTP id k17-20020a05600c0b5100b003ed2a913bc9mr5946344wmr.15.1680727153425;
        Wed, 05 Apr 2023 13:39:13 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id p19-20020a05600c469300b003eda46d6792sm3259867wmo.32.2023.04.05.13.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 13:39:13 -0700 (PDT)
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
Subject: [RFC PATCH net-next 04/12] net: dsa: mt7530: set priv->p5_interface in correct conditions
Date: Wed,  5 Apr 2023 23:38:51 +0300
Message-Id: <20230405203859.391267-5-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230405203859.391267-1-arinc.unal@arinc9.com>
References: <20230405203859.391267-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_133917_337226_9D40C3F3 
X-CRM114-Status: GOOD (  14.58  )
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

Currently, priv->p5_interface is set on mt7530_setup_port5() even though
it's being set on mt753x_phylink_mac_config() after mt7530_setup_port5() is
run.

The only case for setting priv->p5_interface on mt7530_setup_port5() is
when PHY muxing is enabled. That is because port 5 is not defined as a port
on the devicetree, therefore, it cannot be controlled by phylink.

To address this, set priv->p5_interface only if PHY muxing is enabled.

On mt753x_phylink_mac_config, != P5_DISABLED is enough but to be explicit,
look for p5_intf_sel being P5_INTF_SEL_GMAC5 or P5_INTF_SEL_GMAC5_SGMII.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---

If you think priv->p5_interface should not be set when port 5 is used for
PHY muxing, let me know.

Arınç

---
 drivers/net/dsa/mt7530.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 9ab2e128b564..fccd59564532 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -976,7 +976,9 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
 	dev_dbg(ds->dev, "Setup P5, HWTRAP=0x%x, intf_sel=%s, phy-mode=%s\n",
 		val, p5_intf_modes(priv->p5_intf_sel), phy_modes(interface));
 
-	priv->p5_interface = interface;
+	if (priv->p5_intf_sel == P5_INTF_SEL_PHY_P0 ||
+	    priv->p5_intf_sel == P5_INTF_SEL_PHY_P4)
+		priv->p5_interface = interface;
 
 unlock_exit:
 	mutex_unlock(&priv->reg_mutex);
@@ -2746,7 +2748,8 @@ mt753x_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 		if (mt753x_mac_config(ds, port, mode, state) < 0)
 			goto unsupported;
 
-		if (priv->p5_intf_sel != P5_DISABLED)
+		if (priv->p5_intf_sel == P5_INTF_SEL_GMAC5 ||
+		    priv->p5_intf_sel == P5_INTF_SEL_GMAC5_SGMII)
 			priv->p5_interface = state->interface;
 		break;
 	case 6: /* Port 6, a CPU port. */
-- 
2.37.2


