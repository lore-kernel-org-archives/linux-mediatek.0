Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 089DEEB1076
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2026 15:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lc38Fn3zlBIPtaUNiDV83Wk+CmY8G7wJUmaKJGxKSus=; b=BaOV2LxEPX9SMM/FMw9+rBf4F+
	1uFEX3AqSvfYFmXOhfVQ7fACDLz7UQrz3fZpwuaeAmy5n11AYJOS1J9s/T2AFJ/cK/7nXBmSqiTKY
	7JjBWLyY5XqIJ9UfUTSULVAQa9Bmk/5jSa5D8agYoc39dzK7wR9igT0FuVjivgT8qW4fVJIKoNGo4
	zPDWGUviUv666E9xOiMCvs+TXR5XDDoShel4oN8Egr52/BCsSLqiXvgG2r2/6CqL0+TIcJdXO1qHR
	7vL8sd94Dy0K/Bg1eQgEDnvNwcZcYY7IkLKdqAzC4k/7kdV91sWi0CF/PAfLnfMHIQEb7i64+Aoud
	ynqU8d7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzNg-00000009rNZ-1kNv;
	Tue, 10 Mar 2026 15:52:24 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzNb-00000009rMa-01dU
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Mar 2026 15:52:20 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso106575445e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 08:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773157937; x=1773762737; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lc38Fn3zlBIPtaUNiDV83Wk+CmY8G7wJUmaKJGxKSus=;
        b=k2W6qmjshChXmVoc0ydjFQs0eruKZJlftbaN71hMt/Ds9Sy63ndTQut5haTepJs8zl
         Z/JPBE00egquLN9edt8+LRUX1SlJv/7qKMhw+SXXC8DfPesat3hWusAs8UwVx0mulkCZ
         pNZqUn4oV1ScsYFMYBysdExDATWVn85q5+1UM266btUmCkpK/ZDBBtdKRfWy0l9/hNfo
         GjWNqje6/9QA0ch2Bvwvm/GLzU8OGAJKpvGiEPW6d1LvAeI5mbC/EeIB2pRl5R/lR83v
         UDBQwPNg5hNUDJAcbNXBzyUF0ARUAO8SA1B3iuT3k1lRf4dTqNZMYmI8VwL8By0gQo7L
         t+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773157937; x=1773762737;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lc38Fn3zlBIPtaUNiDV83Wk+CmY8G7wJUmaKJGxKSus=;
        b=CdKDAlrckqbnthF3YGeaA9dH3EMxld05rLP4IxsGpYl+7rUwO1dhusAEBg2FDkfKGI
         dBG2M8V4Op8Ue6vao6oYh8TxEicKdCguS98W0RDaY27wy1HmDB3+7ayDz4haxFBWH83w
         8uv5SA2eWMyCfcW5zT1MQ81gshkLi0s+Km3FkQq7YzKHx+vo8bRO0BFwHJ1aOGwXMbAh
         lk7IVj0Q7ZviydUl8VmXi2ZyYCAQn4bLepJGfUZ67cY9xj2vYaU9mQ2ERumgnRFnKIyt
         2CCH/qHlzKlA5p5+0oexPIvUGemedCnVpVZ1KgFjCrNhiqeSUTd9bHqnpiSjGmRqDNNj
         70xg==
X-Forwarded-Encrypted: i=1; AJvYcCUB2flLZJbYGlDVJrrBZFMAVYLNgprJaEvrJ+UDnFyXdnrcnRg2UE8vVGne8ualMqKawk3ZCFEtOl2Ycuf5WQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx56akzKyxH7pFnw5rDbGuWG8I6GtoWNTlZoYnsxZVzFwu+obwZ
	CPPN+JW0hkb3CZ6ApyHuu157h8Bd5hrywP3xgB01D6W2KYx4dOGYcy60FoFRww==
