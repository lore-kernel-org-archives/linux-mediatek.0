Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3644F4369E
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Apr 2026 13:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KiTXMXyGgbry+1smTdjpHYLgWhcXFX/mZbw63wGDKJA=; b=1tYK4sGv8KTFnlGAP5CTqnVWHu
	gkDDw15iQOLq3fXNIvxOCsRV35E2lz18yYG/dHezqFl1YHxkxxdojNZhZXQ4NQrc+6gQ5NyOuDX1O
	QIC7RVYc0U1cFJdJ2o+SN/k2uyXYfHn/ty1Gs/9ihCWH68IkOoF1ZYlqaQH+qEZIu1bpDbIsMmxl0
	pzd2rHwGWTTwgOvbbjmLX+fO4QrWYhJcwXPaha7AtP62Dc2MuOkTwUFOMT21/EnDoeifY1jxqKKco
	jcionnmpCAfZr4+qYbXNqMeyve41icAncRlqaGnDIZ+9tBXu1U77hpDwYqZReYsDjbrYgc1Fn6MuC
	8ukfj25w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDiyq-000000044Kd-37iN;
	Fri, 17 Apr 2026 13:11:32 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDiyo-000000044Jb-2de1
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Apr 2026 13:11:31 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-48374014a77so8448355e9.3
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Apr 2026 06:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776431489; x=1777036289; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KiTXMXyGgbry+1smTdjpHYLgWhcXFX/mZbw63wGDKJA=;
        b=q4Owt7RJaTSK0Jr29zBT7PjAPCW1HAdMSAT+KPFI6KpA3/V03QfrC9ElZuDQNujpQo
         YQGd9I21NOXwRzIQK42iSSPonwzxg4kmlNKYw761RyAcwsiKgKx0QskDw1DEECcMCM0Z
         QVpMiacZ1b7Pg24sEjfEe0DvRgb8hSyWP2PFmCV5ePpGWzSlE96jFoOKDDxiMotIRuut
         tLKe1hNbECQbVBeNjyF0bzyUpHNUH+nK7F5kxivqz3oc5Yso5tfWvtFugRP6bVoOSl7z
         D/lYn5d5rQhk+7KvjHm5pZCzl9oIA2crkI4BcwXAe4lGi4M1kGLoJj/WHKo9+Gsgaxg5
         +oRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776431489; x=1777036289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KiTXMXyGgbry+1smTdjpHYLgWhcXFX/mZbw63wGDKJA=;
        b=EulP8tEK3tYqubZ/ODiECzKuAcc0M7ceCSWgiQcxeduxYGoQFA6Gs/qH2xhBHj9InX
         R0JQIS2yBCVNUyXZ9ONKIGDaZMpiM1z7uXq0dV3s6OiZiJ0rGCk0DE/Ln7CVZp1b5SfJ
         ACVN2uVdQ/tD7FTSMwFq16HkiK1C+g1M+/UBeLjFcmBhUoriKusWPTfKmIMhankx1DBk
         9Qp88d9HUoutP+SAW018RrNQC61/Mtuj0fM3Uz5CxeipDUU2dFPgx2A8c8rzNReTkEzN
         hs4I5x7y1OKzubEscKw5aExxKfvDUohfYKHd3wg9vnvFi5/Io4p0gJk5nQz4i0RrgXcZ
         HVBQ==
X-Forwarded-Encrypted: i=1; AFNElJ9k3bkwG9mr4bjolkEfflQRMsNJAwGMsbHMPjJa7t9LWvVKkUJ0IYN1QVpAhUCOnfhz3WJjkTJj4cpqwuuMxA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyVjJ9Mx50JUokIk+MmaPuoikD23VUw4HSmR6XJcXyHSEJcDs/c
	ZDQFXNkb3o2RM+Avn+4n7OMOyBEk/cVvV/FVv9eAQKay5EidO7O4ZMEEPuNnpBPOVJ8=
