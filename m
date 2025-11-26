Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E06D1118B
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Nov 2025 17:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/nE9mFzLK64dd3Op/zaOJqEf8z2tEMBy+TpKMFxK7Q=; b=kEDx3mEcmyV48q67ZMffSZnT99
	nuZWIbcARNNFHW6eY3cg4+RRgler5U1E5aL0nz8LfFObSQIWXq/GIQMqaaj5fyVLAKkIhT2mO1fm9
	ldqHMO6Oqeqfiv1b5WNjcxMy3+LpLhmHttd1a7ouUaIK9CfQhVHZcKFCBd6twX+H1kMcQKABmil2w
	NHquoHWU6BLDcVezX8124TfBYF4FlvYGB+lC4ezuRgXM4Tnhbgvw0wOf5W4b3YB0wIJ6GlHr1EYB9
	5B0dz439MioolTw/01oezgybWRW6c8Oews6lAtatUgBI6TUpXn6xAm4X0wmNkGMJHTH+ZeN+cEWS6
	ufSYOy2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJVP-0000000FQv1-2HBi;
	Wed, 26 Nov 2025 17:40:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJVM-0000000FQs9-0z2s
	for linux-mediatek@bombadil.infradead.org;
	Wed, 26 Nov 2025 17:40:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9/nE9mFzLK64dd3Op/zaOJqEf8z2tEMBy+TpKMFxK7Q=; b=Qtl4GdnyOR/2Xh0VipkXUvEm8E
	47+UuHuJJsH2Eg/dG2eZ4Jee31skVxvAK0ONFqDx2lT7jMOtisAlIp/nJFGeo9GpiGfeA4L1WwvS0
	WdMB/bF4oWXKLxvkWrEWaqAGQHaFKHZ0LH3Aun2vBu/95FPtr3VvQpvmoH0lmkKXbLKzrpTILlLfK
	l1J4Zbi31ZXp0X5KIXmF7yVrL6YRQd7kgvMOJ4AR5HH9ABeyhVQHUffmOX5oNrKZN1/N4xoGDig+K
	INWyW+zI3JL2z8twOq86Y23Rbp+2THuW79BHMZhsXmzex2+ll+gYIyF/A3YJdcWOUYHy5XjgEjtOL
	gqTyZSjw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIdi-00000008WoX-3ILA
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Nov 2025 16:45:12 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQHYwWb3666525
	for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 17:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9/nE9mFzLK64dd3Op/zaOJqEf8z2tEMBy+TpKMFxK7Q=; b=hhzZvyxLmJY8GRFc
	WnVCW0cAYn7x62Rw2dgZd/Sra0R/cKZZQ7LobHH08olKbex/rZvgyuSjcahjMBcH
	bYv21fMI3yYeJ0F6DAK5eEJbann5O64mrgep4Huus3mZaj+qSCf2GvSoomsn31Qo
	LU9vl/VXqnALdcgqDjRrVrxtNX7Y3KyGUEZoqlXlX4ZDauA2QIcY3JE8gf1LuyDU
	ejVgQRjf2VNMhGi08uBriquiyCXBG9/th7ab9sTtCV8bETFBQiTNReIsiZbxv1T2
	FVErpwsNqPRT/j+A64Rp0WvYTEdevNjSWeqavqy6Y6y5rstBZBEnGR91th3L0HJE
	ywPglw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anmemu0v8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 17:40:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2dbf4d6a4so724542685a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 09:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764178831; x=1764783631; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/nE9mFzLK64dd3Op/zaOJqEf8z2tEMBy+TpKMFxK7Q=;
        b=bAOzqEGHDlvU5Psw76+mzVN9/Gyv5JgBE0CDOXdPvUi2Uj40g9ePui7VV1S2VqLLV1
         WD9TGOClvo1dn0gIPGtMxN3DiqJi6kwZDcXRYkF7enqjkvEqEP84bEhD+rKfrl6QQFVR
         2JEHmv+U2AwB9Nva/gXh/iN9U7eEumAk/4kQ1MT0rwd3rZqRqzu9sGArcMccyJSbUgEj
         iI9Nidt7kZMcOjf8bIquIJjlrazvhZTWk2DyA3juHt+vsHdOnw+dgFDs7MEQ1tzn8taX
         yD+JOu3ExJ/8QXej87Jc1s558N10SC93ShTRZNz8L5T2dP80q6R5bU9vSDv3kBGOrs/0
         JIuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764178831; x=1764783631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9/nE9mFzLK64dd3Op/zaOJqEf8z2tEMBy+TpKMFxK7Q=;
        b=UlaJ92ZP306xamT77iYdWPC4Id+710DA6DdVwP2OCWLyVtCy/cQQVNFE8Lzwbz/h8o
         /O7Uq0Kj2gAIeiEjNSUVcJITEHZxG/1XmAdvT0dxfb6rpVCAiWXoj7xmTnK3ogkopmgQ
         Kv7lRMR0chEl7qXeEWmCEPH++HsdT/g3lURUEC7UrTmXtRI1nj+T4sgz9RSXQDJ5GtDW
         7VPGRYmNTF3Bwh63PhFWFgyn3NcPw00+Sra9zyGx0y3bOew7Ga6kq37GhJabdKEIfOCx
         Oqp/OOFsS1hYsCcYnp4wNi319Rcck/Zvx7rODRqysN3hN5Nt7SzZ0uZ+jh2mU6uDMqUm
         nIWg==
