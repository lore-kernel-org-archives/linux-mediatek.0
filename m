Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA18C77B76
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 14:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VA0Xuk7MTgGa91dYwTC92d17A98m4rbax3BNrbxXgxg=; b=J8VdtPs4oEG2Tt
	T2gsodXHVU4tnJMoUg7CPZ/agCCWNLKyEj741Sq4h9JySP8CezniEMDCoFolI3lcZ2HpMSGfUlKrE
	Pg13qP0R8TJb7KzYddwEW7ty2MaBZwk1C5e/5MhEexNVuVQl+ACKKOaZJW/TbJxuU2P/nAV3k2LeN
	6cnt5luPBrlFRnz61RmmnNNgdUFL6Qo6k7WdFv0Il00pqThycNRaqsYZCnD/8LivrSsYfo2DL07o7
	eV6iMhGx0afQn2+PLJ2oqw7TH9HQEnQM2sujvVuC8oPNZdRgaFJtprD54XbF6bN23Nz1ETy9Wtd6e
	hxoW6Ct7P5/tH1FxREGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pprtn-00B86c-2V;
	Fri, 21 Apr 2023 14:38:07 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pprsu-00B7RU-1q;
	Fri, 21 Apr 2023 14:37:13 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-504eb1155d3so12776473a12.1;
        Fri, 21 Apr 2023 07:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682087830; x=1684679830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VA0Xuk7MTgGa91dYwTC92d17A98m4rbax3BNrbxXgxg=;
        b=M4UWnciomcUE4HK+mDFOEhaQpLMON/yMq1egd2eGD0WjqLi+0EO8LKCpuYv/hx30WT
         nhwfgfnd8DOh+GrNePxRaULnUkLzivdzGvaE8i3r/QtreW8oXp68KJttbMRL/gv+4SqY
         q9hBwdaSa5lbn1G4FlJ0xKusB6GQET/Lw1o1BTFaSvho5tKvyql2BDBAnn0bj6QcMCDD
         HQTaxEG0hAMhP7kxEAhW8QOxumCzrHRruAk/Y2nXsU6dVu4zTFPF5e2/pk9wjnTCbdJW
         qBC0hiFpBRl3zD3KC9ZZVOA+LqLwQF3C1/0qrp2ADUL2DuRyPGWgi3d6hMS8AItrDZ7f
         thqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682087830; x=1684679830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VA0Xuk7MTgGa91dYwTC92d17A98m4rbax3BNrbxXgxg=;
        b=LLoWFYK1minU3cDCoJfRJnoKbGmOj8xY4LP5BlSxWLpfPpfKbtzF2IL3xsGfzugDTr
         RPtpI0Gbmu2yZSQz8HWmuD6QJjONCtNBIDtxHpkJnglZAj5eIYCyjs0eKdSnCC5XZmhn
         vUHYfpBfjvqbmdzH2gPnHQ62NDQmCdtzL0yQaw7amuNcxOfeW6rLOSwB+X697OZfwXf/
         NZ6QUCay7WuI0IS35AKVtp5mcAvGSePBLHU8RzRc+Brw25hRJYrTeMYYYRrH7vj1ARtx
         B/BWlPENxQ4KQ5SKlyEzksm9guO+qwPKtohF+Xbsb+7Vp+pZDXqWlA1Jz9xTImwV6fBb
         T/kw==
X-Gm-Message-State: AAQBX9f+xsmLlSvqNbIXx/kJ80E05LlP7Lb6iuw5kiSgpDYmQXoFsLPH
	Hgj7P1eTp83/t+866RPnU2w=
X-Google-Smtp-Source: AKy350b1lI/7oYXC7o4YA2rNQhIhx/wnN+4LOaI5v5kCAlbObHDch3hFRAM8039Bj2AeoQ/vDBwLKw==
X-Received: by 2002:a17:906:4ec5:b0:94e:80b2:51e3 with SMTP id i5-20020a1709064ec500b0094e80b251e3mr2310031ejv.27.1682087830425;
        Fri, 21 Apr 2023 07:37:10 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id q27-20020a170906361b00b0094e1026bc66sm2168244ejb.140.2023.04.21.07.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 07:37:10 -0700 (PDT)
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
Subject: [RFC PATCH net-next 07/22] net: dsa: mt7530: do not run mt7530_setup_port5() if port 5 is disabled
Date: Fri, 21 Apr 2023 17:36:33 +0300
Message-Id: <20230421143648.87889-8-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230421143648.87889-1-arinc.unal@arinc9.com>
References: <20230421143648.87889-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_073712_609643_1B3041F2 
X-CRM114-Status: GOOD (  13.43  )
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
 drivers/net/dsa/mt7530.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 591df09c8bb5..bac2388319a3 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -932,9 +932,6 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
 		/* MT7530_P5_MODE_GMAC: P5 -> External phy or 2nd GMAC */
 		val &= ~MHWTRAP_P5_DIS;
 		break;
-	case P5_DISABLED:
-		interface = PHY_INTERFACE_MODE_NA;
-		break;
 	default:
 		dev_err(ds->dev, "Unsupported p5_intf_sel %d\n",
 			priv->p5_intf_sel);
@@ -2282,8 +2279,6 @@ mt7530_setup(struct dsa_switch *ds)
 		 * Set priv->p5_intf_sel to the appropriate value if PHY muxing
 		 * is detected.
 		 */
-		interface = PHY_INTERFACE_MODE_NA;
-
 		for_each_child_of_node(dn, mac_np) {
 			if (!of_device_is_compatible(mac_np,
 						     "mediatek,eth-mac"))
@@ -2315,7 +2310,9 @@ mt7530_setup(struct dsa_switch *ds)
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


