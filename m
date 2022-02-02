Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68892C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 14:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h3X7qrP1VT4PkWZO21DuW+kkThzrRB3Qq0DccV32p44=; b=wI5frbKNTW2O2F
	lwrl0nq31Pp129YIQayzWROLsG4y9TLYQpRLlU9ygBnjI4iQjuQOrBSBM6BiUw+rUZMoHur032qyL
	GuLHT7YO9De+RPRKBlbhgZQiqzPDRRv0V9sPL8rzAmjfRhAYsM0Yd6l6jkRpP4AQQ48+toq0tWnqW
	iRXfjLBPrelZ3e7N+mQyhXwHisQLaZHp2/xZSFCBreqBKYe/rUZ90OWZmIlkSS7vjEbp0mYgD/TrD
	kSeZZA7RTc9zPN8vjUyVu0UYUWIf35tb+icrv6UiqmYvEyhdgFj3WGsdlAEiAPydKtYGusINOIaRI
	qUNa9FEPqUC0xntUJzqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFGIU-00FY6G-2w; Wed, 02 Feb 2022 14:07:46 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFG1f-00FPLz-2u
 for linux-mediatek@lists.infradead.org; Wed, 02 Feb 2022 13:50:24 +0000
Received: by mail-pg1-x535.google.com with SMTP id 132so7343928pga.5
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Feb 2022 05:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UVzLtEErhGtWV1STn1xNEVEnPyyTfBz7V3UiBlfriHg=;
 b=XQ+2EGR/cYRsPyHfBXXF9d1J9msyxxFm800JBKViuiIz+3BmpFAaHWZHT90R5nj5x+
 RaqgfY9Y0tqPoUWPg2ezdtqs+0Lh9Ps6Fnt4cv1CWcOg3OPidhT3t5iYomsoxjX1Z05a
 5RVDJ7Jhed3DlnGH/zsGsgqiHzv4xNt29Wx44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UVzLtEErhGtWV1STn1xNEVEnPyyTfBz7V3UiBlfriHg=;
 b=uMetW7POszL0SBwl1wa5090W5V4a+pVLnZXhSJn9bvpLCgCkJplLvV3u+G7U8Xz+8O
 ue66Ef7o8v+KknH5LoT9JOQd+q0gBhGFdKsV3ejcYv3Ql7q32vBmh7gbsDH+QCFmMiVE
 RuxLBreGmkXX3+3jX7QYg4uCBjV5Xc+4Mpk0lKYkZRPcqiLuwrOTf9zQXTGbD+P81DI5
 RPxHAtirY8749W596dOV4mn0KPYG+jM1wWbtZmNfhjym3KovI0tF/gI+Xu7MxPgJ/unW
 Bw8Wl8l8LK6Lr579YTpIt8CtuU3NN8PYVGZ0kMSYQmkXR1hKfl5ope7NMBc23oETwUfH
 IB7w==
X-Gm-Message-State: AOAM530hzq8CauYe/VszLiHTBJ6nGmYGb3Kf8+5EvAOtdNCdKG44BvUD
 b2d/dscJDTepP0/121SDxv3mcA==
X-Google-Smtp-Source: ABdhPJyE+pAn7gWEZTYj9bqNkprgRbIA8ZjA9M8QTJUnb3pEdI+FzNwtwWMFArF/buYt6wDUM7t07Q==
X-Received: by 2002:a05:6a00:1652:: with SMTP id
 m18mr17396585pfc.56.1643809822645; 
 Wed, 02 Feb 2022 05:50:22 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:78b5:214c:c81:b9aa])
 by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 05:50:22 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 22/31] clk: mediatek: gate: Implement error handling in
 register API
Date: Wed,  2 Feb 2022 21:48:25 +0800
Message-Id: <20220202134834.690675-23-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_055023_181002_8D8C4BE5 
X-CRM114-Status: GOOD (  13.68  )
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

The gate clk type registration function does not stop or return errors
if any clk failed to be registered, nor does it implement an error
handling path. This may result in a partially working device if any
step failed.

Make the register function return proper error codes, and bail out if
errors occur. Proper cleanup, i.e. unregister any clks that were
successfully registered, is done in the new error path.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-gate.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index e8881ae1489a..631ff170b7b9 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -237,13 +237,26 @@ int mtk_clk_register_gates_with_dev(struct device_node *node,
 
 		if (IS_ERR(clk)) {
 			pr_err("Failed to register clk %s: %pe\n", gate->name, clk);
-			continue;
+			goto err;
 		}
 
 		clk_data->clks[gate->id] = clk;
 	}
 
 	return 0;
+
+err:
+	while (--i >= 0) {
+		const struct mtk_gate *gate = &clks[i];
+
+		if (IS_ERR_OR_NULL(clk_data->clks[gate->id]))
+			continue;
+
+		mtk_clk_unregister_gate(clk_data->clks[gate->id]);
+		clk_data->clks[gate->id] = ERR_PTR(-ENOENT);
+	}
+
+	return PTR_ERR(clk);
 }
 
 int mtk_clk_register_gates(struct device_node *node,
-- 
2.35.0.rc2.247.g8bbb082509-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
