Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D933C71136
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jun 2025 23:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O49HniDCuoXMC9eMwPqBiAeGw4w5v2Vl7zSDG8FL1hA=; b=tPvDrSbZRzIs8devbqKaQnOoRe
	thn1TsYB5p3Sl7oWahAT0iZvXqS+lcnOfpTD0lowW2IMaB5XEnlMArqkuJ5YyIZvTqRjylQW98Sae
	lrMhah1OBsOLE49z71/kB5iangLzZO0VmIxPDB8Y8s/JlWGbzmGu0jQGbN2gCzAaGqNaKnkevtDj1
	PpbzKn9Wk9mu9fPEhiIzEmGtXGdRp54YMl2ksibd2YskvJtF4zCrLJJQsAiFwEkcXyJoSEFMgOQPe
	gEKfZ6rWtPtb2Qirpnz4EAHdbbgoWVhUtHn4geh32fXKwY1TRGM5qQVSbD/Yp7vngQDIpT7+yH2pB
	jvgqgcsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVEC-0000000Bio9-0JWe;
	Wed, 11 Jun 2025 23:51:32 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPU9o-0000000BVh7-3uAQ
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Jun 2025 22:42:59 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-4067106dd56so209085b6e.3
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Jun 2025 15:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681776; x=1750286576; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O49HniDCuoXMC9eMwPqBiAeGw4w5v2Vl7zSDG8FL1hA=;
        b=w/Ili8YLO/c6NCGJEMFLBh2EFMfWG87d9nlne+tcmvZio28vWJlT3BasbT4wlRmd3l
         FzJ07zpk6bvH/LSPay6GNLA7xrnB7fdW0Nwv+X21kHo7DmUY/HOAscpU1nWHYoWUXeRf
         nQ8s1S1bA8v4yWBViP39gB53G/TezdZbXzekdoaclqahnSkeEN2xYbx0kGdkOhpQFNO8
         9RhTnDUobdnEpTFmRw6tSL2EAPcrSUEmXfAaP1E9QFgLa2aup59ykkGCiUUf6Y9JqqAN
         AfDFgqC+6y4qsBAkVMWyXUSIj2nReRQiswt+Z9YaG3GMi6v+pct9DBI3c9hVOQQPHTp7
         1Yaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681776; x=1750286576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O49HniDCuoXMC9eMwPqBiAeGw4w5v2Vl7zSDG8FL1hA=;
        b=eKrntE6aEZlWrllr8F8GBkEOUbqay5QMww/d/vQmy30DVTkiv0AH7izO3jD39NHLQb
         2kb6RW5oTXU761xKTW6ML7VL2NAlGf81XbhBi+gpbxF+eAIjaJK+mmUQTeZgZl8gBQI6
         6ANhQldaOEDs6LOq28kmcQh/NH/uhn4CV590RFN3Ih0OPTxVuAMYg9J66Yyg3G+o7MMJ
         5+PpBBSPnrk9hu5+dAjLBa2Mudu7Lk0BOlxUVZ1SeBDE88KorNK4FAcbITOS4ZnMcOQC
         PBByu7qDCt8lvB4sPSTK5pqvDo2sFPi5N75m1ZFzlmyoMdNYgflqMTs5rbAmHD1BbYLp
         +1aw==
X-Forwarded-Encrypted: i=1; AJvYcCVZGg4ZSWz+qLpLXmseE6ZLyhugNu4yYExpZDhGuSBq+ZyyA6G8rlVLMAUFHDR51wgjvxHd7iA2akHJRfTvpg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxvn/6klOccWyzU7XXBcqd3vcGD9BU3d0jsihQ5pwo1n/QSi9A4
	41o2Fu0/6iUAiGXuWBuuPnO3tblptAKTMNMPdSoyyffYlw3AHpb2C5EALrtjBKRq6Zc=
