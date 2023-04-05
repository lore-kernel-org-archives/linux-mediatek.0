Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4DAC77B6C
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 21:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+AqGSZF4EpWmaEiD6n9MEgNnwi2D/MewQMHt7iSnW7E=; b=dk5qy38P1LsqWh
	9UI5CFcwzOQ54idUkottLObx3U94u5N+f5A5SFenha4oi+B17CCBT37jbRonoLcuPoPGVrvnDaW6h
	h7in3KrtQqVEasOaZp7utLYzfNohWnSEsXecebAVNn7dLzZmZ52fp6U1yUoOawDTUn3SKX1o42xew
	fE9zSyEz3BpKg5WxgnAo9bN7SxAdPZ65BcXVhKe0/VqSu76z4nmCItB72aHlRKl1pYB8mDdV+uoFd
	orYfSumjQMZg6VsgP+hZbDpellAs8EFWvmLUrdAMrJJE2XeRVzWU5MdFjaFsuE+Icn8UnC4c7fhfS
	z+blJwjVOOLq6lvbDjMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkAyg-005l4I-0A;
	Wed, 05 Apr 2023 21:47:38 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk9ue-005e17-0s;
	Wed, 05 Apr 2023 20:39:25 +0000
Received: by mail-wm1-x329.google.com with SMTP id o32so21576447wms.1;
        Wed, 05 Apr 2023 13:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680727161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+AqGSZF4EpWmaEiD6n9MEgNnwi2D/MewQMHt7iSnW7E=;
        b=Ek4DT1TER+RoJE0VsfQfGUf4TZgwsHm6vZmrebh0y/37TnlO2axskmRki1iM9Rg/C6
         Ncvk5XpJ9p+m5Pxi9ZZx93nP1zSEkH1wcfoRym+6Iwyhwk1L7f5tgH76DBjSQBSp8LpN
         qSb7m9Z8L7plkOCrc4oSNVnZ1za0ilyJaXvlf13x8rdgM7H+3hZ8eAI7aVAiCM4FbbFR
         91RR+0d5z4RyHnVYjsFzRUE8fJMyJ6vg/Ky8qqckTR/g/mLtr0lyUZW9zQnfWP04eTXa
         ny7uvNqjYe6xNkC5ckTfcyn/URJtijj/P8smNLm3wi4zSPb2mv1gMDrUMCF70sS6cKiv
         JOLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680727161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+AqGSZF4EpWmaEiD6n9MEgNnwi2D/MewQMHt7iSnW7E=;
        b=lmfBGiMzv8hQsZLOgWaJhy3E/mCMTXNkwX96tGGnGgKNr5lxaOCES0hPS3mH+BFHZ4
         xN1eltSaotVm/VGx9El/EduZFvoM+uYBeGmo8BXQC3xiau9UmO7Ts4vrLIZLBChp6bYw
         kynyFLcAd1IYOct7tlUSve9krIPm2AUR0F4/u5GCfbE/kr0CgDOgR+UJ/qHuoWwWuQ0O
         SUW1kRK+z0/+9Y9C2T2KLz7tYoMdAaJk4B9Wtm3t89LxOM5WMkb767oKZg3Nt09zInXI
         2NdBbbbHN5So/7Jjx5cU3uYwtBmSClSf0Ig2Sx3NyXEfbomAs8UZ7FGbAwCzbX9pmUv1
         HPRA==
X-Gm-Message-State: AAQBX9fUGLkRqLQRzgGOfY++mSg5KT4nFJ3I4BT4To3eta4G1VnoBlzT
	LNCaKZmKhRKfzUb5nPmvg/0=
X-Google-Smtp-Source: AKy350aT4FAqhfC0/9kboD0oQSivbuQDPR5durGHYt0RfNrcuqqS1szFafRfDpofNN9oqxEkHTlIZg==
X-Received: by 2002:a05:600c:284:b0:3f0:396b:8b9c with SMTP id 4-20020a05600c028400b003f0396b8b9cmr5639675wmk.9.1680727160653;
        Wed, 05 Apr 2023 13:39:20 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id p19-20020a05600c469300b003eda46d6792sm3259867wmo.32.2023.04.05.13.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 13:39:20 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
	Sean Wang <sean.wang@mediatek.com>,
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
Subject: [RFC PATCH net-next 07/12] net: dsa: mt7530: call port 6 setup from mt7530_mac_config()
Date: Wed,  5 Apr 2023 23:38:54 +0300
Message-Id: <20230405203859.391267-8-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230405203859.391267-1-arinc.unal@arinc9.com>
References: <20230405203859.391267-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_133924_311028_BFB0A928 
X-CRM114-Status: GOOD (  16.32  )
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
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, netdev@vger.kernel.org, Richard van Schagen <vschagen@cs.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

mt7530_pad_clk_setup() is called if port 6 is enabled. It used to do more
things than setting up port 6. That part was moved to more appropriate
locations, mt7530_setup() and mt7530_pll_setup().

Now that all it does is set up port 6, rename it to mt7530_setup_port6(),
and move it to a more appropriate location, under mt7530_mac_config().

Leave an empty mt7530_pad_clk_setup() to satisfy the pad_setup function
pointer.

This is the call path for setting up the ports before:

mt753x_phylink_mac_config()
-> mt753x_mac_config()
   -> mt7530_mac_config()
      -> mt7530_setup_port5()
-> mt753x_pad_setup()
   -> mt7530_pad_clk_setup()

This is after:

mt753x_phylink_mac_config()
-> mt753x_mac_config()
   -> mt7530_mac_config()
      -> mt7530_setup_port5()
      -> mt7530_setup_port6()

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index fc5428baa905..c636a888d194 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -401,7 +401,7 @@ static void mt7530_pll_setup(struct mt7530_priv *priv)
 
 /* Setup port 6 interface mode and TRGMII TX circuit */
 static int
-mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
+mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
 {
 	struct mt7530_priv *priv = ds->priv;
 	u32 ncpo1, ssc_delta, trgint, xtal;
@@ -473,6 +473,12 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
 	return 0;
 }
 
+static int
+mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
+{
+	return 0;
+}
+
 static bool mt7531_dual_sgmii_supported(struct mt7530_priv *priv)
 {
 	u32 val;
@@ -2583,12 +2589,15 @@ mt7530_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 		  phy_interface_t interface)
 {
 	struct mt7530_priv *priv = ds->priv;
+	int ret;
 
-	/* Only need to setup port5. */
-	if (port != 5)
-		return 0;
-
-	mt7530_setup_port5(priv->ds, interface);
+	if (port == 5) {
+		mt7530_setup_port5(priv->ds, interface);
+	} else if (port == 6) {
+		ret = mt7530_setup_port6(priv->ds, interface);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
-- 
2.37.2


