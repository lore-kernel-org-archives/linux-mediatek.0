Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E98C77B73
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 12:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LQcn9eyXcNEwugtqgEyoEot5MQa0J15Im9Ea15IZnyQ=; b=nKVfkebMpl/UFs
	bmVOlJ3rEKL3phxfKQAPpklhT/K0v9BNVKFyBTH9GzkonIfJEzWcVq7445j7pgtqGHElt0bSdbqF5
	nm+R8V7cF3vs9C4K+WbQDf1bUz55AWsVYptlbdrW6rVhQi+YHmZXcRsADeQU9RXDdW7THjj8QAGCo
	kJXrYQ9GoWbdiLTKmudWWF64cuOK5aca448GtYOifDrigCmd9cKapaKSQVOx1xHJBCsnnbV3GdT1q
	lPgCqe5Uzp3gG8K2iIEmdG41io0i4O001dep8rVH4/KNoQAcTWSDcTeyeKJtZpqO9fXm0FBfnhAUl
	WOm92MHCXwPcDJJCq9xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q14Se-006PFC-0x;
	Mon, 22 May 2023 12:16:24 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q14SI-006P0J-0O;
	Mon, 22 May 2023 12:16:03 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-969f90d71d4so899872166b.3;
        Mon, 22 May 2023 05:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684757761; x=1687349761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQcn9eyXcNEwugtqgEyoEot5MQa0J15Im9Ea15IZnyQ=;
        b=iGd4d/eNlJZWp2oXmaFPGGvB5V+LnVfT+TDU23AHK6BJWyfqj4MIXVhPvxvSSmYdiD
         hFkMako8wOCbJ6MGfmKCdq0sVmPEOIYyWpfAMNHTvoed7ZnqfPxJDHIOU9jkK46Rulpu
         JB+wLkKYP+OI669v6S3A5Wx1Lcn7P9Zf3XT8UrEMoNIs7nPNGjYdZOty+n8qYW1giRXG
         pF2lrrZ42uixJ/c5QcjIZ3LXVNb1NDFlNJ9ZgVPNkmg8ZsjQuBQo0jLgR4dWiFk02WwE
         nzJzvP5IGGEcfh/KhCI2C4ZUpLoku20jDywnG4bjkM0/QO/T0sGAZqmEtWEO/HkE3m0v
         CdNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684757761; x=1687349761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQcn9eyXcNEwugtqgEyoEot5MQa0J15Im9Ea15IZnyQ=;
        b=lKHtXMpMWvVuTjI2u0h/dGMkSMDvo3PnV+darDQZ3lbPyayQqVASYPKcAPH3dz82Bs
         Ui/AJSr92eY0qCjTDkkKONqPXKyq3Z3bDzS7gzJnMQrdi0nUXQ4AD+WoZrlcWMtEhokm
         NM4Gkdzw+E1kEBM8uJf/EDQmoOZ2KWkxgsrXey6YafLYe8Hl4qs9dl0fmuw2WFj1Ebs6
         t2cN9AXGGmi4/nToDD5deBi+WiqzIuZFFa/3sZkpAV2QcWJ4O9zHSBhiVPustVkFXMHn
         IqrjUxs1VMa9KzbuhGJpkj3U+2fN4/aI8n/LAw1Ya0Vg4nS7yLaxokbm/TShNyZd0zW6
         Pomw==
X-Gm-Message-State: AC+VfDwt6kXrOPXAfFgb7YQP/XIoN+VRl606TX4/AQHIRVq7ShOIzb4v
	svYLOhkeRz5wBIRO1FHCz7A=
X-Google-Smtp-Source: ACHHUZ5P+tKIaefrm8CRNcI/l3sCxAnxzWr5pEupyw+ftNKshFpNzvCL9rsXwjaSvX7GdKaUmeoQKw==
X-Received: by 2002:a17:907:704:b0:967:769e:a098 with SMTP id xb4-20020a170907070400b00967769ea098mr8290807ejb.15.1684757760705;
        Mon, 22 May 2023 05:16:00 -0700 (PDT)
Received: from arinc9-PC.. ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id y26-20020a17090614da00b009659fed3612sm2999950ejc.24.2023.05.22.05.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 05:16:00 -0700 (PDT)
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
Subject: [PATCH net-next 05/30] net: dsa: mt7530: read XTAL value from correct register
Date: Mon, 22 May 2023 15:15:07 +0300
Message-Id: <20230522121532.86610-6-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522121532.86610-1-arinc.unal@arinc9.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_051602_162405_985BC8DA 
X-CRM114-Status: GOOD (  11.69  )
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

On commit 7ef6f6f8d237 ("net: dsa: mt7530: Add MT7621 TRGMII mode support")
macros for reading the crystal frequency were added under the MT7530_HWTRAP
register. However, the value given to the xtal variable on
mt7530_pad_clk_setup() is read from the MT7530_MHWTRAP register instead.

Although the document MT7621 Giga Switch Programming Guide v0.3 states that
the value can be read from both registers, use the register where the
macros were defined under.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index b28d66a7c0b2..1a842d6fbc27 100644
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
2.39.2


