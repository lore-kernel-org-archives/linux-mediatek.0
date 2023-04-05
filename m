Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3F7C77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 21:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ry2z2xzBFl6Ly3vSlf60f+roED9HAgz7ua4fkZgzGE0=; b=1tFuqF6eVrlLYr
	IknvXvSdY9RuokZFRJKtfK+FrKsE0tP5xhz6gi08c/lnWOJjTgXi8NDWJBmQkFj+j5NjpCbRDBTnn
	4P39k9ekDLLYq5xPJ7UvvpnbfuF7+FBT1BT5/mDg/Nj16Tz4DUJ8xJuP4uDKhjtBeh+7DXmhy0HGD
	xrEAI6oaIUBQfSVQA79i4smYwlwrjQuZFcs7Hd22Quzve+Uyez/r6rDUe9ICShxcXteGdQ4UN9Tqw
	Ba0SQwm6U0eu3BEHD0tRPO8+5ZFqHnBz+pKJuKgbllRrwe/W5Ik9nY7/5DVNuHP0YxA291f5SoZju
	N2xu5lleXlW9M+ho3Ezg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkAye-005l3c-1V;
	Wed, 05 Apr 2023 21:47:36 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk9uc-005dzK-0P;
	Wed, 05 Apr 2023 20:39:23 +0000
Received: by mail-wm1-x330.google.com with SMTP id p34so21585481wms.3;
        Wed, 05 Apr 2023 13:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680727158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ry2z2xzBFl6Ly3vSlf60f+roED9HAgz7ua4fkZgzGE0=;
        b=B10ji6xoiT0KxNstoIf5OK4ul/y1PldmpWHRRnHJt1TTMY8uy1Ri+rx+FbMG8mP5nx
         wTD2y33SyfmX093zp8tIpavy1sb+9KEomRXl/FO+f6xxOC/m9jruqhWPxaIQCdu1LVNf
         uvT/t3r/to1RYojP7TVRl8ook1fgIpCss11RcOxcLXlUurmJsQbXhBALHRSAFxiVVg5f
         ymEWzmFrLRRgAiYlmWj3C/y8x2kup19rTBLxrMKnHg+Y4h4mBKBFP6Nb/S9p9nmqCFSs
         KocXGXZdx8t7MCkX7DZ82p2f7imGHXztIQEeRqlIiNfvyu1RFK2Do2NIrLimLMw8Z5ff
         bpIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680727158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ry2z2xzBFl6Ly3vSlf60f+roED9HAgz7ua4fkZgzGE0=;
        b=GtUtJEgE2huiSKCwkNm+jDcsLudjmWUvpFXPnKNSb2b+81+pst2X8Pxxd/Mmv/CMsf
         ZCjdbwmsOm8PqJS6bAC+vaSz+ewc4VaSj6MC3GS3vi5TW+CYvNGIr6wWY5gS+w/KWNDx
         ZPbZtxp7JYGDeqcpc8IIvIlYN1VK7+o7qSij8tK5+yklZdXl50UjgQd8Ir+aL5BtiHKh
         U+KISiY/vGzuEhHTEe3332unbT1ukcRJTtgc37GHub19RkbYKhaUe1r9x8jTENGlSs8Z
         QybFQxEgHL3qGLxmN2tZpU1JKkiWZ6yInb74rfRzOcMZkzf3g2KN8/hOJY8e/GedPsCh
         oVyQ==
X-Gm-Message-State: AAQBX9fq/zZsxDPd+lwovFzbnyExtwxNykQ9gEBSLqamfgmENyVJlW6a
	iP+220ZVzbrfJ1ZsD3hoFVc=
X-Google-Smtp-Source: AKy350bQFfU4n56kkWO8UhzXgxMrHnZq+NNzuA43JcBRFIly5bQiINuogGqFG5ekfNdRs/vk5zwdgA==
X-Received: by 2002:a05:600c:ace:b0:3ed:ea48:cd92 with SMTP id c14-20020a05600c0ace00b003edea48cd92mr5970347wmr.15.1680727158320;
        Wed, 05 Apr 2023 13:39:18 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id p19-20020a05600c469300b003eda46d6792sm3259867wmo.32.2023.04.05.13.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 13:39:17 -0700 (PDT)
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
Subject: [RFC PATCH net-next 06/12] net: dsa: mt7530: do not set CPU port interfaces to PHY_INTERFACE_MODE_NA
Date: Wed,  5 Apr 2023 23:38:53 +0300
Message-Id: <20230405203859.391267-7-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230405203859.391267-1-arinc.unal@arinc9.com>
References: <20230405203859.391267-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_133922_180540_91A49EFE 
X-CRM114-Status: GOOD (  12.42  )
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

There is no need to set priv->p5_interface and priv->p6_interface to
PHY_INTERFACE_MODE_NA on mt7530_setup() and mt7531_setup().

As Vladimir explained, in include/linux/phy.h we have:

typedef enum {
	PHY_INTERFACE_MODE_NA,

In lack of other initialiser, the first element of an enum gets the value 0
in C.

Then, "priv" is allocated by this driver with devm_kzalloc(), which means
that its entire memory is zero-filled. So priv->p5_interface and
priv->p6_interface are already set to 0, PHY_INTERFACE_MODE_NA.

There is no code path between the devm_kzalloc(), and the position in
mt7530_setup() and mt7531_setup() that would change the value of
priv->p5_interface or priv->p6_interface from 0.

The only place they are modified is mt753x_phylink_mac_config() but
mt753x_phylink_mac_config() runs after mt753x_setup(), as can be seen on
the code path below.

mt7530_probe()
   -> dsa_register_switch()
      -> dsa_switch_probe()
         -> dsa_tree_setup()
            -> dsa_tree_setup_switches()
               -> dsa_switch_setup()
                  -> ds->ops->setup(): mt753x_setup()
            -> dsa_tree_setup_ports()
               -> dsa_port_setup()
                  [...]
                  -> dsa_port_phylink_create()
                     [...]
                     -> phylink_mac_config()
                        -> pl->mac_ops->mac_config():
                           dsa_port_phylink_mac_config()
                           -> ds->ops->phylink_mac_config():
                              mt753x_phylink_mac_config()

Therefore, do not put 0 into a variable containing 0.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 8a47dcb96cdf..fc5428baa905 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2247,8 +2247,6 @@ mt7530_setup(struct dsa_switch *ds)
 	val |= MHWTRAP_MANUAL;
 	mt7530_write(priv, MT7530_MHWTRAP, val);
 
-	priv->p6_interface = PHY_INTERFACE_MODE_NA;
-
 	/* Enable and reset MIB counters */
 	mt7530_mib_reset(ds);
 
@@ -2466,10 +2464,6 @@ mt7531_setup(struct dsa_switch *ds)
 	mt7530_rmw(priv, MT7531_GPIO_MODE0, MT7531_GPIO0_MASK,
 		   MT7531_GPIO0_INTERRUPT);
 
-	/* Let phylink decide the interface later. */
-	priv->p5_interface = PHY_INTERFACE_MODE_NA;
-	priv->p6_interface = PHY_INTERFACE_MODE_NA;
-
 	/* Enable PHY core PLL, since phy_device has not yet been created
 	 * provided for phy_[read,write]_mmd_indirect is called, we provide
 	 * our own mt7531_ind_mmd_phy_[read,write] to complete this
-- 
2.37.2


