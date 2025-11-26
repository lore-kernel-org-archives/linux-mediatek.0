Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38B6D1118A
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Nov 2025 16:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k3JbgWsz0MgrUoNw+KV6VClK/+7GvmHIylTI2s89udk=; b=i08LaZOwPwTGaxV2Av1z20nhNn
	7NltDIxqhtVvk+3Y5VihGKK54rZx+QBsVUzobJAYWzwi9KEReIXMcFWS7Y1qdg29kstki7+c2GIuj
	BLTm9arQ+wN3SsFMRv2YI2AzCV/xSYLGKSwEUOndynXaThiQdc71/lWrZ/uhZHEIhaKEWPXd+Xu4U
	27g0qqFM+xzI17XBfmY30dLr1SzZ+BuFSnEw0HZw/A0HSjoapPziDRWTkSl5hfc0HEs6tpQiIpd53
	89ag8YhgLuwCJjJ0KItSOrxA2NmT9mKdeEB7J28VwhlavMNjQgxpyi6PJN2eVx7zFwF/os70NRXwT
	T38G1MYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIrI-0000000FLBv-3cEa;
	Wed, 26 Nov 2025 16:59:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIrG-0000000FLA0-1F3Y
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Nov 2025 16:59:11 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ98Jxr3666161
	for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 16:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k3JbgWsz0MgrUoNw+KV6VClK/+7GvmHIylTI2s89udk=; b=Pn7x4zXy5QN267Fx
	phQ+eFB+DXPWMX2zPUyRVMnKXuAkPNQXoWd0RpjRpxGSq1xv0xt9ZgidGi7+/UY6
	2Q5lRK4doKzxld3kluq/bfdS33BNiSDRJ9qFMll5TdhWK4AgsIGLqtp2QqpkybJJ
	uioo39jXj6NvZqw5WqfERoXxP+eMo2v3HaT7Wtyho4V14DxiMrAQtN/kEXYnTm7p
	uE4DZUaeTzXGxnzkN4aZB7NQgbO4v/OFYrAtEcTN5t57F0L5110thT1twtsDXk2H
	/9UXPyJ4HTzAtnMpwWwZ62iU/NDVfOR7zsxPYzRCDd+dBhMhkC/CqwBvR9fJ1Rbu
	fN8Njg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anmemtw0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 16:59:09 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8804823b757so23708166d6.0
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 08:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764176349; x=1764781149; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k3JbgWsz0MgrUoNw+KV6VClK/+7GvmHIylTI2s89udk=;
        b=kHOFFy1PFSLGVApVNt1vwDspvn5cE4AzEFwX7WV6w9R/pW66SmwvhuyCSdk/jtEcJB
         rGY363/p2eVGJnrUhawscUYkGcTFPW9hFuiKMOpF/r0daPUKJW4HMWjhSeG4a5Q1jKLH
         Ow7AeDVe8wdFETiG3gZPoLlaF4GjU/LYb3nf5Is4hI5f3V/xzBtblSFoaV7IcOmLfetZ
         Ha0mukSwF5LA4X1JBSJ7LeXM/mjbJH0JYA3VxsH6RrUNHAt0u7kj4cKGsSEspmK2dIc4
         2GLEPs2mDEoCpkoTDeOXbHrZhMeTY+7ygYphZbwkrfikNTPcI+LGH3chT1g37ub/Ao0n
         rWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764176349; x=1764781149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k3JbgWsz0MgrUoNw+KV6VClK/+7GvmHIylTI2s89udk=;
        b=mNtAKp8XgfZJSf3+OlaVPbt/8HAhhWBP4Y22cOu2F1RJ1eCJTgJ9wgQGuq3I+GmxHV
         R/LBja2dlHAhgdJWE8jNFq6uKRu+sWdkVTH0wWqzMlx6AVIgVVG1Tf9jGUNgAORg2pZh
         TqQJFUxEKTF/JGNCqxwnLKNlBeGJMHTrPRNaqX8p7/j459v+rQicz8Os8v2FPsPHerIe
         kBiqby4qwgkjnEBw7uFDPMOfGSGlaYE8benecARIp4Vu5RCQDR3tx9CuI/9vyyGPDPAz
         6CxOwbA8lLp1+2Dmzsy4s3xYmky61ny4JB48U/fAE2d/5fatwhrUUKmtVq0B6qX4G42o
         W1Kg==
