Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04445C28D13
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Aug 2022 15:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d80NoVc4CKxgwm+1ORH7Ic+wtbyEu3iXvu/cuq0ek2s=; b=OWENR9TGfRJfVO3GBLNXBg2qxa
	lTYDaPlqZuHFR3jaUnHkTtVCFP7hzOgP9umm5FXNctq41rN9mvb+HNQkVKUXSDx0MNHsg/UdpZT46
	7M6oG5ED8B/jpc92DCe+9FumGKRtVozux388HL4XT/M/clw+I4i2Ec9HQ/wlYbCigbL1IEUCET49e
	uby/uqt1/RaZak4kktq8ycVfhZBFDw/8kFtTUcjyWo3XB7W9aGhwJ7rjqv6vJ1IG0sfMdG3TTer4t
	pZmvX5pllbFF1sDL/5lyeq9+5R2pbmWWrdK8hQPy4guv36ZCrfLhjBj0xBOMmn33SrCWqyFpPnone
	WDZM7M2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ9Lr-00CBin-4X; Mon, 22 Aug 2022 15:28:31 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ9Kx-00CBAz-Ef
	for linux-mediatek@lists.infradead.org; Mon, 22 Aug 2022 15:27:39 +0000
Received: by mail-wm1-x32e.google.com with SMTP id r83-20020a1c4456000000b003a5cb389944so7982832wma.4
        for <linux-mediatek@lists.infradead.org>; Mon, 22 Aug 2022 08:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=d80NoVc4CKxgwm+1ORH7Ic+wtbyEu3iXvu/cuq0ek2s=;
        b=bhgm4+EabLlHOnd1NBtiJTpSbKOsKlBBzPr9K9rd5uRNOTOJ3Ta5+P0Mf9buKQNA4v
         lVVU8sVQGtRg0Ge3COm2hfFJHl8E6Ie6wr7exkJhfv6TAAYq6rF0tk+xOSx++Av6TMZX
         W8Ns6DsnfhAsUVFKtnuIr4ZzWP+G9ZYnBVuPD2nMVNHiOUp92okd7y1Li4zF2ZQ4j7q/
         8W2fCDdRJlm4vJGk9NxaOO+9cukzDpWBqkBqyf0LGmH+RB7DTOEz0KoLdTvpAcNVtedh
         b6Ut3+lLKBwlaA1CAgNUpJ6nw2QL2UPihELOkvvJe1POHCDNnxyt67M+FbC5KOWl4Vm0
         GtzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=d80NoVc4CKxgwm+1ORH7Ic+wtbyEu3iXvu/cuq0ek2s=;
        b=iri+T12fC+l0K5z3rb4vIPiJCNIBkNoLNJgGLN8n/fOhob2H7Lw6l8jHHvHH8NHDCI
         N6KBa2HW4qTbzBQhJRK8JZD9CPAdKVBQvioSLQpS/Xc+GJSNRgChsfhYHkxwaymQQ7Go
         T+71QdCvggwnE8YLil4HfqsupSANtqeoaBj+tRG6ALq1AfnVR4J1mARZx8QriUdhnQpn
         rXgoQywV4gPBkVKGQ1HU0ywCQSthkqK73/zOlfrtzbngX5a4taxM5sbBIKUHZNyZMVEI
         1kP5YJEwaxqIKEm1CqCBDRsnKBj0o2PZV9cyUlW8yWfNGToPY+G8pOz4UAMD1oIlpkpp
         p/zA==
X-Gm-Message-State: ACgBeo1AT3GrsUiwm1ak95bWHOSJWv0iUySOX1wdWxMVHPjKhQYWuSqa
	znrW7tfj4/hvntjmB5W1Kww2mw==
X-Google-Smtp-Source: AA6agR6TVEaNAi2/4WaQwa0zk2Np4mNCbXQO/8e9/8q0irIV+qBfkE9CEoP84hfeDYme1VrMf8ND4A==
X-Received: by 2002:a05:600c:600c:b0:3a5:abdc:8ce4 with SMTP id az12-20020a05600c600c00b003a5abdc8ce4mr15419339wmb.144.1661182051744;
        Mon, 22 Aug 2022 08:27:31 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4090:a245:8020:2658:1f7c:362:3e99])
        by smtp.gmail.com with ESMTPSA id u18-20020adfdb92000000b0021eaf4138aesm14492011wri.108.2022.08.22.08.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 08:27:31 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Fabien Parent <parent.f@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v4 3/4] clk: mediatek: Export required common code symbols
Date: Mon, 22 Aug 2022 17:26:51 +0200
Message-Id: <20220822152652.3499972-4-msp@baylibre.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220822152652.3499972-1-msp@baylibre.com>
References: <20220822152652.3499972-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_082735_559136_37D0B383 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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

To make clk-mt8365 compilable as a module there are a few function
symbols missing. This patch adds the required EXPORT_SYMBOL_GPL to the
functions.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---

Notes:
    Changes in v3:
    - New patch

 drivers/clk/mediatek/clk-mtk.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index ef4c29422bbb..1ab6930f7fde 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -422,6 +422,7 @@ int mtk_clk_register_dividers(const struct mtk_clk_divider *mcds, int num,
 
 	return PTR_ERR(hw);
 }
+EXPORT_SYMBOL_GPL(mtk_clk_register_dividers);
 
 void mtk_clk_unregister_dividers(const struct mtk_clk_divider *mcds, int num,
 				 struct clk_hw_onecell_data *clk_data)
@@ -441,6 +442,7 @@ void mtk_clk_unregister_dividers(const struct mtk_clk_divider *mcds, int num,
 		clk_data->hws[mcd->id] = ERR_PTR(-ENOENT);
 	}
 }
+EXPORT_SYMBOL_GPL(mtk_clk_unregister_dividers);
 
 int mtk_clk_simple_probe(struct platform_device *pdev)
 {
@@ -482,6 +484,7 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
 	mtk_free_clk_data(clk_data);
 	return r;
 }
+EXPORT_SYMBOL_GPL(mtk_clk_simple_probe);
 
 int mtk_clk_simple_remove(struct platform_device *pdev)
 {
@@ -495,5 +498,6 @@ int mtk_clk_simple_remove(struct platform_device *pdev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_clk_simple_remove);
 
 MODULE_LICENSE("GPL");
-- 
2.37.2


