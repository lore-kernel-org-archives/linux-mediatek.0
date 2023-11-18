Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A90AC5ACB3
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Nov 2023 12:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WDzAot0tfjXO/G8Oe48YLOAZwGpYqezS2fuec9Z3ROY=; b=ay2RAq9xg6ERor
	bWwPAy05YhgWUpvFZi6Q4Xi+NujmHPLu5x854yFEccZ14SRH+O2LErvEoiMnkP6xWHKLg3q3GeyG3
	2Ui3ym0gwfeBjBv0YpGfLmZr5pE++cBB/KQOvTnhWTNv90DlGU3Zfse4tSTCLGlo0KI24hvUwVkQA
	5cuKa8X6Qjq2mCsvVO1XflSoITscCm74miW/yQRye4xXM1PILsT4/AxpYvkT6MlY8YXOqA+5CKtAw
	iBLwEPGyE/yh5eITDyeS+MZy068qmsLAyvSTsy+0LshlVJNh8Wl8MRrdp5F6B2XheHnhGOe1a5c5Z
	VfDuDsP7EBho68HfKFrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4KVy-008Suk-1K;
	Sat, 18 Nov 2023 12:33:34 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4KVo-008Sm0-07;
	Sat, 18 Nov 2023 12:33:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A070E0006;
	Sat, 18 Nov 2023 12:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1700310802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WDzAot0tfjXO/G8Oe48YLOAZwGpYqezS2fuec9Z3ROY=;
	b=SgCnTqu3rMvO095WDXiP6Qyq6t5ll1vQXHvwHq0pcbKhNiSkWo4t+vuuUMN0Z1LjE5t051
	x5DiHEfLPYs5XZRgH6NgPp48jtRXx6zGkn1PSliVx1YfSLj9qqehoJo80w7y5LUcTiPt0C
	cZnxT4FMOUAHEgSNiYgPkpC3+CRTCGQaC8F3df+shoC54Omv+0V9deZqyzDNPcTfMMYE8F
	EJAVS5bqk5IBVhf0hDIaVUnGPlt+uB1Vf9q3JVbGRd3XSsNN6Nchg57fcWkOn2WGlYLoFT
	QoxVX8a0Q/Kwk9O6JPXVjjhSZflC6BCfJgu+gKbHFLxRtN1+M+1vEin6MfM0Vw==
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
Subject: [PATCH net-next 06/15] net: dsa: mt7530: do not set priv->p5_interface on mt7530_setup_port5()
Date: Sat, 18 Nov 2023 15:31:56 +0300
Message-Id: <20231118123205.266819-7-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231118123205.266819-1-arinc.unal@arinc9.com>
References: <20231118123205.266819-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231118_043324_293957_CD115E96 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
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

Do not set priv->p5_interface on mt7530_setup_port5(). There isn't a case
where mt753x_phylink_mac_config() runs after mt7530_setup_port5() which
setting priv->p5_interface would prevent mt7530_setup_port5() from running
more than once.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 069b3dfca6fa..fc87ec817672 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -978,8 +978,6 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
 	dev_dbg(ds->dev, "Setup P5, HWTRAP=0x%x, intf_sel=%s, phy-mode=%s\n",
 		val, p5_intf_modes(priv->p5_intf_sel), phy_modes(interface));
 
-	priv->p5_interface = interface;
-
 unlock_exit:
 	mutex_unlock(&priv->reg_mutex);
 }
-- 
2.40.1


