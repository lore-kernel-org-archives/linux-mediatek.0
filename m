Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B423C77B71
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 08:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JLm5jhMS6rFgBzI8z+1W06D+EQwsGdSNOt8/QtnXpBI=; b=QA+lGz4MEgckNJ
	QiFqNI26QGWEDRBHUUgEyzo48zO7hSuDOWvYixi0a0G3xDfIJXCXzgPTfxp6d4Cl6QvW2rUEtq/qG
	yf8+E/xRtHgkAojLYmwr2TnK8/EKxp2orreVoKJg1RPZDyJzn3ChQxy24vOZc2OkG87oIWZcKcr+a
	aFKvcd8J38tenXrP0s8GjwI7VRPovlns3QgGPRpa1q75NT5lcZc4qW/xZZrvrNcp5oqvb0qJ6HBmc
	swSVOOLRcF5lEByFpZsE1P5AkWWF+zyOSpJCEp/Zn9KkVsg31rlljbIoBr0HCySWiK11x96AxT14V
	e6qpMyYfAvEbHSjhnIMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prE5J-000Vmi-2L;
	Tue, 25 Apr 2023 08:31:37 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prE4O-000V2w-2D;
	Tue, 25 Apr 2023 08:30:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JLm5jhMS6rFgBzI8z+1W06D+EQwsGdSNOt8/QtnXpBI=; b=jQuFBXlS6iAq0O/Z0R/lOsP0hk
	neXo4bKyo2G8QU7OwqNqSoUjySXBq0kzXjqgXzgzLW5Rlvfb0uyWltwBQOB87XYegRJWC9oJ7c95G
	+VFlZ0ke7ApbHp7kG8EsY5BbgjOOR0xZztq1EKiYdQfSyQ5qPiwzOWvLRY5sXsOCox04q6umDJP0T
	YIsSyx8ytyRQ54gAmpC89+KGYz5l/OTaWewRLHVazVZuXhl/koz/7kMM5bUm5nxRYEq68LwdihvaA
	T7Q/6UEHcxxHGrvhJoAnSNwN71Ky4c1LLtbD53ee+ymnxoJMZuFISzSShV2UvfTP0UDDFF2BPrOdb
	L4IiycAQ==;
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prE4K-009Zwh-2V;
	Tue, 25 Apr 2023 08:30:39 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-94f32588c13so784887266b.2;
        Tue, 25 Apr 2023 01:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682411435; x=1685003435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JLm5jhMS6rFgBzI8z+1W06D+EQwsGdSNOt8/QtnXpBI=;
        b=Ap33L6THf74ai+r6w//IbTznSDtVocBHM7PTMhbUVfihCpZZoQIMHkxxJxGeEJcFC/
         m7DTVjUb7UVORIdFwiVaP2fX40jbGS+gPtiHiGOl/PJYrToSEyBp8AYAo8enkovg4GFT
         4UNqxOpTWde9ytaO7rCQgHe2y9ifeACQWjT3Bwk2AXYZkf0BHGACL98CiV57oeUR7jr0
         uJQO69lTIf9GkCBwWdtWCNNfVIZQkCQw8pFL2zFYnURSiNEGHW21iFFJlv2xR46grMhS
         YRwwT2rwFyD2euHDZhxdEyl3AQfWZIo0WFToBHaa1RGWxwnjIfqla7zrbTT0UglGusru
         GM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682411435; x=1685003435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JLm5jhMS6rFgBzI8z+1W06D+EQwsGdSNOt8/QtnXpBI=;
        b=TNBvaVB3v4dHAcKFnaSjLkw92NR9p1OJbvG4wqlTvSqRvb9v3Zqwf9K1ADG83ROzrw
         1lxcC1Hzl1Sd9nxjllS3kXs8pB76XL0siOZaM64AKvRUaF6ak9eWsNlHxaiF2205Dfwu
         UwtTpXI5QoqTIUiX32cxXNhBM4fUpP/HMW6RM6k0QBg2YdEJsB9kxVguseKT7blEy9od
         6Jnnhzsxb9elxjkp+eqCghIV+rYK8SBa8c6lhH4vK8stekiWuEZgL+1GqnogejyA9t2n
         8VcDEfk3zbvIvMwCWsepqcXmZXVzP77u5G/SIvAXSQTYEuLxinOvpnWOT0fqlxTWFETh
         6zNQ==
X-Gm-Message-State: AAQBX9c8yFJEsgtIapQyqzMzxaqF+6rEzXS/4C5qkA64z1HAmJXTVxQn
	bmfvz5E68kycCcG+5mIeen8=
X-Google-Smtp-Source: AKy350ZHnHWTezegV98s6VGWqeQ9P96T/8gc+hf2umUdZqmtltCd4D7zYoSKx0DLOxIbyURM78gaRQ==
X-Received: by 2002:a17:906:170e:b0:947:c221:eb38 with SMTP id c14-20020a170906170e00b00947c221eb38mr12120196eje.13.1682411434710;
        Tue, 25 Apr 2023 01:30:34 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id mc2-20020a170906eb4200b0094ca077c985sm6439028ejb.213.2023.04.25.01.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 01:30:34 -0700 (PDT)
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
Subject: [PATCH net-next 17/24] net: dsa: mt7530: move lowering port 5 RGMII driving to mt7530_setup()
Date: Tue, 25 Apr 2023 11:29:26 +0300
Message-Id: <20230425082933.84654-18-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230425082933.84654-1-arinc.unal@arinc9.com>
References: <20230425082933.84654-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_093036_964465_A53933B0 
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
Cc: netdev@vger.kernel.org, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
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
 drivers/net/dsa/mt7530.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 0108af681d50..468c50b3f43b 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -938,10 +938,6 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
 		/* P5 RGMII TX Clock Control: delay x */
 		mt7530_write(priv, MT7530_P5RGMIITXCR,
 			     CSR_RGMII_TXC_CFG(0x10 + tx_delay));
-
-		/* reduce P5 RGMII Tx driving, 8mA */
-		mt7530_write(priv, MT7530_IO_DRV_CR,
-			     P5_IO_CLK_DRV(1) | P5_IO_DATA_DRV(1));
 	}
 
 	mt7530_write(priv, MT7530_MHWTRAP, val);
@@ -2214,6 +2210,10 @@ mt7530_setup(struct dsa_switch *ds)
 
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


