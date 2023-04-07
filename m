Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5906CC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 13:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DCKgE17ON7u0QHZu5XuejlM/Ee789bX9Og0M55Yu/Ng=; b=n/YuRuXaiX6ZE4
	v41ftP4ieyYpLWndrZOnYOokRWIfFzZj3WeNwqYQNsRRyXuzoyWg+PyQOuJyoC6lfUiEy0NW0Czio
	01rBhEmwibacScJNYTYabM9/Y7HrILXGCUS7kXtE2E5YgfptISCua2olhnyIhqKdFVQxcqyeJDqRJ
	YxhERgid2QWgWHRsn9cqVehH0Rbl4kDsLx8+Kin2bnsyVkKk4QNRZlEsvI8HiPJbEHeoUHwQ2j32w
	AFD06pntFMUw542h7znNIuxXO7WzZcUpqii0e9HcsnLDsR57G5i0Ec8k81xHXAJZMYLp8sFeKc4lw
	vFa+buM0FFRMTYxpbtXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmQW-00ANP0-0s;
	Fri, 07 Apr 2023 13:46:52 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmQO-00ANFv-2n;
	Fri, 07 Apr 2023 13:46:48 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-54c0c86a436so96787487b3.6;
        Fri, 07 Apr 2023 06:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680875204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCKgE17ON7u0QHZu5XuejlM/Ee789bX9Og0M55Yu/Ng=;
        b=FXl03DPkffUd83inDI9nua6QLZG0ri5iSwcLfh4bGFcnshhGYoV/nzfVLu2nbeTVQ3
         H99nr5zoHPBXLGf+2qImHIuMHaTwxJK6dBtbpdqnjzmSnTgDLipt4yb1g7J6Hu8mWe3s
         P9liPnO7uhqDErcxnJ/R2fSWNZV3W5i/hRiCdLm1xZGwgu9phYgrAq7QiVr6aIDEhqCa
         kumcV11FLjiFbSD7fLoNy8ioua+64SGcCQlaOpgZ7mTEl7i5w36pBbF+GOOsHturCL6W
         2I0f2AmxlmV5RonEQ0lb6f45atq7Ey6piHfovamXh/erpqcYBMdGyBiiso7FZxchnbz0
         ujrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680875204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DCKgE17ON7u0QHZu5XuejlM/Ee789bX9Og0M55Yu/Ng=;
        b=sScwVDvJmLF0LmO2Npe3AwKA8LgXbTI9feGlF8hhaQNzvwXPNz7Hums6oZ4FwHT+je
         yDXpuLfaR7MuB2HVpAzrJghR15qy9Sloyu0DfRZMKxrIinuXRc/y83YnFjLupzYWe5Ep
         liMvhFwSOpb0EXTTj6TTr6o6usK/+hJlp8ZdswKoTQRO4uT3mfWkM0uXUgUTqANCEeXi
         IfGMrXhrIJBTniptKa2Bu05V0iXFqDR7mgkM9IK2eBKbh5D7R2feLO75wapGXS7PW93N
         3M4qUS06TRq4os9Pp+ZKWNGn9m+HAkIoluDSMvPvGL0kUq8ZUo0f9daG7IolPbTxZIMS
         PCpA==
X-Gm-Message-State: AAQBX9fBb5zpM/I+QiJduR2NebTaSrvsEnnQnWpXKtQ8Thh3/+mA2YT4
	2EdHyyft+yHb8klz5kKFl8k=
