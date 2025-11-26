Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DA8D1118A
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Nov 2025 16:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YXi5iMekNPozgcM2KO7yOuNDGNCDpMEgSaAIxNoOMS8=; b=VhrjhU1zGU5rcNCXqQP2eZjyyt
	M2basmcDU3siw/h4F8Bj3XKCPOEYW0lHHpyDFU/9LDYQCkJnjZV0px9/LK2g88tXBH5yvR6BUqIWg
	4xtgkUzohWROxZ9oDhMTMt7wYMusPAbl2x9lMoD88/QELC4Tbz3HrOdBPxcyZfrrqI+Ua6tZJZ+9R
	2y8YtsENbKGrgfDPebw4bPj2oSVF5Xwq8UGOqjDLIoDAtOoJXpS5C81UCH8g5MSFC7IZ0EsssRQgy
	e4cf0TkUxnbs5NVTCFwFJ9MCbGTBJc0GJX3qR9FTCVP+2x4qXtKc0va0iMYQOPhDY0fMOz3GR8WmK
	KP21XDUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIrS-0000000FLK2-3oZZ;
	Wed, 26 Nov 2025 16:59:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIrN-0000000FLFA-3Xfi
	for linux-mediatek@bombadil.infradead.org;
	Wed, 26 Nov 2025 16:59:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=YXi5iMekNPozgcM2KO7yOuNDGNCDpMEgSaAIxNoOMS8=; b=WKSTzncEplCpN7HSoRxwI9fgQw
	WnjGlt5iKT2/SyCHDWmIyOnWKwmh+agK5HWTtPSmb2+hROPCndwfyTuT300GsnD4OSJYVuMxhftUh
	62UHnfendOyr4JdvWvvdT7mbbtwfUaOTKVhAGX0uh+XLPe1w4ms+Z8vr3n7C+/IiWIJsl39IrPn1h
	0UahnG5ZXTLKWHzEFGEtSbK4iE2pyRJ5ZlaVOtO0Mib9L/s0/v4L0Z+/IjQ1t45aOAbuvjhZct5b2
	xDSVCHTkbUxuEObovvTRYtSG+S6IGXvLn015jkc8Cdb/q2PeAqWBS9Y07rinTzerMJb42VO8Bk0ER
	2GwB61Kg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHzj-00000008S4X-4AUw
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Nov 2025 16:03:54 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQBNXrl1849221
	for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 16:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YXi5iMekNPozgcM2KO7yOuNDGNCDpMEgSaAIxNoOMS8=; b=bJtnp3o5V63hX1tu
	jYvWzgAiqf9H5wPFkebRqHUZhN5rcKodQfnumZqeRjeC77uV4oPw1GjrlLvHS6dn
	7W4ZiVWQ79r50+0pXDWqPA9ao0ZRGxYo5uwixoMiVLCKkvMXPtRk5Yq29VIpy9s/
	4rwAj3JZbNow8hAkTqn72qnLWAzAfZDQAE1XTLRSUGr8oKMUwugjYQjP1cWMygVd
	Bfe1PENeOnmrKjQXVfI0bZ2nE9EmykSStASroZj36N6HLMbCWtTr0FxnQfRC9jcV
	FfWgL9Ezqm3CeGTpGztvw4b3O0FgVoYL6+i02b6qLEWNRjMl7liCs040DQARP7U5
	0M/7Ug==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0msrxeg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 16:59:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed6ff3de05so601801cf.3
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 08:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764176350; x=1764781150; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YXi5iMekNPozgcM2KO7yOuNDGNCDpMEgSaAIxNoOMS8=;
        b=UQffASj0FbjqSx3sd7EOddnWkOk9Fi9lgQJkhZOXJ0Q2xSwEgnjfgg33RSGqeS8tN6
         SDcr5qnyfb7e4TEZlmx8BVQKTEsIfV27KGhzju0mFgA7y02BzZ4FD+kfnUmpHahrfKg0
         wJBycnZFRnd61TBN0XyiHSYugK+JNR1URd7z/Tg7Rmi7HbvtdiO7jUYRKvkFP8LBUz8y
         d83IthGvBL+luhyT0Zpp/MnzZMxD4gFBj4zmpbpkAdOpsqJUuRAqGBhfj/0dTTnVkPNd
         y7sC9/i4IDrHxvnqV9RinedFN0U5VErCpmk8lcYieOilmsR2dyEItkTxjddjRwxAf1Ru
         I77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764176350; x=1764781150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YXi5iMekNPozgcM2KO7yOuNDGNCDpMEgSaAIxNoOMS8=;
        b=qIUcrwRIGs5DJ3GH4lahByPF5vJA5gKbmc+YH66SH1ON3NmsZsugqYR2pEIy/s/4+A
         CBuE+TyY5bWnCPZNpHQoTtAyj1QWXxBtwL8c2SVOyQ5PYN1h/r6eIEkqDbGCSPr6UhE3
         AAuZ+9/gvOU4/0VKsJI4bUCSPT30w8yX4O4XKgyZ/QRWsfHTbSwPjwFR2hkp7RvrLbhA
         ojxsp2FaWG8LUk7R9EF+pzYhIujVtSmETQLQFV5Dh/K6KqWbW/ZmdatbpgU/rRXpnGlP
         MAhJQnDU6A4GGK0vS4We/sy0JMs9sNojwfpWnt+3mfGV2umv/B85V1ot3ComNCQa3dLg
         rCHA==
