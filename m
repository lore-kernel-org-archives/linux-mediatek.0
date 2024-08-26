Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FE8C54731
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Aug 2024 10:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w76jNQAWt6bAp+W3zUZ22TllXAAFoaq8C3LjT25NtVg=; b=mr2D9TGDyZldSEv2W9Vd9HfdNY
	oo5KUUt7gBto0GI5lsuambOXUPXtXYndoCPSLn0Pqbjie6fwj7V7HGIS6iaHXgqrzxHSY5jPnoTQ7
	Y4zxSjUu94dVJKtSeLqGwBNUXaQFwDrfOJZthKvSk8CVbGvMgsnLlIvAX1lXo/6wFOAA5sUY/FN2z
	Bght+Oxj1Q689i8XERgASAiWqX0y3exmUap0RF8TW6mM2edJhJSBOd+r9oYa2EAdE6L+X1C2JBs8c
	JpZJmF+9PNGKrRZtmZsjgzfaRPGikWCBaH2gfUldGvTXRNERnnKk70mEFkWoxOEUsSKTEts0kExXT
	hJsSGiWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWkP-00000006sXn-2udl;
	Mon, 26 Aug 2024 10:14:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWda-00000006qjJ-3Ln1
	for linux-mediatek@bombadil.infradead.org;
	Mon, 26 Aug 2024 10:07:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=w76jNQAWt6bAp+W3zUZ22TllXAAFoaq8C3LjT25NtVg=; b=U7y7PTR63llOE3O6J/EAnGiqVL
	M7q+PN/MBh9wOqa+hs6WqF0FPlFT0g1PSip6PDzpaTUje7dzCH6c3Z4PszmQ/LdBHI6DFk59gh5OD
	WwA9KTNpqHDUUB7f9LG7KY22pqtjle1zy/c3g3LKyO6/sGwjVb/1Win/Ru26aiqRzAbT3fw/Cr/uW
	1CXfwQOGY27QzyhgZxE3O1kT+tMdgruGVPvxbuGUBQh+lenNbDDRfFnrJ62C+iCzprLGahjYM0Xsp
	9soMet+tDV7Waiggc8Zbpbd1TCvd52WQhuPvlleoasFZwAX+rzHuasvgl+I0b0me2X2+vMkOeoOul
	zZvQzx6w==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWdV-0000000Ad9l-1nIX
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Aug 2024 10:07:49 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-42802e90140so1842015e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Aug 2024 03:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724666863; x=1725271663; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w76jNQAWt6bAp+W3zUZ22TllXAAFoaq8C3LjT25NtVg=;
        b=MmoYJxw5AEtQVRFNe61sLwWL9esePIYl8Dv/guf49TOXrKtT+/EFLBBqAUKMAFriWh
         M0iGWFeMWJTsZPbxmpOMUysKisqIvLgAbSeuDX1OfkyselV7gn5lsswuxzA2B6STNcVT
         R2GudTSpT8eHe1lau4uoT+7q/QQPnNGghW7sz59R/saAYchipPHraxcxf60fBMhkTDcZ
         gNbuXC/KAOsEP0TCRzCVsPv+R03PW4vec7voijxayzBfwZBTrRY8f/OcBnsE2JD5+OBD
         CsuuDojMd3DD78pLHklEukzwArVI3eKDX38kZqRx0oweQrA5NREvR1cj/SWH8ur9KDi1
         31/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724666863; x=1725271663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w76jNQAWt6bAp+W3zUZ22TllXAAFoaq8C3LjT25NtVg=;
        b=QrqEMlFpg+Aq/2fjC1joZ+hX3vj7U4HJu2zGWlP1wdPNvyTpSA1usomSQ33c39KrNK
         uYg42LJ8RpVPMhkYVEwGzT3r6SC3D7VIyaGGR2MRImq1TeriBdqxW3V25IPWq4kj7/7R
         7Zw4Cjhq1C/VBU1whf7DKD/e4g0UOm4+1/djZtnVuzXOxB4Q9GA0zO03X+X8pUNO2m/q
         4eADDKKXaT3A1ZSUDdJTo5D0+q4xhdF1Fe9aVEYcbxOwRpKgcf3A7PKAUiJe0IOPZ/Zj
         1xIdXbX3jaDKeJIvgl3NZGREofKEqxcEOxW0AGpkVphORs+0SSpM5yBBaplPqyDMHCEO
         G9Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVwVjznFkLeYS80/VOz55ssK1pq/m12NBhVbmTK88xvmsXb4UxIGPvBYHNqrmoD7feac39bNoYOgIUNnUNPaA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwrPl8BToQK9ZDg1zJkI61xmqggyNtGYItMzZHv2mmp6FSwj5mc
	fjjnIdub4lNfChv3wfynZ2tF/Yc/6/CbjgQ9QYBgsHaviMzzm6PMiiLd3E/qcKM=
