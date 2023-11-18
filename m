Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C780BC5AD4C
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Nov 2023 12:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rqy+O+1CtWhDF6XEEJjVh7boRblvOVGqqquNaYWwclU=; b=TWBJs+IPT6Kodr
	wX56bDlSisstfOBwvi9TWBqA6CqigutuCumhtOQppB/ny83naO4scaDhTGKYMHkTl/EzMPh3C5LeL
	JNUDPJaQT5MBtVXVMOtUEDO0fMmt/pcu5sjLGbWhDF5j3WC/N0d3psVsXbNVgHdkXmZ/4tlcJ4lCG
	40z+PZxyWVU5veSj4BByW4yD0XONlnV2URSJu6a51dXRA0GkNWzyUOY5aKGFNBpVsOVzblLk03/SR
	KP6N6D9+EsTBLyqvVZVvX4T3KBrehM9/DlCgJ1eD7DC7Dqmp0tabY3VCPagfHdsg/zkM9XkPXJppS
	GhaCsVG10lZyHhT7jMmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4KW1-008Sxt-1i;
	Sat, 18 Nov 2023 12:33:37 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4KVx-008Ssn-16;
	Sat, 18 Nov 2023 12:33:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6114DE0003;
	Sat, 18 Nov 2023 12:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1700310811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rqy+O+1CtWhDF6XEEJjVh7boRblvOVGqqquNaYWwclU=;
	b=APJ4DNziSv+LqSFMQ+knLWeq9oWPXxr+CeEbG6645Gr89Q5xIEYSenrd8+hhTr1oss7GL9
	Nb/D1bjvqzuVLgS+PQUYPesoAg59eR5/20FPdDGr04auLTpZXZ98x4bMqnJQ/bGPsNCor0
	YE+Y7ZAiT55Q/PPSF+WW6jQgk4z4VzH3qfTiLpUupMr9IdR9Lr/HLW/R2DtHslRQnb3g1h
	IsBRjEtDhb/c/lKLfxM7gT4xGPA/BRCsX/36y5ALbLmZBrQafL1W0kSwrgZaq59gO16ig2
	WI23zb/40B4Vp2E3j73aKcyNK6JtPKh53/t1B671+PfwXyYd54pAC3GjBpzqCA==
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
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
Subject: [PATCH net-next 08/15] net: dsa: mt7530: empty default case on mt7530_setup_port5()
Date: Sat, 18 Nov 2023 15:31:58 +0300
Message-Id: <20231118123205.266819-9-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231118123205.266819-1-arinc.unal@arinc9.com>
References: <20231118123205.266819-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231118_043333_533602_E880E73C 
X-CRM114-Status: GOOD (  10.80  )
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
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, erkin.bozoglu@xeront.com, mithat.guner@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There're two code paths for setting up port 5:

mt7530_setup()
-> mt7530_setup_port5()

mt753x_phylink_mac_config()
-> mt753x_mac_config()
   -> mt7530_mac_config()
      -> mt7530_setup_port5()

On the first code path, priv->p5_intf_sel is either set to
P5_INTF_SEL_PHY_P0 or P5_INTF_SEL_PHY_P4 when mt7530_setup_port5() is run.

On the second code path, priv->p5_intf_sel is set to P5_INTF_SEL_GMAC5 when
mt7530_setup_port5() is run.

Empty the default case which will never run but is needed nonetheless to
handle all the remaining enumeration values.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
 drivers/net/dsa/mt7530.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 1aab4c3f28b0..7de55cbf19a4 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -943,9 +943,7 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
 		val &= ~MHWTRAP_P5_DIS;
 		break;
 	default:
-		dev_err(ds->dev, "Unsupported p5_intf_sel %d\n",
-			priv->p5_intf_sel);
-		goto unlock_exit;
+		break;
 	}
 
 	/* Setup RGMII settings */
@@ -975,7 +973,6 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
 	dev_dbg(ds->dev, "Setup P5, HWTRAP=0x%x, intf_sel=%s, phy-mode=%s\n",
 		val, p5_intf_modes(priv->p5_intf_sel), phy_modes(interface));
 
-unlock_exit:
 	mutex_unlock(&priv->reg_mutex);
 }
 
-- 
2.40.1


