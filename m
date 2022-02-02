Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD53C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 14:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f5gJEzzZHKKfm/uBnbbDV25Bk96Li6ndUrOJig2Tm9I=; b=LG9bvOYlvercFw
	9HO2veoZX50HY6FdAf0BC8lBAFBL53mVIGsmtK2nEKk6Qq8eXsPa8P4T80V5NB56mB3Przzolt/ho
	mu3FFKuQcP6L7gJJLfuqY4tEiGia5sSFsILPgCcXa1zvnSQFKXdEpbxR1VTSZRl0k4HSE6T/eCXnu
	I52EN9JIeqhL95ZugXIdEj4p++wuyN6OTzUkL57Bix4qPPCzqQq/JT3/jDexfFO7z4H7r7iFUOO1l
	6FcNcMLFH8FZKZd42iJ7s+ugf41NPDqtOjDokfCkXgVwLG2WXPbq4lUuDlIg5jWLNLePvBEGKv8KN
	f5hFGIUlkmDM2lKRviFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFGJF-00FYTG-T7; Wed, 02 Feb 2022 14:08:33 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFG1j-00FPPb-1X
 for linux-mediatek@lists.infradead.org; Wed, 02 Feb 2022 13:50:28 +0000
Received: by mail-pl1-x632.google.com with SMTP id c3so18297501pls.5
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Feb 2022 05:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TrOltClYvXVjDtDBwVIhzlzFVA2EZyTl5dU5D+b2Jm4=;
 b=LE43wTzJh/Wmm0fyvbCb8wCh+3oWVC8adNS/jdl5+42RJ8DxvGICSM+qdZwruOzsIr
 DyHrISocYIMJ6qskgAbWNERefJpsBiQa/dzh4PKqC0vzzTvQp/Z0Ub31MqFITrjPZhzH
 6Xz4xkV2eseSkFUHg+BmD9me17wZXcLr27Fic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TrOltClYvXVjDtDBwVIhzlzFVA2EZyTl5dU5D+b2Jm4=;
 b=7Bd1rOqCwhOlioLxDTDXoRk0X3Dv5xIFg0rKhEsyuWDz/uSeqzgI4XOeEZioMeF7Mj
 cwzdSFB5mv0tgN5hmaY664ROqAXhG01VLpFENCmGZek9slzGmI9lBrbXrTo7vEtR0E0t
 3BD+IIONAh0KMHIgHpywEtQGZ/8frhCaP2PYe9WeZGMUcU1mpqYTiBwZ7wsDKpAssDaB
 wzAsRphP6L2KN0XAWwWf9vGs6wcwM3KGtPMvqwYOTMGJXxJmGjd3PGfOehBx2kZwdaih
 hVRIHS22PcW84lf0fsTcjK1zC82YhsleRbomSp/pX5RPTQtCm+i+vIpeWhfnD1axhgDg
 5Agw==
X-Gm-Message-State: AOAM530zWPqjwgcXuYWCcA8IH7rZccj0ufu1rLPx392OPU7vzsb64oRU
 99T4OyP3x/LU2US3CxY6tw32pQ==
X-Google-Smtp-Source: ABdhPJxwytrlAarn/g53qU18olqhBZj5GI3l8fMGrFcFpltGq3c95Omxs6sHFPOWJMUCA6/RAdqcQA==
X-Received: by 2002:a17:902:9a01:: with SMTP id
 v1mr13233814plp.56.1643809826597; 
 Wed, 02 Feb 2022 05:50:26 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:78b5:214c:c81:b9aa])
 by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 05:50:26 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 24/31] clk: mediatek: mux: Implement error handling in
 register API
Date: Wed,  2 Feb 2022 21:48:27 +0800
Message-Id: <20220202134834.690675-25-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_055027_130273_0529D910 
X-CRM114-Status: GOOD (  13.78  )
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

The mux clk type registration function does not stop or return errors
if any clk failed to be registered, nor does it implement an error
handling path. This may result in a partially working device if any
step failed.

Make the register function return proper error codes, and bail out if
errors occur. Proper cleanup, i.e. unregister any clks that were
successfully registered, is done in the new error path.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mux.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index 70aa42144632..f51e67650f03 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -215,13 +215,26 @@ int mtk_clk_register_muxes(const struct mtk_mux *muxes,
 
 		if (IS_ERR(clk)) {
 			pr_err("Failed to register clk %s: %pe\n", mux->name, clk);
-			continue;
+			goto err;
 		}
 
 		clk_data->clks[mux->id] = clk;
 	}
 
 	return 0;
+
+err:
+	while (--i >= 0) {
+		const struct mtk_mux *mux = &muxes[i];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[mux->id]))
+			continue;
+
+		mtk_clk_unregister_mux(clk_data->clks[mux->id]);
+		clk_data->clks[mux->id] = ERR_PTR(-ENOENT);
+	}
+
+	return PTR_ERR(clk);
 }
 EXPORT_SYMBOL_GPL(mtk_clk_register_muxes);
 
-- 
2.35.0.rc2.247.g8bbb082509-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
