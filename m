Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B4DC3DA7A
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Jan 2023 22:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qHSeF2epzfegJ6dyqinGOhs8+O9cuqph/+zCKOX0s7I=; b=RTAPFmim7sy7hNPMqL4W1udlUi
	VyqVFTjYKekHMuhRK+0W9WCGXNzzzAetZSZOmLp4XzA17uk+HXZmeiVSMpLwfCZantSphoWjogPEo
	t/eokrYk+5ZGnLk/MAtHSLP+nA8z1QrvnXJ7U4otF7UhyuQ4bcWoNz8KKE98sV1aVf0joexyRZQeI
	vZDntOuV/ICHmTFfyIQwFH4pUlyBmD3gPATPgaNxFsmW/kr7sbTDHA3wAZr+4i+QxoqeGhVi1gUUY
	ovbqs2xvzvISD8mfk8SKF0fRzASZAxQDQ+/45EqK2D/OoY5RKpJhqIrVEZbRDm+EPSBLEJpbgXx+W
	1R01qLzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDYHz-00FN1N-DD; Thu, 05 Jan 2023 22:00:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDV7j-00Di2q-9d
	for linux-mediatek@bombadil.infradead.org; Thu, 05 Jan 2023 18:37:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qHSeF2epzfegJ6dyqinGOhs8+O9cuqph/+zCKOX0s7I=; b=jTVwWtMM5UDmgI954tJk9Lp3fJ
	ZGHf/zHDAystlJkRKfrBG6X+j5zyPG2QYrs2maw9OvH4CDVMG4k9SNPYIKVLdlvV9jFeGJDmKaRb+
	WMLK1be6o+4tySxcb7Qg5NVAtUKGABkO1AUsA+W5luLV2DraCLlilDHHi7rHnx4qM0qREYWjUyDtB
	6JZLUTlBLU3ZeTpN9N2nj+Yn/NOJXJQDI2GiERw5Lnp5yZCJ2hHJap9wR/j9keqM2dFTuRynJWTZh
	SlDhLeb5oV0dTFmaWLEshp6v9Jl5mhE8eUBE2rvtbUQedsD0NWnRBWuMMGFlqlLyaAlvr9G2htRdv
	A7Kebzrg==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDTiS-001Vec-1d
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Jan 2023 17:07:46 +0000
Received: by mail-wr1-x434.google.com with SMTP id m7so2325973wrn.10
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Jan 2023 09:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHSeF2epzfegJ6dyqinGOhs8+O9cuqph/+zCKOX0s7I=;
        b=T9j5Z6Z77lWG3Lcdp+nVPM40kdXJmbdnZ0Ac4zTt8hMNtusoqDFw62aFNPEuz55H/U
         WImqKxepwo6EUI0Xbkt1jCxk4Flmu6Ye1l8pG1r26F4sGNR/2N2JaGSHa3HeHNKL/TPY
         KEEOajm91lmqyutXBKH9DN5ZlKWWuG14PbgOwDLl19aSK3sfZze9c5z0wWUGH6Lt2q5s
         UIkJ4RgB+DPR6oBEk09ocHcYb0CwDcEHRSqJkKMnsx/3GyxPh3zuL0qVhkyNgJ3eGaze
         1uP3WbkMTlbXAoKJme+in2vRJRwlNGLdmy9nooKLqZsJ9lNbN/Trpe4/W73uYOffX/vf
         8JyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qHSeF2epzfegJ6dyqinGOhs8+O9cuqph/+zCKOX0s7I=;
        b=Yh5YWkA+RASm71QdYfsSSWVwA8W5BBhwu700ESzxO0oGyI9woTOjyRo9nkiTIpe4X/
         Vwdel2zs2WmL5o9EBUWkJMImwCW+kU4QzLx2i8ADX1sbgwXiIpool1XmKnqTK5nZmv36
         MYqrIpGVhQzsbm+DVdN/WDlJVayAgr6FwCeLwyRzZNGQk9B4i4OAX569BBGdNigGENpK
         IbAPv0EpbA3+dH3bSZuGmSMziRQA+O6m1GE9PsA2bE9Vspj8iQHrZHD1x7nHuKlm8gpH
         tgHoIjrU4NoHUjHW2rhB6zYv51HqI90DAP7esuUuJZ7dF1PodA/4IaHbG/bfH4ML2zTV
         nhWQ==
X-Gm-Message-State: AFqh2koNxjMFg9QmXGaaDIlIxOXgR6pG7bU5dP7oMDF/On2virOwMqJ6
	ZGxvdNuR8IE9dAhW1pXUumj/AQ==
X-Google-Smtp-Source: AMrXdXsPKg+NGFgNV4C04Y1XgAhoYS0yvh7sfB1ozmk0QG2qKNE3ZLFRHj1PCnQ4jZIVzo+0C0/PJw==
X-Received: by 2002:a5d:4f05:0:b0:28c:6430:c1bc with SMTP id c5-20020a5d4f05000000b0028c6430c1bcmr15570468wru.3.1672938469840;
        Thu, 05 Jan 2023 09:07:49 -0800 (PST)
