Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F13C0C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 13:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nVB9ML0qQp6Ot62697wF9RTVP+Z+z2Q4uGeODmUSaHg=; b=32PKG6OjIpQ7Rv
	J7L9zpzQxZIiE6RN4ljAA8EH44+SZvpdlmuKuR83C+8GsNuH7SWr4spccuEINerNBL0u8Xtg/w3t0
	DGBBY0TrjlUgXAz3yHE5nmWsZt6mhY5fU+ZU6navgDSbvCo6n1f5BRpaXI4xR3+xoijIfZQifjXkq
	Z3dfzP8nugh0kaEGJ4mMA/2qHRMYeIAas5UlJwGDQvrd9BfKXzvoZIpunDW8T4zY4qfVvGIxP8ZoA
	jClXLBnfQAbTBYSKaAI8/6oy1KfKrCSeDQjXEQKSUJa+f7lx1l0rAdGHwI6VwGfAFgkYYdrp2oNte
	WKoIhr+C4hzWcCDU6ctg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmRt-00AOdL-1w;
	Fri, 07 Apr 2023 13:48:17 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmRI-00AO4M-1I;
	Fri, 07 Apr 2023 13:47:44 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-54c0dd7e2f3so90617917b3.8;
        Fri, 07 Apr 2023 06:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680875259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVB9ML0qQp6Ot62697wF9RTVP+Z+z2Q4uGeODmUSaHg=;
        b=i1K1FdocxtQzLTFUEHSuQBjYbF+13pH0uYQGzYUPZOMq1Iu/dGJPy12Qm6mARCEzCm
         YHLL/WqShe6RMe50LWVBE77YnhHGRcC1fEN3mEmKn7NDQ0LYUEkBZxKolKnW/1jRh5cf
         fIrVPtKD1jIC7U69xs4HxVstnyINJxYrt4DUjIdzBJHPwF2ADOt5xzUN0e/J+pWcksyR
         oviPikrbAOtyY5v0zfDuvdX6p7b5Cz4/hw2hP2Wj7eVatoxYMShivAMISsrG7OP+Asb7
         /neG+24jv6/svx9gQZtmBy1JfbrIJYSS9jWZ8RBKUMmXTNPPv2UMMLPCBr0dLBTg8Vus
         2Zjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680875259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nVB9ML0qQp6Ot62697wF9RTVP+Z+z2Q4uGeODmUSaHg=;
        b=cYsSHaFJPK8stLo4/Yi5cOgHH/W3eq9iQyTz1xoZR4A5x2OHHoRkUQPh68AEBEMW6Y
         Pz+f6lKvadFBMzti1zIHSCaZYot/p+SvBSjFCOl5uwJ8MEkMmrxvcIj/iju3RRinLh+j
         AQIY5+qMcFBN3oMyDY/Q88eGGX7/Aay46zBTPuGpYGD7ToUHTmg9Xju2xINqxQdx2Oc5
         tzpGZwd86RltnVth+ojH4YZSI6+mfvOZbTk8sAwA25rGooUtApiTlb7cW5Myrb/7IjWS
         +3KDJZYJzpSHO4so9aR5JeNjeyVspS7ad8zXjbIRvMtkkcDVXN53xxzAKY/Wl7YcWFLy
         BgHw==
X-Gm-Message-State: AAQBX9cFynRdsXBz4TJEE6KpRGw0UqA6TglMo8EHs0lIiFlgcuQ/H7ct
	irL5mFz2OKSLW1qBEkRMdfA=
X-Google-Smtp-Source: AKy350Yh3scr9hlZNm5vfl4Uwkod/y7R0genEKiw6tURE/R+/iDGLj049Si28KBdTKTzjdBw6CY86A==
X-Received: by 2002:a81:5c56:0:b0:544:9180:3104 with SMTP id q83-20020a815c56000000b0054491803104mr1809711ywb.34.1680875258782;
        Fri, 07 Apr 2023 06:47:38 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id 139-20020a810e91000000b00545a0818473sm1034317ywo.3.2023.04.07.06.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 06:47:38 -0700 (PDT)
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
Subject: [RFC PATCH v2 net-next 14/14] net: dsa: mt7530: remove .mac_port_config for MT7988 and make it optional
Date: Fri,  7 Apr 2023 16:46:26 +0300
Message-Id: <20230407134626.47928-15-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230407134626.47928-1-arinc.unal@arinc9.com>
References: <20230407134626.47928-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_064740_630117_0398D6D5 
X-CRM114-Status: GOOD (  15.17  )
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

For the switch on the MT7988 SoC, the code in mac_port_config for MT7988 is
not needed as the interface of the CPU port is already handled on
mt7988_mac_port_get_caps().

Make .mac_port_config optional. Before calling
priv->info->mac_port_config(), if there's no mac_port_config member in the
priv->info table, exit mt753x_mac_config() successfully.

Remove mac_port_config from the sanity check as the sanity check requires a
pointer to a mac_port_config function to be non-NULL. This will fail for
MT7988 as mac_port_config won't be a member of its info table.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Co-authored-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 903e39b7b772..dd2221e839d9 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2629,17 +2629,6 @@ static bool mt753x_is_mac_port(u32 port)
 	return (port == 5 || port == 6);
 }
 
-static int
-mt7988_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
-		  phy_interface_t interface)
-{
-	if (dsa_is_cpu_port(ds, port) &&
-	    interface == PHY_INTERFACE_MODE_INTERNAL)
-		return 0;
-
-	return -EINVAL;
-}
-
 static int
 mt7531_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 		  phy_interface_t interface)
@@ -2680,6 +2669,9 @@ mt753x_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 {
 	struct mt7530_priv *priv = ds->priv;
 
+	if (!priv->info->mac_port_config)
+		return 0;
+
 	return priv->info->mac_port_config(ds, port, mode, state->interface);
 }
 
@@ -3123,7 +3115,6 @@ const struct mt753x_info mt753x_table[] = {
 		.phy_write_c45 = mt7531_ind_c45_phy_write,
 		.cpu_port_config = mt7988_cpu_port_config,
 		.mac_port_get_caps = mt7988_mac_port_get_caps,
-		.mac_port_config = mt7988_mac_config,
 	},
 };
 EXPORT_SYMBOL_GPL(mt753x_table);
@@ -3151,8 +3142,7 @@ mt7530_probe_common(struct mt7530_priv *priv)
 	 * properly.
 	 */
 	if (!priv->info->sw_setup || !priv->info->phy_read_c22 ||
-	    !priv->info->phy_write_c22 || !priv->info->mac_port_get_caps ||
-	    !priv->info->mac_port_config)
+	    !priv->info->phy_write_c22 || !priv->info->mac_port_get_caps)
 		return -EINVAL;
 
 	priv->id = priv->info->id;
-- 
2.37.2


