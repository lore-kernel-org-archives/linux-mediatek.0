Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410D8C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 13:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nxFLgauM0YqxrsTFLR8123xZviOEkUheLkeXmORQEPw=; b=iYOXQkRhNp4YGu
	zwUdBauFbeQxqzmUlyKyRFHkqLEFVQkhwuTnnEvvV3hsEe5SW/w7F4fQkNCr/yHe93piazA/y/jzN
	6ITXYlh/724z2Lyr7gSwRiwZarzZLdyhkyulDC9ryMmSOKk3tBL8HuOz+YD7jMqtErAyYQgdXmu1S
	TawcTTFG7mkR5C4LLeftxYz5iVqRPxe2Einu71BjNGGgVwTLM5CO6IySzE13ImVNt1eM7SyWNfuzC
	JWQ0rYNHhTlEKQdlXjYw9jvCKw8KHMIERC8wwgh/Z6LnnORHnxV6uKvcrEcGM7csT1A7AUACqcCcz
	7KHyHs0uW/Na0wumPNlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFGA4-00FU8m-F4; Wed, 02 Feb 2022 13:59:04 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFG1Q-00FPBT-Oz
 for linux-mediatek@lists.infradead.org; Wed, 02 Feb 2022 13:50:10 +0000
Received: by mail-pg1-x529.google.com with SMTP id d186so1022974pgc.9
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Feb 2022 05:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZiK2XIbHygUp2e9+jzr8Jt6sIllwZaRaY/96jv41JNQ=;
 b=QPQOWHGcG0FhTl+ujSaIWEHoxMADagiEXp90XeOlMwZkYwx9ojL8OrJNcHCeyQ8B0U
 R/yXL+qZKdIOKC4LaWKtoAskERPkRqTwhJKOVTUlQAUyxmHvny5/jSM4zTEdrFpqY/iC
 kXk//XSfqc8FbSmSdylQVoRQRUn8lg1tsPcPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZiK2XIbHygUp2e9+jzr8Jt6sIllwZaRaY/96jv41JNQ=;
 b=A++TNTB1AKZsQuspszYUyRsofOOvDyrfctUqI0e4fKCRQxQv5DiAUsEO+JCthZ1tOZ
 9d4qbN9FenhbiUkBmeNxuPQ8/au36BExvJlbTY2IpT2gqqqdprKKEz9Crh56221JAMv5
 Hw3SbJ4vzwCNsOCOnE7PiBgTkN4JzQNXOq85+eSUSvQgQOKG7D4+V//PIUXnOTp2vrxG
 PEjcFNmWYdaGLHVsKYG2wrmG7WKIjuEOhqi+Ho9QOx6/i2qWarqRGX3+id8FdrNmfSY2
 r4rrpiO5T3s3dEvPOr5Sre8p+7/VHKTYNgqa/q2sWPtC6wo1mb4nA6aYlexiPTvZ+RYB
 S1OQ==
X-Gm-Message-State: AOAM533fG0QDDJj1DUk9LC30UUTYe6d7QLM/e6In8hkgP4fE4JnuFqHB
 3NozDlUyxLhvQFOMQq4kWNFPow==
X-Google-Smtp-Source: ABdhPJzwy7/E419LuvX14RpwYTVofcCB4seqnwxBWNGVvuMqYrjsbRzAkFsSwOwwb553aJSU0DlW0A==
X-Received: by 2002:a65:5543:: with SMTP id t3mr24333608pgr.180.1643809808363; 
 Wed, 02 Feb 2022 05:50:08 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:78b5:214c:c81:b9aa])
 by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 05:50:08 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 15/31] clk: mediatek: Implement
 mtk_clk_unregister_fixed_clks() API
Date: Wed,  2 Feb 2022 21:48:18 +0800
Message-Id: <20220202134834.690675-16-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_055008_843905_A3FF8B71 
X-CRM114-Status: GOOD (  15.40  )
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

mtk_clk_register_fixed_clks(), as the name suggests, is used to register
a given list of fixed rate clks. However it is lacking a counterpart
unregister API.

Implement said unregister API so that the various clock platform drivers
can utilize it to do proper unregistration, cleanup and removal.

In the header file, the register function's declaration is also
reformatted to fit code style guidelines.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mtk.c | 20 ++++++++++++++++++++
 drivers/clk/mediatek/clk-mtk.h |  6 ++++--
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 0c5db3c71fdd..7c0d5706eed7 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -80,6 +80,26 @@ void mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks,
 }
 EXPORT_SYMBOL_GPL(mtk_clk_register_fixed_clks);
 
+void mtk_clk_unregister_fixed_clks(const struct mtk_fixed_clk *clks, int num,
+				   struct clk_onecell_data *clk_data)
+{
+	int i;
+
+	if (!clk_data)
+		return;
+
+	for (i = num; i > 0; i--) {
+		const struct mtk_fixed_clk *rc = &clks[i - 1];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[rc->id]))
+			continue;
+
+		clk_unregister_fixed_rate(clk_data->clks[rc->id]);
+		clk_data->clks[rc->id] = ERR_PTR(-ENOENT);
+	}
+}
+EXPORT_SYMBOL_GPL(mtk_clk_unregister_fixed_clks);
+
 void mtk_clk_register_factors(const struct mtk_fixed_factor *clks,
 		int num, struct clk_onecell_data *clk_data)
 {
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 168220f85489..cc7f920eabb4 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -34,8 +34,10 @@ struct mtk_fixed_clk {
 		.rate = _rate,				\
 	}
 
-void mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks,
-		int num, struct clk_onecell_data *clk_data);
+void mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks, int num,
+				 struct clk_onecell_data *clk_data);
+void mtk_clk_unregister_fixed_clks(const struct mtk_fixed_clk *clks, int num,
+				   struct clk_onecell_data *clk_data);
 
 struct mtk_fixed_factor {
 	int id;
-- 
2.35.0.rc2.247.g8bbb082509-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
