Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BBAC74A5B
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Mar 2023 14:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OZg7tvfajeNq18GFXC3qap3a+zEsuUc1lJRtB/LOjbQ=; b=GOTBhRqD6iIrOX
	ZZxyQx+himTzzPKaDweT+dwEURYXH7R+cfx2m1zeuIVM4JLL8MWnumAO2KBN3GWzQzY3lRM2sG0f0
	uht46RHWwpG48ZLsOqMCrI3EtMa56H2b5ubpRODWd6zNDYJSvia6u9Je8isZ8TTC14jVgfw6cuuSZ
	rZHkJ/67UsQ4EBDheUjkFDOB99lEzqmWx1/pxaKGpxp/oKbXJvHSKgdquBWwaFdYQU8IzyYqESMmw
	DBPv9u4DbbD3Dx467fTeLElRhBFxCZcVTxiO4OONK0xYZm6+HJuLsj/y/uZiIlNOGYtHT9R6Vvy/m
	9jPuw5FffHhx1fxAFGqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgR3N-008Vct-2O;
	Sun, 26 Mar 2023 14:09:01 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgR34-008VVj-0y;
	Sun, 26 Mar 2023 14:08:43 +0000
Received: by mail-qv1-xf34.google.com with SMTP id oe8so5101993qvb.6;
        Sun, 26 Mar 2023 07:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679839721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZg7tvfajeNq18GFXC3qap3a+zEsuUc1lJRtB/LOjbQ=;
        b=kue9NahdmEFNFyi9Z9Kz+d6ev+kVXTNIPGO4kEw4t5gZOePO6QCbTzsp4J2nifJLua
         IvVE35jxat4ieYUrXcrzHb4x5W8p21TysgFzvp0p3/vYkBbV5xwuumCEx5OpRm2qmQtR
         +3IWUiRLB2cZp6IJJU6nDHArLhTbp/oIdO32Y0dDpSr8oFTBKDLmLF3dKLFNAnblnK5E
         4Wr86j1QaZ147zL0eak8zzxON0GVY/gePSBwTsdoQFwVkQfYDidKNTZOixQfy+FyO8aW
         AJ8VdyTPDzdGSbVFJZL7iWEcjrMXBhsbSF0B9Uw9ZkNCWVH6GG9dy31Dl3335S/Y7vM8
         NuzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679839721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZg7tvfajeNq18GFXC3qap3a+zEsuUc1lJRtB/LOjbQ=;
        b=bRF8JLL2PwOYayEGHafxY+a087MjM0VDl3voP717LPEyHHTxPc3NZubgL9HsZwnFIh
         zKV5lkn0WrXGAjP7fyClWlyi3XWWWvdBb5eHDMjI1zdObyOkdKOulJfXPJ2l3jeL+TVA
         e8PPUQerHVYB8GQVbJfn1VFVgh7+AmR5XddiUNKZQPDuMWSiXZr/KklpArYRwQKS22e9
         w+LLPtzut+7jtnEMaPaejxpy4u8St71VvOrp0CU95B2Y8CtgnXy/65NGtNn7/oPns80G
         c+oAVVJ1de3hbwdNFcr3ZIKpdUEo3BuA2bEVZ4f/xaRAtfm5EpeTaqH0NCT6Ew0bEN9I
         D79A==
X-Gm-Message-State: AAQBX9fkffAoTBJfBDTo4T2KCgIYFvG+9Od/e4vXFA4gWtduLfyDTxA1
	JdPyTEB7r77bsFJ2bjr0wuI=
X-Google-Smtp-Source: AKy350bUQGpng0t7Er8DLfWm+MeX5EgNvC3Zf1IA9OKQCjTVHq37FERAld7067znB0Xsj5mlftsQqw==
X-Received: by 2002:a05:6214:e66:b0:583:8e58:6c0f with SMTP id jz6-20020a0562140e6600b005838e586c0fmr13020778qvb.40.1679839721008;
        Sun, 26 Mar 2023 07:08:41 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id j5-20020a0ce6a5000000b005dd8b93458esm2212220qvn.38.2023.03.26.07.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 07:08:40 -0700 (PDT)
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
Subject: [PATCH net 3/7] net: dsa: mt7530: do not run mt7530_setup_port5() if port 5 is disabled
Date: Sun, 26 Mar 2023 17:08:14 +0300
Message-Id: <20230326140818.246575-4-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230326140818.246575-1-arinc.unal@arinc9.com>
References: <20230326140818.246575-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_070842_344251_C93C298B 
X-CRM114-Status: GOOD (  11.98  )
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

There's no need to run all the code on mt7530_setup_port5() if port 5 is
disabled. Run mt7530_setup_port5() if priv->p5_intf_sel is not P5_DISABLED
and remove the P5_DISABLED case from mt7530_setup_port5().

Stop initialising the interface variable as the remaining cases will always
call mt7530_setup_port5() with it initialised.

Fixes: 38f790a80560 ("net: dsa: mt7530: Add support for port 5")
Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index eba356249ada..6d33c1050458 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -949,9 +949,6 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
 		/* MT7530_P5_MODE_GMAC: P5 -> External phy or 2nd GMAC */
 		val &= ~MHWTRAP_P5_DIS;
 		break;
-	case P5_DISABLED:
-		interface = PHY_INTERFACE_MODE_NA;
-		break;
 	default:
 		dev_err(ds->dev, "Unsupported p5_intf_sel %d\n",
 			priv->p5_intf_sel);
@@ -2257,7 +2254,6 @@ mt7530_setup(struct dsa_switch *ds)
 		 * Determine if phy muxing is defined and which phy to mux.
 		 */
 		priv->p5_intf_sel = P5_DISABLED;
-		interface = PHY_INTERFACE_MODE_NA;
 
 		for_each_child_of_node(dn, mac_np) {
 			if (!of_device_is_compatible(mac_np,
@@ -2290,7 +2286,8 @@ mt7530_setup(struct dsa_switch *ds)
 			break;
 		}
 
-		mt7530_setup_port5(ds, interface);
+		if (priv->p5_intf_sel != P5_DISABLED)
+			mt7530_setup_port5(ds, interface);
 	}
 
 #ifdef CONFIG_GPIOLIB
-- 
2.37.2


