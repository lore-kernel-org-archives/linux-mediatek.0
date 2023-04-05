Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2A7C761AF
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 20:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TL1ifXOj3OEH5mV418CX1uP5QyBqfV3oBYYgm4r26w8=; b=F0++bML7l8c9RD
	g0Ycu6wkd1Cs0xTQ6AhDxo554uR4MKeSLjoZiAW50xaKErBrQCiBSLicKpCN5zbu60LXS65ylMMij
	9Yr4MNCHs5RbQ/d32IZ5HlEJCyX07EinxedmLwdTmwCmOHqR5XNcZnfDW63iDw+dKjeaw1GOb2eW1
	74Y34hn8ahKbCcclLd+gyNRx/0Ij5HgzeO4IZ41IZlz7yfXa4jlwLFv1qbBDONgvjsLsPNrmA14bZ
	F4dRJ2hMPEqvvGVoS0lNtasrWsOHO6jt6EHrsWyvh3O2yLzPsKnDWij/3W+6yyAJfFMXXoXqu1CwG
	Ok1Ikittf/5QsVSmGfbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk9ua-005e0Q-0L;
	Wed, 05 Apr 2023 20:39:20 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk9uU-005dvG-30;
	Wed, 05 Apr 2023 20:39:16 +0000
Received: by mail-wm1-x333.google.com with SMTP id l10-20020a05600c1d0a00b003f04bd3691eso7807788wms.5;
        Wed, 05 Apr 2023 13:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680727151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TL1ifXOj3OEH5mV418CX1uP5QyBqfV3oBYYgm4r26w8=;
        b=otBFkFBIeXE2wHUW2NbAADjRIHF+Q3/1CyWyDB0KCBi/bP20rCssC6krJAdujcBH0p
         vOr+fv+PvHyG2Lh3nHOO205ZyWI4KHjzqT7qsF3NzKvNhRR/N13+PZi6I92fRLV+HIkk
         NOQtYCDb/jQLRvUEn0+kwXuvwtc5KrH8csK6rRMtSiLHNVb4oFDd/W4dfwZz6ySfih6L
         69xhweJmDTMYUUbhYyNiVONmz1b65R5rqaglAir2dBEdPXGc8HaACVDW8lbeidNEyFVt
         wpNX6ng2AIENabtgAzErMui85//Jr2AgfW1+iBZKRLjyqrByjXAijgkmXD+v1/qnf3z0
         V/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680727151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TL1ifXOj3OEH5mV418CX1uP5QyBqfV3oBYYgm4r26w8=;
        b=1Lstj8n9lo03FNcgSsO7Z1NB1bXNoVzVgC59fuEaRu5J7vXdThI2KWJaI4TG7zyraQ
         cw11DdBKvhNbi0mElHMaQsiOP+JTM0b5Ib6yFYtblbWffQ7boh86auLCXx4JNSsbNnl8
         x2bb+d8UgeKxzXVwo7YFkzVbnEC+7AvfGNqjW0vA8H0qdPNy+bP7Q+kJW9xbk0w4XlGr
         9ePQ2TlWkWlHz8sczuNV9/1/9nL6maWOXbQfNKGJAw1E7FoWWu/zB0fPjsDSnPtLNU8B
         cBsY/5LCNtY4G90g+7zL4WrBZercSqvs2jJTY39Nek6596QCufKhVM0Sf2dNly81yEsF
         53pQ==
X-Gm-Message-State: AAQBX9fqjj6/sbVcLDcVh/sBuivocgig9AcavuY4gSIvD6E8IuSpR5PO
	y/C7gZwXizWw36XexSsyQ2w=
X-Google-Smtp-Source: AKy350apw98pqyG0m2kriMDO9nl7uy8+ve6V4vFItG3nJ/BQRJUCnIASNlPnFi/uFduCYKWZ/rXdtA==
X-Received: by 2002:a05:600c:198e:b0:3ed:ad05:5841 with SMTP id t14-20020a05600c198e00b003edad055841mr2488273wmq.17.1680727150993;
        Wed, 05 Apr 2023 13:39:10 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id p19-20020a05600c469300b003eda46d6792sm3259867wmo.32.2023.04.05.13.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 13:39:10 -0700 (PDT)
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
Subject: [RFC PATCH net-next 03/12] net: dsa: mt7530: do not run mt7530_setup_port5() if port 5 is disabled
Date: Wed,  5 Apr 2023 23:38:50 +0300
Message-Id: <20230405203859.391267-4-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230405203859.391267-1-arinc.unal@arinc9.com>
References: <20230405203859.391267-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_133914_974463_9C25367E 
X-CRM114-Status: GOOD (  13.37  )
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

There's no need to run all the code on mt7530_setup_port5() if port 5 is
disabled. The only case for calling mt7530_setup_port5() from
mt7530_setup() is when PHY muxing is enabled. That is because port 5 is not
defined as a port on the devicetree, therefore, it cannot be controlled by
phylink.

Because of this, run mt7530_setup_port5() if priv->p5_intf_sel is
P5_INTF_SEL_PHY_P0 or P5_INTF_SEL_PHY_P4. Remove the P5_DISABLED case from
mt7530_setup_port5().

Stop initialising the interface variable as the remaining cases will always
call mt7530_setup_port5() with it initialised.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index a00aabe4987e..9ab2e128b564 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -943,9 +943,6 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
 		/* MT7530_P5_MODE_GMAC: P5 -> External phy or 2nd GMAC */
 		val &= ~MHWTRAP_P5_DIS;
 		break;
-	case P5_DISABLED:
-		interface = PHY_INTERFACE_MODE_NA;
-		break;
 	default:
 		dev_err(ds->dev, "Unsupported p5_intf_sel %d\n",
 			priv->p5_intf_sel);
@@ -2299,7 +2296,6 @@ mt7530_setup(struct dsa_switch *ds)
 		 * if PHY muxing is detected.
 		 */
 		priv->p5_intf_sel = P5_DISABLED;
-		interface = PHY_INTERFACE_MODE_NA;
 
 		for_each_child_of_node(dn, mac_np) {
 			if (!of_device_is_compatible(mac_np,
@@ -2332,7 +2328,9 @@ mt7530_setup(struct dsa_switch *ds)
 			break;
 		}
 
-		mt7530_setup_port5(ds, interface);
+		if (priv->p5_intf_sel == P5_INTF_SEL_PHY_P0 ||
+		    priv->p5_intf_sel == P5_INTF_SEL_PHY_P4)
+			mt7530_setup_port5(ds, interface);
 	}
 
 #ifdef CONFIG_GPIOLIB
-- 
2.37.2


