Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E0BEC1106
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Feb 2026 16:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GPabK+sR6tt9Q+NXwIlbFeumv2ta8pwtwfHRnJheAtg=; b=ZtjlmmOhqg4XlNepZ15OPIu9qT
	/fD0OwmnmNQyam+bMhCFEJfH8qI5enEjpLjRyFaTLxvMnGSl+R31DheIde7+T5A7d8eA+w0LhrWq7
	SsnrpOG0t99eDA3DB7fNAxGxt/lyA88H5s1U9Ck2yZSfPf/zaQ2h6ygLBzazPoBm4OilQX0F6Nees
	YtVtyjV3QNhT0p74iqPjKKEQuU+1se8LR4HNyflGcGcu4idyww7j7xCNLBFpidcalgt3GlA1nRXVV
	uaOU4zRPcwWX7mCoqcE9tTQFYoSSKZIJhHMVXJ1BcP/dDk0CHcFa2Wiu+ndxwh4vLxYMYfQpOqOfa
	pBWOollg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYlb-00000000flP-3F2l;
	Mon, 23 Feb 2026 16:26:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYla-00000000fkS-0oYk
	for linux-mediatek@bombadil.infradead.org;
	Mon, 23 Feb 2026 16:26:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=GPabK+sR6tt9Q+NXwIlbFeumv2ta8pwtwfHRnJheAtg=; b=k6NL9F36mLeYfEqBlNPH0Q70oK
	u6XTqK9rSUZGV8In5s24GfnTdC/A1FcreBzT9ZIi+mnpu99yVMGH8M/IHG53jb8ofJ5UyI96OhATr
	X6GKkHBcfIGGjHOudVn6IQQTLAGNrwvsBC4kfDiskcf20nkXns4jYS5RThLpCe7/uTIVtSD5v05Q8
	1xVrePnYVxbqINJO4bzC8EGMA3jqr/lehlIAVNTuGAi8uloj1Umiy56gj0KDr2CaremR7QOXz2Xk1
	j3M16K3UyIKXtWtaSNx8WNaYBPAxLMIhF20lzsBddvQuGYJCuVwQXWldd1CeIBbiHORl7SVQmjyT5
	h9qcSjGw==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYlW-00000005T47-2kf6
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Feb 2026 16:26:37 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-436309f1ad7so3403932f8f.3
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 08:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771863992; x=1772468792; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GPabK+sR6tt9Q+NXwIlbFeumv2ta8pwtwfHRnJheAtg=;
        b=eCR4GKJD3ly9qIlIlTPoy2FOuo5CG1vebz0qG9ANKDraeAiN8oJNaGtPGIAw5X+MRJ
         2BjJOcF7hCoDzQvzSpKtSZYxx1ydpm3wq4u0CoKd614AAkfqQm1pO+m+u2skcsA/j4JE
         kjzxha7O2BQDlT93np951OEBtM9Q3/024gBEJMgMOohO+2oENYRO8eoTWKENzA96d5LU
         LM1Otv9Khy+Ydu822rRJUU74zfTrl1SWXF68rKeR+AH5/dwPeevQ1yjL1npGsmz2g1rr
         QMJBsEXbb3qYBc+J8PbBBeAZU0GKVegzpDVPHtI8QnglGH8QxoUZ4C3m9dCHbDF87/oP
         reEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771863992; x=1772468792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPabK+sR6tt9Q+NXwIlbFeumv2ta8pwtwfHRnJheAtg=;
        b=vmquhuBtawaUBBrI+U08du+hiRjo+Y+4K/EREtfhUZ8Tr1ASbPB9F3PkOyWgySgvaK
         pupegc0uO4nKsGBf5g6PLpjxls3k8GG57s0S5fbFsEmLGXFZ3M63z3mlYa9SsMweWbdc
         WEXmYSBbThlIHm0rd8PAc9n7PVgYLU0lG/irkWU2ZtDoJNd7CBZZjwXchcBuOgrQmQ6Y
         yiGv/NRheiNi1JpIBcqCpvyk+1OT9BD4vLIWTQVid497swbkIeexshvh333JTAbDI7rC
         J6ms8/7qWtFZRmqckWKdrbmx6XS3aTYJzhyBZAUY6QbrNB2rgVvlTBYOqPFABySfcjtO
         1IiQ==
