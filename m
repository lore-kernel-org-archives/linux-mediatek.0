Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1A7C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Mar 2023 14:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l2Yyxz9FOXIN+XxKXysP1ZnBuTmwMg6crObSsecZNr8=; b=pXEXFEJjBIsv1Z
	MLLCo+mP6+2sZjlNX+/18eULJhQlYRY4PnS8t6lmFtsG31swEuOY05WpmBs7Z3ulc4ldckfsuv0E6
	12fYZqVrtGtxbv6tjBlRlgPJFxABf7jAgnBVno6LpXn8nyNrgG/agDKMPwoUOawN3iR6AbrPn2zS3
	iQOmtBqC+etoqVJ2dFdL+5xbcEPp2jHHj7gq0HXUTkcIXGcwGKPla5HcPKuV+yrTedNWrOHaH7FoF
	xCMPV6BLejmjSf/Y0Np3+nka8xGRT0KalJIVN+YIFrOYqNsG8Re9XKhXZBzNrYArW55C3EmgJdJYa
	XIAByQY4tf9I3kzG2eqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgR3q-008VrI-1A;
	Sun, 26 Mar 2023 14:09:30 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgR3I-008VXG-0K;
	Sun, 26 Mar 2023 14:08:57 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 31so5166430qvc.1;
        Sun, 26 Mar 2023 07:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679839735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2Yyxz9FOXIN+XxKXysP1ZnBuTmwMg6crObSsecZNr8=;
        b=NI8IIylXLN/RgzXXWYF7gu7Y136mGEoIWcy2BmwQXde1fXTgnW85aakyi2zYxJvTyb
         Vba+bXe6E09H/83NDOXX2JN/fSi0a2BP1xX5+FkEygF3z4Fmn891UFnE98kezsNnENwt
         KcNY+pC2skaiTOzjjzBbKhwTUao1aGM5MCC9DhfdCfMRSFfFmKE3/gRFnBAQy6V6Epuf
         /oRDgs9UNYCJVwcMWBpwlwCL1PJt0T15cgWtkN1eYaRXiIjIxrSeowGNfQzedRtMQHYQ
         OqS3fhzbhKPaUtQg6NtU19Sl77qMGDA3K+4bdcITqZ2IFMXEkgbQKXL68JeBCWtYKf81
         oZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679839735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2Yyxz9FOXIN+XxKXysP1ZnBuTmwMg6crObSsecZNr8=;
        b=ErLqCVkrT8h1yso8nyhqIDYRwu9KkOsxVX9v6muYQL/pTDG149FwqPCFsati+yUDgt
         cKCtHdsFCGbReT2t4YeceiWtn2ZShm/wtAFvi2FzonfIAmN8S9TydGwmN7XrIzxPn7jV
         Hb/MBf/YCuI1LRsMfHRiDWn0MspdieJb/yQz7cR8uN1GElcLC0Mo7DCPCUmoSjDFvRg7
         eune/XkzwHZ8I5xfnk5jTt4Z+thMjJPhaq2alTPcou5IAOSZhoIcbQg0T5GHdPmvd3qx
         Wy7sJZm+HFcZ744Upd9QAS0fV/tNt1CkbMJkfcWaT9QQY2U8FF+p9yrLvilH/AMrm2/q
         UbFA==
X-Gm-Message-State: AAQBX9c4z6fo7y7HzHUoriikf4BWly/OQ5mSVvzjbbxoupa6E4fHMuH5
	EPGKi2iOxPu3BMqXnxHlHx0=
X-Google-Smtp-Source: AKy350YkM0qBbgWrY++La63ZQ5ay+0ryc/egnIbwxo+Lx1fiSX0CpeFm7wpYaKIwrXkCFUdAnjYgxw==
X-Received: by 2002:a05:6214:48e:b0:5c2:7d8d:ed0f with SMTP id pt14-20020a056214048e00b005c27d8ded0fmr16735897qvb.12.1679839735529;
        Sun, 26 Mar 2023 07:08:55 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id j5-20020a0ce6a5000000b005dd8b93458esm2212220qvn.38.2023.03.26.07.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 07:08:55 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	=?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
Subject: [PATCH net 6/7] net: dsa: mt7530: call port 6 setup from mt7530_mac_config()
Date: Sun, 26 Mar 2023 17:08:17 +0300
Message-Id: <20230326140818.246575-7-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230326140818.246575-1-arinc.unal@arinc9.com>
References: <20230326140818.246575-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_070856_139811_7C39CCA2 
X-CRM114-Status: GOOD (  15.81  )
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
Cc: Landen Chao <landen.chao@mediatek.com>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, Russell King <rmk+kernel@armlinux.org.uk>, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

mt7530_pad_clk_setup() is called if port 6 is enabled. It used to do more
things than setting up port 6. That part was moved to more appropriate
locations, mt7530_setup() and mt7530_pll_setup().

Now that all it does is set up port 6, rename it to mt7530_setup_port6(),
and move it to a more appropriate location, under mt7530_mac_config().

Leave an empty mt7530_pad_clk_setup() to satisfy the pad_setup function
pointer.

This is the call path for setting up the ports before:

mt753x_phylink_mac_config()
-> mt753x_mac_config()
   -> mt7530_mac_config()
      -> mt7530_setup_port5()
-> mt753x_pad_setup()
   -> mt7530_pad_clk_setup()

This is after:

mt753x_phylink_mac_config()
-> mt753x_mac_config()
   -> mt7530_mac_config()
      -> mt7530_setup_port5()
      -> mt7530_setup_port6()

Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 2397d63cec29..8d49803f7522 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -421,7 +421,7 @@ static void mt7530_pll_setup(struct mt7530_priv *priv)
 
 /* Setup port 6 interface mode and TRGMII TX circuit */
 static int
-mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
+mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 {
 	struct mt7530_priv *priv = ds->priv;
 	u32 ncpo1, ssc_delta, trgint, xtal;
@@ -493,6 +493,12 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
 	return 0;
 }
 
+static int
+mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
+{
+	return 0;
+}
+
 static bool mt7531_dual_sgmii_supported(struct mt7530_priv *priv)
 {
 	u32 val;
@@ -2523,12 +2529,15 @@ mt7530_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 		  phy_interface_t interface)
 {
 	struct mt7530_priv *priv = ds->priv;
+	int ret;
 
-	/* Only need to setup port5. */
-	if (port != 5)
-		return 0;
-
-	mt7530_setup_port5(priv->ds, interface);
+	if (port == 5) {
+		mt7530_setup_port5(priv->ds, interface);
+	} else if (port == 6) {
+		ret = mt7530_setup_port6(priv->ds, interface);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
-- 
2.37.2


