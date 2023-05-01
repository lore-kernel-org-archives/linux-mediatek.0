Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D331BC77B73
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 May 2023 17:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7zn2qiz0PMcDlMBZ9iY+p8RStjdYbRZl/cnGOAd2Vqg=; b=4aXzIIP2xuVIv0
	NKNHCl4eevQLJ3EjL+hn0OwHpdZaHcDY9ZewKegX7Z0W1e5tgsXcX8L6TizWjb3zWU8nZGGSeO8dd
	+I+QE+3GuiiEaUGj4/jUz3Kkk3bzXWBJkn/6KyhooJomoy6cIlL+XyWewCebKqAlRnrmkQ73PapHu
	yYXj3mHcF0+9FyQZGU4UzRB9OlRL0YJJUTcExYFCc6Wk1W2qzn4A19lxhdECCvBZ7rszOgOAkH3/h
	0VDQmV7R9sizvhmwJrTWBa+JwND/8kvlzUN0FhhrC1YH0M8TdlepJUANmcgaTL8E9JpSh1Wh20nZD
	xNJjN0gOrWGKG+A8RrpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptXdI-00GQsy-2b;
	Mon, 01 May 2023 17:48:16 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptXdE-00GQqy-1Z;
	Mon, 01 May 2023 17:48:13 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-94f109b1808so557065266b.1;
        Mon, 01 May 2023 10:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682963290; x=1685555290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zn2qiz0PMcDlMBZ9iY+p8RStjdYbRZl/cnGOAd2Vqg=;
        b=E909MYKQQE2H2eABVhK2NB2EqRseF2MVkG26I7NnkE2LTNq3iiK3sZ81J8yuInxdGL
         eW3sEbuz5qp4p2RIgknB0EVVXKRnynjZiH0thBBrmil/LtpvY1/bIcpCofrxAHux7e80
         SKTbBF3OiYADM3Bb7nxbhGkOyIaP7WmZnHe8BAu8bwPfTLGaudGxhDcyPSl3ewstPzVA
         lyHqfgjtqYI2UdaRwTle2opR6/x81jeMs6AgrChQM3B2DBFxUL9p2Pu/seAWY/ZTVsww
         DKEjP4ZsIt5FDfuV+zUnwRLcA+6Xwkhd6k/ny3ZePUqP9Mbcx3xgTRFP1IciGEaoW1B5
         0PQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682963290; x=1685555290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7zn2qiz0PMcDlMBZ9iY+p8RStjdYbRZl/cnGOAd2Vqg=;
        b=Hsn6fHEdlGcLC8bxHJVqrNsq8xJZiEML2ZSH5Ij9t/Fdsn1nj+MsRaMidrw1APAHrE
         ZlW+nqwl/hXw93u7DejfDob4LzL6RZjpqI2OnchdMZq77b/O46k9NSx9CATF/wvRxT9J
         IitvUtfpzAnVyb+4fyh88FNbVRTxlRU80Q7i1OfurTS8MnuBNO/GD7XKeQda99A0ttog
         11NEnfVp5t0g6Xjejcp15y2fVVwLmJeY1kLvgkgOuruxxSIHExcUhbTbreDVU74yL6Jb
         DehnrCsTmpBbawNQ1JCzRC1DBIO0alNP4JSgFYt6Sj3ntumVENgxpMkNs2vzHKXWAfbm
         pE2w==
X-Gm-Message-State: AC+VfDwbVAEVYh/3o2q9rf0w4Zkb1OWT/ywGkbDE0ldlVnwoBhFcE21k
	T+ohCel5Vm75GylOsKJhlOc=
X-Google-Smtp-Source: ACHHUZ5DEcNfC1UtuRNa7f50gd0sYliwOZl7OqRIA3Ob1gb+R7LWKSfIJGKY1dall4G8t5nc+y4xrw==
X-Received: by 2002:a17:907:a4c:b0:94e:bc04:1e19 with SMTP id be12-20020a1709070a4c00b0094ebc041e19mr12339374ejc.71.1682963290375;
        Mon, 01 May 2023 10:48:10 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id se20-20020a170907a39400b0095ef737dbd7sm7745282ejc.93.2023.05.01.10.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 10:48:10 -0700 (PDT)
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
	=?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
