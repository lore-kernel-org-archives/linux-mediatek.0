Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4967BD1118C
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Nov 2025 17:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eikYGZPX6lrV1IJPXaurHo/qZqzuHDqLnrPvPuI5kdM=; b=vurt8C0ZroMcG14GCo4qWJ00iJ
	Ka0KSvKshOUOW9u5C+wseU4n6sXZobmNg1wrLdaG86ZEHXbnbdl3qinh9ZsFJjWm9Q8cV7SiMUZ+h
	SMjNncOUv+uzR6LtYrefo+5YlqDxGqe9B+IuYTX/8NUcFlP55zZkcwPNyUcGxfCnoOfpz3A21HtxH
	q8nLyV3gc0h1ZBWgR6RL5cBue0tLT45ffk5nm0skCkS+YzY92S9PN/RnBYUBy52yeWOJXdSBYtNxP
	VBWs9OH1+OIB0TfOLzlzCK7nmDbrow8gE7vZ2QIs7AV1FX8cmK7mw2RhBxpAI0ATNeZIX3o/Ys4dq
	Xmc6R+EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJVo-0000000FRFV-0gc7;
	Wed, 26 Nov 2025 17:41:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJVD-0000000FQpt-1M2z
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Nov 2025 17:40:47 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ9F81Q4049007
	for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 17:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eikYGZPX6lrV1IJPXaurHo/qZqzuHDqLnrPvPuI5kdM=; b=Ee8TkNAeaCYxJvR7
	lYj1pXGUbOv1ZioxdpU4PbsiUvJKz6+krctW4P9wtMVAaXktpi12jqYfhfAqpaRn
	3aO+9nS1uAS2jbej8HMZ2z03oc3ux04JYY17n2PJM0rxXpobRbe1JlQezjc1qbGr
	SNS95Zmk/sFlw94g/jNOcsfiodqdCNXvoq77llIjDhTGjN95MGIeno1Q/LK8+emq
	8NIb/V9LFDMoGHxREC+x5Y6EqPnoPVu+SZGutRkA88nyNURY9L2alyO9UZO9i5Fs
	rtU0aZbSyTEFvx/gByqCNh3PjNPnaOOCl6h/H0b+RY5IwvaqHvmCCGHrCmWKtOOV
	ySUDiA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anp2njue7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 17:40:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b225760181so845866385a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 09:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764178826; x=1764783626; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eikYGZPX6lrV1IJPXaurHo/qZqzuHDqLnrPvPuI5kdM=;
        b=g1o4gYsHUrAPRGffKkMztorhdmenLPGk4KFkNkeDdNHqswHO4Wbf0x2ijH0y/Kf2G2
         9L1IGINAQQ5/M4R5ankrw9FJy46cGwgXqBPFNbWzic6RX0f+Fla4eF9zO5WRAGN7fO/S
         AGcmn0wmdFT7Nu3or3AxDK8u0OUetGZslwyYQOiVOPh10P8jVXB1nWvY3lwnsCZsxDJ2
         HTAP/rvOLEdsEyWUBEtSchtNa85/R361QPtLpR3FVtF1FLSfy/tpxQGBVTRqwnffe9ej
         Mow21j9AvxESmCTGdFyUlqtpXL/av61bz93VdSxy3R8mMaXiEJEwwxeDTrIcgX5jicmK
         SHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764178826; x=1764783626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eikYGZPX6lrV1IJPXaurHo/qZqzuHDqLnrPvPuI5kdM=;
        b=WNwUijERCnBp2Nw0HHGqdm99+HKtiXBUHBDsVEl9R8zlgrV2zIFjAwM3r28I/h0zcP
         iH1/gFkZssRHbYbxmYhgJAhw8vYKE9qoeCIjIZe39Q2op/l9iH5jHHUe8vW6K4ZETs1l
         1gMG7Gl3LwpQTjdgk7FbY7ot5yM7cloafLqCQ35OUxQZvBhWF9Dqane5EIK4wdaqnmWg
         6pMYEER6xQa8DlZxNj/dENQLCAj355ifRTN1TOwjBnJCtjIUMonyhye7jW9pfv39ibw7
         jSalKBVUMdwL5L2Pl5R/D0TIa//tMSBvhaZqf7NX02cU1hRipOzYx4Hzt+4smQtQlEp9
         vJsg==
X-Forwarded-Encrypted: i=1; AJvYcCVFUhK/xtQymYkxHNc2ReZk7KkUpTDjct+pfmoIyegmYwYKlbDlZi6xfnDLnk5/O8UHTfgqwHYM/7YXkdM2dA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyEl44XSmptOoTmRdD4Ir81+hLYz6yg/gYS0FML7WJRJKN6BjbF
	VwaNhoUF4vEx3zu8g/yFzSD6vnsHPevNurhJUSJhKfrnDOBl0GjF1gJesMz7DUgEo3E8djCgcF7
	TPeFKi6qXiuuwTDfouzFLvc4tUFHg3OTdWQF5ot29eyZHQI8tnzvctQoSfszxDhFu+QZH9/dkzC
	Q=
