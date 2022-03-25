Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF57C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Mar 2022 17:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=quSqXlwU2IwghkurT0HQj0PfN/1uZ3QsMEvLe3GanQ8=; b=Z7yUwdOb7IMGCO
	if9wGDa749IP6Pgxdu7OLyXLWTTKQMCatUvjoEUr311g4R50zsEgNwT2l4w0FGUbvjOwdYQphqzY0
	WJ/NbbXBlAg/aCZpFT6wq5l2zSrirOubb261U7edB9DTSdT/OLtQ6CobwhTIFVkKmX2WEs4pJo+kq
	qMg+aRywMNvGIOTA8+IPO6OReyGZ+x9Hdhlqq76orVK8efaQfSbKNnm2wUjDkGns0U1iv9i4II08B
	tKm3Le4H+fqdMrF4BEGEE21ErVKVuByATYcJsTL8K37dvPHxs75IVhgaHRiMeIezD7S9CXpdT/mnk
	ADPeleH4FmCZEhs8mjtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXnaF-002igw-DE; Fri, 25 Mar 2022 17:18:43 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXnYS-002hSz-Jo
 for linux-mediatek@lists.infradead.org; Fri, 25 Mar 2022 17:16:54 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 i67-20020a1c3b46000000b0038ce25c870dso1296075wma.1
 for <linux-mediatek@lists.infradead.org>; Fri, 25 Mar 2022 10:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NqdfmywTZ6fQ/7jJTAQIW5tJoHGg7kZG5yl6dza7Kzg=;
 b=6bXchobGzN8pKvh+gXq4jQSUpRYYt6KibxSAsqSutu1/Yix1bAtFWio+4+5L2OT8gO
 KRwuxVreNneXSQGczLUHqu/9HMPhxIRfgbJW/r3UPWCbrTyCufwjX5onl9UM5gV/JWhK
 zUAlnmhVP2Md/IVwZvzxDWkkSGER0G02QgvLhUL/X7jArek2m0p9TQei65y4Fqg0z9RB
 F6/adAuTQCOPL7XbJ907Vf3vNG3Pv+ViBiGQYC4xuV49DFVqBZv5yCQRWsvtbUueYzoS
 Hl22196SiZd0bGZTvV+MLU+u/PO6RWkOpZhSUmnIt+Vic3k1GEXhwXmSAMdccnZ7lakM
 fwnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NqdfmywTZ6fQ/7jJTAQIW5tJoHGg7kZG5yl6dza7Kzg=;
 b=qbRxhr3YR3BMjBQFYKtND8ze+DXjZ5n3g9KAuplR/OeHpkc7x+kzbPAxkhXUhoi2QP
 7z8C4RbMT1gilZ8AZxEusK6883ZjxrDcAzRs83bJ/4onqkHZM4YE4TkGoWnJOT7q2dGt
 PfHIpgHN+zuhCB3dhmTuWfyJPYXHu2OuByBykyDgkcSBW/Dv1harjmpGASnMxvvJrZKI
 KfQHjqJLJiR55FP7asF7NpQz3GCcAgJyB/rFU402NjL5S53y0ggx+DmZWBbtHFXZbaaa
 7Ydq/06RtXHUqwsdSbngdTdC1TAe3XbJaiBKgvKLHvGsEXBa+4+xDSu8rrgXydENqE39
 yZHQ==
X-Gm-Message-State: AOAM533qtVnx/QB+89E5al/hP/xMFBnOt0zHhSd4nRfQukK77kYjlzv9
 QJG1GPHRWyMoh43h+GW7eeeVUg==
X-Google-Smtp-Source: ABdhPJztbg41uIEn6kYbSEgV3LT+xnRXVt+kN+pXwZTNOue5R4lV3fouoQj4ndoTzsNVOsRmWuPg8Q==
X-Received: by 2002:a7b:c30c:0:b0:38c:8ff1:625b with SMTP id
 k12-20020a7bc30c000000b0038c8ff1625bmr20345780wmj.30.1648228611391; 
 Fri, 25 Mar 2022 10:16:51 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6240-cc41-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6240:cc41:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a5d6390000000b00203ffebddf3sm7547464wru.99.2022.03.25.10.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 10:16:51 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com,
 chunfeng.yun@mediatek.com, kishon@ti.com, vkoul@kernel.org, deller@gmx.de,
 ck.hu@mediatek.com, jitao.shi@mediatek.com,
 angelogioacchino.delregno@collabora.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-fbdev@vger.kernel.org, markyacoub@google.com
Subject: [PATCH 04/22] drm/edid: Convert cea_sad helper struct to kernelDoc
Date: Fri, 25 Mar 2022 18:14:53 +0100
Message-Id: <20220325171511.23493-5-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220325171511.23493-1-granquet@baylibre.com>
References: <20220325171511.23493-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_101652_683104_4D1CD4CF 
X-CRM114-Status: GOOD (  10.04  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 include/drm/drm_edid.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 144c495b99c4..5d4d840b9904 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -359,12 +359,17 @@ struct edid {
 
 #define EDID_PRODUCT_ID(e) ((e)->prod_code[0] | ((e)->prod_code[1] << 8))
 
-/* Short Audio Descriptor */
+/* struct cea_sad - Short Audio Descriptor.
+	@format: See HDMI_AUDIO_CODING_TYPE_*.
+	@channels: max number of channels - 1.
+	@freq: See CEA_SAD_FREQ_*.
+	@byte2: meaning depends on format.
+*/
 struct cea_sad {
 	u8 format;
-	u8 channels; /* max number of channels - 1 */
+	u8 channels;
 	u8 freq;
-	u8 byte2; /* meaning depends on format */
+	u8 byte2;
 };
 
 struct drm_encoder;
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
