Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE30DC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 13:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=crYfk2VDIQF894aVQJBbVhrnboljTGA23/Z6qxtRjD0=; b=J49/fTugeCHWzX
	bcTRxXnKnOFnyH4mfF8Bcu6DTNm9bNybqtRsNOTeDwMlnZ908JwSk1p/KyT5zCaxa1HHnZMtz+gXs
	a6YSSF17swAnhcFL3PqktNI8dTY4jgqwQsu2dWE2nEJpGha5JzW8Z6K6ec9NNSCjKalWWmX1T1TkY
	uv+jX+dQAaYSZnMp2VDodv6CTyxbHoASTtPi6FEHVpTtFyTre4cEywZ+F3QD+2p5t1q3gOp8Mb8r0
	aaKb7jJFl4sXzfj5y/IQIpI7iDpCtE+GuYuh/5Z6wFYWCG78VwXkcUV0oZzTMSr4Amaq6BPdyyhJG
	tFYHsiFknp7BcYoePXFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmQc-00ANUH-1g;
	Fri, 07 Apr 2023 13:46:58 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmQY-00ANFv-0L;
	Fri, 07 Apr 2023 13:46:55 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-54c0c86a436so96795067b3.6;
        Fri, 07 Apr 2023 06:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680875213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=crYfk2VDIQF894aVQJBbVhrnboljTGA23/Z6qxtRjD0=;
        b=QY+JalpFS6CArA2lrrReVeAa2wVaum9DzGiL//HC2IZCot6mehT7TTubrAM34WoH4v
         bjD2iOhSj6XgUDYZtrCf1tRoZM2T5r+kHBIHctNa5KRCGRDnRH+CPvPVh2MbdmPfXerV
         4ZPSjhu65Avak1reJ5XEpF5TIzdgUo9hVnD9YA1KOXSm/QCqAROiGt5j2pC8T3GI0Gi8
         DO8I2stIfAKP2mUw6+UvQgSv94v41jSH10z9+Yk7DhdKEIp+edhIe9KgyXwG1jU29x25
         5YCmpxjjsQFDn7tONHozn++go+gA9HsSZ5z1fIeHgTLmCjlRUBWekd8K4kFjCeqt9biA
         HOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680875213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=crYfk2VDIQF894aVQJBbVhrnboljTGA23/Z6qxtRjD0=;
        b=8Jf7G8C9g/Z5BBT9yw9bM1wwVJVXZY8tQeK5O+rYizNi4cinTnTZ0GJsLro9avtL+3
         lAZctmYDe8MBKGyG2KiS5jSUhbtnpLE9DBMqJ3HZJennRKdyVgRO0lkhtMylX/z+cGws
         iB6lSlH5qPezUcFA56Us4qmqETgDI7J9kesiJ3vuxK8KH/K+ggSH3RnMrEZgawrnPseZ
         x8AFHe6pqDXzCEadNuf5D559JaIH52eB7VXaRhjgAsM4LOCU1DZga4UQljlgeq6Wdmc3
         wdQJLzY+TQQlZWEZTzqFVT/jwJUXugxJb38LQ9l694xw/ir3Oi+neyNp8hl0OoJqyr/t
         oxWQ==
X-Gm-Message-State: AAQBX9fbWqQtDAcz3Woe87o2xNBfo1EmqkCPcJ3AB0AO2Byic5ZZcYc6
	kT67iWGaeh5J9I3HMTStxMA=
X-Google-Smtp-Source: AKy350YCviPdDCOMqYkjoXEQJo3vspWZPzx5722NzonIxcctqluA1mW7IKTic0Bg6HEGuQ5EyGmWnQ==
X-Received: by 2002:a81:63d5:0:b0:545:e54f:b1ff with SMTP id x204-20020a8163d5000000b00545e54fb1ffmr1848742ywb.4.1680875213597;
        Fri, 07 Apr 2023 06:46:53 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id 139-20020a810e91000000b00545a0818473sm1034317ywo.3.2023.04.07.06.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 06:46:53 -0700 (PDT)
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
Subject: [RFC PATCH v2 net-next 04/14] net: dsa: mt7530: set priv->p5_interface in correct conditions
Date: Fri,  7 Apr 2023 16:46:16 +0300
Message-Id: <20230407134626.47928-5-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230407134626.47928-1-arinc.unal@arinc9.com>
References: <20230407134626.47928-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_064654_151507_6BEA44C6 
X-CRM114-Status: GOOD (  13.70  )
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


