Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BE6CD13D2
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 09:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KPkAO3LL0QvdQ7w2MdKUYOEVc2znuVAY79aOTVN0dCo=; b=afS1YGoCvabZ3D3mIhAFzSbESA
	x8PmU4KU2VX3SmSru76lF6ZUJWVOdZraFLNU+QK74oYjPmnVRcDVJyuFfFO+RCxskyOuJhMWl9MGf
	tQkevTIAviqiVfCL67MhFNpoMmGBSj2Vbn16PQtLD1xTGdEEaz2wLVgnNnKRBtHYgRHz9ZU/Xo+sq
	LXpVcm12cW/p1eqot5CL+ZKmLDxVgCgIe6jphqnDDFExEyf+n+PvWWrHIY1yDI4QjD0FVsS9MTplh
	VCF6X6m8p9rp5MrL1ZkRd1+eabvhLemQTjJ7KPRm3pdkbDQV31/vbMU/1qph0GUHIkClbnXoGKha0
	M6UmkSCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiAi8-00Exvz-0T;
	Mon, 18 Sep 2023 09:38:32 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiAhz-00ExpF-2p
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Sep 2023 09:38:26 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9adcb89b48bso368171066b.2
        for <linux-mediatek@lists.infradead.org>; Mon, 18 Sep 2023 02:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695029901; x=1695634701; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPkAO3LL0QvdQ7w2MdKUYOEVc2znuVAY79aOTVN0dCo=;
        b=QVvjjwcTW9LLPGTGe+J27Du80r/mqo3ukasHIQOUXwCMfFJP0nVXNs/F9XEPUwnDbu
         aHNPd/sAyz0HpadTrxDLk8yNfJi3yVfFUWmPn28KCPt+tV9oTBvJvOqL0b4XEIpwgMOj
         JRrhlpzfGhscYxIyTLFTCfWrn6HldabVzMLCDXAh7mXBsR0Vloejg3S5aEF9bjg9LU87
         WCQ37dHP05D3HfEzXoA1TD8X1YwlkpgNEJqApJ64VN1Ar9kkh7kiS5viZmnSAQQYhllf
         ItLqCMMLgaJNnvP0cvjjc6E+MlS/mVzAYMyE1lWsQrxnb9abVvOYh03ASklLV2orZxj9
         vsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695029901; x=1695634701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KPkAO3LL0QvdQ7w2MdKUYOEVc2znuVAY79aOTVN0dCo=;
        b=bAMxf7mtkUKFMp6MTuPlaWmNlD5RZNi23NLa6Aw45DDhmn+BXm1erboaxWYFxGYPKX
         UqgpJYrLp6Kor0pDo9Xl/eXA88yJMvDwoKl/bd/7zti9WMLCz4b8nXQ1yPMvwOHBiXE/
         vXwUiz0E1Nj0JXaQoiPdz9GH8CUEASVW9pWKZkqvC7LIhmNicwHFpY/CSNQT4jKwqQA0
         MtVcNFymeJey70U2I797jbNun5Y1K9mMWekiiuFcQtZgyvkFEVcwzzNBL0Ytz0iua6uo
         3kRZr+OJOkH4nzWFlCvHQUBP561A/lrV6c/Dh++LNWDNKPhVJnhmdCPlvZQ8MyfQ8O+2
         Cefg==
X-Gm-Message-State: AOJu0YxZf8Ch9UzX+mq05yxH07EPQ7Hm6guZJLt9V2BAJJdNeEGHoD0C
	QrZt2EJ6OdsuPR/h7J6AHahBzw==
X-Google-Smtp-Source: AGHT+IHs7Cnv3jg5GzRKlzpQ9IDZ3feX0H8AC8mFOZw7p6rbCJmOXZ1Kq/GmBfj0dKmJX4KbWT9GYw==
X-Received: by 2002:a17:907:2ccb:b0:9a9:e4ce:c9a2 with SMTP id hg11-20020a1709072ccb00b009a9e4cec9a2mr7340397ejc.53.1695029901406;
        Mon, 18 Sep 2023 02:38:21 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4091:a246:8222:872:4a5b:b69c:1318])
        by smtp.gmail.com with ESMTPSA id o10-20020a1709061d4a00b0099293cdbc98sm6251164ejh.145.2023.09.18.02.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 02:38:21 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Fabien Parent <parent.f@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v8 3/8] soc: mediatek: pm-domains: Split bus_prot_mask
Date: Mon, 18 Sep 2023 11:37:47 +0200
Message-Id: <20230918093751.1188668-4-msp@baylibre.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230918093751.1188668-1-msp@baylibre.com>
References: <20230918093751.1188668-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_023823_916705_EE0CC383 
X-CRM114-Status: GOOD (  11.90  )
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

