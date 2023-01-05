Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCB3C3DA7A
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Jan 2023 20:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xvXKcEbwULcjNy/x9YB9utQCAcj11EGEkTp6VrX3MLc=; b=kDX0eMtiKbJe89W/qBL1af7Uj0
	so9P7XLXEP4qrKOW7pkHfx/se4JGLi3AcH5ny2dVAau64oni6HVKRhgmYCQNyZ936NtAEc8EgBUCI
	4OIXARwgOQHHT8mXagFUIZVLI0m87l2ZcK6TTMe78cJH/D7zP59Z//ibDrps/ovh9dOgag2DkackX
	g2Wj4rhyKHfK6r1OT4O36KNNACmklvdgQ+c3Y1huGyc0Jcx2+et6QktTVwaa9n8KuU8+yg252eGFn
	aFVswYpv4HBCvDlZdob5AhbHwyhdUD9TF/Jd5K5sfAj4hSm0dnPC4GzT/mzKPc7i1uORE5B8EUtvH
	RrrSk9tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDXGX-00Enwh-PG; Thu, 05 Jan 2023 20:55:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDUkm-00DQbS-I3
	for linux-mediatek@bombadil.infradead.org; Thu, 05 Jan 2023 18:14:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xvXKcEbwULcjNy/x9YB9utQCAcj11EGEkTp6VrX3MLc=; b=T60afaSgBBmp3ZYKe20mP1+qoa
	K5aC2NplXEpYUSRyrOgKBjbAml9wVu2vFzs2MrDeZEHaOScwtM4h+tv2SfuJQkdbq460ZY8Q0HfXy
	Vnm9PbjSjtCRXFZD0B6jaE2QkfrW7KVK02DmceAbnXuZ5ItJkTSVec2p9HEJNOXm3uRUVgxuoomtk
	JeG8tZMkFZb9nKlBoeqoJihWYIXHhIr+WFXPsw7aN8728GI4do5KiGzV1oOqUtZOjgWBvIeXcfhpz
	absU4EyW+Rih1l/LoNbKyZ3Z5a/e6PcL9FMl55ccvLWMTvr4zR42QXpzH5ro9Z9gsHywhmqjQj/rv
	4wjgbDmw==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDTia-001VeK-23
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Jan 2023 17:07:54 +0000
Received: by mail-wr1-x435.google.com with SMTP id z16so20281382wrw.1
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Jan 2023 09:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xvXKcEbwULcjNy/x9YB9utQCAcj11EGEkTp6VrX3MLc=;
        b=TKpKVqD9gSHNYL2zofVueeqK1Tll1hALYFD6l7hkdRVGqMsPq+U+j3e7bECAudp95d
         /Vvj//pM0bw+/ZaKglX4L+dJVfPk5wZ4kV+D7bOKicrrpo3vWIW4MvyNAkP0kqoG5M4j
         lzfUwDQgIdMotwuJ0OOjnDix6sODlL90Ly3aJ1Qg5v7bYv0ReUfuPVpjrxLUYvnCNwky
         wMS/5dwxViCEDJrlMX7G9ZrmMeQpCIuW24+h2NYjvKrAxI7UkYvdZNxTKCCLA2tc0LhT
         bupHaB4Rid1gBGvXeZ92DdMdoZf0Io4RnsrpWNbsvkOzmbuxARXyWcJInyxh9x2d/sYc
         H8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xvXKcEbwULcjNy/x9YB9utQCAcj11EGEkTp6VrX3MLc=;
        b=YjUg8SmIjGwOpGoEY0GVoZNduhuFRyyFeohwQ9z27s0EqGj2WkicCJodf/0nB/CtPq
         lVZOqye+hqYf24hDcO5RX4XGdXEQaWGNao/CX3HAMsr5PJtkLfavxJd61+gnF4zalywr
         NpcjrAJRilvktrUHGuuxHgB2iFbtd+jBxnpueHZ6W5iE2w632rtHSkhG5wGZivu+jjCu
         BARiBhtNxijvK90YDFSEluig/3Tvp+sYFHB72Cv2J1R3CgOCuTRllHB4mM4sgHnC0ZZi
         OoTiAaLR1DkIjZyJtYpL7CY3l3giuG4PTLx+iANStLajLIbw6oqVVwkmAeuU938vE6M4
         6dXQ==
X-Gm-Message-State: AFqh2kqYkdj/OCkO1jsJY5NxHZzISvBnDspSkMOyTUMd+FtGCXKizZFS
	jLLe9266ROJYL5x1EY8M/tjNvw==
X-Google-Smtp-Source: AMrXdXs6DAkTMn1HVe6xKQPUdVm7ulbeOGCPzUQJnFZ7cJeSbtwnc2P0YPv4b1zCiyl/YPH8IHpLaw==
X-Received: by 2002:adf:f183:0:b0:255:96ed:950b with SMTP id h3-20020adff183000000b0025596ed950bmr30788321wro.60.1672938468864;
        Thu, 05 Jan 2023 09:07:48 -0800 (PST)
