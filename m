Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2157C369B2
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Apr 2025 17:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dE6SxxoVsu6bAOJzYvjRfaMyKOzoyxv/L4EKxjSDtow=; b=ZbgXM3kaTeVsJ6UtLQbLqsQZsd
	hwqERrIiVHLU4BYHk1vfS79QRcFbxQsZItcRbCxyrmJEOXFSLJIYUc7Z3MOwZ5auiwX3tIlwCzaFN
	ZPohz1oB5JC1yObYZdZk87+JH6wrKPKxFeER156prT7D1/ZcgVWulCWmVbdlOu02d8eyPHjGaQfpb
	G6rMbEdQ5cIdfZ6b6PLMsGOUuzO8A3XNiagmQ8+vDImy9wbaFq2Em2SrmLkPBIWKSy2moa7msQvX/
	2tB3gzei/nnxViKVuklA9FMONHBlNtoHMRy+j1Ttdc2DdH1ctO+xmV5L9pmBmz3NfczaLn5O+tJDf
	egRBn6ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5SgG-0000000DltE-2w2b;
	Thu, 17 Apr 2025 17:05:40 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5SUj-0000000Dji1-2Tx2
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Apr 2025 16:53:47 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-60219d9812bso276497eaf.0
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Apr 2025 09:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744908824; x=1745513624; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dE6SxxoVsu6bAOJzYvjRfaMyKOzoyxv/L4EKxjSDtow=;
        b=m6A/yPitWWWAPGfyVmhV00Ccf4mioNTE1r7sUSHBwEK6mLN6M6WEJmoafpMScwWUEh
         +ruWIdJMwHgN4VeVpO7pjKrAPGTzTgil0YF0biHaIWfvhqYy7hA5H0sWqQcT4Q/9dPdK
         AMYACWD1gWLZl2MeaBIfr7UTnH9C3Pa+AkG23I4YE9wqAJlAEjxVcJrBTs/tkq/nKzl0
         8RuUTJJ1APel4Bs0EbnuiG8aDugM4Pafh2TxCQtBZFKbwOOvzOYgwcWOhpFZqcf4WTt9
         8fsjdgD9zfRHuRpQsW+QWNQgRmyU8eQq/vt446QVMWR4kaO7SyntwKuzEHy/6UBS9oGa
         m9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744908824; x=1745513624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dE6SxxoVsu6bAOJzYvjRfaMyKOzoyxv/L4EKxjSDtow=;
        b=k+qZQqENFmrNuX0jpOc/Bed7wu5Y9DanAO++0rTdDwmbGkXX82dXz6UDwfIiuUwagi
         Zu3J2eOkSmbJMBVHq6aik6zBJrUmvQKFulxqTXQusRmRRtsncXLNmJVhdb6FzrZ7krvN
         AC/2iNVbML7q5WIAB+E3WE8gX3Am8XlGFipZsVnZiwjk0p3xa6jSU4ThpJT30zOWIACZ
         dQdWzgYyDdBTVeyqi7zBT222F3cnJCx8Rm63SFagzmprlpa5d1JM+EkdDJTjpbIK1pzY
         Yw+lbXK8/cAfzNSK3YgzOp46oEHI926tM1MtUnXlo+qaSYfeS1ywrZPrZl4iQ8+34l8H
         t1Xw==
X-Forwarded-Encrypted: i=1; AJvYcCUNEdEKZ7x2IwcU6j7SGzwqRrJXGKGOKChLo4qjcrY1dutHvRC80Ivosv8qYPrOCz9YldsDp7cwaNH+EPMTww==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKIP9solxgpb1uM2uPLejS3oGjy5incr7Z0NdvAk4WREbNeUBf
	hGuXyZSJXenij/JOhCP51ufNGBLDigSUEZ6KtjSeBXuFeVKgGbXStVYjkhM5d6I=
