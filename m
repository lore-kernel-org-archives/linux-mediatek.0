Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59EB1C77B73
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 12:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7tJgSrsfJjBPduQ55oOsMul7hMtXzANzGQOA9D+BS4Q=; b=F647mTC4N3W8Yd
	wzTfje+GbdvodapV+R4vdntOB9DOYcG8Hxv3tsov8AIL8q3Z5KjfbzR0+pYy3JinW+rLjyv4Xyxuh
	BR7PeNh+tFbCUjhLJaGlhhBI1UXM2aqkLiH60bJQZM5xBydh2+na9DrmlUKvnuGsHOy+7xUNpJSyw
	iaaDsTvZ0caY9w9mXD9sOyXhRO7AazpHOiuGLJ5+be41vbG7FMf+MDJbgHws6xS/UnNOr2PodRnam
	2/wThdfoHnYJZVeaA/br5ee5si4RskG/T77b+u6GRnKYnBb6GhU4K0gV8BmwEJKAx/oz/DcOS+u2R
	/9J8qeHSqJS8hniId77g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q14TM-006Pob-38;
	Mon, 22 May 2023 12:17:08 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q14Sx-006PQv-2m;
	Mon, 22 May 2023 12:16:45 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-96fa4a6a79bso309317866b.3;
        Mon, 22 May 2023 05:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684757800; x=1687349800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7tJgSrsfJjBPduQ55oOsMul7hMtXzANzGQOA9D+BS4Q=;
        b=ZIVjXqZm2HxwrcjR1rFQj37pSDw/EAe2pmr8IgX7/oRVAdO9D5Mbtu3SPqksLMkREh
         T9xTkPJ2DH2L0Bm2ImuoBgnY8/k0+e8W9VyG5EHAm1KPXNqJyHAHBcCbCjcRC279kXWE
         Hwv1G68hkvXY2wx0dvWAg9806gcUAxWQFqrn0WKD4bJ14M8AwDRSaNdVCfY7B+psbCDh
         T775ROUERYrZTumv4F3HNyvUOp58lEMr0ZMUb2d7H9XQlGDCKoszmThhYdkotT184POj
         UV8UG5Y/cD/bzTDgSRiUpaY3kc8tSagfqHUSERWDR9NYGfNkbJPw4aDw7Pxr1ncazO4A
         95vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684757800; x=1687349800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7tJgSrsfJjBPduQ55oOsMul7hMtXzANzGQOA9D+BS4Q=;
        b=bhDq/NDGY63//PczF91PbRnJRYNtP94z4suvB/P0WsQ6ptsXvTaA69MwEkrMhGyKV4
         J0SBDdkYLBKbsefeXjjzaTG5/PYQACS/Cc80Uf5hBHzFAeUi3GuRMqsaFOPOaIYVOJ7g
         s046XCCgIxToo0G5Aju3VpA9SxjkuHOqVikH+i0OUzQAK/XKZ0JFC87WLtpp4XhDnz3I
         pO9ZbzjAdIKC72pSunQCIWdGhigbOadWRAaT8IH9bGN7YMTNwTJ8QNKfD84pEFO8pFvx
         WA8xjlgkQg2gjWqYknZ5cnHbRzrWBu7QJEYURljeXQNxtdB4tDJglelSall80uUttnCs
         fuKw==
X-Gm-Message-State: AC+VfDxHb/msUlD9w2kPFvQC9fSma7PdX+fJttqjtWvP8EetUNJ/Mqmp
	/RmirPDdTC3AlaYG6Vo65ZI=
X-Google-Smtp-Source: ACHHUZ72VmGhmmYTe0AopjokPSVMzaGVY/fJu0fyOgd/aAvX2GqtNUrGr+ViNueHkprxGWrI+408+w==
X-Received: by 2002:a17:907:7f8c:b0:96a:5e38:ba49 with SMTP id qk12-20020a1709077f8c00b0096a5e38ba49mr10976896ejc.2.1684757799838;
        Mon, 22 May 2023 05:16:39 -0700 (PDT)
Received: from arinc9-PC.. ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id y26-20020a17090614da00b009659fed3612sm2999950ejc.24.2023.05.22.05.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 05:16:39 -0700 (PDT)
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
Subject: [PATCH net-next 18/30] net: dsa: mt7530: remove .mac_port_config for MT7988 and make it optional
Date: Mon, 22 May 2023 15:15:20 +0300
Message-Id: <20230522121532.86610-19-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522121532.86610-1-arinc.unal@arinc9.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_051643_918587_35EA9AB2 
X-CRM114-Status: GOOD (  14.81  )
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
Cc: mithat.guner@xeront.com, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
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

Co-developed-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index f017cc028183..99f5da8b27be 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2614,17 +2614,6 @@ static bool mt753x_is_mac_port(u32 port)
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
@@ -2665,6 +2654,9 @@ mt753x_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 {
 	struct mt7530_priv *priv = ds->priv;
 
+	if (!priv->info->mac_port_config)
+		return 0;
+
 	return priv->info->mac_port_config(ds, port, mode, state->interface);
 }
 
@@ -3108,7 +3100,6 @@ const struct mt753x_info mt753x_table[] = {
 		.phy_write_c45 = mt7531_ind_c45_phy_write,
 		.cpu_port_config = mt7988_cpu_port_config,
 		.mac_port_get_caps = mt7988_mac_port_get_caps,
-		.mac_port_config = mt7988_mac_config,
 	},
 };
 EXPORT_SYMBOL_GPL(mt753x_table);
@@ -3136,8 +3127,7 @@ mt7530_probe_common(struct mt7530_priv *priv)
 	 * properly.
 	 */
 	if (!priv->info->sw_setup || !priv->info->phy_read_c22 ||
-	    !priv->info->phy_write_c22 || !priv->info->mac_port_get_caps ||
-	    !priv->info->mac_port_config)
+	    !priv->info->phy_write_c22 || !priv->info->mac_port_get_caps)
 		return -EINVAL;
 
 	priv->id = priv->info->id;
-- 
2.39.2


