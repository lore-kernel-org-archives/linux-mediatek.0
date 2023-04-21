Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109FAC7618E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 14:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BEQa4/xHb6zNxlzp+nQz3Th+D0wsYwHJEzOMjCihAA0=; b=J0olRf9Aojl/+1
	0ySlO+CXeJaxGKDbLxILUULMEdzJ2xvR5olEfrDIYMrTH9q1S5KpdlVca/UCxjjFB1PNDEq7Yj+h0
	OTfQa+ViXtj10FKaKlbHAL1siZGvihSZv0dahagpuYDOolgG6awZmIhUq+eN7OyyZ5CxuW88XwAQN
	Y9fEJX42m9Qv6/WQpwhLwuxF9Bp2XTHiS6ocV5PzSdf+eAFbbRxFDSc9L2ufFsuYhFHW/UFxTC0Dm
	z20i9s3tLSK4lFisbfkmTrAiTaDYo0pPJMggGQMJSNKksW+EWJ2TWHcH+xEZ41hH+fB7TUxkAKzSZ
	iu4atP6JdiYVxA0chP9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pprte-00B80L-1E;
	Fri, 21 Apr 2023 14:37:58 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pprsq-00B7NP-2t;
	Fri, 21 Apr 2023 14:37:10 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-50506ac462bso2549296a12.3;
        Fri, 21 Apr 2023 07:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682087828; x=1684679828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BEQa4/xHb6zNxlzp+nQz3Th+D0wsYwHJEzOMjCihAA0=;
        b=ZLiz7VI1LgCRTrl6vuhh0Ya1V50x4rqu6D/kmhJ4UHrdgB/mMJHYQkQYrsg+Y+kID2
         ZrAzSyHbSBnBngaySNZZz6RJyf3nkcWbaV1Hc6qyoevLGH6nN8tEBZDCBewM0ovE+yTE
         6vX5eR74L4i7Cvi3wCnjqggrtwXEPVds4Jzz64X2oJY35U+Qm9cf55rGYkPcqu8VXyhY
         7ruEraMsbDx/1qDhyyzdJgfm4QQghUoPq2PSYtLkEIrzlkHlMk0baKzlgn6bTBh6NvX2
         YXTq76Vpysm8U32kc8euQkRQS+9SWhtUrkTrjOBxEc9fkGsnKi8StkloxnLZwFM3WWPL
         ginw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682087828; x=1684679828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BEQa4/xHb6zNxlzp+nQz3Th+D0wsYwHJEzOMjCihAA0=;
        b=iClx6TkQD/1vd6Yd51LWqEg2/pftud2t8yFVQGx6mCtHcHQo6Pm8Dg3NNCKHyu2oA/
         /ECSuvJFPaYWfRz+hsw5dHhltkUXv+VFok5P1esPevn6yKDxC28YoMna6UJ5lpJE/tkI
         6gz4R3wIXQf+95JiFSPUI+8gJdf1ddJt/U/Zt0lE87hWmd1bA7p8pWdv+rxrL30+ZUGi
         xOl++D34FnJfkRbX6mTji6LkWmm8pza8/CqrFAlKQ9kP3SnFaLbEHNYYqQ5itSoO6EFY
         G+MT3QdMtajWNl1kajQc02EjvHMmlQJQGSrCJHPPhZ3931yZOSFkTMwmZcG3hMsG7loh
         8Wzg==
X-Gm-Message-State: AAQBX9cSxAIC16Oz2Ekg/MxeEpRyww89cpzmT49a7Eop5cABtA6ihJ5c
	1fs7Y5FOvCTjlRO4snA++Qc=
X-Google-Smtp-Source: AKy350aYC8vZhVhjqQTuEMfzGSYTGJE29X38itrkcvfN2wPBmLh7N3Xsl7f7jIM8oO1qa+oppffqeA==
X-Received: by 2002:a17:907:a40e:b0:94f:a292:20cc with SMTP id sg14-20020a170907a40e00b0094fa29220ccmr2834815ejc.41.1682087828142;
        Fri, 21 Apr 2023 07:37:08 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id q27-20020a170906361b00b0094e1026bc66sm2168244ejb.140.2023.04.21.07.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 07:37:07 -0700 (PDT)
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
Subject: [RFC PATCH net-next 06/22] net: dsa: mt7530: improve code path for setting up port 5
Date: Fri, 21 Apr 2023 17:36:32 +0300
Message-Id: <20230421143648.87889-7-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230421143648.87889-1-arinc.unal@arinc9.com>
References: <20230421143648.87889-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_073708_977569_36122146 
X-CRM114-Status: GOOD (  19.99  )
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

