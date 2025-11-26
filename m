Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E11D1118A
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Nov 2025 17:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vCpXbzbZhOct4JHJAIu7jvMANlG6baOBU0kaSDKLRkY=; b=zyZM+6zAAPIK8AEoaE0WV1B8zE
	CokLTaRGnGBhslCWlr/OCWKzpScRekBQ0G5T1aFCsddBtF4Ugt/3CwvMou3x6wP7Nw3IHpsJJ/xs9
	f9NTd4m5LYYMHZ8ubke/6bActzsep7MSbOrOFEA8AOkBZ9gPa+Kd38EGjb1HIC0wj5yvn9fCjnDSq
	8VtgK0HaVGJZs39Nt96Nu+6cenFJv9QmnrFnhJety2P7QWymo9PjvQpJcXkurGuk8rQE+VEYcIJ8+
	6KwIF6BOGJEs+D31mTLpawmwuoPAs/mxD8DjuKmNbr6WdDLxmqHcMct1cehv+8RFQc7yP5sOLcxnw
	WwO4TxnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJVo-0000000FRGY-2V5a;
	Wed, 26 Nov 2025 17:41:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJVF-0000000FQqD-0cLY
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Nov 2025 17:40:47 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQHQf8i3666218
	for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 17:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vCpXbzbZhOct4JHJAIu7jvMANlG6baOBU0kaSDKLRkY=; b=IXkbEk+YGREtz/1U
	32bBxazLAEtjNXTZ4ZgbuvnCuIbD68OathytH6ciVnxPiaMDydKBquwUkSCyxu3t
	4mlWFrdryxYfgu37f7UtaY2OcQGySdzVHLWkBuaVRHOABiHbzKee8+RsgBZQh0sI
	uGTeCqSxV8hkI7yuCZOS8gpNNZmkgg7T17M8wQfyDLhLk2LYFw80cFizrZurJKNy
	gdCV2ak95JlDmWa8Zz1+KSfURicFkDBqZz9ovZzJ8NyFzbF16Z+lbZWecoorMjIz
	lWsFA4a9EEaDAyKY7Vhvwq1J5KkPdNQTO2qocc/V5XiQvZMCmT43kBoq+fWO3QwX
	3RNe0Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anmemu0v0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 17:40:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2e2342803so1773275185a.3
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 09:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764178827; x=1764783627; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vCpXbzbZhOct4JHJAIu7jvMANlG6baOBU0kaSDKLRkY=;
        b=AquTiPwn90/NA1zM2OXjJLua9mzFHewGXVPK2gNrJkYzehIRpo/RdBN4+hfT1W6mLc
         HFVRPIsYSNIn+ac9lw/CVc9719tfk0BFgf+WBafjjZnJmy1Mx7KZPPhgyA4W0iuc2C9E
         3JsCoRdPeYQB3pS4s81ADwQBlpef6n9J8h27Q1p1hQPwsl2yluIuowaXNAmfG/hRyilt
         2woXrhVv0HOowUo6Sjsv/5x1pGjPHzrr2AcQeEK4uLTBGBHz+us74H4Ke6p7Zul+EXTP
         J55MNyp9S49e7zyaBFcHpgahJ/LsjpkryieejEpqE4naL3Rpg6kdaUgCKeev12Sjxrsu
         ZVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764178827; x=1764783627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vCpXbzbZhOct4JHJAIu7jvMANlG6baOBU0kaSDKLRkY=;
        b=Abix/1wCnS76aE61fRYrxopsyWHDhlSWjFVYtd2TOtNptxqcVBsD0LdAvvfFzHbs8g
         XMB7DmjC6esHjKqpgc6BoQ4WIYLzRDA+UPYY6BqM1NRcegPH2tgSSvgdEql29dfsf+06
         pLXhXDDHfiPXYdjZt7kTKePvu0P2GF4rmy5dH8nb4mARikVWsEWsYLmL0/1d0SR3nop3
         ceFvnVCPa3iV2W3AFnvxfdnun9NqPNoiLwYTnEYHxQv+6Xl/DYnJeLob+dva/WoVsPiN
         wtjuQkJVpg0ob5u8RaML1Q340WZxzSE3Mv9mdHoMEMevlYvl/HD1pEd8oz6kpFE5zZEE
         lGkA==
