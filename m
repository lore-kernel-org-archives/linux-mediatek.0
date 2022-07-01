Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B2BCCA494
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 14:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jkLsmDIy0AahYUW8g9Esgr6pvhc7me0usMRBZRidXhs=; b=Ex47kxHWL6N3RloeTI6A1jylkY
	StXlGITr/QKoR8ENrIQm+EBHOoqnKikt6YXYywFQK11I7wRFtmwk2bkcHqrzil7td5TyK3WzmcZ+I
	9PJ/KUUzRrA6GF87uz5hSgEL0aInD7JHvoPqQ/hBimE1UxJ3qDg14zBi/qaHtLghCJjuv+PijSQZJ
	xOWaecdSxjXrqVtJq6PxCCVcqRfMuAyp/KryVJLa+ovtiynzw9tWeL5jVGNNtlDDBOGfGnaoc7qPw
	J9s8t1Hm6IpAc/OVvJM/WqE8vY8hYy3BGwcShwDBBScuEQL6XeZ7WyuO4p99Hgd+EYJBngaIcWQfs
	DsV6R4rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Hzv-005SQL-D0; Fri, 01 Jul 2022 14:51:55 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Hzj-005SJb-Af
	for linux-mediatek@lists.infradead.org; Fri, 01 Jul 2022 14:51:44 +0000
Received: by mail-pl1-x635.google.com with SMTP id m2so2605282plx.3
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Jul 2022 07:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jkLsmDIy0AahYUW8g9Esgr6pvhc7me0usMRBZRidXhs=;
        b=ffwCwlDaoOkaH0gGVsYaT4ThDo/miD0dBxIsiG0YQ2DadoOPIzyZ+BjgxppTMHaIRb
         sojCGPgv5ZvRaEuI+Tu2VUmEDV028jJrDoaOtRAs4x9NBRjWbS4sXoVCKflouxwMCkPy
         w3haGmfWKPx0x+YQACzZQqvuGpsdQztdBcOg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jkLsmDIy0AahYUW8g9Esgr6pvhc7me0usMRBZRidXhs=;
        b=BShNuUp4JvvY5/FSJjc3JdYs2kaWyPULbcluOz5lFxWB634PleV0v+ds0ZcSFKZ3+J
         iBLl+7IS+mBEOFPwxdTvoqy/QTxUN7Wa6mc6vkWQRKYqIn6vH3w/pHP1ab6K6GSr74fG
         prLYwH5rr/ycjjbC/ZCjzL7hyzQGvE0aQbRfX+MeGpMimyPW2VNyRochoOABdoQNqVVX
         SitOBpmQqfyezWHVIi84RezZm3H5BWGcwI/LGq1wS6ELbGW/Y3eK1kDYkNmPWjVuVkLQ
         9+Q7sfLRXb+fi86SZFyQV7U70icgd8c3otES5K0iAZjPDL1YgFh2IieQz6blhG6O0gCN
         rlsA==
X-Gm-Message-State: AJIora+j41T31IGD31GoqT6DrdMN89o+O+/kYtbSiEMV7gHbACMKWoIy
	Lv6VVva6iUI17UxQNIrhcm9f5g==
X-Google-Smtp-Source: AGRyM1vMyAY5ZgoPt421IVDHIPT6UJZNTrC3UubKNP59oeP8S8flayelqZc1t+7PxEyZbImcTFD6Ww==
X-Received: by 2002:a17:902:d591:b0:16b:a170:8586 with SMTP id k17-20020a170902d59100b0016ba1708586mr13893903plh.91.1656687100324;
        Fri, 01 Jul 2022 07:51:40 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:59bf:8b47:50a0:b04f])
        by smtp.gmail.com with ESMTPSA id i4-20020a17090332c400b0016a214e4afasm15780981plr.125.2022.07.01.07.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 07:51:40 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rex-BC Chen <rex-bc.chen@mediatek.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] clk: mediatek: mt8183: Simplify with mtk_clk_simple_*()
Date: Fri,  1 Jul 2022 22:51:30 +0800
Message-Id: <20220701145133.1152387-1-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_075143_401972_60085D4E 
X-CRM114-Status: GOOD (  11.94  )
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

As part of clk driver support for MT8192, a pair of "simple"
probe/remove functions was introduced that provided boilerplate
driver functions for clk drivers that fit a simple model: they only
needed to register clock gates. Using them reduces the redundant
boilerplate code needed for each driver. Instead, only a data structure
pointing to the clock gate array and the number of clocks is needed.

This series converts all the MT8183 clock drivers that only contain
clock gates over to these wrapper functions. For instances where the
clk driver not only registers clock gates, the extra action is properly
sequenced with the wrapper functions instead of outright replacing
the probe functions. The converted drivers also get removal support.
This also reduces the overall size by nearly 600 bytes.

Patch 1 converts the MT8183 clk drivers that only do clock gate
registration.

Patch 2 converts the audio clk driver, which also populates sub-devices.

Patch 3 converts the mfgcfg (GPU wrapper) clk driver, which also needs
to enable runtime PM, as it is tied to a power domain.

Please have a look, and merge if possible.

Thanks
ChenYu


Chen-Yu Tsai (3):
  clk: mediatek: mt8183: Convert gate only drivers to mtk_clk_simple_*()
  clk: mediatek: mt8183-audio: Simplify with mtk_clk_simple_*()
  clk: mediatek: mt8183-mfgcfg: Simplify with mtk_clk_simple_*()

 drivers/clk/mediatek/clk-mt8183-audio.c   | 40 +++++++++++++++--------
 drivers/clk/mediatek/clk-mt8183-cam.c     | 21 +++++-------
 drivers/clk/mediatek/clk-mt8183-img.c     | 21 +++++-------
 drivers/clk/mediatek/clk-mt8183-ipu0.c    | 21 +++++-------
 drivers/clk/mediatek/clk-mt8183-ipu1.c    | 21 +++++-------
 drivers/clk/mediatek/clk-mt8183-ipu_adl.c | 21 +++++-------
 drivers/clk/mediatek/clk-mt8183-mfgcfg.c  | 23 +++++++------
 drivers/clk/mediatek/clk-mt8183-vdec.c    | 21 +++++-------
 drivers/clk/mediatek/clk-mt8183-venc.c    | 21 +++++-------
 9 files changed, 95 insertions(+), 115 deletions(-)

-- 
2.37.0.rc0.161.g10f37bed90-goog


