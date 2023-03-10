Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E434C6FD1E
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 21:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QldUnB9DK++r9IeP/7G8h+f/oI23uHDDVTXX+AKTbM=; b=TdSG/cnQ2IfqqDyDqpghE8SMi/
	OPo1DCXdRDYa3e4SaB1o/rhLNrDhryild8wbCjoMwLcabsq4GEmOPwJRKExKx1ELVvf8mY8tqOVF7
	IJmGNcivdytWdjShFk2ViWunWFBNl9zGKiX0nTZFZGEanV6x915VvFcct9iIIkD3HgAJG8oWEWMp1
	TfYjZRLdjdUcv0KQ4opOblXnjFJcGCjgWLpnULNh2zstWH1LN8lZbs3JwHh0SvIGJFkQMn3zQ/T0K
	uVBcPLa1yYcYZTuhs/guW+oDxV847JCR1QAs7PzbJ2QgjJ9rCgtzs9UMvTf4wIxDDRtXnH0qTQnfv
	aOdsmZqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pakdb-00GFAC-CF; Fri, 10 Mar 2023 21:50:55 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pakYx-00GCe2-KS
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 21:46:10 +0000
Received: by mail-ed1-x52e.google.com with SMTP id x3so26030258edb.10
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Mar 2023 13:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678484767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QldUnB9DK++r9IeP/7G8h+f/oI23uHDDVTXX+AKTbM=;
        b=VSJs/E5dMhRtlW23myb9CxFaOl67MqXlhDSjdI07vDkatFJhqu6CTSFwx9q3jk4IJ0
         bLNsXnJ6+2s9GtGXkd7GBt5x7sYZ+LJ6dmr6h43+y3oDVroQezV7kUy1CcFnFU1Llg/E
         YC+gYRYEU29XI9Kozo9ZU3HdP4ifHCmd+GZJpqZhPLNUhkCMU8yoesRPvOZr46kDXbTl
         /d1ly+BVNEqnEm1enL7nmd86UITqH1KUu17WoOU9FI/k//BzGg0h0nFednZCVIzwHxQf
         xeGKlzIl8oKtLGBZlAVJHz3+hBVez+oQZG+JsgLigZTWVhOLq3G62m+NVQLBRN3DsFja
         D0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678484767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QldUnB9DK++r9IeP/7G8h+f/oI23uHDDVTXX+AKTbM=;
        b=QdgIA6rpFOYYbpB+o/7jy5JqM5Lk8nwMnnIXQ1QYQSjONzLjwT20aQ3sefiD0/SiPJ
         e5OzWrObnwAKlFu0ndkaw0Zb9WzVGoX4ZDwxJHYKglMtGy8tQv2N3gigsU19bJj/2HMw
         ja4k/8wHLJUj0IdlrOoN6gFicGqpX/dG3HK8HysfxzcdHV2henL2psXJ2Jf845yoXc7s
         nWKp+9uM0D59K7FEtQ1M3BbbBWi0eh4tO9OrkymfzMa9sHlv7PDbg/dXC6+UGbfuAjo3
         J90CqtjY1y/rBDk5CUrf7f4UDHbC+OUP5M6z2CN6VonhWngaWuOE1TmtQSHaqMBg6fva
         3cRg==
X-Gm-Message-State: AO0yUKVR9M/e2CFzDGEDvx/Nb80JM7EjwsWrJ7Hqij3YGsE088OW5/Yd
	bH5UVilODOwqMOes3uc8wI2G+g==
X-Google-Smtp-Source: AK7set/TN6HEHcHKgSpnaQNAvcq6/J9mJlM0Vmdwb6gRlrMLE7hUWXDBNwCju/6Q/6+EyoGExFlw2A==
X-Received: by 2002:aa7:d683:0:b0:4af:75fd:8214 with SMTP id d3-20020aa7d683000000b004af75fd8214mr20546242edr.38.1678484767172;
        Fri, 10 Mar 2023 13:46:07 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id u7-20020a50d507000000b004be11e97ca2sm471873edi.90.2023.03.10.13.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:46:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tony Lindgren <tony@atomide.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 9/9] regulator: twl6030: Drop of_match_ptr for ID table
Date: Fri, 10 Mar 2023 22:45:53 +0100
Message-Id: <20230310214553.275450-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
References: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_134607_741045_F027218C 
X-CRM114-Status: GOOD (  15.35  )
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

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it is not relevant here).

  drivers/regulator/twl6030-regulator.c:646:34: error: ‘twl_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/twl6030-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/twl6030-regulator.c b/drivers/regulator/twl6030-regulator.c
index f3856750944f..be798f3c129e 100644
--- a/drivers/regulator/twl6030-regulator.c
+++ b/drivers/regulator/twl6030-regulator.c
@@ -765,7 +765,7 @@ static struct platform_driver twlreg_driver = {
 	 */
 	.driver  = {
 		.name  = "twl6030_reg",
-		.of_match_table = of_match_ptr(twl_of_match),
+		.of_match_table = twl_of_match,
 	},
 };
 
-- 
2.34.1