X-Gm-Gg: ASbGncsXxY+5FGIpHmUk3694QPrpMDNs+r1JoqNG51L+Hshh2kR5RdGcsw1Bmr/9xST
	9+qO8doO9JExbpG0S8YKxwYtZ5y3NWc3vldELuQRlibZl/PresmwLagSK/vMAcnNZEMon8wQliL
	vO9ouxuEpvF8hvnFWpL1Hig17N+aNWFQ5rNEy0BahXt14W91bRh2mzq+bu1umvqT5vA4XpPY5W5
	pxKYkqxfCGtp5jlChWGN5cfx+/6Qy7zTlyFmsRRdjxHca/ssBhECQjQ6CXregZFVRBVjmEpWXZT
	G05enUjOVlKSUw9x92JrVGX7qCcPcVWNEDY7Gr8SaFQQIRTt1Q90Upd41dUyF0vWUkbs+AKGJpy
	uCsAAm9uhX7fJR8/pYnFECjHOs1orlqb2iw==
X-Received: by 2002:a05:620a:4450:b0:89b:9b75:f5f1 with SMTP id af79cd13be357-8b4ebd9eb92mr1051554485a.53.1764178825897;
        Wed, 26 Nov 2025 09:40:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFk+WYbCB4UAQQbssL44Zoba/uliDJA/IjRYxhjiFF7e5XtfCI4o6pCvBemDjZ7Yr844NNDxQ==
X-Received: by 2002:a05:620a:4450:b0:89b:9b75:f5f1 with SMTP id af79cd13be357-8b4ebd9eb92mr1051550185a.53.1764178825481;
        Wed, 26 Nov 2025 09:40:25 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8e54sm43226430f8f.40.2025.11.26.09.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 09:40:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 18:40:08 +0100
Subject: [PATCH v2 4/8] regulator: bd718x7: Constify pointers to
 'regulator_desc' wrap struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v2-4-7ad3408d6f29@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1101;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hS8RVWi3XaF10PpDUVAlrbmypT/xVq1XUUFF7etuthE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzt9jg7POV/+E97cdcSXikJ0TTO5DEGd+g0Bp
 kPawpTUcCGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSc7fQAKCRDBN2bmhouD
 14ZND/43VbjQfFZ8ZQa5GgSj68cGizpnP3Lulpkl8vN/CoSgNdpLLuGGfkeOs06X70hijpxaoZe
 MVvrUQWpEq1kaGB1T6YYGUzWYp6FNYlBmZ+QhvikUVe5tSOxCgPNmtoSmAj+zd5g+v26Rn8gwFL
 eZlAaHb68jYse5ydpQoxMJHJE0321ctWbOm74TnUssgF/IDvZ1jOZ4x0dqROWnNQCPW+O3eLsM8
 aU+pxN+P7yezxa8ZSs3qrPQz/hizAoumN+aUGcG9XpzXXyKqf0xBRIsoA4R819t0QQ4J1TgLSPU
 8McgGQaxI3GUziCm4iHNVSb20BjsrBzKKhA+Tzw5Y8A2DqWvqvNWN0Wstshiw5ou9buzttotAy6
 UKIjtlGg2ykA1Loi5KvyWbCuwtDRn/xgKrLwa0ug+R5vJ1xzvGQLhV7QxxjC/IrtSXSbaHsyFhl
 YaenI2PGY2McssB625qOsSAcBvaeSwVDRoadka76VqWWwFu07JcyPx46cma3Ge7oHuHWZkd/hv2
 TulOrFyUwbXqB0/cqCuDyMqfs6z2sqVN6Ei2ElwBAxH758K6NImijE8nh+yHfUCP6zhYF46OwE2
 T2drQ6+mL0of8qUkQXJ7cQfXPEW4ooIL4iXCXmS28dcJ2SZ0HQXC391KYo3g2a55OKm/7/okviI
 nKAGPltNQY3T/mw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=KerfcAYD c=1 sm=1 tr=0 ts=69273b8a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9MRJ1adic_HRPEocbcUA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: DSfSspdYB9sY3Zchv2_xUDO3L_o-Vyh7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0NCBTYWx0ZWRfX2phgd7UXBlq9
 ULT2MbPe0m/DMWIodXLKC+6vPZywm9q1yPg6L6N266tJR9nhtXuMO7BNHuHfxfaMsywBmBpkaLO
 LtL0PoBHhfm1PBipg5EXgM4wp8K4wYHjkUPvFY/asPTaKsfqIevWiUn5aLdStB4Fe1tAuL1yJTZ
 EjOO45Lm3t+ZeaIHIAlvuZ86ncnSgZ7EAAXC25iUzNkGMFm8M8ZV2U9LLqE7O9xgEPNyu2uRZ/n
 yOZLaeVf+7m7bBTanc9snSaZjHWlcuKk4rwmil0BBf/Z2ZCW3Hhyz/7rTZHHO1VUS95pEkWCUfC
 zCeJV6Oh+5QIs/aG1VIulBf9rmhs0RsT19SPro15phS/YaTcFHedCByFUSMDNQ1YjT0XyhBq84l
 g305P5WZZwM/71Kx2a9PunYOWifYwQ==
X-Proofpoint-ORIG-GUID: DSfSspdYB9sY3Zchv2_xUDO3L_o-Vyh7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_094027_377598_3E630CCB 
X-CRM114-Status: GOOD (  15.66  )
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


