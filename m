Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A222AC47DD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 05:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eYCgJu0QAseFuyDyWJpFdTZ6tuP1JPrMUMpR9+uHtR0=; b=ThsMNavTZdezqJnDAyakMf6onX
	wFTUzKQle1wqp8thJ6ntMwtYPRI2WHN6y6/YC+hrifvxIPnSOwpmci0hblmfYjiuXJXM7r1tEA0t/
	taX3yNogPOYnZHODo2oDARW/zRiwUD4BstLczi6rXTNJa/3weDhtF9ANytHxAGLv66qCi6S1U0Yl0
	vtrwSaZX5eXgOb4+s66OIgR4v9yBlCNYjhJBoEeHSMLF6/LEoG1zzl9YMK3Cz9wOsvU6b1bnh4mJn
	H66g1kQEn2UyIKPhwr91QoPYMJisS0Hngu76kuwmCBHIEi9kCvc/nkkJNsNe9PFRTFIHyVwEHNVqI
	RZX6H1Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRmyl-00Abet-0o;
	Mon, 22 Jan 2024 05:36:15 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRmyZ-00AbYi-2t;
	Mon, 22 Jan 2024 05:36:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id A19DFB80B3B;
	Mon, 22 Jan 2024 05:35:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6DBEDC43601;
	Mon, 22 Jan 2024 05:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705901758;
	bh=atNAIQUZ9YchgrXFgHv6eKt+am7CBizMAbohfqxIWvw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Gd/8p3Bs5oRANr3GBaOqROJ4MBiNKAO5bD1N3KQXoR2kEsqTMCA0Xhr6YFU6HosbI
	 C4o/XMGdc0dV0yYRXWI81O/ys55rk561DWuy8gGbMW+VDocHXo5eJlriBExRbzsaOM
	 bnf0iG88lGu5OMAsdJ32YKLWlzHnGohUyLT5ZU8RxOKIWtMLe/pDsSMsgTTQ6uA1TC
	 PXD3F/6v0KAn90FILcSmXTKq5AHgzhUUmP9u0Fx5SzIyXFyfRvD67/Ki+HFmHjw7yv
	 5yhGbZm7hyOdjZmN51eCUDe/ZzbME8DkIF254NWIpioJhQcP7ixVeH+wAXNgILGJYS
	 Y/zDr7GQRlDBw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CCE3C47DD3;
	Mon, 22 Jan 2024 05:35:58 +0000 (UTC)
From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= via B4 Relay
 <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Mon, 22 Jan 2024 08:35:57 +0300
Subject: [PATCH net-next v3 6/7] net: dsa: mt7530: do not set
 priv->p5_interface on mt7530_setup_port5()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240122-for-netnext-mt7530-improvements-1-v3-6-042401f2b279@arinc9.com>
References: <20240122-for-netnext-mt7530-improvements-1-v3-0-042401f2b279@arinc9.com>
In-Reply-To: <20240122-for-netnext-mt7530-improvements-1-v3-0-042401f2b279@arinc9.com>
To: Daniel Golle <daniel@makrotopia.org>, 
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: mithat.guner@xeront.com, erkin.bozoglu@xeront.com, 
 Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1705901755; l=1273;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=pshHxjZuMebpMx/Gh2fbwscWV4LBFxm7gD/pRSkDjUU=;
 b=3QO+m8i9+Ps4LZGshnpqcBCo9aNWs7CYTLbXp9XfvHkLogRSHjRTuKQahhjiOlLAM+EezZlll
 M7WXEkoq3q3AJBtDqaVD4ZqTNnAsgH2y6/N04iZ6+sNliD5XWQrHn3Z
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt with auth_id=115
X-Original-From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_213604_231780_2925C6E1 
X-CRM114-Status: UNSURE (   9.18  )
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
Reply-To: arinc.unal@arinc9.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Running mt7530_setup_port5() from mt7530_setup() used to handle all cases
of configuring port 5, including phylink.

Setting priv->p5_interface under mt7530_setup_port5() makes sure that
mt7530_setup_port5() from mt753x_phylink_mac_config() won't run.

The commit ("net: dsa: mt7530: improve code path for setting up port 5")
makes so that mt7530_setup_port5() from mt7530_setup() runs only on
non-phylink cases.

Get rid of unnecessarily setting priv->p5_interface under
mt7530_setup_port5() as port 5 phylink configuration will be done by
running mt7530_setup_port5() from mt753x_phylink_mac_config() now.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 33c15f10de34..5394d8c6a40e 100644
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


