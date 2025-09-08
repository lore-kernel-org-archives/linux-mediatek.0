Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635B6CA1013
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Sep 2025 04:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+xbE3C5wFV+o/JT6/YEPlxnk3f9fN47mPZGkai6aV5E=; b=ba1POwaOB1k/bk
	RbKqLfYV+2D3FvfwunvmcUeFsBYxKDgJfx0DSDcytkG1czKen5caETN1qtkOG6enrBX7hKwWIAu7v
	eafmOs0bkdyQ2S/mqZem7rxJ7sxk+GtjzzWYWfZ4zL5YbpUBHrOjXrIM8Lf1Ry3JHj2vitXSR0ffS
	/yQtW1BJGok8JdwwQdR3i4yZgJiEoORlFDptJnhMmuI+SD3q09cfErDAl/hic+CyJUN0sVaTS+8JD
	/Ivnpuf+bg9/NVsKo9NYL8fwO/vLDn/OolxKBJ8hXE53xI4WfY9MjhnN1PgD1+5ttouQSagTPH/mf
	JXsKXlTN2dT0JgP+BCWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvTmR-0000000EY6Z-4BtI;
	Mon, 08 Sep 2025 04:47:04 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvTjd-0000000EXdN-36j0
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Sep 2025 04:44:12 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b4f9d61e7deso2504447a12.2
        for <linux-mediatek@lists.infradead.org>; Sun, 07 Sep 2025 21:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757306649; x=1757911449; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+xbE3C5wFV+o/JT6/YEPlxnk3f9fN47mPZGkai6aV5E=;
        b=H9EtgS+8gv+1hEn5rrBxtaLtc7/3R12yXNg2mvK186EteibYjyuaB3HoomDxewAnlf
         Qwy+bvmCcxLxt3P76BLlduXzlMZg5/AmhXC8fxS6UQ+jRLyH8F3eKnr4NPxSWU+Sm89u
         eZZLMburFYkbNUfIXS7+BOAGtrK3QOBoB3ZJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757306649; x=1757911449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+xbE3C5wFV+o/JT6/YEPlxnk3f9fN47mPZGkai6aV5E=;
        b=cf5VkGvw5/1SVgmQHkUF7GF4w0vsliAx/4qvgLIgLt/hRvEhuti2cmIbYoDwtBazi8
         fW1Kagy8Rv29+vLwdY+Qz2aMPnU4Drx53kby5FVP7f0/FGXtW4klLbNRY/Z1HD9gYvil
         OH1ORCO8lKmwSnf3NORQZdZ5JuiTMCNIwj5LLmB+EKkysalaH0NqtD0arMltp/Ii8SPt
         eUyuBnpbqLKDPmTvpTKsp1wcN+I1E5H3MJrKk3UFQUQOSccCALmmMOu8rxGlhxPWaLIx
         aiy5vqvs/Il+OULhNW8L3F1QtxgBYWXcXa73Mm+9Kb2FaG1zKgCgQlkl1LFKTNlbzEqC
         JNDA==
X-Forwarded-Encrypted: i=1; AJvYcCXArU1AICdepmFfidYap5/prPJ0Ov2WSG+Ir+qHhyk6JDloOG/K6Axq/akdvCbqQnYk9O4/yJIjN3KRPsYrSA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWX5B20JBKtgLkcDH7K69qSteVyheR1erx2Zi2K0opuhwAb0BQ
	t5MOAoyHXibfUnua4GzYmse2CGxNCk+ShUN5Ypl6z8E5Wa6W3snvUILvYYUbHDMIhw==
X-Gm-Gg: ASbGncu5IinYVtteZmIvG+5+aVdNHTorU4AupR75Zg+3fYmd7FiEn70j1YZOd20xzbG
	iG4yGRJlcLTfJO9mpA2xlJK1hBrY77XKnXwPqpTnLVC11Sr8tpFrCmgdAL7BavOVGRslzFjbgMl
	OtlNU9+yqY07LzfO6BhgTFBxLXA5vnlFBzl3AJC2bpf16SGwNlkwRfwsI8yP/kgozQ9Zc2O314b
	iUZK1VnP1jzrlGqraSe8qky3rUSc9bV9bGX1xjs5lLuRykxeb6qqJsLjDlG01AgLx5RybNz5bVy
	FUspp6MFQ2J+7dYc6p9yGR9WbXc/kOHoe2TSfYxG81hjbz0dIG67Jm1kd5zSHoDmzTUj8yEGJq/
	UNFSN7QXa3x7dZ6pT6KRUGeGVOWd+7W1Bka/jPQc/bLpPdSMG38zzjCi0Bu+ZP/mIORdmuHFZbO
	+c577aZ/DWaWxg7Kj/qwSkHYmU
X-Google-Smtp-Source: AGHT+IF6EqSsNgeRlOG14nqU9rpBfRr7iTBMf+lspK57Oo06mCVbJuf9Ry2wvH4TilganydG5n2WLA==
X-Received: by 2002:a17:903:f8b:b0:24c:d342:7616 with SMTP id d9443c01a7336-25173118d31mr75029465ad.57.1757306648632;
        Sun, 07 Sep 2025 21:44:08 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2a00:79e0:201d:8:d9c6:a89:402f:11c7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b1ba1718bsm153320605ad.39.2025.09.07.21.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 21:44:08 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] remoteproc: mediatek: Use for_each_available_child_of_node_scoped()
Date: Mon,  8 Sep 2025 12:43:25 +0800
Message-ID: <20250908044348.2402981-1-fshao@chromium.org>
X-Mailer: git-send-email 2.51.0.355.g5224444f11-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_214409_801593_0802A44A 
X-CRM114-Status: GOOD (  10.74  )
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
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use scoped for_each_available_child_of_node_scoped() to remove manual
of_node_put() calls from early returns.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/remoteproc/mtk_scp.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 8206a1766481..b123698feb52 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1234,7 +1234,6 @@ static int scp_add_multi_core(struct platform_device *pdev,
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev_of_node(dev);
 	struct platform_device *cpdev;
-	struct device_node *child;
 	struct list_head *scp_list = &scp_cluster->mtk_scp_list;
 	const struct mtk_scp_of_data **cluster_of_data;
 	struct mtk_scp *scp, *temp;
@@ -1243,11 +1242,10 @@ static int scp_add_multi_core(struct platform_device *pdev,
 
 	cluster_of_data = (const struct mtk_scp_of_data **)of_device_get_match_data(dev);
 
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		if (!cluster_of_data[core_id]) {
 			ret = -EINVAL;
 			dev_err(dev, "Not support core %d\n", core_id);
-			of_node_put(child);
 			goto init_fail;
 		}
 
@@ -1255,7 +1253,6 @@ static int scp_add_multi_core(struct platform_device *pdev,
 		if (!cpdev) {
 			ret = -ENODEV;
 			dev_err(dev, "Not found platform device for core %d\n", core_id);
-			of_node_put(child);
 			goto init_fail;
 		}
 
@@ -1264,14 +1261,12 @@ static int scp_add_multi_core(struct platform_device *pdev,
 		if (IS_ERR(scp)) {
 			ret = PTR_ERR(scp);
 			dev_err(dev, "Failed to initialize core %d rproc\n", core_id);
-			of_node_put(child);
 			goto init_fail;
 		}
 
 		ret = rproc_add(scp->rproc);
 		if (ret) {
 			dev_err(dev, "Failed to add rproc of core %d\n", core_id);
-			of_node_put(child);
 			scp_free(scp);
 			goto init_fail;
 		}
-- 
2.51.0.355.g5224444f11-goog


