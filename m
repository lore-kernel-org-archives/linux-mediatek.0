Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A10C7618E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 14:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DnhLc2FNX94+xwHWTwQbzfts7CiDXWRNDdKOnOqCup4=; b=G/9MVcH6+oozuL
	WxRxBP8/4gSVDVU8cjZ39im2kcm8FZxWc6QE5OrZgCsincJ9RJAThXJ8lTKDDClHsBTgLMaG7VFAO
	LZh1w6KfUinmDU6eMz/IzCEZX/9hoVgA2isgNtMmjiRCjCafF7T5sH2E1CQXyE+nyV68AQcuWgfZO
	NoGRwre/WCYJ/eRJVyMXH7adymOtELGrTn4Pkck/tZNxjAh8oClngonHkBsHF7HkjO81Cr15K1WAV
	Me+QMhonDe4YuW9c7fh3nF7gvKyvpx71GswiWsC0fp2CpeIAYBGzuv5Hv8hnfUaky3GiYpdvcZZnl
	5n78o4BPH9aeH1tHEGwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pprtR-00B7q7-0p;
	Fri, 21 Apr 2023 14:37:45 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pprsq-00B7Ov-0l;
	Fri, 21 Apr 2023 14:37:09 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9505214c47fso288241266b.1;
        Fri, 21 Apr 2023 07:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682087826; x=1684679826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DnhLc2FNX94+xwHWTwQbzfts7CiDXWRNDdKOnOqCup4=;
        b=ZfplyYY8FBBsOYOz/1YZN5onQ7ZolL5O8v8pYM0BkG79g3XCnEc0ii9N2n+Swi7ZCp
         JG2MDFq3850J8mhyqBuLlLqlylW3jYjVgrenC1kNRL10/sMeF7TfAnl15iRRakJGQucA
         9qqoaxGkk5PqT15iI1IxUGTt3GDyIsYobss2f0KXQYr2zR2h2Deq/TA0YykhXe7doJSX
         vqZTXq42eVbNh91sxsRsN0MZbwL0JSL9hoz4HKbz2fOu/PuJ5cH5aP5XN392g/lX2a7u
         n1pKXrKaZTgmJ0AEmySAxEnYhiWz4VQrumuirOmrqXra5KcfFB4NXcU/iuhTS3kNNpTe
         0oBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682087826; x=1684679826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DnhLc2FNX94+xwHWTwQbzfts7CiDXWRNDdKOnOqCup4=;
        b=i5hFy0LvbPiSor4ell2OIiMHHOUMPP2B9a4obLwITp4M8uVnYXL31dxi7gtdkG9CD8
         h1hfSON6lrpGydeqWw43YHZekCy124f7IBYYvgkDitCr2XeCMuOvruKg01gE9wFxj48d
         Ne+schUIb1pUTSlHwy0XWRZBt9YFvO2lpNDofy8z7yHvSAW3bNzw5iupBMpM8qHd90WK
         Fv91p2S2C+l3wU09ytAZ2lHpKtNvU7XwSBN09oStR7wWeIlo2k4kdyI1ejWPWew9qxD/
         lbnUIw0C1lBmBQBLjt7elX+E7Zj4ANUWGUimFdGdW6Y2C0BUlKEctb4ztNjJArPjK0Ui
         oP2A==
X-Gm-Message-State: AAQBX9d2GKNiTNg3Bof1FxhOdylJ8dMc0DC50o96fvpbN7gdelJ70c12
	IlA8v8NeKZblVA+cwMrUJ/s=
X-Google-Smtp-Source: AKy350ZqzYQrqGoBR9DHsnACsf12BT62R4GZLXzYkBwQJ6WLs1oUkD7PNNKFL264rZDENkDoVbhmNw==
X-Received: by 2002:a17:906:8993:b0:94e:fe0f:b2be with SMTP id gg19-20020a170906899300b0094efe0fb2bemr2213016ejc.14.1682087825965;
        Fri, 21 Apr 2023 07:37:05 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id q27-20020a170906361b00b0094e1026bc66sm2168244ejb.140.2023.04.21.07.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 07:37:05 -0700 (PDT)
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
Subject: [RFC PATCH net-next 05/22] net: dsa: mt7530: read XTAL value from correct register
Date: Fri, 21 Apr 2023 17:36:31 +0300
Message-Id: <20230421143648.87889-6-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230421143648.87889-1-arinc.unal@arinc9.com>
References: <20230421143648.87889-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_073708_309406_690706D4 
X-CRM114-Status: GOOD (  13.52  )
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

On commit 7ef6f6f8d237 ("net: dsa: mt7530: Add MT7621 TRGMII mode support")
bit mask macros were added under the MT7530_HWTRAP register to read the
crystal frequency. However, the value given to the xtal variable on
mt7530_pad_clk_setup() is read from the MT7530_MHWTRAP register instead.

It doesn't seem to matter as my testing on MCM and standalone MT7530 shows
the value is correctly read from both registers but change it anyway.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index e956ffa1eea8..30553044d4b7 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -406,7 +406,7 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
 	struct mt7530_priv *priv = ds->priv;
 	u32 ncpo1, ssc_delta, trgint, xtal;
 
-	xtal = mt7530_read(priv, MT7530_MHWTRAP) & HWTRAP_XTAL_MASK;
+	xtal = mt7530_read(priv, MT7530_HWTRAP) & HWTRAP_XTAL_MASK;
 
 	if (xtal == HWTRAP_XTAL_20MHZ) {
 		dev_err(priv->dev,
-- 
2.37.2


