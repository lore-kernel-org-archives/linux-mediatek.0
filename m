Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4CFC77B61
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 08:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C5hqUQUWJA4Uxj9fJ3Q/CFxmrWCj6ubL+CzXNJi3V1s=; b=moJtZzMe+xJVbq
	ZzXwOLtNmJ6gsfC6WRQ01j3EDxaRVnZ/iXxX72roOwUM438xQDSaW9GpaQU8CaDqwU2boRoGN0cLH
	5qST0Yhoy6XuQMXXfgJ23eHnJUBAzpZz9Q0NAUuN6mVDiGkMTXRx9UW/rZdaSSCm/awFGozgt5QZQ
	IBkfYrOz8GRuoUejdMZ5pNYexj9tLRgIi9c88Bo0HstXPe4Aofhf87t3grt+qb9bbvJmcYrWuIa9l
	3xLqKRJZXeknRsujUHCtpgg7eH/Y4CItpuB8tJ0R03bXewXnVoybHSEz1JyBGoRMFek+T9pIa0CE/
	zupgtHeCaWP3ZjEKEXxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prE5q-000WBH-2W;
	Tue, 25 Apr 2023 08:32:10 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prE4P-000V1h-2z;
	Tue, 25 Apr 2023 08:30:43 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-956ff2399b1so934755466b.3;
        Tue, 25 Apr 2023 01:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682411437; x=1685003437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C5hqUQUWJA4Uxj9fJ3Q/CFxmrWCj6ubL+CzXNJi3V1s=;
        b=l6Zmw5EkxiNQk+byLSELxBUGpq8fx69yVzl8OnHtsAdKEPG57VTkFohAnDFKn5maJV
         +NupxKI9QlQzq3hcCniFstqkxZdfJxYcKY2T0A6sn37l2eSu7/BUfpmqUTCz/8duqtcz
         aQ5pf4IWcK/LiFfP/HYsvX/ii1Xu+lP23zV/k/ySZc4iksp8itwYux+s3LaS1DMLoarf
         IcLPWfjkA9xU2/m95m6aiZQQ/Y9tPsozse6D3dGkalyogZDGE1fg2N2cVbNT0dOljW7m
         2/52tKdaFQTEK177jh9lK/TU7+mml47SfUT7jc1NUSlwjpDYSQFgEj3kmcmGqv3WoMkg
         FdRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682411437; x=1685003437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C5hqUQUWJA4Uxj9fJ3Q/CFxmrWCj6ubL+CzXNJi3V1s=;
        b=Z4H0bDRn/p3p+Nt9IiwmPFLUWmO8rLQJ4vIxuyCsYX0qImuZU6bthFZ4bigRffhsMC
         Bgo6BIYLxngLr9n/ZjbZUKsWvBdtlcCI4arfizrzzAWwq/LZ+2ooIJPyU+4O697mAF0I
         96MUiDmCseHwXpNKI53nwg8ZqbofaJPvx41fAlrEjJZwwbkIREWbVOdlDonB534MXP1U
         w0G1UT8V5V9xuzr5RCfUzTq9iawNOX8WYx1EeN5TBk5tD3Gl/pvc88YtLMJqRoZNavUu
         fikYCAbi3oidoPz2FNzLK8Ej48SZ4gUV7+/xE7U5B2YMbznflWuF92LwCeO/epjIRCI+
         XDqQ==
X-Gm-Message-State: AAQBX9fnH1VOs7wiIAUZbYUsImPcAxm0DfLqjsV33r5FW2m44VAHVEGJ
	+bJRqBNbr1zQSrSiQd6BtEg=
X-Google-Smtp-Source: AKy350b37JDSEapeflnu+5zn7Wr27HMEhEoGZYWKkBgRxS9IHg7Eds53wkx91bSWNPonWlDIM7kelA==
X-Received: by 2002:a17:907:d21:b0:94f:39d7:6454 with SMTP id gn33-20020a1709070d2100b0094f39d76454mr14917820ejc.63.1682411437241;
        Tue, 25 Apr 2023 01:30:37 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id mc2-20020a170906eb4200b0094ca077c985sm6439028ejb.213.2023.04.25.01.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 01:30:36 -0700 (PDT)
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
Subject: [PATCH net-next 18/24] net: dsa: mt7530: fix port capabilities for MT7988
Date: Tue, 25 Apr 2023 11:29:27 +0300
Message-Id: <20230425082933.84654-19-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230425082933.84654-1-arinc.unal@arinc9.com>
References: <20230425082933.84654-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_013041_972911_4F76A322 
X-CRM114-Status: GOOD (  13.47  )
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
Cc: netdev@vger.kernel.org, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

On the switch on the MT7988 SoC, there are only 4 PHYs. That's port 0 to 3.
Set the internal phy cases to '0 ... 3'.

There's no need to clear the config->supported_interfaces bitmap before
reporting the supported interfaces as all bits in the bitmap will already
be initialized to zero when the phylink_config structure is allocated.
There's no code that would change the bitmap beforehand. Remove it.

Fixes: 110c18bfed41 ("net: dsa: mt7530: introduce driver for MT7988 built-in switch")
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 468c50b3f43b..aee1e4d71547 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2532,10 +2532,8 @@ static void mt7531_mac_port_get_caps(struct dsa_switch *ds, int port,
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