X-Forwarded-Encrypted: i=1; AJvYcCV2U7Vyd+s80jaDqKa48C20zMDg3XpGx+WWWWSfYZmsv8/TshC0lF4Bx+WPgTDVGfrjsJ9bNH8FUHc2dTnvnQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxY8Hv8IWaboPWTEj2iOfZOHjHDy5wqYeOc4z/4aUEDXtZOti6b
	fz8QSVCMxtZjHSoNkzDZxqgmwWuJP5SFUBHYN++2yPnEtCMzLOTVnV6FjNq143u+qaSyixYrNMV
	OeMWSrj9hyb8g0g2dcFAsmUvtAJFunJ7OEQGGMGZbjRj3NfY/sFcmsVQ8hAqxfoNth+eBG8LhW2
	lpv+j3wj8=
X-Gm-Gg: ASbGnctbO2hNNl6bmznJNnYkScroI+M0GsygOjRYFjPgIwrAkfvp+ax1BRS7tjl430a
	9qHMq9DIOFYk4GshF/jBSMBBRImAsEH5TYelE/tsXItk6CQiGlG4QMLiiAi/CpvBAxejTBqjcIB
	rIvhRHMgGveYUQ+zA8f9c5sPJm8MvSpGn9+EkgKubJpZ3MMnoYoGWjeK+JbACh37jY7ajlA9FcM
	h2xzAeHnAPDxMmRiUn/VcHt/sK1S5rbUEkWMNEGLEB+ydxdxKqAWTUdIQPpJFwYsur745mKm2bB
	+ECklaXksgb69p9kqp4bZAhyHmRjNfPbKWqEml7L/G1x+GF8q24eRUqKS8o0CO3HeGwVAkKS8eW
	8zdMXov6y8672C5qoC5hPcv/FokxsEGx3Cw==
X-Received: by 2002:a05:620a:4496:b0:8b2:dabe:de42 with SMTP id af79cd13be357-8b4ebdb0549mr1021000785a.46.1764178827474;
        Wed, 26 Nov 2025 09:40:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZUDWs7JiLSSF7ArWfRHkaAuwTyK+QSHjFarP5skIIj4AqiWmo9YleaDZxRWKvb5+rueimyQ==
X-Received: by 2002:a05:620a:4496:b0:8b2:dabe:de42 with SMTP id af79cd13be357-8b4ebdb0549mr1020997085a.46.1764178827001;
        Wed, 26 Nov 2025 09:40:27 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8e54sm43226430f8f.40.2025.11.26.09.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 09:40:26 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 18:40:09 +0100
