Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C92DC77B6C
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 08:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=70JWiI3ir/yodHMirtpCr960hDJucp8ZmgOAZyHHfjo=; b=r2vVi4PIwR3Jb0m7xDOoZ+mEGY
	rbb31bphADEnU3NWFLs8yfnt1mKBMlTln5xtvRyY8uUBsrd9bmREoWc3dixpRyOb8qaUOkdyx+QsM
	lWDeTP410OcztFmA1rn5rFFFKey9WuPjg5oKL82QeDsz3gXIFyMmdwj1VSNxesBoadtuqG+Ya2E7o
	BIjLSdVaqxjBSqvM8WpY2ny2/1oLyOSug6qTenbLYIlBzhPAPY5ZPTkhjibHOSRgfg84UV2p1EXga
	LQR2wwGRtivjZZOLj4NbQHqePIfkQL7kMQ+fx00/NOh3PVgQd447TfIyebBnPvsfu/0lGCul/8b6B
	nFc5iJcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjylt-003plG-2b;
	Wed, 05 Apr 2023 08:45:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjylp-003pgN-04
	for linux-mediatek@bombadil.infradead.org;
	Wed, 05 Apr 2023 08:45:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=70JWiI3ir/yodHMirtpCr960hDJucp8ZmgOAZyHHfjo=; b=Fgz7xCxyNgutXaDIjEcbZKfhJz
	7apd9ifmvrf+ymTpq4TonkM290nQPfOZHEU7VCLS8C2Q6y/SGdiH6/D2v3sxr8rJioInGID+NRpK8
	qZuR2c569/sk8IV0wdA+aPGszNdn3K94yOhKOZquY0imDxl+8Rncu4FxLGryFzauFiSkmmifPcPRE
	TjB8aiB9TAUHLl3z6nBr+UaXvEmcHVXFlSJ8MH39bpMzQiRXxXoz78IIsQScoDbzn1PKeF9bqU6IH
	FqGvGSj9qLlmW8KnTESGHABKkPjnpMUie/SXad3mkKit/Vamh37kTrtvQDOyhVIPwg4tOneebH9Je
	4QPws8ww==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjyBT-009pUP-1S
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Apr 2023 08:08:02 +0000
Received: by mail-wm1-x331.google.com with SMTP id i5-20020a05600c354500b003edd24054e0so23178365wmq.4
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Apr 2023 01:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680682073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=70JWiI3ir/yodHMirtpCr960hDJucp8ZmgOAZyHHfjo=;
        b=UIeNa8V4y0LfXdZ77i6wULMuSQuFfCnp1skP+YCmsKzBVPRiY62v3O5ijLSeQMw6e4
         KShG2PJFA1cbBXNvw9XfIWHIBEoASywcnK7eBgZ08MpbPTUdtU7/AwNQs4oInM9ldtPG
         +hxtXV4DnyDAx3M6y/jHA168S8YXAZH68Jck4N8uhSJcvpVajVZsSiy0sg7Ia3buO2Iq
         oVSLUW4UfYG2ecS9V18nUoTax5IWmheRCuMHSEm4mX4H68i2VMRKb7OQ0iCPq40oJGCh
         Qk3frWQ60i1ymoRkCMf3PZHCSEwGYMpGxmuFFae3PyOByXwYzvKko0h6hc3f5ArCc7+E
         OImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680682073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=70JWiI3ir/yodHMirtpCr960hDJucp8ZmgOAZyHHfjo=;
        b=1txfVdLM8ol72Wa/Zhy0UbZf0Bqw0M5rVcv+TJsKi6h33bcAuvvyzzJt0/zHAYtjz2
         hmg9hDVUd7c55dDELj2BSc5C+6gRbAbHozfF0DzZWDXjF0rxyVCax5VHDZ5ZlAMZLCdl
         IaZWyqb5A5XbsSNCUvDmkRs1c20F1EdPwBQWI2iwwbewOUV+XDfmRyq4p+RSZMLIhZsx
         PhqS1t8HPw2V6XfSuYUvjtSWd0VQ/1FRUrFrTEFnzuhdMJEQprlvkdftWPgMX7/BUsF/
         yYcdRBRZq020eTxshKt27IGBbdH78f6L+fEyMCMfKSoya026i36Zw6dAvuPta/VEloZo
         kedA==
