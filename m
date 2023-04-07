Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB835C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 13:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TL1ifXOj3OEH5mV418CX1uP5QyBqfV3oBYYgm4r26w8=; b=3nUrZnYR6/2gfd
	MFGD1UqlllHmW6N/xRNcUhaX5FH+9jAvgpbNq+z1HdIX/Qn4lI/MoK+cYcFKKBx//ND4dqnTefSzC
	+1YgGpeGxDLs9eNo034couLA5UtjaaUxeieTWwEfbc/X24F/YTOl7+7tX+U7nDOO7q+rixgcWA9ys
	uP7YrsMZKPDcrBhA7UqlmGpwS7eb5Pz2ZzmfefMpqfWqmo2a3uC8dZOKhujYgwV5p+bBa3utGwrL0
	pwNGQ2HlB8G+i8+JQkF9MU9otsIfAtb38/a6IBeO6/LHNG0dzTD+KI9weE/feB3qxiA6g4IY+zxgj
	/t6y9E+mNhNb/lBPcHjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmQZ-00ANRD-0x;
	Fri, 07 Apr 2023 13:46:55 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmQV-00ANNC-0V;
	Fri, 07 Apr 2023 13:46:52 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-54bfa5e698eso130482697b3.13;
        Fri, 07 Apr 2023 06:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680875209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TL1ifXOj3OEH5mV418CX1uP5QyBqfV3oBYYgm4r26w8=;
        b=brzH4Zr9wcAE9Er/wEsGJxmQUi4okUwFqcrv69/yi+p5271tRXAgDqXIOYN3hBegy7
         om4LYIN9tDQtVsMg7NQJwMWzM4Q0mq0wI8SAKMquObkBkrAD2vN0q9gRRq5ep+maZMVo
         elyVb58YyuFogMN36xNWcYYmozvuQPb/rP17rC2/LEP36rV5o2qMpIVmZFIpAjQ401W1
         4nNCCRoq1GFizygBm6eWTb9OP3ohPhLrOTeH0OfFvama9xTFc3wo4MzelUwgPaR+Or3z
         cGPqxvWHPOR9D2snqAoTDTxkb+YoNtk7KC5uFVvRNKZiKKb6FnJzWAbuiQo6dyDfvayR
         TFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680875209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TL1ifXOj3OEH5mV418CX1uP5QyBqfV3oBYYgm4r26w8=;
        b=rysk819g2lgBR+9KgImeSur1gLVM2wEyNL3Yj32xyAM0ti8greCc/EL1nfuwr3fSIH
         EO+OjcytT7mnUg8yyEoWZg5uFp1VCmRJ5wSkxkhYM2v32w4zXlYBDjy2+4+1zN9VYjJB
         G2P0HSHMtu9LgZIxCpfHvebGZWlYz3F9u2XxEXyITsLEcTx0FuCFZoUQgF1ZCO57MyKE
         tx1pHq4FQ52ed4S2I79sSfgvhHlsinmpvo2bapdH54KRS4EyOnY7FTDNz7zFJutX6If0
         Txh7HKz7C/PpkuTqNY0KqifuJAI41A3MD/jq4O+e6d5Uc0VPa01aGxCcbsaFXvSrErib
         Py9w==
X-Gm-Message-State: AAQBX9eBMKnwupsHtofTo09gBVmgoz2sNKDvovUzVC0s/zytBz59+enc
	D/dQ67VQWxXd+G16vkkmJIk=
X-Google-Smtp-Source: AKy350Z/AUqNXhcPJmR8umz9jFQUHbV+jS24GKZcYfRxzzfAUr+lQ2e2xeJcqDG5YNrWF7wFVuuMOg==
X-Received: by 2002:a81:6804:0:b0:543:8177:5c6b with SMTP id d4-20020a816804000000b0054381775c6bmr1867560ywc.29.1680875209028;
        Fri, 07 Apr 2023 06:46:49 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id 139-20020a810e91000000b00545a0818473sm1034317ywo.3.2023.04.07.06.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 06:46:48 -0700 (PDT)
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
Subject: [RFC PATCH v2 net-next 03/14] net: dsa: mt7530: do not run mt7530_setup_port5() if port 5 is disabled
Date: Fri,  7 Apr 2023 16:46:15 +0300
Message-Id: <20230407134626.47928-4-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230407134626.47928-1-arinc.unal@arinc9.com>
References: <20230407134626.47928-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_064651_224671_4B0F508C 
X-CRM114-Status: GOOD (  13.30  )
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


