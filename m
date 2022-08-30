Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B51ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 09:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=psf0bCq1w3vqARA027yWfCxws5BR6AkKlgkDwNehCv4=; b=JutB/EZerG8R3qorvCJIS1K1pz
	udLPsr8LtUSWLXbSQAsV+rU/omgrhaVBoy2blQI0tcxfWMiYzNRGWHDDFmIh6kJlwbk1aqQ+35rUQ
	FHOU8Pm4TrJy9a5monza/k1AESfaOy9lT7o915gv2UVE8PVqzK+KfNBHYOJWRVLYWj9wA0wIox5ux
	QEI0/caLr5CAfpavBrEX85+IQ0T9FPTzlGplNe2Yx4pX05x/Wuk9NfLGJJ1txvcVDWfLyXa+y6zIr
	dz1aEPul9SM7VaiOyxFEbAQWiBDXYb+mCfChO72HoH/av62JFpAfzMqLv40I+5pcZxhun7e4hxxpH
	hByo5sbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSxHa-00FUL2-N8; Tue, 30 Aug 2022 09:11:42 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSxHK-00FUAO-QX; Tue, 30 Aug 2022 09:11:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1A0C8B818C9;
	Tue, 30 Aug 2022 09:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49C1BC433D6;
	Tue, 30 Aug 2022 09:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661850683;
	bh=6mH6KAOzeUMtuElAC5LgYu+P+CwsGf8BlEkNtVomIv0=;
	h=From:To:Cc:Subject:Date:From;
	b=mtTDSFldT9ZlYtL11lxVm1EUf04IxYhU3aEwp5ywLJX417Pcw1VEXZhViY/lYnGC3
	 wAL7UaOmu2PQ6u09KsQM0p9usAiG51KluFsfDG3EtZXsikuCjd0O9p1QD4fWhYVaIB
	 bIHSbsPPMYvlQ5ath/M56s3ZWWfv0TRAdqMmxY3Qx/6wAe5iZ2WMxRtAX5fDYVglhy
	 bVFQ5p643QbWT5MNf6zhzYaFZpim/f7R+9ZyBrxDnjyjREPfjeWhpmIf/SmkJ8ceoN
	 hTL86eEuv6OvTFL1wWuLjNwg7RxJRjzUKWVkvgVGIXKaNJC7UOzDjRYiVghXKc6tcY
	 g1ozAAkxFebKg==
From: matthias.bgg@kernel.org
To: matthias.bgg@kernel.org,
	lee@kernel.org,
	robh+dt@kernel.org,
	angelogioacchino.delregno@collabora.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	mandyjh.liu@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH v2] dt-bindings: mfd: Rename mediatek,mt8195-scpsys.yaml
Date: Tue, 30 Aug 2022 11:11:10 +0200
Message-Id: <20220830091110.27857-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_021127_068610_C4BABF3D 
X-CRM114-Status: GOOD (  10.72  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

---

Changes in v2:
- Fix id

 .../mfd/{mediatek,mt8195-scpsys.yaml => mediatek,scpsys.yaml}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/mfd/{mediatek,mt8195-scpsys.yaml => mediatek,scpsys.yaml} (96%)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml b/Documentation/devicetree/bindings/mfd/mediatek,scpsys.yaml
similarity index 96%
rename from Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
rename to Documentation/devicetree/bindings/mfd/mediatek,scpsys.yaml
index 3737207d8504..1a5901ca90f5 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,scpsys.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/mfd/mediatek,mt8195-scpsys.yaml#
+$id: http://devicetree.org/schemas/mfd/mediatek,scpsys.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: MediaTek System Control Processor System
-- 
2.37.2