X-Gm-Message-State: AAQBX9eaeQNSbc0hw5lF0O6AGp0rUr2ij40SKYFE3gzYnrP3wUQIKUpP
	tUuBUYiY/Nl+2s1MYBwyuSMR0Q==
X-Google-Smtp-Source: AKy350b9UOsxTOMqwUZY6vSkEawSnM4J8Hn5cHpyuKPSb9tChyLni5Q6tvJ96/RkzYE/aDoAlZbOGA==
X-Received: by 2002:a7b:c415:0:b0:3ed:c84c:7efe with SMTP id k21-20020a7bc415000000b003edc84c7efemr1210893wmi.7.1680682073579;
        Wed, 05 Apr 2023 01:07:53 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d4-20020a05600c3ac400b003ee8a1bc220sm1378395wms.1.2023.04.05.01.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 01:07:53 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 05 Apr 2023 10:06:47 +0200
Subject: [PATCH v2 05/10] arm64: dts: mediatek: add apu support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v2-5-60d5fa00e4e5@baylibre.com>
References: <20230207-iommu-support-v2-0-60d5fa00e4e5@baylibre.com>
In-Reply-To: <20230207-iommu-support-v2-0-60d5fa00e4e5@baylibre.com>
To: Yong Wu <yong.wu@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=xWFAj8fuPjSh5BRKLkeGKOoKQ305/M/G1EGxpvjOkWE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkLSxSoBzL686N39LczEX530ndyxmFITZo9OFEM7y4
 d9bivBOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZC0sUgAKCRArRkmdfjHURTeoEA
 CkeVoBKqG7XeOy18vlet+vsXg/YxjsTHZMPQNhRXr32clxtVRsx6oTo0LQtwSw20QgVaeJAZVRy3ln
 auw9gGujEh/7bYDNi66KNssUYK3wXvAvHGDiZYBW94LBMWNQMiscOr4oHZglME0C0l28HMVKB29U2Z
 lqt3L93jF6rVumPtiTvpjIc4asQstBdMxMpOT+7q9C/3pEpg5pCLhbskKSJDMXTE0kZLduIHKMRn33
 LSZb/h5IGRROiBRwWyId4r9xPa1SpsrOkYUlo44ibjViePXoWBm+JOjLg8U2gil3NwlqpM8EZCRUUx
 P+Z6MMqpg/VqtC4W04F80CVlhC6RRWkvfvPx65RpsnKhX9WZhY2EaHdsaf5tdsBcyjnb8SLZo6vRz9
 xwYhcMZlzFegrepGZmiLi4M3TF2oKUimnFOHneNxt6D8sVtd3THQQz+HW9+jb+pm3st8+iStKFpzwz
 PKKnS4EQLExyiulo+eePE2wGTEFVtZynrTUb1+kKPcwK4FHSlkFpljuVzXj/YZVlHY/m2mCNSP5RWw
 YqAMVSyCGPTD5oySWjFEG/TSdE7Ftuyxz/vgLtdlsv+mQEzmAUd4ZHJH+YdaUPy4U9KVt9WX905qCS
 dVs6WKIBtHyeC3umaz/KvJJxR252kckS2JV1YdH1Hxt+Q3oaVV3y2LO1emow==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_090759_857461_1CE9BDE6 
X-CRM114-Status: UNSURE (   9.61  )
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

AI Processor Unit System (APUSYS) is a highly efficient computing unit
system which is most suitable for AI/CV algorithms. It includes one
programmable AI processor (Cadence VP6) for both AI and CV algorithms,
and an eDMA engine for data movement between external DRAM and VP6
internal memory.

For more detail, ask Mediatek for the MT8365 AIoT application processor
functional specification.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 73cb10d296fa..386ab8902b55 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -604,6 +604,12 @@ camsys: syscon@15000000 {
 			reg = <0 0x15000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
+
+		apu: syscon@19020000 {
+			compatible = "mediatek,mt8365-apu", "syscon";
+			reg = <0 0x19020000 0 0x1000>;
+			#clock-cells = <1>;
+		};
 	};
 
 	timer {

-- 
2.25.1


