Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F50C6FD18
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 08:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7kwxv5YjSB3QzEOGZ2oRt9roe6rXfZ17PcarFfIQGeU=; b=XAGt7r5eGAxd35
	Kv7pXKaCOSSd/Czidf88nRRORvHMmg91tlNAvZ8xee9865TN4dsrdBtmMegzgqE5lkbuR1+ISHS54
	ZOIKDIp+WEHd6CYc8p/NUCKqwKuQ8jp2I3FXKCxZsq7E2QEa4oTfH/FyQua9lCesC2uvEjCpILBUm
	XB6cKYURB8YLWLCL1Gx5NF3m6Y00c7ISFzA7KkWYH8QTJVKZ7/Bvn1Flz+6h2QcRmZ30T6I/jpNNy
	2SdCdc1EzKbaVSbMa77KJxsENJHTFqUM5DXEm9CKLIWiAfEnWDVSX5Igxyt0+MvUHeOTu76xxsuwg
	7YOWPeBiwDzySatriG0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prE4h-000VIf-0v;
	Tue, 25 Apr 2023 08:30:59 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prE49-000UpW-07;
	Tue, 25 Apr 2023 08:30:26 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-94ef8b88a5bso804725666b.2;
        Tue, 25 Apr 2023 01:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682411423; x=1685003423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7kwxv5YjSB3QzEOGZ2oRt9roe6rXfZ17PcarFfIQGeU=;
        b=JJcsEUpwNrmrwPV1ogH+dwji5UMjyghuQyIBJSBSKEqpqR4i7KqFBnSFFdzTW4eZ8c
         2fDyt73ztwhma4blJQ9jnGdUFSxbsiHlgwYh4yOaJ3UqKqISxanFpgs4kv3J71eyedRk
         R3yOnsnU/xgFAswncrZI4IIWICrXoYhrJEqJ9wmmwmexzzPebdfdmDz4ZMqALrL4GnlC
         5DFHcrt5ZCMJZsrFfEJXpHhomuOdKW/4TWKjo+Vk49HKNjn7BVecvr62wBxMzKbQLvS1
         RUYPtMsepfQXjvqZhOssU2piw8AO51XNd3ESlMfdDAG8VOlTnIEpfryA+LXjZrj8UeNp
         fFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682411423; x=1685003423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7kwxv5YjSB3QzEOGZ2oRt9roe6rXfZ17PcarFfIQGeU=;
        b=Mv/9hzlk2IofhY+Omg1NZPe7pJSC4xD09WNFRCBX7sSRyzltksO4I7Iv9IuBWUkfFT
         4MnEcWItFAhDCgX7ODgtuIp04tSRiRNpk15yQB5y5cUKjTxcmSLWa9jBmPt5bonEU8mi
         J5MGPPTHbeRKk878TIQJRDgdwHDZmWKoFmHNrjGBlJRXTvheMx7KeenlSODy6Sy9NZeu
         ynXSmBURiH4w8VSI9FtOOXKWk9paShIN2oefhSdJ+0taFuY7B5aexB6c1MyXZXP80pQu
         JwGJWRBPaeTVwtbbl5S8xCsiAoFo5Ng4bVf78dfijwjpPcg2BUggL7y+EEY1AdaSi9rr
         AVtQ==
X-Gm-Message-State: AAQBX9cvU734UVKFAn4gdGmJT26lpN6eXjHp5uiICSz9RpbHdPDOBlEb
	wlmRkBGBMjpmqAQYArZKaxg=
X-Google-Smtp-Source: AKy350aguKiMQful+GW7E2lZvbMUkudRtfHsFOYT4NSuwVd/7oKVLErpt+s63adqZWg/Wg+mPTfHPA==
X-Received: by 2002:a17:906:b088:b0:94e:98da:ef97 with SMTP id x8-20020a170906b08800b0094e98daef97mr11814688ejy.27.1682411423414;
        Tue, 25 Apr 2023 01:30:23 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id mc2-20020a170906eb4200b0094ca077c985sm6439028ejb.213.2023.04.25.01.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 01:30:22 -0700 (PDT)
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
Subject: [PATCH net-next 13/24] net: dsa: mt7530: move XTAL check to mt7530_setup()
Date: Tue, 25 Apr 2023 11:29:22 +0300
Message-Id: <20230425082933.84654-14-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230425082933.84654-1-arinc.unal@arinc9.com>
References: <20230425082933.84654-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_013025_097060_00A1AEF3 
X-CRM114-Status: GOOD (  14.28  )
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

The crystal frequency concerns the switch core. The frequency should be
checked when the switch is being set up so the driver can reject the
unsupported hardware earlier and without requiring port 6 to be used.

Move it to mt7530_setup().

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 2addd5e7fbe6..04a48829465c 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -408,13 +408,6 @@ mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 
 	xtal = mt7530_read(priv, MT7530_HWTRAP) & HWTRAP_XTAL_MASK;
 
-	if (xtal == HWTRAP_XTAL_20MHZ) {
-		dev_err(priv->dev,
-			"%s: MT7530 with a 20MHz XTAL is not supported!\n",
-			__func__);
-		return -EINVAL;
-	}
-
 	switch (interface) {
 	case PHY_INTERFACE_MODE_RGMII:
 		trgint = 0;
@@ -2136,7 +2129,7 @@ mt7530_setup(struct dsa_switch *ds)
 	struct mt7530_dummy_poll p;
 	phy_interface_t interface;
 	struct dsa_port *cpu_dp;
-	u32 id, val;
+	u32 id, val, xtal;
 	int ret, i;
 
 	/* The parent node of master netdev which holds the common system
@@ -2206,6 +2199,15 @@ mt7530_setup(struct dsa_switch *ds)
 		return -ENODEV;
 	}
 
+	xtal = mt7530_read(priv, MT7530_HWTRAP) & HWTRAP_XTAL_MASK;
+
+	if (xtal == HWTRAP_XTAL_20MHZ) {
+		dev_err(priv->dev,
+			"%s: MT7530 with a 20MHz XTAL is not supported!\n",
+			__func__);
+		return -EINVAL;
+	}
+
 	/* Reset the switch through internal reset */
 	mt7530_write(priv, MT7530_SYS_CTRL,
 		     SYS_CTRL_PHY_RST | SYS_CTRL_SW_RST |
-- 
2.37.2


