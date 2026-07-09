Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2493EC44506
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 17:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ftx4kksthHB8P8rF6BFuSI8P+XMB3UDpz0Oz9g7bP1I=; b=PMsU2v4YSAG+5p0fjY6LOaMCGZ
	Yd2rOkbO2Mg6TqjMS23OnLY/mJt2YYn96wgGg2dAfDSbV8xG9oIi4qDXWzP/Izd5LuR+gIfAvvk1o
	STC1hjGMyznCQlfMclwk1inVsSCGrj+la6HsQxxWTlBInHBIuX7Ty6f/IvEaNYRo8AKQt/74alhvr
	bYsJY3KbcxG0l10IcyuKetp6QIKAoQ1GinSwMMmzW4A8+yn1pZhV20QWyLE8j6W0o+iOo0dzXbg94
	oK7CK4ilxDFhggrLCMdrwSN62pLZfDFXpYF/bi8eZImHgos2FOjpfO5ihA98w7IvJWzSnrxQVLEbG
	PNDB6HFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whs6k-000000034zg-0M4L;
	Thu, 09 Jul 2026 17:00:18 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whs6h-000000034x4-3U6i
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jul 2026 17:00:17 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso70536f8f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 10:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783616414; x=1784221214; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ftx4kksthHB8P8rF6BFuSI8P+XMB3UDpz0Oz9g7bP1I=;
        b=DTbokrYwyFB/c9am4LJ/3wLcJ+MmGs5AySgat2Ob2IUOjnxw20ak7OzPEDL/HLE3QV
         vaPZ2tb9/PaSARcOiVdGb5ujCyGGGAETN2pgpPp26LHYCkHnanjyHvo/5fxrkeOhJdUq
         v37h7YSlxMa+mBCyK2h3T+hngB2y7VcCBnU72JUDVGBOQcmOanEdrQvPyf06jUuv5G+S
         KWuKoRRjTvFLr7fpOPSEBy1zZneTKkP7taj2pHOk61xHoe1jm4J9oDMz8kGy34hYyoV1
         Ac2AvtueLuu4a8G8Cp6qqrDNirGGikuQY3PbkpYsEgF9gx/DRJcUYKFCCkOyRgXVmpRg
         Mgkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783616414; x=1784221214;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ftx4kksthHB8P8rF6BFuSI8P+XMB3UDpz0Oz9g7bP1I=;
        b=Byu3393gGCWMFD0sl+VBBetrAra6fyrCKbJMs6IfnZ2GK0tU90pMApB3hK7L+bgTtZ
         /o7/uY9IhhskNOufifBhZFRVgU6QKEMK9WQiq7+YXY0czCL68qgMf0UizwXNQRD3P3vB
         HX2bxPDcKnTm9hNfKCr/HTZD/DjMgSCiagQFYs/ZTjNiH1w/M3aEuxg/lk5/upB42IK9
         wLKSIp6sDg6nYszuPnh7WEPItgZdTGsZZtQt/o7qzWOgGufKWpmNB2zSiwqfy54Q23+v
         QYuFOFU2nviMsqcmyrQ7ZJhb6bOmtWV8UqU8fr635aLtIjtsSQJthqPrpfIFdKV2QAR1
         ar6g==
X-Forwarded-Encrypted: i=1; AHgh+RqS1bt1XS3tzaEEimaM9/2f9X4zspsHxYPez2uNrYoPepboLW3NoCNfy29+cig6NFHMxwUmaLzCyZcsD/c6Wg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ2uKuSA2fUIcQZ7n9p5+hiCVASiUUv2hNcwFw8hskWTKPb3Km
	KY5YYWXV+Ob5kHumA+ILcqugxiML5ZqAgsOmPzQZoKduo0Pl5FmyGMN1ojdLpbtcI6k=
