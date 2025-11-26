Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DA8D1118B
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Nov 2025 16:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eikYGZPX6lrV1IJPXaurHo/qZqzuHDqLnrPvPuI5kdM=; b=afzL7d04NjHYdg2xOr7mdIgCNn
	C5O0gELeMN/ekujRXv35jD/P3Pqu8LAvc4tQ1C81V045ImSfUiYpEmYCWZFvTdW7ad2dOIvvDZ0sq
	eVz8FuoqZJ6TufFx3GXjBKzhOstC2MHbZCRqUzX4ZOCI0qA7FH45sd+N32N5bn7HlKzGphlRPPfXW
	6FWoUE1zpC//RYagbLj6GHyA1dxQL7ufw+pxoGx85o9evcOYss/rQrQc4FexrAD9gpb6tJrbMKQ0s
	NdFrJ+dhyQ+xv29uV/PhYLihql8cwE3fK9i1jF+2vwOhtv2j2z+7Xdluk2sWQQkZuq8UycRXRcM5Q
	XPETXZwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIrW-0000000FLNg-3uG1;
	Wed, 26 Nov 2025 16:59:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIrP-0000000FLH3-2CZU
	for linux-mediatek@bombadil.infradead.org;
	Wed, 26 Nov 2025 16:59:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=eikYGZPX6lrV1IJPXaurHo/qZqzuHDqLnrPvPuI5kdM=; b=lF7rNRXs94jHMeGbnqAKdgaBfj
	FUvxWN5VKESdW3jjYKOfuEob4JTWfF6FRQXknyyHSPCDdrdRKrczU5v9BcuPpB1oIM3QbJ+vJCYhX
	0iX1YBwgEq1TJW9JLZuzfjmgMC2f5UBeTegj8m3bTPGA4Ydrh3jnhKJciEwUnvdfliWqEmcXiHvtj
	OWX8VcyCmbUVKadOMUw8bnhlDZk9X1D8G4haFmT0j8p9FSwgWXUbG+RsiZqy29dnXhDVlVT5WtOtw
	j5BGE5DzguyhFGEprwZyXfma3mZP/YRPT9BXEhvMgXIUjCR+rpI7SaO3JKAh+e28WTvFuEtfVPznZ
	sVGaaVwA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHzl-00000008S4y-0roV
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Nov 2025 16:03:55 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQAskc01700296
	for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 16:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eikYGZPX6lrV1IJPXaurHo/qZqzuHDqLnrPvPuI5kdM=; b=UGSUQDDhRhXxvsL/
	CFeaQtpIxFRcb4GXL/po5P2L8zkbuUyQNSzxKCwc4ZfjVBEVNsvKU5uXzXKoh53e
	qGlMr2qxLNChXMefg9OJvHPGxQ6L5gCR1nhov6+mwUvqKutk5EScifYCDQLkMJ2a
	6CWBG63ubTGAfVnFi6OtMhvwgh/GeYF/ulAd+m5g82QWYaDEXtC9C3EjgizOUBD6
	8x5P0nRiuekBQljpvlTgIYa48ce4AYBgBv3L1Fv1vZGfUcttnfQ28IMKAG8Xoh2u
	wuNz7FkGpiJ+tBUgTxZ86kGoSXa4TBka5Xg5g9OZ9m3viNMYjr6syVjxGkIss6ke
	ij73Rg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap07a0yts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 16:59:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8804b991976so162964926d6.2
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 08:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764176353; x=1764781153; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eikYGZPX6lrV1IJPXaurHo/qZqzuHDqLnrPvPuI5kdM=;
        b=YB2iNCRmLQVNuw7TVaLvXhaP1Y15MiwTtTX51/XRrycokWbQWN3/aVqYB9HydTPWOM
         288gPYBIICKatS5m2Kc+M0OHZBhg4dtfpAQCaGfdvYq0XJF1PjGHHY+k2q1Q8IUa3aVw
         t/ML1CF/idedZy64ZMqTTeQ9LZJ1mXyBme5XPe4NgZEwwpAR5pyd7bqEsah+JVY0nlm8
         ISdl5ArKy5qBqqbg+QU4dlQBuOkVvouolwEMdmotTRXWGVwiDPfK1ujQZG+HYy3oNO9z
         curEqyedtv1uhB0hysH59Pt2YyPg0k/PA6WuHZExguS+rw6GFc/EwQ3o4SAHCH+fApJQ
         VBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764176353; x=1764781153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eikYGZPX6lrV1IJPXaurHo/qZqzuHDqLnrPvPuI5kdM=;
        b=tRqgWC0jevbKRejHIff3F7Ixn/7p18++u4SfDVy2PzKmVU+aN2sO4UlRudnYTmLPfc
         emRJJhnqvMczk1zxBLDF6H449T+tnCDguK2pz+ROL1WJps7Gpp+EdS+8uPPLp3OUK8tD
         UAaiMmBu+N7y60oKdN5ef5Bsb22I4hFO9P1+MILaDmvs28uqwFHR/LDiscW1J7rbvKno
         dDm9gadd/BmOlMQrTPiPCA9tWQ7QagsM+CZeRHKLWI/tyEadYwRCHxd5Z74pE/ldmbXY
         EajARJF2Nthsof+7TSsKRFValg6PWdDeNHNl3KcoWVsEcYN2tTmv2Mqx/ad3fM7dpDcX
         aMtg==
