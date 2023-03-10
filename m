Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D72BC6FD19
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 21:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O/rBHJ3jeIsF5DnV3iy779Hl1kpRg/pHkoneANxryCI=; b=tflbmXDXZV8fvNjgTv0H6rnj5S
	qvI7uGp3uoY2bgyX1xUspGr8yO+W+JgNJexd02tbxPPXk4dq0AsBEAB9I7H4+YvfP/3Ix1EnnRjkO
	m1cPry/Cs7NpHsrQxbI//0wdlkFcRYsb8lt5N99Pw0fna4tJMxlSJTJwnUVIlw82cFl4htvWm1FAV
	xPJ1KTeWxafWqGEXGfcw2pXSTkULDBhTUp2aZ8atAbq4MFfgOKKR+qtlP20GKXR6jGuHIop0QMDm6
	I+ZP7f4ey/g34ONaoVYfUmu1Bz1/OUtGb29rhxpjL9N1ZCrA1q2MO/J3q12WwfwZNZeNDlSyiXxKu
	eUEldQjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pakb0-00GDrE-AZ; Fri, 10 Mar 2023 21:48:14 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pakYr-00GCfj-Tj
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 21:46:03 +0000
Received: by mail-ed1-x532.google.com with SMTP id a25so26296095edb.0
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Mar 2023 13:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678484760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O/rBHJ3jeIsF5DnV3iy779Hl1kpRg/pHkoneANxryCI=;
        b=WOf2iSCsXwS62ug/vDBqFMkRtix9/vWBUiRhgFZOjhuprtPBFxYrtqj4VBGgN2ub02
         wHxkiZKTM6hzdnOZtBSurXVOk91OJx4tnEONmxiSrFRN/D1dIi+SyczihywuT4uwFKcY
         km03HwIRfAA9d461o5IegH9QGU8Bnmba3XqD002qlz09rBVzu3oAlMpM46IWJDUNmgzn
         3bX1/YjTVYaH+Qao2tmS7iY4+dNs1ybWCR40VlOeEM2JKoUTLiPtyZYRw+YTrPCHQKNm
         xv83EEhaLiK7kgeZgp0fpScYcotjksoAhmVmIWurb2rCHY9TsrQao9bTr7AJ0x6ByhIX
         mu8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678484760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/rBHJ3jeIsF5DnV3iy779Hl1kpRg/pHkoneANxryCI=;
        b=E2DPmcpCd7TyDdwyhThwPm1r3nhDxwY44pU5/xSEXdum0w1ZVUK1UZqeAsQVLZ0ZwZ
         zPG9NmRyChbvZWncvx/+WiQbLqJSzZTI8pvg57e00BoV2PipWjBpVdXRF0NSJCWMD3st
         hVMxxumJkmaU7H0BK6FL+yb2D0dbEWyUKyNr6F0KHU5jSmZo5X7x8SJO1rUlZuXWrafL
         0rtZckyc/gzhk+3T859TdZ0FS52dbAwtom2hKqpjdXb6CftoVX0FUnIUr31/muK5bdhc
         DjhdCBH/DQLMbmTXHN9OL7akMiXU4xEULOXOKANVdgqBnyWSSw5zMNY8LqR1z5RadbN0
         fIQg==
X-Gm-Message-State: AO0yUKV4VdLRehVlD/FaCemthqU5RJw7DSHdi6w4wbl72ovX8PVCvOA+
	cTcP/piT9o395508whq7ngIPvw==
X-Google-Smtp-Source: AK7set+bDbd+tDtc8yzuKVJawgRnJ7VqI7if9gpDpNki1cjNuiiSF0MocAmariVO2bQ/AAQWG2Y7+g==
X-Received: by 2002:a17:906:c001:b0:8b2:d70c:34ae with SMTP id e1-20020a170906c00100b008b2d70c34aemr27335425ejz.71.1678484760561;
        Fri, 10 Mar 2023 13:46:00 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id u7-20020a50d507000000b004be11e97ca2sm471873edi.90.2023.03.10.13.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:46:00 -0800 (PST)
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
Subject: [PATCH 4/9] regulator: mt6397-regulator: Mark OF related data as maybe unused
Date: Fri, 10 Mar 2023 22:45:48 +0100
Message-Id: <20230310214553.275450-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
References: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_134601_993520_F6286278 
X-CRM114-Status: GOOD (  12.90  )
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

The driver can be compile tested with !CONFIG_OF making certain data
unused:

  drivers/regulator/mt6397-regulator.c:400:34: error: ‘mt6397_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/mt6397-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/mt6397-regulator.c b/drivers/regulator/mt6397-regulator.c
index b9bf7ade1f8a..526acc8fbe80 100644
--- a/drivers/regulator/mt6397-regulator.c
+++ b/drivers/regulator/mt6397-regulator.c
@@ -397,7 +397,7 @@ static const struct platform_device_id mt6397_platform_ids[] = {
 };
 MODULE_DEVICE_TABLE(platform, mt6397_platform_ids);
 
-static const struct of_device_id mt6397_of_match[] = {
+static const struct of_device_id mt6397_of_match[] __maybe_unused = {
 	{ .compatible = "mediatek,mt6397-regulator", },
 	{ /* sentinel */ },
 };
-- 
2.34.1


