Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9638FC77B61
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 13:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+1HASBb71XtLwecn3CRcGVRneQXdr8W/qyVtG8y0vZQ=; b=Pv7R99wF4H6xxz
	uSWkNAudTu2nz8m+Fh9e35k7aM+ldX/yfQRYU5u6Gp+znXy0wLQzak5AAtt0Ol/lWpNTneB74qVDC
	unwWT1kLBA4GUZD/dOBXZCUE4Q8g4H5jag25Gkokos2bB5sW/VPDU5QJV0xcqL/6dr36M8oM/3ON+
	pS9+5G5Vu7JtaXijklFXJ/S4fpNEawPhvoZud1A8nFVProIzvBuddaUSAXL6OC6omxtLCD7zW0jYO
	yUfos+zyW9PVAvSeWalUaFZACdLlgFjeIAB51rXm7yPFQr3Fj1IP1JFy28Hlufwd/rpgYVRmH5ZfW
	lAQL7ZGPflcd6fPHe41g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmRm-00AOX4-1T;
	Fri, 07 Apr 2023 13:48:10 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmRE-00AO03-39;
	Fri, 07 Apr 2023 13:47:40 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-54c061acbc9so116915927b3.11;
        Fri, 07 Apr 2023 06:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680875254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1HASBb71XtLwecn3CRcGVRneQXdr8W/qyVtG8y0vZQ=;
        b=nyWA4EQ30Lz7Z4a91iWxW0yFcH5DiujHL1C9mYTH8A3PqJsCVElakqiyjcg72CMqZt
         jMlxzkJ3LF6uVdqB9TbyHGrZsLiGkEl+cirgcCkMd1YKZmEUl3mAOjoZLfJQZRM/bQ18
         GAv7ODceNyHqp+wbTyowvGsxio+SMzsrrnMUP5HfgnGZJ/LsVB9KjTouJIfLB+HC7FBe
         2MNZWPjiy18CkfEY9O3wOxueliKlWnopMrg3tTbVdbwiC1Tl2Z3DFsfOkvjBTmHxenXz
         Q8dqBnmIioGC+JOahdzkHDGwqy3M/kYhLZJTcPmzIvRazNqACZic32m44lxyQ7IztMyC
         6iEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680875254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1HASBb71XtLwecn3CRcGVRneQXdr8W/qyVtG8y0vZQ=;
        b=ZaAzVJAual9/sTMJa+ZdMBlG9UDUlRG95a44rP1TVhqJM1UIahYT3rU64rwYr7XmUI
         LHmSQNy5mHlRBqOZhkbkFc0GMVGTOJtypzHXbaCYiBJoRGLA31onfHViTg4Yt4ccXOxT
         xeCm58jzTa2s7/Ez66GytM+kDxX3N+QOGkGW0ADAY+RtwMwOfBvxTz+Zpdmr1xoOJHzZ
         aDbsyd0LrCFcH7+Dz5RQl1HfmFUg+ewCK265DxRwMgh6XJw1WLUka5mhKxVA0/7oSDA1
         Qj+zzPvH4EgQB/LNeXAECYKjOhR5aUxai6l/h+xYSe8EmvQnrmIxZen7OZtuS173hgFL
         PIFQ==
X-Gm-Message-State: AAQBX9e00WSIPEmCL1sQHl+qbjuNPF4ejIWzXYZk88dKFm4UZQhnBehm
	4qEdVlYHZvdChKHmC+m+nG8=
X-Google-Smtp-Source: AKy350ZjQyB7r5zLr3cqyHm1Yiv9Pt+md3WiiRwq5UnsioctFwZEM4XEPYHrU5Y8xfI1wc9PE++k4A==
X-Received: by 2002:a0d:ef07:0:b0:540:cb3f:b34a with SMTP id y7-20020a0def07000000b00540cb3fb34amr1992837ywe.32.1680875254253;
        Fri, 07 Apr 2023 06:47:34 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id 139-20020a810e91000000b00545a0818473sm1034317ywo.3.2023.04.07.06.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 06:47:34 -0700 (PDT)
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
Subject: [RFC PATCH v2 net-next 13/14] net: dsa: mt7530: fix port capabilities for MT7988
Date: Fri,  7 Apr 2023 16:46:25 +0300
Message-Id: <20230407134626.47928-14-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230407134626.47928-1-arinc.unal@arinc9.com>
References: <20230407134626.47928-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_064737_046647_C1C634EE 
X-CRM114-Status: GOOD (  12.98  )
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

On the switch on the MT7988 SoC, there are only 4 PHYs. That's port 0 to 3.
Set the internal phy cases to '0 ... 3'.

There's no need to clear the config->supported_interfaces bitmap before
reporting the supported interfaces as all bits in the bitmap will already
be initialized to zero when the phylink_config structure is allocated.
There's no code that would change the bitmap beforehand. Remove it.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 6fbbdcb5987f..903e39b7b772 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2545,10 +2545,8 @@ static void mt7531_mac_port_get_caps(struct dsa_switch *ds, int port,
 static void mt7988_mac_port_get_caps(struct dsa_switch *ds, int port,
 				     struct phylink_config *config)
 {
-	phy_interface_zero(config->supported_interfaces);
-
 	switch (port) {
-	case 0 ... 4: /* Internal phy */
+	case 0 ... 3: /* Internal phy */
 		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
 			  config->supported_interfaces);
 		break;
-- 
2.37.2


