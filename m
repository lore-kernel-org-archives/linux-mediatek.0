Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39784C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 12:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=guC1JJ1PVKQks2S7smSEZN1p1fpmMFJWLkacdznLxOc=; b=K3i6R9vWSKJRMU
	oePLV0aCEPvznA7iq+aKntL0U7pRi0SjsEovEWhXqGVA4T0Z38Cr9tmKBIXjpRLVaxk12ycyJrYaX
	CoiQJoVEaQC78Y/aIGKhuA6Z8xgU6UQeK6j5yyWPgtaO4VGSUj7w2j7zllHynEc6bprjiUXEjpy0A
	lpaFXW6C6bNvlvNgDgeohJg1KNcpcCgvrgN4WKhQlEiKp1GESlc7XzIPLYb0tKc8rJdI+ultc1NIz
	3MdYnvtYFml8SpRwVHE0cD2gFM9ON8L7v72Fb22huOueJvcyAD1AElATTmYERvIt0gsOxkvNLvAcd
	uP5my/kj903rh8LPox2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHQ5p-00DvdU-2D; Tue, 08 Feb 2022 12:59:37 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHPoT-00DneF-Eu
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 12:41:43 +0000
Received: by mail-pf1-x42e.google.com with SMTP id i17so18618514pfq.13
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Feb 2022 04:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ga+gjzrzR/LMbGVHXMahoAG4teobfaMr0L0SPMOkFuM=;
 b=RZ9aNJj6d+PjwBnU0ZJr9mX0nqK+z2KPKSE1hVDOXS6VR7K79uaqtUSEcm7xi/csiT
 PWkXmSg1lDYbXRJVyBHvI8LGnEa9ps7DiMTFIno+JyB6kH8xzJ+339+ev6Rsm53OTn79
 B3I6j48uRr2+5wLm760I9Q9pCw2Z3sZkrOEYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ga+gjzrzR/LMbGVHXMahoAG4teobfaMr0L0SPMOkFuM=;
 b=r76ORe9vXBAIXu1iMiIHmRkwotMf87q90cJo/bwE4xvzeRgY7PESSbY8p/VA+Mhy3/
 5t+zAcvojvNSBLuLeSjX2w79JxQuRWUdVTiWVK5fLAeIsRDL1KBmKMuCGDdaeQiAKRSJ
 7BAIyqbKfwyPsigivu0imsIL/wZO8idTugyaS3Uh3oBta63Tuj5Aq3oPBkP3raw4/dbt
 vQbixhqk+LyzprF45cq+3739UWx4O1SwT79h7/xVAdeDg1cGqt1SmqiATM16hETa5th5
 gkcV1F+Ta3OosoOKT9cY97ukRSGbvjMDXHW/56HBoqiB00Lehl1AscpyWpgYuYddZJa9
 1OLQ==
X-Gm-Message-State: AOAM533zVni3SKsf3pGS8cn7qaHLVXX1OaE1YwxJq7dkuQalAEUk0CS8
 8VZN2XEFaDcq7gdN70+hNjuQCA==
X-Google-Smtp-Source: ABdhPJw8d0noYcaqrmuUm0oYUt6VCRIRuANK5szIhgF5+nvEpUNbWJNicRVw/Rm/sTOyay6sR7vcPA==
X-Received: by 2002:a63:2a86:: with SMTP id q128mr3374314pgq.53.1644324098777; 
 Tue, 08 Feb 2022 04:41:38 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:41b6:813e:c823:609c])
 by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 04:41:38 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 23/31] clk: mediatek: mux: Reverse check for existing clk
 to reduce nesting level
Date: Tue,  8 Feb 2022 20:40:26 +0800
Message-Id: <20220208124034.414635-24-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_044141_542433_B5C3898A 
X-CRM114-Status: GOOD (  12.66  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The clk registration code here currently does:

    if (IS_ERR_OR_NULL(clk_data->clks[mux->id])) {
            ... do clk registration ...
    }

This extra level of nesting wastes screen real estate.

Reduce the nesting level by reversing the conditional shown above.
Other than that, functionality is not changed.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mux.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index 01af6a52711a..70aa42144632 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -208,16 +208,17 @@ int mtk_clk_register_muxes(const struct mtk_mux *muxes,
 	for (i = 0; i < num; i++) {
 		const struct mtk_mux *mux = &muxes[i];
 
-		if (IS_ERR_OR_NULL(clk_data->clks[mux->id])) {
-			clk = mtk_clk_register_mux(mux, regmap, lock);
+		if (!IS_ERR_OR_NULL(clk_data->clks[mux->id]))
+			continue;
 
-			if (IS_ERR(clk)) {
-				pr_err("Failed to register clk %s: %pe\n", mux->name, clk);
-				continue;
-			}
+		clk = mtk_clk_register_mux(mux, regmap, lock);
 
-			clk_data->clks[mux->id] = clk;
+		if (IS_ERR(clk)) {
+			pr_err("Failed to register clk %s: %pe\n", mux->name, clk);
+			continue;
 		}
+
+		clk_data->clks[mux->id] = clk;
 	}
 
 	return 0;
-- 
2.35.0.263.gb82422642f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
