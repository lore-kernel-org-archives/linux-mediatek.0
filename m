Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5513ACA0FE7
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Aug 2025 15:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yb2SBUjk2cUBYlIMJ026/BKU22gh35Mp+MWKmgCVX6Y=; b=tK1XTKLcjoeFhVGpID05RfX+C3
	yxVIgvp75qmf1GlgJA6JBgRquSbLxWby2/VnnRt2dp4m7IZXz+nkxxNtEeafdTK9tD4hHisVuUMRt
	QraLKfumUfrK5iiNKfUNeFRWkfxWGXeJaMcYysWIhtxBkDwkeHuyzVXvxg1ybPGGJELx+WfbKqcaG
	kSnC4yBognaP7feG6woDWIyYFq5Pm8GtQYv8G+V4RM9Pgjj0mwnJ4a5YRQ42w+OW5BuZTbKgH8mYp
	6r6UREFnmGjTE+iJhb5GzYCLHoW5syhGclVjYbSyQJQmh2uey/KMX87t0W+yzx/0jAQn3sBMcVcR9
	kOepUfAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZXk-00000008ZuA-3kGg;
	Mon, 25 Aug 2025 15:55:36 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYpL-00000008Sng-1Ao0
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Aug 2025 15:09:45 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-323267b98a4so3617133a91.1
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Aug 2025 08:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756134582; x=1756739382; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yb2SBUjk2cUBYlIMJ026/BKU22gh35Mp+MWKmgCVX6Y=;
        b=CuILnwSYc5JGmk51Yb1xmr/PiDDiMqO1Af3tsbeYlujVtk+lgtLDJVzdqdFSKu/prD
         EjRH9Qi/6sS+nOOU/fgu1OU+HJn96O9ibWjSaOnPWt1Jb4JvVR+B9eOeWbVD2Cb4TgmH
         Ar4OviR4qGMtfIJIpFp3QKls4RT3/h3p0aHs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756134582; x=1756739382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yb2SBUjk2cUBYlIMJ026/BKU22gh35Mp+MWKmgCVX6Y=;
        b=r9zj8LeUmvKlYrzJZVPaVG6CIFT8gFoi65Js7dEWWtH7a4jeO18ZPwaggdGa0+zdj0
         4z6MGif3uluvTXzL7a89e+rxjmuOfdYdRI6e83yEuIbaJu7ayYM2zY5EMLTIPyBD0Gbl
         mnhF7p6Iu29ntpa+7wbeu5GdP9QPSFT5+hCyIHIj7+X+2/NLZkI0XFSuqvLEttc2XO8p
         p8MlMCLc8mwNKjv9cKtpRnRuR0TlpF8N2DQ2rIWAXjNrWth5nk43926xLR4u3RI5npEn
         2pmOkTZReaASWjJQcaAbys4F0e+lXHKJG6ATQiqveyI5C+1+3V6wck5wFl3qm8g5FBgg
         i89A==
X-Forwarded-Encrypted: i=1; AJvYcCWTY8G5uQLIga0cSvNT+vDIY9yqeqDzLQkeJC2EJqlMhjVmyNcQAtKKEzCZtU+O12etqaIDjbU1EKwfIyecEg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCptX68jbqOyy2eI8ze1FlWhB+hanKCUwnkivkigX3u9Yqg4o/
	3lowJSIsyFphLeMkSZLAnJKm5hOcSAdtZ5x2weVfjLShiJQPCbY0pHKLaIPYvI9++A==
X-Gm-Gg: ASbGncuLt8hJdtnBun+GJiGhESvb8rY3JkQy3IJELJLxGhA4c69neO8GIznJmBpFhor
	oK5VqkVQ7/Iz0RkDs9oWwpYz+MW/6fcGma+uHHYOj8MWIH/6wgGxzhK1/EtB5upj1zltjGLGAD5
	TkJlsvrnfi6gcBwCpAUwWROYlcNNsFivI0TlNzA7/mYdFWEaNvT0AOTr2HChad3iyMnFSf2p/mY
	+i7S9qlbz8b5NlS6ABbx4INDp+tDMCTNY/3Cu5HuBja+tNj0NzVjmeXMYmtVWNjcBOY0+jd9ZlD
	o7aUIEEApFCG0Rg0RtR1CwKgYO1CAEOsLlHSS7VR0sniM66RnDmU75Q+ETDeOl8uq7FIImXWPQw
	s/+SjMLWPeUYK6sunw5CLft5VPJirbVAnLESq5g30
X-Google-Smtp-Source: AGHT+IHPJV4TXa61Ud+4jPZUdeIqShsQV2PbYlibNvBybfblxKwhUtY23QymfLSEF6L//QSRFz+xzQ==
X-Received: by 2002:a17:90b:3e44:b0:313:f9fc:7213 with SMTP id 98e67ed59e1d1-3251744bd41mr15706597a91.21.1756134582435;
        Mon, 25 Aug 2025 08:09:42 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:d5a9:711e:13f5:e60f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3254a1e4067sm7481215a91.10.2025.08.25.08.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 08:09:42 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] clk: mediatek: clk-mux: Do not pass flags to clk_mux_determine_rate_flags()
Date: Mon, 25 Aug 2025 23:09:31 +0800
Message-ID: <20250825150932.3695931-1-wenst@chromium.org>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_080943_362176_A0591FC1 
X-CRM114-Status: GOOD (  10.86  )
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

The `flags` in |struct mtk_mux| are core clk flags, not mux clk flags.
Passing one to the other is wrong.

Since there aren't any actual users adding CLK_MUX_* flags, just drop it
for now.

Fixes: b05ea3314390 ("clk: mediatek: clk-mux: Add .determine_rate() callback")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Dropped unused variable
---
 drivers/clk/mediatek/clk-mux.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index 60990296450b..9a12e58230be 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -146,9 +146,7 @@ static int mtk_clk_mux_set_parent_setclr_lock(struct clk_hw *hw, u8 index)
 static int mtk_clk_mux_determine_rate(struct clk_hw *hw,
 				      struct clk_rate_request *req)
 {
-	struct mtk_clk_mux *mux = to_mtk_clk_mux(hw);
-
-	return clk_mux_determine_rate_flags(hw, req, mux->data->flags);
+	return clk_mux_determine_rate_flags(hw, req, 0);
 }
 
 const struct clk_ops mtk_mux_clr_set_upd_ops = {
-- 
2.51.0.261.g7ce5a0a67e-goog


