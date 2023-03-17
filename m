Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81E3C74A5B
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 20:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wWVS4S6J65BvH0oRIVS/7c6LDOVdjwmPQ6PMnkrK3cw=; b=3aJpmrutnGjhqCfL25Vx9Qz8zT
	W9LkDzehiiu05rHHg3JAEA/RDpZ93SXR3sl5019R+uu21BkKJyUuTZvBClIcYt+Eo0jfs138Kymn9
	amdXEgzOctzE+SMqZQ0HjiCgXNq/feyQ51pmgpxMhtdHwZA7J2yVTTcQRMX/TvuA0HPGXcnCrSKhG
	r/Qb6nBZjHoHN04YkBaZVVcyj6UPPeJBpN5XhVnPpiEuE85tcsErwXJttN5HH85TVpYI6maoB/ig8
	Az4+RtgqyWJy+FMmZvL8+ayfV77G20vjfjEnvSrCHN9qBQgVQnV5fSkOdoqBiw7IFx4fxUIXGstj1
	dxoSxVHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdH7c-003Mnb-0Q;
	Fri, 17 Mar 2023 20:56:20 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdH7V-003Mky-13;
	Fri, 17 Mar 2023 20:56:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B2624B82586;
	Fri, 17 Mar 2023 20:56:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AE28C4339B;
	Fri, 17 Mar 2023 20:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679086570;
	bh=VzXlHxYNFbUcVstTyt9EJfj+teDRoE31sK1fPAn46Oc=;
	h=Date:From:To:Cc:Subject:From;
	b=BaWU4SPzIsEjzmEUwROAS+A0XupSs9pAyKe6SsluWorDLlQLQ48c/R4PXMIjUoedc
	 l6OqnAFh9uO30POohnzH1oJgyTxZ+f/Hqmxf7TTBIbB1INTdvPH5ykgGPIRQUFM0M6
	 /BPC2XuqpbKgsrSyVHiKQpPrFv3l4mhFidDd7VyrpyK86bvhFkoftJsZVJu/vVEDIT
	 tBeZaCGmCb+uokVSbHxAJB1Is5v9mVVkDLuAUoezD8pLhBuHxs1nvpGNQQQAo5xLHq
	 4Y6JbrC9reKmg13EYFaXLK/HYGfy8PdYc4yuwIfSXuhppR2Sv38Y6n2qwZ7nNYnT4I
	 r5R2eub3YFFyA==
Date: Fri, 17 Mar 2023 14:56:39 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH][next] wifi: mt76: mt7921: Replace fake flex-arrays with
 flexible-array members
Message-ID: <ZBTUB/kJYQxq/6Cj@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_135613_659060_5E792BD7 
X-CRM114-Status: GOOD (  11.33  )
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

Zero-length arrays as fake flexible arrays are deprecated and we are
moving towards adopting C99 flexible-array members instead.

Address the following warnings found with GCC-13 and
-fstrict-flex-arrays=3 enabled:
drivers/net/wireless/mediatek/mt76/mt7921/acpi_sar.c:266:25: warning: array subscript 0 is outside array bounds of ‘struct mt7921_asar_dyn_limit_v2[0]’ [-Warray-bounds=]
drivers/net/wireless/mediatek/mt76/mt7921/acpi_sar.c:263:25: warning: array subscript 0 is outside array bounds of ‘struct mt7921_asar_dyn_limit[0]’ [-Warray-bounds=]
drivers/net/wireless/mediatek/mt76/mt7921/acpi_sar.c:223:28: warning: array subscript <unknown> is outside array bounds of ‘struct mt7921_asar_geo_limit_v2[0]’ [-Warray-bounds=]
drivers/net/wireless/mediatek/mt76/mt7921/acpi_sar.c:220:28: warning: array subscript <unknown> is outside array bounds of ‘struct mt7921_asar_geo_limit[0]’ [-Warray-bounds=]
drivers/net/wireless/mediatek/mt76/mt7921/acpi_sar.c:334:37: warning: array subscript i is outside array bounds of ‘u8[0]’ {aka ‘unsigned char[]’} [-Warray-bounds=]

Notice that the DECLARE_FLEX_ARRAY() helper allows for flexible-array
members in unions.

This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
routines on memcpy() and help us make progress towards globally
enabling -fstrict-flex-arrays=3 [1].

Link: https://github.com/KSPP/linux/issues/21
Link: https://github.com/KSPP/linux/issues/272
Link: https://gcc.gnu.org/pipermail/gcc-patches/2022-October/602902.html [1]
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7921/acpi_sar.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/acpi_sar.h b/drivers/net/wireless/mediatek/mt76/mt7921/acpi_sar.h
index 35268b0890ad..6f2c4a572572 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/acpi_sar.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/acpi_sar.h
@@ -24,7 +24,7 @@ struct mt7921_asar_dyn {
 	u8 names[4];
 	u8 enable;
 	u8 nr_tbl;
-	struct mt7921_asar_dyn_limit tbl[0];
+	DECLARE_FLEX_ARRAY(struct mt7921_asar_dyn_limit, tbl);
 } __packed;
 
 struct mt7921_asar_dyn_limit_v2 {
@@ -37,7 +37,7 @@ struct mt7921_asar_dyn_v2 {
 	u8 enable;
 	u8 rsvd;
 	u8 nr_tbl;
-	struct mt7921_asar_dyn_limit_v2 tbl[0];
+	DECLARE_FLEX_ARRAY(struct mt7921_asar_dyn_limit_v2, tbl);
 } __packed;
 
 struct mt7921_asar_geo_band {
@@ -55,7 +55,7 @@ struct mt7921_asar_geo {
 	u8 names[4];
 	u8 version;
 	u8 nr_tbl;
-	struct mt7921_asar_geo_limit tbl[0];
+	DECLARE_FLEX_ARRAY(struct mt7921_asar_geo_limit, tbl);
 } __packed;
 
 struct mt7921_asar_geo_limit_v2 {
@@ -69,7 +69,7 @@ struct mt7921_asar_geo_v2 {
 	u8 version;
 	u8 rsvd;
 	u8 nr_tbl;
-	struct mt7921_asar_geo_limit_v2 tbl[0];
+	DECLARE_FLEX_ARRAY(struct mt7921_asar_geo_limit_v2, tbl);
 } __packed;
 
 struct mt7921_asar_cl {
@@ -85,7 +85,7 @@ struct mt7921_asar_fg {
 	u8 rsvd;
 	u8 nr_flag;
 	u8 rsvd1;
-	u8 flag[0];
+	u8 flag[];
 } __packed;
 
 struct mt7921_acpi_sar {
-- 
2.34.1


