Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FC8C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Mar 2023 14:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gZ3M3RaLFnNGnHTnAZjnH0dZMMcYJsuKybc/E0bZ/Sg=; b=umefeAsrrb64xD
	hblu40u5/24Llp+M10y8Do4a+c2IZec5Bf8UJmBMwbAymxYOyE71riokkJ0aU3tcrYz9L6R4SgxLJ
	D+254gNGk4mY+FWD2LSrAbblRBHcR0UAGZfs2xaPFekNO1mn/xDle3wTfSMeb6t3+wbEIMLtKtB+q
	/LO937/S6jmDCIkqgzlGjzDzFQKBqTBMprsBW7jegiuue1wUk3V/A4S3SYPH5uTmyfajdJ3YXcZwV
	Rey16J94tLug0wtBN8hp2pRhNMbFgUg/+hDNJCc2acjIpPQceA4Njs97JJZvybLi/ITWWY8vJLjab
	5BUfsySwJXr/qPM3tpIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgR3W-008Vh3-34;
	Sun, 26 Mar 2023 14:09:10 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgR39-008VXG-0M;
	Sun, 26 Mar 2023 14:08:48 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 31so5166223qvc.1;
        Sun, 26 Mar 2023 07:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679839726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZ3M3RaLFnNGnHTnAZjnH0dZMMcYJsuKybc/E0bZ/Sg=;
        b=PeCR9X86QsaVx20aY4cZ/N/U/BGXc9v0DseOfWum4DxYo6HDHO24fXFQLN385sn7Ak
         ZnG+jG5QCzkpJ5OEPA4GGNujEszVt6QCOLJqDleCWpkO2MvcSaSYN9J7THCkRyhj7dy9
         P7Su8HM8g/fddSiIMePJNUY8gHW02b2wpKHcIcEb+FKDaXzhdb0AdbacaM/cIeruVxsm
         CZu38ZsgmVurt3yKyYDFLeRrUh8iHltb17BOTd27+2wzzJfAgtws7/vAybMOAgcnFh4Z
         bVXqgEIdaM2bEl5swVmeZPpepIvamUtvQXclBqIfn2V7fJmLVvHsibGC3GOAiXlzSqE0
         aAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679839726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZ3M3RaLFnNGnHTnAZjnH0dZMMcYJsuKybc/E0bZ/Sg=;
        b=ZT2rCwmYwcGvInKaZ8L/iouW6ETer5NvMSODSvzMrjty0ByOj7mQOkWmqKq5l8gMgb
         XxYyBq/G/1B3Fm5Rm1WPf5uGmNlkt9N/g2Et+NafXm+GogUBww7oJCQzH5c7kLKZM9Nb
         7h0Dl971t99RpVtYbFnwTaKtoVAAW9LaksP8rgDIoBE4I8TRsXKhfQzoOkjTVz7yjGGz
         RSjLgW/Zo5aHLuquiK8cwvv/v7h3gYd91hycr1ekwHXwK5zyoOPQscY5kdw9OdxtXiik
         XhqHmXB4fXJL4zNPMi8eyBggelI8x3BADWz4urOLlLUH/aUiR6+Owe/Uwwz5KmlATp0A
         5grA==
X-Gm-Message-State: AAQBX9dy+/pwA7enW1Ze44Mji895QqUMTaDazBNsfU2L0muASyyLZoRK
	xPbqgscT9h92EPbqrbUVOSg=
X-Google-Smtp-Source: AKy350bmLDXXIZMwWIHi9YWMFSuPyoUC5Stl7CpvUKVBBwX6hYz/oXixnBj/Ni0i+8VU4sVOQf3erQ==
X-Received: by 2002:a05:6214:f67:b0:5aa:d98a:8ace with SMTP id iy7-20020a0562140f6700b005aad98a8acemr17506531qvb.19.1679839725854;
        Sun, 26 Mar 2023 07:08:45 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id j5-20020a0ce6a5000000b005dd8b93458esm2212220qvn.38.2023.03.26.07.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 07:08:45 -0700 (PDT)
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
Subject: [PATCH net 4/7] net: dsa: mt7530: set both CPU port interfaces to PHY_INTERFACE_MODE_NA
Date: Sun, 26 Mar 2023 17:08:15 +0300
Message-Id: <20230326140818.246575-5-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230326140818.246575-1-arinc.unal@arinc9.com>
References: <20230326140818.246575-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_070847_146916_3BDB84EC 
X-CRM114-Status: GOOD (  11.96  )
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

Set interfaces of both CPU ports to PHY_INTERFACE_MODE_NA. Either phylink
or mt7530_setup_port5() on mt7530_setup() will handle the rest.

This is already being done for port 6, do it for port 5 as well.

Fixes: 38f790a80560 ("net: dsa: mt7530: Add support for port 5")
Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 6d33c1050458..3deebdcfeedf 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2203,14 +2203,18 @@ mt7530_setup(struct dsa_switch *ds)
 		mt7530_rmw(priv, MT7530_TRGMII_RD(i),
 			   RD_TAP_MASK, RD_TAP(16));
 
+	/* Let phylink decide the interface later. If port 5 is used for phy
+	 * muxing, its interface will be handled without involving phylink.
+	 */
+	priv->p5_interface = PHY_INTERFACE_MODE_NA;
+	priv->p6_interface = PHY_INTERFACE_MODE_NA;
+
 	/* Enable port 6 */
 	val = mt7530_read(priv, MT7530_MHWTRAP);
 	val &= ~MHWTRAP_P6_DIS & ~MHWTRAP_PHY_ACCESS;
 	val |= MHWTRAP_MANUAL;
 	mt7530_write(priv, MT7530_MHWTRAP, val);
 
-	priv->p6_interface = PHY_INTERFACE_MODE_NA;
-
 	/* Enable and reset MIB counters */
 	mt7530_mib_reset(ds);
 
-- 
2.37.2


