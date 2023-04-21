Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D358C7618E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 14:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mjphz1SQ1OrOeSXiEFiIHbe85DtwLLcL9ymLDLdzxyQ=; b=T5/6aRh3Dvrj+e
	UYX4metXstGpvdAIhQbtPqz/VeP3x7OPLNbxhiIMhnug9lC9O3O7JeapP8g7KGXSnOUGWYo7QM82E
	KdDntNGKIoxqOzSAsJidy1negM17p6E9Gj6v/rxXIeVT0Y4jukGXoZIZd6v+b/2SJiJEGSXSg9fsh
	uCxDAMMlOG5L4WdZVzRtXSpd16HoEpeYuoKsu71O/RORdrv+pbNbsS+gjsUrnrYKkocHlppZaN9C7
	VojhGbksSzo/f0WlCMzRo2NRBQxM7pSRYr2GOKa5Y4skmVqsXfVEfxDRakPXayKCi7l3h/uxnfzRG
	NDCncsnnv6pBzkehIiKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppruY-00B8iH-2V;
	Fri, 21 Apr 2023 14:38:54 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pprt8-00B7ZH-0h;
	Fri, 21 Apr 2023 14:37:27 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-504ecbfddd5so2535009a12.0;
        Fri, 21 Apr 2023 07:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682087844; x=1684679844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mjphz1SQ1OrOeSXiEFiIHbe85DtwLLcL9ymLDLdzxyQ=;
        b=cnBzdhaf0YmeisJZ6iXXODyfaLPtrxG+H99ayoHqrmFef08H+RwHTPatggPRoIdvBG
         DQk4Yi2+zGHRCvJiEcPGc2oiZwcTUa8iqjUOAVZvHKqRCPLAU0aHQ7c6QUdiZ00NJp0B
         IPk34XNVA9+9Y5KiIvzh01nys8UkR7KXDkZqGpowv+DLAZPrNhSwICIJWFCT2zZHSP/E
         m1oz5h0XYOXTeRQgkMj1A0UfAcWje8uJGtBNtFqetJNy+9vpGHOTefudrid6DXtaIH0v
         VbVu4EkfrPQv3PC5tb/PMFcN7N3pG0N/Iji2jbLcMTwFvgozWDF2q4/JOjvOwabqKWnL
         EKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682087844; x=1684679844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mjphz1SQ1OrOeSXiEFiIHbe85DtwLLcL9ymLDLdzxyQ=;
        b=AWiRPcUI979YlaUAZ8+u2Pjf+Vud1Fd+6+5dSTwnmNAUeECwfPaWzUmPaCzyK8ow74
         x+YCYRBa897lIBR+lWDdXbcmzWtkIp6cbeB0Z9z+SXjgLntd6TkBNeY8MGeurEBwuUzu
         YY5kwt42ybPK1MihpsB6PWlAtWXFBIp1d4phSh30yNAlMPproiqB5lLiUrxyrb4kkRzl
         lUsf0XnqAdF15Uvs6MJ/tOpbYGblAlcnh6lq6ZK171tkz2XlBzFAhDNbzgnSONk7rrDX
         LhJo7NAkN0JkeOP/Ak19or3ln74512mkopWdOsX5Qg0XtWu5ruFjSSz9ZWRZgDJgc0ZY
         nvBA==
X-Gm-Message-State: AAQBX9fECekdxhEdEmTb0HRimWhzuLabPMSPFbWq588ZsmPntJWltabC
	CSPUdhvPSFsBsPOGKJaYMAs=
X-Google-Smtp-Source: AKy350avDHrE1AHP0UASNUQGVphBKj5SjdYshuXQsFJQXaQYtBX6uitIm0GFXha004CfnFV37GEqeA==
X-Received: by 2002:a17:906:bc43:b0:94d:cebe:691 with SMTP id s3-20020a170906bc4300b0094dcebe0691mr2481692ejv.69.1682087843438;
        Fri, 21 Apr 2023 07:37:23 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id q27-20020a170906361b00b0094e1026bc66sm2168244ejb.140.2023.04.21.07.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 07:37:23 -0700 (PDT)
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
Subject: [RFC PATCH net-next 13/22] net: dsa: mt7530: move enabling port 6 to mt7530_setup_port6()
Date: Fri, 21 Apr 2023 17:36:39 +0300
Message-Id: <20230421143648.87889-14-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230421143648.87889-1-arinc.unal@arinc9.com>
References: <20230421143648.87889-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_073726_276942_A74C9478 
X-CRM114-Status: GOOD (  11.82  )
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

Enable port 6 only when port 6 is being used. Update the comment on
mt7530_setup() with a better explanation.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index eaa36d41e8b9..8fe9b1e6932c 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -404,7 +404,11 @@ static int
 mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 {
 	struct mt7530_priv *priv = ds->priv;
-	u32 ncpo1, ssc_delta, trgint, xtal;
+	u32 ncpo1, ssc_delta, trgint, xtal, val;
+
+	val = mt7530_read(priv, MT7530_MHWTRAP);
+	val &= ~MHWTRAP_P6_DIS;
+	mt7530_write(priv, MT7530_MHWTRAP, val);
 
 	xtal = mt7530_read(priv, MT7530_HWTRAP) & HWTRAP_XTAL_MASK;
 
@@ -2224,9 +2228,9 @@ mt7530_setup(struct dsa_switch *ds)
 		mt7530_rmw(priv, MT7530_TRGMII_RD(i),
 			   RD_TAP_MASK, RD_TAP(16));
 
-	/* Enable port 6 */
+	/* Enable PHY access and operate in manual mode */
 	val = mt7530_read(priv, MT7530_MHWTRAP);
-	val &= ~MHWTRAP_P6_DIS & ~MHWTRAP_PHY_ACCESS;
+	val &= ~MHWTRAP_PHY_ACCESS;
 	val |= MHWTRAP_MANUAL;
 	mt7530_write(priv, MT7530_MHWTRAP, val);
 
-- 
2.37.2