Subject: [PATCH v2 5/8] regulator: bd96801: Constify pointers to
 'regulator_desc' wrap struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v2-5-7ad3408d6f29@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1703;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pvkowGB42YgFOHad3W/lZDavbKmrMX9dgCpdtLR0vaY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzt+qhcdHZT1bVlP+KvVAUFrdcV1FOsogvx2/
 PQmEEsCxTWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSc7fgAKCRDBN2bmhouD
 19XsD/9iNsNCUzdvVYQCqdrlXFz46c3uzDS/W95FVBCYak9EvFYa8wvG/SyoqmfyzqJ3hZ30pLK
 Nqxuz7x4oAaguorR9koog8fcSQdtLEvhbLV54bx2qy70JlZqK+Pl2GR6iXhe4/JS2BLIIkZQEy5
 iKVWsQJ+PjirJRXjfWw8OpLXiCqWS9kYT9Zus7Z3XWn4TMoOeMJtboSBCIX6ZBFhomKz0mE2HEn
 pDOdv645GxGl9y1BNlza5oviDZJyIrHoqxBhv77iufU5u/SScJmJiv9BpkXcHZ5hxPFPvRUkU0w
 NSjzVvQjh5H5jz4xa5CjjzuddZ3ExOjI6r392yeVz3KNLwQ6tGJAGvmGTPb3T/XvEOlbhMSbWHx
 LsNuAnaiw6FbEMXaYwzHgUbMaRId1U7hufR+rJIE2KZfPMQiHrTQzarB3Tiu9OdGByRgHtlSudz
 FnLBZsVHjTlFbfIfPQLqGVOERHP7N3k2wn1PzKRrsp5nrl7yJVFUWfTrQiVgF4XL9M0CktAj3xN
 PCWl/QBXd0b7YvKOIMHu9jXLii+TBPB80HqOJUaeHx25qA8J3QaT/K7e8zMjiOeh44OwyMNGixS
 91o+Bzq4oluoS225GxO8nUBr99gpFCf3Iyqo1mqzzfyCUC0Km2vYvLbw9ZgN7+3O9Bgf+sBeffs
 UGbhlyD8nWsiPFg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 0cW-ArjFkVALQCDabMwahM65qc_vClxL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0NCBTYWx0ZWRfX3dl5ziPpE57j
 WZ9HalxaJSy+7sx32f30y59vPgbFYKfNIuTC01mzcC/Ek6JegWNMRfReMZglbtsqd4knkCstbVa
 G97cyOG9PM3HhHDLxQTAIlR97ni0u9dWa6vNs0dkzVl2GVKVyp1dr0NKlc/iChBe476LYSGh0oJ
 wQqX/9h0diV9HxPmMnCiPtkLEE0m/xPzDDhEQvv1gzK+DDHuxzHm1+CFBKT4tLcr8m97Arj7aEJ
 IhJHpXdv1afafyAG/DluJksV+bYWn0emZIa588UOWTtHRza6QPB5+3dMbQsjlS1C7uk3mf7NbAs
 Qznl2DNp1KJeKx1qOaEl8saEbHi1pkXyCnPOxh1jh/P7cbKInYhail1XnDyYEepohtw/NfKVf5S
 LzxlvgFzhO2suBisammvdf5TJseX8A==
X-Proofpoint-GUID: 0cW-ArjFkVALQCDabMwahM65qc_vClxL
X-Authority-Analysis: v=2.4 cv=bZBmkePB c=1 sm=1 tr=0 ts=69273b8c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9MRJ1adic_HRPEocbcUA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_094029_192123_296B2190 
X-CRM114-Status: GOOD (  16.94  )
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
 drivers/regulator/bd96801-regulator.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/bd96801-regulator.c b/drivers/regulator/bd96801-regulator.c
index 24d21172298b..129b20c33bad 100644
--- a/drivers/regulator/bd96801-regulator.c
+++ b/drivers/regulator/bd96801-regulator.c
@@ -337,12 +337,12 @@ static int ldo_map_notif(int irq, struct regulator_irq_data *rid,
 	int i;
 
 	for (i = 0; i < rid->num_states; i++) {
-		struct bd96801_regulator_data *rdata;
+		const struct bd96801_regulator_data *rdata;
 		struct regulator_dev *rdev;
 
 		rdev = rid->states[i].rdev;
-		rdata = container_of(rdev->desc, struct bd96801_regulator_data,
-				     desc);
+		rdata = container_of_const(rdev->desc, struct bd96801_regulator_data,
+					   desc);
 		rid->states[i].notifs = regulator_err2notif(rdata->ldo_errs);
 		rid->states[i].errors = rdata->ldo_errs;
 		*dev_mask |= BIT(i);
@@ -354,9 +354,9 @@ static int bd96801_list_voltage_lr(struct regulator_dev *rdev,
 				   unsigned int selector)
 {
 	int voltage;
-	struct bd96801_regulator_data *data;
+	const struct bd96801_regulator_data *data;
 
-	data = container_of(rdev->desc, struct bd96801_regulator_data, desc);
+	data = container_of_const(rdev->desc, struct bd96801_regulator_data, desc);
 
 	/*
 	 * The BD096801 has voltage setting in two registers. One giving the

-- 
2.48.1


