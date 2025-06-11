Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE3FC71136
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jun 2025 23:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6sYRnmDUxprHg+LgR2XosmphvKPLQ0+i+LbqXhoNfpA=; b=N+zXlHLxeSwL5zzLwXQdHSNiGc
	TAxxzp8ULGBwo2Bf4DgImECt8OCUPYL7rlGeOW09imnPAwYWeLdKJwu//T+n61Y3sHiDSyTuCxVnk
	/kRM+Ezdb2HxwAHPWgDZE+BInaY7WRXhf5T9geG12b/LnrhHN8FmDfcFoH2sGX1OzgE1BBb8qqtsB
	AoFQ5dZGMLO6hcse+vpqVLGjcAgcItPcYdT5aFLcvv/lEJh7RAaYhfosRmDRDqgLe+42ZxiGsdLeo
	EEap1CrIyViorzrS9ClJy1CzONGYg8u2DJWGrosvf+umPNpJd0OPfoevpWk4kzX1otdtrWcS4CGSA
	5K/P26vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPV0i-0000000BgbZ-0Nee;
	Wed, 11 Jun 2025 23:37:36 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPU9Y-0000000BVVv-0Nu9
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Jun 2025 22:42:41 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-4067106dd56so208953b6e.3
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Jun 2025 15:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681759; x=1750286559; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6sYRnmDUxprHg+LgR2XosmphvKPLQ0+i+LbqXhoNfpA=;
        b=GdNcbbXlrHKX45a+LtNNjghXplfRme4buV/6pkQj/ZcltuJZrOiysNqgs1zzE8rb6z
         sRcEXWtQrzbRHyGKLX5FM8vY2caKiAJS5h2+vu5guNeZxB5eDdZbulEQKu/b/z9PGUAk
         yHOn0D6Mpb43LN50ZeF6wHWx521WETE5WwutzPYdNJc1PeDh6PEZfS/O1cgtBX7OVofa
         cz+uWTJGqjxIeSL1BiiNYWB+UflRJx91ImAfBgYXIGE8K0sbZzebhHLlCn3tcbgC3kFG
         eHK5c+mmNxCcrLQjGQGfqAjPQKws+//yqQ/f+fHhuekfk5fJZqDyJ1VoH2SWpyy5Yz6m
         pUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681759; x=1750286559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6sYRnmDUxprHg+LgR2XosmphvKPLQ0+i+LbqXhoNfpA=;
        b=W+iSK+kgwozhK0zKMvV81zMjfPL9/MuP74gvW4ejPU4UKtQsA+ig/bXDxlKSLBNqP0
         9TyRHNRnaQejuqpjITWIB+/Gl6CesBJCL7MA9Jlxx7jG/esphC1jppoij9S7uOJdEavS
         h5Ku2VCF+AnQhC5ptMdz0tLTb6cOqV9eFqLsaAiM6apj9u2kyEgH/u4N7p+Vtyjyfyj7
         wSEppc+uA2QeRDHPO490FRUpamLgFpw0aTozCbncuO0TUoBe4bzNEez2pzn6Ljk1XYjF
         TnTL0QMRDiCTSrrfZMigezJvY9IGbuZw/I6t6bdGPJ/PGuFccwZ3G3HrEc9atiHsVR4L
         ul9w==
X-Forwarded-Encrypted: i=1; AJvYcCXCcQVr0ToDcZTUtnnUcLOG8jV+G7uELWG4dwXZwowJf5XxginrOdEHLbyHWfhQJS+VEtp5rfR/CITnyWBPHQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQuw3uACxMSJPTpeWVUVm9bTbkr5ejIY7qH9sffKO+Gv1xmpNB
	gdJISkxeCOcla/s7CrBG9l/nV6XfsOnZCBLVtdd9nGiReyoLUCx1UuAfE6z5Dzpvx6c=
X-Gm-Gg: ASbGncstPfHlS0ZnUn+KFwP3IzJinglFvCeMiZqd7sJCwbUA1XfmNt0ncZ7YgVkP67J
	92lHR4kPaDsXpGt4g2NsS6rxPPN2i8lfKxMrTubDZJe8rKl7farwWrSTEZJ2GwP0LLKc8RFgpGB
	80I/OIfKIIKwIr7OM1zqVJcuZrgCjzmeaSOBs3td6BAvzNSIlW5Q+BsV5GUTq0LbNgaHE6VOWnk
	QNt7TprVJ/erVo1lC3JnQaK8RMeNatvr0vnGls7ZcyWPyrMgdTbJItzcXnbU2itRSb+ovGJXEv4
	2QFT7MJXoxpTQQydvd+UzgjrFkSc18CPbmBGc6PhGWHl3L1tdJ8l4vlR3Ju0IxGWA0s088eyi6T
	uHqk=
