Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDD9C677C4
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jun 2025 07:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qdA/ig8nlywJbkEyEpBGSWcEGO8vU+oGS07oZJY25lE=; b=WOWgmXpL/ZGnf46c+RfoXPYBEs
	L/v82Ci3AXe57c3ddvsxI/aUgEKdEij8uioJdfMTtsySw1CktRZj41uGr+otJoaoj9AL9LGgCSq6w
	zL8l9yzMt6p5BjtfGdPZxLuPJvy1kxM25xcStm8Cp/9htFlVDDb7S/52/vz6HyFgSVjp4Oyz7XBzW
	nfaHupO7GVtXEJOTxnG9yd8ag2H2fYLrL4lbOgJ8HHaevC6UYfB5RFtxyN1YiWNSX8P6S+mzlUwnM
	XqUY0W02mqY04ges391ly979Iy94xmwTv8n2TvNh0RESqDPZg18cZK8y1Cf67DYSZQ+OS8A+CDQTm
	wqU9iw7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPFod-000000095Uw-3Je6;
	Wed, 11 Jun 2025 07:24:07 +0000
Received: from mail-wr1-f47.google.com ([209.85.221.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPEjf-00000008x2c-2Gci
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Jun 2025 06:14:56 +0000
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a4e749d7b2so32890f8f.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Jun 2025 23:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622494; x=1750227294; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qdA/ig8nlywJbkEyEpBGSWcEGO8vU+oGS07oZJY25lE=;
        b=cmw1J3lmKy0U61vQPu5I51iSezuEwJWBJM3ybgctaHB/gshIDXIEtICh2TJF3FHriG
         OK0rud2db8Tgn0yE0qU8PBTWzOwkMatGtnVgrrmzbzhluKwSoRTKXZzY64wCaNQW4q+B
         zJ9fYl+J53E8//zeHpf9wYrB7Uk/sJ49dKqscYFxbIWApXLsrqjiUIhld0iLEZwKAWC9
         iNSTiYXsTmahDOWRHWGHwwChDT/sAz4BKbBWkdIJtASCtpo1IfJLRjDsMtEaJVNej7fr
         19ElWGlQbt1aYEaXuloQgabTJ5mCa8sN0oK6FXEhWZ8nmlxzlZP+ln5tXOepKsOyYBqu
         vEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622494; x=1750227294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qdA/ig8nlywJbkEyEpBGSWcEGO8vU+oGS07oZJY25lE=;
        b=NOskUrWKSQaqvrm1N6D6sbBT+tnvbuqNRabaD0nLXcc9uC5M7hkvmZeSGUBS6mMOFv
         C2C9vH4WCWy92/a8UD7ZDmkFWpo0/FVu7y6+MhXj3nwlIVCrEWQ+lnyuX6bGWnqzAMZP
         3x5YV7pPUeByFbCkSQp4TFFfsGyIMaySzCsprytk4WPx37bOjZySoYkj42i94mTbLNPC
         fal/myqgeQomEMzXd36NVYdMr9ZyLgubspTNNdNykQctT3rlIfB/d1/6f1AO2cJcPVTw
         zfKbgE/Si6HYh9t0E0vax6wokduUAakzq5ZjmcINn0RpP4oGD929i51Ps6qr/K5IBcaw
         1NPA==
X-Forwarded-Encrypted: i=1; AJvYcCUHFX98lC6ADPMmTq+smew6bH3VvVEoPX+n4dK2DRNJitNlXF8YEw42RGa7J65MqRZPxmphpQcr+tJrvXkJ/w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDwtouUmsp6GVQO+UwvlxLkyVX1IXcbRLXmJ/YnQVSg8MW1IHH
	D2kELO4p9PlCiVs61IkFIXELzCLmflkWiTKqZdvWYZCYtVibThqrciHYYL4IAQ/jwZ0=
X-Gm-Gg: ASbGncuSEZBC52NWOwdT+sAAPqWEoBPf0kguWvjZ+3qx6OVd5feDhoqhCPBn19m51jJ
	8jukKjIoQng4gXCRYPJk2NsBoJLvoyC9s86ZfyX8A8w3nqmFpjhZ1ETUWQRZqpkanfnH/Xd90UF
	fefXa/IDAaD89swaJbgN7ugt49tqZoSYvhVEWFpwTw+/d1zo8/ix7fb4pfCNtvrc8u/cc4TgZLu
	giHhbLjgC8sso9xzoIyA/mJ3hgl3DCD3TE5x4VQ/j4mWejqfXYF9c3YmgUqn1S+csVUDu7rUjRU
	rP0eZgsSzF3x24LKDhkPjoykkNZd38E4I5gS8mOJqT2W/y4OXcfXxqF1YwPDG3GnGB6R+gmvNtP
	j8FI9cOQ=
X-Google-Smtp-Source: AGHT+IENybnlsYED/rRUm4ZeUok81TSNdUCTJpLATCYwg6GXmHRKMfUyNXPeuvNv6VBY5hxJDw+sPQ==
X-Received: by 2002:a05:6000:26d3:b0:3a4:d7c7:89d1 with SMTP id ffacd0b85a97d-3a5586c5d88mr559699f8f.4.1749622493663;
        Tue, 10 Jun 2025 23:14:53 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:44 +0200
Subject: [PATCH v2 12/17] pinctrl: max77620: Move fixed assignments to
 'pinctrl_desc' definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-pinctrl-const-desc-v2-12-b11c1d650384@linaro.org>
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
In-Reply-To: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1581;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=vXeTXdr0B9QOQoZjEzmtipvrdS/pdMRjTxQFNr/h+bw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6p+iEceLfzESsCLmaF7f58gqtG4pEf1S04I
 US6TvwJJ1iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkeqQAKCRDBN2bmhouD
 1+VXEACLNTYtXHcSiimI4alyjbrbkDm6rHv4lUl4FJTdko8xkAkwphGqySFzctRNyJgI9touCTp
 VTuTb9XwzKvBv7Sz+PhDYKXWHIsu/mi6u3DQtaNf5mVdWT8Ci9eq/+0qUj6MXDgTbBNkGuWOcug
 W1RzzoY2lRp02okPqxXRdpS98elpEls0b5ltngYzUPV3D7ptB3GwD/w4KfWxqbPUw6MxHJmIIj8
 PMDrhhQxLJFw37f0hI/yWSAu85iF1aHaHs2tHxquwLzUUzZ7/+Gms5Zj21PPLjicsE7pcgtnWJk
 ssZ/fi62MsBkqreCcDTkSdnrqgpyFklT+gb+Trfwf02xAu8A8tQ/n6OEbE8tWZg8Pdu/ErxaNL1
 BUXZkKjhl1DGDjPQ5xA9nyNWyIoSHZERD/4iDV9AzInbpP7HBZEXnih1BdhaRH3Fg4uKyRkzYPY
 aha6uvVMscIWmHFwDoFIiFw4MUoXeBbT8sVDumREKH8sw96QTHnBkynPktbnQzvwQDVY6gqftFG
 o01FWQQhxZF3jkGZ0sZvaS4reNuF3D5sZ3nc3M7o85qgkCIaQN9KNG3HCbLcOWQeR5UOk5ePcpg
 6Kox4WMoTkg1O83iiImVLQssq+41bb6nolrcP48lT4q3yXb/tDPgmZdeDWExps/nYyadZXoKvlg
 Ia145EloLsO+3qQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_231455_588781_147D5EC9 
X-CRM114-Status: GOOD (  12.54  )
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

Assign 'struct pinctrl_desc' .pins, .npins and other members in
definition to make clear that number of pins is fixed and have less code
in the probe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/pinctrl-max77620.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-max77620.c b/drivers/pinctrl/pinctrl-max77620.c
index d236daa7c13ebbcaf7c4a8d1a8bed751aa111c0f..acb945a2574368b2e34659a902c34df8aad193d7 100644
--- a/drivers/pinctrl/pinctrl-max77620.c
+++ b/drivers/pinctrl/pinctrl-max77620.c
@@ -543,6 +543,10 @@ static struct pinctrl_desc max77620_pinctrl_desc = {
 	.pctlops = &max77620_pinctrl_ops,
 	.pmxops = &max77620_pinmux_ops,
 	.confops = &max77620_pinconf_ops,
+	.pins = max77620_pins_desc,
+	.npins = ARRAY_SIZE(max77620_pins_desc),
+	.num_custom_params = ARRAY_SIZE(max77620_cfg_params),
+	.custom_params = max77620_cfg_params,
 };
 
 static int max77620_pinctrl_probe(struct platform_device *pdev)
@@ -569,11 +573,6 @@ static int max77620_pinctrl_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, mpci);
 
 	max77620_pinctrl_desc.name = dev_name(&pdev->dev);
-	max77620_pinctrl_desc.pins = max77620_pins_desc;
-	max77620_pinctrl_desc.npins = ARRAY_SIZE(max77620_pins_desc);
-	max77620_pinctrl_desc.num_custom_params =
-				ARRAY_SIZE(max77620_cfg_params);
-	max77620_pinctrl_desc.custom_params = max77620_cfg_params;
 
 	for (i = 0; i < MAX77620_PIN_NUM; ++i) {
 		mpci->fps_config[i].active_fps_src = -1;

-- 
2.45.2


