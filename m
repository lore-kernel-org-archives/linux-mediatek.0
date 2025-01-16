Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D61E77188
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jan 2025 03:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5kG+kMfLfgCnFcb2MQxw7I0LDYokEdblnCGk75vkECw=; b=Q/qnozhsv5bIhEMoDdHPkg42dZ
	v0bU+A+dzOEEk8wtGtphpd+UfQL9HJNbHTC0ucZ3EnyUSXJA1mNWc9Zv/z11pyA94PTxw5emlcVml
	pHTPtuRutYeQ+k1OzQSstJ+wIEpVEfw57AuADgjsy+sWXUxRU1YO5glMrLX4RN9RVb/Il0JsdLDa+
	EviGEddLiY6NbSJfFme0Rh7IF/Wtg17v66ToUQA+IG3pd2x/lzF2708MNSfAajQm672oYu4f0Lm/p
	ZCS4qfqC9MZCte+nXB7vnXWDKKV6Bq8dB4EmJF9F1lmY+pkKVRQGh9CZQrb11W7Skv3z23EoQRDz8
	VBHw6bsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYGjl-0000000DkJk-1IqL;
	Thu, 16 Jan 2025 03:40:05 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYGhH-0000000Dk3V-3N3c
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Jan 2025 03:37:33 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21669fd5c7cso6046555ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jan 2025 19:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736998651; x=1737603451; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kG+kMfLfgCnFcb2MQxw7I0LDYokEdblnCGk75vkECw=;
        b=cmIzbiJTl0ZN7vmC/FVZjcT0uOh9aQystjaEoJRFE08hxnOsNHqggwdzwRIRKr6D8q
         h+VpWJanE8afSwJ+OpnQK6ZR/5sF35u7WMvy96+tF5yPDF0p0bGMaCkE8kVKt4INEX2u
         DIPCbNXa+72Qr+GT5gnYtj44UtawSGTtcNyI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736998651; x=1737603451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5kG+kMfLfgCnFcb2MQxw7I0LDYokEdblnCGk75vkECw=;
        b=niepFTyVIRyG4h1KdE19JGNP1PmN3JMyTcQnk8KqIeIUYNU4W4OWpCrr8tcrTV4I75
         cPjiXjGRHXAlq2cxpMwXTfNmlYgOswKm+cLI1B8iagSjvF5yrnd34nZo1+3+RZOm1qM6
         V3FBFL7viDD1dWy/+VBvmVS6teChe32gmeRbi5kgLKk7AVrqWYNKbrIAN+Lrz5QaJdks
         zvnMbc33le0NXNBNcUOESn13wGNEbEjvmfHZmuTpbHAh2C9scf0naTsJexVWPgNJSxI9
         oLERT9DrFMj12wbb16wznX+C1rgugZphiAwUOek6KQvT2jVnURTbg6aV8tRCTEs9Gop1
         nd7g==
X-Forwarded-Encrypted: i=1; AJvYcCVDHO/Oksf6YBBdhdY+CdNk20qZHvVffKPd86rIIlFqN6Xwi3DK3YcI6BzYkgV34K1hvKscXH9YhsoG21EPfQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMoQe87jZkYy9dz+iN7opws5NfvRzM/7nO5MlAurxcjMuUJOMz
	1WRh0vyALzqf3BzeKcQYK99SZonuFZGZdjJ9ncQKESdahcwrip5eoSRkzYcsrIipmJVSvU2fsyk
	GGw==
X-Gm-Gg: ASbGncsm35lVkfYpbQcGYhIqxXB07EoJBsWlPqqK1OsjndWXk4DZwAHq6jckH0mFNbC
	1e1/XHahI8ppj3Va6zrqKh+MnLCyKoa+3Kr3obZWWu8VCQOrF4Qh+Csp4Ws+LcnyVrfip+mMSe6
	Fc1FP8HKq2Uu2a5UwjcqZuDrrYRssErn9x7GiqR7hzgJ/wxq4vuyZMfwF7IstoUZRJs9uCd6ITa
	ZsTRbCLma3MDLj2/vvBPDYo5SE2QZslMuUkVqJGa2S/760lF/LQQYvtgUTPR0IGQS4X9bnCknDF
X-Google-Smtp-Source: AGHT+IFmA5Gr4C+Te1MHWaygBwDL2sH6qF905UycWpwXiB4qOSlE+Mwnqw3EiqVpy4SvZI3CVgEcIg==
X-Received: by 2002:a17:902:d4d2:b0:215:9642:4d6d with SMTP id d9443c01a7336-21a83f55157mr459471665ad.17.1736998651180;
        Wed, 15 Jan 2025 19:37:31 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:534a:ac09:3752:7758])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f2339dasm87714485ad.177.2025.01.15.19.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 19:37:30 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Douglas Anderson <dianders@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] Bluetooth: btusb: mediatek: Add err code to btusb claim iso printout
Date: Wed, 15 Jan 2025 19:36:37 -0800
Message-ID: <20250115193636.2.I5b800519fe573164417bbd14674bb811222826cd@changeid>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
In-Reply-To: <20250115193636.1.If8b655b5c6877bd9a1136ba0f1cd61cc6a4b6e9c@changeid>
References: <20250115193636.1.If8b655b5c6877bd9a1136ba0f1cd61cc6a4b6e9c@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_193731_839640_799E3BE3 
X-CRM114-Status: GOOD (  11.86  )
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

Add the error code to the message "Failed to claim iso
interface". That allows us to know which error case
usb_driver_claim_interface() hit.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/bluetooth/btusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index f69df515d668..df8889e8759b 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2649,7 +2649,7 @@ static void btusb_mtk_claim_iso_intf(struct btusb_data *data)
 	device_unlock(&btmtk_data->isopkt_intf->dev);
 	if (err < 0) {
 		btmtk_data->isopkt_intf = NULL;
-		bt_dev_err(data->hdev, "Failed to claim iso interface");
+		bt_dev_err(data->hdev, "Failed to claim iso interface: %d", err);
 		return;
 	}
 
-- 
2.48.0.rc2.279.g1de40edade-goog