X-Gm-Message-State: AOJu0YyYw85mH5qMo3IvQdHaICBGfVUytOnLlUMLkYyepGj/+LJnHObN
	RipSBCJBbYG35hu6Xdd7sbd9qBYpaqB+dYU/es2z0OEFUJNMRjNdT3p5h4FB/A==
X-Gm-Gg: ATEYQzw2MzvsfzkPySDJ3tp7z9kFoKGaSjrJKL9uldRAdkZUrM6WdUV32cJ1pwpl9Hc
	Q7W/HeQSdWD4Mn/tpizEwYdYqjGmCjhV8GrOVsWCMxcOlgRrdHAUf0ECV7zwrPq25VX63NFs9y6
	j4A7OBEnOKnX3Eo4w7p0hl1INc3fg7EP2paCYHZyrmR3Zm6WtxmsO5KJDC/Z+spIi1bQWK9cEdT
	Q/k7i6BgRVINoalpHZfd8Xw2HTdL+CyKfOgnsOznIxUVKRYoM+mHzFtW9gIivZtP5G2TWA4ssp4
	2DhL7lyYwljstiPLsOtax6juoPOT0vXd7Huz1oAFG+D1NwZ03mG9ZeOWmFFOEqdGJDexSZ+w2Bp
	ZWAavytRKWbqVnf0bD6u2fFfYQF2XaCszRL1ToNdAdCwqhO32wAo9GU17zZ1jyENO0ym5xUj/6j
	QOaYR0WSBxwIOki4LYgLg=
X-Received: by 2002:a05:6000:40cd:b0:437:719d:a753 with SMTP id ffacd0b85a97d-4396f156a40mr16159891f8f.11.1771863992210;
        Mon, 23 Feb 2026 08:26:32 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d5463dsm19120357f8f.34.2026.02.23.08.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 08:26:31 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v3 0/6] Add support for mt8167 display blocks
Date: Mon, 23 Feb 2026 16:22:44 +0000
Message-ID: <cover.1771863641.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_162634_741611_B23A730A 
X-CRM114-Status: GOOD (  10.88  )
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

The first patch just does some reordering of dts nodes with no other
changes as this makes later patches cleaner and easier to follow.

v3:
 - Added mt8167-dsi compatible to driver instead of changing the binding;
 - Resolved patch formatting issues.

v2:
 - Separate patch for mediatek,dsi-phy binding;
 - Separate patch for mt8167-dsi binding;
 - Simplified OF graph endpoints in mt8167.dtsi.

Luca Leonardo Scorcia (5):
  arm64: dts: mt8167: Reorder nodes according to mmio address
  dt-bindings: display: mediatek: Add compatibles for MediaTek mt8167
  dt-bindings: phy: mediatek,dsi-phy: Add support for mt8167
  arm64: dts: mediatek: mt8167: Add DRM nodes
  drm/mediatek: dsi: Add compatible for mt8167-dsi

Val Packett (1):
  gpu: drm: mediatek: ovl: add specific entry for mt8167

 .../display/mediatek/mediatek,aal.yaml        |   1 +
 .../display/mediatek/mediatek,ccorr.yaml      |   4 +-
 .../display/mediatek/mediatek,dither.yaml     |   1 +
 .../display/mediatek/mediatek,gamma.yaml      |   1 +
 .../display/mediatek/mediatek,ovl.yaml        |   1 +
 .../display/mediatek/mediatek,rdma.yaml       |   1 +
 .../display/mediatek/mediatek,wdma.yaml       |   4 +-
 .../bindings/phy/mediatek,dsi-phy.yaml        |   1 +
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      | 381 ++++++++++++++++--
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  12 +
 drivers/gpu/drm/mediatek/mtk_dsi.c            |   1 +
 11 files changed, 374 insertions(+), 34 deletions(-)

-- 
2.43.0


