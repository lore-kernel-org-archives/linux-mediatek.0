Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A5DD11186
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Nov 2025 16:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vCpXbzbZhOct4JHJAIu7jvMANlG6baOBU0kaSDKLRkY=; b=hjaaJsdcB3Bu/IkMGJhadJ7LGz
	YjR2qmIUck3qSciLKBw8o0lJOxoXtFwYzeXu/zilWKUoZSl6ytCBVMKKluYDmmynhWJzMAsfofkDX
	8wyaO63IRNMPZY3xYtWy1JQNNewWKfrJ4DMulvuVEmlTVYwK1SkKMa4UjQW1VXJyeYZ9KRGrhfxZ5
	5tVa43cdexS8/bh/WM8UOYmhl8OUttxOj6vAfCFVQkZbQWEyOHmeiszybRFfm0Av9r7/8Qv9kxPv3
	njSJkXk69bKFzAGMfQK2oKXG2oK5NjLgTjU4ZSDz8OsTT0YOoIKqjMO8uiiU+Y1OTmsKlbAIf/I17
	XOxwOKfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIrY-0000000FLPb-0hQA;
	Wed, 26 Nov 2025 16:59:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIrR-0000000FLIT-0hek
	for linux-mediatek@bombadil.infradead.org;
	Wed, 26 Nov 2025 16:59:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=vCpXbzbZhOct4JHJAIu7jvMANlG6baOBU0kaSDKLRkY=; b=SXwXNPjwDS6fYk8pjbdLRyi/PP
	TcpMZvaBEYrbS5V99+JWbe+S6q1KGd274sVEllXmAcyM7HsRUac3WkE80sfIMQsAtalSuI5/kXeGg
	IZUg6zRgXB/gytOGQDLR6xgkiLBaeaTUbHKwiMRXxY1huim0uDTRuOoWdrfxMULxl69iXBhnydyxw
	G49gylHdxAEyQs88kWHmcoVv9L5YRl7AJsz+pCqSLaEidRXyeHfzVWK1BPAMCTGSp7bp3KdCnqFI0
	VY+tZ29YtMUd9+0gC0n2BkEzwyvTnJvG3oHbOVeR4kBy7TOHuyI5a7h49ffYQ5AInHQpILMujZTN9
	Hj1Bx5cA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHzm-00000008S5w-3cqs
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Nov 2025 16:03:57 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQFwVoH1234719
	for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 16:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vCpXbzbZhOct4JHJAIu7jvMANlG6baOBU0kaSDKLRkY=; b=CoqpCszPRTAcr3sl
	OlMvUkY3svFku9dZ5uh+NMSNr3qyRR43ZEIF2emQX20Bd4t+EegPgMA9/35urcq0
	xI5gZ8HQo7G3pLzfiHDN9OeEEOOY/NNj5Xg3IRQ81hsmY0mk8lwQjUvIORCT9/XB
	jCJH2oamxiusi8tJlpg/2KfvsPFi8N/SwSJx1gK6zrVyDt+5G2BNUTeif+D6D3go
	TfQ0Fdd9Bs/tjMmV49vs95tzoxERzp/dg5PdmWzlBiySJiVQlHsJULDp2Vy3c6Qh
	mK3XQ+UreONmtUtDdxzzj9YGZC2nTU2ktCgKXGz39IhmbQ/8bMqysPRJcmd2zaMW
	1iIS2A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anwd41mx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 16:59:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2e4b78e35so1544347185a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 08:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764176354; x=1764781154; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vCpXbzbZhOct4JHJAIu7jvMANlG6baOBU0kaSDKLRkY=;
        b=bCkcKdHMM4nNTjLUJL6wxZi45q4/QRwf7+s7dKMcSmXpLJFaeQWm5ErIdySYHvr9Ft
         vi8CBnITdx4V0W0Rabyk5mdpx8F5vuy84Q/NAATV60l6AnTPXkFXNVYbp0czuHxB8CYg
         uMlASPufEMOsGb88R+/tubuQink1tETw2r2008qwrw1e9Ffipu7BT0G0YGn5u0ZdTKzv
         QtvHBmks1Vy+IxG+g1rWUfE1bz/wkSz6p3EJP2fvR0oH2P/JfLUJnKvRZG2vBtFpkBk2
         4ZemOyo4eMHM9OQ5t5axAzap0IMO6fyH6HkhjmjNxzl5LZ+omk03ESCLTRmZdDfiRn9U
         W0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764176354; x=1764781154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vCpXbzbZhOct4JHJAIu7jvMANlG6baOBU0kaSDKLRkY=;
        b=WZEkwx8fS85er+CUxzW5qaxj+947NQbLxXK6NuthYW+DxAGXuxUIOlCD0UwDEhng95
         +qOksx0Fx8Ap35jVEXDksasEWJTX2XXQOSdarWEjFtkzgBOhx7p+i5wPnnGbTyoe3tFJ
         6P9K6obA6DDM/VWF8nWAnf1nEYO0tZo1s61f1vLEkkNE0lwFDqVb8B2nSIn2YlbyaeZL
         HaPbAodP/75+IeIIAkfZNYk62QsWuAizwpxFzmP7FdctzNm8QvVznhFSmaRM4TKKY00c
         u5MKMKHhv4pJR90wdRSt+V36f69aLAIa11k8tBBNQkFDAsazdaSQrC94Zx6qwgpIpbBC
         dcSg==
