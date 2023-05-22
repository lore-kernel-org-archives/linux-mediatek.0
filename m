Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037DFC77B73
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 12:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BlebeOxwlkH4BlrTKG+sqIzxXmw3yFvwUw1o/jS7CVE=; b=Vr4L+NxomKDScD
	nPfHC0hORWnfbifcWx6MBJtm+5DxSF7iLY2YaapdmW/bKPYuBSLbMN5+INanCWdzDqqHMZdOkUVWM
	33hynpSnKiWnzNA5T56zbzzAZUoQmTHn/uPDMtMVIg0pgyaUDkBjiQUAO2Pg9wDM5O9Ic/UPsty6b
	z14ikJm+pY6CrGpF/AzKRu+xcE+DgFnQByDwDZzNZbHXIZPX7WT9Cgt6gIU6UAk4Ks6t+/UHSAblJ
	K6kDsdq4hS3Qen22+rQkdt78rTlt9q8pofGSDkDI55uIdjhF2yLhVRbXDL+nWe4kyblNB27Oe45mG
	xRynUb4budCh3LvWMA3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q14TI-006PjO-03;
	Mon, 22 May 2023 12:17:04 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q14Ss-006POM-1E;
	Mon, 22 May 2023 12:16:39 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-94a342f7c4cso1138218966b.0;
        Mon, 22 May 2023 05:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684757797; x=1687349797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BlebeOxwlkH4BlrTKG+sqIzxXmw3yFvwUw1o/jS7CVE=;
        b=CCUVOMg5NOmJkyahPTiVIE7b2Qz5Vgq/LKhxpQjav2u0Up8mDWWHYHm+0NgSpreCKY
         oioifpMAJWedSMwhbyN8jDY9pwgCJGnH7bd4Ygk8b7B9sVPqQtgkc2FCCPFUCBU57ary
         +4BzYdNeuugT1YdEpqBzFbrDvneFS0r+8lPnrweiTEtRITKC7oaLW6cyJ/kwD4d0HzgC
         bNmunD2PsgSccaF0Cl/J7t2B/8ePdkcZBMlRny2V4h2pjYpcAcI8C1aS3NKrJyG5TC9q
         oHAY46EJDa1qCxinrv+tmOSQv/ZrDGNbbRiVZERTjnAeTwNIDVNjrh2Adwcn4nkeV6Lw
         DZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684757797; x=1687349797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BlebeOxwlkH4BlrTKG+sqIzxXmw3yFvwUw1o/jS7CVE=;
        b=USJoHPC6oDc4AQkBwOwNsoDOTh+VsM3yhxWweucR/xlF4PrfA3zSJb7fpSVrJh/Typ
         HQ6tWoFfIzHeoTOKWSSw9MXzhy7ThSKOf1GEENfIvD3Bnliy95df18YaqRfTu5a17sgt
         5YT6JKP3jEpQ2ux9XJeLV0Q0Mp8Fa6vNhwVtTBM74sSWNE95UD1x26Gw1r223ccg+7ne
         uQ4I3cjjBosK8mAU0GigrhgjdhOxNrOQSsHOc9IusdZ+0ThSRhG/t3HHO9kGwKa+/vfZ
         r+9gZCHERROdwEyWid5L8Q1IZAoJkE8EdwY69xQTUxpTV7GcnMoQJHpQXJON6x2Yr33P
         VFWg==
X-Gm-Message-State: AC+VfDzexbx9/hfIqvewbldcJlDtppqycfLX2onXAf2MN5CsNLmbEP2X
	VOjxHpqBAMWPVgCiLuIB2t8=
X-Google-Smtp-Source: ACHHUZ5tp5FjFfcmtJpb7cAxVY5NVD2PSNFXgo6ZrgwEF5wMZEr1HL6G4oZxYD/wtw9KZaLVPfXp5g==
X-Received: by 2002:a17:907:7da7:b0:94e:fa56:a74f with SMTP id oz39-20020a1709077da700b0094efa56a74fmr10398638ejc.14.1684757796855;
        Mon, 22 May 2023 05:16:36 -0700 (PDT)
Received: from arinc9-PC.. ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id y26-20020a17090614da00b009659fed3612sm2999950ejc.24.2023.05.22.05.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 05:16:36 -0700 (PDT)
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
Subject: [PATCH net-next 17/30] net: dsa: mt7530: fix port capabilities for MT7988
Date: Mon, 22 May 2023 15:15:19 +0300
Message-Id: <20230522121532.86610-18-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522121532.86610-1-arinc.unal@arinc9.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_051638_422765_20C13CB0 
X-CRM114-Status: GOOD (  12.99  )
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

On the switch on the MT7988 SoC, there are only 4 PHYs. That's port 0 to 3.
Set the internal phy cases to '0 ... 3'.

There's no need to clear the config->supported_interfaces bitmap before
reporting the supported interfaces as all bits in the bitmap will already
be initialized to zero when the phylink_config structure is allocated.
There's no code that would change the bitmap beforehand. Remove it.

Fixes: 110c18bfed41 ("net: dsa: mt7530: introduce driver for MT7988 built-in switch")
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 514e82299537..f017cc028183 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2533,10 +2533,8 @@ static void mt7531_mac_port_get_caps(struct dsa_switch *ds, int port,
 static void mt7988_mac_port_get_caps(struct dsa_switch *ds, int port,
 				     struct phylink_config *config)
 {
-	phy_interface_zero(config->supported_interfaces);
-
 	switch (port) {
-	case 0 ... 4: /* Internal phy */
+	case 0 ... 3: /* Internal phy */
 		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
 			  config->supported_interfaces);
 		break;
-- 
2.39.2


