Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1EC1C71136
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jun 2025 23:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DVj0z+6x0ImArb5yGvcedbePq6HiJkWaJeSxbPqOIBs=; b=vvQ+Qj2Z7HTeWBZdqlo7yxOkIJ
	B4Roe7nDWNUY6dHQkyghQr378b2dBAnMgERdfkLdFJROwyEaCYPDZMDAMhy63zhHpV00XW6InqWC7
	u2gHozJUwJ3zBWuFp7n8CyQl81A4qLerQ8Fq/n7jHFmpsNwUiHPuU8CSyDziQqAkfi78g7+VOtWeE
	MQ2xRPeLgyFiJKcRknxXypLMRx96K1lJihqJIh9Zw7f+EhfRUjT5kcbFjJW36TSEVh53xzIaFqhyL
	hc68CyMe7ekHF1daozUvfFGVCOpyEa0ZY0ip/tath65oYxcEEvxcBSA0fjAC4P37VihZjlFafdZkd
	wokkApEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUuQ-0000000Bfxg-30E8;
	Wed, 11 Jun 2025 23:31:06 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPU9S-0000000BVRo-2NAe
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Jun 2025 22:42:35 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-407a3913049so173334b6e.2
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Jun 2025 15:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681754; x=1750286554; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DVj0z+6x0ImArb5yGvcedbePq6HiJkWaJeSxbPqOIBs=;
        b=kcOpgXnzHsk1GnDacS3bvvXUUSh4FboYd1eJkoWpHOwMb0pnNqcyo5ZKDI0w/zCx0/
         lSdit9yiPIXho0YMeyaICR8yjQf1augIPfvxA3fZDp367jxrtUsiA99252gnvuV4aV5n
         uE/yturGjnn3w09zBvnWKDLU7rNQu2hOAE+5DNKRwqYthx/WoaZ8P7ZHph5nsQYPM5Fp
         DGnIrQKUTTqEJx/b17LTpPB2k1ozEiFz1MgcvBg/53dAfwESAqKVPsN2dRLdHGCWLef2
         ee3fKGixwxE/ghikJWAzSi+yrkPopLczZpBfzFBLgJFc3SpD8NclrTJS68phCI+5I1cB
         jxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681754; x=1750286554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DVj0z+6x0ImArb5yGvcedbePq6HiJkWaJeSxbPqOIBs=;
        b=M5d77wqRvasRsi9pWxjJqI26erxnmzOygUrk9BD3X5msL1nLukp+O9LE/asw3o8NqC
         1uCx+/v9ytq7dJ6fph0FnE5mLcYr9FG3wuZcNMI8SDtK9W3XW8iCndUAoBBiZuMwUuJv
         TNXHgGqiYRpIP6cdmpIZCNvwZCWDdyQj9n66OSVMUXviCk9iPJ2nN6IZkUu1l8fDFMqF
         xy/BC5V4rKxL6KMZIAS7ZfM2/+VieZNZEpT/gTuoiEW2Dxlajgr8oSX3zx8DvVIht3sF
         r0QIetaUWjBbZsmniDa1/myVXqddTmOoEyZGqnG32YqQaxdb9ARC9GApqxBLh56GkAAP
         mtfw==
X-Forwarded-Encrypted: i=1; AJvYcCUAHQN1SQyV7N0JJkEIj0HP+f8Mz+1TJ6d8dXsrhjUML4fhfahq8Npu9uR/enplBUkr73YTUW7KsLKQSywhgw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyib5JUz9ri53G86p85oLOxPfJnjsU+YLe44LwJJ8eVrD23fReB
	tUYxox+aHl+nQCsp18M4jLa3gLLWZpab/m9hlX/dGni6+RPtYyA2QJAa3VMWZ/HFBr0=
X-Gm-Gg: ASbGncto8CQ/uxJhA1yTdIvCKRw2L0CxvIrsdAFZGYqykOrBua4jitBFA3i2lWfvMnC
	Pz6PgjArncnDufIXMWqC1ApYyDVy2eNpznJPrX5FngJfanxBG8CZARFtyYsdMV7BKS10zKJdqlD
	XFgodKPaWmidyMCOzi/YYqn1ec/l3DI6ouD9UagBH5ofiBXoiEOzYLWHHRtlq4wytb+uSZx1sFk
	h/xnOwneGu7NHR2evjuuR/zES96YSsECEdNhhUsfJeFdZ4V6UzAGyCsA7y25KF+CxGD4tgyEjF1
	Q3wWFFMB/p9EJkyOR97Akmnxi4DoywhMsG5/wEoDf1qNjw5RMoWE4NhhB8YE8FSCUbCE
X-Google-Smtp-Source: AGHT+IGDN/KHxz9Bnp8yALdHvhwtdj8HwBIeOVLJvupWPyPhdbyamlXaAmqI6CHUMik81UZ3hpwyHA==
X-Received: by 2002:a05:6808:2223:b0:403:34b3:c986 with SMTP id 5614622812f47-40a5d0b202cmr3734055b6e.17.1749681753896;
        Wed, 11 Jun 2025 15:42:33 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:32 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:00 -0500
Subject: [PATCH 08/28] iio: adc: ti-ads1015: use = { } instead of memset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-8-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=847; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=WSd14gc0IglioCpRcpapejeZeHyJEdiW3ePuDI+8374=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgW5Ygza7kmThbyisDqsWQsptmTBU8wIgMgQE
 pxnhMsh/S+JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoFuQAKCRDCzCAB/wGP
 wKntB/97ufnI2T1BvBKlrPPhGQWGDqAjoQSkW1QKpcvqm5JNUoqkex0I8noUiFjQLHt6g8Fwi0r
 VqqpMFbpUdF1MKsd5VP5Zb7DZxC2kjDp6jL041HzjfWKWjfXVH15wEqbhi9WhO8WDjGwDbAlCsC
 xF7XmULVO9O8XVbEX2VK3nCtJNrC1K8evAkSlACFG8ZzKinPcoB1k9qYzM5sU87+WFtHVkD0AZc
 Qeah+fJkaOfF+P+wux9OLYTxPFsUcmD0IHW5EsI2+Tkmo1808IBnI/YGG1DoVdGBoAdPrE3h6Cr
 QU+mELE3P/nwI+trrPO3SatKUUCLCkgwZTzH+YNm4fFPbrtC
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154234_601223_5735EB89 
X-CRM114-Status: GOOD (  10.58  )
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
 drivers/iio/adc/ti-ads1015.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
index 21181cc3bd852ba3bb05b295c98b3530d8c07d3d..48549d617e5fdc363a5ff583a2b303cc8adc9eae 100644
--- a/drivers/iio/adc/ti-ads1015.c
+++ b/drivers/iio/adc/ti-ads1015.c
@@ -450,11 +450,9 @@ static irqreturn_t ads1015_trigger_handler(int irq, void *p)
 	struct {
 		s16 chan;
 		aligned_s64 timestamp;
-	} scan;
+	} scan = { };
 	int chan, ret, res;
 
-	memset(&scan, 0, sizeof(scan));
-
 	mutex_lock(&data->lock);
 	chan = find_first_bit(indio_dev->active_scan_mask,
 			      iio_get_masklength(indio_dev));

-- 
2.43.0


