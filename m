Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B34C71135
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jun 2025 23:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0GqXAUC5ztniIogZLpwpNEvpFvqt5l5bmngIYMTHsoc=; b=srNWNmilD+iyPhlLo+WImd+nxa
	3FHATy1LkNs79+Rrt7bWVXqiECdyewluMupE3WWo7Fk4if1tQEMnp9hA/GIb+OTe6yEFjINeGMPJb
	KRKRuWz3457Z/02P+gKmoBGVL/Rk6N1gg62V0m4iFqY48kQT2wh1a6STnQQwN8wkJlMRSu6LrJdLF
	FP3rXlh+3yi14XR/oe10gXPrFSghlHSSq53Q116qN0EtlhbX5F3WWqhFudijF+3T5fmU62Z41PUq9
	s99H9e0vR090ZMPOG5cIGjvWXho0zG6iE4fsv8LfdPUs7ggikAGG0NvF4yMDgl/G65vuBrm/+BhKq
	0Ahpm3qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVEC-0000000BioU-1c3j;
	Wed, 11 Jun 2025 23:51:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPU9r-0000000BViW-3QDs
	for linux-mediatek@bombadil.infradead.org;
	Wed, 11 Jun 2025 22:42:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0GqXAUC5ztniIogZLpwpNEvpFvqt5l5bmngIYMTHsoc=; b=cbxrVe+YrB/w4DdTVyPB/bRw67
	txzEjGdsKSaZQkCR02FbNPIDRnFTmZ2QiJdm64t37bHqhnXEkvPOqOVV+b03UFBEgE52pJrjQha/u
	PZpDlf/RnHrvtUWgs16s4BbKae4xYm/edzgrzSBmyFWAjhbJW9d4X/fbzeyWjbNI1vOG/K08evxEB
	nbfm0jDR/NuQQISyXz098LrM7z9U294njHA/ykRney1Ei8ffNp1lUYWEp5jyw+IWuyafXAC31MdNq
	owyrW80oK2geRZo0MHPo5J4eh6cRRt/ynzXRdEdXeSmxBk8dg+VHCnJ129WG1z+9yfUsQWIJnEFgC
	YBryPJKw==;
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPU9p-00000002X2P-09w9
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Jun 2025 22:42:59 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-40905ae04e4so126640b6e.0
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Jun 2025 15:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681774; x=1750286574; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0GqXAUC5ztniIogZLpwpNEvpFvqt5l5bmngIYMTHsoc=;
        b=l0HjuM/dcw0eWim1TwnJk8ndjDaB4Hkn/xCoFZSLXw/RZaggZLSRrJidHpGJLnwrlo
         64OEYvrd/n4ZorqSp/b1q4nBZYzeQW9nF7Jza9lNXPVErg9ePm65izgJ3M5CcOTg6yMT
         xq6hWLtVcGi2TqjSAQsWWQefP9i0W5EQSxCv4hU3ArYuHEwoFWf2vNwFLLTbb7wM4+we
         sV6ROW1sc8Z3BDlQPq8mFxkGFQ4J8Kmxv9j6GLKfoptOPJRmi2KBlcTR46EtI6y1w1Zh
         Wl7QVJwWLi6ObF4Pm0NGN4GeVJBquvdAVMoxt/Rvbq3vfT6CbPqu4hYCqwODqX9qjcsz
         ORBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681774; x=1750286574;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0GqXAUC5ztniIogZLpwpNEvpFvqt5l5bmngIYMTHsoc=;
        b=UnHT+m/iXA8gGBp469LlI6TRaIiYprGBd8EtQoZHuqTbySSc6aryxfpNLpE/siovmE
         BTfIcdHR70JEDoRYYg8+pBzh2xq5YjqKxIM70NmonjTdhvB+NcgB50UVtV/vIJj771S1
         hqyFWNzcMf2Anf0WonTMzTLzRNWh/k7A53xwGB2LQ5W4Dk9sFkvJSKrGPcOmtz3B7Bp1
         acbDyAXpKDEC2t9nj7+Miz0sWOT9hiVxtychE4qg+Ay9yR0VBdIAPsDFcAZO6ZTGE/WK
         qPXe/OhM/6SMtvzadoIiemba+9AelupOJSdBzWsPeB+thUKX/BjBcbupUOmM8dPeVQs+
         IViw==
