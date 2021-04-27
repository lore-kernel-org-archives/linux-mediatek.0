Return-Path: <SRS0=NJpa=JY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3979BC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 05:38:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 978B6613BD
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 05:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 978B6613BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=megmho38tG+MMaM64n5LlI8VBtYYcn4ZZaoxwLajsUc=; b=KhYs2jFwIyoAcX8rzK0msxoiS
	DwvPlNoJalHNn8PGPeeOuxrzgSvi3Ux6G8jJ6vCducXZgsciJufMLyIBkVga5jDwJYJXYvumniPvG
	n8prdb2lTaCY61FH+0mStLP0sKZxw6SZAqNbezayZxrccHXkDw6CLHuu5s0dNNyPmSVAMOL7/HS47
	tQHA7yeotiJp5alh+zqS+9w+42OND3iACD4+/yYN/ImVRTyLJlwnwAU4D6vNHcWnrxC2aTfF6IOA0
	rvCwwoGkAB5GFETfGeKvVDHo0POoiFh2MGFsVzOWIaLcCcU9CbSrS94Usi7HqOI1iBLYrM5prvs6N
	lS5hc8UqQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbGQ3-000lIx-N2; Tue, 27 Apr 2021 05:37:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbGOg-000l7u-03
 for linux-mediatek@desiato.infradead.org; Tue, 27 Apr 2021 05:36:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=oOSiNAIFbF5oM0OgD4JWcfn+rkikH5kg1ZaUYL3whtQ=; b=ulf7QQelJ4dC6rH5n3s4HtmrDm
 K4BcuRD/CvrjJQgNnD3ubW5Jqnt1Sf5EXxKVj7Q8PEkYFxhS37iarnEKQzibeiN8aunTiewyuv6N9
 ZxjVZJgyTfkZsVm++l6axyG4r4IKp6MKla/ihPtgz8KzDh/RCt81xyqUUsfDcetF3Bv0MMTD5cvxW
 Fl46ixJM+vW7zgp6PN+83AEsJSfrbJ6P2AQa84Qoq5tprFx2Eo4phS8+9WtMWH3OBavypi9aZ9wFw
 9y6X2cFA1KbppUBuUHhJHUl2iTkQ/e/3kSxOBsyu2QLOGpEWNAJeFRLrQiPbaiXIGJCmxhdUnLX+l
 2dcjiibQ==;
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbGOd-00GSEa-KF
 for linux-mediatek@lists.infradead.org; Tue, 27 Apr 2021 05:36:32 +0000
Received: by mail-pg1-x52f.google.com with SMTP id d10so3203968pgf.12
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Apr 2021 22:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oOSiNAIFbF5oM0OgD4JWcfn+rkikH5kg1ZaUYL3whtQ=;
 b=VOWdUtYAgwq1bQG3/NsqLEKs/W1eKLs6RW9BQiWCYyD/Rfqvg890AjJ+GEoGMq5OrA
 AJ5KHj4U1HvetQeuUVJVOIRQXy84KxIekLczgZ69sB4zUtPWSuutk3TpnMuHMTjWm4+8
 h8G+8PZFnH5Rm1K+s/a+i9Kx1KocC5TA7BsS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oOSiNAIFbF5oM0OgD4JWcfn+rkikH5kg1ZaUYL3whtQ=;
 b=J9zXWh1topKFrThGa5Azd20DuZHRUMcsw8bapaEimGrjWiYi1NhdOJYZ01ocn66Gm0
 9IRd1jue6P1VVAy6MoUWcJ+p3lyqhpQvJqVkdHEWuFDz7RmHHf/sB8hDH4kPiWmxApdL
 +oMw/tiXqFcd4r8bKhJmpI1zaRJKgha/L517Y5BEUx5BdGSeM0VwodgnyTj3HbxsJrn9
 U7WYx7vR7Ot7IjyWQ0Cf5qoEO9Nfn+Rri3kI9TQmNat5WWrHFR9Oq6h4avh2sQdKfmt1
 zVvtoYBgIDZyRgVoLpwB7l9cphcbIaVRwq402BAWofNWQa/0YQaNcUm/TGP+yJdVuWLQ
 MHvw==
X-Gm-Message-State: AOAM533+V0CPegAGUr0470SE+fzgusDFv5JEmDpqyu6WgznoE483hmCg
 WKQIn8nQkGygs3l34C5PxvrDsA==
X-Google-Smtp-Source: ABdhPJyrLflzW+OohhHuQBd5kScDJnTZGVrPGqJeEKaquqlC5N0ZXttwfYEPggjDOml6EKMuunb2XA==
X-Received: by 2002:aa7:82ce:0:b029:242:deb4:9442 with SMTP id
 f14-20020aa782ce0000b0290242deb49442mr21579555pfn.73.1619501790821; 
 Mon, 26 Apr 2021 22:36:30 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:3984:c4f5:8612:6b3e])
 by smtp.gmail.com with ESMTPSA id gc15sm993529pjb.2.2021.04.26.22.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 22:36:30 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Wolfram Sang <wsa@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v20 3/5] i2c: mediatek: mt65xx: add optional vbus-supply
Date: Tue, 27 Apr 2021 13:36:15 +0800
Message-Id: <20210427053617.27972-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210427053617.27972-1-hsinyi@chromium.org>
References: <20210427053617.27972-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_223631_682373_763074A9 
X-CRM114-Status: GOOD (  12.78  )
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
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