X-Gm-Gg: ATEYQzxT0xT78NbKoakRcYwW6b/tDTkJub7BUAWnuNobBed3yAxy3HCIE+LwmA9DymY
	Z/W0BtzWhW53A3W5SIMkCOE6waLBaGhPPZIxJzq/2iUwidzkapd0Tf2iBYAEt0ulRR+MUVQENu7
	XBNUbDuOGV30U3zgj9c2WuWw2bMkNOe+1l9xKdoTMIx5y9nq7Cy2wgKnuFAnYGvf04qSRdzKalF
	la/ZSz6yRZ4/KGkYE30W35AXJ1RTc/YwxwWiOk1Uam1FD9l/v/fuV0nKkDj5i/1ZRUmRLI4jbOQ
	GO9reoZJwFt70oqL0fgutiuEyn+ki0RheEd1kaZaf4AY9pn0Kg1W4jNPctwcBczd0ZB/KkGXzRS
	UZlsLxhzQ0uBldycPTnp11liS/41b0MGmRxcWAmmPkbi+MoRKqXM3IDi6f1H27sHn+MKDYAIKbm
	Mnh0ocPmKMjAoOslSHeBimSx8DHZI/gr29KhvyJBY=
X-Received: by 2002:a05:6000:40df:b0:439:cc07:5701 with SMTP id ffacd0b85a97d-439da86f256mr28292468f8f.56.1773157936802;
        Tue, 10 Mar 2026 08:52:16 -0700 (PDT)
Received: from [127.0.1.1] ([2001:861:3201:3d10:6ff9:342f:d717:ee6d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae483desm36426630f8f.34.2026.03.10.08.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:52:16 -0700 (PDT)
From: Gary Bisson <bisson.gary@gmail.com>
Date: Tue, 10 Mar 2026 16:52:12 +0100
Subject: [PATCH] arm64: defconfig: Enable MT7921S support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-mtkdefconfig-v1-1-717eb3e6eea7@gmail.com>
X-B4-Tracking: v=1; b=H4sIACs+sGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0MD3dyS7JTUtOT8vLTMdF3TFEszI7M0IxOjZHMloJaCotS0zAqwcdG
 xtbUA4L4OYF4AAAA=
X-Change-ID: 20260310-mtkdefconfig-5d9626f242c7
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Gary Bisson <bisson.gary@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773157935; l=1129;
 i=bisson.gary@gmail.com; s=20251201; h=from:subject:message-id;
 bh=zAmOBnyEggFR5OQAvggPS4f6KRDzPg7q7H1L5xGnwP0=;
 b=1L8BUqfuGaDHO8J5p/bYLGHuQo8iUTCv5X5duPwnSfrdhMj3c5eyNcC6HhORXu1n0HAw4Tcgh
 wEZhAqGVhKnD/6xiDYOPhuYdxOG6I3Ar3vkmGntV7iqRXsY/Xxvjxg5
X-Developer-Key: i=bisson.gary@gmail.com; a=ed25519;
 pk=eaOrLwovHUZBMoLbrx+L1ppj+AH+TfgxkVhIEyrhkeE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_085219_069761_0673B612 
X-CRM114-Status: UNSURE (   8.67  )
X-CRM114-Notice: Please train this message.
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

Enable MT7921S which is the SDIO variant of the MT7921, also called
Filogic 320 [1].
This driver is now used by Tungsten510/700 platforms which are now
included upstream.

[1] https://www.mediatek.com/products/broadband-wifi/mediatek-filogic-320

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b67d5b1fc45b..d469ad15dc69 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -200,6 +200,7 @@ CONFIG_BT_HCIUART_QCA=y
 CONFIG_BT_HCIUART_MRVL=y
 CONFIG_BT_MRVL=m
 CONFIG_BT_MRVL_SDIO=m
+CONFIG_BT_MTKSDIO=m
 CONFIG_BT_QCOMSMD=m
 CONFIG_BT_NXPUART=m
 CONFIG_CFG80211=m
@@ -462,6 +463,7 @@ CONFIG_MWIFIEX_SDIO=m
 CONFIG_MWIFIEX_PCIE=m
 CONFIG_MWIFIEX_USB=m
 CONFIG_MT7921E=m
+CONFIG_MT7921S=m
 CONFIG_RSI_91X=m
 CONFIG_WL18XX=m
 CONFIG_WLCORE_SDIO=m

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260310-mtkdefconfig-5d9626f242c7

Best regards,
-- 
Gary Bisson <bisson.gary@gmail.com>


