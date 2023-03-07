Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3243FC6FA99
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 22:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LstyUSK2ksGKfcMC7HuMLK2ujqvPm5YfOXdsGasYESo=; b=aWofdhFlk99QGevQz4bNKgBu84
	ZgOfMVCw/wlc2kDEwVso9SPfEYTlGmgBDEndEu0Zb8CdR81GLO3L6GNrRbufqZtrX1vS25WnYzRAv
	l9kyO34UIJb5Vh+tMXX+3fWjyb5tLm9I+LBKRW5p8LJ7YKKahXnoc0di3jymwDvhIwxaCdFqAiJfE
	7qzUDXdCgMKIuMqDcw8RhRrInGYUo29f/nH8RssOTe+kPBaDg8ZqE2+crroBCLJLuijqQagtqYjKq
	Hn0vQe5oK43k1kgTOWzDsC1/4cE7joJbOLUgjVaFUZn/KJ2LDSgFgnod2fL8HqJ4ipf8zQ7CKsLmA
	Vtcif21A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZfPb-002Ygp-LT; Tue, 07 Mar 2023 22:03:59 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZfPM-002YZ2-1P; Tue, 07 Mar 2023 22:03:46 +0000
Received: by mail-wr1-x42c.google.com with SMTP id bw19so13569174wrb.13;
        Tue, 07 Mar 2023 14:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678226620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LstyUSK2ksGKfcMC7HuMLK2ujqvPm5YfOXdsGasYESo=;
        b=JTznxaDSIZk/x2YXBJnolwCPMu+BmF5gjJWvb5/X+6iDfQzlLsf1n87VYDLy5f0UBL
         6oviJe1ukzqEdTg27I/xG1Wj5dM1N1aTMXRMXJTOxp0+fb8eL8nu840BAtMwYHaGkGFM
         vuaayvTA8HSuyDZ4L0/2WkuLk62rHpzePfwk9nr0p6GS0zq9PHUKPfqoO4ZAfAZ5sjFI
         GGQab32uW0JQLe0TCpCDmrr36ZmGjaUJgqh5OTlJNjptHQHZq6dhP23wf7iWm1+H5xj5
         SFIPeQoIKFi8jdjw0tSNKP4k8qf+ZvaVCevsPoKPkM6Lm7Rw6tcXKUkQbFSN3VNtCAbl
         Iocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678226620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LstyUSK2ksGKfcMC7HuMLK2ujqvPm5YfOXdsGasYESo=;
        b=YPUgqe4E3oQipcstFfnDyo5/y1GZq5s8U1G1Oql4fhW6WzfeI/sHlHxNGvl7BG7xiz
         b36MxyTvoCN5glb1dD+4xv3d3TQxKJx1Aa5ZAGDzc8+LMGZJ5OJCqWAyIKoJB77Hq0qD
         5FF6jP/sY8jwySQl+oI7+vbIjllpnF7TkF1IzOhSQljoIW7WZjeWeCb7qkcazgghl8B7
         dXZKdgDAPXxE0fW1VMh9FtqullNYwIMg8myLSG1dkSXPuGXiHdkEYQiCScDokQCUhXIS
         Cd0IhxZi2xMEwZ0WT8v8ls6pkVHU8QTLJwgAeYedPPSBPU1sWPpvPh3GNySlvx2xvO2A
         NO+g==
X-Gm-Message-State: AO0yUKWQqT9ZtSYcycbqRsYH8hXWK12oDqp5v9J7FTaiExo5g/oArZDr
	EVZrTMXBWD5ICAYjUkez4Ps=
X-Google-Smtp-Source: AK7set/r47niW5a/bUBb91PhT58/HqcU2MPuw7GZiPGUzn4bRzA0eCB9/J35AJ/YB+PF1LEk9IzelA==
X-Received: by 2002:adf:f048:0:b0:2c7:1757:3a8e with SMTP id t8-20020adff048000000b002c717573a8emr10746733wro.34.1678226619878;
        Tue, 07 Mar 2023 14:03:39 -0800 (PST)
Received: from arinc9-PC.lan ([212.68.60.226])
        by smtp.gmail.com with ESMTPSA id o13-20020a5d670d000000b002c8476dde7asm13556735wru.114.2023.03.07.14.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 14:03:39 -0800 (PST)
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
Subject: [PATCH net 2/2] net: dsa: mt7530: set PLL frequency only when trgmii is used
Date: Wed,  8 Mar 2023 01:03:28 +0300
Message-Id: <20230307220328.11186-2-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230307220328.11186-1-arinc.unal@arinc9.com>
References: <20230307220328.11186-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_140344_112619_33C64433 
X-CRM114-Status: GOOD (  13.24  )
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

As my testing on the MCM MT7530 switch on MT7621 SoC shows, setting the PLL
frequency does not affect MII modes other than trgmii on port 5 and port 6.
So the assumption is that the operation here called "setting the PLL
frequency" actually sets the frequency of the TRGMII TX clock.

Make it so that it is set only when the trgmii mode is used.

Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index b1a79460df0e..961306c1ac14 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -430,8 +430,6 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
 	switch (interface) {
 	case PHY_INTERFACE_MODE_RGMII:
 		trgint = 0;
-		/* PLL frequency: 125MHz */
-		ncpo1 = 0x0c80;
 		break;
 	case PHY_INTERFACE_MODE_TRGMII:
 		trgint = 1;
-- 
2.37.2


