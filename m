Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD45CA9ECA
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Oct 2026 11:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qd6y2NiBciAjRKr5ndbJ7uSamNBWAtmvHRlzXouwwJA=; b=f/SMLO3G3O5VlrxxsDM/D4n4jL
	65+T/54IjOKL0+uURKi1mEuirLQVyg/PuLLbHGiQBIg5Nw99e82Yrysp58WwnIO4QYftSKgGz5Zbh
	K0EMadn7mTJ9UqOWXSBP5K8zBPpvDfDaZKfCd7LLgA40A6RAgVADrFlb65fxZPmQNt7/qQdBBHGx0
	+p56mszefXNtmkJzRt4EotHiXnIRqC7jfKOi+9RwRxQhtAB18PDd4DD/S4kRYKBrUmHuH4UXSk+yy
	HZ+Z5Q5Cr0JqwHb4HtbFev197yItoCtRRt4nEVZVH3qJqWsyaMBjt/Rmz2ziJS9PnMLM4bumDnnir
	GdrTTHgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVhF-00000007ygF-1LPM;
	Sat, 10 Oct 2026 11:57:01 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVgV-00000007xzM-0XSU
	for linux-mediatek@lists.infradead.org;
	Sat, 10 Oct 2026 11:56:17 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so4073325e9.1
        for <linux-mediatek@lists.infradead.org>; Sat, 10 Oct 2026 04:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791633373; x=1792238173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qd6y2NiBciAjRKr5ndbJ7uSamNBWAtmvHRlzXouwwJA=;
        b=h1kUsPx0fCCTBqqyWiIft3tP5QnEX3Eqq06ZGUShIbJAj9PWHPsOI5+M0rI7gH3bwT
         OPA4P6VKob30Vo3usm1Nj0s9TPqhgwclz365W9FPw0MGvWEgmkC0YwOUg6o0LKr+C2yF
         UuN0ATb0ES6n+b1kgYjwS4dLYSgJZZmKYz1DyGvn4gn+QgD4GokHz585KM/4pKBiLdXh
         1gDZWLFba41bL1tNFRUBYEZbV2iJudATN552eXvLqm8+zTAnM7yIFEFUSRDUTcnkHIHl
         DHd1Yo6LxctI7lflvnahwGDM1539EeJpY2AzTqhn1vgGR8LQb9wUkQyXdzW+Q8FuNHaC
         jtJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791633373; x=1792238173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qd6y2NiBciAjRKr5ndbJ7uSamNBWAtmvHRlzXouwwJA=;
        b=pVW39VIWKZ/P4JLfPpHOroOeqXrTs6pPQwRfcgggaD4ItSJqkqIAq8djHhy/Pfqh19
         FhgD3GE+YJokIp5JLWYmD/4wc7svHioMJZPoKEIdn3DoetVP312O7IXZT535AHeus9x5
         3sWSufLy5I0OXiKeseRRNvkZZ8wGgva+ALYNB+M7dFtZUn2/TzlYwXAPNYmvqiIe6Vz7
         y1h9XfBZmomnBiJ04RJ6ImQVG4w0CBgmed+23iW+OhXV7Wv9OitWrAErFjRWR1YDWrfM
         enItNqIqQRs63ggD5SpgIjghkgoEkurfcn/lY1R/EisV/rf2OuBL/gasXJsoujF+B4++
         byJA==
X-Gm-Message-State: AFq9FYLIk7V1wqNAEItKoNcZY416fSMDBx0jWz3ZuVLup5iDrxaZL6SR
	a/t3AD5I0oYa3bWMuYi07KTW6GMfxUZev5REyol+3y77nfOGNk2ZV+Nw6c+Yvd8b
