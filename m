Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC400C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 10:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4iIWEdXzHFLr6FrHsgmkCgkyXZIYlr9bu6OmxoGtn/4=; b=IneKNbu6EwzI8k
	/C5ijHmGWsucuW/0Eu3Gx7cjZ9ot8Q6PPjIxrN5YnoigZunMKCyU7BjuXaNVMn635/9iGof0xNoZj
	XIkq1EunuJg6pztqHurkuOTODNJVTvfcpyrIr9viGo9aNmoqMzQMRBAEzO5FFvRtx4kMZwPiIKtmJ
	1wZ2au2k3aq0d7YAXpDzLflSgx/mYtEj9wyS+tmNo97LMQTD/0nuTTn/je7JKMzGXWytWEw/NdCzy
	LPodNcgAWpl/PToe/v+gkACVKiIV4WQt/9qTFAQTdLHCzMq/8BUnuz17ftDBHfnnBWmDnTIthxaqA
	zMSLS/3laN4OP9gqz5+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRWxw-003oWM-4m; Tue, 08 Mar 2022 10:21:16 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRWnI-003k7w-4R
 for linux-mediatek@lists.infradead.org; Tue, 08 Mar 2022 10:10:17 +0000
Received: by mail-pl1-x630.google.com with SMTP id t19so13053157plr.5
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Mar 2022 02:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oGdSDDQNkWhUKe33kF4Pj3YfO7xrQa9jh28/YPNZHXQ=;
 b=Xc64V2C3B+kdpVRo+6vOPVtr+wdh+pkujfSHyLdve/PVnzSDyR8OAFEMyRnpsHi6jN
 eaFxWFfybXPd+S69UPSIo50ij3LSwFkygbdRkOTMcRDO8J6qh0fwexcLjDaxZJh9Yw70
 LmXcfY33hytZUxq99hTKvsp3EiXSuWR/bIGeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oGdSDDQNkWhUKe33kF4Pj3YfO7xrQa9jh28/YPNZHXQ=;
 b=yxezFzg/mE7SbI0zMkyRWUcaPEIs1fosu6GVHvR3y8oCYuR5m+wm/6SP2450BiO4VC
 js3f5ZFRVURyBh8AV7B8oJA9aoIJX2NOid3r3EerA4bx/EeZ5BumU4Dq2IfrIWa0MYGu
 cZJzy5KIvKvTgVSR9JoxHRCM2rho6UNzdHpP6Eb2It75PCRQF+qv35SREwJJkCxBGUkW
 TGIdlj+G2/qpUuLrFQwZ9K2UNg0TPnMNQ6sIjUnCHc8Eb2f332Grs5jql7MhzqVyL3iM
 gWY/roaD1Bzwj28ngdt/Q6fib2xq2aVTSz9y/QJBw0H7VUsiyQTpj3DYNDfMcnT3Lmys
 jwXw==
X-Gm-Message-State: AOAM531lLHdvH5RNOYt9qXX8oSkkTndRUF9qZTBNPBw7TtPW+thhn4bH
 jJqsGkMpw1pFXATvzGHfGA2kzA==
X-Google-Smtp-Source: ABdhPJxTWoED9DBGHXC3bbL4qawyt3m8I6aWwzNtsOMjlw76oLy6YYPISct3R0U33YSX/T9UDF9BFw==
X-Received: by 2002:a17:902:d2d1:b0:151:ef69:c27d with SMTP id
 n17-20020a170902d2d100b00151ef69c27dmr7994753plc.34.1646734214813; 
 Tue, 08 Mar 2022 02:10:14 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:73f8:5e3f:6894:8f44])
 by smtp.gmail.com with ESMTPSA id
 k19-20020a056a00135300b004f734327960sm1707553pfu.106.2022.03.08.02.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 02:10:14 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 05/11] pinctrl: mediatek: paris: Drop extra newline in
 mtk_pctrl_show_one_pin()
Date: Tue,  8 Mar 2022 18:09:50 +0800
Message-Id: <20220308100956.2750295-6-wenst@chromium.org>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
In-Reply-To: <20220308100956.2750295-1-wenst@chromium.org>
References: <20220308100956.2750295-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_021016_213685_CD4BFABB 
X-CRM114-Status: GOOD (  12.37  )
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

The caller of mtk_pctrl_show_one_pin() is responsible for printing the
full line. mtk_pctrl_show_one_pin(), called through mtk_pctrl_dbg_show(),
should only produce a string containing the extra information the driver
wants included.

Drop the extra newlines. Also unbreak the line that is only slightly
over 80 characters to make it easier on the eye, and get rid of the
braces now that each block in the conditionals is just one line.

Fixes: 184d8e13f9b1 ("pinctrl: mediatek: Add support for pin configuration dump via debugfs.")
Fixes: fb34a9ae383a ("pinctrl: mediatek: support rsel feature")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 3bda1aac650b..38a00a906daf 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -634,14 +634,10 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
 			pullen,
 			pullup);
 
-	if (r1 != -1) {
-		len += scnprintf(buf + len, buf_len - len, " (%1d %1d)\n",
-			r1, r0);
-	} else if (rsel != -1) {
-		len += scnprintf(buf + len, buf_len - len, " (%1d)\n", rsel);
-	} else {
-		len += scnprintf(buf + len, buf_len - len, "\n");
-	}
+	if (r1 != -1)
+		len += scnprintf(buf + len, buf_len - len, " (%1d %1d)", r1, r0);
+	else if (rsel != -1)
+		len += scnprintf(buf + len, buf_len - len, " (%1d)", rsel);
 
 	return len;
 }
-- 
2.35.1.616.g0bdcbb4464-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