X-Forwarded-Encrypted: i=1; AJvYcCXiPLDixAKBRHSV8mAVB/rzd+N4F8HDnMxE/VBNnBi7fYF5GZAjxJ47uNvB16hRKsnHWhijc8udbOy6+dPHrg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0ShQeU6MA5J1jmDBJpwm9g9IPAMWW5+FQHV0uIjYH6ZkTdnwj
	EONCG3FYVSBOwWO8LgQ19Yx3p65RZgpQihVUFNS4XdhlLJ377mFKsAcz8WJsE9N5ysQYS03JHrN
	E9yTZq1rEFocA9FLs5HlwKORIOne+sc6kWo724iOQMMEGzKDls1bX3FbXu4BMbxc9t/XsAKd0ee
	c=
X-Gm-Gg: ASbGnctwO3Qm8fajcKLQwCo7DJWgjczd2nFA6kn+5km74AvQUffMQEX28ytiivGURbq
	IQcpoo8FCL4mERPnOCa775wJOhvBQ9n9pI/lh4sYezZ35LykzxQvw8GVTCST4JlQSshxOw++Bpg
	E7b1960et1HMwjo1u+PQQ0wrqOdA9WOz5Xr45kdI7hKPe7yUf7jZsNHqpgWlyqN8d/CSco6psGe
	M6zTcbI/aGxDHV7o++HzK9faZ4LRMNutQC+fL1iGiv8H0AzAx+rkRQUUHXbzFrMcLcSZ5edGIzd
	PVa0ZbBvDDzZ5PPtjtb8zGqhEmFGDUlO320lLoBNcn2nX9HXgF4s4qgY5bNe3A3zDWekkQXEM4g
	6mJuP+YcwI8X5R/6HYIHFFXh+RZZkaluIKQ==
X-Received: by 2002:a05:622a:1650:b0:4ec:eec7:4850 with SMTP id d75a77b69052e-4efbdad0501mr93971391cf.44.1764176349914;
        Wed, 26 Nov 2025 08:59:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErBnHpfn744afixM3E2g1It17xfT+FfmSgDWhqDDmm7wcZnjLFgMoXR5FHu4Z0fr4SV0TEWQ==
X-Received: by 2002:a05:622a:1650:b0:4ec:eec7:4850 with SMTP id d75a77b69052e-4efbdad0501mr93971011cf.44.1764176349506;
        Wed, 26 Nov 2025 08:59:09 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3a81sm42398811f8f.26.2025.11.26.08.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:59:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 17:58:45 +0100
Subject: [PATCH 2/8] regulator: bd71815: Constify pointers to
 'regulator_desc' wrap struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v1-2-eeec378144d4@oss.qualcomm.com>
