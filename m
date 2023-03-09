Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3AAC742A7
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 14:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/9vCBz7vbbih/lGkwmf+FEiexLxZqGCZA0WwN10Gcg=; b=Ok/1XhuMZVui8KhOkRBnCfj5Rt
	VO0CFBJFuDjXOWT1zA3Jva/w89SNgy1zqNFOk6mot5pCXiUUmEnM3eLZlTWg4yKs3EzbQ8HNFDUzT
	nIxOLnWrHSCk5Wo505sF0Ew00wPomaemnool0u/wMUWu7fyniIIE2lttYV0cwbTYTqsLxfHocIVA3
	YZO1QbEwoJGNikdbZr+tGAUFuS4RqGGuFQj/iVvwYGfJSROjUNHAGyMQTtwU4L2ROvPwLC8qHsfV+
	ld62iSwWq2zpbdQKlCwCEtIhpKfQx2f7Ml66At48n2fghQ+cn0eu8sWpH0+ZLCOPV25DZgdzb826w
	hkXmai/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHcg-00Ageh-5A; Thu, 09 Mar 2023 14:52:02 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHWr-00Ae6k-DX
	for linux-mediatek@bombadil.infradead.org; Thu, 09 Mar 2023 14:46:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9/9vCBz7vbbih/lGkwmf+FEiexLxZqGCZA0WwN10Gcg=; b=okm9f/gqzlSLflD9ciCpEbhUnO
	iDz7YT4fuNh9AOBTg/x7pQgxJnpAxbkimu5ZBQCCqXdHILzduj7bR7gJ6GlVCJMHaKfZHLHru19UP
	ZIp2wN+X6ILkc1TKTkAEBQgkR4nfHhHjP1EVGqdhoF2Sn4+ifQS/F00RlGN771xIi8gQZu+HkXejr
	PyeznHe7W7cfSNRIsxcw+zbF3nnCo7Q5C3adwBCSu3yD+u2VUYOI2skCKdmA2jIIkE0+XxZ1tFpuu
	NLGdxzjg/BH4gJvfQxea8YQxzwaQnZXHrcl94N87vU+2PttIV1GidIukPy244JpJVyQxo0e99zvFo
	dDX+qOuA==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1paHAt-0008aA-2Z
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Mar 2023 14:23:22 +0000
Received: by mail-wr1-x434.google.com with SMTP id j2so2027736wrh.9
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 06:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/9vCBz7vbbih/lGkwmf+FEiexLxZqGCZA0WwN10Gcg=;
        b=iR41EdXLcY9VmMqJ50wJe8DxepsDnm3Avc5gouB6/svk5ih5KOyFUnMsz8p27ckXPI
         0gOMwjO162Erp1Z58W9sV/sh8R01CFL+0tE3RO8y0H7wU9ov49zSm+oudXb9sPqMexp7
         /xzKoRzA7BS5qwBYi/l81ZDJUAjCr9UVUqAuPAoW3pfuwMcUQbUUdx6mWLr4QfDFHDcc
         jA5iuY/FR8loTZdfEb567T4q0bM8A/o8x4tCp6GsGOQxyYoLvgxUg/rHmDNiwUVa9SaO
         4/gDznsmQqxeHoKtgQI4AnJ6tjAkJdFqfMC8TD2P/z8dL0DnLiW5LXwMjQY0zi6d1uZU
         Ac/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678371798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/9vCBz7vbbih/lGkwmf+FEiexLxZqGCZA0WwN10Gcg=;
        b=bPVbfVJE3IoUfkLeCfON9FooCrxEKPZ5fHy5vAwW2148Mrj6zHMUAzBCFIrQ635o50
         RvpMOceQJoPJPk/l1AT3MVxl7B17CFy3tLsGBqCgZhKA1Co76W2OdgTXym/5sKSvAVQ1
         5FeMPle82cMo885BoDjQ36bfhxLdceF0crNr+dplqL6MVy13FnwVJVIZ1WyoVTMiwJ+F
         ksiuzaE54KnKXXhQj+P+a/1hlKbOCvPaFLM505WdLLJyD3YONZ47JRczXvY9Ph9LJf68
         gdXkvjL9KRXoIYlA9bns+Ak6gT00PfnYL88UQJL+wQuZb7uDJzGo+wkLeTlG0P+7AcL9
         dX/g==
