Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2220AC6FA99
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 22:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JuDmDmY4IV0QLoJ1ArzJ4ijcazQ7ZD0u2S2wBUytaV4=; b=k8V53P8cary27gz7mK0Skz5O+O
	ltKGfZ6WRigsWFV4Hx73Vk776XAXxs6o8CfYumy8Ve9LDyEa7hA/qK01/M7/d6aijuzP1ksJ39cGY
	HXd18Ls1s+/CV2W5APuVJ7sE3h4BArnfuTZSsi2ixP4e2bMJsoT2aK59pdxKykSHgSFq3w/+Ju3jD
	GTbqXyAbWc2G0feYLqOwNUfMqYZemuIWEe4Un4vZXpxwuy72wGOG+8+LNDya6GvtXVS0GcNRJVxh0
	h9z+o2KKG0UHgNPY+amYpVVTLQKY6VI+bi/FSw9/rLUat7rN+sSF0j7Vl0vUS6lU0r6RJKUujr/XT
	eYSGiHxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZfPS-002Ybn-UE; Tue, 07 Mar 2023 22:03:50 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZfPI-002YYX-Jz; Tue, 07 Mar 2023 22:03:41 +0000
Received: by mail-wm1-x336.google.com with SMTP id l7-20020a05600c4f0700b003e79fa98ce1so56209wmq.2;
        Tue, 07 Mar 2023 14:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678226617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JuDmDmY4IV0QLoJ1ArzJ4ijcazQ7ZD0u2S2wBUytaV4=;
        b=RNXi6CIgsswuyNAn64MCE1WBucMN/4Lb2cthlZw4x33sH4no/5WS9mQOMKrXlZeIiZ
         f4A2fky6gKi+hjyL07oPC4kprq1TCIoE9pRh0xDlCilqd4j35ULgS5rUYFFwQqiEgk6F
         dFcWPzK/4/j5+q0lz+LJNcsixcNJHCcPeJHy7Q16jEXU8Iah9kdiFgCzW3RAO+6OMgpi
         1mVqCP4Hx/9Ppg5oftc8FsrLtbcNvc4UboWlZ0RSzEkX/34eJ4DiE3nPssW7VrzWwjba
         7gssg+qqA46xyoQmNVnsXbI4zHB8V0fgh5ij87CA18eZoqDNVkGgXyIC0DfSgJUkYr/i
         m2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678226617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JuDmDmY4IV0QLoJ1ArzJ4ijcazQ7ZD0u2S2wBUytaV4=;
        b=GbbqaG4Y09Fvn8sO/1BIreZDez+y2I156jlkfk62EhGq52zD5ufk+sfPuWtjB+Udey
         jYmAX/1xyZw2I+jEM1BqYEzdH23VIs5nj1ILqaRG1SXPERbFb4E+l3hw2ehQx53YzHZd
         wpOvrN2t30uPUJTyuK6YnjS2CSRHC8v7BLW2OYcd4kRqvsfFWKUXXWsFew5WbZiBFckc
         t4t7mkwrV2bv4VDad9iFqvifu1aeqsRK1yFW7YAnuDIMsbvVNEz+k4e8KrE0+MDDJA8s
         CbNVGCEtXcjCLnQ+a36Nf+oG9D93hoZwm55mlTVLudX2lPGxbzHzyohS/wgPNrezXVG5
         iKUA==
X-Gm-Message-State: AO0yUKVDQ8jao/AFT4XXCFoaKxRUVWsmvjnZZfSKalAZ0ylIqSb4/CpJ
	P82Xe7CDymApLkhXQXGS98o=
X-Google-Smtp-Source: AK7set+nNuteaAJCPG2h+uXKJN36DhqNuJ1LM58JQ9dJYBDea2ahKspMS4VBH1MVa7s1gsdYprAUZw==
X-Received: by 2002:a05:600c:5127:b0:3ea:f01d:2346 with SMTP id o39-20020a05600c512700b003eaf01d2346mr14624376wms.15.1678226617227;
        Tue, 07 Mar 2023 14:03:37 -0800 (PST)
Received: from arinc9-PC.lan ([212.68.60.226])
        by smtp.gmail.com with ESMTPSA id o13-20020a5d670d000000b002c8476dde7asm13556735wru.114.2023.03.07.14.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 14:03:36 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	=?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net 1/2] net: dsa: mt7530: remove now incorrect comment regarding port 5
Date: Wed,  8 Mar 2023 01:03:27 +0300
Message-Id: <20230307220328.11186-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_140340_721261_19991CB4 
X-CRM114-Status: GOOD (  11.66  )
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

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Remove now incorrect comment regarding port 5 as GMAC5. This is supposed to
be supported since commit 38f790a80560 ("net: dsa: mt7530: Add support for
port 5") under mt7530_setup_port5().

Fixes: 38f790a80560 ("net: dsa: mt7530: Add support for port 5")
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index a508402c4ecb..b1a79460df0e 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2201,7 +2201,7 @@ mt7530_setup(struct dsa_switch *ds)
 
 	mt7530_pll_setup(priv);
 
-	/* Enable Port 6 only; P5 as GMAC5 which currently is not supported */
+	/* Enable port 6 */
 	val = mt7530_read(priv, MT7530_MHWTRAP);
 	val &= ~MHWTRAP_P6_DIS & ~MHWTRAP_PHY_ACCESS;
 	val |= MHWTRAP_MANUAL;
-- 
2.37.2