X-Gm-Gg: ASbGncskGk6Xb1IyrWYuHAcSWqQ8QLJZfUzZVTsdK+IGbUWSs4Vs1Y66jiiiCvO1ohx
	uawZFOcrHvfF+wpXpw6sSEAxqXsJUr69Pe8KSW0wyUCNLppsl2U3kWtbiYUORKKcoPvAp8g9bIG
	28pVesBSMxxLqaBHDK2Bng9oCncGSlgWr+ip1n/H9cBwekuzSiLrimqRLrZOHQL3fVIao034pK5
	UV3KfMaPvFpx8F1o14DMRrdcfEuoCIn+XiYunU+LSwoFYUFP1jeL1tnqHrxyzcc10DOsbxidU0P
	Bkhc49Ja+3+60gW+4QI98qiclc14X1RHGFNB8x00PFU7ChU=
X-Google-Smtp-Source: AGHT+IERyfliHqOpjlqcDa7ZrMu1+2ERYktZP0hnNbOKPHC3D9PzMn6Rl32Ql9yI8ux6efJekwkBJQ==
X-Received: by 2002:a05:6870:51c9:b0:2c2:3a7f:e702 with SMTP id 586e51a60fabf-2d4d2a698cdmr3439263fac.11.1744908824620;
        Thu, 17 Apr 2025 09:53:44 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5218248b7sm15812fac.47.2025.04.17.09.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 09:53:44 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 17 Apr 2025 11:52:37 -0500
Subject: [PATCH 5/8] iio: chemical: sps30: use aligned_s64 for timestamp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-iio-more-timestamp-alignment-v1-5-eafac1e22318@baylibre.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
In-Reply-To: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, 
 Tomasz Duszynski <tduszyns@gmail.com>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Andreas Klinger <ak@it-klinger.de>, 
 Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=788; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=3yOfvG8p2c/ytiXdb5sEiM+QYDtKi9bavtlkBMDyU4A=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoATH0x2omz5kJqpY0JXJ7mnTmq6wvL7fWawMYF
 Tw/lLU9/AKJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAEx9AAKCRDCzCAB/wGP
 wKMdCACE2PBpPPcevzJ6YTHViUZU0pvKAxxOAJmdKbv9y3bksVEOUfx0P2P/dY0jsWLIEXzBaDr
 5y9dHqAC7o4dmkMKsZj2Vh5HyjQUKEskgopiCeIeGcMi9Y7Q7LEwfyaSnoR9wy0UrcrESvMTHb5
 7fnFE+562x0uyC5FtFHUFXolswx8YwAwCqYXOG10SGEXfGRc3qapr13FohQ/yFIzWoRK/WCqTkk
 xT3YnJTSZ+L+6Ft/jBhKe7FA9oGDUvjJf5gBIP/yJBAuEDVk60oAwHgT2GmlAztKoFECtHnxReC
 XCzUxh/dcdtae/HvWj37osRH2cBNtm6nubyDnKWO5uRYaB7z
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_095345_645557_37B477BC 
X-CRM114-Status: GOOD (  11.25  )
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

Follow the pattern of other drivers and use aligned_s64 for the
timestamp. This will ensure that the timestamp is correctly aligned on
all architectures.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/chemical/sps30.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/chemical/sps30.c b/drivers/iio/chemical/sps30.c
index 6f4f2ba2c09d5e691df13bc11ca9e3a910d98dc8..a7888146188d09ddbf376b398ee24dab7f0e2611 100644
--- a/drivers/iio/chemical/sps30.c
+++ b/drivers/iio/chemical/sps30.c
@@ -108,7 +108,7 @@ static irqreturn_t sps30_trigger_handler(int irq, void *p)
 	int ret;
 	struct {
 		s32 data[4]; /* PM1, PM2P5, PM4, PM10 */
-		s64 ts;
+		aligned_s64 ts;
 	} scan;
 
 	mutex_lock(&state->lock);

-- 
2.43.0


