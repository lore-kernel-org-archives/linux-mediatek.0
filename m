Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D15C77B73
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 12:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wn2mhEGH9uSsWYt0IDE04ECLf6CmZ7rlTUGMQ0klVZI=; b=KhIWAFYRLYvdqZ
	Ftny2eBmV1EXA1JGj6RCt4lmOeRJksbCeTmKuY2d6qwwoKhwv8+18iUaKFqLuUk8/+f/wt9iC59jz
	hTir3Uw5YeBePksT9d74Y2BcNvAp9z5CptWFXaTGq8SLe0FHtGnyzdk1HBDXqYC23brUVs1447hor
	NcQX8pwOyZyBK1oerqMMrkiK6a1Psj2t8bsTOLNdfCGvMSEWLBxbpwMLEaOFb5L6BOensACb3NDXG
	Fomq0YlSHP6Fi9wDzUH1j2cu4yoLNs0oK/ltZfiwLfYc8jl7kz53YbHJ6nBec3ZqPRZGnIYuTl/vk
	3NVSq8ciFWtfme6coBJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q14Sz-006PUA-1u;
	Mon, 22 May 2023 12:16:45 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q14SQ-006P48-2A;
	Mon, 22 May 2023 12:16:12 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-96f683e8855so500876966b.2;
        Mon, 22 May 2023 05:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684757767; x=1687349767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wn2mhEGH9uSsWYt0IDE04ECLf6CmZ7rlTUGMQ0klVZI=;
        b=grVTVpbbAcn9i9tzer/Hhyb4oNJujAtO5z3JCzf25YBi1o17XTLsveA2xSkhm86GmL
         PfzVa/wiVvVYo70qik+FWTWUp58R1ANSICt/zHTdBA5bRiTZxk6/tn27aWfM/BJ+PKRF
         cfsdfLmuhcwxr+CaZgUju7xlg1HavSi9agaUVatCzMBMqyXXpbIuWCXLZjLh1/zs5xCy
         9bqTLmKEjXE2bB18DrdvYsCAB4VVkU8KlCFbzXOqXDQKt7Sbf6xfDmOuLNDLvfbJHco/
         FYhCluYVWAbRdHMXjetgEY5dqqaeQfxR6yjJG6UMMraor/qiFWozHyr8YU/lJZ2x4G3F
         5loA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684757767; x=1687349767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wn2mhEGH9uSsWYt0IDE04ECLf6CmZ7rlTUGMQ0klVZI=;
        b=GALZ1JRC1IRSUab7lqTGJCoLS+Tr3WbfJ5ovggutaZm7LOXkteDyy+6QUWd5hEIhJ2
         TVb732VyJkt3HIy7ZF6dzen1qrW3SxQfxjQjpbSRIaX/urrY+fw+IMUWk8ofnMsyTwZH
         X94IzTfoyYeHVzgMkWS1mGTxafS7REDH7tjSbtRBs6yFezwD4ww8QfFQxdgPF9Eh6ZwK
         aMsfwa5Jry/Zb22QYg5ey9J/Fv7abBCFcclsdqJRUvpqe79e/uewAyI5KHZ0BzRGgviE
         cYPdAFXtI9QZSrICqrSnw53/m/m32qfnrPvNsprY8eTExn0daYZBwkoFFOKjjrsf5PmB
         GfKA==
X-Gm-Message-State: AC+VfDyFXrH0cqZpHNHxFFv91LTfQ8KbKIloh07K1pUygeaqbjSY9l+b
	jGluPluTyapryWVB20MaBdY=
X-Google-Smtp-Source: ACHHUZ6fvbfhJF4Z2fVXL4PBY3Bkq5p8IxPW8S31fGnhpc3IX2FCvH9KpW5KVg5srUK4wri4CsIx/A==
X-Received: by 2002:a17:906:6a0d:b0:96a:9c44:86d9 with SMTP id qw13-20020a1709066a0d00b0096a9c4486d9mr10488875ejc.12.1684757766853;
        Mon, 22 May 2023 05:16:06 -0700 (PDT)
Received: from arinc9-PC.. ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id y26-20020a17090614da00b009659fed3612sm2999950ejc.24.2023.05.22.05.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 05:16:06 -0700 (PDT)
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
Subject: [PATCH net-next 07/30] net: dsa: mt7530: do not run mt7530_setup_port5() if port 5 is disabled
Date: Mon, 22 May 2023 15:15:09 +0300
Message-Id: <20230522121532.86610-8-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522121532.86610-1-arinc.unal@arinc9.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_051610_744393_2B010358 
X-CRM114-Status: GOOD (  12.80  )
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
Cc: mithat.guner@xeront.com, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
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
index b8f159afcd45..710c6622d648 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -929,9 +929,6 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
 		/* MT7530_P5_MODE_GMAC: P5 -> External phy or 2nd GMAC */
 		val &= ~MHWTRAP_P5_DIS;
 		break;
-	case P5_DISABLED:
-		interface = PHY_INTERFACE_MODE_NA;
-		break;
 	default:
 		dev_err(ds->dev, "Unsupported p5_intf_sel %d\n",
 			priv->p5_intf_sel);
@@ -2279,8 +2276,6 @@ mt7530_setup(struct dsa_switch *ds)
 		 * Set priv->p5_intf_sel to the appropriate value if PHY muxing
 		 * is detected.
 		 */
-		interface = PHY_INTERFACE_MODE_NA;
-
 		for_each_child_of_node(dn, mac_np) {
 			if (!of_device_is_compatible(mac_np,
 						     "mediatek,eth-mac"))
@@ -2312,7 +2307,9 @@ mt7530_setup(struct dsa_switch *ds)
 			break;
 		}
 
-		mt7530_setup_port5(ds, interface);
+		if (priv->p5_intf_sel == P5_INTF_SEL_PHY_P0 ||
+		    priv->p5_intf_sel == P5_INTF_SEL_PHY_P4)
+			mt7530_setup_port5(ds, interface);
 	}
 
 #ifdef CONFIG_GPIOLIB
-- 
2.39.2