X-Forwarded-Encrypted: i=1; AJvYcCWcZL19p0nqkLz7twEPGTyOk8IUPIssWPRDCGVEFh4hYrdbZ+vvKwkudZqFLrpteQBWaUDRcfi1XL4hxvqowA==@lists.infradead.org
X-Gm-Message-State: AOJu0YygbHMCKptfUHDB5VRPEH2xs34cN8YnhJ6HGRrFmlIJAYnAsCIw
	S7lS3b3kDFOgCi/EL3mp/hdZcATsdaTJULSZOeB2DVB42fOdR+R7IBUF1tP5XHCBusnUwMwzPoy
	Ku6vC/ELgWmkAOOdKJBaSPi/z/pQEM/hpOqB/P4RaK+ZYPFbmnSvXbHFMiKApP1rrWJS6xSmfy/
	A=
X-Gm-Gg: ASbGncuZBE7mJNdKVRiI28EbOS5HK8/hMGw1mNXJBsXiyt7e2sY38ArNkQsTLo+BXMW
	r7R4O7COHnxjh/H+vduGV82vZOQr4cy6Pc602nRf9lw1OQDvMs4ao6hW0nSnM/yPBTst6whGIoc
	Oy1sgStx24ErRVp+j39vSrwtAokqcZN4X6dO8oiyU7WMZnKTguzMFcTUOOiWbsQTxDWZ2aIPXGy
	Ti+5uYqvEXp5+mmcivufruCstlXm0iz098FsubipBGsyrF6D7D9v0rHOc27i5ud9iGEX8LPFX2Q
	kjej5AZoRZPPaexb0rTxGDqAxcfINMo3JnTE6IhjH/KcuWlqYPlm7cdFcOiyXGnQ0MQzHGf13zp
	xEVsspom0+6WJhnNQoR5arMVrllZlwAiGgQ==
X-Received: by 2002:ac8:7d4b:0:b0:4ee:1bdb:a547 with SMTP id d75a77b69052e-4ee4b44942amr390379811cf.14.1764176348649;
        Wed, 26 Nov 2025 08:59:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXP8xwc6R66Df1B5JWgQH4iuh0Ol81d6xkP0icKm57B55Hsx263/Lx3e/3QyuggROGBRbYXQ==
X-Received: by 2002:ac8:7d4b:0:b0:4ee:1bdb:a547 with SMTP id d75a77b69052e-4ee4b44942amr390379201cf.14.1764176348111;
        Wed, 26 Nov 2025 08:59:08 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3a81sm42398811f8f.26.2025.11.26.08.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:59:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 17:58:44 +0100