X-Google-Smtp-Source: AGHT+IErlYL4bsSFy9ngVg9McugAmwec16wRc+73AVkKa1/aJVelh+e5fLLya/tzgRaNA/PwviOmtQ==
X-Received: by 2002:a05:6808:2213:b0:406:6dd2:5eb9 with SMTP id 5614622812f47-40a6609c56cmr824967b6e.26.1749681759456;
        Wed, 11 Jun 2025 15:42:39 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:38 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:03 -0500
Subject: [PATCH 11/28] iio: adc: ti-tsc2046: use = { } instead of memset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-11-ebb2d0a24302@baylibre.com>
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
In-Reply-To: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Francesco Dolcini <francesco@dolcini.it>, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, 
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>, 
 kernel@pengutronix.de, Oleksij Rempel <o.rempel@pengutronix.de>, 
 Roan van Dijk <roan@protonic.nl>, 
 Tomasz Duszynski <tomasz.duszynski@octakon.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Mudit Sharma <muditsharma.info@gmail.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 =?utf-8?q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, 
 Andreas Klinger <ak@it-klinger.de>, 
 Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1172; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=yBs3XS+1GgmnqB6Z/LBOG9076RbaTKgSQXFeV9Rx9Tg=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgXMR0GMvFJcokv5VGg+Ekcm/aUw3x65eQXt5
 Qau3vKbyEKJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoFzAAKCRDCzCAB/wGP
 wEqYB/0aWaPu55zIJCA1+8Yh+2nKwvk/9shr5lt8X2HMjBVuKIJBARV1Ihwlk9gBU3FIMvsGMgJ
 W4gNnxW2ahFYBRU9X6NIB7qIDdnlu9FLgIBs+7HvG5ZrFCdOT1vleHncGAZvz81Lg/RtNlspo6w
 s1e4DQd9TKIrPHH4VDXiTl3tRfJ9p25SdmwrE3UDuHM6w2LPmkgKoeJBV8Q9r3QX0867CsQZJaL
 9H8G6DUTaF7neBW/gG1OOaACNgb6ckSo1vV7pvEjTzFp78nLZuf8MaSYHl/PCQHCKhEakB8WqjH
 9f3O2YBAUgw4FjBIASvaE7wTglESbk23by+IQjvgTwOJGF9M
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154240_135882_D1F41B20 
X-CRM114-Status: GOOD (  12.15  )
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

Use { } instead of memset() to zero-initialize stack memory to simplify
the code.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ti-tsc2046.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/adc/ti-tsc2046.c b/drivers/iio/adc/ti-tsc2046.c
index c2d2aada6772aae6fc8d01c3878d6e869d413bc7..74471f08662e0291b097fcb277b8ad9cb6df200c 100644
--- a/drivers/iio/adc/ti-tsc2046.c
+++ b/drivers/iio/adc/ti-tsc2046.c
@@ -276,7 +276,7 @@ static int tsc2046_adc_read_one(struct tsc2046_adc_priv *priv, int ch_idx,
 	struct tsc2046_adc_ch_cfg *ch = &priv->ch_cfg[ch_idx];
 	unsigned int val, val_normalized = 0;
 	int ret, i, count_skip = 0, max_count;
-	struct spi_transfer xfer;
+	struct spi_transfer xfer = { };
 	struct spi_message msg;
 	u8 cmd;
 
@@ -314,7 +314,6 @@ static int tsc2046_adc_read_one(struct tsc2046_adc_priv *priv, int ch_idx,
 	/* automatically power down on last sample */
 	tx_buf[i].cmd = tsc2046_adc_get_cmd(priv, ch_idx, false);
 
-	memset(&xfer, 0, sizeof(xfer));
 	xfer.tx_buf = tx_buf;
 	xfer.rx_buf = rx_buf;
 	xfer.len = sizeof(*tx_buf) * max_count;

-- 
2.43.0