References: <20251126-container-of-const-regulator-v1-0-eeec378144d4@oss.qualcomm.com>
In-Reply-To: <20251126-container-of-const-regulator-v1-0-eeec378144d4@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Samuel Kayode <samkay014@gmail.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1606;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=VUNpL3jXdgc3MZUwnQFvZgDT2ptHwcLxGJcoxf3oJiI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzHSY6WydZE9KNyD+CnPH7zWuDEoWof3fnfdW
 iIbYj9M3/aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaScx0gAKCRDBN2bmhouD
 17Q7D/49mEg2t66KhjK0643fF0ogQe7s2j4vBij03DGs/YvbwTJpSNL5Lyi0ASig52sbv+hefZ7
 krUNF8gash9QMCaiqpRfStyJ1eN42Hb7AIjy6q89cEWlMHJJRQZEI7aEraOHiAScoELINAe4vZ9
 7sWq+IZjsKL7VeGHBxsugUnornYakD7qwV4BWySvwhDIUehdd6ySorDcfRjrecnVnLYoKlSk8ar
 7V57tmOXumHlfYAOUH+naOMGHt96AYNe1UImqYgaTLQWPV5ZMKYZQFC/Gnl9JXX+N+56qwBdkKI
 8SRJL50VPmtiDRovpCZgirizdrQGjNJpUITVAN4rHcle9zIaZXKfZpKyeeZ90p5Mw97+TkH30eO
 CsYAXBg7iK/DtVkziBokGv/ltrakEvyhc3M4+P6xDdm7TfKEL0ZVEbTsGMeoY3cI9oKaVh57QYx
 s7U6r+p708lLqKmCLztNT4XmHQgAJUVgby8vO1yql0TXf/9+2RXqJXp0Un6BqP7pTORGMPXv5zw
 +wbkt2YXS5SUPKUGhcmr8ACx+Oob1V7rUmG6Hv/EFicchNuU79RyN8HMAIrNa7aoG/eIcWufNIq
 lotaeJb2ys+gGpA0aAsd266GQuRSuy6OwgOOZqA/qM1kfKsqEwBljv0LYus4/n/Ep38XFB4ILze
 /Opxx/NrKZtVu4A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: u-mrDHwG-Jn0iaSUiamROVLWGHbPsdC_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEzOCBTYWx0ZWRfX4b8f52vVH9uU
 rAEgfnhz38/6raAGllrmU3TtoQmYNTf34S6+jXN2IYBRq23y1XudN1wiFAg3p5n5AkUd039Br75
 ncHO9n3Y9BznbYkrP7LitePMhfD7bky6envwSIF0ztIhFREgnqHON60+LwawFwmvBE96e/wCgf+
 eFEqjatfUuHI/E924V9bxZNnZF37JH2skj/k8EcUN8dq3E156uhix1SDiGAhj7ZkFvOYhPrn4Q+
 NXPbL0w4VAQSLQYyU8CB/IyUGxxaj1qaFriI5GauqzzhWrlsGiYta59jKimZqV2OmlhGwR0m5FB
 l2YzQ0wZ47lXNYngEiPLAfgfvmOy4pG5PD6X+ELFfIUmeWBtceS5Zpyhy2atggKo/VtvkK/mCNL
 ytYq295oufT8YT77caM5smdEC3QCAA==
X-Authority-Analysis: v=2.4 cv=N5Qk1m9B c=1 sm=1 tr=0 ts=692731de cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9MRJ1adic_HRPEocbcUA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: u-mrDHwG-Jn0iaSUiamROVLWGHbPsdC_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 clxscore=1011 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_160352_578850_DEB462C8 
X-CRM114-Status: GOOD (  14.71  )
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

Pointer to 'struct regulator_desc' is a pointer to const and the
wrapping structure (container) is not being modified, thus entire syntax
can be replaced to preferred and safer container_of_const().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/regulator/bd71815-regulator.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/bd71815-regulator.c b/drivers/regulator/bd71815-regulator.c
index 79fbb45297f6..8da57a7bb2f1 100644
--- a/drivers/regulator/bd71815-regulator.c
+++ b/drivers/regulator/bd71815-regulator.c
@@ -173,9 +173,9 @@ static int set_hw_dvs_levels(struct device_node *np,
 			     const struct regulator_desc *desc,
 			     struct regulator_config *cfg)
 {
-	struct bd71815_regulator *data;
+	const struct bd71815_regulator *data;
 
-	data = container_of(desc, struct bd71815_regulator, desc);
+	data = container_of_const(desc, struct bd71815_regulator, desc);
 	return rohm_regulator_set_dvs_levels(data->dvs, np, desc, cfg->regmap);
 }
 
@@ -195,10 +195,10 @@ static int buck12_set_hw_dvs_levels(struct device_node *np,
 				    const struct regulator_desc *desc,
 				    struct regulator_config *cfg)
 {
-	struct bd71815_regulator *data;
+	const struct bd71815_regulator *data;
 	int ret = 0, val;
 
-	data = container_of(desc, struct bd71815_regulator, desc);
+	data = container_of_const(desc, struct bd71815_regulator, desc);
 
 	if (of_property_present(np, "rohm,dvs-run-voltage") ||
 	    of_property_present(np, "rohm,dvs-suspend-voltage") ||

-- 
2.48.1