X-Gm-Gg: AeBDievEXNzhmBMejcXT97JPVS454/iMo2IaStyNRUY+/CBS/HeFwcCkapXYBMr4Oz3
	6b7PinfOqJwobCmtN8F9eAmtDwhxPmykOtXDewcT/H9ofEZu4rCTJhI+Ld20/AUC2XDBvTtkpJk
	53coqbFu4oO0SWOw5R0gHcmFV0C/1hSxY5GriLyuPWvg7bYdqo8XyfyK8kX/Vx2mg8s9bS0P9wk
	NwR5ilFJJ9Elhas1tiWUWgagd8U3W1CKxZK//R/ro5Prq/bad3iGfBgMZ4RuIA5Zo5XreTD5qqf
	jDPc1hJ31HtutKzbUnKwCxOCGkT+0e/n4nG38j7SEOAZcODkyR6pZfDHdrE4h959LoJARVmys1D
	uVNQfrYp9A/dgpQFawQhz/4OzoW+984JwBPkynrZebOZzk1AR+Z7POIlGPHnIXE4jlQkMw1Q6rW
	ES04tJP0jLUnek7dblSWQ5jXOt8q5EdXlyZotdA1tOJjPUn+dPLDJm/x/ztOgBl3wzfsOAGArxa
	kCxTD4GlCBJkkVo4cAjJ9wh9PwCoNfBbrI=
X-Received: by 2002:a05:600c:6297:b0:486:d76c:fa57 with SMTP id 5b1f17b1804b1-488fb77155dmr40662045e9.17.1776431488705;
        Fri, 17 Apr 2026 06:11:28 -0700 (PDT)
Received: from localhost (p200300f65f20eb08db61cfc60d8aa232.dip0.t-ipconnect.de. [2003:f6:5f20:eb08:db61:cfc6:d8a:a232])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-488fc10019bsm47077255e9.4.2026.04.17.06.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 06:11:28 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v1 3/6] Bluetooth: btmtksdio: Make use of driver data pointer in sdio_device_id
Date: Fri, 17 Apr 2026 15:10:49 +0200
Message-ID: <06f26b3e090ea52c7a2620759e91511570404ec4.1776429984.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776429984.git.u.kleine-koenig@baylibre.com>
References: <cover.1776429984.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1468; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=2l6+VruZCe2G92lMFTOG+EfNer+jq/4dC3nqnXbD9Bs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBp4jFefmfBzsGZ3kLo9zeNLh94uuX0wHZ82YrGA IzIlV9GZuaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaeIxXgAKCRCPgPtYfRL+ TqVpCACTT3vbVLQ2hxvR192QyFytoivzueoZDb7jatdZDvJrGkXY/SJpKAnv9gc7tTavtwOYXhV L7rr9SxPzSvrm3zD+tvpqyfbLoKqfGvY3AVSSl8244v/FpXMDNxScKr3vYhEkizGEik/1XdcnB3 AW8x/CqjVCy9e75Lwpx8EInxLRJZEbAfqaiX0exiAd+fe+EndihAzVbnujmTdKL8ma/h+gLj0eB mG3HY/e/6niSjndyNC/AvCXSlLgv3xR9Eg2yeDtxVe1/blvgFVPWaTjeUsEueV8dDHxLhU+f7vs T09dLoBa8K/yteXcNJ/kWIajTt4k3fRJTctpa2WxJWDTRszg
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_061130_682128_4530059F 
X-CRM114-Status: GOOD (  12.04  )
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

Recently struct sdio_device_id gained a new member to store a pointer to
driver data. Make use of that to get rid of a bunch of casts.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/bluetooth/btmtksdio.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index e986e5af51ae..ee886dcada63 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -64,11 +64,11 @@ static const struct btmtksdio_data mt7921_data = {
 
 static const struct sdio_device_id btmtksdio_table[] = {
 	{SDIO_DEVICE(SDIO_VENDOR_ID_MEDIATEK, SDIO_DEVICE_ID_MEDIATEK_MT7663),
-	 .driver_data = (kernel_ulong_t)&mt7663_data },
+	 .driver_data_ptr = &mt7663_data },
 	{SDIO_DEVICE(SDIO_VENDOR_ID_MEDIATEK, SDIO_DEVICE_ID_MEDIATEK_MT7668),
-	 .driver_data = (kernel_ulong_t)&mt7668_data },
+	 .driver_data_ptr = &mt7668_data },
 	{SDIO_DEVICE(SDIO_VENDOR_ID_MEDIATEK, SDIO_DEVICE_ID_MEDIATEK_MT7961),
-	 .driver_data = (kernel_ulong_t)&mt7921_data },
+	 .driver_data_ptr = &mt7921_data },
 	{ }	/* Terminating entry */
 };
 MODULE_DEVICE_TABLE(sdio, btmtksdio_table);
@@ -1352,7 +1352,7 @@ static int btmtksdio_probe(struct sdio_func *func,
 	if (!bdev)
 		return -ENOMEM;
 
-	bdev->data = (void *)id->driver_data;
+	bdev->data = id->driver_data_ptr;
 	if (!bdev->data)
 		return -ENODEV;
 
-- 
2.47.3