Subject: [PATCH 1/8] regulator: Use container_of_const() when all types are
 const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v1-1-eeec378144d4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10498;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ksdKQZDZf6PSfDQolGcZw2sgxojAWSKaADH0pEqNoMg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzHR9c8eoy/Zb1bCHwTyc/IxD6/8sMI7RPdLr
 hFw5PxjURyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaScx0QAKCRDBN2bmhouD
 13A2D/96aVoQBIWlztNXHma1dMqEyrhOjl/nJwqbU4bYXR9p/7cDyCWHzZCzlJanYbCQdHlRsU3
 4XJvLpFKn3SvHvuqFc3piKonZ+WomWUZNApZFb/vIlNP+3qKj/mqckQQ6z3OxM16g9XSWstiWvh
 tJG/ALTOSWZrASQacFCckdNuYkNn8Evw1Y1r3dCyiVTy5VXph/WNp/5faqtO3pkByfVRHf0ST4L
 6z4lQL9qo8fRN8JbfqrIsun9Sf+9/57RGVcaKdiKmUwGhOeXTrfjace7hrhenXayDc705KHjpNl
 vwisst1JR5vYIHCkcmgU1NbnUkMG4q95FKcOS+BV5KHvtg1fSCm79r5EsUGNUFnFYi2WEnydKCZ
 V+Ns7/irjxSJWscArOxlj9ckOeosuoQYzN6Xf0WOHh2U2wICuXj2hiZr4keTRVjztY9/tNwYbfA
 y85fBdV7vcJ6flA96dLqBIQHVKKI9BTXFZD3bC/6EuCidR6FqfZFhvHxGequ2cVyghIkTER/exb
 3aOHQKGJTOwONquL25xJ0Vd/v8z00tEH8KZg6ObhWKrqkOTUFldmCRLBBF2Xv7bnP/R0AU1IA3e
 0GcwJVD/hzuxG/Mhd90sxi+T27+6432JhJ2TEetTwtr01w5+jmENQ/rRiXUedI67uaVyLR2w+8U
 pdjV8C1PTk32Ymw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: h9gEt7j9n4NOEf8kDgr2zG86cW__nilF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEzOCBTYWx0ZWRfX/TGYpyjDgXV8
 ETD5276ngHs74ack8YgW1LjnNCAZNBtN3s55EGrc5KXmmfXuK+wt+tEORkPc61LMdihLmkc4QMX
 xFh/clwGD0XNBtWqHEs9zpiRyk1Q3owTGWjATNOWlOyNe5VteJm2T/Vm37h4/PU/KaCndvih40p
 YrKez0GcXRtP4/0mKAD4dJdNHhKcoL7z7kzxDfvVYHLZ/0EA/Ob01oc+ed0v9b9Eq0GpYmfLHRx
 HWg3vkJWSP06bC1EEcP2mgpTTn9BPyoGkmJLQKt214z4mLM9QIAmaKQdMjVmyH7eQso+24NUG7F
 HZZsitB8mVqVqLekj2xQuqtPuZP8U2mzETDD3TcN56CGnt6KOuNXd5evGuJKOAS7EYQTKOVSjnW
 9ZHkjHbXyz/q2fQkG+GB61Mz+OuZuA==
X-Proofpoint-GUID: h9gEt7j9n4NOEf8kDgr2zG86cW__nilF
X-Authority-Analysis: v=2.4 cv=bZBmkePB c=1 sm=1 tr=0 ts=692731dd cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=SzMjVNougZAxKi99s30A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1011 priorityscore=1501 adultscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_085910_347055_9F996EEA 
X-CRM114-Status: GOOD (  16.19  )
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

Use container_of_const(), which is preferred over container_of(), when
the argument 'ptr' and returned pointer are already const, for better
code safety and readability.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/regulator/hi6421-regulator.c     | 10 +++++-----
 drivers/regulator/hi6421v530-regulator.c |  4 ++--
 drivers/regulator/hi6421v600-regulator.c |  6 +++---
 drivers/regulator/max77650-regulator.c   |  6 +++---
 drivers/regulator/mt6315-regulator.c     |  6 +++---
 drivers/regulator/pf1550-regulator.c     | 24 ++++++++++++------------
 6 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/regulator/hi6421-regulator.c b/drivers/regulator/hi6421-regulator.c
index 69d24728d6a4..cd06030c3587 100644
--- a/drivers/regulator/hi6421-regulator.c
+++ b/drivers/regulator/hi6421-regulator.c
@@ -387,7 +387,7 @@ static unsigned int hi6421_regulator_ldo_get_mode(struct regulator_dev *rdev)
 	const struct hi6421_regulator_info *info;
 	unsigned int reg_val;
 
