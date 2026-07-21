Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7F1C44529
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 07:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+HjmAlbOs1MBYQdjObhXrJEH8vF2H5aB6qgUxYH+azw=; b=2UNUJ2DfnatAwaiIUN8x/keyQY
	RtLdb2BK/zA2LogBFUFdRbL1VpstEc7SrK5+jfhrWdMytA/mbNphzOgTCxk6v+3bezlXYZe6roc2u
	iLmqyMkiMvJcXkLeeH2BxTwj2HqFYRJjVgvYVuv/rKNVXnyOkHSjSwOk6gk6hdjqHLRxOp63rMTV7
	4Tg7ybiqQtMf6FBZfbkLNt6dYNci/a2Mvk/c1nw0kW+aMJXvqChwL4VxLondHeJXVT1xR5Q2pQJ4V
	re7mwBjOY4B6A2GeojWIDS7yeZIw8x7ty1D/Udd8sy81GlKeUtmYbR2uy0fZl3L5xbe0SWqDk7tM4
	sdtQiJAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5JD-00000008iAK-1RHz;
	Tue, 21 Jul 2026 07:54:35 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5J4-00000008hzQ-1o0Z
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 07:54:27 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2cad8076b01so132462715ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 00:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784620465; x=1785225265; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+HjmAlbOs1MBYQdjObhXrJEH8vF2H5aB6qgUxYH+azw=;
        b=BdXdPFWwpjgRyNSSSBjR5JLWZdUDq7AHibAwIEGXfugb34s2p0mA+Ope4jbmvOK2gD
         tEsmf4AZzPc+0KrLwu/D3txcoukuQyLKzAdBsJZSCqES45Z66Waa/rSfDqXco9iNsjcm
         SvP3Y9dDMXfz/FZqOI3KuWSY7BZ7nRnb56cG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620465; x=1785225265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+HjmAlbOs1MBYQdjObhXrJEH8vF2H5aB6qgUxYH+azw=;
        b=oxdpm9vJl1U/iQtOu/6sEKJR0buASBlq2/kTNMziN1FU29nKfyQGn+GQtZs1s/mRYx
         V/58sbxHmfEXEjZXszf/A14iJvdpUPA9jEqRCaLy2AvXO8bCicVX9ntRM2c9u+yhMMTZ
         pu2kp94jrb1uo+mFmxO+qbOmnkf6gJBzre4BGe0c3u9cakbf1ZHxOH4iPtR+N+blv8dp
         rixEnucXo5KTpTVEi9Oqlm7wndARN8P/alVlU/cfbbFq2j4dP5UCFKbzTPaF9TDPwTU5
         6H75mSpt67blnVtqFI0wHOXT1lhV4tGF/mnoRhSjrYV29e0JvyE2rMsIwzY+QWGlk/rW
         j8vg==
X-Forwarded-Encrypted: i=1; AHgh+RpJmGUzSZ+rWXs2zq5Vsd4uU0ynBKDEI78SpEFaG6UEkh4znIGNoiioWCFZPE4HN2l/DYE1MxoQ9D/e45MP/A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7D2egXKXDFn+H5iTiBKXTz8VHYbd95wDc00YWo50f3D6XKixC
	8WR4Jd3rMWunlrTYyyKwCGHTwYMBQkzF1Bx0u5BtTI7ZvFDHMZ6/CayH4DtYQQkn9A==
X-Gm-Gg: AR+sD10FNVwpYiLr1ZCz0XzqDTbF88EgvBrSo1nDw2pNWtTlZ1KE9nyVmJnmH+/KZDx
	y7tqMSTOb+jT7bYaN1elN8xeUlr/lfmT+mhq43MQCh8vNE+tQaDTTRYXxgeTA11cBODWr2FzGx1
	tRfaEVSIQ69QZkizf2koxLt0yf4LT4b1RYVjTiUchVDfGgB8xMIi4ttlAPRDX4CktnZYAdplf8w
	ZVOR90+Oriw8GQW7nczoBqco6hvS1epUb4D0o8Pp9tAvEp2DXgp6OzWpY77INaiRl8jg4MXfhmf
	9fpgMqlqNjW49M2dOqesidTcCZRZSZgplnU0+Vf5I3l05bS/jJ5CLhqndvSt8v0OQ4rcphyq19d
	Qe/QKRRS4zChEEBI6qBvbshHdkptBVOLdr2PnJWdvmvhc010Kp+Tjf2RQ9zaLZs3STm5oEKxQlb
	mAxnUrOMB+N+sh1OSnvDryfP9s6Wn1FTVGUoZ5OxnfaX0Jk2I0XtLi33szQRI=
X-Received: by 2002:a17:902:ef08:b0:2ca:5970:732d with SMTP id d9443c01a7336-2cf349d0276mr183734525ad.41.1784620465520;
        Tue, 21 Jul 2026 00:54:25 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448f705sm70724175ad.15.2026.07.21.00.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:54:25 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/9] platform/chrome: of_hw_prober: Add delay for hana trackpads
Date: Tue, 21 Jul 2026 15:52:21 +0800
Message-ID: <20260721075226.2347933-8-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721075226.2347933-1-wenst@chromium.org>
References: <20260721075226.2347933-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_005426_466602_BC1F15E1 
X-CRM114-Status: GOOD (  16.94  )
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

Up until now, the MT8173 elm/hana device tree has set the dedicated
regulator supplying the trackpad as always-on, simply because the Elan
driver was missing proper delays. As a result the delay for the
Synaptics trackpad was also omitted, as it was not strictly required
under such a model and delayed the availability of the trackpad to the
user.

The Elan driver recently gained proper delays after power-up, with
adaptive skipping of the delay if the regulator was originally
on. The I2C HID driver and I2C OF component prober library gained
similar adaptive delay skipping. The device tree will be fixed to have
the regulator not be always on, and proper post-power-on delay time
added to the I2C HID device.

Also add the post-power-on delay to the ChromeOS OF component prober,
so that if the regulator is off at the time of probing, the prober knows
to wait for the hardware to initialize.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/platform/chrome/chromeos_of_hw_prober.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/platform/chrome/chromeos_of_hw_prober.c
index 8562a0e89dc6..54d8941617e2 100644
--- a/drivers/platform/chrome/chromeos_of_hw_prober.c
+++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
@@ -70,10 +70,8 @@ static const struct chromeos_i2c_probe_data chromeos_i2c_probe_hana_trackpad = {
 		/*
 		 * ELAN trackpad needs 2 ms for H/W init and 100 ms for F/W init.
 		 * Synaptics trackpad needs 100 ms.
-		 * However, the regulator is set to "always-on", presumably to
-		 * avoid this delay. The ELAN driver is also missing delays.
 		 */
-		.post_power_on_delay_ms = 0,
+		.post_power_on_delay_ms = 110,
 	},
 };
 
-- 
2.55.0.229.g6434b31f56-goog


