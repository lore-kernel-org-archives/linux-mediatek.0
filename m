Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C1CE77197
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2025 10:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fy/DbTIkkOlFt9RUb5dJSds3N2C+4xTIp3gr3Wl8Gls=; b=pTmZ89vUt2Q9uOIcbCApoXx9hy
	/rLu+NZGARlP2Oz2S3FbwVkdtdwjfAKh14nHN4D9MgFKR8+D+uel32cL/6cBjRNWsscuX9i/qvKpE
	aUZzsRij/FHK80Jdhg5wsgWk+b2amC8xGvoC+lv1Rf4uZQX8eD2KFvGMRaEZjdz5ZPX+qrlQnzRpH
	Bx46Ex6/e3tLqwnNR6lXT4E7wEAxldOCpjxLEm1lNrf2WP8TIar0Z6aWCqXybfo/sNMPP1VbZ6R8E
	UVdh9jX20V2PMejCaCzH6eI+3QVnxcNzjQsqAWlFZMukEKa/Krnw41S+MVTslS+3yp+uOfXvktU/r
	pEMlHGow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVpyy-0000000BZlJ-29UT;
	Thu, 09 Jan 2025 10:41:44 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVpvN-0000000BYuM-2W7L
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jan 2025 10:38:02 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43621d27adeso5647045e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jan 2025 02:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736419080; x=1737023880; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fy/DbTIkkOlFt9RUb5dJSds3N2C+4xTIp3gr3Wl8Gls=;
        b=THV2JtoO8VFpJXOBXtFwdy/VZUcwzkees/pYrQj0juxiWOILN4QzGxuLpo5fuOHc3U
         RL2S4n1b9tVAdVJf/PAMKiaet1u0s6h7lSSZyozpP+AKWFL3my2RiWihK1GgQV3v1OAq
         v7c9NJasAzVeFSfDXijKmvW6vw25jhlNuXPtIYKRcYuIChgQk8GfxKGtKOKxz4WwWy+9
         K4eP3ve1aAQE0ESBd1FUZI5icmuce6q2s4KaDhfGaf676VWJV1oH51nKT5DQ0SJ/uSHt
         vhg/nZiQo4Gg3IFQV8Zb1VaHFTLDOgbU/6TCCkxRXbxkpVSSBtB/iPITwF3wBkjIpLxv
         yp1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736419080; x=1737023880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fy/DbTIkkOlFt9RUb5dJSds3N2C+4xTIp3gr3Wl8Gls=;
        b=YAKat/iB227cJNe/QvClfCNjS83czRT1/w/6oOpldinxsTp8cwwcOer0AX7hZaFroS
         7PWVf/M4fA5RdUkzgpeihZ+mY3M0jZ7kF+GUMTp3Fgr3YzUC7IPKRl9fEY8lohNKFZWo
         4dnFxnJpS1S8YgDTfH9EdzK6ldx/pCyf68H14NyQ1C6FNB80J81QqWtlR3HcTsvy5VaK
         7H8RveJcjoq71RZ/O3cHIpqDn/k1XRK+KaoR6Z3aKjkH24U5fWP7p6rAdi/SdtHvaGF4
         N3CPfsm07dpXA1STjj4huzQDOLWBvty15UqWnoyaq8L9qkDqRYujbWG2UJcIz1Xn0/aO
         HwTw==
X-Forwarded-Encrypted: i=1; AJvYcCU+jv7PQFxXO/Mfi/ECMgRKveoC0XwotMoaZG5Ae2iHFCUccXqtzmveTQJUcIifuU3vq/ylXGs6pSKH4Dxpig==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4VAFIpj3e/ue7iz1FhW/vqQgZZMZ7sZRPS1okljzH33j/GDMb
	RygSUxJB9k+fLmn5F0JY8awNdWMQUNMEw6q28aJQIEKaZQ/um+m/c+EZyHWIvIU=
X-Gm-Gg: ASbGncunNKHs9ZVUU1zUawZlmMFhsm3D4jhM0eboZ+Znq6WUuU4s0dsc/V9dLGSekzA
	w84EpUYX+4dSJlhiDaSeEWP7qMckSVKxNGZ0aOxbYWLBQupngo3kD5p9Bu6xJCEAYCUJizDyDFQ
	6Rw6+0NeFNgxdsIwNzOW3IenxgYanknJopzeo2gflMrHZxd6dsP6pueKeRYy8cYg5LixZI0Bfvc
	xRMNMfRhwXqeYgTCd+yml3BCJNUWAbZKWaeFRtcFGEM/ien6t8N6IpOsgU=
