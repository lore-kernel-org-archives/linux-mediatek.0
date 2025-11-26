Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673BFD1118A
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Nov 2025 17:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YXi5iMekNPozgcM2KO7yOuNDGNCDpMEgSaAIxNoOMS8=; b=4mbi+PrHcHpVhXPpppLim8JucW
	xtumbqHMC1XwRu9xY56SDFVii6SWCzMsJJ05vHfKPcSe0VMFMdzID5Ypoutd73MA4NQo5zJuSYAZw
	jOGADrO8czAQ62hK5JSf3xWAI7J+CykHH8ZBJcNQTRGiR0Ba1/9KXOweiW02sOa9WT6j+H52LyKHj
	IfyYEWrerKiHJjSTl7OXAxjUBaHIkpJb08wuPM/SW02kPFyOEnI0wWyyN+foAprCRQbrfpcaaJb5+
	0W4rgX2B21C8+9SGrNlzfsoqROtgqIImylDYfdWrz+aqdtOlUOCQyN7hlUDHVV+dS4lieRlhQKz9N
	xuaVHv4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJVm-0000000FRCN-1zbc;
	Wed, 26 Nov 2025 17:41:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJVA-0000000FQp9-0irs
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Nov 2025 17:40:46 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQG1r4n1234787
	for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 17:40:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YXi5iMekNPozgcM2KO7yOuNDGNCDpMEgSaAIxNoOMS8=; b=YqVj+Xxp9YY2tixt
	eenl7IDMEmeVj2aENO6JE6BD5dviSs3iq5LlydV+9qIhor8taBRBI9aq61US8BlS
	xiwHrwUNjI+AQY90WiDZ7gDZOxRO1zRCpf3ZQY7IsYUBcVCaaJDaLqOGAI/HxNw4
	bXxSQvdPrMZwqaJPKLv4Bz/05CF22VxqsRF7O3rkaE/XyarKZrcWO0wqaWiT5Kjx
	2Gn8gBGgippfcGAxPiCP38wekbqdxtWUKChyiCvL+2Xdf/O3tJSlf8z0bW+41uM6
	sEJIC0veB5XQLmVkD+dBouvwB/AmpWH+2IdVeNYsUS1sDEboIjOlIE3ZX9i3Yfmc
	fb/Vrg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anwd41rxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 17:40:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b234bae2a7so1841594485a.3
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 09:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764178823; x=1764783623; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YXi5iMekNPozgcM2KO7yOuNDGNCDpMEgSaAIxNoOMS8=;
        b=Bq3R8AUNBMnmbZWXvbz7Qv1Ab+anMOPmdby6PBrY+1qjeGNazONjiJYjtSP04q9hC/
         +PiB4orSlVYEfpD8iD95CVxE6eFwcW49YwCR1jpQcWe32aarJUpMCIB9kdoZZVSuwJJc
         gsaOrQGOGmDNfybsfcbThr2ARRQzw7meb0VnwEnBn2j2XNAKgvTQC8u+s0E9EO/SQPYg
         81gk/dVPj7QOsnPrsQ8XQfAbbteAnzBOmd5e0o0NRhMtlAEPR4dnW8O/dnlMEaNe/7nn
         lZX7xDjNmvhN1TMt3ldCWJjx2BaINPGcXcjAeMxrBpFsNAvziNsAvyrHK3UdcDOomviF
         s5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764178823; x=1764783623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YXi5iMekNPozgcM2KO7yOuNDGNCDpMEgSaAIxNoOMS8=;
        b=Skm6X/OxQeUTwT7qpopZK37HM6i+a4eMomhsWu8S6IpB/y/4f0ZzMDbY9rDQYNiYc+
         qZ8IYYDlh+oymtAirXpBJlXkRRwdwR6dTY3836cVeoJF3jOaXeEtd/dpQd+WleqRkxhu
         iNtLVXPeI7uBdR/SiOlYenZv4g+eNjrMZ2b3S6EhGbgWoGovVN8G9LqPczo2GiHCqJWp
         0Tx0hGSnBKclfbe5YhZbjUQbBEJr45ePOsIQC+KluZjXVSKTeS9lCWsxeObD+dwXBt4Y
         06h+xTlmTEolWVt8bjwnF1Z3QzvQ9uO8ljYc4A1aPfNSwdfyCyEXMuqlV79akGJ95mIg
         t3GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD3e3y9ofsMjPHKZ36pkS8fFHrNBUgw5xwpOMNCLvdWIC3VZvuR3muJ0CCRUQxmNOJoP/Qybi+eXDDenDyXg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwsMjquQSCA9+ChFKRmBQz0XlRC9H0/t+/N2f02mmEkXyDT0NaT
	1XQEjESXmNMBC4uyjqIWt3AssvwSpRQImF7f/S5k0BXiphtG0ZCtFgZVCkXrRVabPu+He4EYurg
	aK7lV1oaO5+ylIgbLIzYVv+Upp2QWliJfvf2WZXsBzPSVXdzUfhfeKradrGoSFxGVDYJl4AJeNN
	U=
