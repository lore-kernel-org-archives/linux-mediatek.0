Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDFBC7618D
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Apr 2023 10:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R+hM+tHbZ+If23R2mU7acrR6jDzcA+O5nuDMi4zO4as=; b=MZu8pcifP5CE3Kv0J+4n7RKDb6
	lJft3VB1/huG3GqPCuFKujOkDmHlwpYwzoCMrNKTReW3m3oGqIGGLsKafzwWM4iK4GV7Qctf7H8ql
	AJuWRKUZugY554Vc90TMfieHf3Ugrl2cH5ZD3IKVmQx6l4lEDvaSP9nZdoHY0h6GjDuRFTyB2ydkx
	3iUjvS5Yw7zqsizvE5Uv/K5lYVec1yhsNYAm/qBg7aMxhrrEJHK7OiwIlWPprXXH+aF0R554c2N0J
	wwRBJw7UwE9HfT8CFh83ePxqj+6thDiBNmfp1TeIKXtXm/PrzFYilHISBcQRCl3cXNx1g4qLc8jOi
	AKcNYLrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkMUM-006xpS-2B;
	Thu, 06 Apr 2023 10:05:06 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkMUF-006xnz-38;
	Thu, 06 Apr 2023 10:05:01 +0000
Received: by mail-wm1-x32c.google.com with SMTP id n9-20020a05600c4f8900b003f05f617f3cso4302326wmq.2;
        Thu, 06 Apr 2023 03:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680775494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R+hM+tHbZ+If23R2mU7acrR6jDzcA+O5nuDMi4zO4as=;
        b=q3jLRL06yCZXCxmeAix65vVky2IHzonw+BRHtCwQzoVkoxpeV4EB6KarHxMUvMca3M
         iyqQ4SWZH4TJIs6jzmoSMDUcvCVXoK3TlGLOFntwP8aHnJfuyuhLildwO6LK6FhGHIhh
         NLEn+X72WwvFXbrPifwoog3Y+LjoVoGWQguMsGSpGpIAJGEmERTLT2zhknS8LacCG7TI
         s3A+MPWuchAfqTBBkU7Yg1nBPVQUbqgDprh3DfqpbWGLDOGlNnP7meA89dP+U5X/4i6m
         qSLyGmxowmbnWPLbLWzzHUR6pUAPPhVIb2c2YYezWj0FmpRlVTQhBClC7wW5HxffqXiF
         mbpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680775494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+hM+tHbZ+If23R2mU7acrR6jDzcA+O5nuDMi4zO4as=;
        b=tWhBp5UcjXJk1qkc5msL4d8vRpfTao+N4deO6PNd/Ea+wjO3lVYOxx0TJvzN43boLn
         KyyDnPYgt1gMGE5waMg6Xn0A8rbycQRy4us1pm8ug+nTZuhCJtTqLR0umyf+6mBLchQr
         x1rDTDR9L6DWisZUMANG/sXLpnV1MQ8sH0DfLVRrLlnIFAEQqwe7Sv/HpwIidbfG4qUh
         eZzkdEgmcrkAw1340MftLpHrrJNsRIcivo5x3odGK92TdpIe0K2DA/ASxqzkAMsVTY3U
         Lvrq7H4luyAXqlo0kH+Encufd/fWRV2sl/NJq4Xg8CX2DG8EPLK7SJnEu/Od0DZqHNs9
         F93g==
X-Gm-Message-State: AAQBX9e9UyzhN+2ri9G9sKQPAVc5SEvBGltx/AwGMIB4zWz5NPP7R5+l
	ns2KdG3arPqH9FEhAT86Zsc=