X-Forwarded-Encrypted: i=1; AJvYcCXjfmn0OldRR/SCLegzlKNVhRHE53V9HqO2h4JRqby9g3NIHyTFLuxMjipQ3vMh2+QiXSu/Twzf0BSImxobvw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyeO1V2t/7T3DH9RZXPZ5a03vDyi22lMP50xyYOaWOpZ4oNQVAm
	0qDHF7ebHLyfxMPh9OcEBWhlzF+9mRswBUpb1Sc/Xrl0PJ1hvnzG4pmqol8kJs21zBQ=
X-Gm-Gg: ASbGncsPvA+tam9R61LLK4Vhvfth74QIfrBC/+loSMbTLwm780TfljV8zw9PexGfCbq
	ROAW3sD+3C4SKgfdaLIvDL9nQmPqqXxdhDgIpytM4FNPzV2jqpEPNoWj5GGXmzpLuZYXPlHhOPP
	WIcxOEwbNTsrBbNl+IA3jVeU6oxxmjdCHjTNJkbytjwvsYzecUSUfDK92Fx+YpUino38p4sDh++
	YJvUApMWpF3t+MsJml5LXFc1+j7/sEQP8gVo7h7h+43wvXiidVfH1GbBOm1BjDodPT0NToY0PpC
	tGNzRqzJSFGTblioYpkL44KC7qdX7tv1OEaeqduR3NqA73vYUg3TmATxBVaDwxtUiiG+
X-Google-Smtp-Source: AGHT+IEno7iivJ7V9DJ4jS9BfN9qMtC3Kbpn1hoqPd/0X7I8V1hxaDUFP1SUYvG7cJTjWfN6V3+JZg==
X-Received: by 2002:a05:6808:1a10:b0:406:6fd3:ff13 with SMTP id 5614622812f47-40a5d127d4amr3587773b6e.25.1749681774060;
        Wed, 11 Jun 2025 15:42:54 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:53 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:11 -0500
Subject: [PATCH 19/28] iio: light: ltr501: use = { } instead of memset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-19-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=912; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=gCWBhc3n+k0rOzdOzNEkxMDkk/9qdZ4NyBLN5i838X4=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgYBVhD9q4Dm7oGQ6HylErBkZw8NPS9LtGnpg
 QcqtFQcxeCJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoGAQAKCRDCzCAB/wGP
 wNsdCACOa3y5zsZO5jRJ6TXkHQFX74S3Nr/9bVgpmLdGxld4Z+7+JIvhiis7hU/SPgSfaXy1HEh
 ktDMqm+R/k9m6uW1HuOC7FUOZJLVTDEKAKUxRNRhp4bfH2LUFh/G/3GgfwO9f8PoXq/NmULXpda
 7A1aG/YSYU2eMZZHKx2FjIlroUI+Q0DIRxoJJRuaC+0ZUZnQcDdRFGU+SUR6ZUAwal16z0jOcSF
 j9VebgtqFrmJs6emiKebaukDj4wXBej4ZpE+d+H8FqpWL6gldFBpIJFLejRYOTZaFfnP4LO0Eri
 JrZp1IDGBtR97RjR801xEzHW4QUVCM5l/UjRUFcCLscdfHuy
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_234257_347234_33B2BC2A 
X-CRM114-Status: GOOD (  11.20  )
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
 drivers/iio/light/ltr501.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
index db0cc3642bd8010358de8515c24337d7385bce38..c14767472fbe8620ad59c8417d2ceff14f9485a6 100644
--- a/drivers/iio/light/ltr501.c
+++ b/drivers/iio/light/ltr501.c
@@ -1279,14 +1279,12 @@ static irqreturn_t ltr501_trigger_handler(int irq, void *p)
 	struct {
 		u16 channels[3];
 		aligned_s64 ts;
-	} scan;
+	} scan = { };
 	__le16 als_buf[2];
 	u8 mask = 0;
 	int j = 0;
 	int ret, psdata;
 
-	memset(&scan, 0, sizeof(scan));
-
 	/* figure out which data needs to be ready */
 	if (test_bit(0, indio_dev->active_scan_mask) ||
 	    test_bit(1, indio_dev->active_scan_mask))

-- 
2.43.0