X-Gm-Gg: ASbGncvIY4nADjBElyl0ppcf97Bji/u4gmh2JEOYCPSc0XAG2iWEfuQ/ZU2l/4vs1HH
	2RenebFA/zcFd1XQ1NX4MwJL22dp11zLWW7hSJRtI+H12RpJu/SxHNE6uTcqYJB32eigHg14Z+A
	bnUlLkCIkAX1T0R6JHGxnqvwQ6wreAY4KodYPPw633hA0sQYoCZUZ8+VEiRfWDCpF3KZl5lJgFK
	MtoZBtyHr+AYG+Td72AJ1yzUyr/Zj7opYhYUeSH+iox4Dwn5LrdF8FQ0pgazhVIfE4jLFuJmOeR
	fjV5LrTASnPTQKs07+iY08X3/YmomW0ERoU27jlyZXVR2lZ+Kv//AhxE05jflEYTUy+ICHhrxVh
	aH4f9DOG8tXtadECPFc+GAaur5adCSzr3GA==
X-Received: by 2002:a05:620a:700b:b0:8b2:db27:4262 with SMTP id af79cd13be357-8b33d469984mr2447593485a.74.1764178822705;
        Wed, 26 Nov 2025 09:40:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFe3tkVK1tsFBQiS4G+6Zjm6S22v96S5ZcYKIvedvhh8WC93a4qg7Aoeuo37ULuK17/ykM07Q==
X-Received: by 2002:a05:620a:700b:b0:8b2:db27:4262 with SMTP id af79cd13be357-8b33d469984mr2447590085a.74.1764178822232;
        Wed, 26 Nov 2025 09:40:22 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8e54sm43226430f8f.40.2025.11.26.09.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 09:40:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 18:40:06 +0100
Subject: [PATCH v2 2/8] regulator: bd71815: Constify pointers to
 'regulator_desc' wrap struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v2-2-7ad3408d6f29@oss.qualcomm.com>
References: <20251126-container-of-const-regulator-v2-0-7ad3408d6f29@oss.qualcomm.com>
In-Reply-To: <20251126-container-of-const-regulator-v2-0-7ad3408d6f29@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzt7AGT6LRAY8YfTFg7COgV+NHDwYgj6p9TWN
 VpN1PDcNE6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSc7ewAKCRDBN2bmhouD
 1yreD/wORlUqhLlB45GKp/eaG6b75/1Gp+R/YcNxqWEg2vaslfLtaam7C2VNfj1bijUX30oHGsV
 cvb5KCyoED+dHbJeunzFQLHUyRKJYQKvNgi/1i19ttMSWbnODpIM+eKNEtjS5h98uq+/g8Ja5o2
 ihes407gdCdW5M8NKknn9xPb0j43QQtYq5MpghUXAnmY8l4p+ly2V3dwvHLbbLDzqqMHZz0g8R2
 60TZalrhocpwjgjBxNZDaFk/3PWEmgiUmkTBQ4PuV362d0Sq4qU+L87zXCc2PSpCZydbPSVgc4P
 CkTBsAup4SXI+FQSDzJleQfgwwbM1EBTUkRTlv7ruB9rjksAVpIBU5K4Z/kFd/lg4uuq34MbFqF
 OwYEZiJZHnGihTn0SgEOgp/EheBr/eGTcVksVvUS1Ko5hh14gFhIUIy16T9wSyoc7XYHKgCr7Tw
 xgyea8gx9hwFo2A8z3Z/Mw+zJRULbVeILjFQw2Twx36z3MuKWXAEF0JDDDRX8cpWZswQ8rDKLOi
 u89KNH5rZV/R20O8aDfZIB0Q6gbntWdzlE19d2hvEhRUXnRED36YaYfT70ccbfKrJshM9woCi3u
 ovO2Tvn/y8dDRXNNTuFizGrvIC6ay4E8Tvd2E/z0VaNerk+CPu/M4bc+devSFo8tWMehxBBF371
 7CuJNQBLi/UUsZQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: mDVSNmZX7wQv8sLlEx8FjVuGktfCSbZE
X-Authority-Analysis: v=2.4 cv=feqgCkQF c=1 sm=1 tr=0 ts=69273b87 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9MRJ1adic_HRPEocbcUA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: mDVSNmZX7wQv8sLlEx8FjVuGktfCSbZE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0NCBTYWx0ZWRfX4eZ8JEBHeICK
 YOKlom/gKWY8M3VYGwbEmLujnLNgtnx0WCCmZ2/zDDFturVKqQPiupCGe0izrmrWEHlJ1xbzI3c
 T0i6Y8wZwNx/8TyZLgdA4mGjBwLygzYcqZ27UPxGvPAhC4cVgx19ohNx0DhZKX0QWB0Ul89J8UW
 0LY+IoPt7Pcniuuy/Ai+P4wLMBZuEz4cdZrpFjrX8qGWBg8d2Rh7fgQD22yoD5OXPxWkh3L6rkJ
 sqg9e7OYsORl5ZdJ6KqpNuDSKvtyHirNV+W98QEi62WgVnr6HQZeTM4IVDuj6/k4oYR+XHBuyeB
 Mz6WFgG+G9cYNpx6XqrcQhKBzL3Kdw5Ru58KKW+JisHzOoTPWr7x9zj/LD32mlRZFOXWP16UWYk
 fmzmzFfPrL9aTlmGmXQ/gbdvmd54iQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_094024_217946_D3FD496F 
X-CRM114-Status: GOOD (  15.18  )
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


