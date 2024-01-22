Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7C4C47DD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 05:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P/UEZXDPYlgIjoddS8sbcmECFybxCBhZQ0Jx3aQlfVg=; b=ItVlK1G3EjLEHLLhztWSAfmKFp
	8Y0SCN+oi9mReRQbQVl4EBCZ1PESyyvyOKpn7r2YUfUsBtndNFGjFn6gAIgnb0ElN8i3cuo0PlMqL
	xHC5yHudPGAibJ0tvNISQn/qcTM/NhcYPXizzC8NnaPHHsbKYF7z4x3BX54FGw8DmQMJ9CkpYYQnx
	FnEQ0Urd/gim8/KxGxh04/qYD5fzfBJ/I2YDb1KaGzFJcyQqEmPVfvUK4RqazqiYvYpBj2Awx3Ti9
	jFEDEsS7yi0GqpEAa5NXjU2r5VZ3wPxS+TBuGETjbCExd2htqCTrMvoFm87wCvszdKU1uEtBhn4z8
	pBb+FjTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRmyh-00AbcF-2u;
	Mon, 22 Jan 2024 05:36:11 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRmyW-00AbXK-3A;
	Mon, 22 Jan 2024 05:36:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id ADAEDB80B37;
	Mon, 22 Jan 2024 05:35:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A8BAC43142;
	Mon, 22 Jan 2024 05:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705901758;
	bh=02D8c8Gk39bt/B0GonHwJ2qvn4sYlrkgLzM0SjuJwjk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PnL4vkGcfSFlPBy6bjD/rwlbY/fS6UtzUxCRdZtpKRTLIx72EnMsY6WJD/IODjmEU
	 9TwLLvG6QIORKrch8mJ6WOeCJLozFmhoAXImEWCXN710+vsmLAqaYcW29BkyKAYmJQ
	 63TuawI2iEQIUzFiAbe6TZpCDZDk6XZ3x0LLmZ2XkRh7tfeI/vzjF0vTH0lKgKiYMY
	 PwiM7BbMjWxB7/4QKTtegqBJo47L0EKEKMElxOuc7yWcp7DfAihdL+gB+GCcZMLuCs
	 KaNhxFcMQ7wgte3eTwJtjVUbrOtYiywr583yuivI6yMqsXA36YGVdnzla5BOgaP6dC
	 v/Bp+DENr7zJA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69553C47DDB;
	Mon, 22 Jan 2024 05:35:58 +0000 (UTC)
From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= via B4 Relay
 <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Mon, 22 Jan 2024 08:35:58 +0300
Subject: [PATCH net-next v3 7/7] net: dsa: mt7530: do not run
 mt7530_setup_port5() if port 5 is disabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240122-for-netnext-mt7530-improvements-1-v3-7-042401f2b279@arinc9.com>
References: <20240122-for-netnext-mt7530-improvements-1-v3-0-042401f2b279@arinc9.com>
In-Reply-To: <20240122-for-netnext-mt7530-improvements-1-v3-0-042401f2b279@arinc9.com>
To: Daniel Golle <daniel@makrotopia.org>, 
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: mithat.guner@xeront.com, erkin.bozoglu@xeront.com, 
 Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1705901755; l=1954;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=CX1ZTLft5JNnPSpvgA9ppPM0W5zZnVzbF5jhuxeYZts=;
 b=m7xRK80HiKn4Yf5gYVKbcOAJuPiW2ZQjrweTiy/ng47qxoKCiENascUa+CONss3MADnR3scXe
 bi2arpEKxnkDpyM3moD6BJkZxd+h2xHCHl22YVS7vuxFGjITKlV6wVM
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt with auth_id=115
X-Original-From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_213601_281605_C093BBEC 
X-CRM114-Status: GOOD (  11.69  )
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
Reply-To: arinc.unal@arinc9.com
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

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
 drivers/net/dsa/mt7530.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 5394d8c6a40e..cd7673ecea51 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -942,9 +942,6 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
 		/* MT7530_P5_MODE_GMAC: P5 -> External phy or 2nd GMAC */
 		val &= ~MHWTRAP_P5_DIS;
 		break;
-	case P5_DISABLED:
-		interface = PHY_INTERFACE_MODE_NA;
-		break;
 	default:
 		dev_err(ds->dev, "Unsupported p5_intf_sel %d\n",
 			priv->p5_intf_sel);
@@ -2313,8 +2310,6 @@ mt7530_setup(struct dsa_switch *ds)
 		 * Set priv->p5_intf_sel to the appropriate value if PHY muxing
 		 * is detected.
 		 */
-		interface = PHY_INTERFACE_MODE_NA;
-
 		for_each_child_of_node(dn, mac_np) {
 			if (!of_device_is_compatible(mac_np,
 						     "mediatek,eth-mac"))
@@ -2346,7 +2341,9 @@ mt7530_setup(struct dsa_switch *ds)
 			break;
 		}
 
-		mt7530_setup_port5(ds, interface);
+		if (priv->p5_intf_sel == P5_INTF_SEL_PHY_P0 ||
+		    priv->p5_intf_sel == P5_INTF_SEL_PHY_P4)
+			mt7530_setup_port5(ds, interface);
 	}
 
 #ifdef CONFIG_GPIOLIB

-- 
2.40.1


