Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F984FF885A
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Apr 2026 19:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EHRklaiLJOy6i2kgynyc4q2QMlVjNfm6VGRRVM4/y14=; b=f6efV+19eaEvzcYQwgnoqZcsYD
	oZWMnhlvjSKcEZBpCNiKx9R5GhYYExEUP6pLROXdTtn44KGNDHF6F23TC0vEhZqtzU72sXUDrG6Sm
	GUGQkjqOcCvrnp4e5EmBgn/muYzJU6KEpzaX7ymvbS03Bn3JAfslHyn29V0ypAakVw4Ow1q49km3q
	0P6KjzBPBdXiQIw1N0GmXe9CsTRsK+TQDCodmvrkuL/TJ+eCPF33FtoYnvCzCiC+E/omMduUYDWdI
	DuCVPH7zz6SzYbjM8Qv/ZtkaNRqthl4bsFklFKQ59fgyhJ2kOjmSm6pPh6xmrVtY1UERGYnvNrvnI
	w5mmbbqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj2m-0000000EmbC-0t7b;
	Sat, 25 Apr 2026 19:52:00 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj2k-0000000Ema5-0w76
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Apr 2026 19:51:59 +0000
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7d4c383f2fcso7523561a34.0
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Apr 2026 12:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777146717; x=1777751517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EHRklaiLJOy6i2kgynyc4q2QMlVjNfm6VGRRVM4/y14=;
        b=qkaWjfBH0/e5A2J9DOdvLA2tAzYqXWA/JayN6q02Z9+Rr33YZJRhT+MPr3hBJ8i/FX
         VTkYnMNyi6CQa51849vs/S4X+ez38ovUu+uFLa6sXQQfPnlnw4xgsyZpy4lWPOqybtbU
         dMojnBZIBPfkkCwnSz5EBDFAwDCzdSvc/Y8PXJjQpxkWiRTL02xUUv0ci4ssDc5l2iXz
         Fj5xJgNASwlcwfJpIGpk5xoKjbebiVzKtkQljpYEq5b0yFjzUB9B7AvgMbTBQchZ3Dcv
         URbFRM7AGyIMOIibNC4buOdw/YewvqDRx/R8Q49C/Nw4FiUt+ueeueK8C4prIYhECn2e
         zq/w==
X-Forwarded-Encrypted: i=1; AFNElJ/rVbuzlkzew1zVcinqt5oGGMouUtxlkCdOhwSIJhUI1NQy5USGCEoM/BJWeX173waZyaMaLYcpzwXgXnnhgw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyqO70GpWQ/vndn1f/Kyrgoel8Ap+YJUOcM7vQ6JEfUF0Syp0v6
	SA6RGT3D1ZhNo2/PKheWcUPjXs9K3jSN1yIDlJKKEe4GCjhUYpKWJwI9
X-Gm-Gg: AeBDievwd1oJNhq+HP8niQr+as8LYERBvQCLod/BMHvltDy0ruJ2DxpUqi4kBH0IZWo
	tqTQaS/giE+BoJHcrP9y07DWyWDvApSVRnOyQtv9Up6jr7sRID2oo5xG0FiuQG8loXp19cQRiwf
	N9kAZUBRfyXA7OH6KSbXl9//3aGP1+XV1vvpPXJ49FzlOsfwQOP7VJdeXx1Mqex09Bu8hYkcbfW
	QhG3uwMadW18/hkudA6sUzput5gAUUMIBP5CXanreTX33zC1OiW9/EssgO1CB3kbfPc8tNI7H8l
	JFOXV5OhIkqbIxL8cuw1/dI879NfUhmX6gxpG35I2sFm0r5aEWn66e4Nw11v7hBy9FP8kA90UU0
	2nCVWT6KP6Lu+9kQijEFbsLYtiCA3kXoKpw7e2WWRNqS6Bzt3RRHWAIMqcn90HQYVwcaxwLiAhZ
	lcLu+xOsfTla6H0t9pCMYQJ/51OwnaiEZ1qUbag7SbdsELS//0ruf0giFxWGO7IropKU6LB32kU
	+utsC7a7kqd
X-Received: by 2002:a05:6830:388a:b0:7dc:cb67:cb67 with SMTP id 46e09a7af769-7dccb67d5f6mr18661336a34.5.1777146717535;
        Sat, 25 Apr 2026 12:51:57 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:2e29:c3c3:de27:ce76])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dcd164d2c3sm13987624a34.24.2026.04.25.12.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 12:51:56 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>,
	Javier Tia <floss@jetm.me>
Subject: [PATCH v5 19/21] wifi: mt76: mt792x: enable CNM ops for MT7927
Date: Sat, 25 Apr 2026 14:50:09 -0500
Message-ID: <20260425195011.790265-20-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260425195011.790265-1-sean.wang@kernel.org>
References: <20260425195011.790265-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_125158_262198_6476BF2D 
X-CRM114-Status: UNSURE (   9.72  )
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

From: Sean Wang <sean.wang@mediatek.com>

Enable CNM support for MT7927 so mac80211 keeps remain-on-channel callbacks
available. MT7927 needs them at runtime even when the capability is not
advertised through the normal firmware feature path.

Co-developed-by: Javier Tia <floss@jetm.me>
Signed-off-by: Javier Tia <floss@jetm.me>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt792x_core.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 152cfcca2f90..3fdcd0599ff2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -759,6 +759,13 @@ mt792x_get_offload_capability(struct device *dev, const char *fw_wm)
 	return offload_caps;
 }
 
+static bool mt792x_needs_cnm_runtime(const void *drv_data)
+{
+	const char *fw_wm = drv_data;
+
+	return fw_wm && !strcmp(fw_wm, MT7927_FIRMWARE_WM);
+}
+
 struct ieee80211_ops *
 mt792x_get_mac80211_ops(struct device *dev,
 			const struct ieee80211_ops *mac80211_ops,
@@ -772,6 +779,10 @@ mt792x_get_mac80211_ops(struct device *dev,
 		return NULL;
 
 	*fw_features = mt792x_get_offload_capability(dev, drv_data);
+
+	if (mt792x_needs_cnm_runtime(drv_data))
+		*fw_features |= MT792x_FW_CAP_CNM;
+
 	if (!(*fw_features & MT792x_FW_CAP_CNM)) {
 		ops->remain_on_channel = NULL;
 		ops->cancel_remain_on_channel = NULL;
-- 
2.43.0


