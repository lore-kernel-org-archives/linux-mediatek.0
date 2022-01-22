Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E60CC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jan 2022 09:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I6aD/ySg4sghSiCEcTZSnzhw+WlvjqrH14zgHMOsF7g=; b=An88tnJ7LdSFNn
	ulcbmZ/pD0Qn+YzrRj/XmcX8WIxXsHQU2T//6oYzPz6uxPu5s3ShI0UwVxDKbYtrEfoHVzMiBijY2
	71yb3XHfqm9GM71PWSosVZy8DNDJtS5Pd2fEjuZuKW8SaJEobo1d+PIw+yb/37mg/90RiNZZMNAnB
	GK2V5YhtNirFKeGjKczlDToOmN85QXDahUTAMSnpSkCZDUi0vu7JVBa/TetpSIZb8sF0FfoCZ4Esv
	NBwiAocrYQgy35laMbP+ryK+oDBZVVDgoMhNb388uXiX1nDe/0v7/BQ78zAMprXXCZfmQ2KEUkVEX
	FrVVqiF+GxbcjFOCJhyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBCh2-00GwBj-6e; Sat, 22 Jan 2022 09:28:20 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBCXN-00Gren-0B
 for linux-mediatek@lists.infradead.org; Sat, 22 Jan 2022 09:18:22 +0000
Received: by mail-pg1-x52e.google.com with SMTP id i8so10213554pgt.13
 for <linux-mediatek@lists.infradead.org>; Sat, 22 Jan 2022 01:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0r/icLyBiPRWAX9DR8xwoo1Ajn0xsQM7/jQJfiNovl4=;
 b=NIkPglMlv2Ah6b+M/D72wGdMSWs329exo2s/sWwo2kEcfCVveRvRW8MflsWkpCHok3
 UZJp2re6/JJjOPSx8f/2LE/F4aWPQMMtXDkn8xgg+wi4Q6MmSbCmDvaIcAGT/QwbE6Oi
 zhQ2nJ1tR6PVO4uBVfjkOAcFQ/7daZCPRGv40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0r/icLyBiPRWAX9DR8xwoo1Ajn0xsQM7/jQJfiNovl4=;
 b=8IOWUp3SeeclqTjgWNALWc2C6zMNn911imoV2V6ai4Dg9ZsfPYdllnKiy3ld2wiCsw
 EymZUP1spWcutcK50QWlET3o8siyOAbsuBOfa1ZD2glEVMHnxiPllrxJbauWCRqX0hgo
 u2bc32v9nBVPIbXKhuXs39a3DoZdIbBUaoX/m7SFAQ+jpIyCO4m4bswsAQhRlhbV6fmi
 7QThaRAZqktJAVIrx9hMX6AMor1jgu1afSoSso+BOdXT3LewSPgUK432+m29CReQb2Cd
 Nk3Qodto4m8G1jQm4yHLSazu91J2gWEaKebZEIkQa8VKiB5dTSEmLiTIYrXG0cn7pE+M
 atUA==
X-Gm-Message-State: AOAM533tyJG203SuxQHtiy4gQXiGm6Gb03qpc+nSll6nrD7R6dEmDziU
 6Gz/zOxSfFCdspEnAZxxTuw9QQ==
X-Google-Smtp-Source: ABdhPJwZs4dBcrlJUtQnvPcUNmuVMsA70DkLPP33YojMfq1AMhxrajglxuuN8K2CRtm/7ScyiwQpMw==
X-Received: by 2002:a65:4685:: with SMTP id h5mr5536639pgr.14.1642843100230;
 Sat, 22 Jan 2022 01:18:20 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:349f:9373:45d9:eb26])
 by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 01:18:19 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 16/31] clk: mediatek: Implement mtk_clk_unregister_factors()
 API
Date: Sat, 22 Jan 2022 17:17:16 +0800
Message-Id: <20220122091731.283592-17-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220122_011821_222462_D61554F2 
X-CRM114-Status: GOOD (  14.07  )
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

mtk_clk_register_factors(), as the name suggests, is used to register
a given list of fixed factor clks. However it is lacking a counterpart
unregister API.

Implement said unregister API so that the various clock platform drivers
can utilize it to do proper unregistration, cleanup and removal.

In the header file, the register function's declaration is also
reformatted to fit code style guidelines.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mtk.c | 20 ++++++++++++++++++++
 drivers/clk/mediatek/clk-mtk.h |  6 ++++--
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 7c0d5706eed7..b267b2f04b84 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -126,6 +126,26 @@ void mtk_clk_register_factors(const struct mtk_fixed_factor *clks,
 }
 EXPORT_SYMBOL_GPL(mtk_clk_register_factors);
 
+void mtk_clk_unregister_factors(const struct mtk_fixed_factor *clks, int num,
+				struct clk_onecell_data *clk_data)
+{
+	int i;
+
+	if (!clk_data)
+		return;
+
+	for (i = num; i > 0; i--) {
+		const struct mtk_fixed_factor *ff = &clks[i - 1];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[ff->id]))
+			continue;
+
+		clk_unregister_fixed_factor(clk_data->clks[ff->id]);
+		clk_data->clks[ff->id] = ERR_PTR(-ENOENT);
+	}
+}
+EXPORT_SYMBOL_GPL(mtk_clk_unregister_factors);
+
 struct clk *mtk_clk_register_composite(const struct mtk_composite *mc,
 		void __iomem *base, spinlock_t *lock)
 {
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index cc7f920eabb4..4db1a97c1250 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -55,8 +55,10 @@ struct mtk_fixed_factor {
 		.div = _div,				\
 	}
 
-void mtk_clk_register_factors(const struct mtk_fixed_factor *clks,
-		int num, struct clk_onecell_data *clk_data);
+void mtk_clk_register_factors(const struct mtk_fixed_factor *clks, int num,
+			      struct clk_onecell_data *clk_data);
+void mtk_clk_unregister_factors(const struct mtk_fixed_factor *clks, int num,
+				struct clk_onecell_data *clk_data);
 
 struct mtk_composite {
 	int id;
-- 
2.35.0.rc0.227.g00780c9af4-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