X-Google-Smtp-Source: AGHT+IFqrF9VBaIGIQv342u8nnxcL3grxMu66H5YdF4aKnHXSKZ8sqOEG/h96wNqmjPS/6bRF8WYeA==
X-Received: by 2002:a05:600c:a44:b0:434:a852:ba6d with SMTP id 5b1f17b1804b1-436e2692d98mr53720915e9.9.1736419080138;
        Thu, 09 Jan 2025 02:38:00 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:125:358f:ea05:210e])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436e9dc8826sm16428195e9.11.2025.01.09.02.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 02:37:59 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Jan 2025 11:37:55 +0100
Subject: [PATCH v6 2/6] drm/mediatek: dsi: Improves the DSI lane setup
 robustness
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v6-2-c6af4f34f4d8@baylibre.com>
References: <20231023-display-support-v6-0-c6af4f34f4d8@baylibre.com>
In-Reply-To: <20231023-display-support-v6-0-c6af4f34f4d8@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1234; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=Yn0yDiaGCUYQbX+kBDNWi7Wqy2+4x3TU5RubErw6Doo=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBnf6cDwdONFcg4NoVECip2enCTYPobmCH1FlW7pj0f
 vkaE7iSJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ3+nAwAKCRArRkmdfjHURSPtD/
 4w4jm96OBg+7I4Hu11Al/9Y0xh9+Oh3kbilSLdnrom4hY3QZ4s7zBD3cCsVUNkid0FLAfkhsMpd4eD
 phj+a50KyeJxdLZ2W9mahlJrExdjQhYo1QuiMNzOwvUhb0setLby8V6aFbs6qcjiHddZZh19gF2OL5
 IJwG0L1WBP48ANNIByya4m067yxpJr+JmuDQbkRVFtWB9oXwzfAkL62i2nYaiyA6tWQNL/q12MGydn
 cNcFzOWckYcGQWzG6MAM1XFekhLlrawheg/eYFMYrHD+gFX9cCU35y0+Go2MnFzYW4y7llOcVjwBOP
 vlLLQFuys/YltGsZ+2K/Mw2hrUO9PFHdQWGvnRfIslGH6jIFVcH1nJ+/FhHrpC6mAc9b/VlTjxjMTF
 5zx0MZ8x4SKVvYp5YpnmmAaryXjax2HWnGX355TxNOb8JQLf0Su+Cb0ZbckN3+9FpOqwmTg2Ga0PbU
 k6uL0C7UZCbj9okzz1bFSMvAlWXvoQn0EicsTdbmucSljHbw4R7nCGRr+h4d/fYL1dkMpVvR5+3F7T
 GaTnq5/w5LziPJ+FE1wRHcGfYi9iTS/vNVfuFKgGNRpBKJBJFnsyNSU1bGpzHXmktkJbLimW1NpxEY
 pxQvTazZz+jDn8BL55TiOGLwoUJr8eBRA2Ioyd7Z2ctupdak/5s9qnWE66lg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_023801_772229_A9DAFC5D 
X-CRM114-Status: GOOD (  11.93  )
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

Currently, mtk_dsi_lane_ready (which setup the DSI lane) is triggered
before mtk_dsi_poweron. lanes_ready flag toggle to true during
mtk_dsi_lane_ready function, and the DSI module is set up during
mtk_dsi_poweron.

Later, during panel driver init, mtk_dsi_lane_ready is triggered but does
nothing because lanes are considered ready. Unfortunately, when the panel
driver try to communicate, the DSI returns a timeout.

The solution found here is to put lanes_ready flag to false after the DSI
module setup into mtk_dsi_poweron to init the DSI lanes after the power /
setup of the DSI module.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index e61b9bc68e9a..dcf0d93881b5 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -724,6 +724,8 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 	mtk_dsi_config_vdo_timing(dsi);
 	mtk_dsi_set_interrupt_enable(dsi);
 
+	dsi->lanes_ready = false;
+
 	return 0;
 err_disable_engine_clk:
 	clk_disable_unprepare(dsi->engine_clk);

-- 
2.25.1