X-Google-Smtp-Source: AKy350bFexJHt8BM+7xRCz9TGcQvf+PSV4XF/v+yDKLMmRJNDGcPwoW7OeJNexXHi/cRqBgiTSqD4w==
X-Received: by 2002:a0d:d80a:0:b0:54c:eb8:5a5b with SMTP id a10-20020a0dd80a000000b0054c0eb85a5bmr2041776ywe.13.1680875204454;
        Fri, 07 Apr 2023 06:46:44 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id 139-20020a810e91000000b00545a0818473sm1034317ywo.3.2023.04.07.06.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 06:46:44 -0700 (PDT)
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
Subject: [RFC PATCH v2 net-next 02/14] net: dsa: mt7530: fix phylink for port 5 and fix port 5 modes
Date: Fri,  7 Apr 2023 16:46:14 +0300
Message-Id: <20230407134626.47928-3-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230407134626.47928-1-arinc.unal@arinc9.com>
References: <20230407134626.47928-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_064644_917957_685B6F44 
X-CRM114-Status: GOOD (  19.88  )
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

There're two code paths for setting up port 5:

mt7530_setup()
-> mt7530_setup_port5()

mt753x_phylink_mac_config()
-> mt753x_mac_config()
   -> mt7530_mac_config()
      -> mt7530_setup_port5()

The first code path is supposed to run when PHY muxing is being used. In
this case, port 5 is somewhat of a hidden port. It won't be defined on the
devicetree so phylink can't be used to manage the port.

The second code path used to call mt7530_setup_port5() directly under case
5 on mt7530_phylink_mac_config() before it was moved to mt7530_mac_config()
with 88bdef8be9f6 ("net: dsa: mt7530: Extend device data ready for adding a
new hardware"). mt7530_setup_port5() will never run through this code path
because the current code on mt7530_setup() bypasses phylink for all cases
of port 5.

Fix this by leaving it to phylink if port 5 is used as a CPU, DSA, or user
port. For the cases of PHY muxing or the port being disabled, call
mt7530_setup_port5() directly from mt7530_setup() without involving
phylink.

Move setting the interface and P5_DISABLED mode to a more specific
location. They're supposed to be overwritten if PHY muxing is detected.

Add comments which explain the process.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 31ef70f0cd12..a00aabe4987e 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2288,16 +2288,19 @@ mt7530_setup(struct dsa_switch *ds)
 		return ret;
 
 	/* Setup port 5 */
-	priv->p5_intf_sel = P5_DISABLED;
-	interface = PHY_INTERFACE_MODE_NA;
-
 	if (!dsa_is_unused_port(ds, 5)) {
+		/* Set the interface selection of port 5 to GMAC5 when it's used
+		 * as a CPU, DSA, or user port. Let phylink handle the rest.
+		 */
 		priv->p5_intf_sel = P5_INTF_SEL_GMAC5;
-		ret = of_get_phy_mode(dsa_to_port(ds, 5)->dn, &interface);
-		if (ret && ret != -ENODEV)
-			return ret;
 	} else {
-		/* Scan the ethernet nodes. look for GMAC1, lookup used phy */
+		/* Scan the ethernet nodes. Look for GMAC1, lookup the used PHY.
+		 * Set priv->p5_intf_sel to P5_DISABLED first, then overwrite it
+		 * if PHY muxing is detected.
+		 */
+		priv->p5_intf_sel = P5_DISABLED;
+		interface = PHY_INTERFACE_MODE_NA;
+
 		for_each_child_of_node(dn, mac_np) {
 			if (!of_device_is_compatible(mac_np,
 						     "mediatek,eth-mac"))
@@ -2328,6 +2331,8 @@ mt7530_setup(struct dsa_switch *ds)
 			of_node_put(phy_node);
 			break;
 		}
+
+		mt7530_setup_port5(ds, interface);
 	}
 
 #ifdef CONFIG_GPIOLIB
@@ -2338,8 +2343,6 @@ mt7530_setup(struct dsa_switch *ds)
 	}
 #endif /* CONFIG_GPIOLIB */
 
-	mt7530_setup_port5(ds, interface);
-
 	/* Flush the FDB table */
 	ret = mt7530_fdb_cmd(priv, MT7530_FDB_FLUSH, NULL);
 	if (ret < 0)
-- 
2.37.2


