Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FADFC7EE2D
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 12:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=50+e+zsfVv5J1BqpAiWf9C7KcKligVVxQwX0YPFvKBI=; b=5DljusV4DumGXT
	VisT44eLL+pR1CNOSx43V2754Uy1Msg9hnLLjqIXZchxwKFYsgmnG9SAOpxCKvPd8SDo2NyGrIjjO
	WRzaihYUwfEnJT8IUq6mNn/soSwXfjfrCaYAcGFDG4JdkPBT25NXY47S+rTAK2BCyuEHixWoR4Omo
	WEeHxZtKPR5g3yhNprSb9Fv2ijOfU/SmzG6G+pK43K4Uy2udcSs3Xg9urMiFV6nvBoZu2ZB5ribjd
	ycSwbrRq86YZO7vhqqKVk7WJdP2nYoBm+VnNDoALmLB1v3WgokXuWL5dUxozEom4KQKyxMPNSm2cm
	KFHd23SyQuNDj6CxZj1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q14TO-006PqE-1L;
	Mon, 22 May 2023 12:17:10 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q14T1-006PUu-1Y;
	Mon, 22 May 2023 12:16:48 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-96fd3a658eeso186902366b.1;
        Mon, 22 May 2023 05:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684757806; x=1687349806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50+e+zsfVv5J1BqpAiWf9C7KcKligVVxQwX0YPFvKBI=;
        b=sjnpuNcMC4vPuNPM5W8qAKHq8laEr0IiAs8Yv8iF7D6XCl2l39DG4sCvemNN4DXMs3
         ygsXI11bEbL4/sQHwESDh5EijbGBg0RFP7Bgk80DGY4cAwRo2iK+FiCX/ApZ+Pp5xjIH
         PoXGQ/fNfKgDR0sfgxwy/1E++kxv7CmxHSTppQ/sSAD/si0gUa4LHUf/78iNajzyzreo
         aRCWFhGX1GF6TLN/e+8vq6PeNM81ysMzgguyezsQRJ1g6kPblL8ZxH8mzUeRSvOUlbWP
         et0xQ/W7NAx3eCpXY2a52dWtedYRdKGxpOrP4dt1+TzYuTNxIoDpLv5/aKY8yyldcukJ
         ZHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684757806; x=1687349806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=50+e+zsfVv5J1BqpAiWf9C7KcKligVVxQwX0YPFvKBI=;
        b=YO6a39AaluDaEkk8dll/zUnIOK++21+IGZQKBe39ovbE9NAYj49KkOFmStVMxSsbp+
         U5yYMf9Zhbwn9+26R0oZgEnUdelKPv3k6mS1zGwtsr34uFodO2U0WLpurUo8k5hBYql2
         lmVR2zNZLSQMIMQkS3PY9SoJV1oZCzPXHBzR9mDmV1K9BMMwuRm0vAzcM5CW/I1q6j2q
         Uutd7X1FtZ22ouux0JBWBRJtS0kZKSFWnpSunzEJvjAmm13wK/mHmzfncH0/zHED6Cr2
         7ceVSl9WU0kHradQkNqVILBRYusRixp+SdX4ySgiDSl5CPKpxJnEoxuJsfCL6jqpuvc0
         pCIg==
X-Gm-Message-State: AC+VfDwdXs6XpJ8yIPtX+k7dPrPQNDtKTOGuYptcrT5W7hTThbsw7V2V
	CJrSRALvLCzapflE0zm1K+s=
X-Google-Smtp-Source: ACHHUZ4M8Me0lXeuQHSHRWp3YouOQ/LLClhxE/remDAZsXN4DblDXCqROAKiLf/beTuFQ7E/eEU2Qw==
X-Received: by 2002:a17:907:60ce:b0:96a:f21f:ab64 with SMTP id hv14-20020a17090760ce00b0096af21fab64mr8346390ejc.49.1684757806185;
        Mon, 22 May 2023 05:16:46 -0700 (PDT)
Received: from arinc9-PC.. ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id y26-20020a17090614da00b009659fed3612sm2999950ejc.24.2023.05.22.05.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 05:16:45 -0700 (PDT)
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
Subject: [PATCH net-next 20/30] net: dsa: mt7530: properly reset MT7531 switch
Date: Mon, 22 May 2023 15:15:22 +0300
Message-Id: <20230522121532.86610-21-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522121532.86610-1-arinc.unal@arinc9.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_051647_525696_A50F5EA2 
X-CRM114-Status: GOOD (  12.17  )
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

According to the document MT7531 Reference Manual for Development Board
v1.0, the SW_PHY_RST bit on the SYS_CTRL register doesn't exist for
MT7531. This is likely why forcing link-down on the MACs is necessary for
MT7531.

Therefore, do not set SW_PHY_RST on mt7531_setup().

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 0c261ef87bee..aafb7415e2ce 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2416,14 +2416,12 @@ mt7531_setup(struct dsa_switch *ds)
 	val = mt7530_read(priv, MT7531_TOP_SIG_SR);
 	priv->p5_sgmii = !!(val & PAD_DUAL_SGMII_EN);
 
-	/* all MACs must be forced link-down before sw reset */
+	/* Force link-down on all MACs before internal reset */
 	for (i = 0; i < MT7530_NUM_PORTS; i++)
 		mt7530_write(priv, MT7530_PMCR_P(i), MT7531_FORCE_LNK);
 
 	/* Reset the switch through internal reset */
-	mt7530_write(priv, MT7530_SYS_CTRL,
-		     SYS_CTRL_PHY_RST | SYS_CTRL_SW_RST |
-		     SYS_CTRL_REG_RST);
+	mt7530_write(priv, MT7530_SYS_CTRL, SYS_CTRL_SW_RST | SYS_CTRL_REG_RST);
 
 	if (!priv->p5_sgmii) {
 		mt7531_pll_setup(priv);
-- 
2.39.2


