Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20702CA101F
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Sep 2025 07:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a7pQfDGCPblKxfSBCBsu+k2H7lASoalxBm+PQPOef3U=; b=b+NCh95gPxBWVC28Mb394Bv91s
	NcryclL+z44p8ysNuix+1zqQ8UgoQe6mxSe8C601vQ5V4Z7cPes3U8iW9nihwIbNZ56uji88wvZJY
	JmSxjxRTxb9nVbTJx98ytG0r2FKAQ7QJyV0PI+uXSASinNumE4S5yEJeXxJSHG6Koy95HX5lMZpBb
	4s6o3SMVYdYgpMeT0FoOphyvl9qrFgfLao1zyx/xceedP8zWLkaMbGrZkfR2zhu8ycaXzUMFlKGHz
	fQx/BSU4/Nfs+Gm2XydcaVfzHImGlbDuIbn4fnJ/YzzHGGlm5MGzpPuDawNQlHxP8jdxnwu4K2CTo
	Z2tEbU7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF0j-0000000CRAD-2s2H;
	Wed, 10 Sep 2025 07:12:57 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF0f-0000000CR22-2vzO
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Sep 2025 07:12:55 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45de6490e74so28897155e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Sep 2025 00:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757488372; x=1758093172; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a7pQfDGCPblKxfSBCBsu+k2H7lASoalxBm+PQPOef3U=;
        b=DZZ0b1yKigZNyczdfxVO0fTaL2n0LzsCB1XPx74eiLwuVGc7tTMjM6F5J06I/B3Sjk
         CpjolOpI4vnD0SQcNs/dOIwLGpB6WPZg1T6NXsPcCUL7VuFp2tUwymb0/E0d2Pu2AmVG
         hWi/wfRer6mGNAD+0LJmUqN2aiAQRSeKeNKpEZ9lc0rbAh00CPrUI5QwlDmq6sISotVI
         /6Ma3rzt82GhPAdOM0NvnBRdJkgeCD2LU5O3o8pTEvH21YHwxzfynb+Qs83C2Cgdv0ye
         sfEChfXrGYjyPiUlIszdIApId+ZYsyyf9PjK8pjXK5LAZpwyt4puQMs5zc6Izmyflbty
         0GAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488372; x=1758093172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a7pQfDGCPblKxfSBCBsu+k2H7lASoalxBm+PQPOef3U=;
        b=YkrKiSiUNZn9ca7qZtkIf2wz3kTzYnyf1ZwihtOsKfUyVvuxiALUOCj0THyt6UwfDO
         j7/31bYUBM+ziuYQoo/+XsWn1I/br0TBeDIhrwG65V9lrn+x7p8rJJTit6zPDsLd3pb9
         43f381efQqM6tYoRpTTraIrJb2XJTif9rK0eUGjMj5AVqHs9zTCqBIN0LduucOJ+wgnu
         6i59Qv/ekGKK+xXb/+YciaYI//JdfhJMT5u2TkWvB/jPR0IJC4pLdy2Uu5WXpy6ib1DO
         fplYCGBOl7N8F35xk7v8Eb0z6SaMkuO0edZD79CB2EQpIl4mx9EceiVtdxYLgpp5aNoE
         VO1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXyFyFv5GeQEipp6VGjP1/x8WesBrpE2hojsdN4nkS30mvVIFMnhIqA76xF5VLDtAH5YYkigRyIHIr+RRvmew==@lists.infradead.org
X-Gm-Message-State: AOJu0YytVhGRlmjCxu7/lElUX3XFJ6SC92m19Yw5sBrrYxliafxXyrex
	1P2ZvGp3sc9NNDv1J7haOgwdi0ILefdjyP1/vV0FkiBDiovtXGwzCsLv664xeXhqlo4=