X-Gm-Gg: AfdE7cmKjSMueh+B+dpGWa+u03eDnT95XKg3m7rOkwH36VSxYkzv8RAJWOVMnSmxYLU
	h/G5zkTMBBaFnyjDu9gf7dKzfrmyLxu6IAQhoLzS8WmylWJcMEj94K/kYYbQnaSqauVXFzVBEru
	UoUfGJGpxrQQGMrYI9fN+lAQ+ilwDwS+IVbhduYmasfsp17xBwt10J5mbd1U9yyL8rY1CZUSRv6
	4ZyIPFi4n+4d7ak74sWAzAvJKbLGhAmbv4hP1Y9TpfgH/Nb7FNlqsIXlV5DYyRkfACM+bmEoiCI
	7OfG9Wsdotbxb3Vj52aIOfk+1ipGxbMa26s4KL/QJZCSbT9pxsBQTYZy7ShJ+N42/jlC0P8SW7X
	64AMK6+/Q0hZ0dRA1FtK/Oy+qgTAWDTyxSTKL+LXNxJ5NbjIfME9LmEHGszAL5vEN4t0Mjn5AWD
	9hhA46GPhFMD+vojrJZbMpK96mHt7MhfU2XLkaMKpd4XiE3hwvgKfE5PqQe/lfjtvtUDW2l325Z
	sqBm45C0WW0VmM=
X-Received: by 2002:a05:6000:250d:b0:477:80fa:f474 with SMTP id ffacd0b85a97d-47df076bed7mr8665982f8f.38.1783616414070;
        Thu, 09 Jul 2026 10:00:14 -0700 (PDT)
Received: from localhost (p200300f65f47db043de98c19b374aa68.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3de9:8c19:b374:aa68])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9de1e785sm52656885f8f.8.2026.07.09.10.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:00:13 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mfd@lists.linux.dev,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 09/23] mfd: Drop unused assignment of platform_device_id driver data
Date: Thu,  9 Jul 2026 18:58:28 +0200
Message-ID: <8f219a01ab8fb705f3da3b2bff4b1228d657b3c0.1783615311.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1375; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=qaHMCDQ0wnCBevuvFZFgR8vFowOppWXNbsk1WmPicyU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqT9NHV5ayzaHMTRxZ1vJcj2e0Qsq0ixb99y703 8QmdWEAqi6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak/TRwAKCRCPgPtYfRL+ TngzB/9bn2VMOHKirYtFbVdvBGptXo3gP9q/1WjUMgg4jlikAF1mRjg2ik2hDfikend7CJM91ve q70Q/wAGS47iHurBLAuL5F9ByDCPX5cWQGQ4kDEBvqebOSC3WBIx483iad/iTQpqONljRVR7PN5 /cZ50Aun/PhGW+qYbIMVb+bDaQSwfjkaplQw0OF5a8YU+wafd6KpidbAK/81W34gpJCoJw8lOoW sYNr6M2uqqwt2Z0ROgI4YbPy4dkgDod6o/lgn8xfxOUcKLmGejaeY/3cKKEweD5tsSdG6jEnCxp 7W4F1KeRPdtXTR64Zj0tvpKocYUOp2Vk/2RBeyy6ZbGr/H15
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_100015_890721_123E35F9 
X-CRM114-Status: GOOD (  13.59  )
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

The drivers explicitly set the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop these
unused assignments

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/cros_ec_dev.c | 2 +-
 drivers/mfd/mt6397-core.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index e253c753beb6..a933cb936da6 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -375,7 +375,7 @@ static void ec_device_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_ec_id[] = {
-	{ DRV_NAME, 0 },
+	{ DRV_NAME },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_id);
diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index ea1d039477e3..7987583afc60 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -429,7 +429,7 @@ static const struct of_device_id mt6397_of_match[] = {
 MODULE_DEVICE_TABLE(of, mt6397_of_match);
 
 static const struct platform_device_id mt6397_id[] = {
-	{ "mt6397", 0 },
+	{ "mt6397" },
 	{ },
 };
 MODULE_DEVICE_TABLE(platform, mt6397_id);
-- 
2.55.0.11.g153666a7d9bb


