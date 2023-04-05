Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56EF7C77B71
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 21:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ccZfgD4+ftjQv7yPb/kHCV5/7qZA3IEA73eZ7Pnga5c=; b=VBO2MKRHn6xxqy
	XDwUI018mf7qWFX4NYf7uN7RKaf2uXLBG6SrsUzy4VOL6N+wGgNoJt9R/pYr6ZZAImxxzQBTYRLIl
	nXGHRQ6YQqzZfMEsTEPPJ/YprTglbDlT4/7wKw0YxvI6f/BQX3QHXYsXpeGra8ch0aOUNKSy9Km/Z
	ZHbQCFHzNBwiewbaj+mCGGMJUYJI9OMV2Y09YVKKRIdJA639bW15f8P5yemGPwHZh6i6qSJFsfdrR
	0EqdJ6jVhB6s0gwqzc+fb4rQy7uzBMXdMPoqc03zZ8OPcBe61lGjdh+75YlpMtxXbN2Hr3Qv23Hl5
	uZ+nMmvqKSAiwDnbhPnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkAyi-005l5s-23;
	Wed, 05 Apr 2023 21:47:40 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk9ug-005dtm-0P;
	Wed, 05 Apr 2023 20:39:27 +0000
Received: by mail-wm1-x32d.google.com with SMTP id n19-20020a05600c501300b003f064936c3eso1904012wmr.0;
        Wed, 05 Apr 2023 13:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680727165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ccZfgD4+ftjQv7yPb/kHCV5/7qZA3IEA73eZ7Pnga5c=;
        b=bvFO76O+4mQqrUZx4Mm3FNB2nH+NrpS71Z37Z4lv9VtwxMlwNAI7Mg0VVTQ+c1pTbO
         mUn/HmOB2IkOqc7wPnn8l2GJeoBU0OgNv7IpBYJSF0ns3+Y6S7UEbyKFLRMIaWNInbs/
         vrGBNmjgSMWR86c3yc/75BrdQTUlvpHfNgEM0iXWPR3xO0uGAE2XMSC3xGhrPE1arilr
         RzBqpM8sNI6R/1kzAoSFofsFAS0+7EZzbfCw8EMXTBHi9kRVohxpS00rt/A/0SqISSwj
         bXCax3p+WrE/HBdKJPsdw9F7M2dteCEK5aVZCqvjdI/+H1Z34GCSTmnmpFse5fcSKdKB
         bfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680727165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ccZfgD4+ftjQv7yPb/kHCV5/7qZA3IEA73eZ7Pnga5c=;
        b=yoRqO8OfpakG6IOs0QAnRR+gLkGT45sNKvf+/ej41JZRZT1hHKAR1ORwV/HNM3KOA/
         oVRcseSCUrth/Zl+xkDRPJMkrNST+y6YpPR070162sMHj/AFgUN8c3hay7LMhHrBWLQj
         0w0C6F7el8xHDF41HqQMnX2VnOJkiQFMukaLshJ8V7/qyu7kwyXtpsGafKDrJ4xr3k6A
         bAwVv5qrWalC7fXg0Gb8oWy9Pfm0D7fjPwwJ9jrUgutrrrotmsWQPwFVEr43S+qcJ5wj
         UCOXH1IPd6JQgD/A6F4JmlMr6OgdIhuOVBFXWw9r3JcXwzs6Gyc408VGuNVqEMGsWVZr
         UTFQ==
X-Gm-Message-State: AAQBX9c4KRqnyergPN9veo6aL6fFLL1WBBYYpnxGVMVltWH9+6NBA9ZA
	XkZrkdFOlj2aJVMSulm1R/c=
