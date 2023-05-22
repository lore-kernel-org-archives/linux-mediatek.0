Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA29EC7EE29
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 12:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2+eXnKIFQ1zN+DpEz9mLEIzxzccBJHHMIoobq7TiAKA=; b=eVYJ1eb6NzC2u4
	YuIRhGDpKAhzIrYpV5RIGpIpmNv/iNr7HHLXRKIG/zdVo9wPy1tDAc38/5wKHV/ukiPoVXOOZIG83
	/Pnj9MwNW16IUu9u9uGo8q9fSlljlyinmcbFFO6jPJYVOp2FIVUM8gWgNkQC/ux4uIH7yKo3Z4CFt
	bdeQSi0u9ACrKHAu7SMw8t5/0Lu6ooSkobAixma2Z+4RUp4Ix/2Nw9+XWX9RJCiAlj9n7TE0uLyi6
	gE7j/i6FsEHLplYvvlevA9Dxrpp55pTtDQtD/XIFfJVYLR25itfcvYoeJ7trAmNzm4srG+DpcGvtY
	F63ehIygv84Lfs/plh7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q14qe-006Wfy-18;
	Mon, 22 May 2023 12:41:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q14qb-006Wdk-1T;
	Mon, 22 May 2023 12:41:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2+eXnKIFQ1zN+DpEz9mLEIzxzccBJHHMIoobq7TiAKA=; b=W7oUDrV7sBZAfQZzqjDgSInoIT
	em1t6IsTTRMg6ruYhXhC6HIq/HEf7L12/yjsf+ihB11pqbnyZh5Tolre/gnrAYZbOIuKneOKHxq98
	z4ZPfh/KEaLUMm9VjMhlCr3Rfn7SqVEr9BJoGLjEY9yamYRZr97EomluR09rtOsJRIxhMP7mJ0N+q
	0TzJRplhNoRY0kiYPK7j3su4jmaLh3trTEJssjaHz2E0TYYcSXJ4ixPidkN+GZ6DbiziHgwtSs/0l
	yqXFn465KuH4CVq58S2hkxVcH0Cv9SHJH6W6gfqmxCoh2CRpIs15jaTuLJLr0RQxoeOnhNa+UXbPA
	tXIEIxyA==;
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q14Sf-0021ls-04;
	Mon, 22 May 2023 12:16:26 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-96f818c48fbso557031266b.0;
        Mon, 22 May 2023 05:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684757782; x=1687349782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+eXnKIFQ1zN+DpEz9mLEIzxzccBJHHMIoobq7TiAKA=;
        b=g2M5feJC+CnCKKXq4Wl51RLxMIWgD5pRAs1W7Qw84KVrsW06zGRUVeS2WCbvjgTdTg
         AXzNuqGyx6Kju4i8Ht8F5QEdVYqoq+rZXA2TMGOXLqgGTs1uaumXbsnQIi/IFzIdFwSr
         vNps/54AD4zty56kHO/bw3tYjUwVB7gA0r9XikpsPjHUEVyzgpkhyWcLt0Ju5qaCobru
         UWpQlEoQm5AWhkxcAUu+cyWqBNBxDy8AbrEoPix7tEpd4EEYSre7Slq2yzB5jFNcqQCq
         y4DQqvhU0NW565fHJ7ihCo+qapFbgU8Cto2w/dd/d66kD8yylqHSF0EPz+5wrlWdBnd5
         KqNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684757782; x=1687349782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+eXnKIFQ1zN+DpEz9mLEIzxzccBJHHMIoobq7TiAKA=;
        b=IOsI9OKzwJotZk5WEtuN3lhFjWdU8xsVwQFHrna/skevoLY1aKtASmo9PKRsevXAbt
         v4qfqANeECoWoAkz/I8aSqgqwSekeUe4+UT0+0Ibcw1ysmgU3ZcoFqRtMAihFAP8w6F8
         LvFOsq2pY9jVqfilLcZCxha2gJWbBe1ecd/iMyfZnMiQBvg6pc40CNALiy2ZgycSfu66
         Xe92PKEZGq/qOzDWU9tY2GtU84pi0uwWkzsVS0ytA3c4YnY7YtS2FO62o252U+Z+qfs/
         DR9XTvxEUoWJuT6ngYkvMSxOUDAx37FDZhpNw0kT8xViJ45NtHsnkdAojliXmdK3Chll
         oOCA==
X-Gm-Message-State: AC+VfDzvWArywYkI2HTVAXzu4mBIiylGQ078x4t7GEbSh0DCAbIWFhTq
	a2souDOX3h0UA084yZga8yo=
X-Google-Smtp-Source: ACHHUZ4PugStt8I0/0LOWumrxGAi6wD5Ynmitsd3hv1KPGS/xHlV1TbhNrWv3RHYL/0jNbbeP19ATA==
X-Received: by 2002:a17:907:a07:b0:966:3c82:4a95 with SMTP id bb7-20020a1709070a0700b009663c824a95mr10266587ejc.19.1684757781976;
        Mon, 22 May 2023 05:16:21 -0700 (PDT)
Received: from arinc9-PC.. ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id y26-20020a17090614da00b009659fed3612sm2999950ejc.24.2023.05.22.05.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 05:16:21 -0700 (PDT)
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
Subject: [PATCH net-next 12/30] net: dsa: mt7530: move XTAL check to mt7530_setup()
Date: Mon, 22 May 2023 15:15:14 +0300
Message-Id: <20230522121532.86610-13-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522121532.86610-1-arinc.unal@arinc9.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_131625_231064_17F48094 
X-CRM114-Status: GOOD (  13.42  )
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
index 049f7be0d790..fa48273269c4 100644
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
@@ -2133,7 +2126,7 @@ mt7530_setup(struct dsa_switch *ds)
 	struct mt7530_dummy_poll p;
 	phy_interface_t interface;
 	struct dsa_port *cpu_dp;
-	u32 id, val;
+	u32 id, val, xtal;
 	int ret, i;
 
 	/* The parent node of master netdev which holds the common system
@@ -2203,6 +2196,15 @@ mt7530_setup(struct dsa_switch *ds)
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
2.39.2


