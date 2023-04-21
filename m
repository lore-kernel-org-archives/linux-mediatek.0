Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E72C77B71
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 14:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jH8yEvnmoXsEC6mwOHxF9ajbBlURmLh7zMT6HCy7q6s=; b=SpO2vOCTz34/1n
	QkkzWMcPN56dUye+VijFinCGpEJdH+T9mYTsj4yOGW8lyq6i5WQwu3/zWannKKoXbwJH1lOPLjCXd
	7nssmVnlaiNLMII3SUsc3gGCU8zoX1n8iqfvfIe+QyGkym68zySX6OJ5lCVTZ+qW/zNa4E8kHZVrQ
	a1JYKDiK4JmzQIQUCpAhghooUI9gX5pMr1vGXou8PsM/gugvtEI1buMewZYSNMq2Kr1BTo0EXvYi7
	9WkctPzUq0A16SbWH6cbQKvyV9xfgCaXuwY4lhwtAlFYhIIT8dkluVwwfjyb5j2mwjN8Uzr/TtpNw
	6goaBbaXVhVhwKXr4HEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pprw0-00B9tW-0O;
	Fri, 21 Apr 2023 14:40:24 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pprtL-00B7ha-1v;
	Fri, 21 Apr 2023 14:37:42 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-956eacbe651so236897066b.3;
        Fri, 21 Apr 2023 07:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682087854; x=1684679854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jH8yEvnmoXsEC6mwOHxF9ajbBlURmLh7zMT6HCy7q6s=;
        b=ENF4e5isJoqDkxBVkvDe8GJi2ftvSaFaD9Evi4Dpli45lx1araC/pu5qZV+/ri9OtW
         aLau62aVwy1AxwQ40Q861kxGjJrGhSrI1L4hqchjhCa90Ei2Ilsgnjfz9Z95jOiSfSYn
         f6UXow6rBZMOv2mKFxv/FKlTe6VZ2HfQHmnuKMaVE6tKv6oyVGmqx+QH2UQEDTeJSn0p
         ep5Ni6mPdJFC95jJgJK0wy4PHbT/ixsdvFwW7mRUDeUb7AlmtPDOmfvt236IFJLLXMeH
         wrDdQUbMEHPFIOhUAAz9tAIca0emd32Y/WkYY/01pNXqm+JlfHzGj/rNQmTURFQWIHMT
         UKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682087854; x=1684679854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jH8yEvnmoXsEC6mwOHxF9ajbBlURmLh7zMT6HCy7q6s=;
        b=MYUFP+gvIh0aP64lfa+AB04jdRxFp6o1Hyos7S4D5SbmYAPrfzRuLIge4eelIaidn0
         aL32xWUt3R50NzvnaXNVlJzZFcOuZENFF6ZIRg2XIHjJlCmN4DuSbGrZ85TiLDPB4wxi
         dvLYlii0mZqE4SXtbJ+5Lkre7E7bIId+gfBAhb+JfPJliTQExn3yrCjfnjdE9uqzJq/1
         rtfvGq3gnVu5Spi2h9f2Twy1aOgOLkQAmqq3lTkmlM/jjBmV1z58B0uUMwrbQR5EbM9V
         1HDUkH8AxuOZ5E2omesThtSZTaoipI0fgauFSGyTTlVZaj3ErhABcWHo/9x9Ao+XeZsd
         tTAA==
X-Gm-Message-State: AAQBX9fWd0D8MpVUAeCjUV/pfUjbM2DgSvLel2Hy3cDckWh7JUXcDmsU
	tXvojrZyyVyeRd2CH4voucJKsWbPGfECiv0O
X-Google-Smtp-Source: AKy350b2NWrqoFCF1UDO3y+zEU6fJrF42fw4MyZhMWLq7M5pUTgsmJD+/3oPcIpL57kyJxjWUvr7Mg==
X-Received: by 2002:a17:906:9b45:b0:94e:5679:d950 with SMTP id ep5-20020a1709069b4500b0094e5679d950mr2004270ejc.72.1682087854350;
        Fri, 21 Apr 2023 07:37:34 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id q27-20020a170906361b00b0094e1026bc66sm2168244ejb.140.2023.04.21.07.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 07:37:34 -0700 (PDT)
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
Subject: [RFC PATCH net-next 18/22] net: dsa: mt7530: remove .mac_port_config for MT7988 and make it optional
Date: Fri, 21 Apr 2023 17:36:44 +0300
Message-Id: <20230421143648.87889-19-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230421143648.87889-1-arinc.unal@arinc9.com>
References: <20230421143648.87889-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_073739_780921_9904DC21 
X-CRM114-Status: GOOD (  15.35  )
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
index 899fc52193e1..a66a762cb5db 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2619,17 +2619,6 @@ static bool mt753x_is_mac_port(u32 port)
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
@@ -2670,6 +2659,9 @@ mt753x_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 {
 	struct mt7530_priv *priv = ds->priv;
 
+	if (!priv->info->mac_port_config)
+		return 0;
+
 	return priv->info->mac_port_config(ds, port, mode, state->interface);
 }
 
@@ -3113,7 +3105,6 @@ const struct mt753x_info mt753x_table[] = {
 		.phy_write_c45 = mt7531_ind_c45_phy_write,
 		.cpu_port_config = mt7988_cpu_port_config,
 		.mac_port_get_caps = mt7988_mac_port_get_caps,
-		.mac_port_config = mt7988_mac_config,
 	},
 };
 EXPORT_SYMBOL_GPL(mt753x_table);
@@ -3141,8 +3132,7 @@ mt7530_probe_common(struct mt7530_priv *priv)
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


