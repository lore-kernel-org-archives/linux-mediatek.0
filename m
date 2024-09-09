Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587BAECE579
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 14:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Ca+bwI9Pu7F3YUoAaUsqSsRV8VpFvNoCThNciak41Q=; b=ovMsQ/C9gE38WGW3LVd9KmHw1T
	+ihtHDKbiSofakOCVmd1jf/tDb7YE+GDhfBIOrt9Bk2VW8TmeAaew5XMOpSYTn+oHVeVrNqkw2um9
	PMGEANI1fB9mroV4JFBsgW3jysSThE/Cx3I4K3f3HPP/pqTn64Ly8E5ZZ+Hwl/GMF+4ApMgsYb4U+
	klH5z7U/V+FDQekyq7FMGGAWKzaUz+1IHF8NVGOAlUC2CFavknxK2oV+Oldb5Iz0lZ43PysQklnpV
	9mSjyoxSd1V3qUHJJIUVogwy1zPJ9SfNO7sT/vBODZ9z1No3+QVXQYjklL3nYUHvBBdGB2s91u+EN
	qiKnORYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snexY-00000002Bfa-49BQ;
	Mon, 09 Sep 2024 14:01:40 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sneo7-000000028h0-3fxS
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 13:51:57 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-374c6eb1d44so106928f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 06:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725889914; x=1726494714; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Ca+bwI9Pu7F3YUoAaUsqSsRV8VpFvNoCThNciak41Q=;
        b=StCt5cXjmNoG1x66ABoUGefZ/XcKjqSZiWxSPAyQ/yB/lw/X9rKVPMWG+CyI1XGcZg
         tTUzc17SELTjXUZaoKp7RorvPPTwNNFIbDWV5b6pfbJAAlw5BJjjmDzoM7lCcOfET7nq
         GhyN0ajWo1baEEcdFYeY6fgrTfemUWoz5HAi5uofE5wm09ccPvaSCNoWAPj5HpSWTDim
         OJ1Zok/gGQSKHuSnF+D5K/F8SuzZK3MV1FO4wX3o/OradXCi5YzYeU3OhFjSHnxcnpGS
         I4YtMmHcrJiT+e85bgw4VqWLBoQUcWRdgrwoiWlz0H7wf3S/7937mSsEB4DftSbV4ulz
         HjUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725889914; x=1726494714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Ca+bwI9Pu7F3YUoAaUsqSsRV8VpFvNoCThNciak41Q=;
        b=WmOj8DNwyEs4XqOlSTAJyinCduFXSt59YjCbkg5Yme4Lt06OUGdB8/U1PzdeEB7zPS
         kMd868ahvgvfMcC9O7f0cudJmUSxIOYN1oUPwAKj8y0NPkaaVAwhksl844YCqufBWVCy
         tK0vU4OUDmJR60GnJASGkdFe2zTPeng3k19LQqkiyE2jeIO8tR1wMlm4rNOb+EDm4Psy
         7Tgzc1ZGZ7iQ5YiUJVsWPjUjuv4v0zxy6bAaCC5XuvnxstfM1ZnP6I+ckGsqAZIhyEl2
         CrMLYt2WpXufBDGwPPKizzcc2+ukhNXkt2Yn3yV5DGWenNyy6IC/OW1Ub1kD+JrhXXrd
         CJ/g==
X-Forwarded-Encrypted: i=1; AJvYcCX0dFTbGfTl+c4kVtT1lT23+PxW3XciwA1pkEOVw07LJAa/aazhMRMtpXQ+G9v74+219GYbA+N2Pc11hi4Vyg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwvpH3N0m4t0LnKe5adcmQKqkGoEOkZt2MrkvR2/Mq8MyT9axIU
	yp8NRbX19bIL71g8IkTtQrgkY5bIqEW8/P1bEibNzxBpSBmowI9TyVCjmJw7vXx5rMiyLUpyoW5
	S
X-Google-Smtp-Source: AGHT+IHwSOk/fpUD97Xcan+P+CIOyJe34rmyJqYvmDhNziRzvW/wcrZnoC+6JMIT/uTXpLghlRozEQ==
X-Received: by 2002:a05:6000:18a5:b0:378:955f:d242 with SMTP id ffacd0b85a97d-378955fd30emr2248356f8f.12.1725889913898;
        Mon, 09 Sep 2024 06:51:53 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cf3ad6sm345344566b.148.2024.09.09.06.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 06:51:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Sep 2024 15:51:22 +0200