X-Forwarded-Encrypted: i=1; AJvYcCUVLjSzrzopKLxh1ZAU0YtNRY+v8nkJk+QDM9eWp0DksxTN1WK7HU87HxwJiH1PE+/5Pj+F/EGsfa0lNj0Z2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzH9VSrxVMGQRcutfY6f1HM51jbWxckr6VnNccndb2JCwnNMCMk
	asSH+vytFkcuE86RX1Vr+7TjLMFaKlGvbAQqRLZJnfLlohW8H5oX+2w6E3D9x+SZXHRNBvbfcye
	+tGpTPBu+o4g4H+qjVy7MDbBblZkQVWeMAJGy8/f3r1afU8RgjZF/YxYuoWUGnPOYFrI4Hgv1j4
	0=
X-Gm-Gg: ASbGnctfya5pJCrCji3972oXiuWpa3K/MyuTgsmBF/D4bRygd5eLpVx0I08Fk5OLPZS
	7taJSb5dlNcj+N0BvFQI+mqNk7AKN5FHQfy2ZYqEwp/mr+Q0EPLO0btIjTef6wvutk29N7SrkGn
	OUkrDMthL4h32rsAxbCDRONPvLclfc/ii7Do342qI3edweF6aFFkmEylYVufeVHJPBc2tl4rUAq
	eiBkMzGJN+BPLr0ykDMXLlHokHonFDKn1oVrYYmUDyxlm2lE0xTsGlphDSW/YJYi2lD3Ge+/Wzu
	szXwdRJQGWDyS5tfZa9Sj+ByYy9oGoQIbpkgr9if/rpruXoU+mvJq7z3IxASsQXMxx1jS/2K+L+
	edm7lA0mj/4S1MhgFO+b9+vaXpQmSv6+dXA==
X-Received: by 2002:a05:620a:1909:b0:8b2:6121:5af7 with SMTP id af79cd13be357-8b4ebd54602mr1013173785a.3.1764178830614;
        Wed, 26 Nov 2025 09:40:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFt1Mz9fBy3af1695aDhvFped40qCkoUYHIDo3l5Pjiw2ThshIXfjfsGRpZLC9wUBlHEqde+Q==
X-Received: by 2002:a05:620a:1909:b0:8b2:6121:5af7 with SMTP id af79cd13be357-8b4ebd54602mr1013168785a.3.1764178830218;
        Wed, 26 Nov 2025 09:40:30 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8e54sm43226430f8f.40.2025.11.26.09.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 09:40:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 18:40:11 +0100
