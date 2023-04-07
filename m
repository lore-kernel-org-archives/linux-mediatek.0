Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC16C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 13:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wk3K9bbT+tv5kBnVohJcLc2nqRP/uYdhv43DLYVwvrA=; b=oqyN/s0MxRiQej
	vSZn3Ckzn5vjGeCkO/KoP9vaoDl0P4FtuEyuhhLP1nV+acz3e4NL6nh/ZaQBKDbDDYfq4BADOV3Zm
	hsvuam0ol85zFF2ycZxaYccWrJLB3jgMVit3i/KhO6JspP7l08bRRtaCIC112AayXpTsIoFchDpIm
	wu21Ap7cFfNxSg5nOM/BMX9PeGK9WVX53ZQ2gPSTmIVJIOAFKcmouBZt0fdZd/rvb/5s1haHtoFxc
	K2GPUUC1T4R6DRRlkRQrm1UqyW2q8/DQKVkCJOZSqH3tgYKIb2bfUsB1L4mj3aF1KUgl3DNz4MX3g
	R1XyjpmHxBWFWVJvZnFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmRV-00AOGd-2j;
	Fri, 07 Apr 2023 13:47:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmR9-00ANws-2j;
	Fri, 07 Apr 2023 13:47:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Wk3K9bbT+tv5kBnVohJcLc2nqRP/uYdhv43DLYVwvrA=; b=juLNTOoAZo+bTKfhkgA0hSlGft
	OrWFGgfCQvx3O6WwatQ2TCsbThkPxdy4YXY/0vAMlJeA8gtJbIxe06zvC1p/tu1+ZSlwT3EefUr44
	U8EfbYayOTQjprOuYgggJovpD2K1+dIsx2dLgSLPDdgR8brGVIzWbu9ctpj3BT05Wf8fmcPejLUnu
	tycrh08CBTQC6sv51G4KOZh30HyD9NG9xiqRlXWDNBegY/4lIXhFzh/p7m9QGXlPocV2HmLCUdUWz
	I4y8qpIKLgbDzHFV9qPkCMY0jw7cJqX8beVEKrclfsqoCnKTyEFrl8CNcA/w/FGoGRxNmOkEu3IX4
	8WqGvNxw==;
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmR4-00B3du-1c;
	Fri, 07 Apr 2023 13:47:29 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-54184571389so796904017b3.4;
        Fri, 07 Apr 2023 06:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680875241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wk3K9bbT+tv5kBnVohJcLc2nqRP/uYdhv43DLYVwvrA=;
        b=fRjxo2IWvt0K0aWF+f+Tf9xJkNfm8WGeqv4Fe295l8jhZZax7oguW/1MS97hQV4xEj
         mnXLBdgAoEP0hELbN0xHJmI94v+bITujHpGafKIL1p0t8KjZrY8/f6HV3i1y39k8lsxL
         xhPD0Su2OTMk7ob8ZiAS88FmoadArFKiAyiz6rHs6R84tg4J/fqMD0E1iOyUgHL+z9Wr
         vjETfz0YBwcNSJG3cGLV19YNnMW2Ktpvsjbq5HS9dKphz+RKhqbNLEf3TOL4iYrNyOmh
         1wyHPDUUmH+Qe27vNZnnTCFa+O/bTkBIGWjYfldCL+MfHNyyl4MrYOvnOt0eqr1JHLOo
         RdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680875241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wk3K9bbT+tv5kBnVohJcLc2nqRP/uYdhv43DLYVwvrA=;
        b=q5NG83gT31SsD9PTBG3vnnpshBVCJef3FNeWOXnJq+Zj/AWkgsVS/Sqew6Cl/8qXx4
         K414cU3e76916zbiPMGVSbJC9SfN6i4IkxdMM8Q5Jd11fZSZHygpaS7/hFAXBO+zRkHj
         efJQFp8fv168/B/oHzPVLJk/Ypq9yGfXF8Ho/tcev5YqYJMN+Dnbie4k0d4IJYSDBAWx
         IbNNdUXgCcq4L9oW7DH8hwvVMLJ4uNJrB+cvkqWAstVqfomHHK4t1oRcuNXQoepkaq10
         Ub1MsNnxm+b+LqNdTjYBgetzqA+Od27QyoTC9rsqGJ2m3QUMNSkoMKIamo4/AbCdepyG
         Rwkw==