Received: from blmsp.fritz.box ([2001:4091:a245:805c:9cf4:fdb8:bb61:5f4e])
        by smtp.gmail.com with ESMTPSA id f14-20020adfe90e000000b002365730eae8sm37164853wrm.55.2023.01.05.09.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 09:07:48 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH 2/8] soc: mediatek: pm-domains: Split bus_prot_mask
Date: Thu,  5 Jan 2023 18:07:29 +0100
Message-Id: <20230105170735.1637416-3-msp@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105170735.1637416-1-msp@baylibre.com>
References: <20230105170735.1637416-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_170752_738138_00987C1D 
X-CRM114-Status: GOOD (  11.47  )
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
---
 drivers/soc/mediatek/mtk-pm-domains.c | 24 ++++++++++++++----------
 drivers/soc/mediatek/mtk-pm-domains.h | 14 ++++++++------
 2 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index 474b272f9b02..4333cd297405 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -122,18 +122,20 @@ static int _scpsys_bus_protect_enable(const struct scpsys_bus_prot_data *bpd, st
 	int i, ret;
 
 	for (i = 0; i < SPM_MAX_BUS_PROT_DATA; i++) {
-		u32 val, mask = bpd[i].bus_prot_mask;
+		u32 val;
+		u32 set_clr_mask = bpd[i].bus_prot_set_clr_mask;
+		u32 sta_mask = bpd[i].bus_prot_sta_mask;
 
-		if (!mask)
+		if (!set_clr_mask)
 			break;
 
 		if (bpd[i].bus_prot_reg_update)
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
@@ -159,21 +161,23 @@ static int _scpsys_bus_protect_disable(const struct scpsys_bus_prot_data *bpd,
 	int i, ret;
 
 	for (i = SPM_MAX_BUS_PROT_DATA - 1; i >= 0; i--) {
-		u32 val, mask = bpd[i].bus_prot_mask;
+		u32 val;
+		u32 set_clr_mask = bpd[i].bus_prot_set_clr_mask;
+		u32 sta_mask = bpd[i].bus_prot_sta_mask;
 
-		if (!mask)
+		if (!set_clr_mask)
 			continue;
 
 		if (bpd[i].bus_prot_reg_update)
-			regmap_clear_bits(regmap, bpd[i].bus_prot_clr, mask);
+			regmap_clear_bits(regmap, bpd[i].bus_prot_clr, set_clr_mask);
 		else
-			regmap_write(regmap, bpd[i].bus_prot_clr, mask);
+			regmap_write(regmap, bpd[i].bus_prot_clr, set_clr_mask);
 
 		if (bpd[i].ignore_clr_ack)
 			continue;
 
 		ret = regmap_read_poll_timeout(regmap, bpd[i].bus_prot_sta,
-					       val, !(val & mask),
+					       val, !(val & sta_mask),
 					       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
 		if (ret)
 			return ret;
diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
index 7d3c0c36316c..8aaed1c939d7 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.h
+++ b/drivers/soc/mediatek/mtk-pm-domains.h
@@ -41,23 +41,24 @@
 
 #define SPM_MAX_BUS_PROT_DATA		6
 
-#define _BUS_PROT(_mask, _set, _clr, _sta, _update, _ignore) {	\
-		.bus_prot_mask = (_mask),			\
+#define _BUS_PROT(_set_clr_mask, _set, _clr, _sta_mask, _sta, _update, _ignore) {	\
+		.bus_prot_set_clr_mask = (_set_clr_mask),	\
 		.bus_prot_set = _set,				\
 		.bus_prot_clr = _clr,				\
+		.bus_prot_sta_mask = (_sta_mask),		\
 		.bus_prot_sta = _sta,				\
 		.bus_prot_reg_update = _update,			\
 		.ignore_clr_ack = _ignore,			\
 	}
 
 #define BUS_PROT_WR(_mask, _set, _clr, _sta)			\
-		_BUS_PROT(_mask, _set, _clr, _sta, false, false)
+		_BUS_PROT(_mask, _set, _clr, _mask, _sta, false, false)
 
 #define BUS_PROT_WR_IGN(_mask, _set, _clr, _sta)		\
-		_BUS_PROT(_mask, _set, _clr, _sta, false, true)
+		_BUS_PROT(_mask, _set, _clr, _mask, _sta, false, true)
 
 #define BUS_PROT_UPDATE(_mask, _set, _clr, _sta)		\
-		_BUS_PROT(_mask, _set, _clr, _sta, true, false)
+		_BUS_PROT(_mask, _set, _clr, _mask, _sta, true, false)
 
 #define BUS_PROT_UPDATE_TOPAXI(_mask)				\
 		BUS_PROT_UPDATE(_mask,				\
@@ -66,9 +67,10 @@
 				INFRA_TOPAXI_PROTECTSTA1)
 
 struct scpsys_bus_prot_data {
-	u32 bus_prot_mask;
+	u32 bus_prot_set_clr_mask;
 	u32 bus_prot_set;
 	u32 bus_prot_clr;
+	u32 bus_prot_sta_mask;
 	u32 bus_prot_sta;
 	bool bus_prot_reg_update;
 	bool ignore_clr_ack;
-- 
2.39.0