X-Google-Smtp-Source: AKy350ZVk2iGHOLHwn6dfuv7zfbt8FK/X9Xx8C/5BG6iVRJi95CMyi1tjC7ZPIIAGKvS8EoeXDG+/Q==
X-Received: by 2002:a05:600c:2216:b0:3e2:1dac:b071 with SMTP id z22-20020a05600c221600b003e21dacb071mr3872433wml.13.1680775494418;
        Thu, 06 Apr 2023 03:04:54 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id a13-20020adfe5cd000000b002cea8664304sm1293939wrn.91.2023.04.06.03.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 03:04:53 -0700 (PDT)
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
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [RFC PATCH net-next] net: dsa: mt7530: fix port specifications for MT7988
Date: Thu,  6 Apr 2023 13:04:45 +0300
Message-Id: <20230406100445.52915-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_030500_034533_398F0B39 
X-CRM114-Status: GOOD (  16.99  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

On the switch on the MT7988 SoC, there are only 4 PHYs. There's only port 6
as the CPU port, there's no port 5. Split the switch statement with a check
to enforce these for the switch on the MT7988 SoC. The internal phy-mode is
specific to MT7988 so put it for MT7988 only.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---

Daniel, this is based on the information you provided me about the switch.
I will add this to my current patch series if it looks good to you.

Arınç

---
 drivers/net/dsa/mt7530.c | 67 ++++++++++++++++++++++++++--------------
 1 file changed, 43 insertions(+), 24 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 6fbbdcb5987f..f167fa135ef1 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2548,7 +2548,7 @@ static void mt7988_mac_port_get_caps(struct dsa_switch *ds, int port,
 	phy_interface_zero(config->supported_interfaces);
 
 	switch (port) {
-	case 0 ... 4: /* Internal phy */
+	case 0 ... 3: /* Internal phy */
 		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
 			  config->supported_interfaces);
 		break;
@@ -2710,37 +2710,56 @@ mt753x_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 	struct mt7530_priv *priv = ds->priv;
 	u32 mcr_cur, mcr_new;
 
-	switch (port) {
-	case 0 ... 4: /* Internal phy */
-		if (state->interface != PHY_INTERFACE_MODE_GMII &&
-		    state->interface != PHY_INTERFACE_MODE_INTERNAL)
-			goto unsupported;
-		break;
-	case 5: /* Port 5, a CPU port. */
-		if (priv->p5_interface == state->interface)
+	if (priv->id == ID_MT7988) {
+		switch (port) {
+		case 0 ... 3: /* Internal phy */
+			if (state->interface != PHY_INTERFACE_MODE_INTERNAL)
+				goto unsupported;
 			break;
+		case 6: /* Port 6, a CPU port. */
+			if (priv->p6_interface == state->interface)
+				break;
 
-		if (mt753x_mac_config(ds, port, mode, state) < 0)
+			if (mt753x_mac_config(ds, port, mode, state) < 0)
+				goto unsupported;
+
+			priv->p6_interface = state->interface;
+			break;
+		default:
 			goto unsupported;
+		}
+	} else {
+		switch (port) {
+		case 0 ... 4: /* Internal phy */
+			if (state->interface != PHY_INTERFACE_MODE_GMII)
+				goto unsupported;
+			break;
+		case 5: /* Port 5, a CPU port. */
+			if (priv->p5_interface == state->interface)
+				break;
 
-		if (priv->p5_intf_sel == P5_INTF_SEL_GMAC5 ||
-		    priv->p5_intf_sel == P5_INTF_SEL_GMAC5_SGMII)
-			priv->p5_interface = state->interface;
-		break;
-	case 6: /* Port 6, a CPU port. */
-		if (priv->p6_interface == state->interface)
+			if (mt753x_mac_config(ds, port, mode, state) < 0)
+				goto unsupported;
+
+			if (priv->p5_intf_sel == P5_INTF_SEL_GMAC5 ||
+			priv->p5_intf_sel == P5_INTF_SEL_GMAC5_SGMII)
+				priv->p5_interface = state->interface;
 			break;
+		case 6: /* Port 6, a CPU port. */
+			if (priv->p6_interface == state->interface)
+				break;
 
-		if (mt753x_mac_config(ds, port, mode, state) < 0)
-			goto unsupported;
+			if (mt753x_mac_config(ds, port, mode, state) < 0)
+				goto unsupported;
 
-		priv->p6_interface = state->interface;
-		break;
-	default:
+			priv->p6_interface = state->interface;
+			break;
+		default:
 unsupported:
-		dev_err(ds->dev, "%s: unsupported %s port: %i\n",
-			__func__, phy_modes(state->interface), port);
-		return;
+			dev_err(ds->dev, "%s: unsupported %s port: %i\n",
+				__func__, phy_modes(state->interface), port);
+			return;
+		}
 	}
 
 	mcr_cur = mt7530_read(priv, MT7530_PMCR_P(port));
-- 
2.37.2