X-Gm-Message-State: AAQBX9d5IA2DePDTvhuH8zfbwuWtfXz+vzdMhjubeptbhdbOomHLakLL
	QDXHBbO+R9JvnlplzUdE8D4=
X-Google-Smtp-Source: AKy350Y+xClOt7UnfrOknFMaUzg6EYYLGiTjzWRlZX4ygI1vDO6kxkLttmAB/nx9RnSeTOvVeIvzog==
X-Received: by 2002:a0d:e682:0:b0:53c:d480:f510 with SMTP id p124-20020a0de682000000b0053cd480f510mr1915752ywe.0.1680875240763;
        Fri, 07 Apr 2023 06:47:20 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id 139-20020a810e91000000b00545a0818473sm1034317ywo.3.2023.04.07.06.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 06:47:20 -0700 (PDT)
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
Subject: [RFC PATCH v2 net-next 10/14] net: dsa: mt7530: switch to if/else statements on mt7530_setup_port6()
Date: Fri,  7 Apr 2023 16:46:22 +0300
Message-Id: <20230407134626.47928-11-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230407134626.47928-1-arinc.unal@arinc9.com>
References: <20230407134626.47928-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_144727_600429_6B770F17 
X-CRM114-Status: GOOD (  13.24  )
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

This code is from before this driver was converted to phylink API. Phylink
deals with the unsupported interface cases before mt7530_setup_port6() is
run. Therefore, the default case would never run. However, it must be
defined nonetheless to handle all the remaining enumeration values, the
phy-modes.

Switch to if/else statements which simplifies the code.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 70a673347cf9..fe496d865478 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -404,7 +404,7 @@ static int
 mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 {
 	struct mt7530_priv *priv = ds->priv;
-	u32 ncpo1, ssc_delta, trgint, xtal, val;
+	u32 ncpo1, ssc_delta, xtal, val;
 
 	val = mt7530_read(priv, MT7530_MHWTRAP);
 	val &= ~MHWTRAP_P6_DIS;
@@ -419,16 +419,18 @@ mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 		return -EINVAL;
 	}
 
-	switch (interface) {
-	case PHY_INTERFACE_MODE_RGMII:
-		trgint = 0;
-		break;
-	case PHY_INTERFACE_MODE_TRGMII:
-		trgint = 1;
+	if (interface == PHY_INTERFACE_MODE_RGMII) {
+		mt7530_rmw(priv, MT7530_P6ECR, P6_INTF_MODE_MASK,
+			   P6_INTF_MODE(0));
+	} else {
+		mt7530_rmw(priv, MT7530_P6ECR, P6_INTF_MODE_MASK,
+			   P6_INTF_MODE(1));
+
 		if (xtal == HWTRAP_XTAL_25MHZ)
 			ssc_delta = 0x57;
 		else
 			ssc_delta = 0x87;
+
 		if (priv->id == ID_MT7621) {
 			/* PLL frequency: 150MHz: 1.2GBit */
 			if (xtal == HWTRAP_XTAL_40MHZ)
@@ -441,17 +443,7 @@ mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 			if (xtal == HWTRAP_XTAL_25MHZ)
 				ncpo1 = 0x1400;
 		}
-		break;
-	default:
-		dev_err(priv->dev, "xMII interface %d not supported\n",
-			interface);
-		return -EINVAL;
-	}
-
-	mt7530_rmw(priv, MT7530_P6ECR, P6_INTF_MODE_MASK,
-		   P6_INTF_MODE(trgint));
 
-	if (trgint) {
 		/* Disable the MT7530 TRGMII clocks */
 		core_clear(priv, CORE_TRGMII_GSW_CLK_CG, REG_TRGMIICK_EN);
 
-- 
2.37.2