Subject: [PATCH v2 7/8] regulator: pca9450: Constify pointers to
 'regulator_desc' wrap struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v2-7-7ad3408d6f29@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2287;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QHCV631sE287htt5ntixmRlFJMMXMDvt0ofW7ZLTi8E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzt/rKHLlSw2aj9ekDpuHoQUuxhSPS1ONpNfU
 t1fSa6vSdqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSc7fwAKCRDBN2bmhouD
 12IAD/4jnjL9wTJJWRkQ/+Sr+duE/So+Tn0cVx0bSN89gdxic7LNgiflqKQYzOf79poYlRrPqqI
 sgQjOR+KEmimL81vv1T7ie8fY7tpXDmIPf8Psexu9Anev2OX9zcoyfowZ4Wy98vfj6QT/HYiywF
 2XgOeQ0DRUhffxOrnPCnbPiD70YOyXUZ6HYCrghW/+FPBt6SglwtX1aD7+gF2LnUf/6MqHqF1uE
 RhqmL6j9Iv+amRsqf11MWIuvbSOrUk/ZY5KDJRHNbP8T6WtWn9FztikJ1zpzASfTClza4VznOFH
 tmC2gP3R8zs2uYQAQGMB86PsEfB0JBlwUWzakp4nombs9OnEt4MScvsNXwBcnPvxJva0ODT9lwU
 /FYk6ew7198c04MicdYfU62HeD68RCZJP/ms4nLD0Rlg+nWAGvqGvrFZc46gjcQ3PqB2nCVUrIi
 uZQpiNtIcOdXpQ+tzbxmU3xH4OSYVKI/g3MDdeATNbuMQyVsGW8ty9cRfAb2aOdiBObgeKn+GYP
 rO9WTd0ueT5yFbp+mTiDbDtdS/LCrFpqo9ePZyeIut8onXd0cieAiy7bUJhqRtvcrrxQ3m/hlIV
 Igq54LQlMwWspYBbIeLTiLxMqTZy+I9Zvx4UFw74SOoOCssjQfqQcXd/HH9Uz9gDWL3/dX/+tEJ
 pXlZ9adGnE7i0kA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: yTGKbMgqpymjgRzEpIng2XfIwJIe1-I3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0NCBTYWx0ZWRfXx7AzBfk+fu2p
 4PH0SBY3tW+u/CzezdBEQDurVayyjW/NzYKM8VUls/vD36ZuT1wBKjw1fbIpyap+BT1J4dfxYbO
 xG7U1XYua3JFkGgGmZp5M/ZtNZ9KNSVMhtwrKraPop8G7oIP7pGZCxnz9l95pUmZAupEcw8U6e2
 Y6bsaqvLdaNUk/ZQvtxAwNpLq4jhHYmzRxdnUUUnvcF/NKVYTs5WYXh1LK1/EyZBz4XiLz+8OHd
 ZtLHFluKPqE+hSAJYKdYQGToKNeUBv3JNJqY0MJd+JCS+u6gp7F39ZwbLKEoEpeqNlTTYgzZGjg
 TVtcpolC4bLJHLVkfh8URrnxcZnn6Erikt/v8DQVlgA40zA30/wtLXY22wZqN9Eqj4Bt3x106Rm
 Jx49GaDm1Kcq6KmDNdHJ5rwTOIRYig==
X-Proofpoint-GUID: yTGKbMgqpymjgRzEpIng2XfIwJIe1-I3
X-Authority-Analysis: v=2.4 cv=bZBmkePB c=1 sm=1 tr=0 ts=69273b8f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=wapfrd0RAOuIrv5d2i8A:9
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
X-CRM114-CacheID: sfid-20251126_164511_179184_33E16DB3 
X-CRM114-Status: GOOD (  16.24  )
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
 drivers/regulator/pca9450-regulator.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/pca9450-regulator.c b/drivers/regulator/pca9450-regulator.c
index 32780c311ccd..5fa868264250 100644
--- a/drivers/regulator/pca9450-regulator.c
+++ b/drivers/regulator/pca9450-regulator.c
@@ -249,7 +249,7 @@ static int buck_set_dvs(const struct regulator_desc *desc,
 	}
 
 	if (ret == 0) {
-		struct pca9450_regulator_desc *regulator = container_of(desc,
+		const struct pca9450_regulator_desc *regulator = container_of_const(desc,
 					struct pca9450_regulator_desc, desc);
 
 		/* Enable DVS control through PMIC_STBY_REQ for this BUCK */
@@ -263,7 +263,7 @@ static int pca9450_set_dvs_levels(struct device_node *np,
 			    const struct regulator_desc *desc,
 			    struct regulator_config *cfg)
 {
-	struct pca9450_regulator_desc *data = container_of(desc,
+	const struct pca9450_regulator_desc *data = container_of_const(desc,
 					struct pca9450_regulator_desc, desc);
 	const struct pc9450_dvs_config *dvs = &data->dvs;
 	unsigned int reg, mask;
@@ -308,7 +308,7 @@ static inline unsigned int pca9450_map_mode(unsigned int mode)
 
 static int pca9450_buck_set_mode(struct regulator_dev *rdev, unsigned int mode)
 {
-	struct pca9450_regulator_desc *desc = container_of(rdev->desc,
+	const struct pca9450_regulator_desc *desc = container_of_const(rdev->desc,
 					struct pca9450_regulator_desc, desc);
 	const struct pc9450_dvs_config *dvs = &desc->dvs;
 	int val;
@@ -333,7 +333,7 @@ static int pca9450_buck_set_mode(struct regulator_dev *rdev, unsigned int mode)
 
 static unsigned int pca9450_buck_get_mode(struct regulator_dev *rdev)
 {
-	struct pca9450_regulator_desc *desc = container_of(rdev->desc,
+	const struct pca9450_regulator_desc *desc = container_of_const(rdev->desc,
 					struct pca9450_regulator_desc, desc);
 	const struct pc9450_dvs_config *dvs = &desc->dvs;
 	int ret = 0, regval;

-- 
2.48.1


