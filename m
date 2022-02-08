Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B82CFC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 12:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G7PKXnkwO393HtG22zbOq1qTpmFrPanVk1uho/RuH/c=; b=HnnzZiie4nmTrm
	epQhKmcEFrBJGNcFCeZjxyKI2m45i5dO83v2/+RMj18wJmbQs4WkOf6yzCtViUJNhz3ImlZaTLmP7
	TUWTRmYcGIeBKzNAjwbDfJTCmSsdhJkUC6J5vChLuVWAy2mHm/3pJejC3EtdL2VNE+MZ+mZEOml40
	SU1G3jswTqGFwHXt3A3Szw+Ec0AAqY9spP/PfpnoHAPZokyRrCLvquId9phOpwxdmM47kvUZzVFBB
	xQWUYgkYU3IzoxpV2EiR+7/wfW7w9RW4HoXHkuihXLxu+FcliGx+widgwsXksGa3TlRntZGtMDHtD
	MtrTIkK28VLXr+6kcnRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHQ2j-00DuTH-8G; Tue, 08 Feb 2022 12:56:25 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHPoP-00Dnd0-Qc
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 12:41:39 +0000
Received: by mail-pl1-x635.google.com with SMTP id x4so6144297plb.4
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Feb 2022 04:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4j0R3HNeSGc+g80776sCkQCAjbvK19KbOBB/hGRldNk=;
 b=acB1/7BjmdHubG8NFsy4k7UA6MfRRMn4I+NVgkiU8wubRqG3ZE/NU9WNV3bqc/gc74
 f7yUl7C2eXS9BMC73EIc0+SXkB9SG9YhdoTVoZBgR1zXx+yMoe3c93OhwzqC8A+U2INA
 xrjNY7XBULuhL4YJPxoFrfx4sT02hLUb1ds6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4j0R3HNeSGc+g80776sCkQCAjbvK19KbOBB/hGRldNk=;
 b=qWie8ytxb1ktmENbiR1m/nX9v7HCUAAu1mXidnt1KvWXk83KIb8Ec5IbkTZoembCQj
 sj6XuFkPdSgafWW6Yl/f3bdPGRwBCx3PJ5t+t/ulNLxb98kmhredDjn2qC0uAK/D5lKy
 NR7H/tfSfJwwfiwcH7uq+FM45pQh8YHmZqr1tqfQq6P+xaSOpB1/d6dHugGJhkJnrNXk
 h3fzskXmHJpoT97inDjMbIYItja+z7BvR0XIzE8OSkuyohPOtYAmKyKzWWOlSiP33FAR
 37V9ivtxb3ULX92u7Ii8yeR+0xYEFftzsJCw/8F7eOg6x9jE6AAJWdY8IX5Fgq67S/eo
 IM2w==
X-Gm-Message-State: AOAM5335qEyt1z6YCy/G8nJN7/vmYu+Pqado4/wzh+FFYNgKUS4VhYzy
 KxN8U0qffV9hYin3SYvlq+0INQ==
X-Google-Smtp-Source: ABdhPJzeLyoZfZy0zfpCnekQyWJxm9Sx4ZNhG5yQw9XmEnf8kxkhVQqUSq9kr4wYr+yQxWqGmBAj1Q==
X-Received: by 2002:a17:902:f651:: with SMTP id
 m17mr4253231plg.106.1644324096651; 
 Tue, 08 Feb 2022 04:41:36 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:41b6:813e:c823:609c])
 by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 04:41:36 -0800 (PST)
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
Subject: [PATCH v3 22/31] clk: mediatek: gate: Implement error handling in
 register API
Date: Tue,  8 Feb 2022 20:40:25 +0800
Message-Id: <20220208124034.414635-23-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_044137_945911_331D80D1 
X-CRM114-Status: GOOD (  13.35  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
2.35.0.263.gb82422642f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
