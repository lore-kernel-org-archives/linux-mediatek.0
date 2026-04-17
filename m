Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6237BF4369E
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Apr 2026 13:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4QkS3sLAmP1yQm4RdEvs3fVFr4UG0LEkh3x6qqTYVOk=; b=GlHZEO/RdazLAplOzNeFyoPFaJ
	Q+RGpG8KaCVBb6+fA5nqYfFHAjXB608bjT6MTzO2rGt8pnc47JS9iyJ47zEAQnuMOfhNwXLuedree
	hwxI8dP6oNMiK116vu43JomMTJO2ObPkDkn+LbRxIkenr4MkAyGu8ry1UYm+7tZ26I6Qcbf0JFqRS
	04KciTN7TC1ZJYiYEUu3aJU27jKErdyx0e9VtKZcw4bldZIbAZ4t+PeT3t0n0gKrjfBEEfSBRt7G5
	wWk0PweDqu5seT7Q/tQvn2fUfD/iG/kh71qj4h4Rzp3MRDjRBWDHShKke++5FFlODF2buxUlhuXcu
	WPJQsASw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDiyt-000000044Ml-4AgF;
	Fri, 17 Apr 2026 13:11:36 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDiyr-000000044KM-1vSg
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Apr 2026 13:11:35 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-48896199cbaso7220295e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Apr 2026 06:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776431492; x=1777036292; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4QkS3sLAmP1yQm4RdEvs3fVFr4UG0LEkh3x6qqTYVOk=;
        b=zfp4qy5kdvJX4EqBHAhJdnM8SqCrS9c8a3MLEO/XWC9q8mVtnMaa/sf51jOjeuWCLw
         jlRyx4iUYckhKp0RrNGR1tVJGLVpBWaZ2T7LQPIMjDVXnQFZguE8jUw0fqJpXam8A+t5
         eoMK2YLeC0Z3En+sy+1QolDkcfUFEH1fL+F4kNV+QSd3kisyko3rqX+2kUtYc1P3tMzA
         vT2AhGk5QWGsifl3qmLj5uz6ek9DrP7SgYzv+QZWEoMgOn3x9SvBU4N8R/LyqfQ6cJCj
         LtpnxprNtsFyFwcrsi4h6P5MRQ/Jpq5O9vfDnjXIgtMFpHZT1quNIRJNI14xzYdPBLXL
         BZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776431492; x=1777036292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4QkS3sLAmP1yQm4RdEvs3fVFr4UG0LEkh3x6qqTYVOk=;
        b=VRzUr/kE0nmgma7vgglGY5EpBQqH1/3bg5eCLWB703NxAlgop67Tk8a56z9kXq0co/
         E9ro3fYrGUEzIu6G9ZIqFNBOr5Kl7Zlj7jwFSNoJrh1S+/qBIWno0ZNjEfg+pzIBfW5S
         m4BHKO8K2yZIKykuEOoyP6cRxU2Qfryuu1svjiQ1d8Oo5FLc3F3WFHBCxCT9JXLaLYVf
         w6gO9E44bhI9+DukUPmhrIqmlX+GqkMl+t2BW0Nf2rCzxxkFAnggDf5ys7eFrzRDoaTV
         J+REXEZbkqYvnXE0EOEez96zjCxs18hapsU4KDHDSuGrT3V6ZlVJjtkXE1PJ5konQCRp
         1gDA==
X-Forwarded-Encrypted: i=1; AFNElJ8Aj3BMyQzSfJLLwi+iggSno4QVejfSG1Mxsg4aotDMfBuSbEzrYO5vuQ1BCPtTsbLqANNGcQzEY7k6tpvcGg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywedvx55Glr3aNeVz4/o4UgrRTTjbOUm2wCpM4EmdfM36xlFQDR
	sc5q3xfHV0cIXTYk2rEH4DWqUs3Ve/Ckl0+jTy4Q1ToV3P6+Nd26WTyJxNr2PO/cfhE=
X-Gm-Gg: AeBDievrNjTbmvPHRXTgkxeuTzriQkI7xaS1FmHKgIljAtHKn5Jx/AZSsYnlaZbykUS
	vnonZpiJneRAS/jNku31u1K3ArVJrxqWAtGqd08IuWnWIk+bPlifvlj2N656oUZo4Wt03Tdc7OA
	aC2XTfmHXfso5JcdfgSXBMCcnYJ6pT7V+LoWgO8AZC4Y4ZX7SToCOFogqF2b4eFsC+AXUyvJhP2
	WFm+5pkM7TYyjdF5z1Ud/6BDFCcX/QTy6tJD9HW50vUEc2Hx3XxVIU2QQ350pLg6YqD/jxnKbts
	meNkilwivUbvoeqGCLrJOXtGT39FaMdSDSgR/I58AvK96RLLzJjBGSHfoVmdL0Lbr7va9PK0EkO
	BBmvn1ILeeZUXnBJt8vMw3WhyfClqS6Nk8K5Cg/dPUuXb4zzbUuWm9pT67gpN4mHk6Gx6EGc6yi
	Qk7jq7sUoWJHB9CGszAxRnYIBmXHpAnC7Ug74gPz+cC8Zh14VmHjkTlKUxaQ1ZgZJjMun4G+TC3
	/YTtaP/pTAr02irrZazZjL5x8NqlNv0ngA=
