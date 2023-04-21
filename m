Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF5BC77B71
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 14:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FZ8YgUYPk1BlgEuRR44l+Fg104ZW02BZsA3SV8H37Js=; b=K15JoEz1Fp3/aB
	N/UwgGcWdS88uzt8DrUEvHBvUIvwfy57azxJ0ZwQX3mIWEXsak+dwmhiMfqo5+9UqCgyBwHq274fF
	2OdAiXPRQsdaqkPLb+aeAOOqxArsN2OUJSp75FIK7/1AktmjsPCcX0AQ3muKRwj+UyyVj2GcE7Wth
	LpiMiZmAbRsEXdbkcsBERdJZAIQxQaiTtdciFQ0VMJSqEnO4uAfNX4bCk89Y+inWcTonNFCRttkWm
	MoUfjQk2ju1mxwak2i1WLCEXVi/hzz0z/IfR8ITR+UFgrk5OymS5Dw3Xb8LKEZNArlFLTq1QysURt
	FdkFRqmyLAcp+mLC/Kkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pprvD-00B9Gt-19;
	Fri, 21 Apr 2023 14:39:37 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pprtD-00B7e2-1S;
	Fri, 21 Apr 2023 14:37:33 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5083bd8e226so2569699a12.3;
        Fri, 21 Apr 2023 07:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682087850; x=1684679850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZ8YgUYPk1BlgEuRR44l+Fg104ZW02BZsA3SV8H37Js=;
        b=U5NHcKalC4+8sMwdwp4mGjS2snuxVPW3Sugcax6GJMa+CeydeXKVqrErLFqKrDVhVN
         3uNX7HHL0dyhzkWY2Y/lc80X+qcMts66PadQIDeNLn/hvpm6un2kHwLRz14Jv0JX/2Vl
         lNnKIvyDaIjxleo+ixSeNoxEPUcOwNvxMJ7860/DchZ/nUQnNkMNBj4dK+bD/UQvgoRN
         bA/IB4W/AvS7ZYwFC+JWqhbFS/zwsFQyV3REmIlx356/ZbBSRPc8QOJcIup1ZLcmxcK+
         CgGqdv6/WM4RuOi1zpaFuMyrTpym1krNVMGyZl3ztXQ43Tyy6rSP1RRSOY+fVgWnP06T
         U5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682087850; x=1684679850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FZ8YgUYPk1BlgEuRR44l+Fg104ZW02BZsA3SV8H37Js=;
        b=QTn1aW/Yx7NRTtXiy9xMC4wsljKsD+dJlWp7OA9TjTBmT2eYYk+wh+sjHbyblT9Lvf
         WHix43BPevNoYeEhf5bj6TBWcm+hFyn/S9NY839XsY1p7zWxqvFYO6dcEx/PjJnMr3BW
         tEGe1YZbwRPPkBl1oHPLB8WGT0CsG/VbC58cH40VZ0ne4t/KDt6q5j6siv/bIY5ae5eQ
         Q0H/LnjX1/VUjS/2cts2rU4Jf4DAWDFC1M/yl4hJ8F2td74RDyr2AT8ailS3JblvDKtp
         G2g8DecED8fgnzAg0Lj8WG8d9jJRY4NzPNZSm1vkmL8sM9nAl3pDZZVNsPzcPt8g52t/
         BQbA==
X-Gm-Message-State: AAQBX9eO4bGxN2cJb5LO3Z/wrHPim7gnCWHcdslIIzbHoyMKulLDt6BM
	H8yOoGNWFsnJVoTUtx33z3U=
X-Google-Smtp-Source: AKy350Yn9RipJy2SbwmUEVL08A6pIXKIY+5qeS1WhOyzZ8b43mMhNv+4vGwG7GeisZVmC8rSXNgzdg==
X-Received: by 2002:a17:907:9603:b0:94e:6dc8:7ba7 with SMTP id gb3-20020a170907960300b0094e6dc87ba7mr2959685ejc.34.1682087850021;
        Fri, 21 Apr 2023 07:37:30 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id q27-20020a170906361b00b0094e1026bc66sm2168244ejb.140.2023.04.21.07.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 07:37:29 -0700 (PDT)
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
Subject: [RFC PATCH net-next 16/22] net: dsa: mt7530: move lowering port 5 RGMII driving to mt7530_setup()
Date: Fri, 21 Apr 2023 17:36:42 +0300
Message-Id: <20230421143648.87889-17-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230421143648.87889-1-arinc.unal@arinc9.com>
References: <20230421143648.87889-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_073731_755063_3E00201A 
X-CRM114-Status: GOOD (  12.44  )
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

Move lowering Tx driving of rgmii on port 5 to right before lowering of Tx
driving of trgmii on port 6 on mt7530_setup().

This way, the switch should consume less power regardless of port 5 being
used.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 029d3129bb8b..5466259fd99b 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -938,10 +938,6 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
 		/* P5 RGMII TX Clock Control: delay x */
 		mt7530_write(priv, MT7530_P5RGMIITXCR,
 			     CSR_RGMII_TXC_CFG(0x10 + tx_delay));
-
-		/* reduce P5 RGMII Tx driving, 8mA */
-		mt7530_write(priv, MT7530_IO_DRV_CR,
-			     P5_IO_CLK_DRV(1) | P5_IO_DATA_DRV(1));
 	}
 
 	mt7530_write(priv, MT7530_MHWTRAP, val);
@@ -2214,6 +2210,10 @@ mt7530_setup(struct dsa_switch *ds)
 
 	mt7530_pll_setup(priv);
 
+	/* Lower P5 RGMII Tx driving, 8mA */
+	mt7530_write(priv, MT7530_IO_DRV_CR,
+			P5_IO_CLK_DRV(1) | P5_IO_DATA_DRV(1));
+
 	/* Lower Tx driving for TRGMII path */
 	for (i = 0; i < NUM_TRGMII_CTRL; i++)
 		mt7530_write(priv, MT7530_TRGMII_TD_ODT(i),
-- 
2.37.2