X-Forwarded-Encrypted: i=1; AJvYcCVO5WTy+hcAptDzBwqNzrbhpuVuSuCfjfVpYusyMCp/kYIxijMz9AVX41cWvHZCdRHir1LJr92RgjJO/wlweg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAtwj9ZItBlFSGMGEW5hKgKNtONGgnsDJmz8CGJyBZ8lNlanT/
	bSbdDfzAdEUKsRJXcbpk6+bLAE49h3cJH6rdgAzaAzLcVqDIPk/HI2akK6lS8laNKyWYftAf4JH
	+bjCY4dVaJ7fhd92PKfo+eXyOPsPoqnyYJNwNEDlprY3dAgJ3seEZySV/JidaaGyZKCuRJrujys
	g=
X-Gm-Gg: ASbGnctlMSR+2Q9hymSLLto/XnlUd7jIag+zd3qmSbZPkLShx4xdhXe23eSXbAWI3si
	LyWd9la2GQ4VyD0i37WYWGmNo8jrCrXHYZL6WKeVHlzApLZke+u4MbqW7Z3JjxWjRJsF2bWsTvL
	LZGfWzWIeWye0o84ntfVZ4Z79v/IRw0dof2M5YtnXEyR/EmSg0rsd0Jsoj9C9M3NRAvdub4dVPj
	kAIIa5ejW3bhXjqjoMp97aRlgFTlbtS7i/lp5yX3PH05OSqE3rtrH2ax/ESKAxUUartc3eefScg
	2uOE4fMAIuAZD2mlFr5wSq9KnkmiGagkF0DujpD5uPazIoiCnol6cPlQ/bMwN99t0bLBD6bAWPu
	xl78Ao/vYHWcVgc6D9FGX8rxk6o8FKuFUVQ==
X-Received: by 2002:a05:622a:1a22:b0:4ee:d9a:8877 with SMTP id d75a77b69052e-4ee5894f754mr301719921cf.72.1764176352842;
        Wed, 26 Nov 2025 08:59:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFFNJfMA5YGMK2a1B1clwXb0TeWG0h5ObbcP6jqY2pgY5UGsCXOEnBRMkFRRZT8Gb+jB2+8g==
X-Received: by 2002:a05:622a:1a22:b0:4ee:d9a:8877 with SMTP id d75a77b69052e-4ee5894f754mr301719411cf.72.1764176352359;
        Wed, 26 Nov 2025 08:59:12 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3a81sm42398811f8f.26.2025.11.26.08.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:59:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 17:58:47 +0100
