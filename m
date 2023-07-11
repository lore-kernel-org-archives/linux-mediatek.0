Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA76EB64DD
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 06:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o42Ks/tCHx59zpvkkxrFyhauoCCL1U7JUVEYu4RWWvs=; b=uQpNZXaxuOH1MLwgVyv73ArCDj
	laZ8+bnG0F/GAwPBajVxgiv1Fq1KePKJfnUBLGWajfD3jjERYrD+RBtkSJx7f6+1aG30w2I+gKC01
	rM2gLQP1RSMWQXYLUtYPdiGjRkUkupDw6ZjNvBaPkWDk3XBojw9mtn2Yud+0i/5Bd91riuC92K27M
	1rViX3fOlw9NORydLLbRxoeGIH4j9qwrELRESA5TUgtpWV84ROW+pAUuBcuNNfiYMJNYhGl65dwkI
	SWoSoZ+RSdDnXF6tfuPBdAfXMb2Fxi7rjXl2tslxTTAfT+5pyqwctlHG9/gBf6fIPl1DxSAKMbVht
	i2vl5UgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ6cx-00DqN7-11;
	Tue, 11 Jul 2023 06:13:35 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ6cu-00DqLY-35
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Jul 2023 06:13:34 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fbc244d307so60749245e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Jul 2023 23:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689056010; x=1691648010;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o42Ks/tCHx59zpvkkxrFyhauoCCL1U7JUVEYu4RWWvs=;
        b=z8inQ+8MaqEzGKghYbTWt23tvZEQzsRbXLm7xauCjIH2NLhP0I3qVQSwTtGjwyLvrm
         xQ9bT7gT7LcA1bLwQyLOak1ybj9Z/QkM6HMKkFyNAMBBIsL1fREXvXYtH2IOmjZ62s7f
         8P4NpAkj5Kc/JR4uiF3A+d/Z+g+wB3ZXIvdO6nT1E99yHbQHEYY4Asd5fvJQU1gLvms0
         2Z/xX5af6r/vsvasoFMoVNK/G67xCRmzopDm0hePRoy1kwrYSPNwo9UQnM7bW33Vs5oX
         sp+8ChSIMKNfefGBojcBp+GNNAsEiGQ0YSduEIp+bWDc3VEBdsJ4C+KUSMlnPzRS0RBs
         LpbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689056010; x=1691648010;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o42Ks/tCHx59zpvkkxrFyhauoCCL1U7JUVEYu4RWWvs=;
        b=evkCCwB9hnvcT/E2xBAdgZnC/GowwEGvirt/h8PXclOU+f9moqKU1qSJBMFLcflxOy
         /FvB8QmF0yJ4nGvgbAiN7bYYeUoTU5rn9LG6Td4d9qV0wZyj+p3iXhplARHRIL9x2X3D
         hY4wqXtGoQfyoxWTYq/Gi8HRlk/G/TRP11ZxxkWYaExUPsKj0rPLyDdv6LVIj8Xlsyfw
         qHTEwOLW4nu0oWXkpIxlDrfQ5vbwYoc6xI9qFl965JGn+W6aYX87aO5nLBls4cPTIs4z
         7lAtSzG0TmSyVtZARkRxVWiOUMzhS+38AxugtEBQKAq6If7Bz9Lz8RNWPcTVTLb08ANf
         hWPA==
X-Gm-Message-State: ABy/qLanIAuiGVPJbfLe2Nmm+EwNCqPXZlikHn8CYvYVpLaTdzu125TY
	UD99sFHHkjM1r6bV4E7pfDMtcA==
X-Google-Smtp-Source: APBJJlHE2lKKPaUynutVNkXNfVhKn5DdgxT7YI1AidUkNO+4JOc3NtprI1IvH5G5uV7tFh1/jMariQ==
X-Received: by 2002:a05:600c:c8:b0:3fa:95c7:e891 with SMTP id u8-20020a05600c00c800b003fa95c7e891mr16791835wmm.35.1689056010209;
        Mon, 10 Jul 2023 23:13:30 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 11-20020a05600c230b00b003fbaade0735sm11944239wmo.19.2023.07.10.23.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 23:13:29 -0700 (PDT)
Date: Tue, 11 Jul 2023 09:13:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bo-Chen Chen <rex-bc.chen@mediatek.com>,
	Guillaume Ranquet <granquet@baylibre.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] phy: phy-mtk-dp: Fix an error code in probe()
Message-ID: <3c699e00-2883-40d9-92c3-0da1dc38fdd4@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_231332_996163_DE33ACD5 
X-CRM114-Status: GOOD (  11.35  )
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

Negative -EINVAL was intended instead of positive EINVAL.

Fixes: 6a23afad443a ("phy: phy-mtk-dp: Add driver for DP phy")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/phy/mediatek/phy-mtk-dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
index 232fd3f1ff1b..d7024a144335 100644
--- a/drivers/phy/mediatek/phy-mtk-dp.c
+++ b/drivers/phy/mediatek/phy-mtk-dp.c
@@ -169,7 +169,7 @@ static int mtk_dp_phy_probe(struct platform_device *pdev)
 
 	regs = *(struct regmap **)dev->platform_data;
 	if (!regs)
-		return dev_err_probe(dev, EINVAL,
+		return dev_err_probe(dev, -EINVAL,
 				     "No data passed, requires struct regmap**\n");
 
 	dp_phy = devm_kzalloc(dev, sizeof(*dp_phy), GFP_KERNEL);
-- 
2.39.2


