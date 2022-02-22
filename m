Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39594C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 15:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xah0Mmf9DzdYcZz2ytEE9B+EAceQRBZUOtyfDP2/EDM=; b=wbBgVZ6f2jwoTa
	DMTRGk9EMa7RGCkBj9DlBOn7WdJCJi85Wlvq3o5nO4jst4f/tjl83OWm26sKDvPL6ogssoycaCDI/
	bVKuSvjgc3BbhQ9F5dkka3iCWlXFyszPi95Orw1fRqi4IkZr2h9oZbH6BCrziaVJLjJvllyIXmgCD
	cfTZMKl2GfBWgVFevwepUlKpIG5LHuruG9Slp7NPkd4DnZgXfyGTdWlB2z4b7YWrcMWAvsQ+pUoJC
	uiRCfgQzJlMKH7ZfdcZXb+s95ohvmvNxC9hN5JZJ4rwaQmBL5ycp8xhqaOnNzphLx4XNGA5mepphR
	IkFEEOlVRdtjCO5w6XuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMWnc-00A5MD-NA; Tue, 22 Feb 2022 15:09:56 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMWeD-00A0KN-C9
 for linux-mediatek@lists.infradead.org; Tue, 22 Feb 2022 15:00:15 +0000
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1E7973FCA6
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Feb 2022 15:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645542012;
 bh=5q3Cvfs96FMgD3OViDSeZ+rSi5cV583JAJ+X+hKXLOQ=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=GQX7eovLM2ONZ5zVmcjtC0LU9oboow/vk2ZQTFSgt5QDlIC9XCt8HJp0fuPO5sDOH
 hpvExQGg1Y554QlIO/uzGvNmWNY59eTCCAyE5ABTJawaFTd+xoOF4+t8kW4lwo88Vc
 5UM2Lcorn30ad+wNkmurzddJ0nE4LdYy6nY+dNB/AYkZw01GCnUv8qn29Ovp6i3DJ0
 UGb4CRbcXBmH3a/SQBSUDRdVdzM3dWT127bSa/VKAxcCpCysxoaqwyAviYPt8+VkAd
 axrVoMy6wAZmaFDt+42IvedFhIiRUUp4FL/MMf/ZkxRB/BKUAk/4rSLgKlisOrpr+b
 py7Yvihpa8VAw==
Received: by mail-wm1-f69.google.com with SMTP id
 l31-20020a05600c1d1f00b00380e3425ba7so475419wms.9
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Feb 2022 07:00:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5q3Cvfs96FMgD3OViDSeZ+rSi5cV583JAJ+X+hKXLOQ=;
 b=qjNnXpTpf2v1BrPKheq5KvMK/INlEl62tRVpZPIiJbglG/YkXGSchonqlZdPyx6Ubg
 slwSAeCMH1geHznhPMZVzVKeHPg5pLctf/bl+ubA/uRh+3yyKXB+mEgn1K6n6TGA9FyB
 jOz45oFYhnRPJCZ60TpIFuZBWRGhzc8tjQiVdksvRAynQA3sQo8t9QeMp0eZ3fYCSzV3
 q8CHcGHP7QD+EhRcFzh8ydlkwutJlTdEWVY03vLKE1+21naX6n2Iy15LYcCgjQ//MBfg
 NCVD5WlETAJaQcXdI1yJh6m+R2ouOlswjz/1e0d/5bXE9xgGnIltBhm9UhWrC9A3Ikns
 Zhlw==
X-Gm-Message-State: AOAM533x3+gqAKw3NlZYRZsqq0rAYdEdVcqP2SlCiVwuoIyEc5pWwaxv
 1hB3AOv75SGQ3nqwv2OjzZ2QwmnTOyfgKWK/SXslnBO7M/7/OkJ/PmL6MnskuNd35u/bjqxJMT7
 MQz3TE4BEitgWSH1NCq1PK37kACd9RL9AjF9GeYRO9Z2sdUax8w==
X-Received: by 2002:a50:e144:0:b0:410:d813:92 with SMTP id
 i4-20020a50e144000000b00410d8130092mr26862698edl.9.1645542001214; 
 Tue, 22 Feb 2022 07:00:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMw582wnovmDAi/CIh3lxLYM2LG2ODyt+mkZ0ZiJXVQxrV8hjaQpoxhGRnSRAJris1bHJ60A==
X-Received: by 2002:a50:e144:0:b0:410:d813:92 with SMTP id
 i4-20020a50e144000000b00410d8130092mr26862658edl.9.1645542000976; 
 Tue, 22 Feb 2022 07:00:00 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id m2sm2467960ejb.20.2022.02.22.06.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 07:00:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Wei Xu <xuwei5@hisilicon.com>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 Yaniv Gardi <ygardi@codeaurora.org>, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 13/15] arm64: dts: qcom: msm8996: drop unsupported UFS
 vddp-ref-clk-max-microamp
Date: Tue, 22 Feb 2022 15:58:52 +0100
Message-Id: <20220222145854.358646-14-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_070013_627366_A01875B9 
X-CRM114-Status: GOOD (  12.97  )
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

The property vddp-ref-clk-max-microamp (for VDDP ref clk supply which is
l25 regulator) is not documented in MSM8996 UFS PHY bindings
(qcom,msm8996-qmp-ufs-phy).  It is mentioned in the other UFS PHY
bindings for qcom,msm8996-ufs-phy-qmp-14nm.

The MSM8996-based Xiaomi devices configure l25 regulator in a
conflicting way:
1. with maximum 100 uAmp for VDDP ref clk supply of UFS PHY,
2. with maximum 450 mAmp for VCCQ supply of UFS.

Since the vddp-ref-clk-max-microamp property is basically not
documented for that UFS PHY and has a conflicting values, drop it
entirely as it looks like not tested and not used ever.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
index 7a9fcbe9bb31..3ade756e1cd9 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
@@ -341,7 +341,6 @@ &ufsphy {
 	vdda-pll-max-microamp = <9440>;
 
 	vddp-ref-clk-supply = <&vreg_l25a_1p2>;
-	vddp-ref-clk-max-microamp = <100>;
 	vddp-ref-clk-always-on;
 };
 
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