Subject: [PATCH 11/17] regulator: mtk-dvfsrc: Constify static data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-regulator-const-v1-11-8934704a5787@linaro.org>
References: <20240909-regulator-const-v1-0-8934704a5787@linaro.org>
In-Reply-To: <20240909-regulator-const-v1-0-8934704a5787@linaro.org>
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2139;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=zfZGJPZ+7n/u+R7h1aiFdsdkEzudbMyrWwt0mCMNVy8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3v1iyrWzON70Cq7VuXn8aYsCpNlvo+gCyF8zr
 /RcPqSw97WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt79YgAKCRDBN2bmhouD
 1yTND/9Kx2lZ3eCZZI46T755Vu5pa+AVNHwPIjhtgawTn9QLWZU4dx/nKarepxpIrJmJoAiNmef
 l9zUCIQ7tTRLh08J5eaODQJjDqqHS9iKGibJ1szkjME/jAk8tK2AuujylmN7rFF6OnjGZRy1hIX
 +MEkXzQnCsG3sWC79oLxmePYDAS9w79DyLnc+Y2VG416EUBy0sWemV843d/iP/ImkgfSQ8Z+rF0
 NqNl+VSGgnBY0WeVjDR5J/LugNaoWcKIOo9oL0JPMMyqLCIbAyXKnZNOKH1RgJohboAaKvvRWcj
 pvqFAWqbP+cDOVyuibuNXPW57C0G9xz0AdR5CEvDaxMCzVsog/Mp3P+IPNH0DsLfNaLxMcub5pO
 7uG43TuDc8R7IV6+0Kwgq6NsaOT+kBsDFBWodE0Kh2TzOv2uZ2COlbSO4fhWQ4xD+D4oOwxNtVa
 tkUbOckx0oRsGIXgLDv4DqJxJrzypzsLm12PnHbgKcTSps9z5zMpn193f6UCX6fJO9G6V5/GbFg
 sqWqNLxaDkdNgDua3Pl4lXKyL+90l4ssXiY9uwL788ThSvGGxE4eazeXMUmZ54lNbDvsDYJVzVj
 ozpmtPHcblf+kCN45ItBbo+Di94pYfYELDshUwux8NWiV61d+WNWYfAV21pMl+w6F26s8fo25Qh
 ymgij+ek/OQx8QQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_065155_957977_B6117430 
X-CRM114-Status: GOOD (  14.00  )
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

Driver does not modify static data with regulator description (struct
regulator_desc), so make it const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Have in mind that to compile this code, you need pending (off-tree)
patches, which I applied.
---
 drivers/regulator/mtk-dvfsrc-regulator.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/mtk-dvfsrc-regulator.c b/drivers/regulator/mtk-dvfsrc-regulator.c
index 9bf4163221f1..f5662c569464 100644
--- a/drivers/regulator/mtk-dvfsrc-regulator.c
+++ b/drivers/regulator/mtk-dvfsrc-regulator.c
@@ -19,7 +19,7 @@ enum dvfsrc_regulator_id {
 };
 
 struct dvfsrc_regulator_pdata {
-	struct regulator_desc *descs;
+	const struct regulator_desc *descs;
 	u32 size;
 };
 
@@ -107,7 +107,7 @@ static const unsigned int mt6873_voltages[] = {
 	725000,
 };
 
-static struct regulator_desc mt6873_regulators[] = {
+static const struct regulator_desc mt6873_regulators[] = {
 	MTK_DVFSRC_VREG("dvfsrc-vcore", VCORE, mt6873_voltages),
 	MTK_DVFSRC_VREG("dvfsrc-vscp", VSCP, mt6873_voltages),
 };
@@ -122,7 +122,7 @@ static const unsigned int mt8183_voltages[] = {
 	800000,
 };
 
-static struct regulator_desc mt8183_regulators[] = {
+static const struct regulator_desc mt8183_regulators[] = {
 	MTK_DVFSRC_VREG("dvfsrc-vcore", VCORE, mt8183_voltages),
 };
 
@@ -138,7 +138,7 @@ static const unsigned int mt8195_voltages[] = {
 	750000,
 };
 
-static struct regulator_desc mt8195_regulators[] = {
+static const struct regulator_desc mt8195_regulators[] = {
 	MTK_DVFSRC_VREG("dvfsrc-vcore", VCORE, mt8195_voltages),
 	MTK_DVFSRC_VREG("dvfsrc-vscp", VSCP, mt8195_voltages),
 };
@@ -159,7 +159,7 @@ static int dvfsrc_vcore_regulator_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	for (i = 0; i < pdata->size; i++) {
-		struct regulator_desc *vrdesc = &pdata->descs[i];
+		const struct regulator_desc *vrdesc = &pdata->descs[i];
 		struct regulator_dev *rdev;
 
 		rdev = devm_regulator_register(&pdev->dev, vrdesc, &config);

-- 
2.43.0