X-Forwarded-Encrypted: i=1; AJvYcCXddTDAAHo4Ibh1zZcynRoRrlxxbFXMbd9yEbhGotSxcI64gM2zgAyxaWyDh1k7yDR1w0egsVWgKwwFZEtHGw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu2OcJNIxk6l/BsyIAB8Yukpecm9m0ocI3ZzvHxWXE/mWgL+YI
	2adHY1sPzvnHAPoM5vPgUtFrkkIURN2xquE5O8jEK0QUgvJOGg1a1kMI5oBCRv9Ew11toOZGEhO
	YyvM3b8zKEmht9JYV5GEh9M0bCELqPNm/U80Et4hDpdnHJITZr6Ev7cqL7xAE17XLrlWQppGJfD
	A=
X-Gm-Gg: ASbGnct2O/wtGuP1k2I+YSLtpPNWxH2mfnz0rRKBUwExMkW0Thah//YxvaAwARUK0UA
	PUvcaetg1jjNBID8Mar5qwziJyh9jRXb2a3Tt10KN9KcRPyDRIyhmoHr3t6hPybv6b4lziMAufH
	NkVmztJ+JSkQHa2DWdGx4DXJzE2Q6Kug3qwcVIHuqvfRu0i4B+WNNfWAA6sNG+DOsC8FJ47uqy9
	oUv+GT6bB/59LatrL42VUUKjO8cI8/U12CnB7V3wP1e9xgGqA6YvMrirChh4qyPJ7rVwFHNEapd
	vbAOy8KiqqCV43w1RyC9mcohWlLbXoNuAh4pqApdb0soQwxO5XH9dot9zSj0jglNo/yhtXEIsLM
	OqLZSM1QPlq/0Vtgp11UUSsWXArhejsNNww==
X-Received: by 2002:a05:620a:2910:b0:7e8:46ff:baac with SMTP id af79cd13be357-8b4ebd545e6mr999113185a.1.1764176354363;
        Wed, 26 Nov 2025 08:59:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGt/gU81JQ70dUpUGO0vKvjPidySNwT0x6iFOY2/04I93A62yvmfMI3LpgRB7BswyFxe8slRQ==
X-Received: by 2002:a05:620a:2910:b0:7e8:46ff:baac with SMTP id af79cd13be357-8b4ebd545e6mr999109285a.1.1764176353867;
        Wed, 26 Nov 2025 08:59:13 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3a81sm42398811f8f.26.2025.11.26.08.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:59:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 17:58:48 +0100
Subject: [PATCH 5/8] regulator: bd96801: Constify pointers to
 'regulator_desc' wrap struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v1-5-eeec378144d4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1703;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pvkowGB42YgFOHad3W/lZDavbKmrMX9dgCpdtLR0vaY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzHVIqhZwoncq3gm6ksABMOBQ8NNIlA+MDFPt
 ZnTX/xQZKKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaScx1QAKCRDBN2bmhouD
 1/fmD/49q1UtrUEpI8llXnpgz8NlCQZsADq3DhxYy6vzQ3DmnJjAMMSwn2ZxSngBiSeFykVqx2t
 Or7fzn0SOXe6dy2Hym49prlpvLm80gwA5xxpGYIjQJCwHknTp3l7THlaK+MLgGM7gzLOcSckQiF
 dNlLDocsHWTdwKR3CPTq33uBPCGSYNoFxOK9YVnsaWmCkfOLaTF5UV1XvHA+l0TKg2a1D3cXVpV
 5+IVrKPQ0bPg/hvw1YEzqc19yxOBtuAq4JIU1u30ZB11auVZD6yHl/6p9U9zZHNxS/K+o4h18NY
 SmKX1BevRb+FYZWQDN7/amA+ML2cO3zDApzFNABZvhejAJMvF8qGV0q647QsfK+xzvYIrBhGrhg
 e7kMflI9wdrPkJ1mR5/XuAB48UXSilIxVW1Gmhbd2XMZo5GlyBnAOE0suFflJK7TXQ/ZHVEjKVf
 G3s04jFC7s+Z2EXPavS4vb5h4KFdD6WAR7mZss9MfdK52RePivImZhQ9dz/gG4/n6kVJdrBjowJ
 0w4yV5JZC5ZGc1Gm7HqTFv5QSMOio70JGb1DR+7SjkB5G2FbXJrqC4dum4PHz5oAr/xpppMhBbH
 8vU5E/CcBSlUumpc+VMUO5MojM9U0pL0usuxgXv8x3Ea9xNALKw1hoS4O08ZODQePLTxmk1tNkT
 tHcQn1S8Zoyc41Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: kMGZJyi4g5VN8DDu7rrZlrg3WUAqxkxW
X-Authority-Analysis: v=2.4 cv=feqgCkQF c=1 sm=1 tr=0 ts=692731e3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9MRJ1adic_HRPEocbcUA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: kMGZJyi4g5VN8DDu7rrZlrg3WUAqxkxW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEzOCBTYWx0ZWRfX6Lp3lNZ740iK
 4KjPYEZkfbiEvDv3sYhD1fb99s0OSvhbnV/3X1vtT36P9A7Fxm4uize3BEBVKdH/hRUHjmaJBqt
 6FHufLvpgaYBwjLlrbDrjjv0ZO2H+5mLOvIkR0uOKUwnvUyclIdgnnNmVhhplJY6BR1c1fUCq5r
 C2ZMdL237EHe728DED7dessEdYRQFSQdoT7c93sVGqeY+ScX+G+4j9n5wWHNqf58Udf660BXlJ7
 rjJ6/fr5H6S91vCz9+ZwR0WYxjcn9tviNMrzF7mm3q4w1P1cciHLYFbK158QBw5YWn6Qz/ux6QI
 Whi+yccgMQzEJM/k2Uh9RhrzoOXoQHXzhe+iZNwU/FW5pwoOAMOeabujP2DZ1cXromQDMJrXIpR
 +SOuFayyliBltAw0YpzzXLTFphlgUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_160355_201003_8EE00DEA 
X-CRM114-Status: GOOD (  17.33  )
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


