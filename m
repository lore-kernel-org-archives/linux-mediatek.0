Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED7EC77B6C
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 21:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L71GAIfC9eueAFpPEM3jN5dqLC94Zw3zCdbNg29s88s=; b=QQuDNhS4gFqfc/
	cLEpc7+LMI/Yc9firbwdvFcd8aIh/IWUqyBfmLMFiP7esRJ+uVr2mniH/PvfNXuRnTryqYdm2C4re
	anp+HWqf2Dt1YRQF3/Ggpxz8neiLysvnlxiqvtdiIV/6JWwq57/VjKa+SrZ2rQVnhtbGk2IANurAX
	5U7oP31D5t2SrijkA8+lB6spT2LpF6PzyoSxVzY0mZfgFyYINvuyBXfoYIppzJjykj9mri7Idbpn7
	sm8GvFAh19qV1y5ZPSHZc2dIRZYdTo15JG+LWoDRTkyuMVqT3cTpzeHiVdvlwOwSTJZ2xFYfFU088
	EMHRZchtnLgOLFksf2RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkAyq-005lCi-2y;
	Wed, 05 Apr 2023 21:47:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk9uy-005eHt-2Z;
	Wed, 05 Apr 2023 20:39:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=L71GAIfC9eueAFpPEM3jN5dqLC94Zw3zCdbNg29s88s=; b=LCh2RhLaZIjP0PVd3pp5Aj7sEY
	9QEfSV3czlznREl+1L0X++lPITBS4ajVXCLJUzLbrySErc5D/BGliY0QRVHCFyFyz2kfDR7MdMcdg
	qj3bd5xgkGoL0CDvReMV1VtOQQPKRx9Mb4xG4bDh3GAosf2ty5iZcc7TX5zqoVJvpL15ipM1gu63h
	1/WlCuR920//DXr7kUMeN2gOPWTlBCT3HWO2JV5YiCpvqdHXSIbhfuacxlsUTDjoYXTmEi/+P/3id
	aF8XjrEtLSNX/m5ThR1bR4L7TJUUc3AaBOLipdP/KVIuQWrcBAd+uFOvEH6cGL1Qf1i/PQ7DTXs4J
	Yf3kv7Fg==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk9uq-00A588-27;
	Wed, 05 Apr 2023 20:39:42 +0000
Received: by mail-wm1-x32a.google.com with SMTP id j18-20020a05600c1c1200b003ee5157346cso24465860wms.1;
        Wed, 05 Apr 2023 13:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680727172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L71GAIfC9eueAFpPEM3jN5dqLC94Zw3zCdbNg29s88s=;
        b=MiTmmxWpXe2fE/0oNn2g7hsWoWsYD9g6VdQBcZ51eEukbBygXXyawyTPJyOfz3Z6p0
         cP26KmucIcfZDP9eWNZ9t4k0cF8AUAK7UAY9OotSb13c1HaJt06z/q3qZQG3H7y8HLaZ
         bblYlI9ka+HOwqFjA9pVrrsTSZ+mydgTe2Sx0GM9vIc7WubqO42qrjM/EisAxYuNoQxO
         ulZq8U4qvEP4vJ9RYD6CeXD/5+JVKy/ZSTvRATHaZYCwxUHyv29Jp3xr9D3szlzLZN0U
         2c+L1zloAfqFXxjfTexsA/ojqOrhJj1rcTmrVEm8yWy7/UCp4/amn+U06U3fmp2bjGYn
         fMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680727172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L71GAIfC9eueAFpPEM3jN5dqLC94Zw3zCdbNg29s88s=;
        b=Yh16UYgAY+FGvylR3dINRa8kIv31BqKG9Y3ffcBrWv49GkVYNdWN51HD9RqA+cWL8G
         Gqb5MAAZYg0owpGXnjTSCzES2ZwHv+KlW2+34lilkQ8XzyJyKD3OEA7NhdqRonOUADJ3
         04wG3F5B1JmxQnAD7pHM9VB2n9a0c8eovIdQNP2Vpp3GCrIGY4amkCo+Wk8LM+zPl+O5
         aHGNIHB0QSmD/OqgS4WyoZDZgNmfHslSyA0n8Y6VRjMWsj79EZS+JQUpXoLWaxZwIfoe
         IHmqvEUfG6kFMHNDVVid57YT8Y9QTOLfpOdzSM0Gj29guoCAr0CWTQHSJODkUuKwqINz
         ZScw==
X-Gm-Message-State: AAQBX9dEr4pql2j3pZLEbzHhk9wuOTW1P6xmcMSaRQR6XnImtLkXXe/n
	efIVHhUefsvDvD+q5j1MTi4=
X-Google-Smtp-Source: AKy350ZfAZeQEKVf1n9tV8rwVhEY06YRX4VGzkFY8HUbcQ7WPJqd971FrD9WXiRCZ7cd2jeZ0sQzUg==
X-Received: by 2002:a05:600c:218d:b0:3eb:9822:f0 with SMTP id e13-20020a05600c218d00b003eb982200f0mr5728897wme.30.1680727172707;
        Wed, 05 Apr 2023 13:39:32 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id p19-20020a05600c469300b003eda46d6792sm3259867wmo.32.2023.04.05.13.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 13:39:32 -0700 (PDT)
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
Subject: [RFC PATCH net-next 12/12] net: dsa: mt7530: move lowering port 5 RGMII driving to mt7530_setup()
Date: Wed,  5 Apr 2023 23:38:59 +0300
Message-Id: <20230405203859.391267-13-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230405203859.391267-1-arinc.unal@arinc9.com>
References: <20230405203859.391267-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_213938_353536_CCB4CF55 
X-CRM114-Status: GOOD (  12.14  )
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

Move lowering Tx driving of rgmii on port 5 to right before lowering of Tx
driving of trgmii on port 6 on mt7530_setup().

This way, the switch should consume less power regardless of port 5 being
used.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---

Emphasise on the "should".

Arınç

---
 drivers/net/dsa/mt7530.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 384e601b2ecd..6fbbdcb5987f 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -956,10 +956,6 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
 		/* P5 RGMII TX Clock Control: delay x */
 		mt7530_write(priv, MT7530_P5RGMIITXCR,
 			     CSR_RGMII_TXC_CFG(0x10 + tx_delay));
-
-		/* reduce P5 RGMII Tx driving, 8mA */
-		mt7530_write(priv, MT7530_IO_DRV_CR,
-			     P5_IO_CLK_DRV(1) | P5_IO_DATA_DRV(1));
 	}
 
 	mt7530_write(priv, MT7530_MHWTRAP, val);
@@ -2227,6 +2223,10 @@ mt7530_setup(struct dsa_switch *ds)
 
 	mt7530_pll_setup(priv);
 
+	/* Lower P5 RGMII Tx driving, 8mA */
+	mt7530_write(priv, MT7530_IO_DRV_CR,
+			P5_IO_CLK_DRV(1) | P5_IO_DATA_DRV(1));
+
 	/* Lower Tx driving for TRGMII path */
 	for (i = 0; i < NUM_TRGMII_CTRL; i++)
 		mt7530_write(priv, MT7530_TRGMII_TD_ODT(i),
-- 
2.37.2


