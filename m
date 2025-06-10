Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4602EC5B552
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Jun 2025 14:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jIXq3f74XDnDymhzUWUlAdt1JYy6kAW2baobRVnYyes=; b=o8oCSyCbuAXMPqII5awP8Ln1L5
	iqenMsFuManXQaBsOAbHyIzyHGlQf2M+zZ/t8julhi1cwI8hplLTXDVgKXs9a/hEdAlpvjX7soL4t
	lSdpfgFXZIYQvZ7ywAY93SjR4zZRdd3gWrQjyZWClExZlmYrwcQQ35HJFtHBy+NUuMwa2nokz50XG
	uK8l4BHbiqpjwW1D1rzJe4fADuyT+Q9GvE0pgQhyf0JU+4ECQxKiBWw6IZl/reE9P0jDWAycRJEXj
	SrH2zhpE7qeRK0YlNCnVzuUdyvGOMXSfB0kBgH/8DMhnKtfHYljwnl8swdIeG+kOURAhZFm+HRCvC
	jKFyarVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP00W-000000078Gg-0REB;
	Tue, 10 Jun 2025 14:31:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyEx-00000006nLk-2Vyr
	for linux-mediatek@bombadil.infradead.org;
	Tue, 10 Jun 2025 12:38:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=jIXq3f74XDnDymhzUWUlAdt1JYy6kAW2baobRVnYyes=; b=beeIpKsOicYXIfbq1Cwjp9s9xy
	pho1vPLq0cUl9pfB/7G5AphqJQrVRKGMU4WsrgCDkjjjNPqSLBE85MPt6C8hc90yqd3eQF8On2fSp
	/Ol2EwI4v3wfoBcRgYI03mi9IXfLLQ1r71q4iNHPkJeZ7Usk3dSH3CbVvShg07L3hvRRkJspf/uFk
	On6Lf1me6SVP7FS5a6y3XpgPZ6NofZddix8Hvu6S9rHFpeEnV5LN7hl73KX4bWkevw/XHD23jKqt/
	+9G3uu8UFxbbJq7NEuCnhZRoplPuUM1n5zR3dJQsBtTN69aMZcqrR05SVFu+WCNvfpprOFF6NUHVL
	ld0ZMPXw==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyEv-00000001ouT-0snm
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Jun 2025 12:38:07 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a36748920cso4821907f8f.2
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Jun 2025 05:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749559083; x=1750163883; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jIXq3f74XDnDymhzUWUlAdt1JYy6kAW2baobRVnYyes=;
        b=K+SC4RvfwnckeeVUEGmLSLXEkz6yPPNtZ6YZAgfeD28l9g0Nu+DVL2kM1zX287DYQO
         oV3SU070q+oPq3ggrJE8zpMrL0/oTpGQunnavgHA5c9gLXIoxUh3u7JAK2S5oqO3A9C0
         /6BfpLi790mhFBUC+rCI3mmCw25tAe+a3EqFlhpgaO7yOa2Urwvg73RzGtCIw8moXn48
         zt9PCGtuwextYlve6RbDIEad7+0QJXLb6N7ce/Kwjp2H6zU9NdfeGEaGeURO+SZJQxQU
         qudqKByXqDH6QRksiiAl7GfjEw3d5KwbDbct7n8krr/l3ixFD7BX3qY77sCgbfi6zDLL
         /P7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559083; x=1750163883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jIXq3f74XDnDymhzUWUlAdt1JYy6kAW2baobRVnYyes=;
        b=TQYOLGXvTNM6Nfi7i4vvART+QDqBwWZNe0YOEs9lz7DtSS9JmgT9mpOW2Civ72+tmt
         nf5bb5itE/4SlNV0dIdVN81RyROMmNzcEqSx905We0gtx0AJTrceVWQ6tAhAZc+qG9H0
         3GoHFJz4agNOy7bF+AKAAOWk6+GR8eUq7QO4m96ANcQXycua5pDCBfDT2F2yBBf+KFrp
         x3ogv6Ukm6GOSPzdTqR+60v1CJnVPeoz0brc/xpTnIhlCbQYsSi0Ex+D1F1zC5/mEW12
         S01penb9lE4kxxMZD0xld3M1JeCZ51BLlDeLCgAorO6iFt9dlL0ZDLLgmEQG9WqLZjEF
         MM0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXKGd1eN3IPTIpRtGMLkdg+5PP8ujezSk2o2BKCPwjD8XFdXE3lEguaSPZ8PNpsqufBdhQa/HLvPuIQS+nK9g==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa56X59IHn24LB/uHYxuUWM1mBHRU0/op7I3OA9yBVKjboVLBu
	M2TCFZPktoMk4wBUnTQtPy2+2cEs3y42mcrNWC0oCAQb5GHkl73DcBaeNhgiVNsfTn8=