bus_prot_mask is used for all operations, set clear and acknowledge. In
preparation of m8365 power domain support split this one mask into two,
one mask for set and clear, another one for acknowledge.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Tested-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/pmdomain/mediatek/mtk-pm-domains.c | 24 +++++++++++++---------
 drivers/pmdomain/mediatek/mtk-pm-domains.h | 14 +++++++------
 2 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index da675a33bdf5..dbb268e96310 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -123,18 +123,20 @@ static int _scpsys_bus_protect_enable(const struct scpsys_bus_prot_data *bpd, st
 	int i, ret;
 
 	for (i = 0; i < SPM_MAX_BUS_PROT_DATA; i++) {
-		u32 val, mask = bpd[i].bus_prot_mask;
+		u32 set_clr_mask = bpd[i].bus_prot_set_clr_mask;
+		u32 sta_mask = bpd[i].bus_prot_sta_mask;
+		u32 val;
 
-		if (!mask)
+		if (!set_clr_mask)
 			break;
 
 		if (bpd[i].flags & BUS_PROT_REG_UPDATE)
-			regmap_set_bits(regmap, bpd[i].bus_prot_set, mask);
+			regmap_set_bits(regmap, bpd[i].bus_prot_set, set_clr_mask);
 		else
-			regmap_write(regmap, bpd[i].bus_prot_set, mask);
+			regmap_write(regmap, bpd[i].bus_prot_set, set_clr_mask);
 
 		ret = regmap_read_poll_timeout(regmap, bpd[i].bus_prot_sta,
-					       val, (val & mask) == mask,
+					       val, (val & sta_mask) == sta_mask,
 					       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
 		if (ret)
 			return ret;
@@ -160,21 +162,23 @@ static int _scpsys_bus_protect_disable(const struct scpsys_bus_prot_data *bpd,
 	int i, ret;
 
 	for (i = SPM_MAX_BUS_PROT_DATA - 1; i >= 0; i--) {
-		u32 val, mask = bpd[i].bus_prot_mask;
+		u32 set_clr_mask = bpd[i].bus_prot_set_clr_mask;
+		u32 sta_mask = bpd[i].bus_prot_sta_mask;
+		u32 val;
 
-		if (!mask)
+		if (!set_clr_mask)
 			continue;
 
 		if (bpd[i].flags & BUS_PROT_REG_UPDATE)
-			regmap_clear_bits(regmap, bpd[i].bus_prot_clr, mask);
+			regmap_clear_bits(regmap, bpd[i].bus_prot_clr, set_clr_mask);
 		else
-			regmap_write(regmap, bpd[i].bus_prot_clr, mask);
+			regmap_write(regmap, bpd[i].bus_prot_clr, set_clr_mask);
 
 		if (bpd[i].flags & BUS_PROT_IGNORE_CLR_ACK)
 			continue;
 
 		ret = regmap_read_poll_timeout(regmap, bpd[i].bus_prot_sta,
-					       val, !(val & mask),
+					       val, !(val & sta_mask),
 					       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
 		if (ret)
 			return ret;
diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.h b/drivers/pmdomain/mediatek/mtk-pm-domains.h
index d8c0c299dd45..4c3ab72a907b 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.h
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.h
@@ -47,22 +47,23 @@ enum scpsys_bus_prot_flags {
 	BUS_PROT_IGNORE_CLR_ACK = BIT(2),
 };
 
-#define _BUS_PROT(_mask, _set, _clr, _sta, _flags) {		\
-		.bus_prot_mask = (_mask),			\
+#define _BUS_PROT(_set_clr_mask, _set, _clr, _sta_mask, _sta, _flags) {	\
+		.bus_prot_set_clr_mask = (_set_clr_mask),	\
 		.bus_prot_set = _set,				\
 		.bus_prot_clr = _clr,				\
+		.bus_prot_sta_mask = (_sta_mask),		\
 		.bus_prot_sta = _sta,				\
 		.flags = _flags					\
 	}
 
 #define BUS_PROT_WR(_mask, _set, _clr, _sta)			\
-		_BUS_PROT(_mask, _set, _clr, _sta, 0)
+		_BUS_PROT(_mask, _set, _clr, _mask, _sta, 0)
 
 #define BUS_PROT_WR_IGN(_mask, _set, _clr, _sta)		\
-		_BUS_PROT(_mask, _set, _clr, _sta, BUS_PROT_IGNORE_CLR_ACK)
+		_BUS_PROT(_mask, _set, _clr, _mask, _sta, BUS_PROT_IGNORE_CLR_ACK)
 
 #define BUS_PROT_UPDATE(_mask, _set, _clr, _sta)		\
-		_BUS_PROT(_mask, _set, _clr, _sta, BUS_PROT_REG_UPDATE)
+		_BUS_PROT(_mask, _set, _clr, _mask, _sta, BUS_PROT_REG_UPDATE)
 
 #define BUS_PROT_UPDATE_TOPAXI(_mask)				\
 		BUS_PROT_UPDATE(_mask,				\
@@ -71,9 +72,10 @@ enum scpsys_bus_prot_flags {
 				INFRA_TOPAXI_PROTECTSTA1)
 
 struct scpsys_bus_prot_data {
-	u32 bus_prot_mask;
+	u32 bus_prot_set_clr_mask;
 	u32 bus_prot_set;
 	u32 bus_prot_clr;
+	u32 bus_prot_sta_mask;
 	u32 bus_prot_sta;
 	u8 flags;
 };
-- 
2.40.1


