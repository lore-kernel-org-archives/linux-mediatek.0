Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD94C7618E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 14:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iqk+YQP+i1PdHjajC4dyLWTaH2it3zPPQXlXdlRzGds=; b=Nj1pzQ+yLQtxiS
	gap/anNHdVj+60v5GEZvqbab535HvNlFPqgCoF1wTuJA5lucOlYwHTGJNRxCJBa/WlwPX/9fmJUDD
	bZP5LZXtzqJyaSH+W2ni9soMwShDYjgaELoOxQj7abEB+34Vtl/8w+W3JtO99Dn9gYq2ppQzlTw8c
	EZ8Y8IMQ/tQLc0BE6u5+uI0aDRxEEHar1VGdxyDx1V7PGUW8NF8AnTptQSX5b9vEIeJf4iA9x26UC
	qyu/0MZGuhW1vvHNmQvy78WE1LKQIEtHMOBjRTA0tJfEopHWs6mH62yLEG8dakmOpNO8cS9JYtC1z
	qiBfW78/jhzfU+BpAxcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppruj-00B8sL-3C;
	Fri, 21 Apr 2023 14:39:06 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pprtA-00B7RU-23;
	Fri, 21 Apr 2023 14:37:30 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-504eb1155d3so12779085a12.1;
        Fri, 21 Apr 2023 07:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682087848; x=1684679848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqk+YQP+i1PdHjajC4dyLWTaH2it3zPPQXlXdlRzGds=;
        b=cf0zqaREVOCi7KHT07q3yLerukZj1DdsamHxw3nAfGf21FvfVLMwaFHxjD2YoWIXgI
         drCjiWM9q8hPTIOp6pBsWcDaK+ikNLb8nOIDTI0LrEBkHUGePoE4jjq2G/ZJY4nG2At6
         GiS/p0NHBqabpE1dl14vNEzHRQ7K3rShpPZ7SqjkNqNYYGcgRFdctl+YBgEvha1KLeDB
         KE9P5pZ1Z9ktkTocVlxJX+5IgZvQD35YupLPh/asFLqJuHBHM95yTQKH5fbKpK2bgLAH
         IQBr1GfuK67lufwBpuT2FZeXAcqjch52zWBszntCOrp6Nts1CMenoOi9yX4ScYqpz13Y
         lfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682087848; x=1684679848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iqk+YQP+i1PdHjajC4dyLWTaH2it3zPPQXlXdlRzGds=;
        b=P1FgdfBPxnhM++EGMDglQK4KiErxWjh4eK6I/C320fJvXlOG1ijqvQH6dqAOr86V4g
         kbvHIom8WSVkrIX2Umdkj8ucjYMcx8ZKXKzYrCoUxsUmZFrJ/flGf0mD2vAgTQFrRV2K
         Y2zVEMm2Jk8F8jf3Kt40DWfxoLOEm08+FxapZV9wi3emMu0o9A6Bg3PfxaRFlpAf7obK
         xtQFNxnOlzl/oAPG73gZpf7iTgTs0iRWDk0gRuoksbqJhElrHVKFhCnP/zUDLeG3bgHe
         RYNChPnNEpMYipabi5SThIySE+6tkZ52Q3fBfv5D1J4g73CLKUa8SrZjoF4CfgqgdgPt
         gMdQ==
X-Gm-Message-State: AAQBX9ftMgRJ6qUPKzP9EEZ2qEFEd4yEBjm6xfH22CewDvNhykTsrtKv
	vr2cMUvBkjghva2+D9PLV3k=
X-Google-Smtp-Source: AKy350aPdNFYI49dGLs5/XT2/bnUBnFqKOWqWRnqhq9XX7GP1nm0/K86h6KfOywXTrmQtK7UoDHnWg==
X-Received: by 2002:a17:906:1387:b0:94a:6229:8fc1 with SMTP id f7-20020a170906138700b0094a62298fc1mr2596198ejc.31.1682087847872;
        Fri, 21 Apr 2023 07:37:27 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id q27-20020a170906361b00b0094e1026bc66sm2168244ejb.140.2023.04.21.07.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 07:37:27 -0700 (PDT)
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
Subject: [RFC PATCH net-next 15/22] net: dsa: mt7530: set TRGMII RD TAP if trgmii is being used
Date: Fri, 21 Apr 2023 17:36:41 +0300
Message-Id: <20230421143648.87889-16-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230421143648.87889-1-arinc.unal@arinc9.com>
References: <20230421143648.87889-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_073728_770891_8480FDAE 
X-CRM114-Status: GOOD (  16.26  )
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

This code sets the Read Data (RD) TAP value to 16 for all TRGMII control
registers.

The for loop iterates over all the TRGMII control registers, and
mt7530_rmw() function is used to perform a read-modify-write operation on
each register's RD_TAP field to set its value to 16.

This operation is used to tune the timing of the read data signal in
TRGMII to match the TX signal of the link partner.

Run this if trgmii is being used. Since this code doesn't lower the
driving, there's no apparent benefit to run this if trgmii is not being
used.

Add a comment to explain the code.

Thanks to 趙皎宏 (Landen Chao) for pointing out what the code does.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 610828b56eac..029d3129bb8b 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -404,7 +404,7 @@ static void
 mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 {
 	struct mt7530_priv *priv = ds->priv;
-	u32 ncpo1, ssc_delta, xtal, val;
+	u32 ncpo1, ssc_delta, i, xtal, val;
 
 	val = mt7530_read(priv, MT7530_MHWTRAP);
 	val &= ~MHWTRAP_P6_DIS;
@@ -457,6 +457,11 @@ mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 
 		/* Enable the MT7530 TRGMII clocks */
 		core_set(priv, CORE_TRGMII_GSW_CLK_CG, REG_TRGMIICK_EN);
+
+		/* Set the Read Data TAP value of the MT7530 TRGMII */
+		for (i = 0; i < NUM_TRGMII_CTRL; i++)
+			mt7530_rmw(priv, MT7530_TRGMII_RD(i),
+				   RD_TAP_MASK, RD_TAP(16));
 	}
 }
 
@@ -2214,10 +2219,6 @@ mt7530_setup(struct dsa_switch *ds)
 		mt7530_write(priv, MT7530_TRGMII_TD_ODT(i),
 			     TD_DM_DRVP(8) | TD_DM_DRVN(8));
 
-	for (i = 0; i < NUM_TRGMII_CTRL; i++)
-		mt7530_rmw(priv, MT7530_TRGMII_RD(i),
-			   RD_TAP_MASK, RD_TAP(16));
-
 	/* Enable PHY access and operate in manual mode */
 	val = mt7530_read(priv, MT7530_MHWTRAP);
 	val &= ~MHWTRAP_PHY_ACCESS;
-- 
2.37.2


