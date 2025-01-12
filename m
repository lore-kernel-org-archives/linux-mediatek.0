Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962EEE7719C
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Jan 2025 13:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RBnsV3mFkJmXnRbQqOXQC7xiyTGmF2RqY1RW5wKJo0U=; b=ctROWj8XUVlW8tLwZbrLMiugeq
	U+Cawn6vf2udJGyAyzMGO7/FEBZNLIEAvG8Cvnza7ej4qnUNuaKyuVJu1xvTXCF5ArX0u1Kss+PRx
	z8AcsLw5yd/ZHfim896dTMMCvojt5mlqvHRFL3mwgOBbmo7ic+fZmLjbJJKT3kXocDQZVezXNj3Wg
	H3ctr3cpSsx/yJNwX3r76zUKbbm0wVsiKEargLHW9BTlzmmj5bGlVEkVhvVdmUbf5xlLm4bm0+25Q
	Q0Im74rm8ThAn4RoiXSOltZ3S7H+FcM9/fyJ8Y3h8xNDyBO0F5rolNE3MuXEh13OjIcZZUQyRhLrl
	6x8TkCBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWyJA-00000002o84-38Se;
	Sun, 12 Jan 2025 13:47:16 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWyJ7-00000002o5O-2phY
	for linux-mediatek@lists.infradead.org;
	Sun, 12 Jan 2025 13:47:14 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5d0bf4ec53fso633547a12.0
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Jan 2025 05:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736689632; x=1737294432; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RBnsV3mFkJmXnRbQqOXQC7xiyTGmF2RqY1RW5wKJo0U=;
        b=qhK0/tIJ8b+zFtWV2hW1C0URglvlLhLH7t5WQ9xJipRqKfg12dF7rO7txvwLAnm3/I
         AqlVEpySnk1iBGkbMowKYSrPOQAU8yR6iJ9BOrnbyD5TibOEA9KNU4v1YSpVHTllSWoa
         PttaPuJkREVOH5gW7FHadKmXh25tYmcfaHb5Nd8GxZF6Z7A0/K7LM6G349GUSiVmB8v+
         pODSUqvqxK4QnBKjyIunHsY8b0pL3y8v5ytojoy21ODiRH2jmNyJnsFRNgZ9y6HJPP0q
         SRSCiJ6Ix+xeLxoBXd/dZfuxhgC2VAQwxMXRcNWHH6JpClKidcsUqMuLlqsj+j6ALpUZ
         dS0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736689632; x=1737294432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RBnsV3mFkJmXnRbQqOXQC7xiyTGmF2RqY1RW5wKJo0U=;
        b=eA2dtBsMAAoxGVAVb1RgHzlnosPNGV+fCvWYnpYGyhkjXowSTLl2Hz2HH3DHQBgJmv
         C7z1JouQYL9/zQ1jtp9ulPUvP4oSl6cGX40YpZS4RlQGfm5aKfqkfGhELY5o/j+2Bw4t
         eDkVqiTeUAdtV55X0d51mkzXMaw7b8BjFw8WHd/7GJMtmlhDgGUiex5PSisLl3Jq1ynk
         dKqa6hKHjs1eTMXQ4gFoqmlwSeMJcsK6CSv5/WFU8Bw5nWVyvNY05tCq9yrK4RlFIhzn
         zWaGku5jjIhSvgSkPjCkMuu1pcxkwQur+VHjZ+E5fOV7fMC+ZjWxDyO+YYshIb+w+WNt
         KBUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXul/w63qmOIwfSizORZrUSU2zkG+ZMBokYAHEZ0rCdQpDsB8bpxDP++tfB4Tyxug9n8ngrsetS4dik6++rfg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw50y0kDeCyo1GYPu2TWVB9K2MA/qzmjL05zUJ0on8Ize/GxSVi
	LRcUxtlyiGb0Z9UgKkX4mt6fgRlk+DV4UNRkcGoPlRpUsJtHNH5ShsKikJtvg88=
X-Gm-Gg: ASbGncul1tG8s1fgBsNlhJQDidDYI1do5Umy60gBOAMe+PBp2kab6d0aJJ20U1viHFX
	5pNAShseFtrXmaAi5w7gh6NH1GD6DefWK4YYTeU+na2vmNczyR8C6ZTqP+zRt+AV36wlIZfOMdu
	6FlcCaMiGDA8nVVu0/7O2na2Go85lMW+SgM3YfuiIDom42p1hUmyoHH+q5bQBKJpOsD6igsTQTZ
	yjGuLxO254XKk4PV8sjAD9DqcfgP9ts1QRNtLgdKXfRWihYzuNS/5bqy7f+XWV+cy3EFbY=
X-Google-Smtp-Source: AGHT+IE5jjxbpuHLDjgHBaaKsQqbYx5oIutu5BOQFvdU7mITc2KX+nB9WMaHa1nRj5jMwrSpxOe8VQ==
X-Received: by 2002:a17:906:c10f:b0:aa6:9631:9237 with SMTP id a640c23a62f3a-ab2ab6cd374mr674812366b.10.1736689631988;
        Sun, 12 Jan 2025 05:47:11 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9060c00sm374899866b.41.2025.01.12.05.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 05:47:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] drm/mediatek/hdmi: Use syscon_regmap_lookup_by_phandle_args
Date: Sun, 12 Jan 2025 14:47:07 +0100
Message-ID: <20250112134708.46100-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_054713_728095_9CCDA6AF 
X-CRM114-Status: UNSURE (   9.98  )
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

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

There is also no real benefit in printing errors on missing syscon
argument, because this is done just too late: runtime check on
static/build-time data.  Dtschema and Devicetree bindings offer the
static/build-time check for this already.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index ca82bc829cb9..4b0eb7dc25d8 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1458,15 +1458,11 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 	 * MMSYS_CONFIG device and the register offset of the HDMI_SYS_CFG
 	 * registers it contains.
 	 */
-	regmap = syscon_regmap_lookup_by_phandle(np, "mediatek,syscon-hdmi");
-	ret = of_property_read_u32_index(np, "mediatek,syscon-hdmi", 1,
-					 &hdmi->sys_offset);
-	if (IS_ERR(regmap))
-		ret = PTR_ERR(regmap);
-	if (ret) {
-		dev_err(dev,
-			"Failed to get system configuration registers: %d\n",
-			ret);
+	regmap = syscon_regmap_lookup_by_phandle_args(np, "mediatek,syscon-hdmi",
+						      1, &hdmi->sys_offset);
+	if (IS_ERR(regmap)) {
+		ret = dev_err_probe(dev, PTR_ERR(regmap),
+				    "Failed to get system configuration registers\n");
 		goto put_device;
 	}
 	hdmi->sys_regmap = regmap;
-- 
2.43.0