Received: from blmsp.fritz.box ([2001:4091:a245:805c:9cf4:fdb8:bb61:5f4e])
        by smtp.gmail.com with ESMTPSA id f14-20020adfe90e000000b002365730eae8sm37164853wrm.55.2023.01.05.09.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 09:07:49 -0800 (PST)
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
Subject: [PATCH 3/8] soc: mediatek: pm-domains: Create bus protection operation functions
Date: Thu,  5 Jan 2023 18:07:30 +0100
Message-Id: <20230105170735.1637416-4-msp@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105170735.1637416-1-msp@baylibre.com>
References: <20230105170735.1637416-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_170744_596699_9FFFB5CF 
X-CRM114-Status: GOOD (  13.01  )
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

Separate the register access used for bus protection enable/disable into
their own functions. These will be used later for WAY_EN bits.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 drivers/soc/mediatek/mtk-pm-domains.c | 68 +++++++++++++++------------
 1 file changed, 39 insertions(+), 29 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index 4333cd297405..999e1f6c86b0 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -117,26 +117,50 @@ static int scpsys_sram_disable(struct scpsys_domain *pd)
 					MTK_POLL_TIMEOUT);
 }
 
+static int scpsys_bus_protect_clear(const struct scpsys_bus_prot_data *bpd,
+				    struct regmap *regmap)
+{
+	u32 val;
+	u32 sta_mask = bpd->bus_prot_sta_mask;
+
+	if (bpd->bus_prot_reg_update)
+		regmap_clear_bits(regmap, bpd->bus_prot_clr, bpd->bus_prot_set_clr_mask);
+	else
+		regmap_write(regmap, bpd->bus_prot_clr, bpd->bus_prot_set_clr_mask);
+
+	if (bpd->ignore_clr_ack)
+		return 0;
+
+	return regmap_read_poll_timeout(regmap, bpd->bus_prot_sta,
+					val, !(val & sta_mask),
+					MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+}
+
+static int scpsys_bus_protect_set(const struct scpsys_bus_prot_data *bpd,
+				  struct regmap *regmap)
+{
+	u32 val;
+	u32 sta_mask = bpd->bus_prot_sta_mask;
+
+	if (bpd->bus_prot_reg_update)
+		regmap_set_bits(regmap, bpd->bus_prot_set, bpd->bus_prot_set_clr_mask);
+	else
+		regmap_write(regmap, bpd->bus_prot_set, bpd->bus_prot_set_clr_mask);
+
+	return regmap_read_poll_timeout(regmap, bpd->bus_prot_sta,
+					val, (val & sta_mask) == sta_mask,
+					MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+}
+
 static int _scpsys_bus_protect_enable(const struct scpsys_bus_prot_data *bpd, struct regmap *regmap)
 {
 	int i, ret;
 
 	for (i = 0; i < SPM_MAX_BUS_PROT_DATA; i++) {
-		u32 val;
-		u32 set_clr_mask = bpd[i].bus_prot_set_clr_mask;
-		u32 sta_mask = bpd[i].bus_prot_sta_mask;
-
-		if (!set_clr_mask)
+		if (!bpd[i].bus_prot_set_clr_mask)
 			break;
 
-		if (bpd[i].bus_prot_reg_update)
-			regmap_set_bits(regmap, bpd[i].bus_prot_set, set_clr_mask);
-		else
-			regmap_write(regmap, bpd[i].bus_prot_set, set_clr_mask);
-
-		ret = regmap_read_poll_timeout(regmap, bpd[i].bus_prot_sta,
-					       val, (val & sta_mask) == sta_mask,
-					       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+		ret = scpsys_bus_protect_set(&bpd[i], regmap);
 		if (ret)
 			return ret;
 	}
@@ -161,24 +185,10 @@ static int _scpsys_bus_protect_disable(const struct scpsys_bus_prot_data *bpd,
 	int i, ret;
 
 	for (i = SPM_MAX_BUS_PROT_DATA - 1; i >= 0; i--) {
-		u32 val;
-		u32 set_clr_mask = bpd[i].bus_prot_set_clr_mask;
-		u32 sta_mask = bpd[i].bus_prot_sta_mask;
-
-		if (!set_clr_mask)
-			continue;
-
-		if (bpd[i].bus_prot_reg_update)
-			regmap_clear_bits(regmap, bpd[i].bus_prot_clr, set_clr_mask);
-		else
-			regmap_write(regmap, bpd[i].bus_prot_clr, set_clr_mask);
-
-		if (bpd[i].ignore_clr_ack)
+		if (!bpd[i].bus_prot_set_clr_mask)
 			continue;
 
-		ret = regmap_read_poll_timeout(regmap, bpd[i].bus_prot_sta,
-					       val, !(val & sta_mask),
-					       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+		ret = scpsys_bus_protect_clear(&bpd[i], regmap);
 		if (ret)
 			return ret;
 	}
-- 
2.39.0


