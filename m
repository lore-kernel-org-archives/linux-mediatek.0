Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED66C7EE2E
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 12:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E4hNEGPM/k2Wei/lMuV138s3+HJRM8F0X5AH8IxuRIA=; b=iBwEUKLBvI/34S
	I8huo3JKvt5jf00lGxJM/5Sq8xsUrbCQBPaXEiKsLW+Ubqr1PHFa9omL5m/HJpYt2rdIesSLcCU6g
	FpdNOp0xn/EMSIaBK4F+0wU+GChwLwJBW5XPhWOLvzqdS5XTZKICF2UZU/Vu6QcihdjFsm6DeBq17
	XAkwa/XqXtv2KYgYS0sEfibXwkRtT3ZMLPk8VVX/IMdXg9WIwGf6ZYKwSxbPlTN9SvOEg910YusBp
	vVhvt4Fm/p+jhVH421jBjlgTMIVDZSpkMCzgu2+6RttAdpvV0cD3Gt5aWnEqjoGA5NH4U53gBSwVB
	9jGVX7HzwKH8uvdaWsDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q14Td-006Q68-0y;
	Mon, 22 May 2023 12:17:25 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q14TD-006Pc5-0F;
	Mon, 22 May 2023 12:17:00 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-970028cfb6cso110240766b.1;
        Mon, 22 May 2023 05:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684757815; x=1687349815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4hNEGPM/k2Wei/lMuV138s3+HJRM8F0X5AH8IxuRIA=;
        b=fgTbTLbrzx4eo36no/L8MljlJBC1raKbuJH3jDHYd9gnY9AhIubXn/hHbnFm1TkYov
         rplpfCyGp1bgCgmoFg8GxDhr88mrhioacmZ2cH9/K59E6zaHJNIw6HVOXGkCnaMDmVHL
         IuKBK+g0SLZLZXW0tLFZ/Cjhbvq3/uGzlwd+drhLVd0mBTwzMLRFmyXPSkYNkoRANEo7
         Zr2zuRM1nrPhO1FZ10STqdJUhxFbt2TyLEDUf8uJJdeUqZCs1XEcm1oz1Q/ulHiUgIpN
         7jIDvc0F2RS7UanOrmUoIlX6kbkgozgyVfO9mCQ0+tf2XOEpf5jvQS4NZ2XWYIU1oWX+
         RNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684757815; x=1687349815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E4hNEGPM/k2Wei/lMuV138s3+HJRM8F0X5AH8IxuRIA=;
        b=KsJIav4dtsjh09XGnqCW4Y+WRIUU2iMTHFVlvakwcb3owHaoBahTmyMEwvqSh+pwLo
         wvMfgS6qSFdrr9W/aoPFTbjmRW7TU/7KTVTL7kE4RCZeQr4kFcrZY6Fkw2uyhrXDXYAO
         ltbKqmud0hPHJuSyqI2J52oJdRRsxR3K3HudP5r9jHm/aLNDUrK1M84udLReGCm6GGVI
         6pBAG5WKWrxxQnyHWgudUWYZbwGc1MYWTNpjNUYOpEl/rSDrP8yGYcXjQ8tf0PICTs2S
         aIJLydvwLoTjtKhcqT7/Xl/WxfqcIgAz0EcBrvrpIar/A2cREn5QTispROqu481m4JwZ
         NJLA==
X-Gm-Message-State: AC+VfDxrtajnKdWrIAokWwV3JghCU9eKrdHbCQo3yWIz4gbQQr4zRIsc
	V/FVyDOzKqgasJezaqoueuU=
X-Google-Smtp-Source: ACHHUZ5m37/bUe5mAu+tGniN6yeCVXzYQceZL78+LqffaXJuXJdXrKLQp107cXJA8y5v2VuUCLVyAQ==
X-Received: by 2002:a17:907:60d4:b0:94e:c8c:42ec with SMTP id hv20-20020a17090760d400b0094e0c8c42ecmr10735915ejc.20.1684757815127;
        Mon, 22 May 2023 05:16:55 -0700 (PDT)
Received: from arinc9-PC.. ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id y26-20020a17090614da00b009659fed3612sm2999950ejc.24.2023.05.22.05.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 05:16:54 -0700 (PDT)
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
Subject: [PATCH net-next 23/30] net: dsa: mt7530: run mt7530_pll_setup() only with 40 MHz XTAL
Date: Mon, 22 May 2023 15:15:25 +0300
Message-Id: <20230522121532.86610-24-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522121532.86610-1-arinc.unal@arinc9.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_051659_134360_BA79396B 
X-CRM114-Status: GOOD (  10.57  )
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

The code on mt7530_pll_setup() needs to be run only on the MT7530 switch
with a 40 MHz oscillator. Introduce a check to do this.

Link: https://github.com/BPI-SINOVOIP/BPI-R2-bsp/blob/4a5dd143f2172ec97a2872fa29c7c4cd520f45b5/linux-mt/drivers/net/ethernet/mediatek/gsw_mt7623.c#L1039
Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 19afcd914109..9a4d4413287a 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2197,7 +2197,8 @@ mt7530_setup(struct dsa_switch *ds)
 		     SYS_CTRL_PHY_RST | SYS_CTRL_SW_RST |
 		     SYS_CTRL_REG_RST);
 
-	mt7530_pll_setup(priv);
+	if (xtal == HWTRAP_XTAL_40MHZ)
+		mt7530_pll_setup(priv);
 
 	/* Lower P5 RGMII Tx driving, 8mA */
 	mt7530_write(priv, MT7530_IO_DRV_CR,
-- 
2.39.2