X-Gm-Gg: ASbGncu7gmSUiaGmMhyDPTwh4sEJNA/TFXnPcSzetCVt6S/Ve5ScDtnN0N8Ode8ocG4
	BU6L4YBxRnpBUcJFOubk5WUFWQmtEVhgtVLG8mc17RIoRY4bqF7jJKI81rUZo/PV1UawUb88oI5
	pQ1cEEwrYPYiXxK+LsgXN1tcc6wZHo8Gt2gHefoYDApI0XeYE3s99avZLfa6g+2AJtphuEECTPJ
	O0ET4Af6xWtEcjdr2mGkERcC0GJvvcd/vSD53BCfOCR8oSis5Dy6czmpGs84wIQbw6HxDqUWGIJ
	1eWTHwlGbixObs/JLfVuB6vZr0T2OVPwzlr5zDQYV1AVISo3dp+dyJGjb9+0mud6ao01VobyCCi
	rjA6CVUTERVIfZAYo
X-Google-Smtp-Source: AGHT+IEKdyheRTbxpZeobOaj/kiQcyqSdEjwXl91ot4Pp3gVY+W0lJCPHtV2Imjqq20EGU/uJIPCgg==
X-Received: by 2002:a05:600c:3103:b0:45b:9a46:69e9 with SMTP id 5b1f17b1804b1-45dddeeaa9emr137392025e9.31.1757488371739;
        Wed, 10 Sep 2025 00:12:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d20d2sm16357035e9.8.2025.09.10.00.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:12:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:12:37 +0200
Subject: [PATCH v2 01/15] gpio: loongson1: allow building the module with
 COMPILE_TEST enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-gpio-mmio-gpio-conv-part4-v2-1-f3d1a4c57124@linaro.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
 Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=739;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=iZ4PlFFkHvr3VSD1LivXtszs5JdORDU8d2OKjqzKoYc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSTsAuSSpb/N/lpm/J9TyMpn18U4V/mrLLrDe
 Nb4aV9WcKKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEk7AAKCRARpy6gFHHX
 coJID/9hXOYitzKUXEqsQTqE5rBhujI/Occo7tHWgfIzIoAYIrcKEjGZOM/F/dZQvTTO3crZcoi
 suPbR7zuB+Jwaigt114BA9+7sQ/fsomvdtZfhpDTuvsoC2hy+nvFaqVB3/AbtBU/Nm++6/6lC/N
 I3tHd2uMu6qHDBuZBcppNKNG4SbEq0JKpYwTu+MnLMEwtc0N+6h53H/41eGbZq5dZPBZO1Rs1UR
 DnsfU3NyzIvVPnS/UCPKV9yNJQLf+rM4PJxRp8cAsk8sEbncOdYImG/068XM06CPN+DGmmXrkGA
 fYhey5N4vrqvCWZh8TxID78/CdJfbkmeFDRgMDyP3mhtvARDEKEA+AKrlDBZHa0RpwxBbvvWCho
 gvUvkB9GZhfkiX2JmGAZIOs2nOEWqUor9AfytBA2we9xDvE13Ah2As+XI7cozQfLrc458cUOiA/
 PnhYb3BR9BG5uQD8C9Nard7cUzzMB65mag1/chlPkkKo3QnsuHfH4DibdeO3gne/qRwL3RvcyVA
 h4K4xVvknUUR3yUuq93JVa8I5Ld6yvsffOcFkmBa9Dig+3SRyhmk6pO1BvmfiVLl5SBTRO+1oQ5
 T2/6+Bnqw+ctTLXI3lmM5qPef07X9J86lhVm1+uhfTnzHoCWhndRZdVqNsXDBDWTKhjK4nd6OrJ
 h0UFM4WxGx3TqIg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_001253_774129_98BE26C3 
X-CRM114-Status: GOOD (  12.01  )
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

Increase build coverage by allowing the module to be built with
COMPILE_TEST=y.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 31f8bab4b09df1640c892f4d839860edaa2ad6a3..09cb144f076661e0a2069016175d0692257fb156 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -885,7 +885,7 @@ config GPIO_ZYNQMP_MODEPIN
 
 config GPIO_LOONGSON1
 	tristate "Loongson1 GPIO support"
-	depends on MACH_LOONGSON32
+	depends on MACH_LOONGSON32 || COMPILE_TEST
 	select GPIO_GENERIC
 	help
 	  Say Y or M here to support GPIO on Loongson1 SoCs.

-- 
2.48.1


