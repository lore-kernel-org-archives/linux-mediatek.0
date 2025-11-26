Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883C5D1118D
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Nov 2025 16:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/nE9mFzLK64dd3Op/zaOJqEf8z2tEMBy+TpKMFxK7Q=; b=eE35o1j3G8nkIc7UvODGHNFbUw
	1FEtJdms/Rk7rj5bhgC16yz9/0aze4IPCP6+W1q7BZVLJWU9E6r5Ju+LgBc3WmDpSZbUOz8IW08+n
	0KdS2PgrxRppOTUUNX309kxCIv5YiMbalNWRs/C8Z6b5m28nlT0aP47/2Gz64KcMRc2Ar2FXtPIPp
	WVTQ9EJDKnEpXs1ISxDGlxbxl4HjEg54A93cj6Lvv9yB9iA7gtKBq5yyxsS8+CJjNHYcrstNbLsi9
	CnD2+hP/Njd6rys6VcNIOyCzt+L2UgdIEfFTiF2vUGubtwZNQikiFNyFjmD+8xH2nHqFkiODOTZhy
	3ZauUh9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIrZ-0000000FLRv-1WQE;
	Wed, 26 Nov 2025 16:59:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIrT-0000000FLJn-0Lk9
	for linux-mediatek@bombadil.infradead.org;
	Wed, 26 Nov 2025 16:59:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9/nE9mFzLK64dd3Op/zaOJqEf8z2tEMBy+TpKMFxK7Q=; b=ShES9ML+gaXCogAtPZi2B+Hxem
	/lIcNqUCzvGlMHmKhugGcPv3k9HfLdYU+F/0zWjIteu0IoEK0KMlWsE6ouS0ygt/de2HJn+z4aUVI
	jyioS/ocwie+LUO3dPQ/i8RN4yqXdLoaXDROzguJ8GGwgwkN33eKTKFli5N92euescVgM5UblBUGP
	XSs01OKKcrTMOtfI1BEoKHPwvj0eSnhzqWC3js/2Eu/6UvUuzHejmhrD3v1vCloTLoEv6QHz5SQ4C
	cppsgw3AoYVLSR+Tk8oCKW+c2ebrO/CKwggIFj/s7w3u5f4+B+LjDto7oJxCP8IbPfNJ0z/AjRzTv
	q+4Dao0A==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHzp-00000008S7N-224K
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Nov 2025 16:03:59 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ9F8w14049007
	for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 16:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9/nE9mFzLK64dd3Op/zaOJqEf8z2tEMBy+TpKMFxK7Q=; b=pRN33DjVGMibJ0oK
	NNVNiQe3jkGzejkIfU6j5WvHrPDh+/50yARQ4OARD/jcWoz9jAZ/gHtIwLxF2ErF
	HVvNMOl9koEhkPVkBaALd0E839/q5DzuryIoNyCBGYq3sWn1873/XtmyjIsgHDSe
	N7Dn5UBDdimHAXv+r9Uch27QK10XYxOK0n86v+42PsA2B8m0ttYbZvRszY5xXxog
	s2Mcs3SucVZkzloGaax2k1sNnfg8rVcs6KA2wvrOSsy40sTUqvdhM36xTS1S1ZB4
	1/HqsuOCWcx98XXUdg223RZ0XbKxZnLF+UjfVWGCBGZTvBKvjqvPWbd7jH3DFjs/
	JNpjsg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anp2njqd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 16:59:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee168a520bso822481cf.2
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Nov 2025 08:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764176357; x=1764781157; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/nE9mFzLK64dd3Op/zaOJqEf8z2tEMBy+TpKMFxK7Q=;
        b=iTwYliwSnV4nVh1ZcrkJSMLt8BhGDlJ5i4OYrO17zdZ/oy/PQiB05AuU+0/WLgRpJg
         8ahmTU1cQ+sbRln5EdZGww0DwXgh6xOjU4a+0HDMcTOXemW8tPvd4dpWIqCD3okSqOq6
         OjCXQDCkTp+shDc6YEeC9lBa7nGiE9AveJAjiPOe6Vk61haGVDtzvJJr7DWhsfnVtQl1
         9aBc1GZE/mTuG7r7grhakZQCN7NPsF4OQOa6QataxpQ/M1XMuiNgQ9TCXr4T6w91qbck
         ndz1KHf9aiXHuAwr+utd9II9DAk1E0VZBfT82TElQ5qszjobPZ9nmvzIJ9a2dFgcivF7
         Ow1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764176357; x=1764781157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9/nE9mFzLK64dd3Op/zaOJqEf8z2tEMBy+TpKMFxK7Q=;
        b=UfWeIOlFyc+PgGkwmLiiecYsa2Kh2usAXnWngn6UIhORMa5N1zR7iOZsXOd+YSXMwX
         AbhXKZonC+WkbH/RtJ8eJsSsIS2tv++BA5gEbglq9HO6BYId6Wn9OIXRkEilRnxwmkX6
         piDJ69ZEF3Fqlnd0fIrTwOiUeC79D9O67mkIjPnhWjLwhtKkR7zFb1q7VgJiykS/2K87
         QpwE0EMr6aLCfaBybUXfjPJYyKtKz/DSoZTKiTXoqGleCyKeRXThRu0bYrXrqY8BA6A1
         4E1/ORDxsWgDN0O0UOLBgkin3uVI/rNPjrZbY/kgwJDETfKQN6RqtYZoNXwqoW+oF4w0
         FT3w==