X-Received: by 2002:a05:600c:c090:b0:488:9e54:94c0 with SMTP id 5b1f17b1804b1-488fb74e130mr29074175e9.8.1776431491453;
        Fri, 17 Apr 2026 06:11:31 -0700 (PDT)
Received: from localhost (p200300f65f20eb08db61cfc60d8aa232.dip0.t-ipconnect.de. [2003:f6:5f20:eb08:db61:cfc6:d8a:a232])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-488fb75af76sm16948365e9.13.2026.04.17.06.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 06:11:31 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v1 5/6] wifi: mt76: mt7921-sdio: Make use of driver data pointer in sdio_device_id
Date: Fri, 17 Apr 2026 15:10:51 +0200
Message-ID: <a6c6c5efe0716f910439026ea6f26efc6e2fe58c.1776429984.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776429984.git.u.kleine-koenig@baylibre.com>
References: <cover.1776429984.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2715; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=99pqrTeNKVIGhX8X08ShNnx6aTU/lVS+ge4kgGBnY5s=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBp4jFjhPgBeIjDZSAgsGrUVzIaAF/51tn611lA9 289Fe0ABRSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaeIxYwAKCRCPgPtYfRL+ TtocCACiFjo/eQXQbwFRG2rY8GPBYwH48Wp024nyRoqStITAWsFQz3AVUa4pD9Peymq+C1E3gqo 9EOZgF9UlMBfXt0268RDR03XVaqnkyzqRMneyxxRDbBs9zAq+q42ZMOdc/13Djg10kLb1I7TpZT 28N0AoNRk5EIoEs5Fm7cjjWC4I7YoYYvUOADvK4Oc1GPoeKf/UFyom6VNqlRTykoWb3UTFNZq3G QqbLaTKbdIE+jor5zs87/HY0geFwlP1w4jGSp/S16eW8H57HQ8lcV05kjYnfKSrVHh3JbDnzr4H WmfbEqU44OJX4RZjn8ofHu6GxEsbWGVHAMc+dpLQSiZ5UHyB
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_061133_548737_407FE522 
X-CRM114-Status: GOOD (  14.05  )
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

The pointer is declared as const, which requires the addition of another
const for mt792x_get_mac80211_ops() to make the compiler happy which is
a nice side effect.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/sdio.c | 4 ++--
 drivers/net/wireless/mediatek/mt76/mt792x.h      | 2 +-
 drivers/net/wireless/mediatek/mt76/mt792x_core.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
index 3421e53dc948..284529fe6282 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio.c
@@ -18,7 +18,7 @@
 
 static const struct sdio_device_id mt7921s_table[] = {
 	{ SDIO_DEVICE(SDIO_VENDOR_ID_MEDIATEK, 0x7901),
-		.driver_data = (kernel_ulong_t)MT7921_FIRMWARE_WM },
+		.driver_data_ptr = MT7921_FIRMWARE_WM },
 	{ }	/* Terminating entry */
 };
 
@@ -129,7 +129,7 @@ static int mt7921s_probe(struct sdio_func *func,
 	int ret;
 
 	ops = mt792x_get_mac80211_ops(&func->dev, &mt7921_ops,
-				      (void *)id->driver_data, &features);
+				      id->driver_data_ptr, &features);
 	if (!ops)
 		return -ENOMEM;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 8388638ed550..51c36ef4084e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -436,7 +436,7 @@ int mt792x_init_wiphy(struct ieee80211_hw *hw);
 struct ieee80211_ops *
 mt792x_get_mac80211_ops(struct device *dev,
 			const struct ieee80211_ops *mac80211_ops,
-			void *drv_data, u8 *fw_features);
+			const void *drv_data, u8 *fw_features);
 int mt792x_init_wcid(struct mt792x_dev *dev);
 int mt792x_mcu_drv_pmctrl(struct mt792x_dev *dev);
 int mt792x_mcu_fw_pmctrl(struct mt792x_dev *dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index f2ed16feb6c1..b92bae3f2151 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -763,7 +763,7 @@ mt792x_get_offload_capability(struct device *dev, const char *fw_wm)
 struct ieee80211_ops *
 mt792x_get_mac80211_ops(struct device *dev,
 			const struct ieee80211_ops *mac80211_ops,
-			void *drv_data, u8 *fw_features)
+			const void *drv_data, u8 *fw_features)
 {
 	struct ieee80211_ops *ops;
 
-- 
2.47.3


