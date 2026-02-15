Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45688EF586F
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Feb 2026 08:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sAQNxQv4JzsX9m+4gmiEwv4VehekE5HhN8PtLOEQY1Y=; b=d0B6D4VVzxvMjaAmUqEYiqOOjc
	HLMjefVtpEGiB+dU92bV+G+ae4iSTpxOk9bXiMi2RtXsdovD4+xxC9BF0dWNrUhzMrNqdBme3LIOd
	fCmSSk5WZvoXItRg06I+k3uKw8cNs9B4zRLQLZQ/rTzBXBEvRokFzwG3cGMflsYZAA2mQG9x6qUPy
	3DhSWQXZN5LzeFVAvJb7lD8/u+eY0JJJ5awhFRpqA1VwzGgx6haqnEQ01OLNYxppeVSzH2fo8IJsR
	9jaAzUU95eJi4p/+ZZjr/LULq0l5xTT0dUHDWfVDgwTklzlh0xj5wIWVnjS2hN07MtEPMmL+HFrim
	gAiVb0yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrXup-00000005H7e-2mTQ;
	Sun, 15 Feb 2026 08:55:43 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrXum-00000005H5i-0ZTe
	for linux-mediatek@lists.infradead.org;
	Sun, 15 Feb 2026 08:55:41 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4807068eacbso16809165e9.2
        for <linux-mediatek@lists.infradead.org>; Sun, 15 Feb 2026 00:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771145738; x=1771750538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sAQNxQv4JzsX9m+4gmiEwv4VehekE5HhN8PtLOEQY1Y=;
        b=U2heVTBrA2/Ui/qJncYndQuoAnc5mxg0uvsRkm0IRnby6WXD5AQKpzuwvkFSDN42KN
         dInghujX7WhpiyGbXsf8h/AYpFVoYbFx8qvyVzndd09dw48sT55LFk4ovsrTLUyxtSDH
         m2SiSHFjAgzfrQko84NL15OTrE/8HNPcv0fSN885re9cx9OXo0vqRuOAuLZ7lKbr7fze
         3RkCHaFH8tpvE5YtxraS13YEU+tlxmKMBF/6fDcag/dexnXNghPSvINeOjv5Gczv8q2O
         7CAZfBe4WuAHLzA1Hx3x+ZGyuRbsZH6rMLP+9dBhVeGVNcwsDokkO2XMSrdEFY1m6vyZ
         o+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771145738; x=1771750538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAQNxQv4JzsX9m+4gmiEwv4VehekE5HhN8PtLOEQY1Y=;
        b=GYHUTDC51xq4DCYzODCUPBWoyTG1OwZu8UhDeDTePiZFMgEhvE/LuGVwUjkenoh7MI
         gnY8qD7CNthpCV8QYGI6tlQRHJXVa85FK5wrNOw3AWX+cOjCPF81RuBZwHPznKQLB5MN
         lVyYdPOA/TjhABvBxiT7mxofQk2RIFegJJuYmi/UjIGalsWAgmJWZAPmkK37ksHkCMk6
         V6i1GzRZYJk6i2Cl/44pBVyn3OmeyOb0s4Grde+SQxZLvc+K3BZrlo5EeclDK+hAG+Oo
         LENIo6vCp2Iz0az0IMLA+CkVAzz9fvMsU9iQ28fGUh/vqM0ByMHXVjOaZQuOln1s3lVX
         nIww==
X-Gm-Message-State: AOJu0YzVX8FzMRKgAMlYkpa9DvzmO+jngKro9bbGO5k42ZBYDNn2N4+j
	6RyGnworFZYpkdHqSOdOWOvvA+p3SVBZR/HNLqrgcEKxkpN0/V44TCwytgB22w==
X-Gm-Gg: AZuq6aIPRxg5iSy6cI0FcNB3k0LDg046gu9pn7MB786awxvqOLMGWrclbh4oE87jzxu
	tV6aDW8wSHbArqPSVX/eOdi+YhgCn/5H5QLvXNQwPdKEEZ5wPFLKYGASDFLNWWnp4GfA3l3hZN2
	b66KNWElGkquNtsiCyDuDhFL/KQ4JjjRZ2MZa0rYcLnvP21Qdsuxmr2X3cwv/DAiCqNqcSME+kt
	6KnV5a3c5U9QgSEDHk3ac7RzRVu9bPPOSKKUZeLg7YhieZByaT10EsORh1/qH/4tWVhbogtDIsc
	yQwRuKSoe2C6zlqG1I08iaP1TD77O0rZZ1ACuK9iF5L1r5Cw7hM6yxYugx9U0KSsol/O10UWDLV
	TnUD9ayQqBKSktxYKI3eaxwmib6GYl63F3pyHeOqXJqUYxLGq+syhwjzk41PVj7aH0IyIPqYrhM
	az0WpVnqA0Sedv6URFZZ4=
X-Received: by 2002:a05:600c:314f:b0:483:6d4e:9811 with SMTP id 5b1f17b1804b1-48373a73ec5mr119238475e9.31.1771145737543;
        Sun, 15 Feb 2026 00:55:37 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5d78cfsm547211675e9.1.2026.02.15.00.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 00:55:37 -0800 (PST)
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
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH 0/4] Add support for mt8167 display blocks
Date: Sun, 15 Feb 2026 08:53:52 +0000
Message-ID: <cover.1771144723.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_005540_246901_DE183DC8 
X-CRM114-Status: UNSURE (   9.39  )
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

Luca Leonardo Scorcia (3):
  arm64: dts: mt8167: Reorder nodes according to mmio address
  dt-bindings: display: mediatek: Add compatibles for MediaTek mt8167
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
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      | 450 ++++++++++++++++--
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  12 +
 11 files changed, 446 insertions(+), 35 deletions(-)

-- 
2.43.0


