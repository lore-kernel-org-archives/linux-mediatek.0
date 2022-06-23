Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD76C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 12:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ua9xONGKparkA90gAIxIA6Pf0ddrvmgZqm3A66Wf/OQ=; b=yRb1dS3s3LMjOMn4JLT0My1lZg
	s67qlzQLkMhnzzj1At0QiseFfLolyi9SghH43adCJI+KPqZm6D6tv3KEpCvF3YZydu5zziGcbKHaz
	DbxBDptZxtKwQEaOucvjNYCvsb8AVAjuj7F2eN3UoXDwSZ9YaeOk7IOg/GHJGEjj3MhJRyFc7cWFa
	Z5WmOmn5Na2Ra1FUNOY5glFG8sMYGqyMKIpWQv5Y8lQy0u8+rGAmAr/9mwFTNGyW5a/Pih5/sReN9
	ewoe5tLrGGyxu7me82nEFvS9zvAAEpStlUm8ZvsSYct9AIRVKZI7AOa0FPQ5lz5ngXuGQ+hsJz7zd
	2HeamNQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4M7H-00F2Er-GY; Thu, 23 Jun 2022 12:39:23 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4M75-00F2BG-SC; Thu, 23 Jun 2022 12:39:13 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 99E816601796;
	Thu, 23 Jun 2022 13:39:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655987950;
	bh=Z+7l6iy/E0HjWXgHt4rh13keXPIpivzvU2defhRx6Nk=;
	h=From:To:Cc:Subject:Date:From;
	b=A//ieZIAzcSI5fVK6E0seJe7X/ZAYca6LilbLqKcSR2gzn56yl/xCbnZC9qv1Vn9q
	 8OQ3EeBtEBv33H+WyN6vR6PIsHkgEl2zo0F99p4WVl0BOQiEM8j/sptjEwsykHRgmi
	 QZzKA9DHjNl25CPXPnFoTYKuEzDg0JWf880pIfcq4ugePMQVHCDeA+5QeHnlfbBUUJ
	 Q9bzawHTDQbH0o5l6iSi/JXnwTR4d5gOJ9y2cT8Ky0zAFwI1ZLRa1a/Ag8v9iQhK0e
	 +x13Xz7Ja1PXvA6UpNQ3dVoTEwB/zctg/U1SpwdQ3Lmv7yxIjEh/a0IFu9a/teVuCG
	 p9sP/f+79uXOA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wenst@chromium.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 0/2] Allow getting regulator on MFG for multiple SoCs
Date: Thu, 23 Jun 2022 14:38:48 +0200
Message-Id: <20220623123850.110225-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_053912_079721_088BF0F1 
X-CRM114-Status: GOOD (  11.09  )
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

This is one of the steps to enable DVFS with the Panfrost driver:
since Panfrost is already enabling the (required) MFG power domains
and since the mtk-pm-domains driver is already responsible for
actually enabling the SRAM PDN, it makes sense to make sure that
the VSRAM supply is ON when trying to reset/enable the SRAM.

For this reason, the MTK_SCPD_DOMAIN_SUPPLY flag was added to one
more MFG domain, ensuring that the SRAM is actually powered and
also not relying on the bootloader leaving this supply on; on the
other hand, this is also making possible to avoid setting a
sram-supply on the GPU node, making devfreq happy about having
only one supply and finally allowing DVFS to happen.

If no domain-supply is declared in devicetree, mtk-pm-domains driver
probe will anyway keep going, so this is not breaking old devicetrees.

No side effects either when this supply is declared for both a MFG
domain and Panfrost together.

This series has no dependencies.

 Changes in v2:
  - Squashed all mtXXXX-pm-domains.h changes in one patch

AngeloGioacchino Del Regno (2):
  soc: mediatek: mtk-pm-domains: Allow probing vreg supply on two MFGs
  arm64: dts: mediatek: mt8183-kukui: Assign sram supply to mfg_async pd

 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi       | 2 +-
 drivers/soc/mediatek/mt8183-pm-domains.h       | 1 +
 drivers/soc/mediatek/mt8186-pm-domains.h       | 2 +-
 drivers/soc/mediatek/mt8192-pm-domains.h       | 2 ++
 drivers/soc/mediatek/mt8195-pm-domains.h       | 2 +-
 6 files changed, 10 insertions(+), 3 deletions(-)

-- 
2.35.1