X-Forwarded-Encrypted: i=1; AJvYcCWsKkXasNCoYTbxdXWpWoJUBfB7RmgVtmZ+GEq43rlCp9kSw4ohJt1XQpqURwB1k275ZqOGKFL5yhr5QZRbIA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yya9k7NpvdVzZse7qy3ZJKBfszPI8T4mND9dLfszP2DIU8Hx2Ze
	G6oguCGU6F7RL62t+Sd9Mfyphqzt0El2A38lsIgM0IT4+YDtOnjpkXDvbLVSFUcmrO/YzcLL/Bd
	KoLZ7ejsQjZOK7uOr1noboHEwYw06eZ3/HQJWxfLLQHnqnvoUaYCv3hsUBthqmyc4cOibNx1YvD
	c=
X-Gm-Gg: ASbGnct3UvHaUSWKlqV5v9UffEAbsEufLe750ELAoTJphMMrU/Pw3SvDixWwVRzsTwh
	qLNLtFEAvpq6hi4B35ZkfJDi847Bf6d0y3H7WSLEvlx4atpdQm4271N3kIKEeq1i30S2mJWxZ4z
	0tebtLGqKp/swWTKfU7+BxWCiFJYW4PlN4HpFSKhutVHeO/iIvjyeKt3ZrHyyYs5D75iRkr55Ks
	wAVhbfYh1fttX0zEnFmH02Pko/5dWv6F+E7nvd3vjY7miCEDQa0hxynwIFu6AET2iX4FhY71pps
	UW48r2Ujcjn4FVfZsNoWxIcMCIDv6UPXp135gEXQ10p1VEEkQrm/Qu7lI/qf4O99bWQGu2K7O9+
	VyjzReomEQ12QT7eSjX+X5ODkMHdpWpHZog==
X-Received: by 2002:a05:622a:118c:b0:4e8:a8fd:e00 with SMTP id d75a77b69052e-4ee58adff7fmr235322511cf.43.1764176357319;
        Wed, 26 Nov 2025 08:59:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEf5BR5sc1uyqeochjtqGYLG5XCky6dGNK82Mg1F3Fr/vu1xdHr/JvNRnSKTAPNwurtDJu2hQ==