Subject: [PATCH 4/8] regulator: bd718x7: Constify pointers to
 'regulator_desc' wrap struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v1-4-eeec378144d4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1101;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hS8RVWi3XaF10PpDUVAlrbmypT/xVq1XUUFF7etuthE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzHUTLtRuGEhkFoXFkaki8FZ9a2VF5tTfLOBZ
 RYcGLx2w4eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaScx1AAKCRDBN2bmhouD
 17Q3EACROfWHE+jjlQlJ5WoREWxGSbBZfoYvYbjXZLbkFP37lg1HeD5Vkc+nHsWHcb7p2vBadA8
 tmuad3RDqYNM8in/+QBkmYtWM2xcSB7xBICZ6QP9j/2bQUOFohJ8K1b4eerzzdWoeIB3mLddLA9
 p9wMxec2iqA7SwUTH9QLRh8aRYcSwIldtsJDUqBEHbtta1O9P0cmpl9kSYhEZKJmyIL3B3HHMZR
 ytWr6UzkcmmoNuQJkPyyG0qx+6hCCu6oK7o1rrwD72oekhi6B7Mb8iGwsXXLy0YVQQBYdITHijD
 d0Hv29u5Sf6ATxURSfth81Lfx3auxgN5NuHRv3t3lTMTU7D7h9FuleMfHGvMiVUOYdHVZJ1rel8
 becxFcHQ2Pzp/sYccUtffpem+pLMHXwdi5W9rF2WT/pjdPlR2CjAl++bsAm8yRIN7lzPwaW6LM8
 0uDdOq+GF+L/vHaLTL0S+WgV5Lzy8cf72u0lic1NGKhk1uoMSGcQ/WtgONpBotBfZULKlYdhE6k
 LG2yrmz/3vYyTUBR39ZgOKdhRceXWOKlVAw/hIQ/RU/lNRkPbBGyXvUgYE31B46QLJBLzpEXrVG
 SkYC1a5w0HpZnJmoMzVcnwfEklJynTM/RLyZHQcAGA1/RUFkCFK9O7WZXgrxgNjG5UvUmRad9wZ
 y944thVw+3wXbyg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=ZZEQ98VA c=1 sm=1 tr=0 ts=692731e1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9MRJ1adic_HRPEocbcUA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: NKdHnnNnh31VJle8CHgmoc60MDpwuLln
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEzOCBTYWx0ZWRfX6d67eUPABu4G
 bGf9zROu1OVZvlZMudcvl3EV7xPhJ3MrY8mLWzlppXIMutkCFm/0QLNmqfR29GzRoiP9aUO/jc8
 o9qgFYKVu9JLoW5J2hCuR9KrpNWG8yTSExlivPRqHge5vDRAOEwwhfNebmTNJLeQBi1AZxzqfiR
 lsyQCJJxpJF6zbctH6pBVnYRQldZlcBv1LiEassZSruwt25HV7mOFqvCkWJ07p0Z6MBZel9bYxp
 Of4K+ZPNu8nE2+X4AlN4VhzerntiDQJsleTmtklgKGfUQVAHQIBfrxZUSz8rF2OMngnqy07CpzX
 T6/FUVgbJMKqG2lg89za7OqXlixdyzQGWtakjH1eA9eikBS/264lcxwYC7+BiRVYFfX6dJhPtC6
 Wkr8eu4IwD5mOOEJ+/MdYAD05qcyVg==
X-Proofpoint-GUID: NKdHnnNnh31VJle8CHgmoc60MDpwuLln
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_160353_649478_8F9BCEE3 
X-CRM114-Status: GOOD (  15.52  )
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
 drivers/regulator/bd718x7-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/bd718x7-regulator.c b/drivers/regulator/bd718x7-regulator.c
index ea9c4058ee6a..1b5997c8482e 100644
--- a/drivers/regulator/bd718x7-regulator.c
+++ b/drivers/regulator/bd718x7-regulator.c
@@ -698,9 +698,9 @@ static int buck_set_hw_dvs_levels(struct device_node *np,
 			    const struct regulator_desc *desc,
 			    struct regulator_config *cfg)
 {
-	struct bd718xx_regulator_data *data;
+	const struct bd718xx_regulator_data *data;
 
-	data = container_of(desc, struct bd718xx_regulator_data, desc);
+	data = container_of_const(desc, struct bd718xx_regulator_data, desc);
 
 	return rohm_regulator_set_dvs_levels(&data->dvs, np, desc, cfg->regmap);
 }

-- 
2.48.1


