Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7E4C77B61
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 13:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jp4sFg0ojMV8MMU8A9Bkb7JvDbiYw4w687Rv39wQaSk=; b=N4DtF6v83UsQvZ
	Z2YVKzVWxn9+vTZPcIWrwK7DUmnPbxaVhkG78720L7RMTGu+P3Kd5adMdi86uQgqAtf5YQvLR0Tbh
	tNiqyry6jyqug3423BsKXharU6lMzV011ms4cY/KdPsdZWyifbjMqEfGDq47EKa/ceNf15TfI7b4t
	JO+IJxH+e1WnaWOGgxE8WyaeyyPmDF9oRajmTxramN3cEQa5Zo6/cKvcyocZQsCkIzcRpjQcgbwGd
	NHvnetbMGoqurg5RF2fGTifZrvgmEjPwjNoGxhNGkraoD0Y1vBj6qnuXoX2HVrs5FKk1Gw8vzukcK
	+C4tWqG3MCjQf3Q3Pdrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmQk-00ANbL-0p;
	Fri, 07 Apr 2023 13:47:06 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmQd-00ANUS-0I;
	Fri, 07 Apr 2023 13:47:00 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-545e907790fso681070747b3.3;
        Fri, 07 Apr 2023 06:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680875218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jp4sFg0ojMV8MMU8A9Bkb7JvDbiYw4w687Rv39wQaSk=;
        b=TOUhN1sw9413O3hvkXKi4tiAzKCWvOwluTbxluC9j8C88WblzhCbho/Dk5P4XAU1+P
         ZubFWkyOtYOZtW/AxnhI3a6nI4p0P5f9bfdU8WUdmbYbHU52SjUvLxH+0xNzZw7esrBY
         l5nIjm5+OScM8+L85jpJn/j7bvDdZ3Ro0Kgki7dPysXovQrmRBx7zAp56l3CtQBNgl58
         mntxIIvtL+Ey+Gy4AXWY3up0oXMwVTJ6VvIAKNtLtuxEO4SJF/x6bHmAA9hM6Y85n5Od
         GKEHPPnWS+YmjplfK2EIwLbSJbNJCSD64VoAHgO+EaEogHy+xjLQ7bpFXOabnHiGHAdB
         LgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680875218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jp4sFg0ojMV8MMU8A9Bkb7JvDbiYw4w687Rv39wQaSk=;
        b=1kXAX6di+R+XxxMk0sPLh0l5YfXFxQiu7LCuwHcqc9uoacEjFNelK9F9JpOr8x7Re8
         dOrx05dhc4GZ2jTbEj0t1gxuuQuL2xR51yYYP8ck2i21mUprRLZuKCB54B38SLxL5LF/
         EwFo6cObYH476/YZl/O/BxwzdS4jQy2iUwC9QezPQdwZ5S9GofW+m39/ge3t+FDMzNX8
         3Qyf245fmYMMRRDo/k6h7DdvDo5yLHLiZELNPSqYXrIwef/peosouGa9y1Op2L0SuTDC
         nw4YCsaCs1dSH8KNxPWIXFcyO8hPXEe4EF+R0Qpatz8ZPgkLnujMZ9Gg1urN76lp7w+w
         grDg==
X-Gm-Message-State: AAQBX9dA/eMtWM+kZ/TllHXhYK32NbGBYEBlpyGr+mgGpulKWs9gUfUy
	VABYdR9GjNKRiLZUYa15jxg=
X-Google-Smtp-Source: AKy350ZxZrKR79Xeu5PY9amkfV1wtIIIAzQArYlQx39guZ4hS+Y1gQEZVhjtgxGtIkelIQsB8n3fpA==
X-Received: by 2002:a81:918a:0:b0:54c:2852:d9a6 with SMTP id i132-20020a81918a000000b0054c2852d9a6mr1970355ywg.27.1680875218195;
        Fri, 07 Apr 2023 06:46:58 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id 139-20020a810e91000000b00545a0818473sm1034317ywo.3.2023.04.07.06.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 06:46:57 -0700 (PDT)
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
Subject: [RFC PATCH v2 net-next 05/14] net: dsa: mt7530: remove p5_intf_sel default case from mt7530_setup_port5()
Date: Fri,  7 Apr 2023 16:46:17 +0300
Message-Id: <20230407134626.47928-6-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230407134626.47928-1-arinc.unal@arinc9.com>
References: <20230407134626.47928-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_064659_155758_FEA58543 
X-CRM114-Status: GOOD (  10.31  )
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

On the first code path, priv->p5_intf_sel is either set to
P5_INTF_SEL_PHY_P0 or P5_INTF_SEL_PHY_P4 when mt7530_setup_port5() is run.

On the second code path, priv->p5_intf_sel is set to P5_INTF_SEL_GMAC5 when
mt7530_setup_port5() is run.

Remove this default case which will never run.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index fccd59564532..8a47dcb96cdf 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -943,10 +943,6 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
 		/* MT7530_P5_MODE_GMAC: P5 -> External phy or 2nd GMAC */
 		val &= ~MHWTRAP_P5_DIS;
 		break;
-	default:
-		dev_err(ds->dev, "Unsupported p5_intf_sel %d\n",
-			priv->p5_intf_sel);
-		goto unlock_exit;
 	}
 
 	/* Setup RGMII settings */
@@ -980,7 +976,6 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
 	    priv->p5_intf_sel == P5_INTF_SEL_PHY_P4)
 		priv->p5_interface = interface;
 
-unlock_exit:
 	mutex_unlock(&priv->reg_mutex);
 }
 
-- 
2.37.2