X-Received: by 2002:a05:622a:118c:b0:4e8:a8fd:e00 with SMTP id d75a77b69052e-4ee58adff7fmr235322061cf.43.1764176356792;
        Wed, 26 Nov 2025 08:59:16 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3a81sm42398811f8f.26.2025.11.26.08.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:59:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 17:58:50 +0100
Subject: [PATCH 7/8] regulator: pca9450: Constify pointers to
 'regulator_desc' wrap struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v1-7-eeec378144d4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2287;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QHCV631sE287htt5ntixmRlFJMMXMDvt0ofW7ZLTi8E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzHXm4DjOiibZMtVzMV8QxB+V6eAo/uZvNGVY
 RbRJZxsbmqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaScx1wAKCRDBN2bmhouD
 1y0iD/sENBu5+81NVSOLl+hncVKxyBQkJnx/yfWVjuDk7tH9b8bB+QeSX9V14AWPM9GEXqQoufX
 mGXQFaczqBK+ad7yDVb1SIfkbbbG5Z4TEecPDGRfX8npX3PPJo7BPeFtm5RO3+cJgDPqkGDl10+
 nIMXIhqwBvR1uuOFHAH257wWbI9hEG+8p/MkHaLVxvGrsSZBvgxL29NHVR1gDObaEUx80O+YsYC
 96QheHaZD8oy0cFJe0UdklHBVXZoxL6f4xYCkmxwCIAUkvPRFv+HtBDEkJtCN6Cpc1dnM33Lpe3
 u0df7/MYRHHcGAgCTHEk0KhY0dBbxFnRWMw+s0TrJi1bNjia9bSB/AeAQEcnW7nfE/h9JJoIykt
 4UhoEfvLTSkN0XxG7zjbaszX7Iaoqhm762ulj+O0lDtk67qlZAOCWWQev0okoh/4CrampvSVon2
 MwPNZgXS/Oz7/baWEUAxf1fQRfDNPGyUpKbYLVdJ7m5asudNaBc9nb/Xg1VjgE/94Q6mANZtEHN
 HoDHVFSzaSWRcJYGODJKtYvi9c09go1x0m4TQfDNkR5ToycI2hwDdXhwQjnk4TST/E6K8HBrFAE
 LNXJl8vRsx097kljK75rNRDyo3CFX9Elmwv5INgrFvvL05Qwg/QoAKu7sXqMeEgfg22oXZM+rmE
 fusPHitLthfBQZg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=KerfcAYD c=1 sm=1 tr=0 ts=692731e6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=wapfrd0RAOuIrv5d2i8A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: mEnvnLASI_O63xPAMx2YlJdN4ofnE4vm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEzOCBTYWx0ZWRfX2jxN67/Ig7Gj
 zs1fVW/lNWJwVG/lqm5t1Sy1ITX2NMY6ID/W3H0MCw56M7i5OKYZ/bu0qF8jrZoHPUNQic6d8uv
 LcISLexqSOi0ik6KgVf3E/jwN6aiV4NjzqjW2U3mZWTTGo70YciaY9yX1IOB2TLC6fcapi8K1ZJ
 a2Hos0abquH2ZeIBmFZg7Nox+P8xTvVztyZbjJBm/om4O46+ikgdkAA5AZj8GnytsjnZZby9Cv/
 7Jyq1CEOiLiDVOeU++oOz2/ARrdsn8NsErg+k0PX49VQX91kqRyIrUwLrUAguHoIAfQLO7AuwC7
 F6e6b0XNvQ4rPkRSwHcan7C48YWp3N5GeRdvWNNbTvImILfIi/jtjCDZ3Biu1iwgoJowJuTC26D
 ct2FUsHn4O6IC1LLzQQwQKTU+Qz3MA==
X-Proofpoint-ORIG-GUID: mEnvnLASI_O63xPAMx2YlJdN4ofnE4vm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_160357_908711_0AFFB06A 
X-CRM114-Status: GOOD (  16.12  )
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


