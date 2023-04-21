Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F302C7618E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 14:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p+dofZHOOW69JOLHI22sQ8OPoJMkGCG8x3AI17TiDqs=; b=3vlBBRNCJsgchc
	lVQjRNC45ptf82FW7CKZPe+XgonC5+sRyTvk2MBd7hEKvAX443HJGZxC7gFHE2aGu8RKTSkGC2+hJ
	PxWodvvPQzmz/MhSRpWmgiLzlajqIG7iVM4SCxNQhRtfxh3NwJ0FoXWD/7nauNlRRpHzmcAaTNxdr
	ov0rt6Mhnah1A8/TTA2aO3DoCA+q9cmaT/jrYQKPKa+/pXWQsCUdi+Ku/7E3qRKREIcQ4eJsVX+c5
	EjDWPOEcKhz27fvCa+EbT2sg1I7rbXvNCmZkRtLgZFgp3yX4DcqzfIQeYvumBs+alSOaPLHtaG3z8
	CnhulqUBkLGJLnE2V7+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppruI-00B8TA-0B;
	Fri, 21 Apr 2023 14:38:38 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pprt5-00B7XX-0u;
	Fri, 21 Apr 2023 14:37:26 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5066ce4f490so2550893a12.2;
        Fri, 21 Apr 2023 07:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682087841; x=1684679841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+dofZHOOW69JOLHI22sQ8OPoJMkGCG8x3AI17TiDqs=;
        b=fXw97UmiJ/MMCmvWZV6wGK4K+sByF72DQK538kfvhJ4Fdvmy6QXu1cPLN5YefNNSpG
         88YqFD0qkMpghVdRxjdcZBdim6DnGfZcA11nK+dOOgT6WEGv5nIVggWUPf8zEcpgN/Ev
         8AsRipc0PafM+bi/fm+Z/u42rj9tVNlVP5BxtJm6s4YBoRRfAyJPkfr9VVaEI4Yq1+ys
         nggpgDmcN3TgCFV1cajMPxaZ48lT5XE9aF8SBpfwotQhWJzWMF6yQv9qgaIi8FtuX92X
         DiBtjDD6jxEL8Ckn7/M2VdwAGahE8ujMxvb6+KUbb4zuuskoHRdanMBD4bCt6wsXIV75
         wVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682087841; x=1684679841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+dofZHOOW69JOLHI22sQ8OPoJMkGCG8x3AI17TiDqs=;
        b=E007oZB7rmkA3e5tAAagAeaF7zKcumCKZs7Tx/FkYLKnLSOoRpvqQHiIdfixMmmb24
         gGEWlHoDAOxfPOl1w7OQ3f1rmhIEVHC9lF6Y+At4cBfE6dt2HZisBxUD7j+c7ozy+We7
         dt6g9Y7yi6BP/Mk57kUXl/HWt5WyoLO81C57F/upYugD89yichr58NEI9O9fATxlfk8P
         SSfdrLhoO4dlj2b7fhVUpKEOyaTwAvbeYXOzPHHqsbyT3AQ8lAFGg4L15DOefXz2lYZk
         aONWBb9hoXpvUd8pZHvO2uqs0FjKc56arULWwdxFO7LE/HwVi3odRzZw4N90ihI+MFaA
         lqoA==
X-Gm-Message-State: AAQBX9cq19+md243E/gkdxSbMO+NxwfMwiAXauW9o4QhJa+ekw4172d3
	zc3xdd/RTHTet5++9h3BgvM=
X-Google-Smtp-Source: AKy350aULjZUKC1bGLSUxBB90hqtc9kUEcTXJTE84prab1d7nVL3w+d/kkEZm0sKgE9SE4JKFv0E5w==
X-Received: by 2002:a17:906:2c58:b0:953:5eb4:fe45 with SMTP id f24-20020a1709062c5800b009535eb4fe45mr2339306ejh.23.1682087841265;
        Fri, 21 Apr 2023 07:37:21 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id q27-20020a170906361b00b0094e1026bc66sm2168244ejb.140.2023.04.21.07.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 07:37:21 -0700 (PDT)
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
Subject: [RFC PATCH net-next 12/22] net: dsa: mt7530: move XTAL check to mt7530_setup()
Date: Fri, 21 Apr 2023 17:36:38 +0300
Message-Id: <20230421143648.87889-13-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230421143648.87889-1-arinc.unal@arinc9.com>
References: <20230421143648.87889-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_073723_337987_8EBF5450 
X-CRM114-Status: GOOD (  14.20  )
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
index a1627e20675d..eaa36d41e8b9 100644
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


