Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC27C43219
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Nov 2022 15:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6zHUtmTd6RGvQvohicUDo1+C3cWxOXttYxoZ7C1AyNM=; b=kRfNJbWG5MEmyIkF/z7w7IEwdA
	13/m/VsybLwHgV1BvI313iAmXLPH7n5M9acBX2C4ZZHb1rGO4V5V0dHAXHvnpA7nkFZgP57RKYvTm
	00Nuz3Z7oYVzmSQQ6L5njJUmoUYPIQW4nHBUJ0ODfUB9I8MXnguZRZM8UBZf4Au3J2sXEKAuPYZmu
	SI2tDagO5obMKY3ksX11SorP4eY7Y63zwzFJDSRBgZ9Z9N8z+ARYLwRoZduMJW3nylGNU2z0OOYko
	DnV3wvEqxXnNPkyG7xGONV2j7mBy7ghAYuKtQY+7GWfm1gnojzPXbZ6SdfmPEiwFsCUEmQegm1S5W
	r+QQec5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqyg6-004Em7-Kk; Fri, 04 Nov 2022 15:32:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqyc2-004D5W-I3
	for linux-mediatek@bombadil.infradead.org; Fri, 04 Nov 2022 15:28:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=6zHUtmTd6RGvQvohicUDo1+C3cWxOXttYxoZ7C1AyNM=; b=iWxjGdnWuEsBrGE/zQn81iHJjW
	PpHyX3w7cqW7ypXgIDHrnCqJZbQ7mzLZr3LnhDHJOBJ15S6sVF2++puC0eMhITEclaz7CrQW6MNZz
	NAJXhoX/m01UphtJXQoj6eHrgj5szXMak6ZOtfialPys1DngJrX1M0/iNC0aH3t3K3qP1QKVatHiq
	oLybwijKn5S3b2C3FyLTGqkwjGeGgoyMKTKWH+BLkeiuumFYqdUuulN1ghfVdKlzMO1mOFSv1c9dd
	56daU5DGbWtKWxjOVDIt8TohbzAn/tdMcys2N0NJf/QEiDdRmOgC+RuemUyWSPFMUNuOf8+h04R3R
	HGfkia+g==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqxSo-008zJP-JN
	for linux-mediatek@lists.infradead.org; Fri, 04 Nov 2022 14:14:35 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5so3123950wmo.1
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Nov 2022 07:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6zHUtmTd6RGvQvohicUDo1+C3cWxOXttYxoZ7C1AyNM=;
        b=sZpvZ48ZfL7ZHUcpdBGfIoKduwmTvL5EhX1uFBCa2jEXcfr8mcna8xs2xPZJpfBmCq
         mKRUawmP8LzwcDAHLdITjH8mTdt2rR/RHm1wZbUujLSRnEaBYxYpn8k2tVgkyGqcQHXZ
         V3C4NsMONBKoa75jZtvRtV2C9MrRVBEZzGCdJ8s56Uwi3/Lddwv3enOncogOyPK1oHB6
         rsOArGEyYJi+GvlMMLK73qYd9vDx/0+mDExpKhenqU3UezG2QL2qCgSZgsJLuUh4zEs4
         zmr8dooJSIFg7feKCmSZNEit3n9En4LRHKD0xhcwlvot+bE9rHyuuqSiZ9Zm+n/EpSJE
         qCyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6zHUtmTd6RGvQvohicUDo1+C3cWxOXttYxoZ7C1AyNM=;
        b=jGvc6SvRVeE4qSoTb6/n7bE1ePIxIyO34FlFcYCLnPjF+8iRn92UuP9Tfqbc+y9/X/
         kB8lM9zCaInzvnEgTb3X4f+KWMvlDHtAPs7ilxELv41mzN/169D/4GJ4NTZSoZcZy/Ry
         H/4YKXWZoj018vclwUUn0KLmi0Jx9wJOrp2oCY7q0zNy5lOEvA8rATSk2tousxgyM1nK
         cBq2tVEl3ezYRicMEAf0woyFCA/ZGn2SmNbuVAMOZiO8INeaiuUVjk4R+992W2K7gTWi
         WYWRiKR/1C0+ppOU/53ZkA4KFG63O/oozZXA/D6N2k1Kxi/QVFyige9sFinMAHtuHUKa
         9Yrw==
X-Gm-Message-State: ACrzQf3zI/BsJ5ltNsrnqwkkcpLYRi0RA6lQOvejva+IwLynkVd6gU7Y
	bmYfruiyNfXRWJCVjslaTnALCA==
X-Google-Smtp-Source: AMsMyM5si9XfQzNepR9daWPGFME2Q9Ye8oPRfuLmG8pAZT/Jkr0RR5GB/3hFkZ2l/aquOD99c3P13A==
X-Received: by 2002:a05:600c:4252:b0:3cf:678a:d189 with SMTP id r18-20020a05600c425200b003cf678ad189mr23153902wmm.51.1667571258161;
        Fri, 04 Nov 2022 07:14:18 -0700 (PDT)
Received: from [127.0.0.1] (2a02-8440-6440-7fff-3074-96af-9642-0003.rev.sfr.net. [2a02:8440:6440:7fff:3074:96af:9642:3])
        by smtp.gmail.com with ESMTPSA id bj9-20020a0560001e0900b002365cd93d05sm3594512wrb.102.2022.11.04.07.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 07:14:17 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Fri, 04 Nov 2022 15:09:52 +0100
Subject: [PATCH v3 06/12] drm/mediatek: hdmi: add frame_colorimetry flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v3-6-a803f2660127@baylibre.com>
References: <20220919-v3-0-a803f2660127@baylibre.com>
In-Reply-To: <20220919-v3-0-a803f2660127@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 CK Hu <ck.hu@mediatek.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Kishon Vijay Abraham I <kishon@ti.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, stuart.lee@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, Guillaume Ranquet <granquet@baylibre.com>, mac.shen@mediatek.com,
 linux-phy@lists.infradead.org
X-Mailer: b4 0.11.0-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_141432_551624_03F271B1 
X-CRM114-Status: GOOD (  11.36  )
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

Add a flag to indicate support for frame colorimetry.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 11 +++++++++++
 drivers/gpu/drm/mediatek/mtk_hdmi_common.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index 3635ca66817b..933c51b5f6d7 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -120,6 +120,17 @@ int mtk_hdmi_setup_avi_infoframe(struct mtk_hdmi *hdmi, u8 *buffer, size_t bufsz
 		return err;
 	}
 
+	if (hdmi->conf->has_frame_colorimetry) {
+		frame.colorimetry = hdmi->colorimtery;
+		if (frame.colorimetry == HDMI_COLORIMETRY_EXTENDED)
+			frame.extended_colorimetry = hdmi->extended_colorimetry;
+
+		/* quantiation range:limited or full */
+		if (frame.colorspace == HDMI_COLORSPACE_RGB)
+			frame.quantization_range = hdmi->quantization_range;
+		else
+			frame.ycc_quantization_range = hdmi->ycc_quantization_range;
+	}
 	err = hdmi_avi_infoframe_pack(&frame, buffer, bufsz);
 
 	if (err < 0) {
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
index 921bde150e11..2e8e5feec377 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
@@ -32,6 +32,7 @@ struct mtk_hdmi_conf {
 	bool tz_disabled;
 	bool cea_modes_only;
 	bool has_cec;
+	bool has_frame_colorimetry;
 	unsigned long max_mode_clock;
 	const struct drm_bridge_funcs *bridge_funcs;
 	void (*mtk_hdmi_output_init)(struct mtk_hdmi *hdmi);

-- 
b4 0.11.0-dev

