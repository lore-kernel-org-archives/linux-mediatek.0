Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CEFC05027
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 10:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uNwY3WhUBdnk8yhJNb4Zx4HetM10Z/KQKIBuTbkyYG0=; b=JdW61qVWG54Te7A7jbvckIjufR
	eeeen+pbHdiz0wYaXEDjYGlzKMFRt3CbBWmzigKezUAGvCaJY1cYGv+jkmhTDYabwjzIZ2DDpqfgn
	4q3AH62H3+p0Dlj4HxJfr99ZDNpnk/MU4b0fA6fLxWQ8MIbRq9jJQ8+V5LIt8aT1oSgnIjzDwJk2u
	Q6IvSP9JXMGszioOVk3YCpbgvjb3m42oCA2RoIm0uBzXJ1IwDMuNruEy8t1cQdtt/Y6FP2gGeFr+K
	3aRDGEWCYkj+r9OcxldtcMwGIc1vIPOM1AaMfPekEBxdlKPbjLpkPkTOy/b/u3OgxeBqo6BNGR/VL
	UXU3J3jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKzbr-00ATPp-LA; Thu, 26 Jan 2023 10:35:59 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKzbV-00ATEr-Is; Thu, 26 Jan 2023 10:35:39 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 19B0C6602E68;
	Thu, 26 Jan 2023 10:35:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674729333;
	bh=/1IZcCeBq30sq5XeIYZ5KDLyqOJxHaleT4KHHY+u2tY=;
	h=From:To:Cc:Subject:Date:From;
	b=A9ow93CX82rwbOjV2A12hJRXCzXASSFhXhEUn6h51FMJlMVrusHLYjz+rxAru6pID
	 8uoGq8zHa+ThXlWuXKK2ETPe74qlU4twfCmvf2qwNUbR0OfAf0kFgVKJ/sCfPn+z3a
	 4MNvSilVNnzgbClLs0pCtJTU9Gq2p3EAtqH9JhVkJ3Vj5OHV55uOelAk9h7AC5CgD3
	 9gyUuVyHaLI94H0Xyc9pyht97msWATScWCY56kX2KlTb3lM/qR6Yp95dSR2cWAsAae
	 KVBmJrKvb/wc2OVcI06w35T6D+QjHTgYFqZ7TPGWKRtB0ztNlS3vVlhXeIrbNl8rgh
	 O+uzOFwT8IctQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	seiya.wang@mediatek.com,
	tinghan.shen@mediatek.com,
	allen-kh.cheng@mediatek.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/6] Fix MT8186/92/95 topology and idle state names
Date: Thu, 26 Jan 2023 11:35:20 +0100
Message-Id: <20230126103526.417039-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_023537_786663_7565DC84 
X-CRM114-Status: UNSURE (   7.81  )
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

MT8186, MT8192 and MT8195 use ARM DynamIQ, which combines big and
LITTLE cores in one single cluster! A two cluster topology is simply
wrong in this case.

While at it, after some research, I've also noticed that the names
assigned to the idle states are misleading, so I went on changing
them to reflect the actual function.

The names change commits, unlike the CPU map ones, didn't get any
Fixes tag, as naming changes aren't fixing anything that would be
meaningful for functionality (it's cosmetic, nothing else).

AngeloGioacchino Del Regno (6):
  arm64: dts: mt8195: Fix CPU map for single-cluster SoC
  arm64: dts: mt8192: Fix CPU map for single-cluster SoC
  arm64: dts: mt8186: Fix CPU map for single-cluster SoC
  arm64: dts: mt8195: Change idle states names to reflect actual
    function
  arm64: dts: mt8186: Change idle states names to reflect actual
    function
  arm64: dts: mt8192: Change idle states names to reflect actual
    function

 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 30 ++++++++++----------
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 35 +++++++++++-------------
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 34 +++++++++++------------
 3 files changed, 46 insertions(+), 53 deletions(-)

-- 
2.39.0


