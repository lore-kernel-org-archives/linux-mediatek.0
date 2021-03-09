Return-Path: <SRS0=uKpE=IH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC0C2C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Mar 2021 13:46:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C5A464F69
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Mar 2021 13:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C5A464F69
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Wb+3ZIRCHKqsyazoDS+0UwLvR3ejbsK5FU+NURgiyOs=; b=erzvhXZzny1NNx4X6fHdNjmmH
	Ydewwyer4YnTE4mKau9Kev3Geb65PFw3QiS3r6Lcoq9MEt9u3XOPikEbwWqkwLJ8Ar5S96vyLHCN+
	a5nY9DF0cJw37vjj+LCq7DCax7Gk1IrACec6Q5Jvpz2B+XL580s2dZlpbxSrK11qM/50u704b1pHP
	lm/C/3vSjLL1AiSleP7bCnpxGIhXTVjRNTN/WPkb8Wl/gEqd1LNnMsMd8w3uG7ccwktmt49Pq/Vay
	HI0FSd/tzBDh8Yz1W8MQGEAgRdMaeeta4Zgy9CuDskTUmjcV6FWRDvjylJlnzjYZd26wYVQWBcPeg
	wv9LQLUSg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJch0-004jkW-N3; Tue, 09 Mar 2021 13:46:34 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJcSg-004eTr-MZ
 for linux-mediatek@lists.infradead.org; Tue, 09 Mar 2021 13:31:55 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so5206254pjv.1
 for <linux-mediatek@lists.infradead.org>; Tue, 09 Mar 2021 05:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sICRVh7f2CnaIXch/ljbyTh/YiC3SaJQVi2yY8F3cEI=;
 b=H12N7b5h918WXCPFRBD3eFjypWHlemJ2NEedlhsK4Y+jW/gPKmGoNQc/PuaNJZysRR
 O9rPB4lDgPsuLYfCGmP0oD9DK35lxHEK089L1VvuXMX7OjlJxtqglA1b6npGAoY+vCuG
 Iv4K2qLnYtfQP+whL2ahLwhq8K/2r4b0YX+HU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sICRVh7f2CnaIXch/ljbyTh/YiC3SaJQVi2yY8F3cEI=;
 b=bZcWYKJslhDY9g0MMxoXPuUV6j6hByQntIBeXgeEmBkUZ9AXKTDG4UvNFD3pgxD3qn
 F3+QEnidX1xHv0GPsCPlG1JWRfmgqMkXu4V/xH0tiba5b67+mFgu3fwI5RI13dNHhqyD
 HEZpkt+hq7wnbESkQbGPP2DwcD3Dko3U4Okfj8xcoMCE8AnHiQL6m008E++VXVly3PkT
 SFRLM/hK76eCF9D5iX+GCxK4E26tB/cWvD6QP8K1cfoLOzmHFxn9zQyRvOeFtLketFQI
 /MY13EYMjPSjo0pMBD6AiM1QdNFu8F4ce0Qo5wL/cZUyRpBma8XOm7hHxYep2vEfq1w3
 QkfQ==
X-Gm-Message-State: AOAM530YkiPNkwe/AyKNrzVUbWp7WfM3HAGEzOnAeuDDsMMuHEDJJ7Fz
 vmZFX8jYfwqiMqXqZlD2QuxYeA==
X-Google-Smtp-Source: ABdhPJxYtfPzJ7zMOJQNlO3kd9jxglEEHuxGkZlj7HUcxp/hZAfpbUv7ryxiLwxa9+QzytyaAMsfJw==
X-Received: by 2002:a17:90a:5413:: with SMTP id
 z19mr4622848pjh.137.1615296704224; 
 Tue, 09 Mar 2021 05:31:44 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:f936:57e5:154d:e0d9])
 by smtp.gmail.com with ESMTPSA id 138sm13678649pfv.192.2021.03.09.05.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 05:31:43 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Wolfram Sang <wsa@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-i2c@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v17 3/3] i2c: mediatek: mt65xx: add optional vbus-supply
Date: Tue,  9 Mar 2021 21:31:31 +0800
Message-Id: <20210309133131.1585838-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210309133131.1585838-1-hsinyi@chromium.org>
References: <20210309133131.1585838-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210309_133147_248433_7D829174 
X-CRM114-Status: GOOD (  12.07  )
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

Add vbus-supply which provides power to SCL/SDA. Pass this regulator
into core so it can be turned on/off for low power mode support.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/i2c/busses/i2c-mt65xx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 2ffd2f354d0a..82f2b6716005 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -1215,6 +1215,13 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 	i2c->adap.quirks = i2c->dev_comp->quirks;
 	i2c->adap.timeout = 2 * HZ;
 	i2c->adap.retries = 1;
+	i2c->adap.bus_regulator = devm_regulator_get_optional(&pdev->dev, "vbus");
+	if (IS_ERR(i2c->adap.bus_regulator)) {
+		if (PTR_ERR(i2c->adap.bus_regulator) == -ENODEV)
+			i2c->adap.bus_regulator = NULL;
+		else
+			return PTR_ERR(i2c->adap.bus_regulator);
+	}
 
 	ret = mtk_i2c_parse_dt(pdev->dev.of_node, i2c);
 	if (ret)
-- 
2.30.1.766.gb4fecdf3b7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
