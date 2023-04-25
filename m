Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB64C77B71
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 09:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZV9/o17xPvhI7zBC/LGreGcB1RV1tqZFpx81rZya07Y=; b=x+Dfdxq3xodgvm
	2IxoEhnULyv7VF//VGir/HKWGdYUzBqm8uP4abp31c/PUpw9/vqiBx/b/er1slSWJgdMda45seAGa
	hTItWDC3XJ7mXk7FejtsdlSfleqKRUnhXP8gW+ElDqOha+p1bPwa+jjz5x9IgU9qoQqOWKKDLfXt/
	BHd3YdsxRagdTAGUQcQkeV9MycS5MLaCqM98Lnn/5x9tuA08HdXrNmYZa7mtNVIf+CTUjJ2bkEz2K
	nM4ZIwgtQU3QxdajbibvcON5qU3XoMoiwlDFMCuHsjI8U90xUkhu+/NmkBSE2SCPD8zmv6VLddXpB
	is8B1Mf0pLR87MW/6nbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prF0J-000e2H-1j;
	Tue, 25 Apr 2023 09:30:31 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prE3x-000UgS-2f;
	Tue, 25 Apr 2023 08:30:15 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-504eb1155d3so40857223a12.1;
        Tue, 25 Apr 2023 01:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682411411; x=1685003411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZV9/o17xPvhI7zBC/LGreGcB1RV1tqZFpx81rZya07Y=;
        b=ofF8cvyb2QFgkMaFU0VQLXptVklQ8QYHBxZEsNaTCvxJxJ3ZrhXI/Kj50pdwhqZ4Nd
         m4n/+USQGMKuN19yf+k41GD10ZUE3PQ2WoFFOe0XRWKmbhI7c/8sGw1va7ICq9H+RGdD
         pK4ocmhO/8mJ52fZJKcc+y3JE1N97UrkRTg+W6J9siDVo1kusSSfs/7yIjZQ+zgq1rQr
         Aiz2rplD7AvhqFoGRHPS7nx74qZEE9VrsWqoNhTTDFsDeZkRZ2NJ7po/x3mkDfsXy4/U
         WqzsJvin3es+my7E9TziBOYDLUD/qvx8CAkofVU1wR7lCrw1TgL5gb+fckZmxLm3zXK9
         d/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682411411; x=1685003411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZV9/o17xPvhI7zBC/LGreGcB1RV1tqZFpx81rZya07Y=;
        b=WKWl3Q9dmnqhqp40tpVau78AMuyJkHZRm91SQqZ0unGyvIkZVcNqhYOQCsLYtSBqUX
         XYQGNej9xuEqKKricRd7WkBxr1UAR/9SOANUQ4e3pT+zFYdDaSOSQrcvZtXZkpaJXx71
         7bNUqDVTNB8kSUS++sJZ8rXJVwDbqedV3ip+/3yJ3o8mvA1L3uMa+uuwQxQj3OK3wkaf
         3TCUpoVWyfaR3oy2ClQNEhzBnz4hf9EsuW+fy3n0McXWmtnwtPhuSNkhpu6cMLb2tC2W
         HndgYDhHjGHwmdoFMR7Ojl3Yjrk8/sqeTY4YGbF6jweVGemfHtqcbdo2pwPNJZ3deP28
         557w==
X-Gm-Message-State: AAQBX9fBnom0bU2UT/2XDxzjrmwYuDpDSsPeLXAFEwM0XIli7S9447lj
	nNNNGpjbrxLedCIgP+2aV2k=
X-Google-Smtp-Source: AKy350bQmjuao9lRHA+a9WNEY9AKrZ9G8JjIfn1vNnMwMltc90lAEtjbhzBai4IroqCXikVVgfWq9Q==
X-Received: by 2002:a17:906:edc5:b0:953:7f08:a9ee with SMTP id sb5-20020a170906edc500b009537f08a9eemr12950081ejb.1.1682411411128;
        Tue, 25 Apr 2023 01:30:11 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id mc2-20020a170906eb4200b0094ca077c985sm6439028ejb.213.2023.04.25.01.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 01:30:10 -0700 (PDT)
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
Subject: [PATCH net-next 08/24] net: dsa: mt7530: do not run mt7530_setup_port5() if port 5 is disabled
Date: Tue, 25 Apr 2023 11:29:17 +0300
Message-Id: <20230425082933.84654-9-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230425082933.84654-1-arinc.unal@arinc9.com>
References: <20230425082933.84654-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_013013_868847_B32F3AF8 
X-CRM114-Status: GOOD (  13.27  )
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
Cc: netdev@vger.kernel.org, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
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
index f3d238a46543..5ef348b6a4b2 100644
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