There're two code paths for setting up port 5:

mt7530_setup()
-> mt7530_setup_port5()

mt753x_phylink_mac_config()
-> mt753x_mac_config()
   -> mt7530_mac_config()
      -> mt7530_setup_port5()

Currently mt7530_setup_port5() from mt7530_setup() always runs. If port 5
is used as a CPU, DSA, or user port, mt7530_setup_port5() from
mt753x_phylink_mac_config() won't run. That is because priv->p5_interface
set on mt7530_setup_port5() will match state->interface on
mt753x_phylink_mac_config() which will stop running mt7530_setup_port5()
again.

mt7530_setup_port5() from mt753x_phylink_mac_config() won't run when port 5
is disabled or used for PHY muxing as port 5 won't be defined on the
devicetree.

Therefore, mt7530_setup_port5() will never run from
mt753x_phylink_mac_config().

Address this by not running mt7530_setup_port5() from mt7530_setup() if
port 5 is used as a CPU, DSA, or user port. For the cases of PHY muxing or
the port being disabled, call mt7530_setup_port5() from mt7530_setup().

Do not set priv->p5_interface on mt7530_setup_port5(). There won't be a
case where mt753x_phylink_mac_config() runs after mt7530_setup_port5()
anymore.

Do not set priv->p5_intf_sel to P5_DISABLED. It is already set to that when
"priv" is allocated.

Move setting the interface to a more specific location. It's supposed to be
overwritten if PHY muxing is detected.

Improve the comment which explain the process.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 30553044d4b7..591df09c8bb5 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -968,8 +968,6 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
 	dev_dbg(ds->dev, "Setup P5, HWTRAP=0x%x, intf_sel=%s, phy-mode=%s\n",
 		val, p5_intf_modes(priv->p5_intf_sel), phy_modes(interface));
 
-	priv->p5_interface = interface;
-
 unlock_exit:
 	mutex_unlock(&priv->reg_mutex);
 }
@@ -2277,16 +2275,15 @@ mt7530_setup(struct dsa_switch *ds)
 		return ret;
 
 	/* Setup port 5 */
-	priv->p5_intf_sel = P5_DISABLED;
-	interface = PHY_INTERFACE_MODE_NA;
-
 	if (!dsa_is_unused_port(ds, 5)) {
 		priv->p5_intf_sel = P5_INTF_SEL_GMAC5;
-		ret = of_get_phy_mode(dsa_to_port(ds, 5)->dn, &interface);
-		if (ret && ret != -ENODEV)
-			return ret;
 	} else {
-		/* Scan the ethernet nodes. look for GMAC1, lookup used phy */
+		/* Scan the ethernet nodes. Look for GMAC1, lookup the used PHY.
+		 * Set priv->p5_intf_sel to the appropriate value if PHY muxing
+		 * is detected.
+		 */
+		interface = PHY_INTERFACE_MODE_NA;
+
 		for_each_child_of_node(dn, mac_np) {
 			if (!of_device_is_compatible(mac_np,
 						     "mediatek,eth-mac"))
@@ -2317,6 +2314,8 @@ mt7530_setup(struct dsa_switch *ds)
 			of_node_put(phy_node);
 			break;
 		}
+
+		mt7530_setup_port5(ds, interface);
 	}
 
 #ifdef CONFIG_GPIOLIB
@@ -2327,8 +2326,6 @@ mt7530_setup(struct dsa_switch *ds)
 	}
 #endif /* CONFIG_GPIOLIB */
 
-	mt7530_setup_port5(ds, interface);
-
 	/* Flush the FDB table */
 	ret = mt7530_fdb_cmd(priv, MT7530_FDB_FLUSH, NULL);
 	if (ret < 0)
-- 
2.37.2