X-Google-Smtp-Source: AKy350ZdEE8tqvVToRyuOt+VCUs/QF+vsXg1tVkXot5P9IJK1jRnKbUv9hfZyF/Ef04I09pLSAX/iA==
X-Received: by 2002:a7b:ca48:0:b0:3ee:ed5:6115 with SMTP id m8-20020a7bca48000000b003ee0ed56115mr5638813wml.19.1680727165506;
        Wed, 05 Apr 2023 13:39:25 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id p19-20020a05600c469300b003eda46d6792sm3259867wmo.32.2023.04.05.13.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 13:39:25 -0700 (PDT)
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
Subject: [RFC PATCH net-next 09/12] net: dsa: mt7530: move enabling port 6 to mt7530_setup_port6()
Date: Wed,  5 Apr 2023 23:38:56 +0300
Message-Id: <20230405203859.391267-10-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230405203859.391267-1-arinc.unal@arinc9.com>
References: <20230405203859.391267-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_133926_167485_78EDBC30 
X-CRM114-Status: GOOD (  17.55  )
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

Enable port 6 only when port 6 is being used. Read the HWTRAP_XTAL_MASK
value from val now that val is equal to the value of MT7530_MHWTRAP.

Update the comment on mt7530_setup() with a better explanation.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---

Do I need to protect the register from being accessed by processes while
this operation is being done? I don't see this on mt7530_setup() but it's
being done on mt7530_setup_port5().

There's an oddity here. The XTAL mask is defined on the MT7530_HWTRAP
register, but it's being read from MT7530_MHWTRAP instead which is at a
different address.

HWTRAP_XTAL_MASK and reading HWTRAP_XTAL_MASK from MT7530_MHWTRAP was both
added with:

https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit?id=7ef6f6f8d237fa6724108b57d9706cb5069688e4

I did this to test it:

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 46749aee3c49..7aa3b5828ac3 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -404,7 +404,7 @@ static int
 mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 {
 	struct mt7530_priv *priv = ds->priv;
-	u32 ncpo1, ssc_delta, trgint, xtal, val;
+	u32 ncpo1, ssc_delta, trgint, xtal, xtal2, val;
 
 	/* Enable port 6 */
 	val = mt7530_read(priv, MT7530_MHWTRAP);
@@ -413,6 +413,21 @@ mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 	mt7530_write(priv, MT7530_MHWTRAP, val);
 
 	xtal = val & HWTRAP_XTAL_MASK;
+	xtal2 = mt7530_read(priv, MT7530_HWTRAP) & HWTRAP_XTAL_MASK;
+
+	if (xtal == HWTRAP_XTAL_20MHZ)
+		dev_info(priv->dev, "xtal 20 Mhz\n");
+	if (xtal == HWTRAP_XTAL_25MHZ)
+		dev_info(priv->dev, "xtal 25 Mhz\n");
+	if (xtal == HWTRAP_XTAL_40MHZ)
+		dev_info(priv->dev, "xtal 40 Mhz\n");
+
+	if (xtal2 == HWTRAP_XTAL_20MHZ)
+		dev_info(priv->dev, "actual xtal 20 Mhz\n");
+	if (xtal2 == HWTRAP_XTAL_25MHZ)
+		dev_info(priv->dev, "actual xtal 25 Mhz\n");
+	if (xtal2 == HWTRAP_XTAL_40MHZ)
+		dev_info(priv->dev, "actual xtal 40 Mhz\n");
 
 	if (xtal == HWTRAP_XTAL_20MHZ) {
 		dev_err(priv->dev,

Both ended up reporting 40 Mhz so I'm not sure if this is a bug or intended
to be done this way.

Please advise.

Arınç

---
 drivers/net/dsa/mt7530.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 0a6d1c0872be..70a673347cf9 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -404,9 +404,13 @@ static int
 mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 {
 	struct mt7530_priv *priv = ds->priv;
-	u32 ncpo1, ssc_delta, trgint, xtal;
+	u32 ncpo1, ssc_delta, trgint, xtal, val;
 
-	xtal = mt7530_read(priv, MT7530_MHWTRAP) & HWTRAP_XTAL_MASK;
+	val = mt7530_read(priv, MT7530_MHWTRAP);
+	val &= ~MHWTRAP_P6_DIS;
+	mt7530_write(priv, MT7530_MHWTRAP, val);
+
+	xtal = val & HWTRAP_XTAL_MASK;
 
 	if (xtal == HWTRAP_XTAL_20MHZ) {
 		dev_err(priv->dev,
@@ -2235,9 +2239,9 @@ mt7530_setup(struct dsa_switch *ds)
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


