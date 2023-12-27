Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428FEC46CD4
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Dec 2023 04:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yq8FPR2LuMZyALJszWpCeHHckLAPDv/7+vYZcgFAtMY=; b=OeR8UoQdLVhOR4
	gl90p3UUAitQQEHXtUcCykEyIH70hwQUheyMVL6tZQH+0ol3H2/w+2HupoJv0GDOtMI4eS6SSAEqb
	bV3SUoZiP8AmgH6O3lt76WIDKlR/u+qPyDCLLyV5V9i89yaiYXqYhVyMLrAbn8a3rS41EO8XYqX7H
	L7XLNaq7hj6IvDNlUCiJhJfhXARKLewOpbVbd2XU3c/cIrfVmCX3EiQPShlTha+o13WSWVnjI8d/s
	sWxi0Xu8oAlb+bdOknaffz+XWLcE5Y4H6S7+FHGK/Hvvm9wCpPGhfIoVaKX73EV2OKvioY84HYzqh
	i8Zrj2deLBQihYEmFklQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rILmk-00DxvW-0R;
	Wed, 27 Dec 2023 04:44:50 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rILmU-00Dxli-14;
	Wed, 27 Dec 2023 04:44:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 62E1D1C0006;
	Wed, 27 Dec 2023 04:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1703652272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yq8FPR2LuMZyALJszWpCeHHckLAPDv/7+vYZcgFAtMY=;
	b=O+NbHwlQGumS7TsEOQr9BI9W/qAdYrT25uhKxHnbDp/6iBiFPtfRnlV/0F6b1nbfwhTWoT
	u2vYueKcYpUpw5Pr39+fRIlu4PyumjW/2rRanqAFAqojNwUfDFT1L1ll4wneNf83ZtLcsn
	736eO/i5HT/mjys/KN8ZHI4LtHXm99iy6woUe/odmouV4neBPhbcp+UEB6e8p8n/ZquCqQ
	nO9++Mx8uADhqjY7UIKNJUfzVCxpWxckEZw1E9FRpE4bcmMOWVRpjHyO0LIjPcK6REUjof
	EJmTqMesQ05kZdaNsk05SoOeiQER89KrSOAhZhjeqoQLs8Md98z6maOdzCnx6g==
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
Subject: [PATCH net-next v2 6/7] net: dsa: mt7530: do not set priv->p5_interface on mt7530_setup_port5()
Date: Wed, 27 Dec 2023 07:43:46 +0300
Message-Id: <20231227044347.107291-7-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231227044347.107291-1-arinc.unal@arinc9.com>
References: <20231227044347.107291-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231226_204434_518589_7E8EC02C 
X-CRM114-Status: UNSURE (   9.57  )
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
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, erkin.bozoglu@xeront.com, mithat.guner@xeront.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

priv->p5_interface and priv->p6_interface are for use on the MT7531 switch.
They prevent the CPU ports of MT7531 to be configured again. They are
useless for MT7530. Therefore, remove setting priv->p5_interface for
MT7530.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index bf6c59ecc489..07c5f1c6d036 100644
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


