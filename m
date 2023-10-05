Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D00BE93701
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Oct 2023 10:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i+97jlASJeCUra0UgJ+PVFfR8PvK//Er0EZ9AVj4iws=; b=UmZ6mTDz/g191UKA2EpZ802B6A
	MYjcHFVofNpYR8VUwAYM9Sl/BHMe31z/gGRbEVgRQkjPPJs0ZEbk7zbZt8KGg1BEPkJjwqG1VViUK
	W9NULds9HM1th2UBFN5Ww1PwFiLqjzkZ68O+QB2M60gKnNGeU9vEG+6/LFmRguSHvoCwuE0A7Q7De
	r4ShF5vYelJ1VJ+JqfgGajQ1zFRtXEkLeph+S9wv42MqN4F1qPCicWZH3NSS49yDefhmyGQ9ctfKU
	lN4E853flgx5lF6M5ot+EtuZZCXEEMNQDD47mzOyU2NBFeE93N0/mN1JB8QAw5pE0YZuZaxgYGHWS
	V8CTO5LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoLuy-001xkM-27;
	Thu, 05 Oct 2023 10:49:20 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoLuu-001xhU-1F;
	Thu, 05 Oct 2023 10:49:18 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DDFC4660731C;
	Thu,  5 Oct 2023 11:49:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696502954;
	bh=lFr30I+Cr7avNK4wzwGybpTkaEAtq/uM7VOwFYqZwUs=;
	h=From:To:Cc:Subject:Date:From;
	b=K9wZ35FlCGgxB/NKW138gQiIJYWnO/3EuMst1hxKCbXMEHzVpGsaRfzYehABqODKK
	 9nf/PW+08IxV+ID1qM2N5A6tAlXn9ciXWA9/py4ikoRRwxcFyv70fQ04Fdv1rVIvLY
	 z4YwXjyPfUlajcNrgK9AmXm8Zma8fBA8mKZMkP/LwfE++uE4KbMXkmqYXzaDyFwOFr
	 B3ZiDYY6ZZrUIXdaNCj3khhqlltii5P3FfxM++96SZyummWHIu8V3uTYqB30hW4LZY
	 QLM1CRCluC4KeS8YHe7ve/gcKguhEg9AfU/0zXMFiQvgPEK9i0ssyhry4wZRm/fCqd
	 QzzY24bkIgOyg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mchehab@kernel.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	moudy.ho@mediatek.com,
	hverkuil-cisco@xs4all.nl,
	sakari.ailus@linux.intel.com,
	u.kleine-koenig@pengutronix.de,
	linqiheng@huawei.com,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org
Subject: [PATCH v2 0/2] MediaTek MDP3: use devicetree to retrieve SCP
Date: Thu,  5 Oct 2023 12:49:03 +0200
Message-ID: <20231005104905.120544-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_034916_599037_E39F5D7E 
X-CRM114-Status: UNSURE (   8.92  )
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

Changes in v2:
 - Rebased over media_stage master as of 05/10/2023
 - Reworked description of mediatek,scp property in bindings
   - Dropped Conor's and Chen-Yu's R-b tags from bindings patch due
     to the description rework.

Especially now that Multi-Core SCP support has landed, it makes sense to
retrieve the SCP handle by using the "mediatek,scp" property (as already
done in MediaTek VCODEC), both to select one specific SCP core for MDP3
and to avoid walking the parent node to find a SCP node.

AngeloGioacchino Del Regno (2):
  media: dt-bindings: mediatek: Add phandle to mediatek,scp on MDP3 RDMA
  media: platform: mtk-mdp3: Use devicetree phandle to retrieve SCP

 .../bindings/media/mediatek,mdp3-rdma.yaml       |  8 ++++++++
 .../media/platform/mediatek/mdp3/mtk-mdp3-core.c | 16 ++++++++++------
 2 files changed, 18 insertions(+), 6 deletions(-)

-- 
2.42.0


