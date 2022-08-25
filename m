Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29777C28D13
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 14:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HtZOQoGMo4CWUlfzYpbHFCXO53bMKGRthHiLsP1RK/w=; b=0lWd8xR+X47etDXFqxw0LF8ZYh
	5GYDN+7yDEUsKZPmiwgo46ZjoTYqr7tIoEEu/QBYwpWhH2LTMlMTe/Kju9nqSqZ3t7xxotWnfdGIk
	TPCBhs8f3ksoiIsdw2jqQ5PM4tXKqLzki3lLF79s0nAtR6Gh3n2KiraGjZTQAVqwu/YExuCY9W34v
	/tnoRpxlsrM9I4oONNrP3fj7HaD2oJ0euUCqnjWlVcoWr0XrTq1nLpr6HSFPkSl4H7qlqmGcou5fY
	iN5TkgkI7RV/vpuwFu6CDtLYh4fSg4UZ8V/cfdjPpHGyBdMIbAppGP1+EzyfLVTAlJxaXhC4MUiNa
	7vqszEnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRDg1-00FE3I-Cz; Thu, 25 Aug 2022 14:17:45 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRDfZ-00FDko-6t; Thu, 25 Aug 2022 14:17:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 22CACCE2553;
	Thu, 25 Aug 2022 14:17:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C7BAC433C1;
	Thu, 25 Aug 2022 14:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661437025;
	bh=RGbu5Vn25p9iZKa8664W6/TF1O6hzGjkkQucuvSbfLo=;
	h=From:To:Cc:Subject:Date:From;
	b=aDXxAMAE8v/tgx5BG+irGyQCIdwGo01vX0Ui6jzDhqxQ8HRDJirP25bn0CtVHbAmz
	 Wz0kwLC2mkMymod31AYmjvD1XEcuapkQV71cII5j80kUhFmrQsRHwa+eQlDirUVvsq
	 MJ6fbnFEWolvpM9tudSjR4xeWupvtq8hw7ON+Z6hhM6/qtovmidTwP/rVq1XMdvtkQ
	 b8KguTh9DMu3bOjTb4R/Mzkt/1Ag7fpzpIrEDmcZ3x7w4YhPFPA0nmuE1Keumztb5w
	 9FuGj/EwyOHr2XzPjM0/BwUsNN51sf9WRNB/MHMZlKLRF06Jc5B3+0vkSqHOgYlLoS
	 Hka9PfLlV+imA==
From: matthias.bgg@kernel.org
To: lee@kernel.org,
	robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	mandyjh.liu@mediatek.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH] dt-bindings: mfd: Rename mediatek,mt8195-scpsys.yaml
Date: Thu, 25 Aug 2022 16:16:56 +0200
Message-Id: <20220825141656.15747-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_071717_470220_2452F0F1 
X-CRM114-Status: UNSURE (   8.72  )
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

From: Matthias Brugger <mbrugger@suse.com>

The file describes the scpsys node for all SoCs and not only the mt8195.
Rename it to reflect this fact.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---
 .../mfd/{mediatek,mt8195-scpsys.yaml => mediatek,scpsys.yaml}     | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/mfd/{mediatek,mt8195-scpsys.yaml => mediatek,scpsys.yaml} (100%)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml b/Documentation/devicetree/bindings/mfd/mediatek,scpsys.yaml
similarity index 100%
rename from Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
rename to Documentation/devicetree/bindings/mfd/mediatek,scpsys.yaml
-- 
2.37.2


