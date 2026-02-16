Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85808E81A43
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Feb 2026 16:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eFUae8M607uXIOUb6KuR+f1ZcnqADfRg4QxjDLkY0MQ=; b=RiNm+sZF77lrANAmfultue349D
	7ugvqK7j5DewjX32c4XVGlydxAa0bb+2jdkwXzalfOsQ/cV9ZZOMEx73chGC5qq+u5o7SngpDNaaK
	jBnm5rzwRO4cE89k8CL+1ugbd+UAP4Fi0nui9ZY2QAexn3zkYbuTWrQCe4txPTjENdj25jynnRlyx
	vO79Tz+XKrEf7J47JTaX2SMxFfK/ryvXytq2k39WGkFg+hin05z5iesSVH/WfJv0glG8D3/5N+r0j
	grtOlfSf7SHyPR3ml6W+ceD2m0vbcmJfdUKvMM4Fxc5F7PjOJHzN+KNmZW2gmGqfK0vFJ2wFgz0Xx
	Sw5QS8IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs1P5-000000070mn-2sNz;
	Mon, 16 Feb 2026 16:24:55 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs1P2-000000070kX-3Nak
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Feb 2026 16:24:53 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-43638a33157so3283548f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Feb 2026 08:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771259090; x=1771863890; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eFUae8M607uXIOUb6KuR+f1ZcnqADfRg4QxjDLkY0MQ=;
        b=Hf0f016kNMMNWUyaHj9FxHf7p2Vf0fUMSVMOkwfhWT17G5+zutvYEM1sZxu+v9SCJG
         T/D9G5pdCNlkB9rGK1HVkBGKqCIzuqDwSA6JDrQtxDqC+G+3WQ63yYn+Lpmxu1x9Lq+N
         OhYIGVsUp/XotrfzndPCvdHSOuXCZq/FGmxy5CZ7/7g5m+393FhOvFKz7UPb7qP0Hnpv
         g2X7JOkShko8Ue8eKu+pa5jgMnKKDvReb9KcUcacPYySjUVq8RD8AHt9TIYLC8P87amA
         uOl1Sm6wY5rYDHPVbi275uUJvEIFD8FidjJL4+sqJfY20ZyRI1RjQKPaXAXLc+6qlQQg
         6RNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771259090; x=1771863890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eFUae8M607uXIOUb6KuR+f1ZcnqADfRg4QxjDLkY0MQ=;
        b=RHF23Pjwbv6RT2rZ3ObzPEZb82DPcLTojTj3OqRON6OnbioBZ8bFDEDVNHaJCv9wKT
         IKeeo7HVJlAkwy7530HK/0kBJ1bsFaHf6rfGmLkqmEsrC+2wnRHrDcSRCPmHRu4wC7Di
         iHljUAlJiZvLjez6dDf4rnO3gOfB8Vz3kCi9BDdI5i0R3WYJ1bBIxg6ZWRZY57ijcRhs
         BBdyjYfS8V1H8/wl4Fb3IWT/Zplc5vWEDVSWtgNiivWdimX/fFuRIYIrX/H6gFfKPGqR
         IZMJOBq3pC6SqsHK5+D5NkzfM946MFqW/THXJnua6Y306jTIDFnVdLO6AEtM/MKnp4ca
         wFKQ==
X-Gm-Message-State: AOJu0YznudmDTZZ0Nzzvi2a3VYSc/rsW9edUbNF3Xfw+5WVndv+RM2oX
	yWI8thZNgcRC/TbKU+D3DYwGuraQb9wP/QszTZin/y1HeF8nqMLHJ4EX3OVpPw==
X-Gm-Gg: AZuq6aK1s7JXiCxsFbPepNQn5vSO2i6gTd4efrlOYV47b6b4vOAOzZ6pXdrigucM+zx
	FjFy1gUeLT47SXT/xQ3/tsjytq+9lNsMXciDzoHBLeQlMDp5V9rgMnbYpDn0duY3On9AWRgcxZv
	JxcRVc0YNI7GSgfbYOqRqrL0wqZSJoAO6b9RxBnJJeVBKwKJQfpGZVkcK6l0gpv6adr5gIDMEgF
	8Qcmg6SjapHWXJBV/0GSYsWrKL9x9XVUFelbhhfpxcT5innfdALDwbBRlxcCrx0PxnEFwikeXX4
	JpKJN9ALO7jfvirrosQ4jpQPGkZIbqhW29zms6Ub8+CALleVxNIX0JKeHP9IqY3eQVDo3qGa4H5
	ziTucUcxMwW0jID3P8uMNVcMqrIELT2InINKA8JlyHqW3qemqSDpW8/KdqKvN59wqFwo3qJCINn
	g0i8NvaQ9jHOxvr/3p3Sk=
X-Received: by 2002:a05:6000:2501:b0:435:e460:235b with SMTP id ffacd0b85a97d-4379795572emr15102960f8f.59.1771259089859;
        Mon, 16 Feb 2026 08:24:49 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6a6desm28775962f8f.10.2026.02.16.08.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 08:24:49 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Fabien Parent <fparent@baylibre.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v2 0/6] Add support for mt8167 display blocks
Date: Mon, 16 Feb 2026 16:22:11 +0000
Message-ID: <cover.1771258407.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_082452_857706_C12DDEB1 
X-CRM114-Status: UNSURE (   9.94  )
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

This series adds support for the display blocks on MediaTek mt8167.
Tested on Xiaomi Mi Smart Clock x04g.

The first patch just does some reordering of dts nodes with no other changes
as this makes later patches cleaner and easier to follow.

v2:
 - Separate patch for mediatek,dsi-phy binding;
 - Separate patch for mt8167-dsi binding;
 - Simplified OF graph endpoints in mt8167.dtsi.

Luca Leonardo Scorcia (5):
  arm64: dts: mt8167: Reorder nodes according to mmio address
  dt-bindings: display: mediatek: Add compatibles for MediaTek mt8167
  dt-bindings: display: mediatek: Correct compatibility for mt8167-dsi
  dt-bindings: phy: mediatek,dsi-phy: Add support for mt8167
  arm64: dts: mediatek: mt8167: Add DRM nodes

Val Packett (1):
  gpu: drm: mediatek: ovl: add specific entry for mt8167

 .../display/mediatek/mediatek,aal.yaml        |   1 +
 .../display/mediatek/mediatek,ccorr.yaml      |   4 +-
 .../display/mediatek/mediatek,dither.yaml     |   1 +
 .../display/mediatek/mediatek,dsi.yaml        |   5 +-
 .../display/mediatek/mediatek,gamma.yaml      |   1 +
 .../display/mediatek/mediatek,ovl.yaml        |   1 +
 .../display/mediatek/mediatek,rdma.yaml       |   1 +
 .../display/mediatek/mediatek,wdma.yaml       |   4 +-
 .../bindings/phy/mediatek,dsi-phy.yaml        |   1 +
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      | 381 ++++++++++++++++--
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  12 +
 11 files changed, 377 insertions(+), 35 deletions(-)

-- 
2.43.0


