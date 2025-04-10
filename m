Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A74C3601E
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Apr 2025 14:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o2XGeWYqnGyGZ/eLpTfrUcu0OnKxatPP6lBPlJWQL1o=; b=NBvnhNuImg1Vaf
	nhDGrVwXiqcgkMf2LH1cHUKHQmvC/h/rVMqAF1lL1SO8+0dpo5ySo81c6g3QrWtIpaI9wSbgdEvII
	acs5YFJ8Tl2D0AD8GdKm3L3pPop3FVjDV7RGCXOceRSSgsLgZHyhBezA4yOAjm29g28cX8bzzXxgQ
	nHSAU+5ti5BXtbtgH4mjOLVIMWjfOd5suIjqG/v0B8TRfmLcAzAGzSPBEQOlMA4H/84od3Q2UvSdS
	hGFmFdLhlUYaPc0H3iD6JrPf/e3CbhbEKKIbehHUKdi7OQsc8SySXUM2oAcM4w+oh0UNIJM3wXgJh
	AEE4BjOFAIcmgbZ+5SrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2t6R-0000000Asmt-0qxT;
	Thu, 10 Apr 2025 14:42:03 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2t4K-0000000AsJi-3DXo;
	Thu, 10 Apr 2025 14:39:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744295991;
	bh=fQLVhdECukn8rSnKioZ4Hkj2E9G8FUbxvYOvve74Sbs=;
	h=From:To:Cc:Subject:Date:From;
	b=VigZi9Q3jBLWJn/fh7ChGoQpxIboSo65/aQK+G92HSh1pXJOHrqIubrpp7ZHmmbPP
	 7YtePeEWQEEKjF5mCuxMxJ7gYFqFJZERKXFCbZ3gZJnG27++i5b2529uaOEFLO7lLL
	 22fleaCt56LcgyVFNgYRS5ZhN8CSs/6G0AWi6EjSfkU40VldYIqdY1sp9iH/sqk7GE
	 m7bWh94XZUXnwS/FVTWZ9T0FmDEyltm2/Fs0dEaZiU9aLUIpCt7twD7hNrESYnAzpI
	 t6AhmZFJrvZ/zPG83MM7m8uT4S+9qPUxxPKf70IqNNtAv8rD2VQzLHrdvJkSbQYxpx
	 PG6EKR/5yMVMw==
Received: from IcarusMOD.eternityproject.eu (fi-19-199-243.service.infuturo.it [151.19.199.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 64F0317E0C8D;
	Thu, 10 Apr 2025 16:39:48 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh@kernel.org
Subject: [PATCH v1 0/3] MediaTek Dimensity 1200 - Add Power Domains support
Date: Thu, 10 Apr 2025 16:39:41 +0200
Message-ID: <20250410143944.475773-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_073952_958257_39CA4CF2 
X-CRM114-Status: UNSURE (   9.15  )
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, mbrugger@suse.com, y.oudjana@protonmail.com, linux-pm@vger.kernel.org, ulf.hansson@linaro.org, linux-kernel@vger.kernel.org, mandyjh.liu@mediatek.com, lihongbo22@huawei.com, wenst@chromium.org, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, krzk+dt@kernel.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In preparation for adding basic support for the OnePlus Nord 2 5G
DN2103 smartphone, this series adds support for the power domains
(MTCMOS) of the MediaTek Dimensity 1200 (MT6893) SoC.

AngeloGioacchino Del Regno (3):
  dt-bindings: power: mediatek: Support Dimensity 1200 MT6893 MTCMOS
  pmdomain: mediatek: Bump maximum bus protect data array elements
  pmdomain: mediatek: Add support for Dimensity 1200 MT6893

 .../power/mediatek,power-controller.yaml      |   2 +
 drivers/pmdomain/mediatek/mt6893-pm-domains.h | 585 ++++++++++++++++++
 drivers/pmdomain/mediatek/mtk-pm-domains.c    |   5 +
 drivers/pmdomain/mediatek/mtk-pm-domains.h    |   2 +-
 .../dt-bindings/power/mediatek,mt6893-power.h |  35 ++
 5 files changed, 628 insertions(+), 1 deletion(-)
 create mode 100644 drivers/pmdomain/mediatek/mt6893-pm-domains.h
 create mode 100644 include/dt-bindings/power/mediatek,mt6893-power.h

-- 
2.49.0


