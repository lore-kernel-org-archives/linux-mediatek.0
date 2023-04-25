Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8FDC6FD18
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 08:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zhSDmARWK3jKhREdryVEpo1kzcrG/J9lPlnEWmEYZtA=; b=c+IbHEWUeH3SK0
	86AgRGL0hQKV4y7DLalKvyGAcoBVxo9Jc/fBv0NZmKml7fquHSumrmWSpUYUZKV3R2aDu4pq9atcI
	2geplMHS2sUcCRf7x7SdvzC+XvFuD6SBOME9a3CwpezUPtgzfRWjW/mQBaaHbsZDE35zi1o8VPQOo
	AQYP/cr0dvOLe/81hRqaVPyg+aIwlR8I6iFHIuHO6vx0pdK6SY4EzT//6u8YNSQG2JuDstO94KgjA
	LvLJLb1ozAY+ZAOLjKTqg+eSzYLN+NPPl7SkwzRMTSiKAqQxGQPEmAPdFbJbVckQxrZ2ql+LHgCwb
	eKb9Jp78tGzEIbNvYYeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prE6x-000X4P-25;
	Tue, 25 Apr 2023 08:33:19 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prE4m-000VMK-0j;
	Tue, 25 Apr 2023 08:31:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zhSDmARWK3jKhREdryVEpo1kzcrG/J9lPlnEWmEYZtA=; b=Nxm/oOtblrrr5iKAvuZlngZTj0
	V69nNTOqJonOughIYb5czPiocN/AfCAr3Z8w9Q7N14GYDDcGczpyN+WJkYpyN4SBTjb0WX+EryoyU
	3dtIpDDcHsTyCHNWoX4dRw4M8UoCsKQ1E1hqdwamVbVmrQQpQDOD+2LOz0SAr88bolLwEqpxPiZMx
	x9xsWyAisCBOke+OWE0hmgrMzc4VHmHBCNy8gCu6kVyTn/V/5A3vD/slPX7j1flg5gC2tK3FyY4Hq
	BBN2IilLkEUezlU68FpLLltjdi/qNNIPTYKihP/s+t3m7Bh3T4KUfuQ7vbW52Vs4OLr1dR1tZLRzF
	r1gp250g==;
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prE4b-009Zxa-27;
	Tue, 25 Apr 2023 08:30:56 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-94f4b911570so816953966b.0;
        Tue, 25 Apr 2023 01:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682411451; x=1685003451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zhSDmARWK3jKhREdryVEpo1kzcrG/J9lPlnEWmEYZtA=;
        b=b0Cn9iBrAx9Y/MQc9dApT/Mb+Khuke3PLQx+DLda2w7yO7TrHfxjKosXEJIZq3udq2
         Y3Xu4lTFlFaf2s9fJUESiELrqMoSC1H6nLhsuk+KSN/SUSh36qMk90ABwu5MBOGzgjRW
         GA8TINC8OSr7Frby9GwROuBWoeQC9KQjDldpU1ZGNHn161Y4KVh9EuRwZ0pOX7rD2fdS
         L7bxsHZNkr2nL4Xa1JB20lkb3qeEVrc2IqcUw9vglud9IHnWwH0jby6lLWvhHyJ+2hdZ
         sIKcw+81v8PwSoHbKQkdkCXjx2okk2zNngQP0gcBbW+NvNMHP3GbR1gAPHgoAl1IxBQw
         glQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682411451; x=1685003451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zhSDmARWK3jKhREdryVEpo1kzcrG/J9lPlnEWmEYZtA=;
        b=X0n1hdWpPn7oDanGIrcmFHL+fPmPBzoOlb77NOdid1+Kvm5zJAWYFiA/WqP+kdkYke
         UOqItWio+3W7O0hMqzPCIWbg9v10XjDbtLnNkKIqLnVjkqdsqxhMNEQEKR8SxRipqiHD
         am2/h6Q2SfAuWg2PoA67lZKlykAXuC5bY9UTYY6wa8q+dOCwRDILigfUqI6TuYE97BuP
         7taYmYyx/tfl5+Pv+kQqL+6F3AmLVmgaB8xxjpRf2mZOMeVRIL0iLVHBb12JGos8vRq2
         ra3G8tfiMnEBzZYFXP6/zKhdsxfz+HY04xp5ZWoB1U3zwe0aBKQYNRYipSoLLAFrDpi7
         IvYQ==
X-Gm-Message-State: AAQBX9f4lywFonSvZETwwFKjd3StA7iHUdptx6QTu9iGZYRA5dpjyAik
	n00aUhv+fo8sTyEtzgH4UEc=
X-Google-Smtp-Source: AKy350avauxmrnYt7UbqavTFPzSEGaHeYx46xHxOTFeoHvbIj67bh5ZnlSK6IQpI8XT4eqilpC/oCA==
X-Received: by 2002:a17:906:8687:b0:94e:e1c7:31b4 with SMTP id g7-20020a170906868700b0094ee1c731b4mr12182480ejx.48.1682411451338;
        Tue, 25 Apr 2023 01:30:51 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id mc2-20020a170906eb4200b0094ca077c985sm6439028ejb.213.2023.04.25.01.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 01:30:50 -0700 (PDT)
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
Subject: [PATCH net-next 24/24] net: dsa: mt7530: run mt7530_pll_setup() only with 40 MHz XTAL
Date: Tue, 25 Apr 2023 11:29:33 +0300
Message-Id: <20230425082933.84654-25-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230425082933.84654-1-arinc.unal@arinc9.com>
References: <20230425082933.84654-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_093053_953573_8E1D76DE 
X-CRM114-Status: GOOD (  10.91  )
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

The code on mt7530_pll_setup() needs to be run only on the MT7530 switch
with a 40 MHz oscillator. Introduce a check to do this.

Link: https://github.com/BPI-SINOVOIP/BPI-R2-bsp/blob/4a5dd143f2172ec97a2872fa29c7c4cd520f45b5/linux-mt/drivers/net/ethernet/mediatek/gsw_mt7623.c#L1039
Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 62e55df273cc..e079b45fad07 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2206,7 +2206,8 @@ mt7530_setup(struct dsa_switch *ds)
 		     SYS_CTRL_PHY_RST | SYS_CTRL_SW_RST |
 		     SYS_CTRL_REG_RST);
 
-	mt7530_pll_setup(priv);
+	if (xtal == HWTRAP_XTAL_40MHZ)
+		mt7530_pll_setup(priv);
 
 	/* Lower P5 RGMII Tx driving, 8mA */
 	mt7530_write(priv, MT7530_IO_DRV_CR,
-- 
2.37.2