X-Gm-Gg: ASbGncu+4whK5bHFDdpLdd49oBa9OIFnY1lIrdBhveIfB5YmFSm89QZFahpKI4DR4f4
	zoiVz7myOZwqY0TRN++1eyyBnenCvHjW7sn+SvMXvvpB046GfcH49lWl/5NIoC/PjZU69P218mo
	F9XrZjl5LBNX2j+Bx5yKVrArhBq7V/mDvzhfbCJ2u+0l1pZL7+vgMboj/FI9p9HptV0VEY6WCuR
	CwAlcT5T3tIgKaV9OjjuAGynD4+y4dSsWQZWLLJpHQPtO6wVb42P/Krla7Yd6FRiStTdBmWTSIQ
	2iqQzflp2nXAB0V+9CZNdDm4q9Bme512gz6VDIj3xAQGE3LXI+PUMXs7JRlo75nJJjz1
X-Google-Smtp-Source: AGHT+IEdXlTs5BQlKqDRA2XR9le0U//SvE0Qifl3mfGztXMmWUlblRQ96qzrlkvIsB1m096LadrsCQ==
X-Received: by 2002:a05:6808:180c:b0:409:f8e:7282 with SMTP id 5614622812f47-40a65f87782mr956229b6e.5.1749681776215;
        Wed, 11 Jun 2025 15:42:56 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:55 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:12 -0500
Subject: [PATCH 20/28] iio: light: opt4060: use = { } instead of memset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-20-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1055; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=u68bZZMO/JKUz2mz6KZxBlhHkEylsEbUz83VhCyRYl4=;
 b=owGbwMvMwMV46IwC43/G/gOMp9WSGDK82DgYtDNtb2gx3z7l0jyT+eHvDe25Ny/eC02uWrn1Y
 Ct3oj9PJ6MxCwMjF4OsmCLLG4mb85L4mq/NuZExA2YQKxPYFC5OAZjIHWH2f3bdcxonrJAMav7A
 XffFu02lOFatYYFB7CF7t92HHtwV1csJuGihoZXQqzjn9qFVwQ9lw6WjTz/KejJDP9U9zPVrSVd
 FI6OcwCrLffXZi7bwHns3aafaxnuO18SbZz42r7q3SNX/4t5VaVwdlmdCG1e/YlOZNq/SJHTm1b
 6D+oXG06fdm+A7z+KTCU+oXc0f3u8ab+avuiHZGW8WcF/yQc2Kvd6bNgqbneTXPqugcUbhajePp
 EmfdwGzmsgpxSwm/ZdqT8JD1yvJaf4XW2u/8qFBW/Mx9Tn3HWZaHeLU2JRZ4bDydVbTlvcc7xlc
 pgl9PKq54uvTWCH/WaeKFt2rffq43yDVPalMb2os24pjAA==
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154256_977549_13459C20 
X-CRM114-Status: GOOD (  11.29  )
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
 drivers/iio/light/opt4060.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/light/opt4060.c b/drivers/iio/light/opt4060.c
index f4085020e03ebadb2b91db3212449db82d738ebd..3c927149bd256b392ed8d1bfa9847788981ef2f0 100644
--- a/drivers/iio/light/opt4060.c
+++ b/drivers/iio/light/opt4060.c
@@ -1083,7 +1083,7 @@ static irqreturn_t opt4060_trigger_handler(int irq, void *p)
 	struct  {
 		u32 chan[OPT4060_NUM_CHANS];
 		aligned_s64 ts;
-	} raw;
+	} raw = { };
 	int i = 0;
 	int chan, ret;
 
@@ -1091,8 +1091,6 @@ static irqreturn_t opt4060_trigger_handler(int irq, void *p)
 	if (iio_trigger_validate_own_device(idev->trig, idev))
 		opt4060_trigger_new_samples(idev);
 
-	memset(&raw, 0, sizeof(raw));
-
 	iio_for_each_active_channel(idev, chan) {
 		if (chan == OPT4060_ILLUM)
 			ret = opt4060_calc_illuminance(chip, &raw.chan[i++]);

-- 
2.43.0