X-Gm-Gg: AYBFou3YSOrqBodfiboAY0OdQN8gCMvNEsOhXZn31lOK1Xbqw3fmEBtIWYghFl1H0qQ
	qmgbGUYd+84uCh9He5K9mLdgyVVJlCEWDH6LwOT9M6x6FnOvEEjb0Clsx6tPLsaslWoesGyh+ly
	EQLRsA7dWIr7rPoN5YKa62oJW8tcZ5mLMFRGC6lbYHfPjnbPdX5N+E+Bnz1coPlNVTkHFIoHGMv
	EXrIw710nrZBXGo91cpebFpDc4ozbzvIMo8SR2p4Tj1qPWD3t+oookAx5hDKFIsRvkyF6Rk9fCf
	JyJdN9NDDs3xbe9U/di9JYALRUxIkRGSawbNjYF6q1qQrSSZl7JvH2Ey4v6DRncwcjtUisCUNn3
	O0ovxxdjibUJaAy1CLlDD+kcRcYtwrVLNzjZ++7svGP2rWrqZv2O+j33UaSluHx1KN8kAhISrAq
	oT18lFYbCfXy/G0VqdpztNn8k+JZxov6nV2mRoUZ4eQsb+rtPGV0RCOwR3T5Pu99u1Cg==
X-Received: by 2002:a05:600c:6749:b0:4a0:1a7f:2abf with SMTP id 5b1f17b1804b1-4a18e49d633mr79294265e9.7.1791633373147;
        Sat, 10 Oct 2026 04:56:13 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aca657sm8746340f8f.43.2026.10.10.04.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 04:56:12 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Fabien Parent <fparent@baylibre.com>,
	chunhui dai <chunhui.dai@mediatek.com>,
	CK Hu <ck.hu@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 6/7] drm/mediatek: mtk_hdmi: Improve the secure output bit toggle
Date: Sat, 10 Oct 2026 13:54:06 +0200
Message-ID: <20261010115539.9237-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010115539.9237-1-l.scorcia@gmail.com>
References: <20261010115539.9237-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_045615_209259_D755EFE2 
X-CRM114-Status: GOOD (  12.71  )
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

The secure output control bit toggle for mt2701/mt8167 currently sets
bit 0 (DEEP_COLOR_EN), 1-2 (DEEP_COLOR_MODE), 15 (HDMI_PSECUR_EN) and 31
(HDMI_PCLK_FREE_RUN_EN) in the same operation, but only bit 15 is actually
controlling the HDMI_PSECUR_EN bit, the rest of them are already being set
in separate operations later. Add a define for bit 15 and clean up the bit
update operation.

Fixes: 0fc721b2968e ("drm/mediatek: add hdmi driver for MT2701 and MT7623")
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c      | 2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_regs.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 9896eaf81e7e..781177a1f190 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -63,7 +63,7 @@ static void mtk_hdmi_hw_make_reg_writable(struct mtk_hdmi *hdmi, bool enable)
 	if (hdmi->conf && hdmi->conf->tz_disabled)
 		regmap_update_bits(hdmi->sys_regmap,
 				   hdmi->sys_offset + HDMI_SYS_CFG20,
-				   0x80008005, enable ? 0x80000005 : 0x8000);
+				   HDMI_PSECUR_EN, enable ? 0 : HDMI_PSECUR_EN);
 	else
 		arm_smccc_smc(MTK_SIP_SET_AUTHORIZED_SECURE_REG, 0x14000904,
 			      0x80000000, 0, 0, 0, 0, 0, &res);
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h b/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h
index 2050ba45b23a..e0c35277c553 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h
@@ -219,6 +219,7 @@
 #define DEEP_COLOR_EN			BIT(0)
 #define HDMI_AUDIO_TEST_SEL		BIT(8)
 #define HDMI2P0_EN			BIT(11)
+#define HDMI_PSECUR_EN			BIT(15)
 #define HDMI_OUT_FIFO_EN		BIT(16)
 #define HDMI_OUT_FIFO_CLK_INV		BIT(17)
 #define MHL_MODE_ON			BIT(28)
-- 
2.43.0