Subject: [PATCH v2 net 2/2] net: dsa: mt7530: fix network connectivity with multiple CPU ports
Date: Mon,  1 May 2023 20:47:43 +0300
Message-Id: <20230501174743.95897-2-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501174743.95897-1-arinc.unal@arinc9.com>
References: <20230501174743.95897-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_104812_528626_1D769EFC 
X-CRM114-Status: GOOD (  18.45  )
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
Cc: erkin.bozoglu@xeront.com, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, mithat.guner@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

On mt753x_cpu_port_enable() there's code that enables flooding for the CPU
port only. Since mt753x_cpu_port_enable() runs twice when both CPU ports
are enabled, port 6 becomes the only port to forward the frames to. But
port 5 is the active port, so no frames received from the user ports will
be forwarded to port 5 which breaks network connectivity.

Every bit of the BC_FFP, UNM_FFP, and UNU_FFP bits represents a port. Fix
this issue by setting the bit that corresponds to the CPU port without
overwriting the other bits.

Clear the bits beforehand only for the MT7531 switch. According to the
documents MT7621 Giga Switch Programming Guide v0.3 and MT7531 Reference
Manual for Development Board v1.0, after reset, the BC_FFP, UNM_FFP, and
UNU_FFP bits are set to 1 for MT7531, 0 for MT7530.

The commit 5e5502e012b8 ("net: dsa: mt7530: fix roaming from DSA user
ports") silently changed the method to set the bits on the MT7530_MFC.
Instead of clearing the relevant bits before mt7530_cpu_port_enable()
which runs under a for loop, the commit started doing it on
mt7530_cpu_port_enable().

Back then, this didn't really matter as only a single CPU port could be
used since the CPU port number was hardcoded. The driver was later changed
with commit 1f9a6abecf53 ("net: dsa: mt7530: get cpu-port via dp->cpu_dp
instead of constant") to retrieve the CPU port via dp->cpu_dp. With that,
this silent change became an issue for when using multiple CPU ports.

Fixes: 5e5502e012b8 ("net: dsa: mt7530: fix roaming from DSA user ports")
Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---

v2: Add the fixes tag and information about the commit that caused this
issue.

---
 drivers/net/dsa/mt7530.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 7d9f9563dbda..9bc54e1348cb 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1002,9 +1002,9 @@ mt753x_cpu_port_enable(struct dsa_switch *ds, int port)
 	mt7530_write(priv, MT7530_PVC_P(port),
 		     PORT_SPEC_TAG);
 
-	/* Disable flooding by default */
-	mt7530_rmw(priv, MT7530_MFC, BC_FFP_MASK | UNM_FFP_MASK | UNU_FFP_MASK,
-		   BC_FFP(BIT(port)) | UNM_FFP(BIT(port)) | UNU_FFP(BIT(port)));
+	/* Enable flooding on the CPU port */
+	mt7530_set(priv, MT7530_MFC, BC_FFP(BIT(port)) | UNM_FFP(BIT(port)) |
+		   UNU_FFP(BIT(port)));
 
 	/* Set CPU port number */
 	if (priv->id == ID_MT7621)
@@ -2367,6 +2367,10 @@ mt7531_setup_common(struct dsa_switch *ds)
 	/* Enable and reset MIB counters */
 	mt7530_mib_reset(ds);
 
+	/* Disable flooding on all ports */
+	mt7530_clear(priv, MT7530_MFC, BC_FFP_MASK | UNM_FFP_MASK |
+		     UNU_FFP_MASK);
+
 	for (i = 0; i < MT7530_NUM_PORTS; i++) {
 		/* Disable forwarding by default on all ports */
 		mt7530_rmw(priv, MT7530_PCR_P(i), PCR_MATRIX_MASK,
-- 
2.39.2


