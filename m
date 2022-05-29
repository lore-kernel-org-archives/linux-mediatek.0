Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BA3C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 May 2022 15:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3CCOAxrgiXyJAeTpo0K/uTd49bkAs5tsU81Y3UTgqkY=; b=U5M9O1C9Yu7YKN
	m9HJUHikpbNLL0kDUkUn8yNy4VOIGiHlhiMHrMWoK5KQqg80XqWcwyjKYCw6rVPqwDIC3x2ypjz3u
	xlkGvEG9cEN8ftM1cZ+YVOJZ11+qTbNcGIV2zyEWKSoQ9YN9uBz0wVhEBnALehIZS2fJlVj5yB1Y/
	qF2SWYsqZVf9wVZbk4cmYt3dccodCnLCFKmvdtTXjnEfwnggw1G9a+nLVE0MdNthodAcweA1W4fgG
	n0kHh1DdGXoFF4v345l7NTHA1MnKU/GIwKQxUhJl384xScuQGl9hM6J89lq24r73PhJtyBPxv6xNk
	EIX3jicFtSRgmWtCMaUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvL8n-004CRJ-F6; Sun, 29 May 2022 15:47:41 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvL8a-004CNN-Br
	for linux-mediatek@lists.infradead.org; Sun, 29 May 2022 15:47:31 +0000
Received: by mail-wr1-x42c.google.com with SMTP id p10so11708625wrg.12
        for <linux-mediatek@lists.infradead.org>; Sun, 29 May 2022 08:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qnKqeTPuz31MP8DkEz9vuj/dviTwiPnr2/Rmul7p7v0=;
        b=8XjeiF9dLX/F73sAN7jeHWEZLMLKRNbLyw6jpLljeZcZg+OoGSjNTRc6ZoajO/5wvg
         cad2nHEOy1MaqJdoPrdrV0nwtCyOIxLIJMCc8SB04mfmGu7B14Pn0+0HGHHV7dFaWm+H
         ztfLfrmEp1V4sXew+sJJV1gaxM6VxIY50hh9+S70ElnUYq9zH1RQIPgF7/Otd0WiPBut
         kCrGD4oOBJ6PdziomJL62cr31LuB/ObkkskAwpS9Nw28dYXEFgFwzaG0pAgjw6y+eRGv
         i5nWKASomuOe+J7WB4t266/wylOzHuzdGPcRCe5CrGYIApp1x96Vc1gJaPVvkmg2NqNU
         rgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qnKqeTPuz31MP8DkEz9vuj/dviTwiPnr2/Rmul7p7v0=;
        b=4pPsqXznThg/xd2HZWsTCDXpwg849zSQrRy30LMMp98VF/L+pMLB6AqZENodwf4Rmq
         RLFWC84Awu0Q00/lCM869sBwNJdplndw/b0U4O5ZTjt1QR6SC+duLucTCZ6d8i9Z/4+H
         6VPqAfXSBacY6P2y7miJ7EbwKQaV0PCoIKrliC0TOCBvVPizLyecKcCl4nykY7qOhCG0
         8pc6+UmCxJRLR2q7bPKaPS0NWGEWW33NjQFakozgixiYlSGkdqNE3iYYluDnTOW78qe9
         FpaqyHUV6y/SopCYX024pERxi1EGOZ82+2U+YPyZzAZWqieGguzm0JYESX5QbURsw0Z0
         Grvg==
X-Gm-Message-State: AOAM533DrSorB7wvplcZgBT6Su2TeaRrhkI43sPd75YLwTwqCy8WsjXN
	vNVbRoBKhxGdFXMsAoCBI2fayw==
X-Google-Smtp-Source: ABdhPJyJU60U7IvzKvUdTZ/qiORiBeb9Mht2Jqd7Q6qxgDKpWe+tfKckKrUT+DlJwG1A/b6NnHsI3Q==
X-Received: by 2002:a05:6000:2cc:b0:20d:e6c:e4f8 with SMTP id o12-20020a05600002cc00b0020d0e6ce4f8mr41592097wry.374.1653839245826;
        Sun, 29 May 2022 08:47:25 -0700 (PDT)
Received: from helium.lan ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id i2-20020a1c5402000000b003972dcfb614sm7549942wmb.14.2022.05.29.08.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 08:47:25 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Fabien Parent <fparent@baylibre.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: regulator: mt6315-regulator: fix invalid allowed mode
Date: Sun, 29 May 2022 17:46:13 +0200
Message-Id: <20220529154613.337559-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220529_084728_571473_5975F528 
X-CRM114-Status: GOOD (  12.20  )
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

In the binding example, the regulator mode 4 is shown as a valid mode,
but the driver actually only support mode 0 to 2:

This generates an error in dmesg when copy/pasting the binding example:
[    0.306080] vbuck1: invalid regulator-allowed-modes element 4
[    0.307290] vbuck2: invalid regulator-allowed-modes element 4

This commit fixes this error by removing the invalid mode from the
examples.

Fixes: 977fb5b58469 ("regulator: document binding for MT6315 regulator")
Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 .../devicetree/bindings/regulator/mt6315-regulator.yaml       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
index 5d2d989de893..37402c370fbb 100644
--- a/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
@@ -55,7 +55,7 @@ examples:
           regulator-min-microvolt = <300000>;
           regulator-max-microvolt = <1193750>;
           regulator-enable-ramp-delay = <256>;
-          regulator-allowed-modes = <0 1 2 4>;
+          regulator-allowed-modes = <0 1 2>;
         };
 
         vbuck3 {
@@ -63,7 +63,7 @@ examples:
           regulator-min-microvolt = <300000>;
           regulator-max-microvolt = <1193750>;
           regulator-enable-ramp-delay = <256>;
-          regulator-allowed-modes = <0 1 2 4>;
+          regulator-allowed-modes = <0 1 2>;
         };
       };
     };
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