-	info = container_of(rdev->desc, struct hi6421_regulator_info, desc);
+	info = container_of_const(rdev->desc, struct hi6421_regulator_info, desc);
 	regmap_read(rdev->regmap, rdev->desc->enable_reg, &reg_val);
 	if (reg_val & info->mode_mask)
 		return REGULATOR_MODE_IDLE;
@@ -400,7 +400,7 @@ static unsigned int hi6421_regulator_buck_get_mode(struct regulator_dev *rdev)
 	const struct hi6421_regulator_info *info;
 	unsigned int reg_val;
 
-	info = container_of(rdev->desc, struct hi6421_regulator_info, desc);
+	info = container_of_const(rdev->desc, struct hi6421_regulator_info, desc);
 	regmap_read(rdev->regmap, rdev->desc->enable_reg, &reg_val);
 	if (reg_val & info->mode_mask)
 		return REGULATOR_MODE_STANDBY;
@@ -414,7 +414,7 @@ static int hi6421_regulator_ldo_set_mode(struct regulator_dev *rdev,
 	const struct hi6421_regulator_info *info;
 	unsigned int new_mode;
 
-	info = container_of(rdev->desc, struct hi6421_regulator_info, desc);
+	info = container_of_const(rdev->desc, struct hi6421_regulator_info, desc);
 	switch (mode) {
 	case REGULATOR_MODE_NORMAL:
 		new_mode = 0;
@@ -439,7 +439,7 @@ static int hi6421_regulator_buck_set_mode(struct regulator_dev *rdev,
 	const struct hi6421_regulator_info *info;
 	unsigned int new_mode;
 
-	info = container_of(rdev->desc, struct hi6421_regulator_info, desc);
+	info = container_of_const(rdev->desc, struct hi6421_regulator_info, desc);
 	switch (mode) {
 	case REGULATOR_MODE_NORMAL:
 		new_mode = 0;
@@ -464,7 +464,7 @@ hi6421_regulator_ldo_get_optimum_mode(struct regulator_dev *rdev,
 {
 	const struct hi6421_regulator_info *info;
 
-	info = container_of(rdev->desc, struct hi6421_regulator_info, desc);
+	info = container_of_const(rdev->desc, struct hi6421_regulator_info, desc);
 
 	if (load_uA > info->eco_microamp)
 		return REGULATOR_MODE_NORMAL;
diff --git a/drivers/regulator/hi6421v530-regulator.c b/drivers/regulator/hi6421v530-regulator.c
index b3ebd1624814..1822f5daf6ce 100644
--- a/drivers/regulator/hi6421v530-regulator.c
+++ b/drivers/regulator/hi6421v530-regulator.c
@@ -110,7 +110,7 @@ static unsigned int hi6421v530_regulator_ldo_get_mode(
 	const struct hi6421v530_regulator_info *info;
 	unsigned int reg_val;
 
-	info = container_of(rdev->desc, struct hi6421v530_regulator_info, rdesc);
+	info = container_of_const(rdev->desc, struct hi6421v530_regulator_info, rdesc);
 	regmap_read(rdev->regmap, rdev->desc->enable_reg, &reg_val);
 
 	if (reg_val & (info->mode_mask))
@@ -125,7 +125,7 @@ static int hi6421v530_regulator_ldo_set_mode(struct regulator_dev *rdev,
 	const struct hi6421v530_regulator_info *info;
 	unsigned int new_mode;
 
-	info = container_of(rdev->desc, struct hi6421v530_regulator_info, rdesc);
+	info = container_of_const(rdev->desc, struct hi6421v530_regulator_info, rdesc);
 	switch (mode) {
 	case REGULATOR_MODE_NORMAL:
 		new_mode = 0;
diff --git a/drivers/regulator/hi6421v600-regulator.c b/drivers/regulator/hi6421v600-regulator.c
index e5f6fbfc9016..e7c8bc10cf24 100644
--- a/drivers/regulator/hi6421v600-regulator.c
+++ b/drivers/regulator/hi6421v600-regulator.c
@@ -121,7 +121,7 @@ static unsigned int hi6421_spmi_regulator_get_mode(struct regulator_dev *rdev)
 	const struct hi6421_spmi_reg_info *sreg;
 	unsigned int reg_val;
 
-	sreg = container_of(rdev->desc, struct hi6421_spmi_reg_info, desc);
+	sreg = container_of_const(rdev->desc, struct hi6421_spmi_reg_info, desc);
 	regmap_read(rdev->regmap, rdev->desc->enable_reg, &reg_val);
 
 	if (reg_val & sreg->eco_mode_mask)
@@ -136,7 +136,7 @@ static int hi6421_spmi_regulator_set_mode(struct regulator_dev *rdev,
 	const struct hi6421_spmi_reg_info *sreg;
 	unsigned int val;
 
-	sreg = container_of(rdev->desc, struct hi6421_spmi_reg_info, desc);
+	sreg = container_of_const(rdev->desc, struct hi6421_spmi_reg_info, desc);
 	switch (mode) {
 	case REGULATOR_MODE_NORMAL:
 		val = 0;
@@ -162,7 +162,7 @@ hi6421_spmi_regulator_get_optimum_mode(struct regulator_dev *rdev,
 {
 	const struct hi6421_spmi_reg_info *sreg;
 
-	sreg = container_of(rdev->desc, struct hi6421_spmi_reg_info, desc);
+	sreg = container_of_const(rdev->desc, struct hi6421_spmi_reg_info, desc);
 
 	if (!sreg->eco_uA || ((unsigned int)load_uA > sreg->eco_uA))
 		return REGULATOR_MODE_NORMAL;
diff --git a/drivers/regulator/max77650-regulator.c b/drivers/regulator/max77650-regulator.c
index 7368f54f046d..a809264c77fc 100644
--- a/drivers/regulator/max77650-regulator.c
+++ b/drivers/regulator/max77650-regulator.c
@@ -68,7 +68,7 @@ static int max77650_regulator_is_enabled(struct regulator_dev *rdev)
 	struct regmap *map;
 	int val, rv, en;
 
-	rdesc = container_of(rdev->desc, struct max77650_regulator_desc, desc);
+	rdesc = container_of_const(rdev->desc, struct max77650_regulator_desc, desc);
 	map = rdev_get_regmap(rdev);
 
 	rv = regmap_read(map, rdesc->regB, &val);
@@ -85,7 +85,7 @@ static int max77650_regulator_enable(struct regulator_dev *rdev)
 	const struct max77650_regulator_desc *rdesc;
 	struct regmap *map;
 
-	rdesc = container_of(rdev->desc, struct max77650_regulator_desc, desc);
+	rdesc = container_of_const(rdev->desc, struct max77650_regulator_desc, desc);
 	map = rdev_get_regmap(rdev);
 
 	return regmap_update_bits(map, rdesc->regB,
@@ -98,7 +98,7 @@ static int max77650_regulator_disable(struct regulator_dev *rdev)
 	const struct max77650_regulator_desc *rdesc;
 	struct regmap *map;
 
-	rdesc = container_of(rdev->desc, struct max77650_regulator_desc, desc);
+	rdesc = container_of_const(rdev->desc, struct max77650_regulator_desc, desc);
 	map = rdev_get_regmap(rdev);
 
 	return regmap_update_bits(map, rdesc->regB,
diff --git a/drivers/regulator/mt6315-regulator.c b/drivers/regulator/mt6315-regulator.c
index 2608a6652d77..d3f93aae0fc5 100644
--- a/drivers/regulator/mt6315-regulator.c
+++ b/drivers/regulator/mt6315-regulator.c
@@ -80,7 +80,7 @@ static unsigned int mt6315_regulator_get_mode(struct regulator_dev *rdev)
 	int ret, regval;
 	u32 modeset_mask;
 
-	info = container_of(rdev->desc, struct mt6315_regulator_info, desc);
+	info = container_of_const(rdev->desc, struct mt6315_regulator_info, desc);
 	modeset_mask = init->modeset_mask[rdev_get_id(rdev)];
 	ret = regmap_read(rdev->regmap, MT6315_BUCK_TOP_4PHASE_ANA_CON42, &regval);
 	if (ret != 0) {
@@ -111,7 +111,7 @@ static int mt6315_regulator_set_mode(struct regulator_dev *rdev,
 	int ret, val, curr_mode;
 	u32 modeset_mask;
 
-	info = container_of(rdev->desc, struct mt6315_regulator_info, desc);
+	info = container_of_const(rdev->desc, struct mt6315_regulator_info, desc);
 	modeset_mask = init->modeset_mask[rdev_get_id(rdev)];
 	curr_mode = mt6315_regulator_get_mode(rdev);
 	switch (mode) {
@@ -165,7 +165,7 @@ static int mt6315_get_status(struct regulator_dev *rdev)
 	int ret;
 	u32 regval;
 
-	info = container_of(rdev->desc, struct mt6315_regulator_info, desc);
+	info = container_of_const(rdev->desc, struct mt6315_regulator_info, desc);
 	ret = regmap_read(rdev->regmap, info->status_reg, &regval);
 	if (ret < 0) {
 		dev_err(&rdev->dev, "Failed to get enable reg: %d\n", ret);
diff --git a/drivers/regulator/pf1550-regulator.c b/drivers/regulator/pf1550-regulator.c
index 904926097738..037b8ec94066 100644
--- a/drivers/regulator/pf1550-regulator.c
+++ b/drivers/regulator/pf1550-regulator.c
@@ -71,9 +71,9 @@ static int pf1550_set_ramp_delay(struct regulator_dev *rdev, int ramp_delay)
 
 static int pf1550_set_suspend_enable(struct regulator_dev *rdev)
 {
-	const struct pf1550_desc *desc = container_of(rdev->desc,
-						      struct pf1550_desc,
-						      desc);
+	const struct pf1550_desc *desc = container_of_const(rdev->desc,
+							    struct pf1550_desc,
+							    desc);
 	unsigned int val = desc->stby_enable_mask;
 
 	return regmap_update_bits(rdev->regmap, desc->stby_enable_reg,
@@ -82,9 +82,9 @@ static int pf1550_set_suspend_enable(struct regulator_dev *rdev)
 
 static int pf1550_set_suspend_disable(struct regulator_dev *rdev)
 {
-	const struct pf1550_desc *desc = container_of(rdev->desc,
-						      struct pf1550_desc,
-						      desc);
+	const struct pf1550_desc *desc = container_of_const(rdev->desc,
+							    struct pf1550_desc,
+							    desc);
 
 	return regmap_update_bits(rdev->regmap, desc->stby_enable_reg,
 				  desc->stby_enable_mask, 0);
@@ -93,9 +93,9 @@ static int pf1550_set_suspend_disable(struct regulator_dev *rdev)
 static int pf1550_buck_set_table_suspend_voltage(struct regulator_dev *rdev,
 						 int uV)
 {
-	const struct pf1550_desc *desc = container_of(rdev->desc,
-						      struct pf1550_desc,
-						      desc);
+	const struct pf1550_desc *desc = container_of_const(rdev->desc,
+							    struct pf1550_desc,
+							    desc);
 	int ret;
 
 	ret = regulator_map_voltage_ascend(rdev, uV, uV);
@@ -111,9 +111,9 @@ static int pf1550_buck_set_table_suspend_voltage(struct regulator_dev *rdev,
 static int pf1550_buck_set_linear_suspend_voltage(struct regulator_dev *rdev,
 						  int uV)
 {
-	const struct pf1550_desc *desc = container_of(rdev->desc,
-						      struct pf1550_desc,
-						      desc);
+	const struct pf1550_desc *desc = container_of_const(rdev->desc,
+							    struct pf1550_desc,
+							    desc);
 	int ret;
 
 	ret = regulator_map_voltage_linear(rdev, uV, uV);

-- 
2.48.1


