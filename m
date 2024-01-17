Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F38C47258
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jan 2024 10:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TZlYkCBl1Y6CdrhayBhNxw2p07BMxLVRsxuvs4s82bo=; b=ExkVdBFhQinxI/M+UphsQHdTAb
	yngzkMYCNNgsVepjDBSuFG8FEMO5apDj6Tzmbrfx6/89TSvtUQXfypaGpqxXKOSDluj/07pAJY/+Z
	jjYIdv++qSTxoR6qjv/a4Qy8Tax9Y9CtkgnA2HoZs7dMPp6apNVkdhzRnWRN82krJYTkcChHD5WWW
	o32D3uvuRH1wiQuhdGTo88hAsuyAPuyhMSj54O8oLqzQqlRqZgRvd+zA1o8kYTI2YzVrsbbx6+L1B
	9CpevB0a7Q5tWSnxZX/qN1+bGki7BhO4vs+HtBmNhs2GEvqEftX+N6Mi32j5DmWiCSAtLfLoXPq6g
	CbGYF7Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ3Av-00FH7p-1q;
	Wed, 17 Jan 2024 10:29:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ3Ag-00FGxe-1c;
	Wed, 17 Jan 2024 10:29:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TZlYkCBl1Y6CdrhayBhNxw2p07BMxLVRsxuvs4s82bo=; b=Ef5UK9n/Qja6rFDuf1aKfzdpqK
	oeIS46lG8wAkR7HwWF5wzT46GTy8pYntkzvOcCM5YMpGhpZ9AKZCmv8S/mkSDIRLX5pqr6XieTPvX
	D1/MLdCn329tjFsGfDB+m2m5Op+lJR1rEfInmvDUyLqZFKtP/F0pC+o2ViZToLL6Z3JrUtk+xQNB1
	zJURe8Nh3PoOXmyFMTHF3oJlPZTYKyI8SXa1Me/ar3LehnwbNa8LMylrsiH8lAUVi1sZPUp14R792
	OyS9M3lqtxXYuPMju3lr4Com3jheXbjH+9Kvthmw3uymXRqoOeNwDBCM9djOBj4XMRIllmHWGVLxJ
	Fc2pto9g==;
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rQ3Ad-00000000OK4-1SzY;
	Wed, 17 Jan 2024 10:29:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E126D40008;
	Wed, 17 Jan 2024 10:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1705487358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TZlYkCBl1Y6CdrhayBhNxw2p07BMxLVRsxuvs4s82bo=;
	b=ef5N6e9QwFxk3EUuXBHTv99i4fDQfzfVUoA33JgLMIGamg7c6cDSk2inSFTfGUyl1gwiF1
	11EPF30H13+8ZkF6qaN5vmPsO9j/dUMUQ0QVzxvvRlC1U/iXc+oGyANi32WHNDl7cekCr2
	B5mQz6YFXqwo+oym/KfX4Q6xqgnxldvIXzSuum5SCjCPTcpA3Iwyoc1qR5+KOarVfnF0IE
	rw5E1LbYkGiQIIkijBsnFBQ5hSqxsQXzgnrX8hRmr0MzFMOhzGIb7nCjIw2AivihbsD5k1
	JiI9nZZBOp/O49sGbPc9RxXMEEjm+Y1R3mtfOOOnktG4KWq/oIKEf7+YNv/IqQ==
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Daniel Golle <daniel@makrotopia.org>,
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
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	mithat.guner@xeront.com,
	erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [RFC PATCH net-next 6/8] net: dsa: mt7530: get rid of mt753x_mac_config()
Date: Wed, 17 Jan 2024 13:28:36 +0300
Message-Id: <20240117102838.57445-7-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240117102838.57445-1-arinc.unal@arinc9.com>
References: <20240117102838.57445-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_102919_567443_8FD431BB 
X-CRM114-Status: GOOD (  10.61  )
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

There is no need for a separate function to call
priv->info->mac_port_config(). Call it from mt753x_phylink_mac_config()
instead and remove mt753x_mac_config().

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 76b304f8fb87..680e59732d94 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2617,16 +2617,6 @@ mt7531_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 	}
 }
 
-static void
-mt753x_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
-		  const struct phylink_link_state *state)
-{
-	struct mt7530_priv *priv = ds->priv;
-
-	if (priv->info->mac_port_config)
-		priv->info->mac_port_config(ds, port, mode, state->interface);
-}
-
 static struct phylink_pcs *
 mt753x_phylink_mac_select_pcs(struct dsa_switch *ds, int port,
 			      phy_interface_t interface)
@@ -2652,8 +2642,8 @@ mt753x_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 	struct mt7530_priv *priv = ds->priv;
 	u32 mcr_cur, mcr_new;
 
-	if (port == 5 || port == 6)
-		mt753x_mac_config(ds, port, mode, state);
+	if ((port == 5 || port == 6) && priv->info->mac_port_config)
+		priv->info->mac_port_config(ds, port, mode, state->interface);
 
 	mcr_cur = mt7530_read(priv, MT7530_PMCR_P(port));
 	mcr_new = mcr_cur;
-- 
2.40.1


