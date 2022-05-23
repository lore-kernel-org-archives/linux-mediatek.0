Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C922AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 11:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vakjVcMh/MdPAbcEHt3lCiios9KqZ+yKYyex46U3l/0=; b=v8XrWgfGTZqcze
	BbJUxke8d62hG5tmoiAKwaTfTzfAivVONdv9PIdZdzEXklcDj+G35zYIEImr6AxNTAmLEPfENJbGm
	RKVPpVDtjeoXCANZOKbfuP8v9nTM3d7uEW8HQWBCGBMST6ePYV4TNIWO98NtbAIfW3VeGCZRSarhz
	KNpKsS6hMXO2hA7R3gkDLfSzLeVjHHY5huSvyWX+mxSPhXNCSeEFXJVCRHO1Wiy1miZeMdU10fUt4
	Lj4k/3cmAR4YMHUa7J2c9NssQJDDUhGieb5pr2ikFfnQlyBV1dyihCj6NsRfkd6DrIvUSWvAbF4aa
	95pZr91q/QHaIJFi3fDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt6Fd-003iH9-0y; Mon, 23 May 2022 11:29:29 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt5dr-003Pc6-Ed
 for linux-mediatek@lists.infradead.org; Mon, 23 May 2022 10:50:30 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 r6-20020a1c2b06000000b00396fee5ebc9so8279640wmr.1
 for <linux-mediatek@lists.infradead.org>; Mon, 23 May 2022 03:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BTipBQpMUHbzIB78SpRWE0aZpYF7CdaIwWlizpfEkA0=;
 b=ePI8JS1mctfDL3dO9htUkRnfmok+YrhIapLwhHYJPfR8R6GHhgxiX+EigQq0lWaOpa
 lUd2frUxdmDwV7VrhqQr91fhoNYg/dCnRsaUbXVQH/n0MSOxc2u6ym2Eo/FzjARm3FZZ
 gT+TczI/6Ypbtptd2PpNgkl04Scq72HVRoijaHEUnKF373aE9elxK0gAB/R0Up6QO3Xh
 jHMDPMiEaZfbkMsRtMjLLS+doUDFrhZavCPihsU9CxC8ITzIaWeNfpcDzlCiSHix1Kfb
 B1GW23MiJ0rJWCpI3iknt5r8G47/AngXfA0crnTiZtsLb3jjXWVeWCOZXcAjy/UlQFcP
 vVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BTipBQpMUHbzIB78SpRWE0aZpYF7CdaIwWlizpfEkA0=;
 b=o/EQR5YyZuBHbtAFhSyug1G2QoN17AvIoat11giEG5hdIQuqY1IbTKx1w/LTo2BhIV
 Wt/FKAhy1y1j61ArzrYtTyoWJR4U/tPIZnD3FAHyMFunPDba8JRIwzm27COoTiCNkD39
 +EvnMlEqFiAz7k77TIhnCWn5zU0CtPYQOyHtWhMFT4loeFBLC16JfKjJ4oMQs3I20+kc
 C/TUb+lpjxzDj5elK3hjZdVL+zXhJqQ7UVRELa3fRKguD5i1gCUR/MaPNr3oz+nOAk9X
 SfKs0+TTE3QmMQ02SVcENKVWk08Wuxc/oExd0FyLwpXUuPZKmNlxFQ4iIt4qbhqblE2o
 GwSA==
X-Gm-Message-State: AOAM532tT3hPDYd3I3aDkcbobwEpibOj1G6eop/JJHyh4piMDxlmHwdS
 ygP2zwq4FiNnIOZiTt/lWGL52Q==
X-Google-Smtp-Source: ABdhPJygVo7Uq8Hm69+Q7YlNBB/Vn/rNG0nxqMPhhVn6Gufk9PmyiPIHQHKU66sNdjrJCeJcttYnEw==
X-Received: by 2002:a05:600c:348c:b0:397:4f69:775f with SMTP id
 a12-20020a05600c348c00b003974f69775fmr2120929wmq.24.1653303024598; 
 Mon, 23 May 2022 03:50:24 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6141-9d1b-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6141:9d1b:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a7bc5cb000000b003942a244f38sm8453607wmk.17.2022.05.23.03.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 03:50:24 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Helge Deller <deller@gmx.de>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-fbdev@vger.kernel.org
Subject: [PATCH v10 03/21] drm/edid: Convert cea_sad helper struct to kernelDoc
Date: Mon, 23 May 2022 12:47:36 +0200
Message-Id: <20220523104758.29531-4-granquet@baylibre.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220523104758.29531-1-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_035027_541675_AB26AD60 
X-CRM114-Status: GOOD (  11.78  )
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
 include/drm/drm_edid.h | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 144c495b99c4..37c420423625 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -359,12 +359,18 @@ struct edid {
 
 #define EDID_PRODUCT_ID(e) ((e)->prod_code[0] | ((e)->prod_code[1] << 8))
 
-/* Short Audio Descriptor */
+/**
+ * struct cea_sad - Short Audio Descriptor.
+ * @format: See HDMI_AUDIO_CODING_TYPE_*.
+ * @channels: max number of channels - 1.
+ * @freq: See CEA_SAD_FREQ_*.
+ * @byte2: meaning depends on format.
+ */
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
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