X-Gm-Gg: ASbGncujHEcrwjveZexnoRdFYsdxknZ4X3WzYM2hh0b4HbkMhsmlxkf/C3dEXI1/3cU
	S+bDv/xCFxhXkqv11DSkzy/M4aG5HN6Ffxe7epNRkEwKYrW3tT65xwldJlUFgArOCj2DEMzy2Nf
	Yy1FMM6xDuJKJlJ3wYi0bn56FLMMPgAXS34IiRF/lkj8ShC8JdKoePiBCi7O216gg2mBUKs5eE2
	o2o+4QzPY+Cc1Lqvm9bO5VudYUOMcIw+Bqlga842LVyPBv0jaO2wfbEV6nT1/DP46uGHX8/nYs+
	cY3sFgw1DUGUKaCqxpKwIt5zP9/djRf+ujWQnhIhvZgPXK49+dbOCg==
X-Google-Smtp-Source: AGHT+IF1sjJM5pofo61+rAaAFnyoyxsaF8iXln4c8GMDaLLOLPbSpt71Yyi5+rfZP7JDU4CBDRpaJw==
X-Received: by 2002:a05:6000:2485:b0:3a5:2ec5:35a3 with SMTP id ffacd0b85a97d-3a531ab6deamr14138562f8f.45.1749559082522;
        Tue, 10 Jun 2025 05:38:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45213759fb2sm142476805e9.38.2025.06.10.05.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:38:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:37:58 +0200
Subject: [PATCH 2/4] net: dsa: mt7530: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-net-v1-2-35668dd1c76f@linaro.org>
References: <20250610-gpiochip-set-rv-net-v1-0-35668dd1c76f@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-net-v1-0-35668dd1c76f@linaro.org>
To: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 "Chester A. Unal" <chester.a.unal@arinc9.com>, 
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-can@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1434;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=cOyYyWO13YQfp2ycss27bUpedNvkM8EVvpF8/6G0QtI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCcmOJqMpStYT0y///IcwrrF7vPSuHRSTtpq4
 PaUnOoEX12JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgnJgAKCRARpy6gFHHX
 cvQQEADiW3kFLxHnjktVipyS1lWqpqUs/PRamO2K7EdZ3LEa3oBKMHO7NxO4tn88n4qBcqaRdBS
 xWiPasgM+D2bAKHRiWFubXfcX8+E6kqj1TRRD0tGFRZ8bEw6jxOgvWBLbNc5l+A5Jpam4C/Cxkh
 ytgOcWU/Z8l6HLXy6qB3eD9EzoV44hQuuXTVr15H8weDtiX/TVmFRmjum+EWJv+bEfX3TJgzzeS
 524eckUNGcETJZpSp40yCGaF60AsojrvWQgCiXTQ5yOdZww7qxLekfqfkIf7r25pR0DnoW/2o1Q
 RIXgtjfzUQba3gjji8qomvm6u6O5FzPOBMPXMh/iJvMF1/e4FM0fyjfgV2bhcmR0KO7FsuTMjiJ
 Y7VbZpb/Enp2Aw6IumftClH23TsCcY0qFV4GA5LQfQ0a2s/BmWCp0zigrkmav7dn658IwwjZr4q
 ZnhQ20TD+CkDXUb0rsJDMgPW8pAXgpVc9x6bWLtriVswB67g8A1KznR3Yw589QQWzZthFUfbH+z
 zPvgoMWP1E4fIQeNgF1gpCIBbflteGr54bOzk6OCEeWcX/WmgGIvkSAos+eXzyB88RyuS2TS4fn
 QoJ6wynYzPjm3x6hE+k15YLMKVwy6Ba4BaZuC+25uTEX/eUkL/rDLKbxICdQ/52g0VTHQ1HlDIb
 UZeJjVfo1T2W6gw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_133805_336087_423A7E5B 
X-CRM114-Status: GOOD (  11.58  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/dsa/mt7530.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index df213c37b4fe6ab85fc5b01c62297a35b7b6b2ed..e5bed4237ff4c46457b46598f07b65d0daa84ae9 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2112,7 +2112,7 @@ mt7530_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	return !!(mt7530_read(priv, MT7530_LED_GPIO_DATA) & bit);
 }
 
-static void
+static int
 mt7530_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct mt7530_priv *priv = gpiochip_get_data(gc);
@@ -2122,6 +2122,8 @@ mt7530_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 		mt7530_set(priv, MT7530_LED_GPIO_DATA, bit);
 	else
 		mt7530_clear(priv, MT7530_LED_GPIO_DATA, bit);
+
+	return 0;
 }
 
 static int
@@ -2185,7 +2187,7 @@ mt7530_setup_gpio(struct mt7530_priv *priv)
 	gc->direction_input = mt7530_gpio_direction_input;
 	gc->direction_output = mt7530_gpio_direction_output;
 	gc->get = mt7530_gpio_get;
-	gc->set = mt7530_gpio_set;
+	gc->set_rv = mt7530_gpio_set;
 	gc->base = -1;
 	gc->ngpio = 15;
 	gc->can_sleep = true;

-- 
2.48.1


