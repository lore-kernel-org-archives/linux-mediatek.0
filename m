Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5D5ECAAD5
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 03:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3iztdmN089REoQPlCSNzlH0JI17HfYILuuDitsqzGPY=; b=LIN0yaDLPrPuN+QWGb7vZjHQp0
	x3uxALkfE0FRxy+lHCtrLrz9KYFXDpjui2zWnGEDW6+vy9onWRRnHLDEUJkXvmgreOrXfClqQglaY
	+HInJRQg1jUXZZsBDJ+piLGBtAoXc4X3RHrb8Lx6oeVG7V+i2eVHYZ1rb4zg86b34WwdagDBrpTDv
	oP62LhF9FawXd6Hpq6pACG1VBP6oB3h4DRIIao3YOHQnEcw57Fi8nPE41Kewt8YYYi+iHks/Lqmb2
	wSKH3sYTrlgK8/pd/lUypozuUjcdmD0UFFT3e4wqzthMqcsfZWzf+Guc4nPtLRIeiBfVRexV34xuH
	3SEBcJGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSsC5-00Dr1O-TI; Tue, 30 Aug 2022 03:45:41 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSs8t-00DplJ-RE; Tue, 30 Aug 2022 03:42:25 +0000
Received: by mail-pl1-x636.google.com with SMTP id y1so8015216plb.2;
        Mon, 29 Aug 2022 20:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=3iztdmN089REoQPlCSNzlH0JI17HfYILuuDitsqzGPY=;
        b=DnyIRF7nyUAJtZN7g6y9o04lk6jibE1cUQfZIc3+eRhySeCnxnm/MscurEDoGGVBL3
         a8ec3qa1ED8BfJJ8AWswt1mibY29AbLkojUWRS4I0VhClziI179mUYgFqCcwTUdcIF76
         1KW9HFCJQg/565KAZVsMYKeAk234nXwNuxhS2qPwm0Pf7d/8WEacls+q0cNYC+0rGbjO
         FD2OCWB7tgqGlLW7Uck69cEMWzPI8GEuyfG7kgJ2ds+Vlsd9KoSlHKXs+HjXyucOnJ0e
         If76pNDwzyFqcmBlY/MdZS7yyE9/lZmfGweOQxjGkJsW00p7G1cJfliG72k7FURzAuRd
         XwcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=3iztdmN089REoQPlCSNzlH0JI17HfYILuuDitsqzGPY=;
        b=5umYwmOkgEPhQ6SuOAwqE8lhfLqUGmsPBtMNwjHEVFmgws2WhhLuktw6vuCEgDtiV9
         RKWsFVZ0tDvz5+aFoeQBFsZYNgYGMlUJBZ20DR+CL6b6SSQ6J5ek4yxaeQfT3B5Oopvx
         rdPatMh5ig5fg2uhQDaebQM8X6Jdf6GeHZ7MZAG98jm6rQXLqp54RPI/feXu+JzonKRs
         g/lz3fQOb5yGy62Lv4fgE9tVUkXToPMSk3RIpkFWB4rlq4YZ/tYDk7M5sx6ZEVrOHh/X
         Pv3G0R6WX9rkhayh+/KcljCAecInbeqTqqFDzzeEko8EeJFpFi4Pxf6Xu/taUxRkIVgW
         T0qQ==
X-Gm-Message-State: ACgBeo0tjjgAy/tqcyBx3aMjdes5imf8qvlkcgFmC90eg3ElgNMBuGhe
	J9lGZmFo2TDZei23n7laB+Y=
X-Google-Smtp-Source: AA6agR46UdRpvqM2r/G6VJkMeDqNmxN0/9MmcW+FxaEZbXO22yNo9RKv1KBD1Fc8SrKzFh3RXA2TTw==
X-Received: by 2002:a17:90b:4d0e:b0:1f7:ae99:4d7f with SMTP id mw14-20020a17090b4d0e00b001f7ae994d7fmr21253886pjb.200.1661830941194;
        Mon, 29 Aug 2022 20:42:21 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-77-88-242.emome-ip.hinet.net. [42.77.88.242])
        by smtp.gmail.com with ESMTPSA id a6-20020a170902ecc600b0016ed5266a5csm8439577plh.170.2022.08.29.20.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 20:42:20 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee@kernel.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com,
	pavel@ucw.cz,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	sre@kernel.org,
	jic23@kernel.org,
	lars@metafoo.de,
	deller@gmx.de,
	broonie@kernel.org,
	mazziesaccount@gmail.com,
	andriy.shevchenko@linux.intel.com
Cc: chiaen_wu@richtek.com,
	alice_chen@richtek.com,
	cy_huang@richtek.com,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	szunichen@gmail.com,
	andy.shevchenko@gmail.com
Subject: [PATCH v9 05/10] lib: add linear range index macro
Date: Tue, 30 Aug 2022 11:40:37 +0800
Message-Id: <20220830034042.9354-6-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220830034042.9354-2-peterwu.pub@gmail.com>
References: <20220830034042.9354-2-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_204224_023186_7BDBA6B6 
X-CRM114-Status: UNSURE (   8.86  )
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

From: ChiaEn Wu <chiaen_wu@richtek.com>

Add linear_range_idx macro for declaring the linear_range struct simply.

Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---

v9
- Revise LINEAR_RANGE() and LINEAR_RANGE_IDX()
---
 include/linux/linear_range.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/linear_range.h b/include/linux/linear_range.h
index fd3d0b3..2e4f4c3 100644
--- a/include/linux/linear_range.h
+++ b/include/linux/linear_range.h
@@ -26,6 +26,17 @@ struct linear_range {
 	unsigned int step;
 };
 
+#define LINEAR_RANGE(_min, _min_sel, _max_sel, _step)		\
+	{							\
+		.min = _min,					\
+		.min_sel = _min_sel,				\
+		.max_sel = _max_sel,				\
+		.step = _step,					\
+	}
+
+#define LINEAR_RANGE_IDX(_idx, _min, _min_sel, _max_sel, _step)	\
+	[_idx] = LINEAR_RANGE(_min, _min_sel, _max_sel, _step)
+
 unsigned int linear_range_values_in_range(const struct linear_range *r);
 unsigned int linear_range_values_in_range_array(const struct linear_range *r,
 						int ranges);
-- 
2.7.4