X-Gm-Message-State: AO0yUKXxM+l4MIkOAuNrwZgZG+eKS+mQbFrGRhhvlH6Q8ft0N5DUy6bf
	D1UvJWyURlYkmq4T1LUeZ9F2sQ==
X-Google-Smtp-Source: AK7set+I0/ScP4SoVVLH79fHBqsv90Adjnwakl9v2Z2Ku5kb3jT39ZJyQd/sDPiy8yRapuXBhAaTuw==
X-Received: by 2002:a5d:65cb:0:b0:2c5:5ec7:43bc with SMTP id e11-20020a5d65cb000000b002c55ec743bcmr18750369wrw.18.1678371797937;
        Thu, 09 Mar 2023 06:23:17 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 06:23:17 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:23:07 +0100
Subject: [PATCH 18/21] drm/mediatek: dsi: Improves the DSI lane setup robustness
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230220-display-v1-18-45cbc68e188b@baylibre.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xinlei Lee <xinlei.lee@mediatek.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>, dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1237; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=EBgpLyWateYNZX8XUe74shY32q1eVTHyK4Cgywlf4I4=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+czZ0Nf/pPTdrIG0J4SybkuXb2pnV+MfQKa3s
 6O0w84GJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURRyID/
 9CnYh9rUbc4xP78TqMzB81pS2PcGxhOcRpKPDqDPBsQ8MkxsoG8+MY3aHW0oWOYwkkCKJILq1eWvrZ
 FcGBxafCafObuCEud3eX/BmgrilCpkw9k14ReSAhoLBleabN5e4BHhxGwdY4MppGPkp5z4tcO+cBKo
 3NLvSlo7vGuU6t0pyo20+qO+Lgq7gyDW3qRYDQKyq8IaxIKxdTBJYJNUaZ7ys7TuQ4ljzSqdtle4xJ
 l2BNqkNuQfsq8NQ33JmFcv8fr8OjREJ1MkMJcGQ8yjmF7odFz0S00bNX8mOTCDNkuyL/gbUpMwym7j
 UDpymWJ38bRBsUoDiVbCZvFkpLyxmO9FD4OYNAK/FsSDWLAHsuSbWiEVSTIoUEpTz40K5hrN4MTVVX
 ZMY6bRv+KWIIfOqflp4HPRxHbMEPykdomliNR+UpGXU9RbGmiOVSIox47gyIK2ehXUPi6uR0hYmMA+
 meTS4KhKpspzecO0R1jj2ocU73Bj8FMaBsR1ZeZQBxehsGGEyZnuPBeI87HC6zGceNO4bfmtxQMEoO
 qpVdgs/c2cZ3lBj7PKzAw29XuxFAzFRq6UIJPYku+GJtrC/ARlfmxQVgSbfP53xN+TxJ0znX0YGjAv
 qruUaP/4i4Vh0y3GHvZeBUTuyBur6wgU6j9w+hojKtE0FBIRpZOvzCRRta5w==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_142320_143428_C87CA99C 
X-CRM114-Status: GOOD (  11.74  )
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

Currently, mtk_dsi_lane_ready (which setup the DSI lane) is triggered
before mtk_dsi_poweron. lanes_ready flag toggle to true during
mtk_dsi_lane_ready function, and the DSI module is set up during
mtk_dsi_poweron.

Later, during panel driver init, mtk_dsi_lane_ready is triggered but does
nothing because lanes are considered ready. Unfortunately, when the panel
driver try to communicate, the DSI returns a timeout.

The solution found here is to put lanes_ready flag to false after the DSI
module setup into mtk_dsi_poweron to init the DSI lanes after the power /
setup of the DSI module.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 3b7d13028fb6..35c36cc05c04 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -667,6 +667,8 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 	mtk_dsi_config_vdo_timing(dsi);
 	mtk_dsi_set_interrupt_enable(dsi);
 
+	dsi->lanes_ready = false;
+
 	return 0;
 err_disable_engine_clk:
 	clk_disable_unprepare(dsi->engine_clk);

-- 
b4 0.10.1

