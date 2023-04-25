Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E633C77B61
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 09:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tfx+BLJ2lT7W1hbyqlRkyETFUUJ2bPA0crwpD9qp128=; b=KXsyOkBlbJFH8t
	lhVahVmyzksStp0a51upNN7mPw2lhnDKIq2eA5eszYWR/zj9rCZ3adG0/cSp1N6P2xQ4NbfJ1jsLT
	MYdzxjRHbefXBOWaXHm7dCJgxUhL57mFkMOCZ4p+Lf2tDnnXc+0Wb6Z9X1WNOc/Du0D78W0F8/BFp
	x750085OXR2E8hJWOhNyB5R92WZ5pgApRdqEv8Uq45gOvAQKJ7+Oedq7IYqcqGYgPZ/R0D2uOyJvD
	VnI6v7do9ES6WFFX/ykSvZ/mEJE/krLOZnejR0xlWR5ltg9B00ajy2TTYYTrzXqIHZmaqlqBT7ck0
	NgC8wOXcKFl0iRcYds7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prF0E-000e03-2W;
	Tue, 25 Apr 2023 09:30:26 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prE3t-000Udy-1P;
	Tue, 25 Apr 2023 08:30:10 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9536df4b907so1010295566b.0;
        Tue, 25 Apr 2023 01:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682411407; x=1685003407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tfx+BLJ2lT7W1hbyqlRkyETFUUJ2bPA0crwpD9qp128=;
        b=lZ86hWU04mqxssyBsem/asz8Vblm4BlcY+EtZFE6dNEGktzls4r3kDlzKQwLR1TdGL
         yh2JVg8uFn2wmGxT97pc16iIJcFEjFkNIvZ53K9aYOXT4lXDB4tATbaNh0cL+keRKc9v
         lVKlxpYEkFeqr1dtSZa84/DzY6AjztgSKrpEqZh+hHTVRX6wAy3gkmHMBaQ2vZjCbU5h
         jnP8sqAQ0ek2XpIbBALycsChBgYaQjewRe5/j6VnK1INVv0xGTcgYF2l0jBgIe35SlTk
         6gy7iExOLnqjRIiqgEbfxMnlOrsKV8sKBhwtn+V1L+9ClSZv0GzJxYhqoT8MCK2mZU7P
         e/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682411407; x=1685003407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tfx+BLJ2lT7W1hbyqlRkyETFUUJ2bPA0crwpD9qp128=;
        b=eoc9iidFHItH0nS6Iztxo/cZAKrW0Df1mK74A3swVJGxvEJ+PE61FAZiU6dFMsnefa
         B7dz34eio1o9lcFFwrL2fdBPCBcbFKCeWaO8ccllzDD/OVaoXms91Ja2GjFasE7xxi3d
         JC9esnGJWu/ty33+gNrhsKyI40xhvhJO0RUk4wGGmV7vv2LV5cIOnxQ9QxIUJY9q7PBF
         iNSqEP0McW8vQBnBjDYW9qpQG3c2uqoqw94N2XBAjSAbVB5gcpjJgDwfDe7B40+F8CeE
         M8+uFB980Nyx+mJtT6iH8okTS/yAkyQ+O/+4Iro2FJYMxfd3+sOYmv07EIFSz7BOox1k
         8eKw==
X-Gm-Message-State: AAQBX9dAcoicQaj4CeMlqv4uDLJoB+VeSmGZ4FoIaPuyDUd6Cis/nHKF
	mHU2/AGm1HPbC12pltllq4A=
X-Google-Smtp-Source: AKy350ZD6hZxk3RZBq4dVJ0BB2vezChvZmKmMxTOeiV4iOmfOvMgxynKFkCZYPOAMRNP2pPpfHi9Rg==
X-Received: by 2002:a17:907:80ce:b0:959:5454:1db7 with SMTP id io14-20020a17090780ce00b0095954541db7mr5667977ejc.3.1682411406637;
        Tue, 25 Apr 2023 01:30:06 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id mc2-20020a170906eb4200b0094ca077c985sm6439028ejb.213.2023.04.25.01.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 01:30:06 -0700 (PDT)
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
Subject: [PATCH net-next 06/24] net: dsa: mt7530: read XTAL value from correct register
Date: Tue, 25 Apr 2023 11:29:15 +0300
Message-Id: <20230425082933.84654-7-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230425082933.84654-1-arinc.unal@arinc9.com>
References: <20230425082933.84654-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_013009_475061_CB02306E 
X-CRM114-Status: GOOD (  13.43  )
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

On commit 7ef6f6f8d237 ("net: dsa: mt7530: Add MT7621 TRGMII mode support")
bit mask macros were added under the MT7530_HWTRAP register to read the
crystal frequency. However, the value given to the xtal variable on
mt7530_pad_clk_setup() is read from the MT7530_MHWTRAP register instead.

It doesn't seem to matter as my testing on MCM and standalone MT7530 shows
the value is correctly read from both registers but change it anyway.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index d0eae8e8c41d..98ef5ba0b19b 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -406,7 +406,7 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
 	struct mt7530_priv *priv = ds->priv;
 	u32 ncpo1, ssc_delta, trgint, xtal;
 
-	xtal = mt7530_read(priv, MT7530_MHWTRAP) & HWTRAP_XTAL_MASK;
+	xtal = mt7530_read(priv, MT7530_HWTRAP) & HWTRAP_XTAL_MASK;
 
 	if (xtal == HWTRAP_XTAL_20MHZ) {
 		dev_err(priv->dev,
-- 
2.37.2