X-Google-Smtp-Source: AGHT+IExT3kmRSceNRiJcXglO6EQr+JgRlwbktOceZAKBgocM3t4FdK6T71lQ8U1bTjnR+v/YdTdjA==
X-Received: by 2002:a05:600c:1d22:b0:426:6fc0:5910 with SMTP id 5b1f17b1804b1-42acc8d4dabmr44531595e9.1.1724666862755;
        Mon, 26 Aug 2024 03:07:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37308110009sm10324821f8f.18.2024.08.26.03.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 03:07:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 26 Aug 2024 12:07:23 +0200
Subject: [PATCH 07/11] phy: qcom: qmp-pcie-msm8996: Simplify with scoped
 for each OF child loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240826-phy-of-node-scope-v1-7-5b4d82582644@linaro.org>
References: <20240826-phy-of-node-scope-v1-0-5b4d82582644@linaro.org>
In-Reply-To: <20240826-phy-of-node-scope-v1-0-5b4d82582644@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1922;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=XFJ5tns8gjfvYAtdDyTfcLoPh02DwDwXoBQWVHMfwN4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmzFPe01E0Dq3KWujpfT2EVykCertsjntcsXBD7
 +xUsNUHtVaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZsxT3gAKCRDBN2bmhouD
 14N3D/47LpfmUaVHVAo6X4RPv0WAxp15k+koHvm3j2dUhTy7ZzV4EXYQECCOfFGsB+CPzxwJwc5
 Lg5d7XwJxs9h5sfcDWf5rvgrpSoPqbgPEgMt3ofDnhmXcpelT+lJwgZ9DxZdGMx46xMNr0PIA63
 1RHnEPF5iJQlH1zjQVUaiUtIoq9H5DtH3i3uF2msnwsgYRl/r11LxSlaBb37HgmubTH0EYr/3aV
 UyG65tricVuY4f7q9XjgSI86CCCoPjiclzQoYKo2Uwrw6e8/kbt6F2TfGwyadrvLyuWdwca9UhY
 NwnzS5Dfc+jtMIm1MG9dX+2Xog9uutXkTRBVyN/JAPUw4COYFxLwvoGdRNFtaK57V96PZF8TduH
 jB74iPXTm5PWTrZQlbhZlAuVbYzjVWL8F6cI62QbCjiJVaZXzJyHlVTCDKTL4a+qKhtQitydsGi
 YymvzTC0L9jX7NsoATfnvbDN5A04ldqhv7gyRHIghP4YZjWk5FGQU4KZC7j3Trdm2SH6aCR6T7G
 jIww5t/cBdwRPzapjcCNHE89Qks4EXKfW8NXS5TysLeSU0okvPw3A9eqJH/YyBqLPBWkmEu06zw
 gciV7L+UwHo++g8M73hfXlCa8sLYeYOySlvoUr+GWhJoZ1IHIl1LMpwU8WGjxFU02xUhUganhfm
 6E0aoiBNZ6ogpTw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_110745_558976_E9D949C9 
X-CRM114-Status: GOOD (  13.05  )
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

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
index 5f89e3a3e54f..a7c65cfe31df 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
@@ -725,7 +725,6 @@ static int qmp_pcie_msm8996_probe(struct platform_device *pdev)
 {
 	struct qcom_qmp *qmp;
 	struct device *dev = &pdev->dev;
-	struct device_node *child;
 	struct phy_provider *phy_provider;
 	void __iomem *serdes;
 	const struct qmp_phy_cfg *cfg = NULL;
@@ -773,13 +772,13 @@ static int qmp_pcie_msm8996_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	id = 0;
-	for_each_available_child_of_node(dev->of_node, child) {
+	for_each_available_child_of_node_scoped(dev->of_node, child) {
 		/* Create per-lane phy */
 		ret = qmp_pcie_msm8996_create(dev, child, id, serdes, cfg);
 		if (ret) {
 			dev_err(dev, "failed to create lane%d phy, %d\n",
 				id, ret);
-			goto err_node_put;
+			return ret;
 		}
 
 		/*
@@ -790,7 +789,7 @@ static int qmp_pcie_msm8996_probe(struct platform_device *pdev)
 		if (ret) {
 			dev_err(qmp->dev,
 				"failed to register pipe clock source\n");
-			goto err_node_put;
+			return ret;
 		}
 
 		id++;
@@ -799,10 +798,6 @@ static int qmp_pcie_msm8996_probe(struct platform_device *pdev)
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 
 	return PTR_ERR_OR_ZERO(phy_provider);
-
-err_node_put:
-	of_node_put(child);
-	return ret;
 }
 
 static struct platform_driver qmp_pcie_msm8996_driver = {

-- 
2.43.0


