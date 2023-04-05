Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91191C7619A
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 21:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jp4sFg0ojMV8MMU8A9Bkb7JvDbiYw4w687Rv39wQaSk=; b=HkQJOzjCh5Rs1Y
	PMO8xBVWpO09stfsfhMgAvzoo4jN4iZGR/ljqDfnbi23/BKGg6as/B1H9xRLMNq5/CNP1Nc2hTiJR
	nkPSwH5TsXQOozk4Rr4Gb0up5c2+fZW7cJa8bAxBJQpYDwdEwOBgnll6cb30LPPPf+YjPdqsKKE4c
	Rd3wiCLz1SO0ZKxDXS6UfMzmsUQIX7ENtzkMry3p+VMsikv4bqhPKx256m32pIN+Gce4V8XN1JpwF
	7WYOeihI6UdrudRcVPFrki7EvUUx7TKUDFNNlaNyswEl1wnnvzIypnCnvbzh1xR1WraTe181fgaKx
	yI/OTtBFWKkf5eJYAEbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkAyc-005l34-3D;
	Wed, 05 Apr 2023 21:47:35 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk9uZ-005dxd-2Y;
	Wed, 05 Apr 2023 20:39:21 +0000
Received: by mail-wm1-x32c.google.com with SMTP id he13so1968813wmb.2;
        Wed, 05 Apr 2023 13:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680727156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jp4sFg0ojMV8MMU8A9Bkb7JvDbiYw4w687Rv39wQaSk=;
        b=ogrQ00Dp40q8HszYOjDW7BkHkbDsaeh3gTS3X2D8xEh8EyqwhN2zlRUj4CxUSH53gD
         bWQ7QRsAkRS8V8byFcM4sAvzSvnh1MmD3JPIiSVk5NcSczRX50Hc9yjKx4J25aXqw1dy
         Ni/W6LBRqD5VaXUjJiwFb4POV7CM1UqLnj/NucR1ltexeiWhjH7zhWo5vON9+Ts+UDHG
         xZRMXaxHTU5Q9dx4NKypSpTFdU9AsyV561K2f6u/nj2rqvgnyUxO2RhwCpgs5yoGFjcv
         Fn//gj1hdEvVhTq28x67GvvPz9Ch2OdhakpzXrF25he58FllBXn8PqXws8ZIwVz2U4My
         IBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680727156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jp4sFg0ojMV8MMU8A9Bkb7JvDbiYw4w687Rv39wQaSk=;
        b=tCKQnL1AZoMR/1CUFFGZwsnawC6qAlSkR0VTjLns6qHhmbtoAu1N1OJbA+zw5eQF9j
         p62J0vhitI+lYeojMzbmqccSlSq6BH/oYEZyF1QlHk3t6QkGA0jU3sBA/uQwpKuinQ1/
         rBn7PANGiIuetEar+zyDABkE7+1oy/vyb/ghjnJZltfpmaZ+kpxr0IIvLEu/isGT51g0
         MKX/n0GRZp9vUxnHJ92rrUMJA04i8CyQ129/5K8pCIK96CkVeLAZKkqUyvw61mTjXiTT
         9whIkkpPPtWHrBfBvCenSBDu+f3fmH/HjRTaxdF7AWWp6KqQyZOfpa568iTqHBJREaJ9
         1dXA==
X-Gm-Message-State: AAQBX9cWqx6xvgMnVQMORmWBJxZbGySSrFMORz94uYDqEEqZ6zJTmgui
	vNeCM35KSA40IyL6h/JrB+o=
X-Google-Smtp-Source: AKy350ZVk8+Ei+TV+4GGdj0W1xwoZVPnMiI9MhynZB1AsFil19iJwi0XmYRr9kmqdo9q1BV4k/E/1A==
X-Received: by 2002:a05:600c:acb:b0:3ed:b6ad:54d with SMTP id c11-20020a05600c0acb00b003edb6ad054dmr5675428wmr.18.1680727155894;
        Wed, 05 Apr 2023 13:39:15 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id p19-20020a05600c469300b003eda46d6792sm3259867wmo.32.2023.04.05.13.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 13:39:15 -0700 (PDT)
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
Subject: [RFC PATCH net-next 05/12] net: dsa: mt7530: remove p5_intf_sel default case from mt7530_setup_port5()
Date: Wed,  5 Apr 2023 23:38:52 +0300
Message-Id: <20230405203859.391267-6-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230405203859.391267-1-arinc.unal@arinc9.com>
References: <20230405203859.391267-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_133919_830831_F7242B5E 
X-CRM114-Status: GOOD (  10.32  )
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

Remove this default case which will never run.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index fccd59564532..8a47dcb96cdf 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -943,10 +943,6 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
 		/* MT7530_P5_MODE_GMAC: P5 -> External phy or 2nd GMAC */
 		val &= ~MHWTRAP_P5_DIS;
 		break;
-	default:
-		dev_err(ds->dev, "Unsupported p5_intf_sel %d\n",
-			priv->p5_intf_sel);
-		goto unlock_exit;
 	}
 
 	/* Setup RGMII settings */
@@ -980,7 +976,6 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
 	    priv->p5_intf_sel == P5_INTF_SEL_PHY_P4)
 		priv->p5_interface = interface;
 
-unlock_exit:
 	mutex_unlock(&priv->reg_mutex);
 }
 
-- 
2.37.2


